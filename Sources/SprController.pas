unit SprController;

interface
uses System.Classes,
     System.SysUtils,
     Winapi.Windows,
     System.SyncObjs,
     Generics.Collections,
     Generics.Defaults,
     Data.DB,
     GlobsAndConst,
     Tools;

//Вспомогательные потоки используют синхронную процедуру SendMessage
//что приводит к дедлоку когда основной поток вынужден дожидаться завершения
//вспомогательного, для решения используется Application.ProgressMessage;
//это криво, надо переделать на разделяемый буфер вместо SendMessage и Synhronize
const
  CMatIndex = 0;
  CJBIIndex = 1;
  CMechIndex = 2;
  CDevIndex = 3;
  MaxSprIndex = 3;

type
  TSprRecord = record
    ID: Integer;
    Code,
    Name,
    Unt: string;
    CoastNDS,
    CoastNoNDS,
    ZpMach,
    TrZatr: Extended;
    Manual: Boolean;
  end;

  PSprRecord = ^TSprRecord;

  TSprPeriad = record
    Year,
    Month,
    Region: Integer;
  end;

  TSprArray = array of TSprRecord;
  TSprArrayEx = TList<PSprRecord>;

  //Класс использует потоки но не является потокобезопасным
  //Доступ к справочникам возможет только просле проверки флагов загрузки
  TSprControl = class(TObject)
  private
    FHandle: HWND;
    FAllSprList: array[0..MaxSprIndex] of TSprArrayEx;
    FLoadSprFlags,
    FLoadPriceFlags: array[0..MaxSprIndex] of Boolean;
    FThQueryList: array[0..MaxSprIndex] of TThreadQuery;
    FSprPeriodList: array[0..MaxSprIndex] of TSprPeriad;

    FNotifyCS: TCriticalSection;

    FSprNotifyList,
    FPriceNotifyList: array[0..MaxSprIndex] of array of HWND;

    procedure ThreadTerminate(Sender: TObject);
    procedure LoadSpr(ADataSet: TDataSet; AIndex: Integer);
    procedure LoadPrice(ADataSet: TDataSet; AIndex: Integer);
    procedure AddHeaderToException(AException: Exception; AIndex: Integer);

    procedure CheckIndex(AIndex: Integer);

    function GetSprList(AIndex: Integer): TSprArrayEx;
    function GetSprCount(AIndex: Integer): Integer;
    function GetSptLoad(AIndex: Integer): Boolean;
    function GetPriceLoad(AIndex: Integer): Boolean;
    function GetYear(AIndex: Integer): Integer;
    function GetMonth(AIndex: Integer): Integer;
    function GetRegion(AIndex: Integer): Integer;
  public
    constructor Create(AHandle: HWND);
    destructor Destroy; override;

    procedure SetPriceNotify(AYear, AMonth, ARegion: Integer;
      ANotifyHandle: HWND; AIndex: Integer);

    procedure SetSprNotify(ANotifyHandle: HWND; AIndex: Integer);
    procedure AddItem(const AIndex: Integer; const ASprRecord: TSprRecord);
    procedure UpdateItem(const AIndex: Integer; const ASprRecord: TSprRecord);
    procedure DeleteItem(const AIndex, ASprID: Integer);

    property Year[AIndex: Integer]: Integer read GetYear;
    property Month[AIndex: Integer]: Integer read GetMonth;
    property Region[AIndex: Integer]: Integer read GetRegion;

    property SprList[AIndex: Integer]: TSprArrayEx read GetSprList;
    property SprCount[AIndex: Integer]: Integer read GetSprCount;
    property SprLoaded[AIndex: Integer]: Boolean read GetSptLoad;
    property PriceLoaded[AIndex: Integer]: Boolean read GetPriceLoad;
  end;

var SprControl: TSprControl;

implementation

uses Forms;

{ TSprControl }

function CompareSprRecord(const Left, Right: PSprRecord): Integer;
begin
  Result := string.Compare(Left.Code, Right.Code);
end;

constructor TSprControl.Create(AHandle: HWND);
var I: Integer;
    TmpStr: string;
begin
  inherited Create;
  try
    FHandle := AHandle;
    FNotifyCS := TCriticalSection.Create;

    for I := 0 to MaxSprIndex do
    begin
      FAllSprList[I] := TList<PSprRecord>.Create(
        TComparer<PSprRecord>.Construct(CompareSprRecord));
      FLoadSprFlags[I] := False;
      FLoadPriceFlags[I] := False;
      SetLength(FSprNotifyList[I], 0);
      SetLength(FPriceNotifyList[I], 0);
      FThQueryList[I] := TThreadQuery.Create('', 0, True, I);
      FThQueryList[I].OnTerminate := ThreadTerminate;
      FThQueryList[I].OnActivate := LoadSpr;
      //Не делается разделения на нормативные и собственные, если собственные разростутся, надо сделать
      case I of
        CMatIndex: TmpStr :=
            'SELECT mt.material_id, mt.mat_code, mt.mat_name, ut.unit_name, mt.base ' +
            'FROM material mt LEFT JOIN units ut ' +
            'ON (mt.unit_id = ut.unit_id) WHERE (mt.MAT_TYPE = 1);';
        CJBIIndex: TmpStr :=
            'SELECT mt.material_id, mt.mat_code, mt.mat_name, ut.unit_name, mt.base ' +
            'FROM material mt LEFT JOIN units ut ' +
            'ON (mt.unit_id = ut.unit_id) WHERE (mt.MAT_TYPE = 2);';
        CMechIndex: TmpStr :=
            'SELECT mh.mechanizm_id, mh.mech_code, mh.mech_name, ut.unit_name, mh.base, ' +
            'mh.MECH_PH ' +
            'FROM mechanizm mh LEFT JOIN units ut ON (mh.unit_id = ut.unit_id);';
        CDevIndex: TmpStr :=
            'SELECT dv.device_id, dv.device_code1, dv.name, ut.unit_name, dv.base ' +
            'FROM devices dv LEFT JOIN units ut ON (dv.unit = ut.unit_id);';
        else
          raise Exception.Create('Неизвестный индекс справочника');
      end;
      FThQueryList[I].SQLText := TmpStr;
      FThQueryList[I].Start;
    end;
  except
    Destroy;
    raise;
  end;
end;

destructor TSprControl.Destroy;
var I, J: Integer;
begin
  FreeAndNil(FNotifyCS);
  for I := 0 to MaxSprIndex do
  begin
    for J := 0 to FAllSprList[I].Count - 1 do
      Dispose(FAllSprList[I][J]);
    FreeAndNil(FAllSprList[I]);
    if Assigned(FThQueryList[I]) then
      FreeAndNil(FThQueryList[I]);
  end;
  inherited;
end;

procedure TSprControl.DeleteItem(const AIndex, ASprID: Integer);
var I: Integer;
begin
  CheckIndex(AIndex);
  for I := 0 to FAllSprList[AIndex].Count - 1 do
    if FAllSprList[AIndex][I].ID = ASprID then
    begin
      Dispose(FAllSprList[AIndex][I]);
      FAllSprList[AIndex].Delete(I);
      Break;
    end;
end;

procedure TSprControl.UpdateItem(const AIndex: Integer;
  const ASprRecord: TSprRecord);
var I: Integer;
begin
  CheckIndex(AIndex);
  for I := 0 to FAllSprList[AIndex].Count - 1 do
    if FAllSprList[AIndex][I].ID = ASprRecord.ID then
    begin
      FAllSprList[AIndex][I].Code := ASprRecord.Code;
      FAllSprList[AIndex][I].Name := ASprRecord.Name;
      FAllSprList[AIndex][I].Unt := ASprRecord.Unt;
      FAllSprList[AIndex][I].CoastNDS := ASprRecord.CoastNDS;
      FAllSprList[AIndex][I].CoastNoNDS := ASprRecord.CoastNoNDS;
      FAllSprList[AIndex][I].ZpMach := ASprRecord.ZpMach;
      FAllSprList[AIndex][I].TrZatr := ASprRecord.TrZatr;
      FAllSprList[AIndex][I].Manual := ASprRecord.Manual;
      Break;
    end;
  FAllSprList[AIndex].Sort;
end;

procedure TSprControl.AddItem(const AIndex: Integer;
  const ASprRecord: TSprRecord);
var TmpRec: PSprRecord;
begin
  CheckIndex(AIndex);

  New(TmpRec);
  TmpRec.ID := ASprRecord.ID;
  TmpRec.Code := ASprRecord.Code;
  TmpRec.Name := ASprRecord.Name;
  TmpRec.Unt := ASprRecord.Unt;
  TmpRec.CoastNDS := ASprRecord.CoastNDS;
  TmpRec.CoastNoNDS := ASprRecord.CoastNoNDS;
  TmpRec.ZpMach := ASprRecord.ZpMach;
  TmpRec.TrZatr := ASprRecord.TrZatr;
  TmpRec.Manual := ASprRecord.Manual;

  FAllSprList[AIndex].Add(TmpRec);
  FAllSprList[AIndex].Sort;
end;

procedure TSprControl.CheckIndex(AIndex: Integer);
begin
  if (AIndex < 0) or (AIndex > MaxSprIndex) then
    raise Exception.Create('Неизвестный индекс справочника');
end;

function TSprControl.GetSprList(AIndex: Integer): TSprArrayEx;
begin
  CheckIndex(AIndex);
  Result := FAllSprList[AIndex];
end;

function TSprControl.GetSprCount(AIndex: Integer): Integer;
begin
  CheckIndex(AIndex);
  Result := FAllSprList[AIndex].Count;
end;

function TSprControl.GetSptLoad(AIndex: Integer): Boolean;
begin
  CheckIndex(AIndex);
  Result := FLoadSprFlags[AIndex];
end;

function TSprControl.GetPriceLoad(AIndex: Integer): Boolean;
begin
  CheckIndex(AIndex);
  Result := FLoadPriceFlags[AIndex];
end;

function TSprControl.GetYear(AIndex: Integer): Integer;
begin
  CheckIndex(AIndex);
  Result := FSprPeriodList[AIndex].Year;
end;

function TSprControl.GetMonth(AIndex: Integer): Integer;
begin
  CheckIndex(AIndex);
  Result := FSprPeriodList[AIndex].Month;
end;

function TSprControl.GetRegion(AIndex: Integer): Integer;
begin
  CheckIndex(AIndex);
  Result := FSprPeriodList[AIndex].Region;
end;

procedure TSprControl.AddHeaderToException(AException: Exception; AIndex: Integer);
var TmpStr: string;
begin
  case AIndex of
    CMatIndex: TmpStr := 'материалов ';
    CJBIIndex: TmpStr := 'ЖБИ ';
    CMechIndex: TmpStr := 'механизмов ';
    CDevIndex: TmpStr := 'оборудования ';
    else TmpStr := '';
  end;

  AException.Message := 'При загрузке справочника ' + TmpStr +
    'возникло исключение:' + sLineBreak + AException.Message;
end;

procedure TSprControl.ThreadTerminate(Sender: TObject);
begin
  if (FHandle > 0) and
     (Sender is TThread) and
     Assigned(TThread(Sender).FatalException) then
  begin
    AddHeaderToException(Exception(TThread(Sender).FatalException),
      TThreadQuery(Sender).Tag);

    SendMessage(FHandle, WM_EXCEPTION,
      WParam(TThread(Sender).FatalException), 0);
  end;
end;

procedure TSprControl.LoadSpr(ADataSet: TDataSet; AIndex: Integer);
var I,
    TmpCount,
    TmpInd: Integer;
    TmpRec: PSprRecord;
begin
  CheckIndex(AIndex);

  for I := 0 to FAllSprList[AIndex].Count - 1 do
    Dispose(FAllSprList[AIndex][I]);
  FAllSprList[AIndex].Clear;

  TmpCount := 0;
  TmpInd := 0;

  ADataSet.First;
  while not ADataSet.Eof do
  begin
    if TmpCount = TmpInd then
    begin
      TmpCount := TmpCount + 1000;
      FAllSprList[AIndex].Count := TmpCount;
    end;

    New(TmpRec);

    TmpRec.ID := ADataSet.Fields[0].AsInteger;
    TmpRec.Code := Trim(ADataSet.Fields[1].AsString);
    TmpRec.Name := Trim(ADataSet.Fields[2].AsString);
    TmpRec.Unt := Trim(ADataSet.Fields[3].AsString);
    TmpRec.Manual := ADataSet.Fields[4].AsInteger > 0;

    if AIndex = CMechIndex then
      TmpRec.TrZatr := ADataSet.Fields[5].AsExtended;
    FAllSprList[AIndex][TmpInd] := TmpRec;

    Inc(TmpInd);
    ADataSet.Next;
  end;
  FAllSprList[AIndex].Count := TmpInd;
  FAllSprList[AIndex].Sort;

  FNotifyCS.Enter;
  try
    FLoadSprFlags[AIndex] := True;
    for I := Low(FSprNotifyList[AIndex]) to High(FSprNotifyList[AIndex]) do
      PostMessage(FSprNotifyList[AIndex][I], WM_SPRLOAD, WParam(AIndex), 0);
    SetLength(FSprNotifyList[AIndex], 0);
  finally
    FNotifyCS.Leave;
  end;
end;

procedure TSprControl.SetSprNotify(ANotifyHandle: HWND; AIndex: Integer);
var I: Integer;
begin
  if (ANotifyHandle > 0) then
  begin
    CheckIndex(AIndex);
    FNotifyCS.Enter;
    try
      if FLoadSprFlags[AIndex] then
          PostMessage(ANotifyHandle, WM_SPRLOAD, WParam(AIndex), 0)
      else
      begin
        I := Length(FSprNotifyList[AIndex]);
        SetLength(FSprNotifyList[AIndex], I + 1);
        FSprNotifyList[AIndex][I] := ANotifyHandle;
      end;
    finally
      FNotifyCS.Leave;
    end;
  end;
end;

procedure TSprControl.SetPriceNotify(AYear, AMonth, ARegion: Integer;
  ANotifyHandle: HWND; AIndex: Integer);
var I: Integer;
    TmpStr: string;
    Y, M, D: Word;
begin
  if (AMonth < 0) or (AMonth > 12) or (AYear < 0) or
     (ARegion < 0) or (ARegion > 7) then
    raise Exception.Create('Неверные входные данные');

  if (ANotifyHandle > 0) and
     ((AIndex < 0) or
      (AIndex > MaxSprIndex) or
      (AIndex = CDevIndex)) then
    raise Exception.Create('Неизвестный индекс справочника');

  if AYear = 0 then
    AYear := FSprPeriodList[AIndex].Year;
  if AMonth = 0 then
    AMonth := FSprPeriodList[AIndex].Month;
  if ARegion = 0 then
    ARegion := FSprPeriodList[AIndex].Region;

  if (AYear = 0) or
     (AMonth = 0) then
  begin
    DecodeDate(Date, Y, M, D);
    AYear := Y;
    AMonth := M;
  end;

  if (AIndex in [CMatIndex, CJBIIndex]) and
     (ARegion = 0) then
    ARegion := 7;

  if (FSprPeriodList[AIndex].Year <> AYear) or
     (FSprPeriodList[AIndex].Month <> AMonth) or
     ((AIndex in [CMatIndex, CJBIIndex]) and
      (FSprPeriodList[AIndex].Region <> ARegion)) then
  begin
    FSprPeriodList[AIndex].Year := AYear;
    FSprPeriodList[AIndex].Month := AMonth;
    FSprPeriodList[AIndex].Region := ARegion;

    FLoadPriceFlags[AIndex] := False;

    //Финт для проедаления возможного дедлока
    while WaitForSingleObject(FThQueryList[AIndex].Handle, 1000) <> WAIT_OBJECT_0 do
      Application.ProcessMessages;
    FreeAndNil(FThQueryList[AIndex]);
    FThQueryList[AIndex] := TThreadQuery.Create('', 0, True, AIndex);
    FThQueryList[AIndex].OnTerminate := ThreadTerminate;
    FThQueryList[AIndex].OnActivate := LoadPrice;
    case AIndex of
      CMatIndex: TmpStr :=
          'SELECT mt.material_id, mt.mat_code, mc.coast' +
            IntToStr(FSprPeriodList[AIndex].Region) + '_2, ' +
          'mc.coast' +
            IntToStr(FSprPeriodList[AIndex].Region) + '_1 ' +
          'FROM material mt LEFT JOIN materialcoastg mc ' +
          'ON (mt.material_id = mc.material_id) ' +
          'AND (mc.year = ' +
            IntToStr(FSprPeriodList[AIndex].Year) + ') ' +
          'AND (mc.monat = ' +
            IntToStr(FSprPeriodList[AIndex].Month) + ') ' +
          'WHERE (mt.MAT_TYPE = 1) and (mt.BASE = 0) ' +
          'ORDER BY mt.mat_code;';
      CJBIIndex: TmpStr :=
          'SELECT mt.material_id, mt.mat_code, mc.coast' +
            IntToStr(FSprPeriodList[AIndex].Region) + '_2, ' +
          'mc.coast' +
            IntToStr(FSprPeriodList[AIndex].Region) + '_1 ' +
          'FROM material mt LEFT JOIN materialcoastg mc ' +
          'ON (mt.material_id = mc.material_id) ' +
          'AND (mc.year = ' +
            IntToStr(FSprPeriodList[AIndex].Year) + ') ' +
          'AND (mc.monat = ' +
            IntToStr(FSprPeriodList[AIndex].Month) + ') ' +
          'WHERE (mt.MAT_TYPE = 2) and (mt.BASE = 0) ' +
          'ORDER BY mt.mat_code;';
      CMechIndex: TmpStr :=
          'SELECT mh.mechanizm_id, mh.mech_code, mc.coast1, mc.coast2, mc.ZP1 ' +
          'FROM mechanizm mh LEFT JOIN mechanizmcoastg mc ' +
          'ON (mh.mechanizm_id = mc.mechanizm_id) ' +
          'AND (mc.year=' +
            IntToStr(FSprPeriodList[AIndex].Year) + ') ' +
          'AND (mc.monat=' +
            IntToStr(FSprPeriodList[AIndex].Month) + ') ' +
          'WHERE (mh.BASE = 0) ' +
          'ORDER BY mh.mech_code;';
      else
        raise Exception.Create('Неизвестный индекс справочника');
    end;
    FThQueryList[AIndex].SQLText := TmpStr;
    FThQueryList[AIndex].Start;
  end;

  if (ANotifyHandle > 0) then
  begin
    FNotifyCS.Enter;
    try
      if FLoadPriceFlags[AIndex] then
          PostMessage(ANotifyHandle, WM_PRICELOAD, WParam(AIndex), 0)
      else
      begin
        I := Length(FPriceNotifyList[AIndex]);
        SetLength(FPriceNotifyList[AIndex], I + 1);
        FPriceNotifyList[AIndex][I] := ANotifyHandle;
      end;
    finally
      FNotifyCS.Leave;
    end;
  end;
end;

procedure TSprControl.LoadPrice(ADataSet: TDataSet; AIndex: Integer);
var I, J: Integer;
    e: Exception;
    CompRes: Integer;
    SeveralCodes: Boolean;
begin
  CheckIndex(AIndex);

  if not FLoadSprFlags[AIndex] then
  begin
    e := Exception.Create('Справочник не загружен');
    AddHeaderToException(e, AIndex);
    raise e;
  end;

  for I := 0 to FAllSprList[AIndex].Count - 1 do
  begin
    FAllSprList[AIndex][I].CoastNDS := 0;
    FAllSprList[AIndex][I].CoastNoNDS := 0;
    FAllSprList[AIndex][I].ZpMach := 0;
  end;

  I := 0;
  SeveralCodes := False; //Нужен для выявления блока из одинаковых кодов, если такое вообще возможно

  ADataSet.First;
  while not ADataSet.Eof do
  begin
    for J := I to FAllSprList[AIndex].Count - 1 do
    begin
      CompRes := string.Compare(FAllSprList[AIndex][J].Code, ADataSet.Fields[1].AsString);

      if (FAllSprList[AIndex][J].ID = ADataSet.Fields[0].AsInteger) then
      begin
        FAllSprList[AIndex][J].CoastNDS := ADataSet.Fields[2].AsExtended;
        FAllSprList[AIndex][J].CoastNoNDS := ADataSet.Fields[3].AsExtended;
        if AIndex = CMechIndex then
          FAllSprList[AIndex][J].ZpMach := ADataSet.Fields[4].AsExtended;
        if not SeveralCodes then
          I := J + 1;
        Break;
      end;

      if (CompRes = 0) then
        SeveralCodes := True
      else if (CompRes < 0) then
        SeveralCodes := False
      else
        Break;
    end;
    ADataSet.Next;
  end;

  FNotifyCS.Enter;
  try
    FLoadPriceFlags[AIndex] := True;
    for I := Low(FPriceNotifyList[AIndex]) to High(FPriceNotifyList[AIndex]) do
      PostMessage(FPriceNotifyList[AIndex][I], WM_PRICELOAD, WParam(AIndex), 0);
    SetLength(FPriceNotifyList[AIndex], 0);
  finally
    FNotifyCS.Leave;
  end;
end;

end.
