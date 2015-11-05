unit LogIn;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, Tools,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, JvComponentBase, JvFormPlacement,
  Vcl.ComCtrls;

type
  TfLogIn = class(TSmForm)
    FormStorage: TJvFormStorage;
    pgc1: TPageControl;
    tsLogIn: TTabSheet;
    tsSetup: TTabSheet;
    lbl1: TLabel;
    lbl2: TLabel;
    btn1: TBitBtn;
    btn2: TBitBtn;
    edtName: TEdit;
    edtPass: TEdit;
    lbl3: TLabel;
    edtServerName: TEdit;
    lblStateCaption: TLabel;
    lblState: TLabel;
    btnConnect: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnConnectClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure pgc1Change(Sender: TObject);
  private
    ServerOnline: Boolean;
    procedure UpdateServerState;
    procedure TryConnect;
  public
    { Public declarations }
  end;

var
  fLogIn: TfLogIn;

implementation

{$R *.dfm}

uses Main, DataModule, GlobsAndConst;

procedure TfLogIn.btn2Click(Sender: TObject);
var
  res: Variant;
begin
  if not ServerOnline then
  begin
    Application.MessageBox('Сервер не доступен!' + #13#10 + 'Настройте подключение к серверу.',
      'SMR - HPP 2012', MB_OK + MB_ICONSTOP + MB_TOPMOST);

    pgc1.ActivePageIndex := 1;
    Exit;
  end;

  G_CONNECTSTR := dm.Connect.Params.Text; // Передаем назад строку подключения

  res := FastSelectSQLOne('SELECT USER_ID FROM USER WHERE UPPER(USER_NAME)=UPPER(:0) AND USER_PASS=:1',
    VarArrayOf([Trim(edtName.Text), Trim(edtPass.Text)]));
  if VarIsNull(res) then
  begin
    Application.MessageBox('Неверное имя пользователя или пароль!'#13 + 'Повторите попытку.',
      'Авторизация пользователя', MB_OK + MB_ICONINFORMATION + MB_TOPMOST);
  end
  else
  begin
    try
      FastExecSQL('UPDATE USER SET USER_LAST_LOGIN_TIME=:0 WHERE USER_ID=:1', VarArrayOf([Now, res]));
    except
      Application.MessageBox('Ошибка обновления даты последнего входа!', 'Авторизация пользователя',
        MB_OK + MB_ICONSTOP + MB_TOPMOST);
    end;
    G_USER_ID := res;
    ModalResult := mrOk;
  end;
end;

procedure TfLogIn.btnConnectClick(Sender: TObject);
begin
  /// попробовать подключиться к серверу
  if dm.Connect.Connected then
    dm.Connect.Connected := False;
  TryConnect;
  UpdateServerState;
end;

procedure TfLogIn.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfLogIn.FormDestroy(Sender: TObject);
begin
  fLogIn := nil;
end;

procedure TfLogIn.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if ([ssCtrl, ssShift] = Shift) and (Key = VK_RETURN) then
  begin
    if not ServerOnline then
    begin
      Application.MessageBox('Сервер не доступен!' + #13#10 + 'Настройте подключение к серверу.',
        'SMR - HPP 2012', MB_OK + MB_ICONSTOP + MB_TOPMOST);

      pgc1.ActivePageIndex := 1;
      Exit;
    end;
    G_USER_ID := 1;
    G_CONNECTSTR := dm.Connect.Params.Text; // Передаем назад строку подключения
    ModalResult := mrOk;
  end;
end;

procedure TfLogIn.FormShow(Sender: TObject);
begin
  // Проверяем подключение
  ServerOnline := dm.Connect.Connected;
  if not ServerOnline then
    TryConnect;
end;

procedure TfLogIn.pgc1Change(Sender: TObject);
begin
  ServerOnline := dm.Connect.Connected;
  UpdateServerState;
end;

procedure TfLogIn.TryConnect;
begin
  try
    dm.Connect.Params.Text := 'DriverID=MySQL' + sLineBreak + 'User_name=root' + sLineBreak + 'Password=serg'
      + sLineBreak + 'SERVER=' + Trim(edtServerName.Text) + sLineBreak + 'DATABASE=smeta' + sLineBreak +
      'CharacterSet=cp1251' + sLineBreak + 'TinyIntFormat=Integer';
    dm.Connect.Connected := True;
    ServerOnline := True;
  except
    ServerOnline := False;
    pgc1.ActivePageIndex := 1;
  end;
end;

procedure TfLogIn.UpdateServerState;
begin
  if ServerOnline then
  begin
    lblState.Font.Color := clLime;
    lblState.Caption := 'успешное подключение'
  end
  else
  begin
    lblState.Font.Color := clRed;
    lblState.Caption := 'не доступен'
  end;
end;

end.
