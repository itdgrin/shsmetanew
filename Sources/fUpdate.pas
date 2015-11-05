unit fUpdate;

interface

uses
  Winapi.Windows, Winapi.Messages, System.Variants, System.Classes, Vcl.Graphics,
  System.IOUtils, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls, UpdateModule, Vcl.ComCtrls, System.SysUtils,
  IniFiles, Tools, GlobsAndConst, ArhivModule;

type
  TUpdateForm = class(TSmForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Image1: TImage;
    btnUpdate: TButton;
    btnCancel: TButton;
    btnOk: TButton;
    Panel4: TPanel;
    Label2: TLabel;
    Panel3: TPanel;
    ProgressBar1: TProgressBar;
    memProcess: TMemo;
    Label3: TLabel;
    Label4: TLabel;
    btnIterrupt: TButton;
    TimerProgress: TTimer;
    procedure btnUpdateClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnIterruptClick(Sender: TObject);
    procedure TimerProgressTimer(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    FCurVersion: TVersion; //Текущая версия приложения
    FSResponse: TServiceResponse;
    FUpdateType: Byte;

    FStopUpdateProc: Boolean;

    FArhiv: TBaseAppArhiv;
    FUpdateThread: TUpdateThread;

    procedure ShowUpdateStatys;
    procedure StartUpdate;
    procedure ShowStatys(const AStatysStr: string; AType: byte = 0);
    procedure SetButtonStyle(AStyle: Integer);
    function CheckNeedCreateArhiv: THandle;
    procedure WMUpdateState(var Mes: TMessage); message WM_UPDATESTATE;
    procedure WMUpdateProgress(var Mes: TMessage); message WM_UPDATEPROGRESS;
    procedure OnThreadTerminate(Sender: TObject);
    procedure UpdateState(AStrVal: string; AType: Byte);
  public
    //Устанавливает версии но не изменяет внешний вид
    procedure SetVersion(const AVersion: TVersion;
      const AServiceResponse: TServiceResponse);
    procedure SetArhiv(const AArhiv: TBaseAppArhiv);
    property UpdateType: Byte read FUpdateType write FUpdateType;
  end;

implementation
uses DataModule;

{$R *.dfm}

procedure TUpdateForm.ShowStatys(const AStatysStr: string; AType: byte = 0);
begin
  if AType = 0 then
    memProcess.Lines.Add(AStatysStr)
  else
    if memProcess.Lines.Count > 0 then
      memProcess.Lines[memProcess.Lines.Count - 1] := AStatysStr;
end;

procedure TUpdateForm.StartUpdate;
begin
  if Assigned(FUpdateThread) then
    raise Exception.Create('Процесс обновления уже запущен.');;

  //Подготовка глобальных флагов
  G_STARTUPDATER := 0;
  G_UPDPATH := '';
  G_NEWAPPVERS := FCurVersion.App;
  G_STARTAPP := False;

  FStopUpdateProc := False;

  memProcess.Clear;
  //Запуск процесса обновления
  FUpdateThread := TUpdateThread.Create(Handle, FCurVersion, FSResponse,
    Application.ExeName, FUpdateType);
  FUpdateThread.OnCreateArhivEvent := CheckNeedCreateArhiv;
  FUpdateThread.OnTerminate := OnThreadTerminate;
  FUpdateThread.Start;
  //Установка стиля кнопочек
  SetButtonStyle(2);
end;

procedure TUpdateForm.TimerProgressTimer(Sender: TObject);
var i, j: Integer;
    s: string;
begin
  i := memProcess.Lines.Count - 1;
  if (i > -1) and
     (Length(memProcess.Lines[i]) > 0) then
  begin
    j := Length(memProcess.Lines[i]);
    s := Copy(memProcess.Lines[i], 1, j - TimerProgress.Tag);
    TimerProgress.Tag := TimerProgress.Tag + 1;
    if TimerProgress.Tag > 3 then
      TimerProgress.Tag := 0;
    for j := 1 to TimerProgress.Tag do
      s := s + '.';
    memProcess.Lines[i] := s;
    memProcess.Refresh;
  end;
end;

procedure TUpdateForm.SetVersion(const AVersion: TVersion;
  const AServiceResponse: TServiceResponse);
begin
  FSResponse.Assign(AServiceResponse);
  FCurVersion.Assign(AVersion);
end;

procedure TUpdateForm.SetArhiv(const AArhiv: TBaseAppArhiv);
begin
  FArhiv := AArhiv;
end;

procedure TUpdateForm.SetButtonStyle(AStyle: Integer);
begin
  btnUpdate.Width := 100;
  btnCancel.Width := 75;
  btnOk.Width := 75;
  btnIterrupt.Width := 100;
  //Вид нижних кнопочек
  case AStyle of
    1:  //Обновления есть
    begin
      btnUpdate.Visible := True;
      btnCancel.Visible := True;
      btnOk.Visible := False;
      btnIterrupt.Visible := False;
      btnCancel.Left := Panel1.Width - btnCancel.Width - 8;
      btnUpdate.Left := btnCancel.Left - btnUpdate.Width - 8;
    end;
    2:  //Прерывание обновления
    begin
      btnUpdate.Visible := False;
      btnCancel.Visible := False;
      btnOk.Visible := False;
      btnIterrupt.Visible := True;
      btnIterrupt.Left := Panel1.Width - btnIterrupt.Width - 8;
    end;
    3:  //Ошибка обновления
    begin
      btnUpdate.Visible := False;
      btnOk.Visible := False;
      btnIterrupt.Visible := False;
      btnCancel.Visible := True;
      btnCancel.Left := Panel1.Width - btnCancel.Width - 8;
    end;
    else //Обновлений нет
    begin
      btnUpdate.Visible := False;
      btnCancel.Visible := False;
      btnOk.Visible := True;
      btnIterrupt.Visible := False;
      btnOk.Left := Panel1.Width - btnOk.Width - 8;
    end;
  end;
  Panel1.Refresh;
end;

//Устанавливает внешний вид окна обновления
procedure TUpdateForm.ShowUpdateStatys;
begin
  //Текущая версия
  label2.Caption := 'Текущая версия программы: ' + IntToStr(FCurVersion.App);
  label3.Caption := 'справочников: ' + IntToStr(FCurVersion.Catalog);
  label4.Caption := 'пользовательских таблиц: ' + IntToStr(FCurVersion.User);

  //Вид нижних кнопочек
  SetButtonStyle(FSResponse.UpdeteStatys);

  memProcess.Lines.Clear;
  //Текстовка в мемо
  case FSResponse.UpdeteStatys of
    1:  //Обновления есть
    begin
      ShowStatys('Доступны новые обновления на сервере:');

      if FCurVersion.App < FSResponse.AppVersion then
        ShowStatys('версия программы :' + IntToStr(FSResponse.AppVersion));

      if FCurVersion.Catalog < FSResponse.CatalogVersion then
        ShowStatys('версия справочников :' +
          IntToStr(FSResponse.CatalogVersion));

      if FCurVersion.User < FSResponse.UserVersion then
        ShowStatys('версия пользовательских таблиц :' +
          IntToStr(FSResponse.UserVersion));
    end;
    else //Обновлений нет
    begin
      ShowStatys('На сервере новых обновлений нет.');
    end;
  end;
end;

procedure TUpdateForm.btnIterruptClick(Sender: TObject);
begin
  if Assigned(FUpdateThread) then
  begin
    FStopUpdateProc := True;
    FUpdateThread.Terminate;
  end;
end;

procedure TUpdateForm.btnOkClick(Sender: TObject);
begin
  Close;
end;

procedure TUpdateForm.btnUpdateClick(Sender: TObject);
begin
  StartUpdate;
end;

procedure TUpdateForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if Assigned(FUpdateThread) and
     (WaitForSingleObject(FUpdateThread.Handle,0) = WAIT_TIMEOUT) then
    CanClose := False;
end;

procedure TUpdateForm.FormCreate(Sender: TObject);
begin
  FSResponse := TServiceResponse.Create;
end;

procedure TUpdateForm.FormDestroy(Sender: TObject);
begin
  FreeAndNil(FSResponse);
end;

procedure TUpdateForm.FormShow(Sender: TObject);
begin
  ShowUpdateStatys;
end;

function TUpdateForm.CheckNeedCreateArhiv: THandle;
var i: Integer;
begin
  Result := 0;
  if Assigned(FArhiv) then
    //Если последний архив старше 2х дней создается новый архив
    if not ((Length(FArhiv.ArhFiles) > 0) and
       ((Now - FArhiv.GetArhivTime(FArhiv.ArhFiles[0])) < 2)) then
    begin
      //Максимуи C_ARHCOUNT копии, что-бы не забивать место
      for i := C_ARHCOUNT - 1 to High(FArhiv.ArhFiles) do
        FArhiv.DeleteArhiv(FArhiv.ArhFiles[i]);
      if Assigned(Owner) and (Owner is TForm) then
        FArhiv.CreateNewArhiv(TForm(Owner).Handle);
      Result := FArhiv.CreateArhHandle;
    end;
end;

procedure TUpdateForm.WMUpdateState(var Mes: TMessage);
begin
  try
    UpdateState(string(PChar(Mes.WParam)), Integer(Mes.LParam));
  except
    on e: Exception do
      Application.ShowException(e);
  end;
end;

procedure TUpdateForm.UpdateState(AStrVal: string; AType: Byte);
begin
  //1 - Добавить новую строку
  //2 - Добавить новую строку + отображать прогресс
  //3 - Обновить последнюю строку
  //4 - Обновить последнюю строку + отображать прогресс
  TimerProgress.Enabled := False;
  if (memProcess.Lines.Count > 0) and
     (Length(memProcess.Lines[memProcess.Lines.Count - 1]) > 0) then
    memProcess.Lines[memProcess.Lines.Count - 1] :=
      Copy(memProcess.Lines[memProcess.Lines.Count - 1], 1,
        Length(memProcess.Lines[memProcess.Lines.Count - 1]) - TimerProgress.Tag);
  TimerProgress.Tag := 0;
  case AType of
  1, 2: memProcess.Lines.Add(AStrVal);
  3, 4:
  begin
    if memProcess.Lines.Count > 0 then
      memProcess.Lines[memProcess.Lines.Count - 1] := AStrVal
    else
      memProcess.Lines.Add(AStrVal);
  end;
  end;

  if AType in [2, 4] then
    TimerProgress.Enabled := True;
end;

procedure TUpdateForm.WMUpdateProgress(var Mes: TMessage);
begin
  try
    case Integer(Mes.LParam) of
    1:
    begin
      ProgressBar1.Style := pbstNormal;
      ProgressBar1.Position := 0;
      ProgressBar1.Max := Integer(Mes.WParam);
      ProgressBar1.Visible := True;
    end;
    2: ProgressBar1.Position := Integer(Mes.WParam);
    3: ProgressBar1.Visible := False;
    4:
    begin
      ProgressBar1.Style := pbstMarquee;
      ProgressBar1.Visible := True;
    end;
    else ProgressBar1.Visible := False;
    end;
  except
    on e: Exception do
      Application.ShowException(e);
  end;
end;

procedure TUpdateForm.OnThreadTerminate(Sender: TObject);
var ex: TObject;
begin
  ex := TThread(Sender).FatalException;
  if Assigned(ex) then
  begin
    UpdateState('', 1);
    UpdateState('Обновление завершилось ошибкой!', 1);
    SetButtonStyle(3)
  end
  else
  begin
    if FStopUpdateProc and
       not TUpdateThread(Sender).UpdateResult then
    begin
      UpdateState('', 1);
      UpdateState('Прервано', 1);
    end;
    SetButtonStyle(0);
  end;
end;


end.
