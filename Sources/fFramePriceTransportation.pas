unit fFramePriceTransportations;

interface

uses
  Windows, SysUtils, Classes, Controls, Forms, StdCtrls, Grids, Buttons, ExtCtrls, DB, Menus, Clipbrd,
  fFrameProgressBar, fFrameStatusBar;

type
  TSplitter = class(ExtCtrls.TSplitter)
  private
    procedure Paint(); override;
  end;

type
  TFramePriceTransportations = class(TFrame)
    ADOQuery: TADOQuery;

    PopupMenu: TPopupMenu;
    CopyCell: TMenuItem;
    PriceTransportationSearch: TMenuItem;
    PriceTransportationSearchFast: TMenuItem;
    PriceTransportationSearchAccurate: TMenuItem;

    Panel: TPanel;

    PanelSearch: TPanel;
    LabelSearch: TLabel;
    EditSearch: TEdit;

    PanelStringGrid: TPanel;

    StringGrid: TStringGrid;
    SpeedButtonShowHide: TSpeedButton;
    ImageSplitter: TImage;

    PanelMemo: TPanel;
    Memo: TMemo;
    Splitter: TSplitter;

    procedure SettingTable;
    procedure ReceivingAll;
    procedure ReceivingSearch(vStr: String);
    procedure FillingTable(const AQ: TADOQuery; const SG: TStringGrid);

    procedure EditSearchEnter(Sender: TObject);
    procedure EditSearchKeyPress(Sender: TObject; var Key: Char);

    procedure FrameEnter(Sender: TObject);
    procedure FrameExit(Sender: TObject);
    procedure FrameResize(Sender: TObject);
    procedure PanelStringGridResize(Sender: TObject);

    procedure StringGridClick(Sender: TObject);
    procedure StringGridDblClick(Sender: TObject);
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

  private
    StrQuery: String; // Для формирования строки запроса к БД
    StrQuickSearch: String[20];
    NomColumn: Integer;

    FrameProgressBar: TFrameProgressBar;
    FrameStatusBar: TFrameStatusBar;

    AllowUseFilter: Boolean; // Блокировка компонента ADOQuery
    AllowAddition: Boolean;

  public
    procedure Initialize(const vFrameProgressBar: TFrameProgressBar; const vFrameStatusBar: TFrameStatusBar;
      const vAllowEdition: Boolean);

  end;

implementation

uses Main, DrawingTables, DataModule, CalculationEstimate;

{$R *.dfm}

const
  // Название этого фрейма
  CaptionFrame = 'Фрейм «Тарифы по грузоперевозкам»';

  // Массив содержащий названия всех видимых столбцов таблицы
  NameVisibleColumns: array [1 .. 1] of String[8] = ('distance');

  // ---------------------------------------------------------------------------------------------------------------------

  { TSplitter }
procedure TSplitter.Paint();
begin
  // inherited;
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFramePriceTransportations.Initialize(const vFrameProgressBar: TFrameProgressBar;
  const vFrameStatusBar: TFrameStatusBar; const vAllowEdition: Boolean);
begin
  FrameProgressBar := vFrameProgressBar;
  FrameStatusBar := vFrameStatusBar;
  AllowAddition := vAllowEdition;

  // ----------------------------------------

  AllowUseFilter := True;

  SettingTable;

  PanelMemo.Constraints.MinHeight := 35;
  SpeedButtonShowHide.Hint := 'Свернуть панель';

  with DM do
  begin
    ImageListHorozontalDots.GetIcon(0, ImageSplitter.Picture.Icon);
    ImageListArrowsBottom.GetBitmap(0, SpeedButtonShowHide.Glyph);
  end;
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFramePriceTransportations.SettingTable;
begin
  // НАСТРАИВАЕМ ТАБЛИЦУ

  with StringGrid do
  begin
    ColCount := 10; // Столбцов в таблице
    RowCount := 2; // Строк в таблице

    FixedCols := 1;
    FixedRows := 1;

    // Названия столбцов
    Cells[0, 0] := '№ п/п';
    Cells[1, 0] := 'Расстояние';
    Cells[2, 0] := 'I без НДС, руб';
    Cells[3, 0] := 'I с НДС, руб';
    Cells[4, 0] := 'II без НДС, руб';
    Cells[5, 0] := 'II с НДС, руб';
    Cells[6, 0] := 'III без НДС, руб';
    Cells[7, 0] := 'III с НДС, руб';
    Cells[8, 0] := 'IV без НДС, руб';
    Cells[9, 0] := 'IV с НДС, руб';

    // Ширина ВИДИМЫХ столбцов
    ColWidths[0] := 40;
    ColWidths[1] := 100;
    ColWidths[2] := 90;
    ColWidths[3] := 90;
    ColWidths[4] := 90;
    ColWidths[5] := 90;
    ColWidths[6] := 90;
    ColWidths[7] := 90;
    ColWidths[8] := 90;
    ColWidths[9] := 90;
  end;
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFramePriceTransportations.ReceivingAll;
begin
  StrQuickSearch := '';

  if not ADOQuery.Active then
    with ADOQuery do
    begin
      Active := False;

      // Создаём запрос
      StrQuery := 'SELECT * FROM transfercargo;';

      SQL.Clear;
      SQL.Add(StrQuery);
      Active := True;

      FillingTable(ADOQuery, StringGrid);
    end;
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFramePriceTransportations.ReceivingSearch(vStr: String);
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

procedure TFramePriceTransportations.FillingTable(const AQ: TADOQuery; const SG: TStringGrid);
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
      SG.Cells[1, i] := 'Записей не найдено!';
      SG.Cells[2, 1] := '';
      SG.Cells[3, i] := '';
      SG.Cells[4, i] := '';
      SG.Cells[5, i] := '';
      SG.Cells[6, i] := '';
      SG.Cells[7, i] := '';
      SG.Cells[8, i] := '';
      SG.Cells[9, i] := '';

      SG.Row := 1;

      Memo.Clear;

      FrameStatusBar.InsertText(0, '0');
      FrameStatusBar.InsertText(1, '');

      Exit;
    end;

    FrameProgressBar.SetMinMax(1, AQ.RecordCount);

    FrameProgressBar.Visible := True;

    SG.RowCount := AQ.RecordCount + 1;

    AQ.First;

    with AQ do
      while not Eof do
      begin
        Application.ProcessMessages;

        if AQ.RecordCount = 0 then
        begin
          FrameProgressBar.Visible := False;
          Exit;
        end;

        AllowUseFilter := False;

        with SG do
        begin
          Cells[0, i] := IntToStr(i);
          Cells[1, i] := FieldByName('distance').AsVariant;
          Cells[2, i] := FieldByName('class1_1').AsVariant;
          Cells[3, i] := FieldByName('class1_2').AsVariant;
          Cells[4, i] := FieldByName('class2_1').AsVariant;
          Cells[5, i] := FieldByName('class2_2').AsVariant;
          Cells[6, i] := FieldByName('class3_1').AsVariant;
          Cells[7, i] := FieldByName('class3_2').AsVariant;
          Cells[8, i] := FieldByName('class4_1').AsVariant;
          Cells[9, i] := FieldByName('class4_2').AsVariant;
        end;

        FrameProgressBar.IncPosition(i);

        Inc(i);
        Next;

        AllowUseFilter := True;
      end;

    SG.Row := 1;

    Memo.Text := SG.Cells[2, SG.Row];

    FrameStatusBar.InsertText(0, IntToStr(AQ.RecordCount)); // Выводим количество записей в таблице
    FrameStatusBar.InsertText(1, IntToStr(SG.Row));

    FrameProgressBar.Visible := False;

  except
    on E: Exception do
    begin
      FrameProgressBar.Visible := False;

      MessageBox(0, PChar('При заполнении таблицы возникла ошибка:' + sLineBreak + sLineBreak + E.Message),
        CaptionFrame, MB_ICONERROR + MB_OK + mb_TaskModal);
    end;
  end;
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFramePriceTransportations.EditSearchEnter(Sender: TObject);
begin
  LoadKeyboardLayout('00000419', KLF_ACTIVATE); // Русский
  // LoadKeyboardLayout('00000409', KLF_ACTIVATE); // Английский
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFramePriceTransportations.EditSearchKeyPress(Sender: TObject; var Key: Char);
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
      StringSearch := StringSearch + 'distance LIKE ''%' + Words[i] + '%'' and ';

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

procedure TFramePriceTransportations.FrameEnter(Sender: TObject);
begin
  with FrameStatusBar do
  begin
    InsertText(0, IntToStr(ADOQuery.RecordCount)); // Количество записей в таблице
    InsertText(1, IntToStr(StringGrid.Row)); // Номер выделенной записи в таблице
    EditSearch.SetFocus;
  end;
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFramePriceTransportations.FrameExit(Sender: TObject);
begin
  with FrameStatusBar do
  begin
    InsertText(0, '');
    InsertText(1, '');
    InsertText(2, '');
  end;
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFramePriceTransportations.FrameResize(Sender: TObject);
begin
  AutoWidthColumn(StringGrid, 2);
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFramePriceTransportations.PanelStringGridResize(Sender: TObject);
begin
  ImageSplitter.Top := Splitter.Top;
  ImageSplitter.Left := Splitter.Left + (Splitter.Width - ImageSplitter.Width) div 2;
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFramePriceTransportations.StringGridClick(Sender: TObject);
var
  i: Integer;
  Str: String;
  Sim: Char;
begin
  // Выводим название в Memo под таблицей
  with (Sender as TStringGrid) do
  begin
    Memo.Text := Cells[2, Row];
    FrameStatusBar.InsertText(1, IntToStr(Row));
  end;

  // -----------------------------------------

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

procedure TFramePriceTransportations.StringGridDblClick(Sender: TObject);
begin
  if not AllowAddition then
    Exit;

  if Assigned(FormCalculationEstimate) then
    FormCalculationEstimate.PopupMenuTableLeftAddClick(nil);
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFramePriceTransportations.StringGridDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect;
  State: TGridDrawState);
begin
  StringGridDrawCellDefault(Sender, ACol, ARow, Rect, State);
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFramePriceTransportations.StringGridEnter(Sender: TObject);
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

procedure TFramePriceTransportations.StringGridExit(Sender: TObject);
begin
  (Sender as TStringGrid).Repaint;

  StrQuickSearch := '';
  FrameStatusBar.InsertText(2, '');
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFramePriceTransportations.StringGridMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState;
  X, Y: Integer);
begin
  (Sender as TStringGrid).Repaint;
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFramePriceTransportations.StringGridMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
  if ssLeft in Shift then
    (Sender as TStringGrid).Repaint;
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFramePriceTransportations.StringGridKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  with (Sender as TStringGrid) do
    if (Key = Ord(#39)) and (ColWidths[Col + 1] = -1) then
      Key := Ord(#0);
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFramePriceTransportations.StringGridKeyPress(Sender: TObject; var Key: Char);
var
  NameColumn: string;
  NumCol: Integer;
begin
  NumCol := (Sender as TStringGrid).Col;

  if (NumCol = 1) then
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

procedure TFramePriceTransportations.SpeedButtonShowHideClick(Sender: TObject);
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

procedure TFramePriceTransportations.CopyCellClick(Sender: TObject);
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

procedure TFramePriceTransportations.MemoEnter(Sender: TObject);
begin
  Memo.SelStart := Length(Memo.Text);
end;

// ---------------------------------------------------------------------------------------------------------------------

end.
