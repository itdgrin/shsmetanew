unit OXRandOPR;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, ExtCtrls, Grids,
  DBGrids, DB, DBCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Tools;

type
  TFormOXRandOPR = class(TSmForm)
    PanelMenu: TPanel;
    Panel1: TPanel;
    Label1: TLabel;
    RadioButtonMinsk: TRadioButton;
    RadioButtonCity: TRadioButton;
    RadioButtonVillage: TRadioButton;
    LabelResolution: TLabel;
    ComboBoxResolution: TComboBox;
    DBGrid: TDBGrid;
    DataSourceTable: TDataSource;
    Memo: TMemo;
    DataSourceTypeConstruction: TDataSource;
    DBLookupComboBoxTypeConstruction: TDBLookupComboBox;
    BevelLine: TBevel;
    ADOQueryTypeConstruction: TFDQuery;
    ADOQueryTable: TFDQuery;
    ADOQueryTemp: TFDQuery;

    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);

    procedure ADOQueryTableAfterScroll(DataSet: TDataSet);

    procedure FillingTypeConstruction;
    procedure FillingTable;
    procedure FillingResolution;

    procedure SelectRegion(Sender: TObject);
    procedure DBLookupComboBoxTypeConstructionClick(Sender: TObject);
    procedure Panel1Resize(Sender: TObject);
  private
    const FormCaption = 'ОХР и ОПР';
    const HintButton = 'Окно ОХР и ОПР';
  private
    StrQuery: String; // Для формирования разных запросов

  public

  end;

var
  FormOXRandOPR: TFormOXRandOPR;

implementation

uses Main, DataModule;

{$R *.dfm}
// ---------------------------------------------------------------------------------------------------------------------

procedure TFormOXRandOPR.FormCreate(Sender: TObject);
begin
  inherited;
  // Настройка размеров и положения формы
  ClientWidth := FormMain.ClientWidth div 2;
  ClientHeight := FormMain.ClientHeight div 2;
  Top := 20;
  Left := 20;

  WindowState := wsMaximized;

  // Создаём кнопку от этого окна (на главной форме внизу)
  FormMain.CreateButtonOpenWindow(FormCaption, HintButton, Self);

  // -----------------------------------------

  // Получаем категории строительства
  FillingTypeConstruction;

  // Заполняем таблицу
  FillingTable;

  // Выпадающий список поставнолений
  FillingResolution;
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFormOXRandOPR.FormActivate(Sender: TObject);
begin
  // Если нажата клавиша Ctrl и выбираем форму, то делаем
  // каскадирование с переносом этой формы на передний план
  FormMain.CascadeForActiveWindow;

  // Делаем нажатой кнопку активной формы (на главной форме внизу)
  FormMain.SelectButtonActiveWindow(FormCaption);
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFormOXRandOPR.FormShow(Sender: TObject);
begin
  // Устанавливаем фокус
  DBGrid.SetFocus;
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFormOXRandOPR.Panel1Resize(Sender: TObject);
begin
  ComboBoxResolution.Left := LabelResolution.Left + LabelResolution.Width + 6;
  ComboBoxResolution.Width := (Sender as TPanel).Width - ComboBoxResolution.Left - 3;
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFormOXRandOPR.FormResize(Sender: TObject);
begin
  with DBGrid.Columns do
  begin
    Items[4].Width := DBGrid.Width - Items[3].Width - Items[5].Width - Items[6].Width -
      GetSystemMetrics(SM_CXVSCROLL) - 21;

    {
      - Items[7].Width - Items[8].Width
      - Items[9].Width - Items[10].Width - GetSystemMetrics(SM_CXVSCROLL) - 25;
    }
  end;
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFormOXRandOPR.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFormOXRandOPR.FormDestroy(Sender: TObject);
begin
  FormOXRandOPR := nil;

  // Удаляем кнопку от этого окна (на главной форме внизу)
  FormMain.DeleteButtonCloseWindow(FormCaption);
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFormOXRandOPR.ADOQueryTableAfterScroll(DataSet: TDataSet);
begin
  // Выводим содержиое ячейки "Название" в мемо
  with Memo, DataSet do
  begin
    Memo.Clear;
    Memo.Text := FieldByName('NameWork').AsString;
  end;
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFormOXRandOPR.FillingTypeConstruction;
var
  IdRegion: Integer;
begin
  if RadioButtonMinsk.Checked then
    IdRegion := 3
  else if RadioButtonCity.Checked then
    IdRegion := 1
  else
    IdRegion := 2;

  with ADOQueryTypeConstruction do
  begin
    Active := False;
    SQL.Clear;

    StrQuery := 'SELECT * FROM objstroj WHERE obj_region = ' + IntToStr(IdRegion);

    SQL.Add(StrQuery);
    Active := True;
  end;

  // Находим минимальный Id типа строительства
  with DataSourceTypeConstruction.DataSet do
  begin
    First;
    IdRegion := FieldByName('stroj_id').AsVariant;
    Next;

    while Eof do
      if IdRegion < FieldByName('stroj_id').AsVariant then
        IdRegion := FieldByName('stroj_id').AsVariant;

    Next;
  end;

  with DBLookupComboBoxTypeConstruction do
  begin
    ListSource := DataSourceTypeConstruction;
    ListField := 'name';
    KeyField := 'stroj_id';
    KeyValue := IdRegion;
  end;
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFormOXRandOPR.FillingTable;
begin
  try
    with ADOQueryTable do
    begin
      Active := False;
      SQL.Clear;

      StrQuery :=
        'SELECT id as "Id", stroj_id as "IdStroj", order_id as "IdOrder", number as "Number", name as "NameWork", ' +
        'p1 as "P1", p2 as "P2", p3 as " p3 ", p4 as " p4 ", date_beg as " DataBegin ", date_end as " DataEnd " ' +
        'FROM objdetail WHERE stroj_id = ' + IntToStr(DBLookupComboBoxTypeConstruction.KeyValue) +
        ' ORDER BY number ASC';

      SQL.Add(StrQuery);
      Active := True;
    end;

    DataSourceTable.DataSet.RecNo := 1;
  except
    on E: Exception do
      MessageBox(0, PChar('При получении данных таблицы возникла ошибка:' + sLineBreak + sLineBreak + E.Message),
        FormCaption, MB_ICONERROR + MB_OK + mb_TaskModal);
  end;
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFormOXRandOPR.FillingResolution;
begin
  try
    with ADOQueryTemp do
    begin
      Active := False;
      SQL.Clear;

      StrQuery := 'SELECT * FROM mais ORDER BY onDate DESC;';

      SQL.Add(StrQuery);
      Active := True;

      First;
      ComboBoxResolution.Items.Clear;

      while not Eof do
      begin
        ComboBoxResolution.Items.Add(FieldByName('comment').AsVariant);

        Next;
      end;
    end;

    ComboBoxResolution.ItemIndex := 0;
  except
    on E: Exception do
      MessageBox(0, PChar('При получении значений выпадающего списка ' + sLineBreak + '«Постановления» возникла ошибка:'
        + sLineBreak + sLineBreak + E.Message), FormCaption, MB_ICONERROR + MB_OK + mb_TaskModal);
  end;
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFormOXRandOPR.SelectRegion(Sender: TObject);
begin
  FillingTypeConstruction;
  FillingTable;
  DBGrid.SetFocus;
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFormOXRandOPR.DBLookupComboBoxTypeConstructionClick(Sender: TObject);
begin
  FillingTable;
  DBGrid.SetFocus;
end;

// ---------------------------------------------------------------------------------------------------------------------

end.
