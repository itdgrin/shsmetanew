unit UpdateModule;

interface

uses
  System.Classes,
  System.SysUtils,
  System.IOUtils,
  System.Types,
  Vcl.Forms,
  DateUtils,
  SyncObjs,
  Winapi.Windows,
  IdHTTP,
  XMLIntf,
  XMLDoc,
  ActiveX,
  IdComponent,
  IdMessage,
  IdSSLOpenSSL,
  IdMessageClient,
  IdSMTPBase,
  IdSMTP,
  IdAttachmentFile,
  IdExplicitTLSClientServerBase,
  ZipForge,
  FireDAC.Comp.Client,
  FireDAC.Comp.Script,
  FireDAC.Stan.Intf,
  GlobsAndConst,
  ArhivModule;

type
  TLogFile = class(TObject)
  private
    { Private declarations }
    FFile: TextFile;
    FActive: boolean;
    FFileName: string;
    FFullName: string;
    FKeepOpened: boolean;
    FFileDir: string;

    procedure SetFileName(const Value: string);
    procedure SetKeepOpened(const Value: boolean);
    procedure SetFileDir(const Value: string);
    function GetLogFileName: String;
  protected
    { Protected declarations }
  public
    { Public declarations }
    destructor Destroy; override;
    procedure Add(AText: string; ATag: string = '');
    property Active: boolean read FActive write FActive;
    property FileName: string read FFileName write SetFileName;
    property KeepOpened: boolean read FKeepOpened write SetKeepOpened;
    property FileDir: string read FFileDir write SetFileDir;
  end;

  TVersion = record
    App: integer;
    Catalog: integer;
    User: integer;
    procedure Clear;
    procedure Assign(const AVersion: TVersion);
  end;

  TNewVersion = record
    Version: integer;
    Url: string;
    Comment: string;
  end;
  TNewVersionList = array of TNewVersion;

  TServiceResponse = class(TPersistent)
  private
    //0 - нет обновлений
    //1 - есть обновления
    FUpdeteStatys: byte;

    FAppCount,
    FCatalogCount,
    FUserCount: integer;

    FAppList,
    FCatalogList,
    FUserList: TNewVersionList;

    FUserRequest: boolean;

    function GetAppList(AIndex: Integer): TNewVersion;
    function GetCatalogList(AIndex: Integer): TNewVersion;
    function GetUserList(AIndex: Integer): TNewVersion;

    procedure SetAppList(AIndex: Integer; const AValue: TNewVersion);
    procedure SetCatalogList(AIndex: Integer; const AValue: TNewVersion);
    procedure SetUserList(AIndex: Integer; const AValue: TNewVersion);

    function GetAppVersion: integer;
    function GetCatalogVersion: integer;
    function GetUserVersion: integer;
  public
    procedure Assign(Source: TPersistent); override;
    procedure Clear;
    constructor Create;
    destructor Destroy; override;

    property UserRequest: boolean read FUserRequest write FUserRequest;
    property UpdeteStatys: byte read FUpdeteStatys write FUpdeteStatys;

    property AppVersion: integer read GetAppVersion;
    property CatalogVersion: integer read GetCatalogVersion;
    property UserVersion: integer read GetUserVersion;

    property AppCount: integer read FAppCount;
    property CatalogCount: integer read FCatalogCount;
    property UserCount: integer read FUserCount;

    property AppList[Index: Integer]: TNewVersion read GetAppList write SetAppList;
    property CatalogList[Index: Integer]: TNewVersion read GetCatalogList write SetCatalogList;
    property UserList[Index: Integer]: TNewVersion read GetUserList write SetUserList;

    function AddApp(const ANewVersion: TNewVersion): integer;
    function AddCatalog(const ANewVersion: TNewVersion): integer;
    function AddUser(const ANewVersion: TNewVersion): integer;
  end;

  TChackUpdateThread = class(TThread)
  private
    FCurVersion : TVersion; //Текушая версия программы
    FCurVersionCS: TCriticalSection;

    FMainHandle: HWND;
    FLogFile: TLogFile;

    FUpdType: Byte;
    FMirrorPath: string;

    FUREvent, FTermEvent: TEvent;

    FResponse: TServiceResponse; //Ответ службы

    FUserBlok: boolean; //Блокировка пользователем (не надо меня беспокоить)
    FUserBlokCS: TCriticalSection;

    //Запрос версии инициирован пользователем
    FUserRequest: boolean;

    procedure GetVersion; //Отправляет запрос на получение версии на серверее
    procedure ParsXMLResult(const AStrimPage: TMemoryStream;
      var ASResponse: TServiceResponse);

    procedure GetLogName;
    procedure GetInetUpdate(var ASResponse: TServiceResponse);
    procedure GetMirrorUpdate(var ASResponse: TServiceResponse);

    { Private declarations }
  protected
    procedure Execute; override;
  public
    procedure UserRequest;
    procedure Terminate;
    constructor Create(AMainHandle: HWND; AVersion: TVersion;
      AUpdType: Byte; const AMirrorPath: string); overload;
    destructor Destroy; override;
    procedure UserBlok;
    procedure SetCurVersion(AVersion: TVersion);
  end;

  TCreateArhiveEvent = function(): THandle of object;

  TUpdateThread = class(TThread)
  private
    FCurVersion : TVersion;
    FResponse: TServiceResponse;
    FMainHandle: HWND;
    FExeName: string;
    FUpdateType: Byte;

    FArhivThreadHandle: THandle;
    FOnCreateArhivEvent: TCreateArhiveEvent;

    FClientName: string; // Имя клиета
    FSendReport: boolean; // Необходимость отправлять отчет об ошибках обновления
    FSqlErrorList: TStringList;

    FZipForge: TZipForge;

    FConnect: TFDConnection;
    FTrans: TFDTransaction;
    FQuery: TFDQuery;
    FSQLScript: TFDScript;

    FHTTP: TIdHTTP;

    FUpdPath: string;
    FUpdPathFlag: boolean;
    FUpdVersion: Integer;

    FUpdateResult: Boolean;

    procedure CheckNeedCreateArhiv;
    procedure GetIniData(AExeName: string);
    procedure SendErrorReport;
    function ExecSqlScript(ADirName: string; AUpdate: TNewVersion;
      AType: byte): Boolean;
    procedure LoadAndSetUpdate(AUpdate: TNewVersion; AType: byte);
    procedure SQLScriptError(ASender: TObject;
      const AInitiator: IFDStanObject; var AException: Exception);
    function UpdateApp(const AUpdatePath: string): Boolean;
    procedure SetUpdPath;
    procedure SetUpdFlags;
    procedure ShowStatys(AStrValue: string; AType: Integer);
    procedure HTTPWorkBegin(ASender: TObject; AWorkMode: TWorkMode;
      AWorkCountMax: Int64);
    procedure HTTPWorkEnd(ASender: TObject; AWorkMode: TWorkMode);
    procedure HTTPWork(ASender: TObject; AWorkMode: TWorkMode;
      AWorkCount: Int64);

    procedure BackupUserData;
    procedure RestoreUserData;
  protected
    procedure Execute; override;
  public
    constructor Create(AMainHandle: HWND; ACurVersion: TVersion;
      AResponse: TServiceResponse; AExeName: string;
      AUpdateType: Byte); overload;
    destructor Destroy; override;

    property OnCreateArhivEvent: TCreateArhiveEvent write FOnCreateArhivEvent;
    property UpdateResult: Boolean read FUpdateResult;
  end;

  //Создает зеркало обновлений при необходимости
  TCreateMirrorThread = class(TThread)
  private
    FMirrorPath,
    FExeName: string;
    FLogFile: TLogFile;
    FZipForge: TZipForge;
    FCurAppVersion: Integer;
  protected
    procedure Execute; override;
  public
    constructor Create(const AMirrorPath, AExeName: string;
      ACurAppVersion: Integer); overload;
    destructor Destroy; override;
  end;

implementation
uses IniFiles, Tools;

{ TVersion }
procedure TVersion.Clear;
begin
  App := 0;
  Catalog := 0;
  User := 0;
end;

procedure TVersion.Assign(const AVersion: TVersion);
begin
  App := AVersion.App;
  Catalog := AVersion.Catalog;
  User := AVersion.User;
end;

{ TLogFile }

function TLogFile.GetLogFileName: String;
begin
  Result:= FileDir + FileName;
end;

procedure TLogFile.Add(AText: string; ATag: string);
var
  fname, lMessage: string;
begin
  if not Active then exit;

  fname:= GetLogFileName;

  if not KeepOpened then
  begin
    AssignFile(FFile, fname);
    if FileExists(fname) then
      Append(FFile)
    else
      Rewrite(FFile);
  end
  else
    if fname <> FFullName then
    begin
      CloseFile(FFile);
      FFullName:= fname;
      AssignFile(FFile, fname);
      if FileExists(fname) then
        Append(FFile)
      else
        Rewrite(FFile);
    end;

  lMessage := '[' + DateTimeToStr(Now);
  if ATag <> '' then lMessage:= lMessage + ' : '+ ATag;
  lMessage := lMessage + ']';
  lMessage:= lMessage + ' ' + AText;

  writeln(FFile, lMessage);

  if not KeepOpened then CloseFile(FFile);
end;

procedure TLogFile.SetFileName(const Value: string);
begin
  FFileName := Value;
end;

procedure TLogFile.SetKeepOpened(const Value: boolean);
begin
  FKeepOpened := Value;
end;

destructor TLogFile.Destroy;
begin
  if KeepOpened then CloseFile(FFile);
  inherited;
end;

procedure TLogFile.SetFileDir(const Value: string);
begin
  FFileDir:= Value;
  if FFileDir <> '' then
  begin
    ForceDirectories(FFileDir);
    FFileDir := IncludeTrailingPathDelimiter(FFileDir);
  end;
end;

{ UpdateThread }

procedure TChackUpdateThread.GetLogName;
begin
  //В принципе обращаться к Application в потоке некрасиво
  FLogFile.FileDir := ExtractFilePath(Application.ExeName) + C_LOGDIR;
  FLogFile.FileName := C_UPDATELOG;
end;

constructor TChackUpdateThread.Create(AMainHandle: HWND; AVersion: TVersion;
  AUpdType: Byte; const AMirrorPath: string);
begin
  inherited Create(False);
  Priority :=  tpLower;

  //Текущая версия приложения;
  FCurVersion := AVersion;
  FCurVersionCS := TCriticalSection.Create;
  FMainHandle := AMainHandle;
  FUpdType := AUpdType;
  FMirrorPath := IncludeTrailingPathDelimiter(AMirrorPath);

  FLogFile := TLogFile.Create;
  FLogFile.Active := true;
  GetLogName;

  FUREvent := TEvent.Create(nil, true, false, '');
  FTermEvent := TEvent.Create(nil, true, false, '');

  FResponse := TServiceResponse.Create;

  FUserBlok := False;
  FUserBlokCS := TCriticalSection.Create;
end;

destructor TChackUpdateThread.Destroy;
begin
  FreeAndNil(FResponse);
  FreeAndNil(FCurVersionCS);
  FreeAndNil(FUserBlokCS);
  FreeAndNil(FUREvent);
  FreeAndNil(FTermEvent);
  FreeAndNil(FLogFile);
  inherited;
end;

procedure TChackUpdateThread.UserRequest;
begin
  FUREvent.SetEvent;
end;

procedure TChackUpdateThread.Terminate;
begin
  inherited Terminate;
  FTermEvent.SetEvent;
end;

procedure TChackUpdateThread.SetCurVersion(AVersion: TVersion);
begin
  FCurVersionCS.Enter;
  try
    FCurVersion.Assign(AVersion);
  finally
    FCurVersionCS.Leave;
  end;
end;

procedure TChackUpdateThread.UserBlok;
begin
  FUserBlokCS.Enter;
  try
    FUserBlok := True;
  finally
    FUserBlokCS.Leave;
  end;
end;

procedure TChackUpdateThread.ParsXMLResult(const AStrimPage: TMemoryStream;
      var ASResponse: TServiceResponse);
var XML : IXMLDocument;
    TempNode, TempNode1, CatNode, UsNode, AppNode: IXMLNode;
    i: Integer;
    TempNV: TNewVersion;
begin
  XML := TXMLDocument.Create(nil);
  try
    XML.LoadFromStream(AStrimPage);
    TempNode := XML.ChildNodes.FindNode('updates');
    if TempNode = nil then
      raise Exception.Create('Не найдена нода <updates>');
    CatNode := TempNode.ChildNodes.FindNode('catalog_updates');
    if CatNode = nil then
      raise Exception.Create('Не найдена нода <catalog_updates>');
    UsNode := TempNode.ChildNodes.FindNode('user_updates');
    if UsNode = nil then
      raise Exception.Create('Не найдена нода <user_updates>');
    AppNode := TempNode.ChildNodes.FindNode('app_updates');
    if AppNode = nil then
      raise Exception.Create('Не найдена нода <app_updates>');

    TempNode := AppNode.ChildNodes.FindNode('available');
    if TempNode = nil then
      raise Exception.Create('Не найдена нода <app_updates><available>');
    if TempNode.Text = 'yes' then
    begin
      TempNV.Version := StrToInt(AppNode.ChildNodes.FindNode('version').Text);
      TempNV.Url := AppNode.ChildNodes.FindNode('url').Text;
      ASResponse.AddApp(TempNV);
    end;

    TempNode := CatNode.ChildNodes.FindNode('available');
    if TempNode = nil then
      raise Exception.Create('Не найдена нода <catalog_updates><available>');
    if TempNode.Text = 'yes' then
    begin
      for i := 0 to CatNode.ChildNodes.Count - 1 do
      begin
        if CatNode.ChildNodes[i].NodeName = 'update' then
        begin
          TempNode1 := CatNode.ChildNodes.Get(i);
          TempNV.Version := StrToInt(TempNode1.ChildNodes.FindNode('version').Text);
          TempNV.Url := TempNode1.ChildNodes.FindNode('url').Text;
          TempNV.Comment := TempNode1.ChildNodes.FindNode('comment').Text;
          ASResponse.AddCatalog(TempNV);
        end;
      end;
    end;

    TempNode := UsNode.ChildNodes.FindNode('available');
    if TempNode = nil then
      raise Exception.Create('Не найдена нода <user_updates><available>');
    if TempNode.Text = 'yes' then
    begin
      for i := 0 to UsNode.ChildNodes.Count - 1 do
      begin
        if UsNode.ChildNodes[i].NodeName = 'update' then
        begin
          TempNode1 := UsNode.ChildNodes.Get(i);
          TempNV.Version := StrToInt(TempNode1.ChildNodes.FindNode('version').Text);
          TempNV.Url := TempNode1.ChildNodes.FindNode('url').Text;
          TempNV.Comment := TempNode1.ChildNodes.FindNode('comment').Text;
          ASResponse.AddUser(TempNV);
        end;
      end;
    end;
  except
    on e: Exception do
    begin
      FLogFile.Add(e.ClassName + ': ' + e.Message, 'ChackUpdateThread (pars XML)');
    end;
  end;
end;

procedure TChackUpdateThread.GetInetUpdate(var ASResponse: TServiceResponse);
var HTTP: TIdHTTP;
    StrimPage: TMemoryStream;
begin
  HTTP := TIdHTTP.Create(nil);
  HTTP.ConnectTimeout := 3000;
  StrimPage := TMemoryStream.Create;
  try
    try
      HTTP.HandleRedirects := true;
      HTTP.Request.UserAgent:='Mozilla/5.0 (Windows NT 6.1) '+
        'AppleWebKit/537.36 (KHTML, like Gecko) Chrome/34.0.1847.116 Safari/537.36';
      HTTP.Request.Accept:='text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8';
      HTTP.Request.AcceptLanguage:='ru-RU,ru;q=0.8,en-US;q=0.6,en;q=0.4,ar;q=0.2';
      HTTP.Request.AcceptCharSet:='windows-1251,utf-8;q=0.7,*;q=0.7';

      HTTP.Get(C_UPDATESERV + '/gen/get_xml.xml?' +
        'user_version=' + IntToStr(FCurVersion.User) + '&' +
        'app_version=' + IntToStr(FCurVersion.App) + '&' +
        'catalog_version=' + IntToStr(FCurVersion.Catalog), StrimPage);

      ParsXMLResult(StrimPage, ASResponse);
    except
      on e: Exception do
      begin
        FLogFile.Add(e.ClassName + ': ' + e.Message, 'ChackUpdateThread (get version)');
      end;
    end;
  finally
    HTTP.Free;
    StrimPage.Free;
  end;
end;

procedure TChackUpdateThread.GetMirrorUpdate(var ASResponse: TServiceResponse);
var TmpFiles: TStringDynArray;
    I: Integer;
    MaxAppVers: Integer;
    TmpStr: string;
    TempNV: TNewVersion;
begin
  TmpFiles := TDirectory.GetFiles(FMirrorPath, C_UPD_MIRRORMASK,
    TSearchOption.soTopDirectoryOnly);

  MaxAppVers := 0;
  for I := Low(TmpFiles) to High(TmpFiles) do
  begin
    TmpStr := ExtractFileName(TmpFiles[i]);
    TmpStr := StringReplace(TmpStr, C_UPD_MIRRORPAT1, '', [rfReplaceAll]);
    TmpStr := StringReplace(TmpStr, C_UPD_MIRRORPAT2, '', [rfReplaceAll]);
    if MaxAppVers < StrToIntDef(TmpStr, 0) then
      MaxAppVers := StrToIntDef(TmpStr, 0);
  end;
  if MaxAppVers > 0 then
  begin
    TempNV.Version := MaxAppVers;
    TempNV.Url := FMirrorPath + Format(C_UPD_MIRRORNAME, [MaxAppVers]);
    FResponse.AddApp(TempNV);
  end;
end;

procedure TChackUpdateThread.GetVersion;
begin
  FResponse.Clear;

  FUserRequest := false;
  //Снимаем сигнальное состояние порверки по требованию если оно установлено
  if FUREvent.WaitFor(0) = wrSignaled then
  begin
    FUserBlok := False;
    FUREvent.ResetEvent;
    FUserRequest := true;
  end;

  //Если пользователь запретил, запроса не происходит
  if FUserBlok then exit;

  if FUpdType = 0 then
  begin
    GetInetUpdate(FResponse);
  end
  else
  begin
    GetMirrorUpdate(FResponse);
  end;

  FCurVersionCS.Enter;
  try
    FResponse.UserRequest := FUserRequest;
    if (FCurVersion.App < FResponse.AppVersion) or
       (FCurVersion.Catalog < FResponse.CatalogVersion) or
       (FCurVersion.User < FResponse.UserVersion) or
       FUserRequest then
    begin
      if (FCurVersion.App < FResponse.AppVersion) or
         (FCurVersion.Catalog < FResponse.CatalogVersion) or
         (FCurVersion.User < FResponse.UserVersion) then
        FResponse.UpdeteStatys := 1;

      SendMessage(FMainHandle, WM_SHOW_SPLASH, 0, LParam(FResponse));
    end;
  finally
    FCurVersionCS.Leave;
  end;
end;

procedure TChackUpdateThread.Execute;
var Handles: array [0..1] of THandle;
begin
  Synchronize(GetLogName);
  FLogFile.Active := true;
  try
    CoInitializeEx(nil, COINIT_APARTMENTTHREADED or COINIT_DISABLE_OLE1DDE);
    try
      Handles[0] := FUREvent.Handle;
      Handles[1] := FTermEvent.Handle;
      while not Terminated do
      begin
        GetVersion;
        WaitForMultipleObjectsEx(2, @Handles[0], false, C_GETVERSINTERVAL, False);
      end;
    finally
        CoUninitialize;
    end;
  except
    on e: Exception do
    begin
      FLogFile.Add(e.ClassName + ': ' + e.Message, 'ChackUpdateThread (execute)');
    end;
  end;
end;

{ TServiceResponse }
procedure TServiceResponse.Assign(Source: TPersistent);
var i : integer;
begin
  if Source is TServiceResponse then
  begin
    FUserRequest := (Source as TServiceResponse).FUserRequest;
    FUpdeteStatys := (Source as TServiceResponse).FUpdeteStatys;

    FAppCount := (Source as TServiceResponse).FAppCount;
    SetLength(FAppList, FAppCount);
    for i := 0 to FAppCount - 1 do
    begin
      FAppList[i].Version := (Source as TServiceResponse).FAppList[i].Version;
      FAppList[i].Url := (Source as TServiceResponse).FAppList[i].Url;
      FAppList[i].Comment := (Source as TServiceResponse).FAppList[i].Comment;
    end;

    FCatalogCount := (Source as TServiceResponse).FCatalogCount;
    SetLength(FCatalogList, FCatalogCount);
    for i := 0 to FCatalogCount - 1 do
    begin
      FCatalogList[i].Version := (Source as TServiceResponse).FCatalogList[i].Version;
      FCatalogList[i].Url := (Source as TServiceResponse).FCatalogList[i].Url;
      FCatalogList[i].Comment := (Source as TServiceResponse).FCatalogList[i].Comment;
    end;

    FUserCount := (Source as TServiceResponse).FUserCount;
    SetLength(FUserList, FUserCount);
    for i := 0 to FUserCount - 1 do
    begin
      FUserList[i].Version := (Source as TServiceResponse).FUserList[i].Version;
      FUserList[i].Url := (Source as TServiceResponse).FUserList[i].Url;
      FUserList[i].Comment := (Source as TServiceResponse).FUserList[i].Comment;
    end;
    Exit;
  end;

  inherited Assign(Source);
end;

procedure TServiceResponse.Clear;
begin
  FUpdeteStatys := 0;

  FAppCount := 0;
  FCatalogCount := 0;
  FUserCount := 0;

  SetLength(FAppList, FAppCount);
  SetLength(FCatalogList, FCatalogCount);
  SetLength(FUserList, FUserCount);
end;

constructor TServiceResponse.Create;
begin
  inherited Create;
  Clear;
end;

destructor TServiceResponse.Destroy;
begin
  Clear;
  inherited;
end;

function TServiceResponse.GetAppList(AIndex: Integer): TNewVersion;
begin
  if (AIndex < 0) or (AIndex >= FAppCount) then
    raise Exception.Create(format('List index out of bounds (%d)',[AIndex]));
  Result := FAppList[AIndex];
end;

function TServiceResponse.GetCatalogList(AIndex: Integer): TNewVersion;
begin
  if (AIndex < 0) or (AIndex >= FCatalogCount) then
    raise Exception.Create(format('List index out of bounds (%d)',[AIndex]));
  Result := FCatalogList[AIndex];
end;

function TServiceResponse.GetUserList(AIndex: Integer): TNewVersion;
begin
  if (AIndex < 0) or (AIndex >= FUserCount) then
    raise Exception.Create(format('List index out of bounds (%d)',[AIndex]));
  Result := FUserList[AIndex];
end;

function TServiceResponse.AddApp(const ANewVersion: TNewVersion): integer;
begin
  inc(FAppCount);
  SetLength(FAppList, FAppCount);
  Result := FAppCount - 1;
  FAppList[Result].Version := ANewVersion.Version;
  FAppList[Result].Url := ANewVersion.Url;
  FAppList[Result].Comment := ANewVersion.Comment;
end;

function TServiceResponse.AddCatalog(const ANewVersion: TNewVersion): integer;
begin
  inc(FCatalogCount);
  SetLength(FCatalogList, FCatalogCount);
  Result := FCatalogCount - 1;
  FCatalogList[Result].Version := ANewVersion.Version;
  FCatalogList[Result].Url := ANewVersion.Url;
  FCatalogList[Result].Comment := ANewVersion.Comment;
end;

function TServiceResponse.AddUser(const ANewVersion: TNewVersion): integer;
begin
  inc(FUserCount);
  SetLength(FUserList, FUserCount);
  Result := FUserCount - 1;
  FUserList[Result].Version := ANewVersion.Version;
  FUserList[Result].Url := ANewVersion.Url;
  FUserList[Result].Comment := ANewVersion.Comment;
end;

function TServiceResponse.GetAppVersion: integer;
var i: integer;
begin
  Result := 0;
  for i := 0 to FAppCount - 1 do
      if Result < FAppList[i].Version then
        Result := FAppList[i].Version;
end;

function TServiceResponse.GetCatalogVersion: integer;
var i: integer;
begin
  Result := 0;
  for i := 0 to FCatalogCount - 1 do
      if Result < FCatalogList[i].Version then
        Result := FCatalogList[i].Version;
end;

function TServiceResponse.GetUserVersion: integer;
var i: integer;
begin
  Result := 0;
  for i := 0 to FUserCount - 1 do
      if Result < FUserList[i].Version then
        Result := FUserList[i].Version;
end;

procedure TServiceResponse.SetAppList(AIndex: Integer; const AValue: TNewVersion);
begin
  if (AIndex < 0) or (AIndex >= FAppCount) then
    raise Exception.Create(format('List index out of bounds (%d)',[AIndex]));
  FAppList[AIndex].Version := AValue.Version;
  FAppList[AIndex].Url := AValue.Url;
end;

procedure TServiceResponse.SetCatalogList(AIndex: Integer; const AValue: TNewVersion);
begin
  if (AIndex < 0) or (AIndex >= FCatalogCount) then
    raise Exception.Create(format('List index out of bounds (%d)',[AIndex]));
  FCatalogList[AIndex].Version := AValue.Version;
  FCatalogList[AIndex].Url := AValue.Url;
end;

procedure TServiceResponse.SetUserList(AIndex: Integer; const AValue: TNewVersion);
begin
  if (AIndex < 0) or (AIndex >= FUserCount) then
    raise Exception.Create(format('List index out of bounds (%d)',[AIndex]));
  FUserList[AIndex].Version := AValue.Version;
  FUserList[AIndex].Url := AValue.Url;
end;

{ TUpdateThread }

constructor TUpdateThread.Create(AMainHandle: HWND; ACurVersion: TVersion;
      AResponse: TServiceResponse; AExeName: string;
      AUpdateType: Byte);
begin
  inherited Create(True);

  FMainHandle := AMainHandle;
  FExeName := AExeName;
  FUpdateType := AUpdateType;

  FCurVersion.Assign(ACurVersion);

  FResponse := TServiceResponse.Create;
  FResponse.Assign(AResponse);

  FSqlErrorList := TStringList.Create;
  GetIniData(AExeName);

  FZipForge := TZipForge.Create(nil);

  FConnect := TFDConnection.Create(nil);
  FConnect.Params.Text := G_CONNECTSTR;

  FTrans := TFDTransaction.Create(nil);
  FTrans.Connection := FConnect;

  FQuery := TFDQuery.Create(nil);
  FQuery.Connection := FConnect;

  FSQLScript := TFDScript.Create(nil);
  FSQLScript.Connection := FConnect;
  FSQLScript.OnError := SQLScriptError;
  FConnect.Connected := True;

  FHTTP := TIdHTTP.Create(nil);
  FHTTP.OnWorkBegin := HTTPWorkBegin;
  FHTTP.OnWork := HTTPWork;
  FHTTP.OnWorkEnd := HTTPWorkEnd;
end;

destructor TUpdateThread.Destroy;
begin
  FreeAndNil(FResponse);
  FreeAndNil(FSqlErrorList);
  FreeAndNil(FZipForge);
  FreeAndNil(FConnect);
  FreeAndNil(FTrans);
  FreeAndNil(FQuery);
  FreeAndNil(FSQLScript);
  FreeAndNil(FHTTP);
  inherited;
end;

procedure TUpdateThread.CheckNeedCreateArhiv;
begin
  FArhivThreadHandle := 0;
  if Assigned(FOnCreateArhivEvent) then
    FArhivThreadHandle := FOnCreateArhivEvent();
end;

procedure TUpdateThread.Execute;
var i: Integer;
begin
  FUpdateResult := False;

  if FUpdateType = 0 then
  begin
    //Создается архив БД, если это необходимо
    Synchronize(CheckNeedCreateArhiv);

    //Ожидание окончания создания архива
    if WaitForSingleObject(FArhivThreadHandle, 0) = WAIT_TIMEOUT then
      ShowStatys('Создание архива БД', 2);

    while WaitForSingleObject(FArhivThreadHandle, 2000) = WAIT_TIMEOUT do
      if Terminated then Exit;
  end;

  if Terminated then Exit;

  //Подготавлявается папка обновлений
  KillDir(ExtractFilePath(FExeName) + C_UPDATEDIR);
  ForceDirectories(ExtractFilePath(FExeName) + C_UPDATEDIR);

  try
    //Копия пользовательских данных
    if FUpdateType = 0 then
    begin
      BackupUserData;

      ShowStatys('', 1);

      if FResponse.CatalogCount > 0 then
      begin
        ShowStatys('Обновление справочников', 3);
        ShowStatys('', 1);
        for i := 0 to FResponse.CatalogCount - 1 do
        begin
          if Terminated then Exit;
          LoadAndSetUpdate(FResponse.CatalogList[i], 0);
        end;
      end;

      if FResponse.UserCount > 0 then
      begin
        ShowStatys('Обновление пользовательских таблиц', 3);
        ShowStatys('', 1);
        for i := 0 to FResponse.UserCount - 1 do
        begin
          if Terminated then Exit;
          LoadAndSetUpdate(FResponse.UserList[i], 1);
        end;
      end;
    end;

    if FResponse.AppCount > 0 then
    begin
      ShowStatys('Обновление программы', 3);
      ShowStatys('', 1);
      for i := 0 to FResponse.AppCount - 1 do
      begin
        if Terminated then Exit;
        LoadAndSetUpdate(FResponse.AppList[i], 2);
      end;

      if (G_STARTUPDATER > 0) then
      begin
        ShowStatys('Для завершения обновления нужен перезапуск программы!', 3);
        ShowStatys('', 1);
      end;
    end;
  finally
    if FUpdateType = 0 then
      RestoreUserData;
  end;

  ShowStatys('', 3);
  ShowStatys('Обновление прошло успешно!', 1);
  FUpdateResult := True;
end;

procedure TUpdateThread.GetIniData(AExeName: string);
var
  ini: TIniFile;
begin
  ini := TIniFile.Create(ExtractFilePath((AExeName) + С_UPD_INI));
  try
    FClientName := ini.ReadString('system', 'clientname', '');
    FSendReport := ini.ReadBool('system', 'sendreport', False);
  finally
    FreeAndNil(ini);
  end;
end;

procedure TUpdateThread.SendErrorReport;
var i : integer;
    Msg : TIdMessage;
    SMTP : TIdSMTP;
    SSLIOHandler : TIdSSLIOHandlerSocketOpenSSL;
begin
  Msg := TIdMessage.Create;
  SMTP := TIdSMTP.Create;
  SSLIOHandler := TIdSSLIOHandlerSocketOpenSSL.Create;
  try
    try
      if FClientName = '' then
        raise Exception.Create('Отчет не отправлен. Не указано имя клиента.');

      SSLIOHandler.SSLOptions.Method := sslvSSLv3;
      SMTP.IOHandler := SSLIOHandler;
      SMTP.HeloName := 'Smeta';

      SMTP.Host := 'smtp.gmail.com';
      SMTP.Port := 465;

      SMTP.AuthType := satDefault;
      SMTP.Username := 'smetareport';
      SMTP.Password := 'smeta1234';

      SMTP.UseTLS := utUseImplicitTLS;

      SMTP.Connect;

      Msg.From.Address := 'smetareport@gmail.com';
      Msg.From.Name := FClientName;
      Msg.Recipients.EMailAddresses := C_SUPPORTMAIL;
      Msg.Subject := 'Отчет об ошибках обновления';
      for i := 0 to FSqlErrorList.Count - 1 do
        Msg.Body.Add(FSqlErrorList[i] + '<br>');

     //Без вложений
      Msg.IsEncoded := False;
      Msg.ContentType := 'text/html; charset=UTF-8;';

      SMTP.Send(Msg);
      SMTP.Disconnect;
    except
      on e : Exception do
        ShowStatys('Error: ' + e.Message, 1);
    end;
  finally
    FreeAndNil(Msg);
    FreeAndNil(SMTP);
    FreeAndNil(SSLIOHandler);
  end;
end;

function TUpdateThread.ExecSqlScript(ADirName: string;
  AUpdate: TNewVersion; AType: byte): Boolean;
var TmpSR: TSearchRec;
    found,
    ScriptCount,
    ScriptNo: integer;
    ScriptResult: boolean;
    VersTabName: string;
begin
  ScriptCount := 0;
  ScriptNo := 0;
  Result := True;

  if AType = 0 then
    VersTabName := 'versionref'
  else
    VersTabName := 'versionuser';

  //Вычисляем общее кол-во скриптов в папке
  found := System.SysUtils.FindFirst(ADirName + '*.sql', faAnyFile, TmpSR);
  try
    while (found = 0) do
    begin
      inc(ScriptCount);
      found := System.SysUtils.FindNext(TmpSR);
    end;
  finally
    System.SysUtils.FindClose(TmpSR);
  end;

  if (ScriptCount > 0) then
  begin
    found := System.SysUtils.FindFirst(ADirName + '*.sql', faAnyFile, TmpSR);
    try
      while (found = 0) do
      begin
        inc(ScriptNo);

        //Проверка выполняется для случая когда одно обновление содержит несколько
        //скриптов
        ScriptResult := False;
        FQuery.SQL.Text := 'Select SCRIPTNAME from ' + VersTabName + ' where ' +
          '(VERSION = ' + IntToStr(AUpdate.Version) + ') and ' +
          '(SCRIPTNAME = ''' + TmpSR.name + ''') and ' +
          '(EXECRESULT = 1)';
        FQuery.Active := True;
        if not FQuery.Eof then
          ScriptResult := True;
        FQuery.Active := False;

        //Если это скрипт уже выполнялся то он будет пропущен
        if ScriptResult then
        begin
          found := FindNext(TmpSR);
          Continue;
        end;

        FSqlScript.SQLScriptFileName := ADirName + TmpSR.name;
        FSqlScript.ExecuteFile(FSqlScript.SQLScriptFileName);
        ScriptResult := (FSqlScript.TotalErrors = 0) and (FSqlErrorList.Count = 0);

        FQuery.SQL.Text := 'INSERT INTO ' + VersTabName +
          ' (VERSION,SCRIPTNAME,EXECTIME,EXECRESULT,ERRORCOUNT,ERRORTEXT,COMMENT,' +
          'SCRIPTCOUNT,SCRIPTNO) VALUES (:VERSION,:SCRIPTNAME,:EXECTIME,:EXECRESULT,' +
          ':ERRORCOUNT,:ERRORTEXT,:COMMENT,:SCRIPTCOUNT,:SCRIPTNO)';
        FQuery.ParamByName('VERSION').Value := AUpdate.Version;
        FQuery.ParamByName('SCRIPTNAME').Value := TmpSR.name;
        FQuery.ParamByName('EXECTIME').Value := Now;
        FQuery.ParamByName('EXECRESULT').Value := byte(ScriptResult);
        FQuery.ParamByName('ERRORCOUNT').Value := FSqlErrorList.Count;
        FQuery.ParamByName('ERRORTEXT').Value := copy(FSqlErrorList.Text, 1, 250);
        FQuery.ParamByName('COMMENT').Value := AUpdate.Comment;
        FQuery.ParamByName('SCRIPTCOUNT').Value := ScriptCount;
        FQuery.ParamByName('SCRIPTNO').Value := ScriptNo;
        FQuery.ExecSQL;

        //Если выполнение скрипта прошло с ошибками, то обновление завершается
        if not ScriptResult then
        begin
          Result := False;
          Exit;
        end;

        found := System.SysUtils.FindNext(TmpSR);
      end;
    finally
      System.SysUtils.FindClose(TmpSR);
    end;
  end
  else
  begin
    //Если обновление не содержит скриптов оно зашитывается как выполненое
    ScriptResult := True;
    FQuery.SQL.Text := 'INSERT INTO ' + VersTabName +
      ' (VERSION,SCRIPTNAME,EXECTIME,EXECRESULT,ERRORCOUNT,ERRORTEXT,COMMENT,' +
      'SCRIPTCOUNT,SCRIPTNO) VALUES (:VERSION,:SCRIPTNAME,:EXECTIME,:EXECRESULT,' +
      ':ERRORCOUNT,:ERRORTEXT,:COMMENT,:SCRIPTCOUNT,:SCRIPTNO)';
    FQuery.ParamByName('VERSION').Value := AUpdate.Version;
    FQuery.ParamByName('SCRIPTNAME').Value := '';
    FQuery.ParamByName('EXECTIME').Value := Now;
    FQuery.ParamByName('EXECRESULT').Value := byte(ScriptResult);
    FQuery.ParamByName('ERRORCOUNT').Value := FSqlErrorList.Count;
    FQuery.ParamByName('ERRORTEXT').Value := copy(FSqlErrorList.Text, 1, 250);
    FQuery.ParamByName('COMMENT').Value := AUpdate.Comment;
    FQuery.ParamByName('SCRIPTCOUNT').Value := ScriptCount;
    FQuery.ParamByName('SCRIPTNO').Value := ScriptNo;
    FQuery.ExecSQL;
  end;
end;

procedure TUpdateThread.LoadAndSetUpdate(AUpdate: TNewVersion; AType: byte);
var LoadPath, UpdName: string;
    MStream: TMemoryStream;
begin
  LoadPath := ExtractFilePath(FExeName) + C_UPDATEDIR;
  if FUpdateType = 0 then
  begin
    UpdName := copy(AUpdate.Url, 1, Pos('?',AUpdate.Url) - 1);
    UpdName := StringReplace(UpdName, '/','\', [rfReplaceAll]);
    UpdName := ExtractFileName(UpdName);
  end
  else
    UpdName := ExtractFileName(AUpdate.Url);

  case AType of
  0:LoadPath := LoadPath + 'cat' + IntToStr(AUpdate.Version) + '\';
  1:LoadPath := LoadPath + 'user' + IntToStr(AUpdate.Version) + '\';
  2:LoadPath := LoadPath + 'app' + IntToStr(AUpdate.Version) + '\';
  end;

  MStream := TMemoryStream.Create;
  try
    ForceDirectories(LoadPath);

    ShowStatys('Обновление ' + IntToStr(AUpdate.Version) + ': ' + AUpdate.Comment, 3);
    ShowStatys('', 1);

    try
      ShowStatys('Загрузка', 4);
      if FUpdateType = 0 then
      begin
        FHTTP.HandleRedirects := true;
        FHTTP.Request.UserAgent:='Mozilla/5.0 (Windows NT 6.1) '+
          'AppleWebKit/537.36 (KHTML, like Gecko) Chrome/34.0.1847.116 Safari/537.36';
        FHTTP.Request.Accept:='text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8';
        FHTTP.Request.AcceptLanguage:='ru-RU,ru;q=0.8,en-US;q=0.6,en;q=0.4,ar;q=0.2';
        FHTTP.Request.AcceptCharSet:='windows-1251,utf-8;q=0.7,*;q=0.7';

        FHTTP.Get(C_UPDATESERV + AUpdate.Url, MStream);
        MStream.SaveToFile(LoadPath + UpdName);
      end
      else
      begin
        TFile.Copy(AUpdate.Url, LoadPath + UpdName);
      end;
      if Terminated then Exit;

      ShowStatys('Распаковка', 4);
      FZipForge.BaseDir := LoadPath;
      FZipForge.Options.OverwriteMode := omAlways;
      FZipForge.FileName := LoadPath + UpdName;
      FZipForge.OpenArchive;
      FZipForge.ExtractFiles('*.*');
      FZipForge.CloseArchive;

      System.SysUtils.DeleteFile(LoadPath + UpdName);

      if Terminated then Exit;

      if AType in [0,1] then
      begin
        ShowStatys('Установка',4);
        if not ExecSqlScript(LoadPath, AUpdate, AType) then
          raise Exception.Create('Не удалось выполнить скрипт!');
      end
      else
      begin
        FUpdPathFlag := UpdateApp(LoadPath);
        FUpdVersion := AUpdate.Version;
        Synchronize(SetUpdFlags);
      end;
    except
      on e: Exception do
      begin
        ShowStatys('Error: ' + e.Message, 1);
        FSqlErrorList.Insert(0, e.Message);
        //Если установлен флаг отправляется отчет об ошибках
        if FSendReport then
        begin
          ShowStatys('Отправка отчета об ошибках в техподдержку', 2);
          case AType of
          0: FSqlErrorList.Insert(0, 'Обновление справочников №' +
            IntToStr(AUpdate.Version));
          1: FSqlErrorList.Insert(0, 'Обновление пользовательских таблиц №' +
              IntToStr(AUpdate.Version));
          2: FSqlErrorList.Insert(0, 'Обновление приложения №' +
              IntToStr(AUpdate.Version));
          end;

          SendErrorReport;
        end;

        raise;
      end;
    end;
  finally
    FreeAndNil(MStream);
    //После завершения обновлений папки с SQL скриптами удалются
    if (AType in [0,1]) or ((AType = 2) and (G_STARTUPDATER = 0)) then
      KillDir(LoadPath);
  end;
end;

procedure TUpdateThread.SQLScriptError(ASender: TObject;
  const AInitiator: IFDStanObject; var AException: Exception);
begin
  FSqlErrorList.Add(ExtractFileName(FSQLScript.SQLScriptFileName) + ': ' +
    AException.Message);
  Abort;
end;

function TUpdateThread.UpdateApp(const AUpdatePath: string): Boolean;
begin
  FUpdPath := AUpdatePath;
  Synchronize(SetUpdPath);
  if TFile.Exists(G_UPDPATH + C_UPDATERNAME) then
  begin
    if FullCopy(G_UPDPATH + C_UPDATERNAME, ExtractFilePath(FExeName) + C_UPDATERNAME) then
      TFile.Delete(G_UPDPATH + C_UPDATERNAME)
    else
      raise Exception.Create('Не удалось скопировать ' + C_UPDATERNAME);
  end;
  Result := not TDirectory.IsEmpty(AUpdatePath);
end;

procedure TUpdateThread.SetUpdPath;
begin
  G_UPDPATH := FUpdPath;
end;

procedure TUpdateThread.SetUpdFlags;
begin
  G_NEWAPPVERS := FUpdVersion;
  if FUpdPathFlag then
  begin
    G_STARTUPDATER := 1;
    G_STARTAPP := True;
  end;
end;

procedure TUpdateThread.ShowStatys(AStrValue: string; AType: Integer);
begin
  //1 - Добавить новую строку
  //2 - Добавить новую строку + отображать прогресс
  //3 - Обновить последнюю строку
  //4 - Обновить последнюю строку + отображать прогресс
  SendMessage(FMainHandle, WM_UPDATESTATE, WParam(PChar(AStrValue)), LParam(AType));
end;

procedure TUpdateThread.HTTPWork(ASender: TObject; AWorkMode: TWorkMode;
  AWorkCount: Int64);
begin
  if (AWorkMode = wmRead) then
    SendMessage(FMainHandle, WM_UPDATEPROGRESS, WParam(AWorkCount div 100), LParam(2));
end;

procedure TUpdateThread.HTTPWorkBegin(ASender: TObject; AWorkMode: TWorkMode;
  AWorkCountMax: Int64);
begin
  if (AWorkMode = wmRead) then
    SendMessage(FMainHandle, WM_UPDATEPROGRESS, WParam(AWorkCountMax div 100), LParam(1));
end;

procedure TUpdateThread.HTTPWorkEnd(ASender: TObject; AWorkMode: TWorkMode);
begin
  SendMessage(FMainHandle, WM_UPDATEPROGRESS, WParam(0), LParam(3));
end;

procedure TUpdateThread.BackupUserData;
begin
  try
    ShowStatys('Создание копии собственных данных', 2);

    FQuery.SQL.Text := 'CREATE TABLE IF NOT EXISTS material_tmp LIKE material';
    FQuery.ExecSQL;
    FQuery.SQL.Text := 'CREATE TABLE IF NOT EXISTS mechanizm_tmp LIKE mechanizm';
    FQuery.ExecSQL;
    FQuery.SQL.Text := 'CREATE TABLE IF NOT EXISTS devices_tmp LIKE devices';
    FQuery.ExecSQL;
    FQuery.SQL.Text := 'CREATE TABLE IF NOT EXISTS units_tmp LIKE units';
    FQuery.ExecSQL;
    FQuery.SQL.Text := 'CREATE TABLE IF NOT EXISTS normativg_tmp LIKE normativg';
    FQuery.ExecSQL;
    FQuery.SQL.Text := 'CREATE TABLE IF NOT EXISTS materialnorm_tmp LIKE materialnorm';
    FQuery.ExecSQL;
    FQuery.SQL.Text := 'CREATE TABLE IF NOT EXISTS mechanizmnorm_tmp LIKE mechanizmnorm';
    FQuery.ExecSQL;
    FQuery.SQL.Text := 'CREATE TABLE IF NOT EXISTS normativwork_tmp LIKE normativwork';
    FQuery.ExecSQL;

    FQuery.SQL.Text :=
      'Insert into material_tmp (`MATERIAL_ID`,`MAT_CODE`,`MAT_NAME`,`MAT_TYPE`,' +
      '`UNIT_ID`,`BASE`) ' +
      'Select `MATERIAL_ID`,`MAT_CODE`,`MAT_NAME`,`MAT_TYPE`,`UNIT_ID`,`BASE` ' +
      'from material m where `BASE` = 1 ' +
      'On DUPLICATE KEY UPDATE `MAT_CODE` = m.`MAT_CODE`,`MAT_NAME` = m.`MAT_NAME`,' +
      '`MAT_TYPE` = m.`MAT_TYPE`,`UNIT_ID` = m.`UNIT_ID`,`BASE` = m.`BASE`';
    FQuery.ExecSQL;
    FQuery.SQL.Text :=
      'Insert into mechanizm_tmp (`MECHANIZM_ID`,`MECH_CODE`,`MECH_NAME`,`UNIT_ID`,' +
      '`DESCRIPTION`,`MECH_PH`,`TYPE_MEH_SMEN_HOUR`,`BASE`) ' +
      'Select `MECHANIZM_ID`,`MECH_CODE`,`MECH_NAME`,`UNIT_ID`,`DESCRIPTION`,' +
      '`MECH_PH`,`TYPE_MEH_SMEN_HOUR`,`BASE` ' +
      'from mechanizm m where `BASE` = 1 ' +
      'On DUPLICATE KEY UPDATE `MECH_CODE` = m.`MECH_CODE`,' +
      '`MECH_NAME` = m.`MECH_NAME`,`UNIT_ID` = m.`UNIT_ID`,' +
      '`DESCRIPTION` = m.`DESCRIPTION`,`MECH_PH` = m.`MECH_PH`,' +
      '`TYPE_MEH_SMEN_HOUR` = m.`TYPE_MEH_SMEN_HOUR`,`BASE` = m.`BASE`';
    FQuery.ExecSQL;
    FQuery.SQL.Text :=
      'Insert into devices_tmp (`DEVICE_ID`,`DEVICE_CODE1`,`DEVICE_CODE2`,`NAME`,' +
      '`UNIT`,`BASE`) ' +
      'Select `DEVICE_ID`,`DEVICE_CODE1`,`DEVICE_CODE2`,`NAME`,`UNIT`,`BASE` ' +
      'from devices d where `BASE` = 1 ' +
      'On DUPLICATE KEY UPDATE `DEVICE_CODE1` = d.`DEVICE_CODE1`,' +
      '`DEVICE_CODE2` = d.`DEVICE_CODE2`,`NAME` = d.`NAME`,' +
      '`UNIT` = d.`UNIT`,`BASE` = d.`BASE`';
    FQuery.ExecSQL;
    FQuery.SQL.Text :=
      'Insert into units_tmp (`UNIT_ID`,`UNIT_NAME`,`UNIT_FULL_NAME`,`BASE`) ' +
      'Select `UNIT_ID`,`UNIT_NAME`,`UNIT_FULL_NAME`,`BASE` ' +
      'from units u where `BASE` = 1 ' +
      'On DUPLICATE KEY UPDATE `UNIT_NAME` = u.`UNIT_NAME`, ' +
      '`UNIT_FULL_NAME` = u.`UNIT_FULL_NAME`,`BASE` = u.`BASE`';
    FQuery.ExecSQL;
    FQuery.SQL.Text :=
      'Insert into normativg_tmp (`SORT_NUM`,`NORMATIV_ID`,`NORM_NUM`,' +
      '`NORM_CAPTION`,`UNIT_ID`,`NORM_ACTIVE`,`date_beginer`,`date_end`,`prikaz`,' +
      '`normativ_directory_id`,`NORM_BASE`,`NORM_TYPE`,`work_id`,`ZNORMATIVS_ID`) ' +
      'Select `SORT_NUM`,`NORMATIV_ID`,`NORM_NUM`,' +
      '`NORM_CAPTION`,`UNIT_ID`,`NORM_ACTIVE`,`date_beginer`,`date_end`,`prikaz`,' +
      '`normativ_directory_id`,`NORM_BASE`,`NORM_TYPE`,`work_id`,`ZNORMATIVS_ID`' +
      'from normativg n where `NORM_BASE` = 1 ' +
      'On DUPLICATE KEY UPDATE `SORT_NUM` = n.`SORT_NUM`,`NORM_NUM` = n.`NORM_NUM`,' +
      '`NORM_CAPTION` = n.`NORM_CAPTION`,`UNIT_ID` = n.`UNIT_ID`,' +
      '`NORM_ACTIVE` = n.`NORM_ACTIVE`,`date_beginer` = n.`date_beginer`,' +
      '`date_end` = n.`date_end`,`prikaz` = n.`prikaz`,' +
      '`normativ_directory_id` = n.`normativ_directory_id`,' +
      '`NORM_BASE` = n.`NORM_BASE`,`NORM_TYPE` = n.`NORM_TYPE`,' +
      '`work_id` = n.`work_id`,`ZNORMATIVS_ID` = n.`ZNORMATIVS_ID`';
    FQuery.ExecSQL;
    FQuery.SQL.Text :=
      'Insert into materialnorm_tmp (`ID`,`NORMATIV_ID`,`MATERIAL_ID`,`NORM_RAS`,' +
      '`TO_YEAR`,`DATE_BEG`,`DATE_END`,`BASE`) ' +
      'Select `ID`,`NORMATIV_ID`,`MATERIAL_ID`,`NORM_RAS`, ' +
      '`TO_YEAR`,`DATE_BEG`,`DATE_END`,`BASE` from materialnorm m where `BASE` = 1 ' +
      'On DUPLICATE KEY UPDATE `NORMATIV_ID` = m.`NORMATIV_ID`,' +
      '`MATERIAL_ID` = m.`MATERIAL_ID`,`NORM_RAS` = m.`NORM_RAS`,' +
      '`TO_YEAR` = m.`TO_YEAR`,`DATE_BEG` = m.`DATE_BEG`,' +
      '`DATE_END` = m.`DATE_END`,`BASE` = m.`BASE`';
    FQuery.ExecSQL;
    FQuery.SQL.Text :=
      'Insert into mechanizmnorm_tmp (`ID`,`NORMATIV_ID`,`MECHANIZM_ID`,`NORM_RAS`,' +
      '`DATE_BEG`,`DATE_END`,`BASE`) ' +
      'Select `ID`,`NORMATIV_ID`,`MECHANIZM_ID`,`NORM_RAS`, ' +
      '`DATE_BEG`,`DATE_END`,`BASE` from mechanizmnorm m where `BASE` = 1 ' +
      'On DUPLICATE KEY UPDATE `NORMATIV_ID` = m.`NORMATIV_ID`,' +
      '`MECHANIZM_ID` = m.`MECHANIZM_ID`,`NORM_RAS` = m.`NORM_RAS`,' +
      '`DATE_BEG` = m.`DATE_BEG`,`DATE_END` = m.`DATE_END`,`BASE` = m.`BASE`';
    FQuery.ExecSQL;
    FQuery.SQL.Text :=
      'Insert into normativwork_tmp (`ID`,`NORMATIV_ID`,`WORK_ID`,`NORMA`,`DATE_BEG`,' +
      '`DATE_END`,`BASE`) ' +
      'Select `ID`,`NORMATIV_ID`,`WORK_ID`,`NORMA`,`DATE_BEG`,`DATE_END`,`BASE` ' +
      'from normativwork n where `BASE` = 1 ' +
      'On DUPLICATE KEY UPDATE `NORMATIV_ID` = n.`NORMATIV_ID`,' +
      '`WORK_ID` = n.`WORK_ID`,`WORK_ID` = n.`WORK_ID`,' +
      '`NORMA` = n.`NORMA`,`DATE_BEG` = n.`DATE_BEG`,' +
      '`DATE_END` = n.`DATE_END`,`BASE` = n.`BASE`';
    FQuery.ExecSQL;

    FQuery.SQL.Text := 'Delete from material where `BASE` = 1';
    FQuery.ExecSQL;
    FQuery.SQL.Text := 'Delete from mechanizm where `BASE` = 1';
    FQuery.ExecSQL;
    FQuery.SQL.Text := 'Delete from devices where `BASE` = 1';
    FQuery.ExecSQL;
    FQuery.SQL.Text := 'Delete from units where `BASE` = 1';
    FQuery.ExecSQL;
    FQuery.SQL.Text := 'Delete from normativg where `NORM_BASE` = 1';
    FQuery.ExecSQL;
    FQuery.SQL.Text := 'Delete from materialnorm where `BASE` = 1';
    FQuery.ExecSQL;
    FQuery.SQL.Text := 'Delete from mechanizmnorm where `BASE` = 1';
    FQuery.ExecSQL;
    FQuery.SQL.Text := 'Delete from normativwork where `BASE` = 1';
    FQuery.ExecSQL;
  except
    on e: Exception do
    begin
      ShowStatys('Error: ' + e.Message, 1);

      raise;
    end;
  end;
end;

procedure TUpdateThread.RestoreUserData;
begin
  try
    ShowStatys('Восстановление собственных данных', 4);
    ShowStatys('', 1);
    FQuery.SQL.Text :=
      'Insert into material (`MATERIAL_ID`,`MAT_CODE`,`MAT_NAME`,`MAT_TYPE`,' +
      '`UNIT_ID`,`BASE`) ' +
      'Select `MATERIAL_ID`,`MAT_CODE`,`MAT_NAME`,`MAT_TYPE`,`UNIT_ID`,`BASE` ' +
      'from material_tmp m where `BASE` = 1 ' +
      'On DUPLICATE KEY UPDATE `MAT_CODE` = m.`MAT_CODE`,`MAT_NAME` = m.`MAT_NAME`,' +
      '`MAT_TYPE` = m.`MAT_TYPE`,`UNIT_ID` = m.`UNIT_ID`,`BASE` = m.`BASE`';
    FQuery.ExecSQL;
    FQuery.SQL.Text :=
      'Insert into mechanizm (`MECHANIZM_ID`,`MECH_CODE`,`MECH_NAME`,`UNIT_ID`,' +
      '`DESCRIPTION`,`MECH_PH`,`TYPE_MEH_SMEN_HOUR`,`BASE`) ' +
      'Select `MECHANIZM_ID`,`MECH_CODE`,`MECH_NAME`,`UNIT_ID`,`DESCRIPTION`,' +
      '`MECH_PH`,`TYPE_MEH_SMEN_HOUR`,`BASE` ' +
      'from mechanizm_tmp m where `BASE` = 1 ' +
      'On DUPLICATE KEY UPDATE `MECH_CODE` = m.`MECH_CODE`,' +
      '`MECH_NAME` = m.`MECH_NAME`,`UNIT_ID` = m.`UNIT_ID`,' +
      '`DESCRIPTION` = m.`DESCRIPTION`,`MECH_PH` = m.`MECH_PH`,' +
      '`TYPE_MEH_SMEN_HOUR` = m.`TYPE_MEH_SMEN_HOUR`,`BASE` = m.`BASE`';
    FQuery.ExecSQL;
    FQuery.SQL.Text :=
      'Insert into devices (`DEVICE_ID`,`DEVICE_CODE1`,`DEVICE_CODE2`,`NAME`,' +
      '`UNIT`,`BASE`) ' +
      'Select `DEVICE_ID`,`DEVICE_CODE1`,`DEVICE_CODE2`,`NAME`,`UNIT`,`BASE` ' +
      'from devices_tmp d where `BASE` = 1 ' +
      'On DUPLICATE KEY UPDATE `DEVICE_CODE1` = d.`DEVICE_CODE1`,' +
      '`DEVICE_CODE2` = d.`DEVICE_CODE2`,`NAME` = d.`NAME`,' +
      '`UNIT` = d.`UNIT`,`BASE` = d.`BASE`';
    FQuery.ExecSQL;
    FQuery.SQL.Text :=
      'Insert into units (`UNIT_ID`,`UNIT_NAME`,`UNIT_FULL_NAME`,`BASE`) ' +
      'Select `UNIT_ID`,`UNIT_NAME`,`UNIT_FULL_NAME`,`BASE` ' +
      'from units_tmp u where `BASE` = 1 ' +
      'On DUPLICATE KEY UPDATE `UNIT_NAME` = u.`UNIT_NAME`, ' +
      '`UNIT_FULL_NAME` = u.`UNIT_FULL_NAME`,`BASE` = u.`BASE`';
    FQuery.ExecSQL;
    FQuery.SQL.Text :=
      'Insert into normativg (`SORT_NUM`,`NORMATIV_ID`,`NORM_NUM`,' +
      '`NORM_CAPTION`,`UNIT_ID`,`NORM_ACTIVE`,`date_beginer`,`date_end`,`prikaz`,' +
      '`normativ_directory_id`,`NORM_BASE`,`NORM_TYPE`,`work_id`,`ZNORMATIVS_ID`) ' +
      'Select `SORT_NUM`,`NORMATIV_ID`,`NORM_NUM`,' +
      '`NORM_CAPTION`,`UNIT_ID`,`NORM_ACTIVE`,`date_beginer`,`date_end`,`prikaz`,' +
      '`normativ_directory_id`,`NORM_BASE`,`NORM_TYPE`,`work_id`,`ZNORMATIVS_ID`' +
      'from normativg_tmp n where `NORM_BASE` = 1 ' +
      'On DUPLICATE KEY UPDATE `SORT_NUM` = n.`SORT_NUM`,`NORM_NUM` = n.`NORM_NUM`,' +
      '`NORM_CAPTION` = n.`NORM_CAPTION`,`UNIT_ID` = n.`UNIT_ID`,' +
      '`NORM_ACTIVE` = n.`NORM_ACTIVE`,`date_beginer` = n.`date_beginer`,' +
      '`date_end` = n.`date_end`,`prikaz` = n.`prikaz`,' +
      '`normativ_directory_id` = n.`normativ_directory_id`,' +
      '`NORM_BASE` = n.`NORM_BASE`,`NORM_TYPE` = n.`NORM_TYPE`,' +
      '`work_id` = n.`work_id`,`ZNORMATIVS_ID` = n.`ZNORMATIVS_ID`';
    FQuery.ExecSQL;
    FQuery.SQL.Text :=
      'Insert into materialnorm (`ID`,`NORMATIV_ID`,`MATERIAL_ID`,`NORM_RAS`,' +
      '`TO_YEAR`,`DATE_BEG`,`DATE_END`,`BASE`) ' +
      'Select `ID`,`NORMATIV_ID`,`MATERIAL_ID`,`NORM_RAS`, ' +
      '`TO_YEAR`,`DATE_BEG`,`DATE_END`,`BASE` from materialnorm_tmp m where `BASE` = 1 ' +
      'On DUPLICATE KEY UPDATE `NORMATIV_ID` = m.`NORMATIV_ID`,' +
      '`MATERIAL_ID` = m.`MATERIAL_ID`,`NORM_RAS` = m.`NORM_RAS`,' +
      '`TO_YEAR` = m.`TO_YEAR`,`DATE_BEG` = m.`DATE_BEG`,' +
      '`DATE_END` = m.`DATE_END`,`BASE` = m.`BASE`';
    FQuery.ExecSQL;
    FQuery.SQL.Text :=
      'Insert into mechanizmnorm (`ID`,`NORMATIV_ID`,`MECHANIZM_ID`,`NORM_RAS`,' +
      '`DATE_BEG`,`DATE_END`,`BASE`) ' +
      'Select `ID`,`NORMATIV_ID`,`MECHANIZM_ID`,`NORM_RAS`, ' +
      '`DATE_BEG`,`DATE_END`,`BASE` from mechanizmnorm_tmp m where `BASE` = 1 ' +
      'On DUPLICATE KEY UPDATE `NORMATIV_ID` = m.`NORMATIV_ID`,' +
      '`MECHANIZM_ID` = m.`MECHANIZM_ID`,`NORM_RAS` = m.`NORM_RAS`,' +
      '`DATE_BEG` = m.`DATE_BEG`,`DATE_END` = m.`DATE_END`,`BASE` = m.`BASE`';
    FQuery.ExecSQL;
    FQuery.SQL.Text :=
      'Insert into normativwork (`ID`,`NORMATIV_ID`,`WORK_ID`,`NORMA`,`DATE_BEG`,' +
      '`DATE_END`,`BASE`) ' +
      'Select `ID`,`NORMATIV_ID`,`WORK_ID`,`NORMA`,`DATE_BEG`,`DATE_END`,`BASE` ' +
      'from normativwork_tmp n where `BASE` = 1 ' +
      'On DUPLICATE KEY UPDATE `NORMATIV_ID` = n.`NORMATIV_ID`,' +
      '`WORK_ID` = n.`WORK_ID`,`WORK_ID` = n.`WORK_ID`,' +
      '`NORMA` = n.`NORMA`,`DATE_BEG` = n.`DATE_BEG`,' +
      '`DATE_END` = n.`DATE_END`,`BASE` = n.`BASE`';
    FQuery.ExecSQL;

    FQuery.SQL.Text := 'DROP TABLE material_tmp';
    FQuery.ExecSQL;
    FQuery.SQL.Text := 'DROP TABLE mechanizm_tmp';
    FQuery.ExecSQL;
    FQuery.SQL.Text := 'DROP TABLE devices_tmp';
    FQuery.ExecSQL;
    FQuery.SQL.Text := 'DROP TABLE units_tmp';
    FQuery.ExecSQL;
    FQuery.SQL.Text := 'DROP TABLE normativg_tmp';
    FQuery.ExecSQL;
    FQuery.SQL.Text := 'DROP TABLE materialnorm_tmp';
    FQuery.ExecSQL;
    FQuery.SQL.Text := 'DROP TABLE mechanizmnorm_tmp';
    FQuery.ExecSQL;
    FQuery.SQL.Text := 'DROP TABLE normativwork_tmp';
    FQuery.ExecSQL;
  except
    on e: Exception do
    begin
      ShowStatys('Error: ' + e.Message, 1);

      raise;
    end;
  end;
end;

{ TCreateMirrorThread }

constructor TCreateMirrorThread.Create(const AMirrorPath, AExeName: string;
  ACurAppVersion: Integer);
begin
  inherited Create(False);
  FMirrorPath := IncludeTrailingPathDelimiter(AMirrorPath);
  FExeName := AExeName;
  FCurAppVersion := ACurAppVersion;

  FLogFile := TLogFile.Create;
  FLogFile.Active := true;

  FLogFile.FileDir := ExtractFilePath(FExeName) + C_LOGDIR;
  FLogFile.FileName := C_UPDATELOG;

  FZipForge := TZipForge.Create(nil);
end;

destructor TCreateMirrorThread.Destroy;
begin
  FreeAndNil(FZipForge);
  FreeAndNil(FLogFile);
  inherited;
end;

procedure TCreateMirrorThread.Execute;
var TmpPath,
    TmpName: String;
    TmpFiles: TStringDynArray;
    I: Integer;
begin
  try
    if FMirrorPath = '' then
      Exit;

    if not TDirectory.Exists(FMirrorPath) then
      ForceDirectories(FMirrorPath);

    TmpName := Format(C_UPD_MIRRORNAME, [FCurAppVersion]);

    if TFile.Exists(FMirrorPath + TmpName) then
      Exit;

    TmpPath := ExtractFilePath(FExeName) + C_UPDATEDIR + C_UPDMIRRORTMP;
    //Подготавливаем временну папку
    if TDirectory.Exists(TmpPath) then
      FullRemove(TmpPath);
    try
      TDirectory.CreateDirectory(TmpPath);

      CopyAppTo(ExtractFilePath(FExeName), TmpPath);
      TFile.Delete(TmpPath + С_UPD_INI);

      if Terminated then
        Exit;

      FZipForge.FileName := TmpPath + TmpName;
      FZipForge.Options.CreateDirs := true;
      FZipForge.Options.OverwriteMode := omAlways;
      FZipForge.OpenArchive(fmCreate);
      FZipForge.BaseDir := TmpPath;
      FZipForge.AddFiles('*');
      FZipForge.CloseArchive;

      if Terminated then
        Exit;

      TmpFiles := TDirectory.GetFiles(FMirrorPath, C_UPD_MIRRORMASK,
        TSearchOption.soTopDirectoryOnly);

      for I := Low(TmpFiles) to High(TmpFiles) do
        FullRemove(TmpFiles[i]);

      TFile.Copy(TmpPath + TmpName, FMirrorPath + TmpName);
    finally
      FullRemove(TmpPath);
    end;
  except
    on e: Exception do
    begin
      FLogFile.Add(e.ClassName + ': ' + e.Message, 'CreateMirrorThread');
    end;
  end;
end;

end.
