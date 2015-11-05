unit Tools;

interface

uses DBGrids, Main, Graphics, Winapi.Windows, Winapi.Messages, FireDAC.Comp.Client, Data.DB, System.Variants,
  Vcl.Forms, Vcl.DBCtrls, Vcl.Samples.Spin, JvSpin, JvDBSpinEdit,
  System.Classes, System.SysUtils, ComObj, Vcl.Dialogs, System.UITypes,
  ShellAPI, Vcl.Grids, DataModule, Vcl.StdCtrls, Vcl.Clipbrd, GlobsAndConst, JvDBGrid, FireDAC.Stan.Option,
  FireDAC.Stan.Param, Controls, Vcl.Buttons, Vcl.ComCtrls, VirtualTrees;

// Общий тип классификации форм
type

  TKindForm = (kdNone, kdInsert, kdEdit, kdSelect);

  // Для выноса в паблик некоторых свойств грида
  TMyDBGrid = class(TJvDBGrid)
  public
    property TopRow;
    property DataLink;
  end;

  // класс формы для наследования всех форм
  TSmForm = class(TForm)
    // Процедура стандартной отрисовки таблиц
    procedure DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    // Процедура стандартной сортировки таблиц
    procedure TitleBtnClick(Sender: TObject; ACol: Integer; Field: TField);
    procedure GridResize(Sender: TObject); // Процедура управляет показом скроллов в таблице
  private
    procedure WMUpdateFormStyle(var Mes: TMessage); message WM_UPDATEFORMSTYLE;
    procedure SetStyleForAllComponents(AComponent: TComponent);
  protected
    HintButton: string; // Подсказка в кнопке на панели
    CaptionButton: string; // Название кнопки на панели
    InitParams: Variant; // Входные параметры
    procedure SetComponentStyle(AComponent: TComponent); virtual;
    // Если у формы наследника переопределе конструктор, то все компоненты
    // созданные в нем после вызова inherited не получат новый стиль
    // В этом случае в конце переопределенного конструктора надо вызвать SetFormStyle повторно
    procedure SetFormStyle; virtual;
  public
    FormKind: TKindForm;
    constructor Create(AOwner: TComponent); reintroduce; overload;
    constructor Create(AOwner: TComponent; const AInitParams: Variant); reintroduce; overload;
  end;

  TActivateEvent = procedure(ADataSet: TDataSet; ATag: Integer) of object;

  // Выполнение медленных запросов к базе в отдельном потоке
  TThreadQuery = class(TThread)
  private
    FHandle: HWND;
    FSQLText: string;
    FTag: Integer;

    FOnActivate: TActivateEvent;
    { Private declarations }
  protected
    procedure Execute; override;
  public
    // Свойства не потокобезопасные, записывать можно только когда поток приостановлен
    property SQLText: string read FSQLText write FSQLText;
    property OnActivate: TActivateEvent read FOnActivate write FOnActivate;
    property Tag: Integer read FTag;

    constructor Create(const ASQLText: string; AHandle: HWND; ACreateSuspended: Boolean; ATag: Integer = 0);
  end;

  TSmClipData = class
  private
  public
    SmClipArray: array of TSmClipRec;
    procedure CopyToClipBoard;
    procedure GetFromClipBoard;
  end;

  // Пропорциональная автоширина колонок в таблице
procedure FixDBGridColumnsWidth(const DBGrid: TDBGrid);
// Установка стиля таблицы из формы настроек
procedure LoadDBGridSettings(const DBGrid: TJvDBGrid);
// Процедура рисования чекбокса на гриде
procedure DrawGridCheckBox(Canvas: TCanvas; Rect: TRect; Checked: Boolean);

// Удаление директории с содержимым !!!!Использовать осторожно!!!!!
procedure KillDir(const ADirName: string);
// Запускает процесс и ждет его завершения
function WinExecAndWait(AAppName, ACmdLine: PChar; ATimeout: DWord; var AWaitResult: DWord): Boolean;
// Обновляет итератор, использовать при добавлении, вставке и удалении из сметы
function UpdateIterator(ADestSmID, AIterator, AFromRate: Integer): Integer;

/// Функции работы с БД:
/// ASelectSQL - 'SELECT FIELD FROM TABLE'
/// AExecSQL - 'DELETE FROM TABLE'
/// AParams - VarArrayOf([a,b,c,d...]) || VarArrayOf([]), если запрос без параметров
// Функция быстрого выполнения запроса, возвращает назад единственное полученное значение (Выборка)
function FastSelectSQLOne(const ASelectSQL: string; const AParams: Variant): Variant;
// Функция быстрого выполнения запроса, назад ничего не возвращает (Для обновлений и пр.)
procedure FastExecSQL(const AExecSQL: string; const AParams: Variant);
// Процедура переоткрытия запроса TFDQuery с локейтом на значение Поля[0]
procedure CloseOpen(const Query: TFDQuery; ADisableControls: Boolean = True);
// Функция проверки TDataSet на активность и пустоту
function CheckQrActiveEmpty(const ADataSet: TDataSet): Boolean;
// Функция получения значения из справочника ежемесячных величин
function GetUniDictParamValue(const AParamName: string; const AMonth, AYear: Integer): Variant;
// Функция подсчета итога по датасету. Возвращает вариантный одномерный массив соответствующий набору колонок
function CalcFooterSumm(const Query: TFDQuery): Variant;
// Процедура сортировки для использования в событии TitleBtnClick
procedure DoSort(const Query: TFDQuery; Grid: TJvDBGrid);

function MyFloatToStr(Value: Extended): string;
function MyStrToFloat(Value: string): Extended;
function MyStrToFloatDef(Value: string; DefRes: Extended): Extended;
function MyCurrToStr(Value: Currency): string;
function MyStrToCurr(Value: string): Currency;

// Функция смешания двух цветов
function MixColors(FG, BG: TColor; T: byte): TColor;
// Выполнение командной строки
procedure Exec(AParam: string);
// Функция получения ширины текста в пикселях внутри окна
function GetTextWidth(Text: string; W: HWND): Integer;
// Киляет указанные символы из строки
function StripCharsInSet(s: string; c: TSysCharSet): string;

// "Тихие" операции надо объектами файловой системы
function FullRename(ASource, ATarget: string): Boolean;
function FullCopy(ASource, ATarget: string): Boolean;
function FullRemove(ASource: string): Boolean;

implementation

function FullRename(ASource, ATarget: string): Boolean;
var
  SHFileOpStruct: TSHFileOpStruct;
begin
  FillChar(SHFileOpStruct, SizeOf(TSHFileOpStruct), 0);
  SHFileOpStruct.wFunc := FO_RENAME;
  SHFileOpStruct.pFrom := PChar(ExcludeTrailingPathDelimiter(ASource) + #0);
  SHFileOpStruct.pTo := PChar(ExcludeTrailingPathDelimiter(ATarget) + #0);
  SHFileOpStruct.fFlags := FOF_SILENT or FOF_NOCONFIRMATION or FOF_NOERRORUI;
  Result := SHFileOperation(SHFileOpStruct) = 0;
end;

function FullCopy(ASource, ATarget: string): Boolean;
var
  SHFileOpStruct: TSHFileOpStruct;
begin
  FillChar(SHFileOpStruct, SizeOf(TSHFileOpStruct), 0);
  SHFileOpStruct.wFunc := FO_COPY;
  SHFileOpStruct.pFrom := PChar(ExcludeTrailingPathDelimiter(ASource) + #0);
  SHFileOpStruct.pTo := PChar(ExcludeTrailingPathDelimiter(ATarget) + #0);
  SHFileOpStruct.fFlags := FOF_SILENT or FOF_NOCONFIRMATION or FOF_NOERRORUI;
  Result := SHFileOperation(SHFileOpStruct) = 0;
end;

function FullRemove(ASource: string): Boolean;
var
  SHFileOpStruct: TSHFileOpStruct;
begin
  FillChar(SHFileOpStruct, SizeOf(TSHFileOpStruct), 0);
  SHFileOpStruct.wFunc := FO_DELETE;
  SHFileOpStruct.pFrom := PChar(ExcludeTrailingPathDelimiter(ASource) + #0);
  SHFileOpStruct.fFlags := FOF_SILENT or FOF_NOCONFIRMATION or FOF_NOERRORUI;
  Result := SHFileOperation(SHFileOpStruct) = 0;
end;

function StripCharsInSet(s: string; c: TSysCharSet): string;
var
  i, j: Integer;
begin
  SetLength(Result, Length(s));
  j := 0;
  for i := 1 to Length(s) do
    if not CharInSet(s[i], c) then
    begin
      inc(j);
      Result[j] := s[i];
    end;
  SetLength(Result, j);
end;

function GetTextWidth(Text: string; W: HWND): Integer;
var
  DC: HDC;
  sz: SIZE;
begin
  DC := GetDC(W);
  GetTextExtentPoint32(DC, PChar(Text), Length(Text), sz);
  ReleaseDC(W, DC);
  Result := sz.cx;
end;

function Expand(const AParam: string): string;
var
  buf: array [0 .. $FF] of char;
  SIZE: Integer;
begin
  SIZE := ExpandEnvironmentStrings(PChar(AParam), buf, SizeOf(buf));
  Result := copy(buf, 1, SIZE);
end;

procedure Exec(AParam: string);
begin
  AParam := Expand(AParam);
  ShellExecute(Application.Handle, 'open', PChar(AParam), nil, nil, SW_SHOWMAXIMIZED);
end;

procedure DoSort(const Query: TFDQuery; Grid: TJvDBGrid);
var
  s: string;
  key: Variant;
begin
  try
    if not CheckQrActiveEmpty(Query) then
      Exit;
    s := '';
    key := Query.Fields[0].Value;
    if Grid.SortMarker = smDown then
      s := ' DESC';
    if Grid.SortedField <> '' then
    begin
      // Если сортируем некий код, то буквенные значения всегда выше в списке
      if Grid.SortedField = 'CODE' then
        Query.SQL[Query.SQL.Count - 1] := 'ORDER BY CODE+1,' + Grid.SortedField + s
      else
        Query.SQL[Query.SQL.Count - 1] := 'ORDER BY ' + Grid.SortedField + s
    end
    else
      Query.SQL[Query.SQL.Count - 1] := 'ORDER BY 1';
    Query.Active := True;
    if key <> Null then
      Query.Locate(Query.Fields[0].FieldName, key, []);
  except

  end;
end;

// Выполняет медленный SQL в отдельном потоке
constructor TThreadQuery.Create(const ASQLText: string; AHandle: HWND; ACreateSuspended: Boolean;
  ATag: Integer = 0);
begin
  FHandle := AHandle;
  FTag := ATag;
  FSQLText := ASQLText;
  inherited Create(ACreateSuspended);
end;

procedure TThreadQuery.Execute;
var
  TmpConnect: TFDConnection;
  TmpTrans: TFDTransaction;
  TmpQuery: TFDQuery;
begin
  TmpConnect := nil;
  TmpTrans := nil;
  TmpQuery := nil;
  try
    TmpConnect := TFDConnection.Create(nil);
    TmpConnect.Params.Text := G_CONNECTSTR;

    TmpTrans := TFDTransaction.Create(nil);
    TmpTrans.Connection := TmpConnect;

    TmpQuery := TFDQuery.Create(nil);
    TmpQuery.Connection := TmpConnect;
    TmpQuery.SQL.Text := FSQLText;

    TmpConnect.Connected := True;
    TmpQuery.Active := True;

    if Terminated then
      Exit;

    if FHandle > 0 then
      SendMessage(FHandle, WM_EXCECUTE, WParam(TmpQuery), LParam(FTag));

    if Terminated then
      Exit;

    if Assigned(OnActivate) then
      OnActivate(TmpQuery, FTag);
  finally
    if Assigned(TmpConnect) then
      FreeAndNil(TmpConnect);
    if Assigned(TmpTrans) then
      FreeAndNil(TmpTrans);
    if Assigned(TmpQuery) then
      FreeAndNil(TmpQuery);
  end;
end;

{ TSmClipData }
procedure TSmClipData.CopyToClipBoard;
var
  Data: THandle;
  DataPtr: Pointer;
  i: Integer;
begin
  if Length(SmClipArray) = 0 then
    Exit;

  Data := GlobalAlloc(GMEM_MOVEABLE, SizeOf(Integer) + SizeOf(TSmClipRec) * Length(SmClipArray));
  try
    DataPtr := GlobalLock(Data);
    try
      i := Length(SmClipArray);
      Move(i, DataPtr^, SizeOf(Integer));
      DataPtr := Ptr(Cardinal(DataPtr) + SizeOf(Integer));
      Move(SmClipArray[0], DataPtr^, SizeOf(TSmClipRec) * Length(SmClipArray));
      ClipBoard.SetAsHandle(G_SMETADATA, Data);
    finally
      GlobalUnlock(Data);
    end;
  except
    GlobalFree(Data);
    raise;
  end;
end;

procedure TSmClipData.GetFromClipBoard;
var
  Data: THandle;
  DataPtr: Pointer;
  i: Integer;
begin
  Data := ClipBoard.GetAsHandle(G_SMETADATA);
  if Data = 0 then
    Exit;
  DataPtr := GlobalLock(Data);
  try
    Move(DataPtr^, i, SizeOf(Integer));
    SetLength(SmClipArray, i);
    if i = 0 then
      Exit;
    DataPtr := Ptr(Cardinal(DataPtr) + SizeOf(Integer));
    Move(DataPtr^, SmClipArray[0], SizeOf(TSmClipRec) * Length(SmClipArray));
  finally
    GlobalUnlock(Data);
  end;
end;

function FastSelectSQLOne(const ASelectSQL: string; const AParams: Variant): Variant;
var
  qr: TFDQuery;
  i: Integer;
begin
  Result := Null;
  qr := TFDQuery.Create(nil);
  try
    // Получаем только 1 запись
    qr.FetchOptions.AutoFetchAll := afDisable;
    qr.FetchOptions.RowsetSize := 1;
    qr.Connection := DM.Connect;
    qr.UpdateTransaction := DM.Write;
    qr.Transaction := DM.Read;
    qr.SQL.Text := ASelectSQL;
    if VarArrayHighBound(AParams, 1) <> (qr.ParamCount - 1) then
    begin
      ShowMessage('Передано неверное число параметров!');
      Exit;
    end;
    // Заполняем запрос параметрами
    for i := 0 to qr.ParamCount - 1 do
      qr.Params.Items[i].Value := AParams[i];
    qr.Active := True;
    qr.First;
    if qr.FieldCount > 0 then
      Result := qr.Fields[0].Value;
    qr.Active := False;
  finally
    FreeAndNil(qr);
  end;
end;

procedure FastExecSQL(const AExecSQL: string; const AParams: Variant);
var
  qr: TFDQuery;
  i: Integer;
begin
  qr := TFDQuery.Create(nil);
  try
    qr.Connection := DM.Connect;
    qr.UpdateTransaction := DM.Write;
    qr.Transaction := DM.Read;
    qr.SQL.Text := AExecSQL;
    if VarArrayHighBound(AParams, 1) <> (qr.ParamCount - 1) then
    begin
      ShowMessage('Передано неверное число параметров!');
      Exit;
    end;
    // Заполняем запрос параметрами
    for i := 0 to qr.ParamCount - 1 do
      qr.Params.Items[i].Value := AParams[i];
    qr.ExecSQL;
  finally
    FreeAndNil(qr);
  end;
end;

// Запускает приложение и ожидает его завершения
function WinExecAndWait(AAppName, ACmdLine: PChar; ATimeout: DWord; var AWaitResult: DWord): Boolean;
var
  ProcInf: TProcessInformation;
  Start: TStartupInfo;
begin
  FillChar(Start, SizeOf(TStartupInfo), 0);
  with Start do
  begin
    cb := SizeOf(TStartupInfo);
    dwFlags := STARTF_USESHOWWINDOW;
    wShowWindow := SW_HIDE;
  end;

  Result := CreateProcess(AAppName, ACmdLine, nil, nil, False, NORMAL_PRIORITY_CLASS, nil, nil,
    Start, ProcInf);

  if ATimeout = 0 then
    ATimeout := INFINITE;

  AWaitResult := WaitForSingleObject(ProcInf.hProcess, ATimeout);

  // В любом случае идет попытка унитожения процесса
  TerminateProcess(ProcInf.hProcess, 0);

  CloseHandle(ProcInf.hProcess);
  CloseHandle(ProcInf.hThread);
end;

// Удаление директории с содержимым
procedure KillDir(const ADirName: string);
var
  FileFolderOperation: TSHFileOpStruct;
begin
  FillChar(FileFolderOperation, SizeOf(FileFolderOperation), 0);
  FileFolderOperation.wFunc := FO_DELETE;
  FileFolderOperation.pFrom := PChar(ExcludeTrailingPathDelimiter(ADirName) + #0);
  FileFolderOperation.fFlags := FOF_SILENT or FOF_NOERRORUI or FOF_NOCONFIRMATION;
  SHFileOperation(FileFolderOperation);
end;

function CheckQrActiveEmpty(const ADataSet: TDataSet): Boolean;
begin
  Result := True;
  if not ADataSet.Active or ADataSet.IsEmpty then
    Result := False;
end;

procedure CloseOpen(const Query: TFDQuery; ADisableControls: Boolean = True);
var
  key: Variant;
  // E: TDataSetNotifyEvent;
begin
  // E := Query.AfterScroll;
  if ADisableControls then
    Query.DisableControls;
  try
    // Query.AfterScroll := nil;
    key := Null;
    if CheckQrActiveEmpty(Query) then
      key := Query.Fields[0].Value;
    Query.Active := False;
    Query.Active := True;
    if key <> Null then
      Query.Locate(Query.Fields[0].FieldName, key, []);
  finally
    // Query.AfterScroll := E;
    if ADisableControls then
      Query.EnableControls;
  end;
end;

function CalcFooterSumm(const Query: TFDQuery): Variant;
var
  key: Variant;
  e: TDataSetNotifyEvent;
  Res: Variant;
  i: Integer;
begin
  Result := Null;
  if not CheckQrActiveEmpty(Query) then
    Exit;

  e := Query.AfterScroll;
  Query.DisableControls;
  try
    // Выключаем событие на всякий случай
    Query.AfterScroll := nil;
    key := Null;
    if CheckQrActiveEmpty(Query) then
      key := Query.Fields[0].Value;
    // Создаем массив возвращаемых значений
    Res := VarArrayCreate([0, Query.FieldCount - 1], varDouble);
    // Инициализируем начальными значениями
    for i := 0 to Query.FieldCount - 1 do
      Res[i] := 0;

    Query.First;
    while not Query.Eof do
    begin
      for i := 0 to Query.FieldCount - 1 do
        if (Query.Fields[i].DataType in [ftInteger, ftFloat, ftBCD, ftFMTBcd, ftLargeint]) and
          not(VarIsNull(Query.Fields[i].Value)) then
          Res[i] := Res[i] + Query.Fields[i].AsFloat;
      Query.Next;
    end;

    if key <> Null then
      Query.Locate(Query.Fields[0].FieldName, key, []);
    Result := Res;
  finally
    Query.AfterScroll := e;
    Query.EnableControls;
  end;
end;

// Пропорциональная автоширина колонок в таблице
procedure FixDBGridColumnsWidth(const DBGrid: TDBGrid);
const
  MIN_WHIDTH = 10;
var
  i: Integer;
  TotWidth: Integer;
  VarWidth: Integer;
  ResizableColumnCount: Integer;
  AColumn: TColumn;
begin
  TotWidth := 0;
  ResizableColumnCount := 0;

  for i := 0 to -1 + DBGrid.Columns.Count do
  begin
    TotWidth := TotWidth + DBGrid.Columns[i].Width;
    // if DBGrid.Columns[i].Field.Tag <> 0 then
    inc(ResizableColumnCount);
  end;

  if dgColLines in DBGrid.Options then
    TotWidth := TotWidth + DBGrid.Columns.Count;

  // add indicator column width
  if dgIndicator in DBGrid.Options then
    TotWidth := TotWidth + IndicatorWidth;

  VarWidth := DBGrid.ClientWidth - TotWidth;

  if ResizableColumnCount > 0 then
    VarWidth := VarWidth div ResizableColumnCount;

  for i := 0 to -1 + DBGrid.Columns.Count do
  begin
    AColumn := DBGrid.Columns[i];
    // if AColumn.Field.Tag <> 0 then
    begin
      AColumn.Width := AColumn.Width + VarWidth;
      if AColumn.Width < MIN_WHIDTH then
        AColumn.Width := MIN_WHIDTH;
    end;
  end;
end;

// Установка стиля таблицы из формы настроек
procedure LoadDBGridSettings(const DBGrid: TJvDBGrid);
begin
  DBGrid.DrawingStyle := gdsClassic;
  DBGrid.FixedColor := PS.BackgroundHead;
  DBGrid.TitleFont.Color := PS.FontHead;
  DBGrid.Color := PS.BackgroundRows;
  DBGrid.Font.Color := PS.FontRows;
  DBGrid.SelectColumn := scGrid;
  DBGrid.TitleArrow := True;
  DBGrid.TitleButtons := True;
  DBGrid.ShowCellHint := True;
  DBGrid.ShowHint := True;
  if PS.GridFontName <> '' then
  begin
    DBGrid.Font.Name := PS.GridFontName;
    DBGrid.TitleFont.Name := PS.GridFontName;
  end;
  if PS.GridFontSize <> 0 then
  begin
    DBGrid.Font.SIZE := PS.GridFontSize;
    DBGrid.TitleFont.SIZE := PS.GridFontSize;
  end;
  DBGrid.Font.Style := TFontStyles(PS.GridFontStyle);
  DBGrid.TitleFont.Style := TFontStyles(PS.GridFontStyle);
  // DBGrid.ShowTitleHint := True;
  DBGrid.SelectColumnsDialogStrings.NoSelectionWarning := 'Должна быть выбрана хотя бы одна колонка!';
  DBGrid.SelectColumnsDialogStrings.Caption := 'Настройка видимости колонок';
end;

// Процедури рисования чекбокса на гриде
procedure DrawGridCheckBox(Canvas: TCanvas; Rect: TRect; Checked: Boolean);
var
  DrawFlags: Integer;
begin
  Canvas.TextRect(Rect, Rect.Left + 1, Rect.Top + 1, ' ');
  DrawFrameControl(Canvas.Handle, Rect, DFC_BUTTON, DFCS_BUTTONPUSH or DFCS_ADJUSTRECT);
  DrawFlags := DFCS_BUTTONCHECK or DFCS_ADJUSTRECT; // DFCS_BUTTONCHECK
  if Checked then
    DrawFlags := DrawFlags or DFCS_CHECKED;
  DrawFrameControl(Canvas.Handle, Rect, DFC_BUTTON, DrawFlags);
end;

function MyFloatToStr(Value: Extended): string;
var
  DS: char;
begin
  DS := FormatSettings.DecimalSeparator;
  try
    FormatSettings.DecimalSeparator := '.';
    Result := FloatToStr(Value);
  finally
    FormatSettings.DecimalSeparator := DS;
  end;
end;

function MyStrToFloat(Value: string): Extended;
var
  DS: char;
begin
  DS := FormatSettings.DecimalSeparator;
  try
    FormatSettings.DecimalSeparator := '.';
    if not TextToFloat(Value, Result, FormatSettings) then
    begin
      FormatSettings.DecimalSeparator := ',';
      Result := StrToFloat(Value);
    end;
  finally
    FormatSettings.DecimalSeparator := DS;
  end;
end;

function MyCurrToStr(Value: Currency): string;
var
  DS: char;
begin
  DS := FormatSettings.DecimalSeparator;
  try
    FormatSettings.DecimalSeparator := '.';
    Result := CurrToStr(Value);
  finally
    FormatSettings.DecimalSeparator := DS;
  end;
end;

function MyStrToCurr(Value: string): Currency;
var
  DS: char;
begin
  DS := FormatSettings.DecimalSeparator;
  try
    FormatSettings.DecimalSeparator := '.';
    if not TextToFloat(Value, Result, FormatSettings) then
    begin
      FormatSettings.DecimalSeparator := ',';
      Result := StrToCurr(Value);
    end;
  finally
    FormatSettings.DecimalSeparator := DS;
  end;
end;

function MyStrToFloatDef(Value: string; DefRes: Extended): Extended;
var
  DS: char;
begin
  DS := FormatSettings.DecimalSeparator;
  try
    FormatSettings.DecimalSeparator := '.';
    if not TextToFloat(Value, Result, FormatSettings) then
    begin
      FormatSettings.DecimalSeparator := ',';
      if not TextToFloat(Value, Result, FormatSettings) then
        Result := DefRes;
    end;
  finally
    FormatSettings.DecimalSeparator := DS;
  end;
end;

function GetUniDictParamValue(const AParamName: string; const AMonth, AYear: Integer): Variant;
begin
  Result := FastSelectSQLOne('SELECT `FN_getParamValue`(:inPARAM_CODE, :inMONTH, :inYEAR)',
    VarArrayOf([AParamName, AMonth, AYear]));
end;

function UpdateIterator(ADestSmID, AIterator, AFromRate: Integer): Integer;
begin
  Result := FastSelectSQLOne('Select UpdateIterator(:IdEstimate, :AIterator, :AFromRate)',
    VarArrayOf([ADestSmID, AIterator, AFromRate]));
end;

function MixColors(FG, BG: TColor; T: byte): TColor;
  function MixBytes(FG, BG, TRANS: byte): byte;
  begin
    Result := round(BG + (FG - BG) / 255 * TRANS);
  end;

var
  r, g, b: byte;
begin
  r := MixBytes(FG and 255, BG and 255, T); // extracting and mixing Red
  g := MixBytes((FG shr 8) and 255, (BG shr 8) and 255, T); // the same with green
  b := MixBytes((FG shr 16) and 255, (BG shr 16) and 255, T); // and blue, of course
  Result := r + g * 256 + b * 65536; // finishing with combining all channels together
end;

{ TSmForm }

// procedure TSmForm.FormCreate(Sender: TObject);
constructor TSmForm.Create(AOwner: TComponent; const AInitParams: Variant);
begin
  InitParams := AInitParams; // Инициализационные параметны
  inherited Create(AOwner);
  SetFormStyle;
end;

constructor TSmForm.Create(AOwner: TComponent);
begin
  Create(AOwner, Null);
end;

procedure TSmForm.SetFormStyle;
begin
  Self.ShowHint := True;
  SetStyleForAllComponents(Self);
end;

procedure TSmForm.SetStyleForAllComponents(AComponent: TComponent);
var
  i: Integer;
begin
  for i := 0 to AComponent.ComponentCount - 1 do
  begin
    SetComponentStyle(AComponent.Components[i]);
    SetStyleForAllComponents(AComponent.Components[i]);
  end;
end;

procedure TSmForm.TitleBtnClick(Sender: TObject; ACol: Integer; Field: TField);
var
  s: string;
  i: Integer;
begin
  if not CheckQrActiveEmpty(TFDQuery((Sender AS TJvDBGrid).DataSource.DataSet)) then
    Exit;

  // Если заводом установлена "своя" сортировка, то не лезем...)
  if not(dgTitleClick in (Sender AS TJvDBGrid).Options) then
    Exit;

  // Если выбранное поле не из набора, а расчетное или другое, то выходим...
  if TFDQuery((Sender AS TJvDBGrid).DataSource.DataSet).FieldByName((Sender AS TJvDBGrid).SortedField)
    .FieldKind <> fkData then
    Exit;

  s := '';
  if (Sender AS TJvDBGrid).SortMarker = smDown then
    s := ' DESC';

  // Пытаемся найти строку с запросом сортировки
  for i := TFDQuery((Sender AS TJvDBGrid).DataSource.DataSet).SQL.Count - 1 downto 0 do
  begin
    if Pos(UpperCase('order by'), UpperCase(TFDQuery((Sender AS TJvDBGrid).DataSource.DataSet).SQL[i])) <> 0
    then
    begin
      // Строка найдена
      TFDQuery((Sender AS TJvDBGrid).DataSource.DataSet).SQL[i] := 'ORDER BY ' + (Sender AS TJvDBGrid)
        .SortedField + s;
      CloseOpen(TFDQuery((Sender AS TJvDBGrid).DataSource.DataSet));
      Exit;
    end;
  end;

  TFDQuery((Sender AS TJvDBGrid).DataSource.DataSet)
    .SQL.Append('ORDER BY ' + (Sender AS TJvDBGrid).SortedField + s);
  CloseOpen(TFDQuery((Sender AS TJvDBGrid).DataSource.DataSet));
end;

procedure TSmForm.DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  headerLines: Integer;
begin
  // Процедура наложения стилей отрисовки таблиц по умолчанию
  with (Sender AS TJvDBGrid).Canvas do
  begin
    Brush.Color := PS.BackgroundRows;
    Font.Color := PS.FontRows;

    headerLines := 1;
    if not(dgTitles in (Sender AS TJvDBGrid).Options) then
      headerLines := 0;

    // Строка в фокусе
    if (Assigned(TMyDBGrid((Sender AS TJvDBGrid)).DataLink) and
      ((Sender AS TJvDBGrid).Row = TMyDBGrid((Sender AS TJvDBGrid)).DataLink.ActiveRecord + headerLines)) then
    begin
      Brush.Color := PS.BackgroundSelectRow;
      Font.Color := PS.FontSelectRow;
    end;
    // Ячейка в фокусе
    if (gdSelected in State) then
    begin
      Brush.Color := PS.BackgroundSelectCell;
      Font.Color := PS.FontSelectCell;
      Font.Style := Font.Style + [fsBold];
    end;
  end;
  (Sender AS TJvDBGrid).DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TSmForm.GridResize(Sender: TObject);
begin
  {
    if (Sender AS TJvDBGrid).DataSource.DataSet.RecordCount > (Sender AS TJvDBGrid).VisibleRowCount then
    (Sender AS TJvDBGrid).ScrollBars := ssBoth
    else
    (Sender AS TJvDBGrid).ScrollBars := ssHorizontal;
  }
end;

procedure TSmForm.SetComponentStyle(AComponent: TComponent);
begin
  // Настройка кнопок -->
  if AComponent is TButton then
  begin
    // Меняем стили только там, где не изменены - приводит к обяз. перезапуску программы
    // if (TButton(AComponent).Font.Name = 'Tahoma') and (TButton(AComponent).Font.SIZE = 8) and
    // (TButton(AComponent).Font.Style = TFontStyles(0)) then
    // begin
    if PS.ControlsFontName <> '' then
      TButton(AComponent).Font.Name := PS.ControlsFontName;
    if PS.ControlsFontSize <> 0 then
      TButton(AComponent).Font.SIZE := PS.ControlsFontSize;
    TButton(AComponent).Font.Style := TFontStyles(PS.ControlsFontStyle);
    // end;
    if TButton(AComponent).Hint = '' then
      TButton(AComponent).Hint := TButton(AComponent).Caption;
    TButton(AComponent).ShowHint := True;
  end
  else if AComponent is TSpeedButton then
  begin
    if PS.ControlsFontName <> '' then
      TSpeedButton(AComponent).Font.Name := PS.ControlsFontName;
    if PS.ControlsFontSize <> 0 then
      TSpeedButton(AComponent).Font.SIZE := PS.ControlsFontSize;
    TSpeedButton(AComponent).Font.Style := TFontStyles(PS.ControlsFontStyle);
    if TSpeedButton(AComponent).Hint = '' then
      TSpeedButton(AComponent).Hint := TSpeedButton(AComponent).Caption;
    TSpeedButton(AComponent).ShowHint := True;
  end
  else if AComponent is TBitBtn then
  begin
    if PS.ControlsFontName <> '' then
      TBitBtn(AComponent).Font.Name := PS.ControlsFontName;
    if PS.ControlsFontSize <> 0 then
      TBitBtn(AComponent).Font.SIZE := PS.ControlsFontSize;
    TBitBtn(AComponent).Font.Style := TFontStyles(PS.ControlsFontStyle);
    if TBitBtn(AComponent).Hint = '' then
      TBitBtn(AComponent).Hint := TBitBtn(AComponent).Caption;
    TBitBtn(AComponent).ShowHint := True;
  end
  // <--
  // Настройка таблиц и списков -->
  else if AComponent is TListView then
  begin
    if PS.ControlsFontName <> '' then
      TListView(AComponent).Font.Name := PS.GridFontName;
    if PS.ControlsFontSize <> 0 then
      TListView(AComponent).Font.SIZE := PS.GridFontSize;
    TListView(AComponent).Font.Style := TFontStyles(PS.GridFontStyle);
  end
  else if AComponent is TStringGrid then
  begin
    if PS.ControlsFontName <> '' then
      TStringGrid(AComponent).Font.Name := PS.GridFontName;
    if PS.ControlsFontSize <> 0 then
      TStringGrid(AComponent).Font.SIZE := PS.GridFontSize;
    TStringGrid(AComponent).Font.Style := TFontStyles(PS.GridFontStyle);
  end
  else if AComponent is TVirtualStringTree then
  begin
    if PS.ControlsFontName <> '' then
    begin
      TVirtualStringTree(AComponent).Font.Name := PS.GridFontName;
      TVirtualStringTree(AComponent).Header.Font.Name := PS.GridFontName;
    end;
    if PS.ControlsFontSize <> 0 then
    begin
      TVirtualStringTree(AComponent).Font.SIZE := PS.GridFontSize;
      TVirtualStringTree(AComponent).Header.Font.SIZE := PS.GridFontSize;
    end;
    TVirtualStringTree(AComponent).Font.Style := TFontStyles(PS.GridFontStyle);
    TVirtualStringTree(AComponent).Header.Font.Style := TFontStyles(PS.GridFontStyle);

    TVirtualStringTree(AComponent).Colors.SelectionTextColor := PS.FontSelectCell;

    TVirtualStringTree(AComponent).Colors.UnfocusedSelectionColor := PS.SelectRowUnfocusedTable;
    TVirtualStringTree(AComponent).Colors.UnfocusedSelectionBorderColor := PS.SelectRowUnfocusedTable;

    TVirtualStringTree(AComponent).Colors.FocusedSelectionColor := PS.BackgroundSelectCell;
    TVirtualStringTree(AComponent).Colors.FocusedSelectionBorderColor := PS.BackgroundSelectCell;
  end
  else if AComponent is TJvDBGrid then
  begin
    LoadDBGridSettings(TJvDBGrid(AComponent));
    if not Assigned(TJvDBGrid(AComponent).OnDrawColumnCell) then
      TJvDBGrid(AComponent).OnDrawColumnCell := DrawColumnCell;
    if not Assigned(TJvDBGrid(AComponent).OnResize) then
      TJvDBGrid(AComponent).OnResize := GridResize;
    if not(Assigned(TJvDBGrid(AComponent).OnTitleBtnClick)) and (dgTitleClick in TJvDBGrid(AComponent).Options)
    then
      TJvDBGrid(AComponent).OnTitleBtnClick := TitleBtnClick;
  end
  // <--
  // Настройка полей ввода/вывода -->
  else if AComponent is TEdit then
  begin
    if PS.TextFontName <> '' then
      TEdit(AComponent).Font.Name := PS.TextFontName;
    if PS.TextFontSize <> 0 then
      TEdit(AComponent).Font.SIZE := PS.TextFontSize;
    TEdit(AComponent).Font.Style := TFontStyles(PS.TextFontStyle);
  end
  else if AComponent is TDBEdit then
  begin
    if PS.TextFontName <> '' then
      TDBEdit(AComponent).Font.Name := PS.TextFontName;
    if PS.TextFontSize <> 0 then
      TDBEdit(AComponent).Font.SIZE := PS.TextFontSize;
    TDBEdit(AComponent).Font.Style := TFontStyles(PS.TextFontStyle);
  end
  else if AComponent is TMemo then
  begin
    if PS.TextFontName <> '' then
      TMemo(AComponent).Font.Name := PS.TextFontName;
    if PS.TextFontSize <> 0 then
      TMemo(AComponent).Font.SIZE := PS.TextFontSize;
    TMemo(AComponent).Font.Style := TFontStyles(PS.TextFontStyle);
  end
  else if AComponent is TDBMemo then
  begin
    if PS.TextFontName <> '' then
      TDBMemo(AComponent).Font.Name := PS.TextFontName;
    if PS.TextFontSize <> 0 then
      TDBMemo(AComponent).Font.SIZE := PS.TextFontSize;
    TDBMemo(AComponent).Font.Style := TFontStyles(PS.TextFontStyle);
  end
  else if AComponent is TComboBox then
  begin
    if PS.TextFontName <> '' then
      TComboBox(AComponent).Font.Name := PS.TextFontName;
    if PS.TextFontSize <> 0 then
      TComboBox(AComponent).Font.SIZE := PS.TextFontSize;
    TComboBox(AComponent).Font.Style := TFontStyles(PS.TextFontStyle);
  end
  else if AComponent is TDBLookupComboBox then
  begin
    if PS.TextFontName <> '' then
      TDBLookupComboBox(AComponent).Font.Name := PS.TextFontName;
    if PS.TextFontSize <> 0 then
      TDBLookupComboBox(AComponent).Font.SIZE := PS.TextFontSize;
    TDBLookupComboBox(AComponent).Font.Style := TFontStyles(PS.TextFontStyle);
  end
  else if AComponent is TSpinEdit then
  begin
    if PS.TextFontName <> '' then
      TSpinEdit(AComponent).Font.Name := PS.TextFontName;
    if PS.TextFontSize <> 0 then
      TSpinEdit(AComponent).Font.SIZE := PS.TextFontSize;
    TSpinEdit(AComponent).Font.Style := TFontStyles(PS.TextFontStyle);
  end
  else if AComponent is TJvDBSpinEdit then
  begin
    if PS.TextFontName <> '' then
      TJvDBSpinEdit(AComponent).Font.Name := PS.TextFontName;
    if PS.TextFontSize <> 0 then
      TJvDBSpinEdit(AComponent).Font.SIZE := PS.TextFontSize;
    TJvDBSpinEdit(AComponent).Font.Style := TFontStyles(PS.TextFontStyle);
  end
  else if AComponent is TJvSpinEdit then
  begin
    if PS.TextFontName <> '' then
      TJvSpinEdit(AComponent).Font.Name := PS.TextFontName;
    if PS.TextFontSize <> 0 then
      TJvSpinEdit(AComponent).Font.SIZE := PS.TextFontSize;
    TJvSpinEdit(AComponent).Font.Style := TFontStyles(PS.TextFontStyle);
  end
  else if AComponent is TDateTimePicker then
  begin
    if PS.TextFontName <> '' then
      TDateTimePicker(AComponent).Font.Name := PS.TextFontName;
    if PS.TextFontSize <> 0 then
      TDateTimePicker(AComponent).Font.SIZE := PS.TextFontSize;
    TDateTimePicker(AComponent).Font.Style := TFontStyles(PS.TextFontStyle);
  end
  // <--
end;

procedure TSmForm.WMUpdateFormStyle(var Mes: TMessage);
begin
  SetFormStyle;
end;

initialization

// Регистрируем собственный формат для буфера обмена
G_SMETADATA := RegisterClipBoardFormat(C_SMETADATA);

end.
