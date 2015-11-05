unit ConnectDatabase;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Tools;

type
  TFormConnectDatabase = class(TSmForm)
    ButtonCancel: TButton;
    ButtonConnect: TButton;
    Bevel2: TBevel;
    LabelUsername: TLabel;
    LabelPassword: TLabel;
    EditUsername: TEdit;
    EditPassword: TEdit;
    Image1: TImage;
    Bevel1: TBevel;
    procedure ButtonCancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ButtonConnectClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses Main, DataModule;

{$R *.dfm}
// ---------------------------------------------------------------------------------------------------------------------

procedure TFormConnectDatabase.ButtonCancelClick(Sender: TObject);
begin
  Close;
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFormConnectDatabase.ButtonConnectClick(Sender: TObject);
begin
  try
  {
    DM.ADOConnection.Connected := False;

    DM.ADOConnection.ConnectionString := 'Provider=MSDASQL.1;Password=' + EditPassword.Text +
      ';Persist Security Info=True;User ID=' + EditUsername.Text +
      ';Extended Properties="Driver=MySQL ODBC 5.1 Driver;SERVER=localhost;UID=' + EditUsername.Text + ';PWD=' +
      EditPassword.Text + ';DATABASE=smeta;PORT=3306;COLUMN_SIZE_S32=1"';

    // DM.ADOConnection.ConnectionString := 'Provider=MSDASQL.1;Password=' + EditPassword.Text +
    // ';Persist Security Info=True;User ID=' + EditUsername.Text +
    // ';Extended Properties="DSN=Smeta;SERVER=localhost;UID=' + EditUsername.Text + ';PWD=' + EditPassword.Text +
    // ';DATABASE=smeta;PORT=3306"';

    DM.ADOConnection.Connected := True;     }
  except
    on E: Exception do
      MessageBox(0, PChar('Соединение с сервером не установлено.' + #13#10 + #13#10 + 'Ошибка:' + #13#10 + E.Message),
        'Подключение к MySQL Server', MB_ICONWARNING + mb_OK + mb_TaskModal);
  end;
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFormConnectDatabase.FormCreate(Sender: TObject);
begin
  inherited;
  //
end;

procedure TFormConnectDatabase.FormShow(Sender: TObject);
begin
  Left := FormMain.Left + (FormMain.Width - Width) div 2;
  Top := FormMain.Top + (FormMain.Height - Height) div 2;
end;

// ---------------------------------------------------------------------------------------------------------------------

end.
