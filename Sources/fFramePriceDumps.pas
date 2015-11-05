unit fFramePriceDumps;

interface

uses
  Windows, SysUtils, Classes, Graphics, Controls, Forms, StdCtrls, Buttons, ExtCtrls, Menus, Clipbrd, DB,
  VirtualTrees, fFrameStatusBar, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, fFrameSmeta, Vcl.Samples.Spin, System.DateUtils;

type
  TFramePriceDumps = class(TSmetaFrame)

    PopupMenu: TPopupMenu;
    CopyCell: TMenuItem;
    DumpSearch: TMenuItem;
    DumpSearchFast: TMenuItem;
    DumpSearchAccurate: TMenuItem;

    Panel: TPanel;
    PanelMemo: TPanel;
    PanelSearch: TPanel;
    PanelTable: TPanel;

    Memo: TMemo;
    EditSearch: TEdit;
    LabelSearch: TLabel;
    Splitter: TSplitter;
    ImageSplitter: TImage;
    VST: TVirtualStringTree;
    FrameStatusBar: TFrameStatusBar;
    SpeedButtonShowHide: TSpeedButton;
    ADOQuery: TFDQuery;
    LabelYear: TLabel;
    LabelMonth: TLabel;
    cmbMonth: TComboBox;
    edtYear: TSpinEdit;

    procedure ReceivingSearch(vStr: String);

    procedure EditSearchEnter(Sender: TObject);
    procedure EditSearchKeyPress(Sender: TObject; var Key: Char);

    procedure FrameEnter(Sender: TObject);
    procedure FrameExit(Sender: TObject);
    procedure FrameResize(Sender: TObject);
    procedure PanelTableResize(Sender: TObject);

    procedure CopyCellClick(Sender: TObject);
    procedure MemoEnter(Sender: TObject);
    procedure SpeedButtonShowHideClick(Sender: TObject);

    procedure VSTAfterCellPaint(Sender: TBaseVirtualTree; TargetCanvas: TCanvas; Node: PVirtualNode;
      Column: TColumnIndex; CellRect: TRect);
    procedure VSTBeforeCellPaint(Sender: TBaseVirtualTree; TargetCanvas: TCanvas; Node: PVirtualNode;
      Column: TColumnIndex; CellPaintMode: TVTCellPaintMode; CellRect: TRect; var ContentRect: TRect);
    procedure VSTEnter(Sender: TObject);
    procedure VSTExit(Sender: TObject);
    procedure VSTFocusChanged(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex);
    procedure VSTGetText(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType;
      var CellText: string);
    procedure VSTKeyPress(Sender: TObject; var Key: Char);
    procedure edtYearChange(Sender: TObject);

  private
    StrQuickSearch: String;
    NomColumn: Integer;
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
  CaptionFrame = 'Фрейм «Тарифы по свалкам»';

  // Массив содержащий названия всех видимых столбцов таблицы
  NameVisibleColumns: array [1 .. 1] of String[4] = ('Name');

// ---------------------------------------------------------------------------------------------------------------------

constructor TFramePriceDumps.Create(AOwner: TComponent; ADate: TDateTime);
var ev: TNotifyEvent;
    y,m,d: Word;
begin
  inherited Create(AOwner);

  PanelMemo.Constraints.MinHeight := 35;
  SpeedButtonShowHide.Hint := 'Свернуть панель';

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

  with DM do
  begin
    ImageListHorozontalDots.GetIcon(0, ImageSplitter.Picture.Icon);
    ImageListArrowsBottom.GetBitmap(0, SpeedButtonShowHide.Glyph);
  end;
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFramePriceDumps.ReceivingAll;
var
  te : TDateTime;
begin
  StrQuickSearch := '';

  try
    ADOQuery.Active := False;

    ADOQuery.SQL.Text := 'SELECT dump.dump_id, dump_name as "Name", ' +
      'coast1 as "PriceNotVAT", coast2 as "PriceVAT", ' +
      'unit_name as "Unit", region_name as "NameRegion" ' +
      'FROM dump JOIN units ON dump.unit_id = units.unit_id ' +
      'JOIN regions ON dump.region_id = regions.region_id ' +
      'LEFT JOIN dumpcoast ON dump.dump_id = dumpcoast.dump_id ' +
      'WHERE (dumpcoast.DATE_BEG >= :date1) and (dumpcoast.DATE_BEG <= :date2);';

    te := EncodeDate(edtYear.Value, cmbMonth.ItemIndex + 1, 1);
    ADOQuery.ParamByName('date1').Value := te;
    te := IncMonth(te) - 1;
    ADOQuery.ParamByName('date2').Value := te;

    ADOQuery.Active := True;

    VST.RootNodeCount := ADOQuery.RecordCount;
    VST.Selected[VST.GetFirst] := True;
    VST.FocusedNode := VST.GetFirst;

    VST.Repaint;

    FrameStatusBar.InsertText(1, IntToStr(1));
    FrameStatusBar.InsertText(2, '');
  except
    on E: Exception do
      MessageBox(0, PChar('При запросе к БД возникла ошибка:' + sLineBreak + sLineBreak + E.Message), CaptionFrame,
        MB_ICONERROR + MB_OK + mb_TaskModal);
  end;
  fLoaded := true;
end;

procedure TFramePriceDumps.CheckCurPeriod;
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

procedure TFramePriceDumps.ReceivingSearch(vStr: String);
begin
  ADOQuery.Filtered := False;
  ADOQuery.Filter := vStr;

  if vStr = '' then
    ADOQuery.Filtered := False
  else
    ADOQuery.Filtered := True;

  if ADOQuery.RecordCount <= 0 then
  begin
    VST.RootNodeCount := 1;
    VST.ClearSelection;

    FrameStatusBar.InsertText(1, '-1');
  end
  else
  begin
    VST.RootNodeCount := ADOQuery.RecordCount;

    VST.Selected[VST.GetFirst] := True;
    VST.FocusedNode := VST.GetFirst;

    FrameStatusBar.InsertText(1, '1');
  end;

  FrameStatusBar.InsertText(0, IntToStr(ADOQuery.RecordCount));
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFramePriceDumps.EditSearchEnter(Sender: TObject);
begin
  LoadKeyboardLayout('00000419', KLF_ACTIVATE); // Русский
  // LoadKeyboardLayout('00000409', KLF_ACTIVATE); // Английский
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFramePriceDumps.EditSearchKeyPress(Sender: TObject; var Key: Char);
begin
  with (Sender as TEdit) do
    if (Key = #13) and (Text <> '') then // Если нажата клавиша "Enter" и строка поиска не пуста
      ReceivingSearch(FilteredString(Text, 'Name'))
    else if (Key = #27) or ((Key = #13) and (Text = '')) then // Нажата клавиша ESC, или Enter и строка поиска пуста
    begin
      Text := '';
      ReceivingSearch('');
    end;
end;

procedure TFramePriceDumps.edtYearChange(Sender: TObject);
begin
  if edtYear.Value < 2012 then //что-бы не лазили дальше 2012 года
  begin
    edtYear.Value := 2012;
    Exit;
  end;

  G_CURYEAR := edtYear.Value;
  G_CURMONTH := cmbMonth.ItemIndex;

  ReceivingAll;
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFramePriceDumps.FrameEnter(Sender: TObject);
begin
  FrameStatusBar.InsertText(0, IntToStr(ADOQuery.RecordCount)); // Количество записей

  if ADOQuery.RecordCount > 0 then
    FrameStatusBar.InsertText(1, IntToStr(VST.FocusedNode.Index + 1)) // Номер выделенной записи
  else
    FrameStatusBar.InsertText(1, '-1'); // Нет записей

  EditSearch.SetFocus;
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFramePriceDumps.FrameExit(Sender: TObject);
begin
  with FrameStatusBar do
  begin
    InsertText(0, '');
    InsertText(1, '');
    InsertText(2, '');
  end;
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFramePriceDumps.FrameResize(Sender: TObject);
begin
  AutoWidthColumn(VST, 1);
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFramePriceDumps.PanelTableResize(Sender: TObject);
begin
  ImageSplitter.Top := Splitter.Top;
  ImageSplitter.Left := Splitter.Left + (Splitter.Width - ImageSplitter.Width) div 2;
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFramePriceDumps.CopyCellClick(Sender: TObject);
var
  ClipBoard: TClipboard;
  CellText: string;
begin
  ADOQuery.RecNo := VST.FocusedNode.Index + 1;

  case VST.FocusedColumn of
    1:
      CellText := ADOQuery.FieldByName('Name').AsVariant;
    2:
      CellText := ADOQuery.FieldByName('PriceNotVAT').AsVariant;
    3:
      CellText := ADOQuery.FieldByName('PriceVAT').AsVariant;
    4:
      CellText := ADOQuery.FieldByName('Unit').AsVariant;
    5:
      CellText := ADOQuery.FieldByName('NameRegion').AsVariant;
  end;

  ClipBoard := TClipboard.Create;
  ClipBoard.SetTextBuf(PWideChar(WideString(CellText)));
  FreeAndNil(ClipBoard);
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFramePriceDumps.MemoEnter(Sender: TObject);
begin
  Memo.SelStart := Length(Memo.Text);
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFramePriceDumps.SpeedButtonShowHideClick(Sender: TObject);
begin
  MemoShowHide(Sender, Splitter, PanelMemo);
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFramePriceDumps.VSTAfterCellPaint(Sender: TBaseVirtualTree; TargetCanvas: TCanvas; Node: PVirtualNode;
  Column: TColumnIndex; CellRect: TRect);
var
  CellText: string;
begin
  if not ADOQuery.Active or (ADOQuery.RecordCount <= 0) or
    (not Assigned(Node))
  then Exit;

  ADOQuery.RecNo := Node.Index + 1;

  case Column of
    1:
      CellText := ADOQuery.FieldByName('Name').AsVariant;
    2:
      CellText := ADOQuery.FieldByName('PriceNotVAT').AsVariant;
    3:
      CellText := ADOQuery.FieldByName('PriceVAT').AsVariant;
    4:
      CellText := ADOQuery.FieldByName('Unit').AsVariant;
    5:
      CellText := ADOQuery.FieldByName('NameRegion').AsVariant;
  end;

  VSTAfterCellPaintDefault(Sender, TargetCanvas, Node, Column, CellRect, CellText);
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFramePriceDumps.VSTBeforeCellPaint(Sender: TBaseVirtualTree; TargetCanvas: TCanvas; Node: PVirtualNode;
  Column: TColumnIndex; CellPaintMode: TVTCellPaintMode; CellRect: TRect; var ContentRect: TRect);
begin
  VSTBeforeCellPaintDefault(Sender, TargetCanvas, Node, Column, CellPaintMode, CellRect, ContentRect);
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFramePriceDumps.VSTEnter(Sender: TObject);
var
  NumCol: Integer;
begin
  NumCol := (Sender as TVirtualStringTree).FocusedColumn;

  if (NumCol = 1) then
    FrameStatusBar.InsertText(2, '-1') // Поиск по столбцу есть
  else
    FrameStatusBar.InsertText(2, ''); // Поиск по столбцу нет

  // ----------------------------------------

  LoadKeyboardLayout('00000419', KLF_ACTIVATE); // Русский
  // LoadKeyboardLayout('00000409', KLF_ACTIVATE); // Английский
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFramePriceDumps.VSTExit(Sender: TObject);
begin
  StrQuickSearch := '';
  FrameStatusBar.InsertText(2, '');
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFramePriceDumps.VSTFocusChanged(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex);
begin
  VSTFocusChangedDefault(Sender, Node, Column);

  // ----------------------------------------

  // Если перешли на другой столбец (колонку), то очищаем строку быстрого поиска
  if NomColumn <> Column then
  begin
    StrQuickSearch := '';
    if (Column = 1) then
      FrameStatusBar.InsertText(2, '-1') // Поиск по столбцу есть
    else
      FrameStatusBar.InsertText(2, '') // Поиск по столбцу нет
  end;

  NomColumn := Column;

  // ----------------------------------------

  // Выводим название в Memo под таблицей

  if not ADOQuery.Active or (ADOQuery.RecordCount <= 0) or
    (not Assigned(Node))
  then Exit;

  ADOQuery.RecNo := Node.Index + 1;
  Memo.Text := ADOQuery.FieldByName('Name').AsVariant;
  FrameStatusBar.InsertText(1, IntToStr(Node.Index + 1));
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFramePriceDumps.VSTGetText(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex;
  TextType: TVSTTextType; var CellText: string);
begin
  if not ADOQuery.Active then
    Exit;

  if (ADOQuery.RecordCount <= 0) then
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
    end;

    Exit;
  end;

  if Column > 0 then
    ADOQuery.RecNo := Node.Index + 1;

  case Column of
    0:
      CellText := IntToStr(Node.Index + 1);
    1:
      CellText := ADOQuery.FieldByName('Name').AsVariant;
    2:
      CellText := ADOQuery.FieldByName('PriceNotVAT').AsVariant;
    3:
      CellText := ADOQuery.FieldByName('PriceVAT').AsVariant;
    4:
      CellText := ADOQuery.FieldByName('Unit').AsVariant;
    5:
      CellText := ADOQuery.FieldByName('NameRegion').AsVariant;
  end;
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFramePriceDumps.VSTKeyPress(Sender: TObject; var Key: Char);
var
  NameColumn: string;
  NumCol: Integer;
begin
  NumCol := (Sender as TVirtualStringTree).FocusedColumn;

  if not(NumCol = 1) then
    Exit;

  // Разрешаем ввод русских смиволов (unicode) + символ "пробел" + цифры
  // Большие: А-Я = 1040-1071, Ё = 1025, Малые: а-я = 1072-1103, ё = 1105
  if ((Key >= #1040) and (Key <= #1103)) or (Key = #1025) or (Key = #1105) or (Key = #32) or
    ((Key >= '0') and (Key <= '9')) or (Key = '-') then
  begin
    NameColumn := string(NameVisibleColumns[NumCol]); // Название выделенного столбца

    StrQuickSearch := StrQuickSearch + string(Key); // Заносим символ в строку быстрого поиска

    FrameStatusBar.InsertText(2, string(StrQuickSearch));

    ReceivingSearch(NameColumn + ' LIKE ''' + string(StrQuickSearch) + '%''');
  end
  else if Key = #08 then // Если была нажата клавиша "Backspace"
  begin
    StrQuickSearch := ''; // Очищаем строку быстрого поиска

    FrameStatusBar.InsertText(2, '-1');

    ReceivingSearch('');
  end;
end;

end.
