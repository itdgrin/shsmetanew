{///////////////////////////////////////////////////}
{  Универсальная форма реализующая замену           }
{  материалов и механизмов в расценке, добавление   }
{  материалов и механизмов к расценке               }
{                                                   }
{///////////////////////////////////////////////////}

unit ReplacementMatAndMech;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, System.RTLConsts, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls,
  Vcl.Grids, Vcl.DBGrids, JvExDBGrids, JvDBGrid, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Clipbrd, JvExControls,
  JvAnimatedImage, JvGIFCtrl, FireDAC.Phys.MySQL, Vcl.ValEdit, Vcl.Buttons,
  Vcl.Menus, Tools,
  fFrameMaterial,
  fFrameMechanizm,
  fFrameSpr,
  fFrameEquipment,
  GlobsAndConst,
  Generics.Collections,
  Generics.Defaults;

type
  TEntryRecord = record
    Select: Boolean;
    EID,                   //ID сметы
    MID,                   //ID материала или механизма
    MSprID,                //ID по справочнику
    RTSprID: Integer;      //ID расценки по справочнику
    EName,                 //Название сметы
    RCode,                 //Код расценки
    MCode,                 //Код материала или механизма
    MName,                 //Название материала или мех или оборуд
    MUnt: string;          //Единица измерения
    MNorma,                //Норма в расценке
    MCount: Extended;      //Кол-во
    MIdCardRate,           //ID расценки в которую входит, или входил
    MIdReplaced: Integer;  //ID которого заменяет данный
    MCons,                 //Признак учтеного(1)\неучтеного(0)
    MRep,                  //Признак, что заменен
    MFromRate,             //Вынесен из расценки
    MConsRep,              //Признак, что заменяет учтеный(1)\неучтеный(0)
    MAdded: Byte;          //Добавленный в расценку
    MSort: Integer;        //Поле для сортировки
    DataID,                //Привязка к date_row ID И тип
    DataType: Integer;
  end;

  TEntryArray =  TArray<TEntryRecord>;

  TMyGrid = class(TCustomGrid)
  public
    property InplaceEditor;
  end;

  TRecalcRec = record
    IDEstim,
    DataID,
    DataType: Integer;
  end;

  TfrmReplacement = class(TSmForm)
    Panel1: TPanel;
    groupReplace: TGroupBox;
    Label2: TLabel;
    edtSourceCode: TEdit;
    Label3: TLabel;
    groupEntry: TGroupBox;
    groupCatalog: TGroupBox;
    Panel4: TPanel;
    btnReplace: TButton;
    btnCancel: TButton;
    qrRep: TFDQuery;
    qrTemp: TFDQuery;
    Panel5: TPanel;
    edtSourceName: TMemo;
    ListEntry: TListView;
    rgroupType: TRadioGroup;
    groupRep: TGroupBox;
    Panel2: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    grdRep: TStringGrid;
    PMEntry: TPopupMenu;
    N1: TMenuItem;
    pmSelectAll: TMenuItem;
    pmDeselectAll: TMenuItem;
    pmCurRate: TMenuItem;
    pmSelectRate: TMenuItem;
    pmDeselectRate: TMenuItem;
    pmShowRep: TMenuItem;
    btnDelReplacement: TButton;
    procedure btnCancelClick(Sender: TObject);
    procedure rgroupTypeClick(Sender: TObject);
    procedure btnSelectClick(Sender: TObject);
    procedure ListEntryCustomDrawItem(Sender: TCustomListView; Item: TListItem;
      State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure ListEntryChange(Sender: TObject; Item: TListItem;
      Change: TItemChange);
    procedure grdRepSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure grdRepKeyPress(Sender: TObject; var Key: Char);
    procedure grdRepSetEditText(Sender: TObject; ACol, ARow: Integer;
      const Value: string);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure grdRepMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure PMEntryPopup(Sender: TObject);
    procedure pmSelectAllClick(Sender: TObject);
    procedure pmSelectRateClick(Sender: TObject);
    procedure pmShowRepClick(Sender: TObject);
    procedure btnReplaceClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  private
    FCurType: Byte;
    FAddMode: Boolean; //False - режим замены True - режим вставки

    FObjectID,
    FEstimateID,
    FRateID,
    FRateStrID,
    FMatMechID,
    FMatMechSprID: Integer;

    FObjectName,
    FEstimateName,
    FRateCode: String;
    //Вызов формы для автоматической замены
    FAutoRep: Boolean;

    FMonth,
    FYear,
    FRegion: Word;
    FRegionName: string;
    //Массив вхождений материала в сметы
    FEntryArray: TEntryArray;

    //Для хинтов в стринг гриде
    FActRow: Integer;

    //Справочник материалов или механизмов
    Frame: TSprFrame;

    procedure ChangeType(AType: byte);
    procedure LoadObjEstInfo;
    procedure LoadRepInfo;
    procedure LoadEntry;
    procedure LoadSpr;

    procedure ShowDelRep(const AID: Integer; ADel: Boolean = False);
    function SpecialCompareStr(AStr1, AStr2: string): Boolean;
    { Private declarations }
  public
    constructor Create(const AObjectID, AEstimateID, ARateID,
      AMatMechID, AMatMechSprID: Integer; ADataType: Byte;
      AAdd, AAutoRep: Boolean); reintroduce;
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses DataModule, SprController;

procedure TfrmReplacement.PMEntryPopup(Sender: TObject);
var PRec: ^TEntryRecord;
begin
  //Добавляет данные по выделенной смете
  if (ListEntry.ItemIndex > -1) and
    Assigned(ListEntry.Items[ListEntry.ItemIndex].Data) then
  begin
    PRec := ListEntry.Items[ListEntry.ItemIndex].Data;

    pmCurRate.Visible := True;
    pmCurRate.Caption := PRec^.EName;
    pmCurRate.Tag := PRec^.EID;

    if PRec^.MRep > 0 then
    begin
      pmShowRep.Visible := True;
      pmShowRep.Caption := 'Заменяющие ' + PRec^.MCode;
      pmShowRep.Tag := PRec^.MID;
    end
    else
      pmShowRep.Visible := False;
  end
  else
  begin
    pmCurRate.Visible := False;
    pmShowRep.Visible := False;
  end;
end;

procedure TfrmReplacement.pmSelectAllClick(Sender: TObject);
var i: Integer;
begin
  //Выделяет или отменяет все
  for i := Low(FEntryArray) to High(FEntryArray) do
    if TComponent(Sender).Tag = 0 then
      FEntryArray[i].Select := False
    else
      FEntryArray[i].Select := True;
  ListEntry.Repaint;
end;

procedure TfrmReplacement.pmSelectRateClick(Sender: TObject);
var i: Integer;
begin
  //Выделяет или отменяет смету
  for i := Low(FEntryArray) to High(FEntryArray) do
  begin
    if TMenuItem(Sender).Parent.Tag = FEntryArray[i].EID then
    begin
      if TComponent(Sender).Tag = 0 then
        FEntryArray[i].Select := False
      else
        FEntryArray[i].Select := True;
    end;
  end;
  ListEntry.Repaint;
end;

//Удаляет заменяющие материалы по ид заменяемого
//Или выводит сообщение со списком заменяющих ADel = true
procedure TfrmReplacement.ShowDelRep(const AID: Integer; ADel: Boolean = False);
var i, j: Integer;
begin
  case FCurType of
    2:  qrRep.SQL.Text :=
        'select MAT_ID, MAT_CODE, MAT_NAME, MAT_UNIT, COAST_NDS, COAST_NO_NDS, ID ' +
          'from materialcard_temp where ID_REPLACED = ' + AID.ToString +
          ' order by ID';
    3:  qrRep.SQL.Text :=
        'Select MECH_ID, MECH_CODE, MECH_NAME, MECH_UNIT, COAST_NDS, COAST_NO_NDS, ID ' +
          'from mechanizmcard_temp where ID_REPLACED = ' + AID.ToString +
          ' order by ID';
  end;

  qrRep.Active := True;
  if not ADel then
  begin
    for i := grdRep.FixedRows to grdRep.RowCount - 1 do
      for j := 0 to grdRep.ColCount - 1 do
        grdRep.Cells[j, i] := '';
    grdRep.RowCount := grdRep.FixedRows + 1;
  end;

  while not qrRep.Eof do
  begin
    if ADel then
    begin
      //Удаляет заменяющие материалы или механизмы
      //(заменяющие материалы удаляются из базы полностью)
      case FCurType of
        2:  qrTemp.SQL.Text := 'CALL DeleteMaterial(:id, :CalcMode);';
        3:  qrTemp.SQL.Text := 'CALL DeleteMechanism(:id, :CalcMode);';
      end;
      qrTemp.ParamByName('id').Value := qrRep.FieldByName('ID').Value;
      qrTemp.ParamByName('CalcMode').Value := G_CALCMODE;
      qrTemp.ExecSQL;
    end
    else
    begin
      grdRep.Cells[0, grdRep.RowCount - 1] :=
        IntToStr(grdRep.RowCount - grdRep.FixedRows);

      grdRep.Cells[1, grdRep.RowCount - 1] := qrRep.Fields[1].AsString;
      grdRep.Cells[2, grdRep.RowCount - 1] := qrRep.Fields[2].AsString;
      grdRep.Cells[3, grdRep.RowCount - 1] := qrRep.Fields[3].AsString;
      grdRep.Cells[5, grdRep.RowCount - 1] := IntToStr(qrRep.Fields[4].AsInteger);
      grdRep.Cells[4, grdRep.RowCount - 1] := IntToStr(qrRep.Fields[5].AsInteger);
      grdRep.Cells[6, grdRep.RowCount - 1] := '1';
      grdRep.Cells[7, grdRep.RowCount - 1] := qrRep.Fields[0].AsString;
      grdRep.Cells[8, grdRep.RowCount - 1] := '0';//-----------------------------------------------------------------------------
      grdRep.RowCount := grdRep.RowCount + 1;
    end;
    qrRep.Next;
  end;
  qrRep.Active := False;
end;

procedure TfrmReplacement.pmShowRepClick(Sender: TObject);
begin
  ShowDelRep(TMenuItem(Sender).Tag);
end;

procedure TfrmReplacement.grdRepKeyPress(Sender: TObject; var Key: Char);
var f: Extended;
    s: string;
begin
  if (grdRep.Col = 1) then
  begin
    if (Key = #3) or (Key = #$16) then //Копирование и  вставка
      Exit;
    //Проверка корректности вводимого кода в зависимости от типа
    case FCurType of
      2:
      begin
        if (Key = 'C') or (Key = 'c') or (Key = 'с') then
          Key := 'С'; //Кирилица
        if not (CharInSet(Key, ['0'..'9', '-', #8]) or (Key = 'С')) then
          Key := #0;
      end;
      3:
      begin
        if (Key = 'M') or (Key = 'm') or (Key = 'м') then
          Key := 'М'; //Кирилица
        if not (CharInSet(Key, ['0'..'9', #8]) or (Key = 'М')) then
          Key := #0;
      end;
      4:
      begin
        if not (CharInSet(Key, ['0'..'9', '-', #8])) then
          Key := #0;
      end;
    end;
  end;

  //Правила редактирования коэф. пересчета
  if (grdRep.Col = 6) then
  begin
    if CharInSet(Key, [^C, ^X, ^Z]) then
      Exit;

    if (Key = ^V) then
    begin
      //Проверка на корректность вставляемого текста
      if TryStrToFloat(Clipboard.AsText, f) then
      begin
        s :=
          Copy(TMyGrid(grdRep).InplaceEditor.Text, 1,
            TMyGrid(grdRep).InplaceEditor.SelStart) +
          Clipboard.AsText +
          Copy(TMyGrid(grdRep).InplaceEditor.Text,
            TMyGrid(grdRep).InplaceEditor.SelStart +
              TMyGrid(grdRep).InplaceEditor.SelLength + 1,
            Length(TMyGrid(grdRep).InplaceEditor.Text) -
              TMyGrid(grdRep).InplaceEditor.SelStart -
              TMyGrid(grdRep).InplaceEditor.SelLength);
        if TryStrToFloat(s, f) then
          Exit;
      end;
    end;

    case Key of
      '0'..'9',#8: ;
      '.',',':
       begin
         Key := FormatSettings.DecimalSeparator;
         if (pos(FormatSettings.DecimalSeparator ,
          grdRep.Cells[grdRep.Col, grdRep.Row]) <> 0) or
            (grdRep.Cells[grdRep.Col, grdRep.Row] = '') then
          Key:= #0;
       end;
       else Key:= #0;
    end;
  end;
end;

procedure TfrmReplacement.grdRepMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
var r, c: Integer;
    TextWidth: Integer;
begin
  //Показывает хинт для тех наименование которые не влазят в строку
  grdRep.MouseToCell(X, Y, c, r);
  if (c = 2) and (r >= grdRep.FixedRows) and (r < grdRep.RowCount) then
  begin
    if FActRow <> r then
    begin
      FActRow := r;
      TextWidth := grdRep.Canvas.TextWidth(grdRep.Cells[c,r]);
      if (TextWidth > grdRep.ColWidths[c]) then
      begin
        Application.CancelHint;
        grdRep.Hint := grdRep.Cells[c, r];
        grdRep.ShowHint :=  True;
      end;
    end;
  end
  else
  begin
    Application.CancelHint;
    grdRep.Hint := '';
    grdRep.ShowHint := False;
    FActRow := -1;
  end;
end;

procedure TfrmReplacement.grdRepSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
var s: string;
begin
  //Редактировать можно только код и коэффициент
  if ((ACol in [1,6]) and (grdRep.Cells[0, grdRep.Row] <> '')) or
     ((ACol = 1) and (grdRep.Cells[0, grdRep.Row] = '')) then
    grdRep.Options := grdRep.Options + [goEditing]
  else
    grdRep.Options := grdRep.Options - [goEditing];

  //Убирает разделитель в конце, если не ввели дробную часть
  if (grdRep.Col = 6) then
  begin
    s := grdRep.Cells[grdRep.Col, grdRep.Row];
    if (Length(s) > 0) and (s[High(s)] = FormatSettings.DecimalSeparator) then
      SetLength(s, Length(s)-1);
    grdRep.Cells[grdRep.Col, grdRep.Row] := s;

    if grdRep.Cells[grdRep.Col, grdRep.Row] = '' then
      grdRep.Cells[grdRep.Col, grdRep.Row] := '1';
  end;
end;

//Выбор из справочника
procedure TfrmReplacement.grdRepSetEditText(Sender: TObject; ACol,
  ARow: Integer; const Value: string);
var SprRec: PSprRecord;
begin
  if (ACol = 1) then
  begin
    //Ищет только в нормативной базе
    SprRec := Frame.FindCode(grdRep.Cells[1, ARow]);
    if Assigned(SprRec) then
    begin
      grdRep.Cells[2, ARow] := SprRec.Name;
      grdRep.Cells[3, ARow] := SprRec.Unt;
      grdRep.Cells[5, ARow] := IntToStr(Round(SprRec.CoastNDS));
      grdRep.Cells[4, ARow] := IntToStr(Round(SprRec.CoastNoNDS));
      grdRep.Cells[6, ARow] := '1';
      grdRep.Cells[7, ARow] := SprRec.ID.ToString;
      grdRep.Cells[8, ARow] := '0';
      if grdRep.Cells[0, ARow] = '' then
      begin
        grdRep.Cells[0, ARow] := IntToStr(grdRep.RowCount - grdRep.FixedRows);
        grdRep.RowCount := grdRep.RowCount + 1;
      end;
    end
    else
    begin
      grdRep.Cells[2, ARow] := '';
      grdRep.Cells[3, ARow] := '';
      grdRep.Cells[4, ARow] := '';
      grdRep.Cells[5, ARow] := '';
      grdRep.Cells[7, ARow] := '';
    end;
  end;
end;

procedure TfrmReplacement.ListEntryChange(Sender: TObject; Item: TListItem;
  Change: TItemChange);
var i: Integer;
begin
  if Assigned(Item.Data) then
    TEntryRecord(Item.Data^).Select := Item.Checked;
  //Если выбраны замененные показывает кнопку "Удалить замены"
  btnDelReplacement.Visible := False;
  for i := Low(FEntryArray) to High(FEntryArray) do
    if FEntryArray[i].Select then
      btnDelReplacement.Visible :=
        btnDelReplacement.Visible or (FEntryArray[i].MRep > 0);
end;

procedure TfrmReplacement.ListEntryCustomDrawItem(Sender: TCustomListView;
  Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  if Assigned(Item) and
    Assigned(Item.Data) then
  begin
    Item.Checked := TEntryRecord(Item.Data^).Select;
    if Item.Caption.IsEmpty then //Заполняютя только еще не заполненные строки
    begin
      Item.Caption := TEntryRecord(Item.Data^).EName;
      Item.SubItems.Add(TEntryRecord(Item.Data^).RCode);
      if TEntryRecord(Item.Data^).MRep > 0 then
        Item.SubItems.Add(TEntryRecord(Item.Data^).MCode + ' (З)')
      else
        Item.SubItems.Add(TEntryRecord(Item.Data^).MCode);
      if TEntryRecord(Item.Data^).MNorma > 0 then
        Item.SubItems.Add(TEntryRecord(Item.Data^).MNorma.ToString)
      else
        Item.SubItems.Add('');
      Item.SubItems.Add(TEntryRecord(Item.Data^).MCount.ToString);
      Item.SubItems.Add(TEntryRecord(Item.Data^).MUnt);
    end;
    //Подсветка серым уже замененных
    if TEntryRecord(Item.Data^).MRep > 0 then
      Sender.Canvas.Brush.Color := $00DDDDDD;
  end;
  DefaultDraw := True;
end;

constructor TfrmReplacement.Create(const AObjectID, AEstimateID, ARateID,
  AMatMechID, AMatMechSprID: Integer; ADataType: Byte;
  AAdd, AAutoRep: Boolean);
begin
  FAddMode := AAdd;

  if (FAddMode and not(ADataType in [2,3])) or
     (not FAddMode and not(ADataType in [2,3,4])) then
    raise Exception.Create('Неизвестный тип');

  inherited Create(nil);

  //Зачем этот код именно в Create не известно
  grdRep.ColWidths[0] := 22;
  grdRep.ColWidths[1] := 90;
  grdRep.ColWidths[2] := 240;
  grdRep.ColWidths[3] := 70;
  grdRep.ColWidths[4] := 120;
  grdRep.ColWidths[5] := 120;

  //Скрывает колонку коэффициентов для режима добавления
  if FAddMode then
    grdRep.ColWidths[6] := -1
  else
    grdRep.ColWidths[6] := 70;
  grdRep.ColWidths[7] := -1;
  grdRep.ColWidths[8] := -1;

  grdRep.Cells[0,0] := '№';
  grdRep.Cells[1,0] := 'Код';
  grdRep.Cells[2,0] := 'Наименование';
  grdRep.Cells[3,0] := 'Ед. изм.';
  grdRep.Cells[4,0] := 'Цена без НДС, руб';
  grdRep.Cells[5,0] := 'Цена с НДС, руб';
  grdRep.Cells[6,0] := 'Коэф. пер.';
  grdRep.Cells[7,0] := 'ID';
  grdRep.Cells[8,0] := 'PriceID';

  grdRep.Col := 1;
  grdRep.Options := grdRep.Options + [goEditing];

  //Просто левое число, что-бы onClick отработал
  FCurType := 99;

  FMonth := 0;
  FYear := 0;
  FRegion := 0;

  FObjectID := AObjectID;
  FEstimateID := AEstimateID;
  FRateID := ARateID;
  FRateStrID := 0;
  FMatMechID := AMatMechID;
  //Если не задан ID использует поиск по коду
  if FMatMechID = 0 then
    FMatMechSprID := AMatMechSprID;

  FAutoRep := AAutoRep;

  if FAutoRep then
  begin
    FRateStrID := ARateID;
    FRateID := 0;
  end;

  FObjectName := '';
  FEstimateName := '';
  FRateCode := '';

  LoadObjEstInfo;

  if FAddMode then
  begin
     Panel1.Visible := False;
     groupEntry.Visible := False;
     groupRep.Height := 200;
     groupRep.Caption := ' Добавить в расценку ' + FRateCode + ': ';
     Caption := 'Добавление материалов и механизмов';
     btnReplace.Caption := 'Добавить';
  end;

  //Установка типа приводит к загрузке справочника
  case ADataType of
    2: rgroupType.ItemIndex := 0;
    3: rgroupType.ItemIndex := 1;
    4: rgroupType.ItemIndex := 2;
  end;

  if not FAddMode then
    LoadRepInfo;

  LoadSpr;

  if not FAddMode then
    LoadEntry;

  //Повторно обновляет стили
  SetFormStyle;
end;

procedure TfrmReplacement.FormCreate(Sender: TObject);
begin
  inherited;
  //
end;

//Подгружает информацию по объекту, смете и расценке, если надо
procedure TfrmReplacement.LoadObjEstInfo;
begin
  qrRep.Active := False;

  if FObjectID > 0 then
    qrRep.SQL.Text := 'SELECT ob.region_id, reg.region_name, ob.NAME ' +
      'FROM objcards as ob, regions as reg ' +
      'WHERE (ob.region_id = reg.region_id) and ' +
      '(ob.obj_id = ' + IntToStr(FObjectID) + ');'
  else
    qrRep.SQL.Text := 'SELECT ob.region_id, reg.region_name, ob.NAME ' +
      'FROM objcards as ob, regions as reg ' +
      'WHERE (ob.region_id = reg.region_id) and ' +
      '(ob.obj_id = (SELECT obj_id FROM smetasourcedata WHERE sm_id = ' +
      IntToStr(FEstimateID) + '));';
  qrRep.Active := True;
  if not qrRep.IsEmpty then
  begin
    FRegion := qrRep.Fields[0].AsInteger;
    FRegionName := qrRep.Fields[1].AsString;
    FObjectName := qrRep.Fields[2].AsString;
  end;
  qrRep.Active := False;

  qrRep.SQL.Text := 'SELECT IFNULL(monat,0) as monat, ' +
    'IFNULL(year,0) as year, CONCAT(SM_NUMBER, " ",  NAME) as SMNAME ' +
    'FROM smetasourcedata ' +
    'LEFT JOIN stavka ON stavka.stavka_id = smetasourcedata.stavka_id ' +
    'WHERE sm_id = ' + IntToStr(FEstimateID) + ';';
  qrRep.Active := True;
  if not qrRep.IsEmpty then
  begin
    FMonth := qrRep.Fields[0].AsInteger;
    FYear := qrRep.Fields[1].AsInteger;
    FEstimateName := qrRep.Fields[2].AsString;
  end;
  qrRep.Active := False;

  if (FRateID > 0) then
  begin
    qrRep.SQL.Text := 'SELECT RATE_CODE FROM card_rate_temp ' +
      'WHERE (ID = ' + IntToStr(FRateID) + ');';
    qrRep.Active := True;
    if not qrRep.IsEmpty then
    begin
      FRateCode := qrRep.Fields[0].AsString;
    end;
    qrRep.Active := False;
  end;
end;

//Подгружает информацию о заменяемом материале
procedure TfrmReplacement.LoadRepInfo;
begin
  case FCurType of
    2:
    begin
      if FMatMechSprID > 0 then
        qrRep.SQL.Text :=
          'select MATERIAL_ID, MAT_CODE, MAT_NAME, MAT_TYPE from material ' +
          'where MATERIAL_ID = ' + IntToStr(FMatMechSprID)
      else
        qrRep.SQL.Text :=
          'select MATERIAL_ID, MAT_CODE, MAT_NAME, MAT_TYPE from material ' +
          'where MATERIAL_ID = (select MAT_ID from materialcard_temp ' +
            'where ID = ' + FMatMechID.ToString + ')';
    end;
    3:
    begin
      if FMatMechSprID > 0 then
        qrRep.SQL.Text :=
          'Select MECHANIZM_ID, MECH_CODE, MECH_NAME from mechanizm where MECHANIZM_ID = ' +
            IntToStr(FMatMechSprID)
      else
        qrRep.SQL.Text :=
          'Select MECH_ID, MECH_CODE, MECH_NAME from mechanizmcard_temp ' +
            'where ID = ' + FMatMechID.ToString;
    end;
    4:
    begin
      if FMatMechSprID > 0 then
        qrRep.SQL.Text :=
          'Select DEVICE_ID, DEVICE_CODE1, NAME from devices where DEVICE_ID = ' +
            IntToStr(FMatMechSprID)
      else
        qrRep.SQL.Text :=
          'Select DEVICE_ID, DEVICE_CODE, DEVICE_NAME from devicescard_temp ' +
            'where ID = ' + FMatMechID.ToString;
    end;
  end;

  qrRep.Active := True;
  if not qrRep.IsEmpty then
  begin
    edtSourceCode.Tag := qrRep.Fields[0].AsInteger;
    edtSourceCode.Text := qrRep.Fields[1].AsString;
    edtSourceName.Text := qrRep.Fields[2].AsString;
    if FCurType = 2 then
    begin
      if qrRep.Fields[3].AsInteger = 2 then
        edtSourceName.Tag := 2
      else edtSourceName.Tag := 1;
    end;
  end;
  qrRep.Active := False;
end;

function TfrmReplacement.SpecialCompareStr(AStr1, AStr2: string): Boolean;
var WordList1, WordList2: TStringList;
    I: Integer;
begin
  Result := False;
  AStr1 := AStr1.ToLower;
  AStr2 := AStr2.ToLower;

  AStr1 := StringReplace(AStr1, '(', ' ', [rfReplaceAll]);
  AStr1 := StringReplace(AStr1, ')', ' ', [rfReplaceAll]);
  AStr1 := StringReplace(AStr1, ',', ' ', [rfReplaceAll]);
  AStr1 := StringReplace(AStr1, '    ', ' ', [rfReplaceAll]);
  AStr1 := StringReplace(AStr1, '   ', ' ', [rfReplaceAll]);
  AStr1 := StringReplace(AStr1, '  ', ' ', [rfReplaceAll]);
  AStr1 := StringReplace(AStr1, ' ', sLineBreak, [rfReplaceAll]);

  AStr2 := StringReplace(AStr2, '(', ' ', [rfReplaceAll]);
  AStr2 := StringReplace(AStr2, ')', ' ', [rfReplaceAll]);
  AStr2 := StringReplace(AStr2, ',', ' ', [rfReplaceAll]);
  AStr2 := StringReplace(AStr2, '    ', ' ', [rfReplaceAll]);
  AStr2 := StringReplace(AStr2, '   ', ' ', [rfReplaceAll]);
  AStr2 := StringReplace(AStr2, '  ', ' ', [rfReplaceAll]);
  AStr2 := StringReplace(AStr2, ' ', sLineBreak, [rfReplaceAll]);

  WordList1 := TStringList.Create;
  WordList2 := TStringList.Create;
  try
    WordList1.Text := AStr1;
    WordList2.Text := AStr2;

    if (WordList1.Count = 0) or (WordList2.Count = 0) then
      Exit;

    Result :=  True;
    for I := 0 to WordList1.Count - 1 do
      if Pos(WordList1[I], AStr2) = 0 then
      begin
        Result := False;
        Break;
      end;

    if Result then
      Exit
    else
      Result := True;

    for I := 0 to WordList2.Count - 1 do
      if Pos(WordList2[I], AStr1) = 0 then
      begin
        Result := False;
        Break;
      end;
  finally
    FreeAndNil(WordList1);
    FreeAndNil(WordList2);
  end;
end;

function CompareEntryRecord(const Left, Right: TEntryRecord): Integer;
begin
  Result := Left.EID - Right.EID;
  if Result = 0 then
    Result := Left.MSort - Right.MSort;
  if Result = 0 then
    Result := Left.MID - Right.MID;
end;
//Подгружает вхождения заменяемого материала в смету
procedure TfrmReplacement.LoadEntry;
var Item: TListItem;
    i, ind: Integer;
    WhereStr: string;
    TmpFlag: Boolean;

    procedure BrowsDataSet;
    var Flag: Boolean;
    begin
      while not qrTemp.Eof do
      begin
        Flag := (qrTemp.FieldByName('MSPRID').AsInteger = edtSourceCode.Tag);

        if not Flag then
          Flag := SpecialCompareStr(edtSourceName.Text,
            qrTemp.FieldByName('MTNAME').AsString);

        if Flag then
        begin
          Inc(ind);
          SetLength(FEntryArray, ind);
          FEntryArray[ind - 1].EID := qrTemp.FieldByName('SMID').AsInteger;
          FEntryArray[ind - 1].EName := qrTemp.FieldByName('SMNAME').AsString;
          FEntryArray[ind - 1].RCode := qrTemp.FieldByName('RTCODE').AsString;
          FEntryArray[ind - 1].MID := qrTemp.FieldByName('MTID').AsInteger;
          FEntryArray[ind - 1].MSprID := qrTemp.FieldByName('MSPRID').AsInteger;
          FEntryArray[ind - 1].RTSprID := qrTemp.FieldByName('RTID').AsInteger;
          FEntryArray[ind - 1].MCode := qrTemp.FieldByName('MTCODE').AsString;
          FEntryArray[ind - 1].MName := qrTemp.FieldByName('MTNAME').AsString;
          FEntryArray[ind - 1].MUnt := qrTemp.FieldByName('MTUNIT').AsString;
          FEntryArray[ind - 1].MNorma := qrTemp.FieldByName('MTNORMA').AsFloat;
          FEntryArray[ind - 1].MCount := qrTemp.FieldByName('MTCOUNT').AsFloat;
          FEntryArray[ind - 1].MIdCardRate := qrTemp.FieldByName('MTIDRATE').AsInteger;
          FEntryArray[ind - 1].MIdReplaced := qrTemp.FieldByName('MTIDREP').AsInteger;
          FEntryArray[ind - 1].MCons := qrTemp.FieldByName('MTCONS').AsInteger;
          FEntryArray[ind - 1].MRep := qrTemp.FieldByName('MTREP').AsInteger;
          FEntryArray[ind - 1].MFromRate := qrTemp.FieldByName('MTFROMRATE').AsInteger;
          FEntryArray[ind - 1].MConsRep := qrTemp.FieldByName('MTCONREP').AsInteger;
          FEntryArray[ind - 1].MAdded := qrTemp.FieldByName('MTADDED').AsInteger;
          FEntryArray[ind - 1].MSort := qrTemp.FieldByName('NUMROW').AsInteger;
          FEntryArray[ind - 1].DataID := qrTemp.FieldByName('IDTABLES').AsInteger;
          FEntryArray[ind - 1].DataType := qrTemp.FieldByName('TYPEDATA').AsInteger;

          if (FMatMechID > 0) then
            FEntryArray[ind - 1].Select :=
              (FMatMechID = FEntryArray[ind - 1].MID) and
              (FEntryArray[ind - 1].MRep = 0)
          else
          begin
            FEntryArray[ind - 1].Select :=
              (FMatMechSprID = FEntryArray[ind - 1].MSprID);
          end;
        end;
        qrTemp.Next;
      end;
    end;
begin
  WhereStr := '';

  //Поиск по смете
  if (FEstimateName <> '') then
  begin
    groupEntry.Caption := ' Вхождения в ' + FEstimateName + ':';
    WhereStr := ' AND ((SM.SM_ID = ' + FEstimateID.ToString + ') OR ' +
      '(SM.PARENT_ID = ' + FEstimateID.ToString + ') OR ' +
      '(SM.PARENT_ID IN (SELECT smetasourcedata.SM_ID FROM ' +
      'smetasourcedata WHERE smetasourcedata.PARENT_ID = ' +
      FEstimateID.ToString + ')))';
  end
  else
  begin
    groupEntry.Caption := ' Вхождения в ' + FObjectName + ':';
    WhereStr := ' AND (SM.OBJ_ID = ' + FObjectID.ToString + ')';
  end;

  ind := 0;
  SetLength(FEntryArray, 0);
  if FCurType in [2, 3] then
  begin
    // Вхождения в расценки
    qrTemp.Active := False;
    case FCurType of
      2: qrTemp.SQL.Text := 'SELECT SM.SM_ID as SMID, ' +
          'CONCAT(SM.SM_NUMBER, " ",  SM.NAME) as SMNAME, RT.RATE_ID as RTID, ' +
          'RT.RATE_CODE as RTCODE, MT.ID as MTID, MT.MAT_ID as MSPRID, ' +
          'MT.MAT_CODE as MTCODE, MT.MAT_NAME as MTNAME, ' +
          'MT.MAT_COUNT as MTCOUNT, ' +
          'MT.MAT_UNIT as MTUNIT, MT.MAT_NORMA as MTNORMA, ' +
          'MT.ID_CARD_RATE as MTIDRATE, MT.ID_REPLACED as MTIDREP, ' +
          'MT.CONSIDERED as MTCONS, MT.REPLACED as MTREP, ' +
          'MT.FROM_RATE as MTFROMRATE, MT.CONS_REPLASED as MTCONREP, ' +
          'MT.ADDED as MTADDED, ES.NUM_ROW as NUMROW, ' +
          'ES.ID_TABLES as IDTABLES, ES.ID_TYPE_DATA as TYPEDATA ' +
          'FROM smetasourcedata as SM, data_row_temp as ES, ' +
          'card_rate_temp as RT, materialcard_temp as MT ' +
          'WHERE (SM.SM_ID = ES.SM_ID) AND (ES.ID_TYPE_DATA = 1) AND ' +
          '(ES.ID_TABLES = RT.ID) AND (RT.ID = MT.ID_CARD_RATE) AND ' +
          '(MT.FROM_RATE = 0) AND (MT.DELETED = 0) ' +  WhereStr;
      3: qrTemp.SQL.Text := 'SELECT SM.SM_ID as SMID, ' +
          'CONCAT(SM.SM_NUMBER, " ",  SM.NAME) as SMNAME, RT.RATE_ID as RTID, ' +
          'RT.RATE_CODE as RTCODE, MT.ID as MTID, MT.MECH_ID as MSPRID, ' +
          'MT.MECH_CODE as MTCODE, MT.MECH_NAME as MTNAME, ' +
          'MT.MECH_COUNT as MTCOUNT, ' +
          'MT.MECH_UNIT as MTUNIT, MT.MECH_NORMA as MTNORMA, ' +
          'MT.ID_CARD_RATE as MTIDRATE, MT.ID_REPLACED as MTIDREP, ' +
          'null as MTCONS, MT.REPLACED as MTREP, ' +
          'MT.FROM_RATE as MTFROMRATE, null as MTCONREP, ' +
          'MT.ADDED as MTADDED, ES.NUM_ROW as NUMROW, ' +
          'ES.ID_TABLES as IDTABLES, ES.ID_TYPE_DATA as TYPEDATA ' +
          'FROM smetasourcedata as SM, data_row_temp as ES, ' +
          'card_rate_temp as RT, mechanizmcard_temp as MT ' +
          'WHERE (SM.SM_ID = ES.SM_ID) AND (ES.ID_TYPE_DATA = 1) AND ' +
          '(ES.ID_TABLES = RT.ID) AND (RT.ID = MT.ID_CARD_RATE) AND ' +
          '(MT.FROM_RATE = 0) AND (MT.DELETED = 0) ' + WhereStr;
    end;
    qrTemp.Active := True;
    BrowsDataSet;
    qrTemp.Active := False;
  end;
  //Отдельные от расценок
  qrTemp.Active := False;
  case FCurType of
    2: qrTemp.SQL.Text := 'SELECT SM.SM_ID as SMID, ' +
        'CONCAT(SM.SM_NUMBER, " ",  SM.NAME) as SMNAME, ' +
        'null as RTCODE, null as RTID, MT.ID as MTID, MT.MAT_ID as MSPRID, ' +
        'MT.MAT_CODE as MTCODE, MT.MAT_NAME as MTNAME, ' +
        'MT.MAT_COUNT as MTCOUNT, ' +
        'MT.MAT_UNIT as MTUNIT, MT.MAT_NORMA as MTNORMA, ' +
        'MT.ID_CARD_RATE as MTIDRATE, MT.ID_REPLACED as MTIDREP, ' +
        'MT.CONSIDERED as MTCONS, MT.REPLACED as MTREP, ' +
        'MT.FROM_RATE as MTFROMRATE, MT.CONS_REPLASED as MTCONREP, ' +
        'MT.ADDED as MTADDED, ES.NUM_ROW as NUMROW, ' +
        'ES.ID_TABLES as IDTABLES, ES.ID_TYPE_DATA as TYPEDATA ' +
        'FROM smetasourcedata as SM, data_row_temp as ES, ' +
        'materialcard_temp as MT ' +
        'WHERE (SM.SM_ID = ES.SM_ID) AND (ES.ID_TYPE_DATA = 2) AND ' +
        '(ES.ID_TABLES = MT.ID) ' + WhereStr;
    3: qrTemp.SQL.Text := 'SELECT SM.SM_ID as SMID, ' +
        'CONCAT(SM.SM_NUMBER, " ",  SM.NAME) as SMNAME, ' +
        'null as RTCODE, null as RTID, MT.ID as MTID, MT.MECH_ID as MSPRID, ' +
        'MT.MECH_CODE as MTCODE, MT.MECH_NAME as MTNAME, ' +
        'MT.MECH_COUNT as MTCOUNT, ' +
        'MT.MECH_UNIT as MTUNIT, MT.MECH_NORMA as MTNORMA, ' +
        'MT.ID_CARD_RATE as MTIDRATE, MT.ID_REPLACED as MTIDREP, ' +
        'null as MTCONS, MT.REPLACED as MTREP, ' +
        'MT.FROM_RATE as MTFROMRATE, null as MTCONREP, ' +
        'MT.ADDED as MTADDED, ES.NUM_ROW as NUMROW, ' +
        'ES.ID_TABLES as IDTABLES, ES.ID_TYPE_DATA as TYPEDATA ' +
        'FROM smetasourcedata as SM, data_row_temp as ES, ' +
        'mechanizmcard_temp as MT ' +
        'WHERE (SM.SM_ID = ES.SM_ID) AND (ES.ID_TYPE_DATA = 3) AND ' +
        '(ES.ID_TABLES = MT.ID) ' + WhereStr;
    4: qrTemp.SQL.Text := 'SELECT SM.SM_ID as SMID, ' +
        'CONCAT(SM.SM_NUMBER, " ",  SM.NAME) as SMNAME, ' +
        'null as RTCODE, null as RTID, MT.ID as MTID, MT.DEVICE_ID as MSPRID, ' +
        'MT.DEVICE_CODE as MTCODE, MT.DEVICE_NAME as MTNAME, ' +
        'MT.DEVICE_COUNT as MTCOUNT, ' +
        'MT.DEVICE_UNIT as MTUNIT, null as MTNORMA, ' +
        'null as MTIDRATE, null as MTIDREP, ' +
        'null as MTCONS, null as MTREP, ' +
        'null as MTFROMRATE, null as MTCONREP, ' +
        'null as MTADDED, ES.NUM_ROW as NUMROW, ' +
        'ES.ID_TABLES as IDTABLES, ES.ID_TYPE_DATA as TYPEDATA ' +
        'FROM smetasourcedata as SM, data_row_temp as ES, ' +
        'devicescard_temp as MT ' +
        'WHERE (SM.SM_ID = ES.SM_ID) AND (ES.ID_TYPE_DATA = 4) AND ' +
        '(ES.ID_TABLES = MT.ID) ' + WhereStr;
  end;
  qrTemp.Active := True;
  BrowsDataSet;
  qrTemp.Active := False;

  TArray.Sort<TEntryRecord>(FEntryArray,
    TComparer<TEntryRecord>.Construct(CompareEntryRecord));

  ListEntry.Visible := False;
  ListEntry.Items.Clear;
  TmpFlag := False;
  for i := Low(FEntryArray) to High(FEntryArray) do
  begin
    Item := ListEntry.Items.Add;
    Item.Data := @FEntryArray[i];
    if FAutoRep and
       (not TmpFlag) and
       (FEntryArray[i].MRep > 0) and
       ((FRateStrID = 0) or (FEntryArray[i].RTSprID = FRateStrID)) then
    begin
      ShowDelRep(FEntryArray[i].MID);
      TmpFlag := True;
    end;
  end;
  ListEntry.Visible := True;
end;

procedure TfrmReplacement.btnReplaceClick(Sender: TObject);
var i, j, ind, Iterator, NomManual:  Integer;
    Flag: Boolean;
    IDArray, PriceIDArray: array of Integer;
    CoefArray: array of Double;
    DelOnly: Boolean;
begin
  //Флаг удаления замен
  DelOnly := (TButton(Sender).Tag = 1);
  //Проверка на наличие выделенного заменяемого
  if not FAddMode then
  begin
    Flag := False;
    for i := Low(FEntryArray) to High(FEntryArray) do
      if FEntryArray[i].Select then
      begin
        Flag := True;
        Break;
      end;

    if not Flag then
    begin
      case FCurType of
        2: Showmessage('Не задан заменяемый материал!');
        3: Showmessage('Не задан заменяемый механизм!');
        4: Showmessage('Не задано заменяемое оборудование!');
      end;
      Exit;
    end;
  end;

  ind := 0;
  //Формирует список заменяющих
  for i := grdRep.FixedRows to grdRep.RowCount - 2 do
    if (grdRep.Cells[7, i] <> '') then
    begin
      Inc(ind);
      SetLength(IDArray, ind);
      SetLength(CoefArray, ind);
      SetLength(PriceIDArray, ind);
      IDArray[ind - 1] := grdRep.Cells[7, i].ToInteger;
      PriceIDArray[ind - 1] := StrToIntDef(grdRep.Cells[8, i], 0);
      CoefArray[ind - 1] := grdRep.Cells[6, i].ToDouble;
    end;

  if (Length(IDArray) = 0) and ((not DelOnly) or FAddMode) then
  begin
    case FCurType of
      2: Showmessage('Не задано ни одного заменяющего материала!');
      3: Showmessage('Не задано ни одного заменяющего механизма!');
      4: Showmessage('Не задано ни одного заменяющего оборудования!');
    end;
    Exit;
  end;

  Screen.Cursor := crHourGlass;
  try
    if FAddMode then
    begin
      //Если установлен режим добавления, добавляет новые в расценку
      for j := Low(IDArray) to High(IDArray) do
      begin
        case FCurType of
          2: qrTemp.SQL.Text :=
            'CALL ReplacedMaterial(:IdEst, :IdRate, 1, :IdMS, ' +
            '0, 0, 0, 0, 0, :CalcMode, :PriceID);';
          3: qrTemp.SQL.Text :=
            'CALL ReplacedMechanism(:IdEst, :IdRate, 1, :IdMS, ' +
            '0, 0, 0, 0, 0, :CalcMode, :PriceID);';
        end;
        qrTemp.ParamByName('IdEst').Value := FEstimateID;
        qrTemp.ParamByName('IdRate').Value := FRateID;
        qrTemp.ParamByName('IdMS').Value := IDArray[j];
        qrTemp.ParamByName('CalcMode').Value := G_CALCMODE;
        qrTemp.ParamByName('PriceID').Value := PriceIDArray[j];
        qrTemp.ExecSQL;
      end;
    end
    else
    begin
      //Если установлен режим замены, просматривает список, и в зависимости от
      //типа заменяемого выполняет либо замену, либо удаление и вставку
      for i := Low(FEntryArray) to High(FEntryArray) do
      begin
        //Не отмеченные пропускаются
        if not FEntryArray[i].Select then
          Continue;

        //Если ранее были замены, удаляются заменяющие
        //После этого материал уже не может быть заменяющим
        if FEntryArray[i].MRep > 0 then
          ShowDelRep(FEntryArray[i].MID, True);

        if not DelOnly then
        begin
          iterator := 0;
          //Перед удалением получает итератор истановленный в данный момент
          if (FEntryArray[i].MIdCardRate = 0) or (FEntryArray[i].MFromRate > 0) then
          begin
            qrTemp.SQL.Text := 'SELECT NUM_ROW, NOM_ROW_MANUAL FROM data_row_temp WHERE ' +
                  '(SM_ID = :SM_ID) AND (ID_TABLES = :ID_TABLES) ' +
                  'AND (ID_TYPE_DATA = :ID_TYPE_DATA)';
            qrTemp.ParamByName('SM_ID').Value := FEntryArray[i].EID;
            qrTemp.ParamByName('ID_TABLES').Value := FEntryArray[i].MID;
            qrTemp.ParamByName('ID_TYPE_DATA').Value := FCurType;
            qrTemp.Active := True;
            if not qrTemp.IsEmpty then
            begin
              Iterator := qrTemp.Fields[0].AsInteger;
              NomManual := qrTemp.Fields[1].AsInteger;
            end;
            qrTemp.Active := False;
          end;

          if (FEntryArray[i].MFromRate > 0) or //Если это вынесеный из расценки
             (FEntryArray[i].MIdCardRate = 0) or //Или это отдельный
             (FEntryArray[i].MIdReplaced > 0) or //Или это заменяющий
             (FEntryArray[i].MAdded > 0) then //Или это добавленный в расценку
          begin
            //То заменяемый удаляется из базы
            case FCurType of
              2:  qrTemp.SQL.Text := 'CALL DeleteMaterial(:id, :CalcMode);';
              3:  qrTemp.SQL.Text := 'CALL DeleteMechanism(:id, :CalcMode);';
              4:  qrTemp.SQL.Text := 'CALL DeleteDevice(:id);';
            end;
            qrTemp.ParamByName('id').Value := FEntryArray[i].MID;
            if FCurType in [2,3] then
              qrTemp.ParamByName('CalcMode').Value := G_CALCMODE;
            qrTemp.ExecSQL;
          end;

          //После удаления вынесеного из расценки он возвращается в расценку
          //и если он еще и добавлен или заменяет учтенный по должен быть удален из расценки
          //для неучтенных материалов удаление произойдет автоматически
          if (FEntryArray[i].MFromRate > 0) and
             (((FEntryArray[i].MIdReplaced > 0) and
              ((FCurType = 1) or
              ((FCurType = 0) and (FEntryArray[i].MConsRep > 0)))) or
             (FEntryArray[i].MAdded > 0)) then
          begin
            //То заменяемый удаляется из базы
            case FCurType of
              2:  qrTemp.SQL.Text := 'CALL DeleteMaterial(:id, :CalcMode);';
              3:  qrTemp.SQL.Text := 'CALL DeleteMechanism(:id, :CalcMode);';
            end;
            qrTemp.ParamByName('id').Value := FEntryArray[i].MID;
            qrTemp.ParamByName('CalcMode').Value := G_CALCMODE;
            qrTemp.ExecSQL;
          end;

          //Выполняются замены
          for j := Low(IDArray) to High(IDArray) do
          begin
            //Замена отдельного
            if (FEntryArray[i].MIdCardRate = 0) then
            begin
              case FCurType of
                2:  qrTemp.SQL.Text := 'CALL AddMaterial(:IdEstimate,' +
                      ':IdMat,:MCount,:Iterator,:NomManual,:CALCMODE,:PriceID);';
                3:  qrTemp.SQL.Text := 'CALL AddMechanizm(:IdEstimate,' +
                      ':IdMat,:MCount,:Iterator,:NomManual,:CALCMODE,:PriceID);';
                4:  qrTemp.SQL.Text := 'CALL AddDevice(:IdEstimate,' +
                      ':IdMat,:MCount,:Iterator,:NomManual,:PriceID);';
              end;
              qrTemp.ParamByName('IdEstimate').Value := FEntryArray[i].EID;
              qrTemp.ParamByName('IdMat').Value := IDArray[j];
              qrTemp.ParamByName('MCount').Value := FEntryArray[i].MCount * CoefArray[j];
              qrTemp.ParamByName('Iterator').Value := iterator;
              qrTemp.ParamByName('NomManual').Value := NomManual;
              if FCurType in [2,3] then
                qrTemp.ParamByName('CalcMode').Value := G_CALCMODE;
              qrTemp.ParamByName('PriceID').Value := PriceIDArray[j];
              qrTemp.ExecSQL;
              Continue;
            end;

            if (FEntryArray[i].MIdCardRate > 0) then
            begin
              case FCurType of
                2: qrTemp.SQL.Text := 'CALL ReplacedMaterial(:IdEst, :IdRate, :RType, ' +
                  ':IdMS, :IdMR, :MNorma, :MCount, :MFromRate, :Iterator, :CalcMode, :PriceID);';
                3: qrTemp.SQL.Text := 'CALL ReplacedMechanism(:IdEst, :IdRate, :RType, ' +
                  ':IdMS, :IdMR, :MNorma, :MCount, :MFromRate, :Iterator, :CalcMode, :PriceID);';
              end;
              qrTemp.ParamByName('IdEst').Value := FEntryArray[i].EID;

              if (FEntryArray[i].MAdded > 0) then
              begin
                qrTemp.ParamByName('IdRate').Value := FEntryArray[i].MIdCardRate;
                qrTemp.ParamByName('RType').Value := 1;
              end
              else
              begin
                qrTemp.ParamByName('IdRate').Value := 0;
                qrTemp.ParamByName('RType').Value := 0;
              end;

              qrTemp.ParamByName('IdMS').Value := IDArray[j];

              if (FEntryArray[i].MAdded > 0) then
                qrTemp.ParamByName('IdMR').Value := 0
              else if (FEntryArray[i].MIdReplaced > 0) then
                qrTemp.ParamByName('IdMR').Value := FEntryArray[i].MIdReplaced
              else
                qrTemp.ParamByName('IdMR').Value := FEntryArray[i].MID;

              qrTemp.ParamByName('MNorma').Value := FEntryArray[i].MNorma * CoefArray[j];

              if FEntryArray[i].MFromRate > 0 then
              begin
                qrTemp.ParamByName('MCount').Value := FEntryArray[i].MCount * CoefArray[j];
                qrTemp.ParamByName('Iterator').Value := Iterator;
              end
              else
              begin
                qrTemp.ParamByName('MCount').Value := 0;
                qrTemp.ParamByName('Iterator').Value := 0;
              end;

              qrTemp.ParamByName('MFromRate').Value := FEntryArray[i].MFromRate;
              qrTemp.ParamByName('CalcMode').Value := G_CALCMODE;
              qrTemp.ParamByName('PriceID').Value := PriceIDArray[j];
              qrTemp.ExecSQL;
              Continue;
            end;
            inc(iterator);
          end;
        end;
      end;
    end;
  finally
    Screen.Cursor := crDefault;
    ModalResult := mrYes;
  end;
end;

procedure TfrmReplacement.btnSelectClick(Sender: TObject);
var TmpRec: PSprRecord;
begin
  //Выбор из справочника
  if (Frame.ListSpr.ItemIndex > -1) then
  begin
    TmpRec := PSprRecord(Frame.ListSpr.Items[Frame.ListSpr.ItemIndex].Data);
    grdRep.Cells[1, grdRep.Row] := TmpRec.Code;
    grdRep.Cells[2, grdRep.Row] := TmpRec.Name;
    grdRep.Cells[3, grdRep.Row] := TmpRec.Unt;
    grdRep.Cells[8, grdRep.Row] := '0';
    grdRep.Cells[4, grdRep.Row] := '';
    grdRep.Cells[5, grdRep.Row] := '';
    if Frame.BaseType = 1 then
    begin
      grdRep.Cells[5, grdRep.Row] := IntToStr(Round(TmpRec.CoastNDS));
      grdRep.Cells[4, grdRep.Row] := IntToStr(Round(TmpRec.CoastNoNDS));
    end
    else
    begin
      if Frame.lvDetPrice.ItemIndex > -1 then
      begin
        grdRep.Cells[8, grdRep.Row] :=
          Integer(Frame.lvDetPrice.Items[Frame.lvDetPrice.ItemIndex].Data).ToString;
        grdRep.Cells[5, grdRep.Row] :=
          Frame.lvDetPrice.Items[Frame.lvDetPrice.ItemIndex].SubItems[3];
        grdRep.Cells[4, grdRep.Row] :=
          Frame.lvDetPrice.Items[Frame.lvDetPrice.ItemIndex].SubItems[2];
      end;
    end;

    grdRep.Cells[7, grdRep.Row] := TmpRec.ID.ToString;
    grdRep.Cells[6, grdRep.Row] := '1';

    if grdRep.Cells[0, grdRep.Row] = '' then
    begin
      grdRep.Cells[0, grdRep.Row] := IntToStr(grdRep.RowCount - grdRep.FixedRows);
      grdRep.RowCount := grdRep.RowCount + 1;
    end;
  end;
end;

procedure TfrmReplacement.ChangeType(AType: byte);
begin
  case AType of
    //Материалы
    2:
    begin
      groupReplace.Caption := 'Материал:';
      ListEntry.Columns[2].Caption := 'Материал';
      groupCatalog.Caption := 'Справочник материалов:';
    end;
    //Механизмы
    3:
    begin
      groupReplace.Caption := 'Механизм:';
      ListEntry.Columns[2].Caption := 'Механизм';
      groupCatalog.Caption := 'Справочник механизмов:';
    end;
    //Оборудование
    4:
    begin
      groupReplace.Caption := 'Оборудование:';
      ListEntry.Columns[2].Caption := 'Оборудование';
      groupCatalog.Caption := 'Справочник оборудования:';
    end;
  end;

end;

procedure TfrmReplacement.LoadSpr;
var tmp: Boolean;
    i: Integer;
    s: string;
begin
  case FCurType of
    //Материалы
    2:
    begin
      tmp := (edtSourceName.Tag = 1) or FAddMode;
      Frame := TSprMaterial.Create(Self, True, False,
        EncodeDate(FYear, FMonth, 1), FRegion, tmp, not tmp);
    end;
    //Механизмы
    3: Frame := TSprMechanizm.Create(Self, True, False,
        EncodeDate(FYear, FMonth, 1));
    //Оборудование
    4: Frame := TSprEquipment.Create(Self, True, False);
  end;
  Frame.Parent := groupCatalog;
  Frame.Align := alClient;
  Frame.ChangeDetailsPanel(1);
  Frame.ListSpr.OnDblClick := btnSelectClick;
  Frame.lvDetPrice.OnDblClick := btnSelectClick;

  if (Length(edtSourceCode.Text) > 0) and
     (edtSourceCode.Text[1] = 'П') then
  begin
    s := edtSourceCode.Text;
    s[1] := 'С';
    i := pos('-', s);
    Frame.edtFindCode.Text := copy(s, 1, i - 1);
  end;
  Frame.edtFindName.Text := edtSourceName.Text;

  Frame.LoadSpr;
end;

procedure TfrmReplacement.rgroupTypeClick(Sender: TObject);
var TmpIndex: Integer;
begin
  case FCurType of
    2: TmpIndex := 0;
    3: TmpIndex := 1;
    4: TmpIndex := 2;
  end;
  if TmpIndex <> rgroupType.ItemIndex then
  begin
    case rgroupType.ItemIndex of
      0: FCurType := 2;
      1: FCurType := 3;
      2: FCurType := 4;
    end;
    ChangeType(FCurType);
  end;
end;

procedure TfrmReplacement.SpeedButton1Click(Sender: TObject);
begin
  //Добавляет строку в таблицу заменяющих
  grdRep.Cells[0, grdRep.RowCount - 1] := IntToStr(grdRep.RowCount - grdRep.FixedRows);
  grdRep.Cells[6, grdRep.RowCount - 1] := '1';
  grdRep.RowCount := grdRep.RowCount + 1;
  grdRep.Row := grdRep.RowCount - 2;
end;

procedure TfrmReplacement.SpeedButton2Click(Sender: TObject);
var i, j: Integer;
begin
  if grdRep.Cells[0, grdRep.Row] = '' then
    Exit;

  //Удаляет строку из таблицы заменяющих
  for i := grdRep.Row to grdRep.RowCount - 2 do
    for j := grdRep.FixedCols to grdRep.ColCount - 1 do
      grdRep.Cells[j, i] := grdRep.Cells[j, i + 1];

  grdRep.RowCount := grdRep.RowCount - 1;

  for j := 0 to grdRep.ColCount - 1 do
      grdRep.Cells[j, grdRep.RowCount - 1] := '';
end;

procedure TfrmReplacement.btnCancelClick(Sender: TObject);
begin
  Close;
end;

end.
