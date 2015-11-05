unit fFrameSSR;

interface

uses
  Windows, SysUtils, Classes, Controls, Forms, Variants, StdCtrls, Grids, Buttons, ExtCtrls, DB, Menus,
  Clipbrd,
  Graphics, fFrameStatusBar, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, fFrameSmeta, System.UITypes, Vcl.DBGrids, JvExDBGrids, JvDBGrid;

type
  TSplitter = class(ExtCtrls.TSplitter)
  public
    procedure Paint(); override;
  end;

type
  TFrameSSR = class(TSmetaFrame)

    CopyCell: TMenuItem;
    SSRSearch: TMenuItem;
    SSRSearchFast: TMenuItem;
    SSRSearchAccurate: TMenuItem;

    Panel: TPanel;
    PanelMemo: TPanel;
    PopupMenu: TPopupMenu;
    PanelSearch: TPanel;

    Memo: TMemo;
    Splitter: TSplitter;
    EditSearch: TEdit;
    LabelSearch: TLabel;
    ImageSplitter: TImage;
    PanelStringGrid: TPanel;
    SpeedButtonShowHide: TSpeedButton;
    StringGrid: TStringGrid;
    PanelMenu: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    ComboBox: TComboBox;
    FrameStatusBar: TFrameStatusBar;
    StringGrid2: TStringGrid;
    ADOQuery: TFDQuery;
    lbPrikazRef: TLabel;

    procedure SettingTable;
    procedure SettingTable2;
    procedure ReceivingAll2;
    procedure ReceivingSearch(vStr: String);
    procedure FillingTable(const AQ: TFDQuery; const SG: TStringGrid);
    procedure FillingTable2(const AQ: TFDQuery; const SG: TStringGrid);
    procedure FillingCombobox;

    procedure EditSearchEnter(Sender: TObject);
    procedure EditSearchKeyPress(Sender: TObject; var Key: Char);

    procedure FrameEnter(Sender: TObject);
    procedure FrameExit(Sender: TObject);
    procedure PanelStringGridResize(Sender: TObject);

    procedure StringGridGlobalClick(Sender: TObject);
    procedure StringGridDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
    procedure StringGridEnter(Sender: TObject);
    procedure StringGridExit(Sender: TObject);
    procedure StringGridMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure StringGridMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure StringGridKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure StringGridKeyPress(Sender: TObject; var Key: Char);

    procedure SpeedButtonShowHideClick(Sender: TObject);
    procedure CopyCellClick(Sender: TObject);
    procedure MemoEnter(Sender: TObject);
    procedure SpeedButtonClick(Sender: TObject);
    procedure ComboBoxClick(Sender: TObject);
    procedure StringGrid2DrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
    procedure StringGrid2Click(Sender: TObject);
    procedure StringGridClick(Sender: TObject);
    procedure lbPrikazRefClick(Sender: TObject);

  private
    StrQuery: String; // Для формирования строки запроса к БД
    StrQuickSearch: String;
    NomColumn: Integer;

    AllowUseFilter: Boolean; // Блокировка фильтрации в ADOQuery
  public
    procedure ReceivingAll; override;
    procedure CheckCurPeriod; override;
    constructor Create(AOwner: TComponent); override;
  end;

implementation

uses
  Main,
  DrawingTables,
  DataModule,
  CalculationEstimate,
  FileStorage,
  GlobsAndConst;

{$R *.dfm}

const
  // Название этого фрейма
  CaptionFrame = 'Фрейм «Справочники ССР»';

  // Массив содержащий названия всех видимых столбцов таблицы
  NameVisibleColumns: array [1 .. 2] of String = ('Code', 'Name');

  // ---------------------------------------------------------------------------------------------------------------------

  { TSplitter }
procedure TSplitter.Paint();
begin
  // inherited;
end;

// ---------------------------------------------------------------------------------------------------------------------

constructor TFrameSSR.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  // ----------------------------------------

  AllowUseFilter := True;

  SettingTable;
  SettingTable2;

  FillingCombobox;

  PanelMemo.Constraints.MinHeight := 35;
  SpeedButtonShowHide.Hint := 'Свернуть панель';

  with DM do
  begin
    ImageListHorozontalDots.GetIcon(0, ImageSplitter.Picture.Icon);
    ImageListArrowsBottom.GetBitmap(0, SpeedButtonShowHide.Glyph);
  end;
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFrameSSR.SettingTable;
begin
  // НАСТРАИВАЕМ ТАБЛИЦУ

  with StringGrid do
  begin
    ColCount := 8; // Столбцов в таблице
    RowCount := 2; // Строк в таблице

    FixedCols := 1;
    FixedRows := 1;

    // Названия столбцов
    Cells[0, 0] := '№ п/п';
    Cells[1, 0] := 'Вид строительства';
    Cells[2, 0] := 'Норма, %';
    Cells[3, 0] := 'ЗП';
    Cells[4, 0] := 'ЭМиМ';
    Cells[5, 0] := 'ЗП маш.';
    Cells[6, 0] := 'Материалы';
    Cells[7, 0] := 'Кф. пер. к трудоём.';

    // Ширина ВИДИМЫХ столбцов
    ColWidths[0] := 40;
    ColWidths[1] := 150;
    ColWidths[2] := 60;
    ColWidths[3] := 65;
    ColWidths[4] := 80;
    ColWidths[5] := 85;
    ColWidths[6] := 100;
    ColWidths[7] := 110;
  end;
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFrameSSR.SettingTable2;
begin
  // НАСТРАИВАЕМ ТАБЛИЦУ

  with StringGrid2 do
  begin
    ColCount := 4; // Столбцов в таблице
    RowCount := 2; // Строк в таблице

    FixedCols := 1;
    FixedRows := 1;

    // Названия столбцов
    Cells[0, 0] := '№ п/п';
    Cells[1, 0] := 'Номер';
    Cells[2, 0] := 'Вид строительства';
    Cells[3, 0] := 'Значение';

    // Ширина ВИДИМЫХ столбцов
    ColWidths[0] := 40;
    ColWidths[1] := 40;
    ColWidths[2] := 150;
    ColWidths[3] := 60;
  end;
end;

procedure TFrameSSR.CheckCurPeriod;
begin

end;

procedure TFrameSSR.ReceivingAll;
begin
  StrQuickSearch := '';

  with ADOQuery do
  begin
    Active := False;

    StrQuery := 'SELECT * FROM ssrdetail WHERE ssr_id = ' + IntToStr(ComboBox.ItemIndex + 1) +
      ' ORDER BY number_id ASC;';

    SQL.Clear;
    SQL.Add(StrQuery);
    Active := True;

    FillingTable(ADOQuery, StringGrid);
  end;

  StringGrid2.Visible := False;
  StringGrid2.Align := alNone;

  StringGrid.Align := alClient;
  StringGrid.Visible := True;

  fLoaded := True;
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFrameSSR.ReceivingAll2;
var
  NameTable: string;
begin
  StrQuickSearch := '';

  case ComboBox.ItemIndex of
    2:
      NameTable := 'ssrclients';
    3:
      NameTable := 'ssrreserve';
    4:
      NameTable := 'ssrcost';
  end;

  with ADOQuery do
  begin
    Active := False;

    StrQuery := 'SELECT * FROM ' + NameTable + ' ORDER BY number ASC;';

    SQL.Clear;
    SQL.Add(StrQuery);
    Active := True;

    FillingTable2(ADOQuery, StringGrid2);
  end;

  StringGrid.Visible := False;
  StringGrid.Align := alNone;

  StringGrid2.Align := alClient;
  StringGrid2.Visible := True;
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFrameSSR.ReceivingSearch(vStr: String);
begin
  while not AllowUseFilter do
    Application.ProcessMessages;

  with ADOQuery do
  begin
    Filtered := False;
    Filter := vStr;

    if vStr = '' then
      Filtered := False
    else
      Filtered := True;
  end;

  FillingTable(ADOQuery, StringGrid);
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFrameSSR.FillingTable(const AQ: TFDQuery; const SG: TStringGrid);
var
  i, nom: Integer;
begin
  // ЗАПОЛНЯЕМ ТАБЛИЦУ ПОЛУЧЕННЫМИ ДАННЫМИ

  try
    i := 1;

    if AQ.RecordCount = 0 then
    begin
      SG.RowCount := 2;

      SG.Cells[0, i] := '';
      SG.Cells[1, i] := 'Записей не найдено!';
      SG.Cells[2, 1] := '';
      SG.Cells[3, i] := '';
      SG.Cells[4, i] := '';
      SG.Cells[5, i] := '';
      SG.Cells[6, i] := '';
      SG.Cells[7, i] := '';

      SG.Row := 1;

      Memo.Clear;

      FrameStatusBar.InsertText(0, '0');
      FrameStatusBar.InsertText(1, '');

      Exit;
    end;

    SG.RowCount := AQ.RecordCount + 1;

    AQ.First;
    nom := 0;
    with AQ do
      while not Eof do
      begin
        Application.ProcessMessages;

        if AQ.RecordCount = 0 then
          Exit;

        AllowUseFilter := False;

        with SG do
        begin
          if FieldByName('coef_norm').AsVariant = NULL then
          begin
            nom := 0;
            Cells[0, i] := '';
          end
          else
            Cells[0, i] := IntToStr(nom);

          if FieldByName('name').AsVariant <> '' then
            Cells[1, i] := FieldByName('name').AsVariant
          else
            Cells[1, i] := '';

          if FieldByName('coef_norm').AsVariant <> NULL then
            Cells[2, i] := FieldByName('coef_norm').AsVariant
          else
            Cells[2, i] := '';

          if FieldByName('coef_zp').AsVariant <> NULL then
            Cells[3, i] := FieldByName('coef_zp').AsVariant
          else
            Cells[3, i] := '';

          if FieldByName('coef_ek_mash').AsVariant <> NULL then
            Cells[4, i] := FieldByName('coef_ek_mash').AsVariant
          else
            Cells[4, i] := '';

          if FieldByName('coef_zp_mash').AsVariant <> NULL then
            Cells[5, i] := FieldByName('coef_zp_mash').AsVariant
          else
            Cells[5, i] := '';

          if FieldByName('coef_mat').AsVariant <> NULL then
            Cells[6, i] := FieldByName('coef_mat').AsVariant
          else
            Cells[6, i] := '';

          if FieldByName('coef_work').AsVariant <> NULL then
            Cells[7, i] := FieldByName('coef_work').AsVariant
          else
            Cells[7, i] := '';
        end;

        Inc(i);
        Inc(nom);

        Next;

        AllowUseFilter := True;
      end;

    SG.Row := 1;

    Memo.Text := SG.Cells[2, SG.Row];

    FrameStatusBar.InsertText(0, IntToStr(AQ.RecordCount)); // Выводим количество записей в таблице
    FrameStatusBar.InsertText(1, IntToStr(SG.Row));
  except
    on E: Exception do
      MessageBox(0, PChar('При заполнении таблицы возникла ошибка:' + sLineBreak + sLineBreak + E.Message),
        CaptionFrame, MB_ICONERROR + MB_OK + mb_TaskModal);
  end;
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFrameSSR.FillingTable2(const AQ: TFDQuery; const SG: TStringGrid);
var
  i: Integer;
begin
  // ЗАПОЛНЯЕМ ТАБЛИЦУ ПОЛУЧЕННЫМИ ДАННЫМИ

  try
    i := 1;

    if AQ.RecordCount = 0 then
    begin
      SG.RowCount := 2;

      SG.Cells[0, i] := '';
      SG.Cells[1, i] := '';
      SG.Cells[2, 1] := 'Записей не найдено!';
      SG.Cells[3, i] := '';

      SG.Row := 1;

      Memo.Clear;

      FrameStatusBar.InsertText(0, '0');
      FrameStatusBar.InsertText(1, '');

      Exit;
    end;

    SG.RowCount := AQ.RecordCount + 1;

    AQ.First;

    with AQ do
      while not Eof do
      begin
        Application.ProcessMessages;

        if AQ.RecordCount = 0 then
          Exit;

        AllowUseFilter := False;

        with SG do
        begin
          Cells[0, i] := IntToStr(i);

          Cells[1, i] := FieldByName('number').AsVariant;

          if FieldByName('name').AsVariant <> NULL then
            Cells[2, i] := FieldByName('name').AsVariant;

          if FieldByName('value').AsVariant <> NULL then
            Cells[3, i] := FieldByName('value').AsVariant;
        end;

        Inc(i);
        Next;

        AllowUseFilter := True;
      end;

    SG.Row := 1;

    Memo.Text := SG.Cells[2, SG.Row];

    FrameStatusBar.InsertText(0, IntToStr(AQ.RecordCount)); // Выводим количество записей в таблице
    FrameStatusBar.InsertText(1, IntToStr(SG.Row));
  except
    on E: Exception do
      MessageBox(0, PChar('При заполнении таблицы2 возникла ошибка:' + sLineBreak + sLineBreak + E.Message),
        CaptionFrame, MB_ICONERROR + MB_OK + mb_TaskModal);
  end;
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFrameSSR.FillingCombobox;
begin
  try
    with ADOQuery do
    begin
      Active := False;
      SQL.Clear;
      StrQuery := 'SELECT * FROM ssr WHERE ssr_id < 6 ORDER BY ssr_id ASC;';
      SQL.Add(StrQuery);
      Active := True;

      First;
      ComboBox.Items.Clear;

      while not Eof do
      begin
        ComboBox.Items.Add(FieldByName('name').AsVariant);

        Next;
      end;

      Active := False;
    end;

    ComboBox.ItemIndex := 0;
  except
    on E: Exception do
      MessageBox(0, PChar('При заполнении выпадающего списка возникла ошибка:' + sLineBreak + sLineBreak +
        E.Message), CaptionFrame, MB_ICONERROR + MB_OK + mb_TaskModal);
  end;
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFrameSSR.EditSearchEnter(Sender: TObject);
begin
  LoadKeyboardLayout('00000419', KLF_ACTIVATE); // Русский
  // LoadKeyboardLayout('00000409', KLF_ACTIVATE); // Английский
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFrameSSR.EditSearchKeyPress(Sender: TObject; var Key: Char);
var
  StringSearch: String;
  CountWords, i: Integer;
  Words: array of String;
begin
  StringSearch := (Sender as TEdit).Text; // Получаем исходную поисковую строку

  // Если нажата клавиша "Enter" и строка поиска не пуста
  // или нажата клавиша "Пробел" и строка поиска длинной более 1 символа
  if (Key = #13) and (StringSearch <> '') { or (Key = #32) and (length(StringSearch) > 1) } then
  begin
    // Если в конце нет пробела, ставим
    if StringSearch[Length(StringSearch)] <> ' ' then
      StringSearch := StringSearch + ' ';

    CountWords := 0; // Обнуляем счётчик количества слов

    // Подсчитываем количество пробелов (столько же будет и слов)
    for i := 1 to Length(StringSearch) do
      if StringSearch[i] = ' ' then
        Inc(CountWords);

    SetLength(Words, CountWords); // Создаём массив для слов

    i := 0;

    // Заносим слова в массив
    while pos(' ', StringSearch) > 0 do
    begin
      Words[i] := Copy(StringSearch, 1, pos(' ', StringSearch) - 1);
      Delete(StringSearch, 1, pos(' ', StringSearch));
      Inc(i);
    end;

    StringSearch := '';

    for i := 0 to CountWords - 1 do
      StringSearch := StringSearch + 'Name LIKE ''%' + Words[i] + '%'' and ';

    Delete(StringSearch, Length(StringSearch) - 4, 5);

    ReceivingSearch(StringSearch);
  end
  // Если нажата клавиша ESC, или если нажата клавиша Enter и строка поиска пуста
  else if (Key = #27) or ((Key = #13) and (StringSearch = '')) then
  begin
    (Sender as TEdit).Text := '';

    ReceivingSearch('');
  end;
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFrameSSR.FrameEnter(Sender: TObject);
begin
  with FrameStatusBar do
  begin
    InsertText(0, IntToStr(ADOQuery.RecordCount)); // Количество записей в таблице
    InsertText(1, IntToStr(StringGrid.Row)); // Номер выделенной записи в таблице
    EditSearch.SetFocus;
  end;
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFrameSSR.FrameExit(Sender: TObject);
begin
  with FrameStatusBar do
  begin
    InsertText(0, '');
    InsertText(1, '');
    InsertText(2, '');
  end;
end;

procedure TFrameSSR.lbPrikazRefClick(Sender: TObject);
begin
  inherited;
  DM.qrDifferent.Active := False;

  case ComboBox.ItemIndex + 1 of
    1:
      DM.qrDifferent.SQL.Text := 'Select doc_id from doc where doc_id = 19';
    2:
      DM.qrDifferent.SQL.Text := 'Select doc_id from doc where doc_id = 17';
  else
    DM.qrDifferent.SQL.Text := 'Select doc_id from doc where doc_id = 0';
  end;
  DM.qrDifferent.Active := True;
  try
    if DM.qrDifferent.IsEmpty then
      // raise Exception.Create('Связь с документом не установлена.')
    else
      RunDocument(DM.qrDifferent, False);
  finally
    DM.qrDifferent.Active := False;
  end;
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFrameSSR.PanelStringGridResize(Sender: TObject);
begin
  ImageSplitter.Top := Splitter.Top;
  ImageSplitter.Left := Splitter.Left + (Splitter.Width - ImageSplitter.Width) div 2;

  StringGrid.Width := (Sender as TPanel).Width;
  StringGrid2.Width := (Sender as TPanel).Width;

  AutoWidthColumn(StringGrid, 1);
  AutoWidthColumn(StringGrid2, 2);
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFrameSSR.StringGrid2DrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect;
  State: TGridDrawState);
begin
  StringGridDrawCellDefault(Sender, ACol, ARow, Rect, State);
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFrameSSR.StringGridClick(Sender: TObject);
begin
  // Выводим название в Memo под таблицей
  with (Sender as TStringGrid) do
  begin
    Memo.Text := Cells[1, Row];
    FrameStatusBar.InsertText(1, IntToStr(Row));
  end;

  StringGridGlobalClick(Sender);
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFrameSSR.StringGrid2Click(Sender: TObject);
begin
  // Выводим название в Memo под таблицей
  with (Sender as TStringGrid) do
  begin
    Memo.Text := Cells[2, Row];
    FrameStatusBar.InsertText(1, IntToStr(Row));
  end;

  StringGridGlobalClick(Sender);
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFrameSSR.StringGridGlobalClick(Sender: TObject);
var
  i: Integer;
  Str: String;
  Sim: Char;
begin
  Sim := '*';

  with (Sender as TStringGrid) do
    for i := 1 to ColCount - 1 do
      if (i = Col) and (pos(Sim, Cells[i, 0]) <= 0) then
        Cells[i, 0] := Cells[i, 0] + Sim
      else if (i <> Col) and (pos(Sim, Cells[i, 0]) > 0) then
      begin
        Str := Cells[i, 0];
        Delete(Str, pos(Sim, Str), 1);
        Cells[i, 0] := Str;
      end;

  // -----------------------------------------

  (Sender as TStringGrid).Repaint;

  // Если перешли на другой столбец (колонку), то очищаем строку быстрого поиска
  if NomColumn <> (Sender as TStringGrid).Col then
  begin
    StrQuickSearch := '';
    FrameStatusBar.InsertText(2, '-1');
  end;

  NomColumn := (Sender as TStringGrid).Col;
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFrameSSR.StringGridDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect;
  State: TGridDrawState);
var
  WT: Integer;
begin
  StringGridDrawCellDefault(Sender, ACol, ARow, Rect, State);

  with (Sender as TStringGrid) do
  begin
    if (Cells[2, ARow] = '') { and (ACol = 0) } then
    begin
      Canvas.Brush.Color := RGB(35, 53, 94);
      Canvas.Font.Color := clWhite;
      Canvas.Font.Style := Canvas.Font.Style + [fsBold];

      // Rect.Right := ColWidths[0] + ColWidths[1] + ColWidths[2] + ColWidths[3] + ColWidths[4] + ColWidths[5] +
      // ColWidths[6] + ColWidths[7];
      Canvas.FillRect(Rect);
      WT := Canvas.TextWidth(Cells[ACol, ARow]);
      Canvas.TextOut(Rect.Left + (Rect.Right - Rect.Left - WT) div 2, Rect.Top + 3, Cells[ACol, ARow]);
    end;

    Canvas.Font.Style := Canvas.Font.Style - [fsBold];
  end;
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFrameSSR.StringGridEnter(Sender: TObject);
begin
  (Sender as TStringGrid).Repaint;

  FrameStatusBar.InsertText(0, IntToStr(ADOQuery.RecordCount));
  FrameStatusBar.InsertText(1, IntToStr((Sender as TStringGrid).Row));
  FrameStatusBar.InsertText(2, IntToStr(-1));

  with (Sender as TStringGrid) do
    Memo.Text := Cells[2, Row];

  LoadKeyboardLayout('00000419', KLF_ACTIVATE); // Русский
  // LoadKeyboardLayout('00000409', KLF_ACTIVATE); // Английский
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFrameSSR.StringGridExit(Sender: TObject);
begin
  (Sender as TStringGrid).Repaint;

  StrQuickSearch := '';
  FrameStatusBar.InsertText(2, '');
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFrameSSR.StringGridMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState;
  X, Y: Integer);
begin
  (Sender as TStringGrid).Repaint;
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFrameSSR.StringGridMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
  if ssLeft in Shift then
    (Sender as TStringGrid).Repaint;
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFrameSSR.StringGridKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  with (Sender as TStringGrid) do
    if (Key = Ord(#39)) and (ColWidths[Col + 1] = -1) then
      Key := Ord(#0);
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFrameSSR.StringGridKeyPress(Sender: TObject; var Key: Char);
var
  NameColumn: string;
  NumCol: Integer;
begin
  NumCol := (Sender as TStringGrid).Col;

  if (NumCol < 1) or (NumCol > 2) then
    Exit;

  // Разрешаем ввод русских смиволов (unicode) + символ "пробел" + цифры
  // Большие: А-Я = 1040-1071, Ё = 1025, Малые: а-я = 1072-1103, ё = 1105
  if ((Key >= #1040) and (Key <= #1103)) or (Key = #1025) or (Key = #1105) or (Key = #32) or
    ((Key >= '0') and (Key <= '9')) or (Key = '-') then
  begin
    NameColumn := NameVisibleColumns[NumCol]; // Название выделенного столбца

    StrQuickSearch := StrQuickSearch + Key; // Заносим символ в строку быстрого поиска

    FrameStatusBar.InsertText(2, StrQuickSearch);

    ReceivingSearch(NameColumn + ' LIKE ''' + StrQuickSearch + '%''');
  end
  else if Key = #08 then // Если была нажата клавиша "Backspace"
  begin
    StrQuickSearch := ''; // Очищаем строку быстрого поиска

    FrameStatusBar.InsertText(2, '-1');

    ReceivingSearch('');
  end;
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFrameSSR.SpeedButtonClick(Sender: TObject);
begin
  with (Sender as TSpeedButton) do
  begin
    ComboBox.ItemIndex := Tag - 1;

    if (Tag >= 3) and (Tag <= 5) then
      ReceivingAll2
    else
      ReceivingAll;
  end;
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFrameSSR.SpeedButtonShowHideClick(Sender: TObject);
begin
  with (Sender as TSpeedButton) do
  begin
    Glyph.Assign(nil);

    if Tag = 1 then
    begin
      Tag := 0;
      Splitter.Visible := False;
      PanelMemo.Visible := False;
      DM.ImageListArrowsTop.GetBitmap(0, Glyph);
      Hint := 'Развернуть панель';
    end
    else
    begin
      Tag := 1;
      PanelMemo.Visible := True;
      Splitter.Visible := True;
      Hint := 'Свернуть панель';
      DM.ImageListArrowsBottom.GetBitmap(0, Glyph);
    end;
  end;
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFrameSSR.ComboBoxClick(Sender: TObject);
begin
  with ComboBox do
    case ItemIndex of
      0:
        SpeedButton1.Down := True;
      1:
        SpeedButton2.Down := True;
      2:
        SpeedButton3.Down := True;
      3:
        SpeedButton4.Down := True;
      4:
        SpeedButton5.Down := True;
    end;

  if (ComboBox.ItemIndex + 1 >= 3) and (ComboBox.ItemIndex + 1 <= 5) then
    ReceivingAll2
  else
    ReceivingAll;
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFrameSSR.CopyCellClick(Sender: TObject);
var
  ClipBoard: TClipboard;
  Str: String;
begin
  ClipBoard := TClipboard.Create;

  with StringGrid do
    Str := Cells[Col, Row];

  ClipBoard.SetTextBuf(PWideChar(WideString(Str)));

  FreeAndNil(ClipBoard);
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFrameSSR.MemoEnter(Sender: TObject);
begin
  Memo.SelStart := Length(Memo.Text);
end;

// ---------------------------------------------------------------------------------------------------------------------

end.
