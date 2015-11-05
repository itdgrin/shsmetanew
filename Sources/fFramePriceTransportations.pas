unit fFramePriceTransportations;

interface

uses
  Windows, SysUtils, Classes, Graphics, Controls, Forms, StdCtrls, Buttons, ExtCtrls, Menus, Clipbrd, DB,
  VirtualTrees, fFrameStatusBar, DateUtils, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, fFrameSmeta, Vcl.Samples.Spin;

type
  TFramePriceTransportations = class(TSmetaFrame)

    PopupMenu: TPopupMenu;
    CopyCell: TMenuItem;

    Panel: TPanel;
    PanelTable: TPanel;
    PanelSearch: TPanel;
    ImageSplitter: TImage;
    VST: TVirtualStringTree;
    FrameStatusBar: TFrameStatusBar;
    LabelYear: TLabel;
    LabelMonth: TLabel;
    cmbMonth: TComboBox;
    ADOQuery: TFDQuery;
    edtYear: TSpinEdit;
    cmbTranspType: TComboBox;

    procedure ReceivingSearch();

    procedure FrameEnter(Sender: TObject);
    procedure FrameExit(Sender: TObject);
    procedure FrameResize(Sender: TObject);

    procedure CopyCellClick(Sender: TObject);

    procedure VSTAfterCellPaint(Sender: TBaseVirtualTree; TargetCanvas: TCanvas; Node: PVirtualNode;
      Column: TColumnIndex; CellRect: TRect);
    procedure VSTBeforeCellPaint(Sender: TBaseVirtualTree; TargetCanvas: TCanvas; Node: PVirtualNode;
      Column: TColumnIndex; CellPaintMode: TVTCellPaintMode; CellRect: TRect; var ContentRect: TRect);
    procedure VSTEnter(Sender: TObject);
    procedure VSTFocusChanged(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex);
    procedure VSTGetText(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex;
      TextType: TVSTTextType; var CellText: string);

    procedure ComboBoxMonthYearChange(Sender: TObject);
  private
    StrFilterData: string; // Фильтрация данных по месяцу и году
    FCode: string;
    FMaxValue: array [2..9] of integer;
    FDeltaValue: array [2..9] of integer;
    function FillingCell(AColumn: TColumnIndex; ARow: Integer): string;
  public
    procedure ReceivingAll; override;
    procedure CheckCurPeriod; override;
    constructor Create(AOwner: TComponent; ADate: TDateTime); reintroduce;
  end;

implementation

uses DrawingTables, DataModule, CalculationEstimate, GlobsAndConst;

{$R *.dfm}

const
  // Название этого фрейма
  CaptionFrame = 'Фрейм «Тарифы по грузоперевозкам»';

  // Массив содержащий названия всех видимых столбцов таблицы
  NameVisibleColumns: array [1 .. 1] of String[8] = ('distance');

// ---------------------------------------------------------------------------------------------------------------------

constructor TFramePriceTransportations.Create(AOwner: TComponent; ADate: TDateTime);
var ev: TNotifyEvent;
    y,m,d: Word;
begin
  inherited Create(AOwner);
  StrFilterData := '';

  DecodeDate(ADate,y,m,d);
  ev := edtYear.OnChange;
  try
    edtYear.OnChange := nil;
    cmbMonth.OnChange := nil;
    edtYear.Value := y;
    cmbMonth.ItemIndex := m - 1;
  finally
    edtYear.OnChange := ev;
    cmbMonth.OnChange := ev;
  end;

  G_CURYEAR := edtYear.Value;
  G_CURMONTH := cmbMonth.ItemIndex;
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFramePriceTransportations.ReceivingAll;
begin
  try
    if ADOQuery.Active then
      Exit;

    StrFilterData := '(year = ' + IntToStr(edtYear.Value) + ') and (monat = ' +
      IntToStr(cmbMonth.ItemIndex + 1) + ')';

    ReceivingSearch();
  except
    on E: Exception do
      MessageBox(0, PChar('При запросе к БД возникла ошибка:' + sLineBreak + sLineBreak + E.Message),
        CaptionFrame, MB_ICONERROR + MB_OK + mb_TaskModal);
  end;

  fLoaded := true;
end;

procedure TFramePriceTransportations.CheckCurPeriod;
var ev: TNotifyEvent;
begin
  if (G_CURYEAR <> edtYear.Value) or
     (G_CURMONTH <> cmbMonth.ItemIndex) then
  begin
    ev := edtYear.OnChange;
    try
      edtYear.OnChange := nil;
      cmbMonth.OnChange := nil;
      edtYear.Value := G_CURYEAR;
      cmbMonth.ItemIndex := G_CURMONTH;
      ev(nil);
    finally
      edtYear.OnChange := ev;
      cmbMonth.OnChange := ev;
    end;
  end;
end;

procedure TFramePriceTransportations.ReceivingSearch();
var
  WhereStr: string;
  FilterStr, StrQuery: string;
begin
  FilterStr := StrFilterData;

  if FilterStr <> '' then
    WhereStr := ' where ' + FilterStr
  else
    WhereStr := '';

  if cmbTranspType.ItemIndex = 1 then
  begin
    FCode := 'С311-';
    StrQuery := 'SELECT * FROM transfercargoboard' + WhereStr + ' order by SORT, ID;';
  end
  else
  begin
    FCode := 'С310-';
    StrQuery := 'SELECT * FROM transfercargo' + WhereStr + ' order by SORT, ID;';
  end;

  with ADOQuery do
  begin
    Active := False;
    SQL.Clear;
    SQL.Add(StrQuery);
    Active := true;
    FetchAll;
  end;

  if (ADOQuery.RecordCount <= 0) or
     ((ADOQuery.RecordCount <> 51) and (cmbTranspType.ItemIndex = 0)) or
     ((ADOQuery.RecordCount <> 121) and (cmbTranspType.ItemIndex = 1)) then
  begin
    VST.RootNodeCount := 1;
    VST.ClearSelection;
    FrameStatusBar.InsertText(1, '-1');
  end
  else
  begin
    if cmbTranspType.ItemIndex = 0 then
      ADOQuery.RecNo := 50
    else
      ADOQuery.RecNo := 120;

    FMaxValue[2] := ADOQuery.FieldByName('class1_1').AsVariant;
    FMaxValue[3] := ADOQuery.FieldByName('class1_2').AsVariant;
    FMaxValue[4] := ADOQuery.FieldByName('class2_1').AsVariant;
    FMaxValue[5] := ADOQuery.FieldByName('class2_2').AsVariant;
    FMaxValue[6] := ADOQuery.FieldByName('class3_1').AsVariant;
    FMaxValue[7] := ADOQuery.FieldByName('class3_2').AsVariant;
    FMaxValue[8] := ADOQuery.FieldByName('class4_1').AsVariant;
    FMaxValue[9] := ADOQuery.FieldByName('class4_2').AsVariant;

    if cmbTranspType.ItemIndex = 0 then
      ADOQuery.RecNo := 51
    else
      ADOQuery.RecNo := 121;

    FDeltaValue[2] := ADOQuery.FieldByName('class1_1').AsVariant;
    FDeltaValue[3] := ADOQuery.FieldByName('class1_2').AsVariant;
    FDeltaValue[4] := ADOQuery.FieldByName('class2_1').AsVariant;
    FDeltaValue[5] := ADOQuery.FieldByName('class2_2').AsVariant;
    FDeltaValue[6] := ADOQuery.FieldByName('class3_1').AsVariant;
    FDeltaValue[7] := ADOQuery.FieldByName('class3_2').AsVariant;
    FDeltaValue[8] := ADOQuery.FieldByName('class4_1').AsVariant;
    FDeltaValue[9] := ADOQuery.FieldByName('class4_2').AsVariant;

    VST.RootNodeCount := 301;
    VST.Selected[VST.GetFirst] := true;
    VST.FocusedNode := VST.GetFirst;
    FrameStatusBar.InsertText(1, '1');
  end;
  VST.Repaint;
  FrameStatusBar.InsertText(0, IntToStr(VST.RootNodeCount));
end;

procedure TFramePriceTransportations.FrameEnter(Sender: TObject);
begin
  if not ADOQuery.Active then
    Exit;

  FrameStatusBar.InsertText(0, IntToStr(VST.RootNodeCount)); // Количество записей
  if Assigned(VST.FocusedNode) then
    FrameStatusBar.InsertText(1, IntToStr(VST.FocusedNode.Index + 1))
  else
    FrameStatusBar.InsertText(1, '-1');
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFramePriceTransportations.FrameExit(Sender: TObject);
begin
  with FrameStatusBar do
  begin
    InsertText(0, '');
    InsertText(1, '');
  end;
end;

procedure TFramePriceTransportations.FrameResize(Sender: TObject);
begin
  AutoWidthColumn(VST, 1);
end;

procedure TFramePriceTransportations.CopyCellClick(Sender: TObject);
var
  ClipBoard: TClipboard;
  CellText: string;
begin
  if ((VST.FocusedNode.Index + 1 < 51) and (cmbTranspType.ItemIndex = 0)) or
     ((VST.FocusedNode.Index + 1 < 101) and (cmbTranspType.ItemIndex = 1)) then
    ADOQuery.RecNo := VST.FocusedNode.Index + 1;

  if (cmbTranspType.ItemIndex = 1) and (VST.FocusedNode.Index + 1 >= 101) and
    (VST.FocusedNode.Index + 1 < 301) then
    ADOQuery.RecNo := 101 + ((VST.FocusedNode.Index - 100) div 5);

  CellText := FillingCell(VST.FocusedColumn, VST.FocusedNode.Index + 1);

  ClipBoard := TClipboard.Create;
  ClipBoard.SetTextBuf(PWideChar(WideString(CellText)));
  FreeAndNil(ClipBoard);
end;

function TFramePriceTransportations.FillingCell(AColumn: TColumnIndex; ARow: Integer): string;

  function GetPriceValue(const AField: string; AIndex: Integer): string;
  begin
    if cmbTranspType.ItemIndex = 0 then
    begin
      if (ARow < 51) then
        Result := ADOQuery.FieldByName(AField).AsVariant
      else if ARow < 301 then
        Result := IntToStr(FMaxValue[AIndex] + FDeltaValue[AIndex] * (ARow - 50))
      else
        Result := IntToStr(FDeltaValue[AIndex]);
    end
    else
    begin
      if ARow < 201 then
        Result := ADOQuery.FieldByName(AField).AsVariant
      else if ARow < 301 then
        Result := IntToStr(FMaxValue[AIndex] + FDeltaValue[AIndex] * (ARow - 200))
      else
        Result := IntToStr(FDeltaValue[AIndex]);
    end;
  end;
begin
  case AColumn of
    0:
      Result := IntToStr(ARow);
    1:
    begin
      if ARow > 300 then
        Result := 'на расстояние перевозки свыше 300 км за каждый км дополнительно прибавлять  '
      else
        Result := FCode + IntToStr(ARow);
    end;
    2:
      Result := GetPriceValue('class1_1', 2);
    3:
      Result := GetPriceValue('class1_2', 3);
    4:
      Result := GetPriceValue('class2_1', 4);
    5:
      Result := GetPriceValue('class2_2', 5);
    6:
      Result := GetPriceValue('class3_1', 6);
    7:
      Result := GetPriceValue('class3_2', 7);
    8:
      Result := GetPriceValue('class4_1', 8);
    9:
      Result := GetPriceValue('class4_2', 9);
  end;
end;

procedure TFramePriceTransportations.VSTAfterCellPaint(Sender: TBaseVirtualTree; TargetCanvas: TCanvas;
  Node: PVirtualNode; Column: TColumnIndex; CellRect: TRect);
var
  CellText: string;
begin
  if (not ADOQuery.Active) or
     (ADOQuery.RecordCount <= 0) or
     (not Assigned(Node)) then
    Exit;

  if ((Node.Index + 1 < 51) and (cmbTranspType.ItemIndex = 0)) or
     ((Node.Index + 1 < 101) and (cmbTranspType.ItemIndex = 1)) then
    ADOQuery.RecNo := Node.Index + 1;

  if (cmbTranspType.ItemIndex = 1) and (Node.Index + 1 >= 101) and
    (Node.Index + 1 < 301) then
    ADOQuery.RecNo := 101 + ((Node.Index - 100) div 5);

  CellText := FillingCell(Column, Node.Index + 1);

  VSTAfterCellPaintDefault(Sender, TargetCanvas, Node, Column, CellRect, CellText);
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFramePriceTransportations.VSTBeforeCellPaint(Sender: TBaseVirtualTree; TargetCanvas: TCanvas;
  Node: PVirtualNode; Column: TColumnIndex; CellPaintMode: TVTCellPaintMode; CellRect: TRect;
  var ContentRect: TRect);
begin
  VSTBeforeCellPaintDefault(Sender, TargetCanvas, Node, Column,
    CellPaintMode, CellRect, ContentRect);
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFramePriceTransportations.VSTEnter(Sender: TObject);
begin
  LoadKeyboardLayout('00000419', KLF_ACTIVATE); // Русский
  // LoadKeyboardLayout('00000409', KLF_ACTIVATE); // Английский
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFramePriceTransportations.VSTFocusChanged(Sender: TBaseVirtualTree;
  Node: PVirtualNode;
  Column: TColumnIndex);
begin
  VSTFocusChangedDefault(Sender, Node, Column);
  if Assigned(Node) then
    FrameStatusBar.InsertText(1, IntToStr(Node.Index + 1));
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFramePriceTransportations.VSTGetText(Sender: TBaseVirtualTree; Node: PVirtualNode;
  Column: TColumnIndex; TextType: TVSTTextType; var CellText: string);
begin
  if not ADOQuery.Active then
    Exit;

  if (VST.RootNodeCount = 1) then
  begin
    case Column of
      0:
        CellText := '';
      1:
        CellText := 'Записей не найдено!';
      2:
        CellText := '';
      3:
        CellText := '';
      4:
        CellText := '';
      5:
        CellText := '';
      6:
        CellText := '';
      7:
        CellText := '';
      8:
        CellText := '';
      9:
        CellText := '';
    end;

    Exit;
  end;

  if ((Node.Index + 1 < 51) and (cmbTranspType.ItemIndex = 0)) or
     ((Node.Index + 1 < 101) and (cmbTranspType.ItemIndex = 1)) then
    ADOQuery.RecNo := Node.Index + 1;

  if (cmbTranspType.ItemIndex = 1) and (Node.Index + 1 >= 101) and
    (Node.Index + 1 < 301) then
    ADOQuery.RecNo := 101 + ((Node.Index - 100) div 5);

  CellText := FillingCell(Column, Node.Index + 1);
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFramePriceTransportations.ComboBoxMonthYearChange(Sender: TObject);
begin
  if edtYear.Value < 2012 then //что-бы не лазили дальше 2012 года
  begin
    edtYear.Value := 2012;
    Exit;
  end;

  G_CURYEAR := edtYear.Value;
  G_CURMONTH := cmbMonth.ItemIndex;

  StrFilterData := '(year = ' + IntToStr(edtYear.Value) + ') and (monat = ' +
    IntToStr(cmbMonth.ItemIndex + 1) + ')';

  FrameStatusBar.InsertText(2, '-1');

  ReceivingSearch();
end;

end.
