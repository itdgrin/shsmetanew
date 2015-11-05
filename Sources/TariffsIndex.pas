unit TariffsIndex;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, Grids, DBGrids,
  StdCtrls, Buttons, Tools,
  ExtCtrls, Menus, Clipbrd, DB, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

const
  ColumnsInTable = 3; // Число ВИДИМЫХ столбцов в таблице

type
  TFormTariffsIndex = class(TSmForm)
    DataSourceTariffsIndex: TDataSource;

    PopupMenu: TPopupMenu;
    PopupMenuCopy: TMenuItem;

    PanelTop: TPanel;
    LabelData: TLabel;
    EditMonth: TEdit;
    EditVAT: TEdit;
    LabelRecordCount: TLabel;
    EditRecordCount: TEdit;
    LabelSearch: TLabel;
    EditSearch: TEdit;

    DBGrid: TDBGrid;

    PanelBottom: TPanel;
    BitBtnFind: TBitBtn;
    BitBtnLoad: TBitBtn;
    ADOQueryTariffsIndex: TFDQuery;

    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);

    procedure DBGridColEnter(Sender: TObject);
    procedure DBGridDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure DBGridKeyPress(Sender: TObject; var Key: Char);
    procedure DBGridMouseWheel(Sender: TObject; Shift: TShiftState; WheelDelta: Integer; MousePos: TPoint;
      var Handled: Boolean);
    procedure DBGridMouseWheelDown(Sender: TObject; Shift: TShiftState; MousePos: TPoint;
      var Handled: Boolean);
    procedure DBGridMouseWheelUp(Sender: TObject; Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);

    procedure SetWidthColumns(const Column1: Integer; const Column2: Integer; const Column3: Integer;
      const SelIndex: Integer);
    procedure WidthColumnsFromDBGrid(const Grid: TDBGrid);
    procedure WidthColumnsToDBGrid(var Grid: TDBGrid);

    procedure EditSearchKeyPress(Sender: TObject; var Key: Char);

    procedure RunQuery(const P: Pointer);
    procedure PopupMenuCopyClick(Sender: TObject);
    procedure ADOQueryTariffsIndexAfterScroll(DataSet: TDataSet);
  private
    const CaptionButton = 'Тар. по статис. индексам';
    const HintButton = 'Окно тарифы по статистическим индексам';
  private
    IdSelectRecord: Integer; // Код выделенной записи
    StringQuery: String; // Строка для формирования запроса
    QuickSearch: String; // Строка быстрого поиска

    // Массив строк для быстрого поиска (для каждого столбца)
    StringQuickSearch: array [1 .. ColumnsInTable] of String;

  public

  protected
    procedure CreateParams(var Params: TCreateParams); override;
  end;

  // Хранение размеров ширины столбцов таблицы и номера активного столбца
  TWidthColumns = Record
    Column1: Integer;
    Column2: Integer;
    Column3: Integer;
    SelectedIndex: Integer;
  end;

const

  RenameColumns = 'id, i_statistic, i_rost, date_beg';

  // Общий запрос
  Query = 'SELECT ' + RenameColumns + ' FROM indexs';

  // Массив содержащий названия всех видимых столбцов
  NameColumns: array [1 .. ColumnsInTable] of String = ('i_statistic', 'i_rost', 'date_beg');

  // Массив содержащий русские названия всех видимых столбцов
  RusNameColumns: array [1 .. ColumnsInTable] of String = ('Статистический индекс', 'Рост', 'Дата');

  OrderBy = 'date_beg ASC';

var
  FormTariffsIndex: TFormTariffsIndex;
  WidthColumns: TWidthColumns;

implementation

uses Main, DataModule, Waiting;

{$R *.dfm}
// ---------------------------------------------------------------------------------------------------------------------

// УДАЛИТЬ. ЕСЛИ БУДЕТ НОРМАЛЬНО ОТОБРАЖАТЬСЯ
procedure TFormTariffsIndex.ADOQueryTariffsIndexAfterScroll(DataSet: TDataSet);
begin
  // При изменении записи, получаем её уникальный код
  IdSelectRecord := DataSet.Fields.Fields[0].AsInteger;
end;

procedure TFormTariffsIndex.CreateParams(var Params: TCreateParams);
begin
  inherited;
  // Params.Width := FormMain.Width;
  // Params.Height := FormMain.Height - 27;
  // Params.X := -4;
  // Params.Y := -30;
end;
// ---------------------------------------------------------------------------------------------------------------------

procedure TFormTariffsIndex.FormCreate(Sender: TObject);
begin
  // Настройка размеров и положения формы
  ClientWidth := FormMain.ClientWidth div 2;
  ClientHeight := FormMain.ClientHeight div 2;
  Top := 20;
  Left := 20;

  WindowState := wsMaximized;

  // Очищаем строку быстрого поиска
  QuickSearch := '';

  // -----------------------------------------

  // Создаём запрос
  StringQuery := Query + ' ORDER BY ' + OrderBy + ';';

  // Выполняем запрос
  RunQuery(@StringQuery);

  // Устанавливаем начальную ширину столбцов в таблице
  // и номер активного столбца
  SetWidthColumns(FormMain.ClientWidth div 3 - 16, FormMain.ClientWidth div 3 - 16,
    FormMain.ClientWidth div 3 - 16, 1);
  WidthColumnsToDBGrid(DBGrid);
  // Создаём кнопку от этого окна (на главной форме внизу)
  FormMain.CreateButtonOpenWindow(CaptionButton, HintButton, Self);
  inherited;
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFormTariffsIndex.FormShow(Sender: TObject);
begin
  // Устанавливаем фокус в таблицу
  DBGrid.SetFocus;
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFormTariffsIndex.FormActivate(Sender: TObject);
begin
  // Если нажата клавиша Ctrl и выбираем форму, то делаем
  // каскадирование с переносом этой формы на передний план
  FormMain.CascadeForActiveWindow;

  // Делаем нажатой кнопку активной формы (на главной форме внизу)
  FormMain.SelectButtonActiveWindow(CaptionButton);
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFormTariffsIndex.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFormTariffsIndex.FormDestroy(Sender: TObject);
begin
  FormTariffsIndex := nil;

  // Удаляем кнопку от этого окна (на главной форме внизу)
  FormMain.DeleteButtonCloseWindow(CaptionButton);
end;

// ---------------------------------------------------------------------------------------------------------------------

// Вставка символа в заголовок активного столбца
procedure TFormTariffsIndex.DBGridColEnter(Sender: TObject);
var
  i: Integer;
  Str: String;
  Sim: Char;
begin
  Sim := '*';
  with DBGrid do
    for i := 1 to Columns.Count - 1 do
      if i = SelectedIndex then
        Columns[i].Title.Caption := Columns[i].Title.Caption + Sim
      else if Pos(Sim, Columns[i].Title.Caption) > 0 then
      begin
        Str := Columns[i].Title.Caption;
        Delete(Str, Pos(Sim, Str), 1);
        Columns[i].Title.Caption := Str;
      end;
end;

// ---------------------------------------------------------------------------------------------------------------------

// Перерисовка ячеек таблицы
procedure TFormTariffsIndex.DBGridDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer;
  Column: TColumn; State: TGridDrawState);
begin
  if DBGrid.DataSource.DataSet.Fields.Fields[0].AsInteger = IdSelectRecord then
    if gdFocused in State then // Ячейка имеет фокус
    begin
      DBGrid.Canvas.Font.Color := clWhite;
      DBGrid.Canvas.Brush.Color := $00393939;
    end
    else // Не имеет фокуса
    begin
      DBGrid.Canvas.Font.Color := clWhite;
      DBGrid.Canvas.Brush.Color := $007B7B7B;
    end;

  DBGrid.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFormTariffsIndex.EditSearchKeyPress(Sender: TObject; var Key: Char);
var
  {SelectedColumn,} CountWords, i, k: Integer;
  StringSearch: String;
  Words: array of String;
begin
  // Открываем форму ожидания
  FormWaiting.Show;
  Application.ProcessMessages;

  // Если нажата клавиша "Enter" и строка поиска не пуста
  if (Key = #13) and (EditSearch.Text <> '') and (EditSearch.Text <> ' ') then
  begin
    // Получаем номер выделенного столбца в таблице
    {SelectedColumn := DBGrid.SelectedIndex;}

    // Получаем введённую пользователем строку поиска
    StringSearch := EditSearch.Text;

    // Если в конце нет пробела, ставим
    if StringSearch[Length(StringSearch)] <> ' ' then
      StringSearch := StringSearch + ' ';

    // Обнуляем счётчик количества слов
    CountWords := 0;

    // Подсчитываем количество пробелов (столько же будет и слов)
    for i := 1 to Length(StringSearch) do
      if StringSearch[i] = ' ' then
        Inc(CountWords);

    // Создаём массив для слов
    SetLength(Words, CountWords);

    i := 0;

    // Заносим слова в массив
    while Pos(' ', StringSearch) > 0 do
    begin
      Words[i] := Copy(StringSearch, 1, Pos(' ', StringSearch) - 1);
      Delete(StringSearch, 1, Pos(' ', StringSearch));
      Inc(i);
    end;

    // Заносим первоначальный запрос
    StringQuery := 'SELECT * FROM (' + Query + ' WHERE ((';

    // Для поиска по всем столбцам
    for k := 1 to ColumnsInTable do
    begin
      // Cовпадение по ВСЕМ введённым словам или частям слов в столбце таблицы
      // (в столбце должны находится все введёные слова или части этих слов)
      for i := 0 to CountWords - 1 do
        StringQuery := StringQuery + NameColumns[k] + ' LIKE "%' + Words[i] + '%" and ';

      Delete(StringQuery, Length(StringQuery) - 4, 5);

      StringQuery := StringQuery + ') or (';
    end;

    Delete(StringQuery, Length(StringQuery) - 4, 5);

    StringQuery := StringQuery + ') ORDER BY ' + OrderBy + ') AS T1';

    // Если количество слов больше одного, добавляем их для поиска по отдельным словам
    // (в столбце должно находится одно из введёных слов или часть этого слова)
    if CountWords > 1 then
    begin
      // Для поиска каждого отдельного слова
      for i := 0 to CountWords - 1 do
      begin

        StringQuery := StringQuery + ' UNION SELECT * FROM (' + Query + ' WHERE (';

        // Поиск в столбцах
        for k := 1 to ColumnsInTable do
          StringQuery := StringQuery + NameColumns[k] + ' LIKE "%' + Words[i] + '%" or ';

        Delete(StringQuery, Length(StringQuery) - 3, 4);

        StringQuery := StringQuery + ') ORDER BY ' + OrderBy + ') AS T' + IntToStr(i + 2);
      end;
    end;

    StringQuery := StringQuery + ';';

    // Сохраняем ширину колонок таблицы и номер активного столбца
    WidthColumnsFromDBGrid(DBGrid);

    // Выполняем запрос
    RunQuery(@StringQuery);

    // Восстанавливаем ширину колонок таблицы и номер активного столбца
    WidthColumnsToDBGrid(DBGrid);
  end
  // Если нажата клавиша Enter и строка поиска пуста или если нажата клавиша ESC и строка поиска не пуста
  else if ((Key = #13) and (EditSearch.Text = '')) or
    ((Key = #27) and (EditSearch.Text <> '') and (EditSearch.Text <> ' ')) then
  begin
    EditSearch.Text := ''; // Очищаем строку поиска

    StringQuery := Query + ' ORDER BY ' + OrderBy + ';';

    // Сохраняем ширину колонок таблицы и номер активного столбца
    WidthColumnsFromDBGrid(DBGrid);

    // Выполняем запрос
    RunQuery(@StringQuery);

    // Восстанавливаем ширину колонок таблицы и номер активного столбца
    WidthColumnsToDBGrid(DBGrid);
  end;

  // Закрываем форму с полосой ожидания
  FormWaiting.Close;
end;

// ---------------------------------------------------------------------------------------------------------------------

// Быстрый поиск по первым словам
procedure TFormTariffsIndex.DBGridKeyPress(Sender: TObject; var Key: Char);
var
  SelectedColumn, i: Integer;
begin
  // Разрешаем ввод русских смиволов (unicode) + символ "пробел" + цифры
  // Большие: А-Я = 1040-1071, Ё = 1025, Малые: а-я = 1072-1103, ё = 1105
  if ((Key >= #1040) and (Key <= #1103)) or (Key = #1025) or (Key = #1105) or (Key = #32) or
    ((Key >= '0') and (Key <= '9')) then
  begin
    // Получаем номер выделенного столбца в таблице
    SelectedColumn := DBGrid.SelectedIndex;

    // Заносим строку поиска в строку соотвествующего столбца
    StringQuickSearch[SelectedColumn] := StringQuickSearch[SelectedColumn] + string(Key);

    // Заносим первоначальный запрос
    StringQuery := Query + ' WHERE ';

    // Если строка поиска по столбцу не пустая, то добавляем поиск по этому столбцу
    for i := 1 to ColumnsInTable do
      if Length(StringQuickSearch[i]) > 0 then
        StringQuery := StringQuery + NameColumns[i] + ' LIKE "' + StringQuickSearch[i] + '%" and ';

    Delete(StringQuery, Length(StringQuery) - 4, 5);

    // Добавляем сортировку по выделенному столбцу
    StringQuery := StringQuery + ' ORDER BY ' + NameColumns[SelectedColumn] + ' ASC';

    StringQuery := StringQuery + ';';
  end
  else if Key = #08 then // Если была нажата клавиша "Backspace"
  begin
    // Очищаем строки быстрого поиска
    for i := 1 to ColumnsInTable do
      StringQuickSearch[i] := '';

    // Загружаем первичный запрос
    StringQuery := Query + ' ORDER BY ' + OrderBy + ';';
  end;

  // Сохраняем ширину колонок таблицы и номер активного столбца
  WidthColumnsFromDBGrid(DBGrid);

  // Выполняем запрос
  RunQuery(@StringQuery);

  // Восстанавливаем ширину колонок таблицы и номер активного столбца
  WidthColumnsToDBGrid(DBGrid);
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFormTariffsIndex.DBGridMouseWheel(Sender: TObject; Shift: TShiftState; WheelDelta: Integer;
  MousePos: TPoint; var Handled: Boolean);
begin
  if DBGrid.SelectedIndex > 1 then
  begin
    // Нажимаем кнопку влево на клавиатуре
    keybd_event(VK_LEFT, 0, 0, 0);
    keybd_event(VK_LEFT, 0, 2, 0);

    // Нажимаем кнопку вправо на клавиатуре
    keybd_event(VK_RIGHT, 0, 0, 0);
    keybd_event(VK_RIGHT, 0, 2, 0);
  end
  else
  begin
    // Нажимаем кнопку вправо на клавиатуре
    keybd_event(VK_RIGHT, 0, 0, 0);
    keybd_event(VK_RIGHT, 0, 2, 0);

    // Нажимаем кнопку влево на клавиатуре
    keybd_event(VK_LEFT, 0, 0, 0);
    keybd_event(VK_LEFT, 0, 2, 0);
  end;
end;

procedure TFormTariffsIndex.DBGridMouseWheelDown(Sender: TObject; Shift: TShiftState; MousePos: TPoint;
  var Handled: Boolean);
begin
  // Нажимаем кнопку вверх на клавиатуре
  keybd_event(VK_UP, 0, 0, 0);
  keybd_event(VK_UP, 0, 2, 0);

  // Нажимаем кнопку вних на клавиатуре
  keybd_event(VK_DOWN, 0, 0, 0);
  keybd_event(VK_DOWN, 0, 2, 0);
end;

procedure TFormTariffsIndex.DBGridMouseWheelUp(Sender: TObject; Shift: TShiftState; MousePos: TPoint;
  var Handled: Boolean);
begin
  // Нажимаем кнопку вних на клавиатуре
  keybd_event(VK_DOWN, 0, 0, 0);
  keybd_event(VK_DOWN, 0, 2, 0);

  // Нажимаем кнопку вверх на клавиатуре
  keybd_event(VK_UP, 0, 0, 0);
  keybd_event(VK_UP, 0, 2, 0);
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFormTariffsIndex.RunQuery(const P: Pointer);
var
  i: Integer;
  PQuery: ^String;
begin
  PQuery := P;

  try
    with ADOQueryTariffsIndex do
    begin
      Active := False;
      SQL.Clear;
      SQL.Add(PQuery^);
      Active := True;
    end;

    // Скрываем поле содержащее первичный ключ таблицы свалки
    DBGrid.Columns[0].Visible := False;

    // Получаем количество записей в таблице
    EditRecordCount.Text := IntToStr(ADOQueryTariffsIndex.RecordCount);

    // Переименовываем заголовки столбцов в таблице
    for i := 1 to ColumnsInTable do
      DBGrid.Columns[i].Title.Caption := RusNameColumns[i];
  except
    on E: Exception do
      MessageBox(0, PChar('Запрос не был выполнен.' + #13#10 + 'Подробнее об ошибке смотрите ниже:' + #13#10 +
        E.message), 'Запрос к MySQL серверу', MB_ICONWARNING + mb_OK + mb_TaskModal);
  end;
end;

// ---------------------------------------------------------------------------------------------------------------------



// ---------------------------------------------------------------------------------------------------------------------

procedure TFormTariffsIndex.SetWidthColumns(const Column1: Integer; const Column2: Integer;
  const Column3: Integer; const SelIndex: Integer);
begin
  WidthColumns.Column1 := Column1;
  WidthColumns.Column2 := Column2;
  WidthColumns.Column3 := Column3;
  WidthColumns.SelectedIndex := SelIndex;
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFormTariffsIndex.WidthColumnsFromDBGrid(const Grid: TDBGrid);
begin
  WidthColumns.Column1 := Grid.Columns[1].Width;
  WidthColumns.Column2 := Grid.Columns[2].Width;
  WidthColumns.Column3 := Grid.Columns[3].Width;
  WidthColumns.SelectedIndex := Grid.SelectedIndex;
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFormTariffsIndex.WidthColumnsToDBGrid(var Grid: TDBGrid);
begin
  Grid.Columns[1].Width := WidthColumns.Column1;
  Grid.Columns[2].Width := WidthColumns.Column2;
  Grid.Columns[3].Width := WidthColumns.Column3;
  Grid.SelectedIndex := WidthColumns.SelectedIndex;
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFormTariffsIndex.PopupMenuCopyClick(Sender: TObject);
var
  ClipBoard: TClipboard;
  Str: String;
begin
  ClipBoard := TClipboard.Create;

  with DBGrid do
  begin
    Str := Fields[SelectedIndex].AsString;
    ClipBoard.SetTextBuf(PWideChar(WideString(Str)));
  end;

  FreeAndNil(ClipBoard);
end;

// ---------------------------------------------------------------------------------------------------------------------

end.
