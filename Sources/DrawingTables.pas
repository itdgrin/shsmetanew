unit DrawingTables;

interface

uses
  Windows, Grids, Main, VirtualTrees, Graphics, ExtCtrls, Buttons;

procedure StringGridDrawCellDefault(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
procedure VSTAfterCellPaintDefault(Sender: TBaseVirtualTree; TargetCanvas: TCanvas; Node: PVirtualNode;
  Column: TColumnIndex; CellRect: TRect; const CellText: string);
procedure VSTBeforeCellPaintDefault(Sender: TBaseVirtualTree; TargetCanvas: TCanvas; Node: PVirtualNode;
  Column: TColumnIndex; CellPaintMode: TVTCellPaintMode; CellRect: TRect; var ContentRect: TRect);
procedure VSTFocusChangedDefault(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex);
procedure AutoWidthColumn(SG: TStringGrid; Nom: Integer); overload;
procedure AutoWidthColumn(VST: TVirtualStringTree; Nom: Integer); overload;
function FilteredString(const TextSearch, FieldFilter: string): string;
procedure MemoShowHide(const Sender: TObject; const Splitter: TSplitter; Panel: TPanel);

implementation

uses DataModule;

// ---------------------------------------------------------------------------------------------------------------------

procedure StringGridDrawCellDefault(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
begin
  // Так как свойство таблицы DefaultDrawing отключено (иначе ячейка таблицы будет обведена пунктирной линией)
  // необходимо самому прорисовывать шапку и все строки таблицы
  with (Sender as TStringGrid) do
  begin
    Canvas.Font.Size := PS.GridFontSize;
    Canvas.Font.Name := PS.GridFontName;
    Canvas.Font.Style := TFontStyles(PS.GridFontStyle);
    // Прорисовка шапки таблицы
    if (ARow = 0) or (ACol = 0) then
    begin
      Canvas.Brush.Color := PS.BackgroundHead;
      Canvas.Font.Color := PS.FontHead;
    end
    else // Прорисовка всех остальных строк
    begin
      Canvas.Brush.Color := PS.BackgroundRows;
      Canvas.Font.Color := PS.FontRows;
    end;

    Canvas.FillRect(Rect);
    Canvas.TextOut(Rect.Left + 3, Rect.Top + 3, Cells[ACol, ARow]);

    // Если таблица в фокусе и строка не равна первой строке
    if Focused and (Row = ARow) and (Row > 0) and (ACol > 0) then
    begin
      if gdFocused in State then // Ячейка в фокусе
      begin
        Canvas.Brush.Color := PS.BackgroundSelectCell;
        Canvas.Font.Color := PS.FontSelectCell;
      end
      else
      // Ячейка не в фокусе
      begin
        Canvas.Brush.Color := PS.BackgroundSelectRow;
        Canvas.Font.Color := PS.FontSelectRow;
      end;

      Canvas.FillRect(Rect);
      Canvas.TextOut(Rect.Left + 3, Rect.Top + 3, Cells[ACol, Row]);
    end;
  end;
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure VSTAfterCellPaintDefault(Sender: TBaseVirtualTree; TargetCanvas: TCanvas; Node: PVirtualNode;
  Column: TColumnIndex; CellRect: TRect; const CellText: string);
begin
  if not(vsSelected in Node.States) then
    Exit;

  if Sender.Focused then
    TargetCanvas.Font.Color := PS.FontSelectCell
  else
    TargetCanvas.Font.Color := clblack;
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure VSTBeforeCellPaintDefault(Sender: TBaseVirtualTree; TargetCanvas: TCanvas; Node: PVirtualNode;
  Column: TColumnIndex; CellPaintMode: TVTCellPaintMode; CellRect: TRect; var ContentRect: TRect);
begin
  if not(vsSelected in Node.States) then
    Exit;

  if Sender.Focused then
    TargetCanvas.Brush.Color := PS.BackgroundSelectRow
  else
    TargetCanvas.Brush.Color := PS.SelectRowUnfocusedTable;

  TargetCanvas.FillRect(CellRect);
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure VSTFocusChangedDefault(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex);
var
  i: Integer;
  Sim: Char;
  ColumnText: String;
begin
  Sim := '*';

  with (Sender as TVirtualStringTree) do
    for i := 0 to Header.Columns.Count - 1 do
      if (i = Column) and (pos(Sim, Header.Columns[i].Text) <= 0) then
        Header.Columns[Column].Text := Header.Columns[i].Text + Sim
      else if (i <> Column) and (pos(Sim, Header.Columns[i].Text) > 0) then
      begin
        ColumnText := Header.Columns[i].Text;
        Delete(ColumnText, pos(Sim, ColumnText), 1);
        Header.Columns[i].Text := ColumnText;
      end;
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure AutoWidthColumn(SG: TStringGrid; Nom: Integer);
var
  i: Integer;
  CalcWidth: Integer;
  ColNotVisible: Integer;
begin
  ColNotVisible := 0;

  with SG do
  begin
    CalcWidth := Width;

    for i := 0 to ColCount - 1 do
    begin
      if (i <> Nom) and (ColWidths[i] <> -1) then
        CalcWidth := CalcWidth - ColWidths[i];
      if ColWidths[i] = -1 then
        Inc(ColNotVisible);
    end;

    CalcWidth := CalcWidth - 5;

    if VisibleRowCount < (RowCount - 1) then
      CalcWidth := CalcWidth - GetSystemMetrics(SM_CXVSCROLL) - 1;

    CalcWidth := CalcWidth - (ColCount - ColNotVisible - 1);

    ColWidths[Nom] := CalcWidth;

    {
      CalcWidth := CalcWidth - GetSystemMetrics(SM_CXVSCROLL) - 6;
      CalcWidth := CalcWidth - (ColCount - ColNotVisible - 1);
      ColWidths[Nom] := CalcWidth;
    }
  end;
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure AutoWidthColumn(VST: TVirtualStringTree; Nom: Integer);
var
  i: Integer;
  CalcWidth: Integer;
begin
  CalcWidth := VST.Width;

  for i := 0 to VST.Header.Columns.Count - 1 do
    if (i <> Nom) and (coVisible in VST.Header.Columns[i].Options) then
      CalcWidth := CalcWidth - VST.Header.Columns[i].Width;

  CalcWidth := CalcWidth - GetSystemMetrics(SM_CXVSCROLL) - 5;

  VST.Header.Columns[Nom].Width := CalcWidth;
end;

// ---------------------------------------------------------------------------------------------------------------------

function FilteredString(const TextSearch, FieldFilter: string): string;
var
  StringSearch: String;
  CountWords, i: Integer;
  Words: array of String;
begin
  StringSearch := TextSearch;

  // Если в конце нет пробела, ставим
  if Length(StringSearch) > 0 then
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
    StringSearch := StringSearch + FieldFilter + ' LIKE ''%' + Words[i] + '%'' and ';

  Delete(StringSearch, Length(StringSearch) - 4, 5);

  Result := StringSearch;
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure MemoShowHide(const Sender: TObject; const Splitter: TSplitter; Panel: TPanel);
begin
  with (Sender as TSpeedButton) do
  begin
    Glyph.Assign(nil);

    if Tag = 1 then
    begin
      Tag := 0;
      Splitter.Visible := False;
      Panel.Visible := False;
      DM.ImageListArrowsTop.GetBitmap(0, Glyph);
      Hint := 'Развернуть панель';
    end
    else
    begin
      Tag := 1;
      Panel.Visible := True;
      Splitter.Visible := True;
      Hint := 'Свернуть панель';
      DM.ImageListArrowsBottom.GetBitmap(0, Glyph);
    end;
  end;
end;

// ---------------------------------------------------------------------------------------------------------------------

end.
