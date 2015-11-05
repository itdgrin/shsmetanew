unit UniDict;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids,
  JvExDBGrids, JvDBGrid, Tools, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Vcl.DBCtrls, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Samples.Spin, System.DateUtils,
  Vcl.Mask, JvComponentBase, JvFormPlacement, System.UITypes;

type
  TfUniDict = class(TSmForm)
    qrUniDict: TFDQuery;
    dsUniDict: TDataSource;
    dbmmoparam_description: TDBMemo;
    seYear: TSpinEdit;
    lbl1: TLabel;
    lbl2: TLabel;
    dbedtcode: TDBEdit;
    lbl3: TLabel;
    qrUniDictid_unidictparam: TFDAutoIncField;
    strngfldUniDictcode: TStringField;
    strngfldUniDictparam_name: TStringField;
    strngfldUniDictparam_description: TStringField;
    qrUniDictMONTH_1: TFloatField;
    qrUniDictMONTH_2: TFloatField;
    qrUniDictMONTH_3: TFloatField;
    qrUniDictMONTH_4: TFloatField;
    qrUniDictMONTH_5: TFloatField;
    qrUniDictMONTH_6: TFloatField;
    qrUniDictMONTH_7: TFloatField;
    qrUniDictMONTH_8: TFloatField;
    qrUniDictMONTH_9: TFloatField;
    qrUniDictMONTH_10: TFloatField;
    qrUniDictMONTH_11: TFloatField;
    qrUniDictMONTH_12: TFloatField;
    qrSetParamValue: TFDQuery;
    qrUniDictType: TFDQuery;
    dsUniDictType: TDataSource;
    qrUniDictTypeLook: TFDQuery;
    dsUniDictTypeLook: TDataSource;
    qrUniDictid_unidicttype: TIntegerField;
    strngfldUniDictLookIDUniDictType: TStringField;
    pnlClient: TPanel;
    pnlLeft: TPanel;
    spl1: TSplitter;
    pnlClientCh: TPanel;
    gtUniDictType: TJvDBGrid;
    grUniDictParam: TJvDBGrid;
    FormStorage: TJvFormStorage;
    dbmmoparam_description1: TDBMemo;
    dbnvgr1: TDBNavigator;
    spl2: TSplitter;
    qrUniDicteditable: TShortintField;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure seYearChange(Sender: TObject);
    procedure qrUniDictMONTHChange(Sender: TField);
    procedure gtUniDictTypeEnter(Sender: TObject);
    procedure grUniDictParamEnter(Sender: TObject);
    procedure qrUniDictTypeAfterPost(DataSet: TDataSet);
    procedure qrUniDictTypeAfterScroll(DataSet: TDataSet);
    procedure qrUniDictTypeUpdateError(ASender: TDataSet; AException: EFDException; ARow: TFDDatSRow;
      ARequest: TFDUpdateRequest; var AAction: TFDErrorAction);
    procedure qrUniDictAfterPost(DataSet: TDataSet);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure changeEditMode;
    procedure qrUniDictTypeBeforeScroll(DataSet: TDataSet);
    procedure qrUniDictAfterScroll(DataSet: TDataSet);
    procedure gtUniDictTypeDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer;
      Column: TColumn; State: TGridDrawState);
    procedure grUniDictParamDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer;
      Column: TColumn; State: TGridDrawState);
  private
    editMode: Boolean;
  public
    { Public declarations }
  end;

var
  fUniDict: TfUniDict;

implementation

{$R *.dfm}

uses Main;

procedure TfUniDict.FormActivate(Sender: TObject);
begin
  // Если нажата клавиша Ctrl и выбираем форму, то делаем
  // каскадирование с переносом этой формы на передний план
  FormMain.CascadeForActiveWindow;
  // Делаем нажатой кнопку активной формы (на главной форме внизу)
  FormMain.SelectButtonActiveWindow(Caption);
  dbnvgr1.Visible := editMode;
  grUniDictParam.Columns[1].Visible := editMode;
end;

procedure TfUniDict.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfUniDict.FormCreate(Sender: TObject);
begin
  inherited;
  // Создаём кнопку от этого окна (на главной форме внизу)
  FormMain.CreateButtonOpenWindow(Caption, Caption, fUniDict, 1);
  grUniDictParam.TitleArrow := False;
  CloseOpen(qrUniDictType);
  CloseOpen(qrUniDictTypeLook);
  seYear.Value := YearOf(Now);
  seYearChange(Sender);
end;

procedure TfUniDict.FormDestroy(Sender: TObject);
begin
  fUniDict := nil;
  // Удаляем кнопку от этого окна (на главной форме внизу)
  FormMain.DeleteButtonCloseWindow(Caption);
end;

procedure TfUniDict.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  case Key of
    VK_F11:
      changeEditMode;
  end;
end;

procedure TfUniDict.changeEditMode;
begin
  editMode := not editMode;

  qrUniDictType.Filtered := not editMode;
  lbl3.Visible := editMode;
  lbl2.Visible := editMode;
  dbedtcode.Visible := editMode;
  dbmmoparam_description.Visible := editMode;
  grUniDictParam.Columns[1].Visible := editMode;
  dbnvgr1.Visible := editMode;
  gtUniDictType.ReadOnly := not editMode;
  grUniDictParam.ReadOnly := not editMode;
  grUniDictParam.TitleArrow := editMode;
end;

procedure TfUniDict.grUniDictParamDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer;
  Column: TColumn; State: TGridDrawState);
begin
  with (Sender AS TJvDBGrid).Canvas do
  begin
    Brush.Color := PS.BackgroundRows;
    Font.Color := PS.FontRows;

    // Строка в фокусе
    if (Assigned(TMyDBGrid((Sender AS TJvDBGrid)).DataLink) and
      ((Sender AS TJvDBGrid).Row = TMyDBGrid((Sender AS TJvDBGrid)).DataLink.ActiveRecord + 1)) then
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

procedure TfUniDict.grUniDictParamEnter(Sender: TObject);
begin
  dbnvgr1.DataSource := dsUniDict;
end;

procedure TfUniDict.gtUniDictTypeDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer;
  Column: TColumn; State: TGridDrawState);
begin
  with (Sender AS TJvDBGrid).Canvas do
  begin
    Brush.Color := PS.BackgroundRows;
    Font.Color := PS.FontRows;

    // Строка в фокусе
    if (Assigned(TMyDBGrid((Sender AS TJvDBGrid)).DataLink) and
      ((Sender AS TJvDBGrid).Row = TMyDBGrid((Sender AS TJvDBGrid)).DataLink.ActiveRecord + 1)) then
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

procedure TfUniDict.gtUniDictTypeEnter(Sender: TObject);
begin
  dbnvgr1.DataSource := dsUniDictType;
end;

procedure TfUniDict.qrUniDictAfterPost(DataSet: TDataSet);
begin
  CloseOpen(qrUniDict);
end;

procedure TfUniDict.qrUniDictAfterScroll(DataSet: TDataSet);
begin
  if not editMode then
    grUniDictParam.ReadOnly := qrUniDicteditable.Value = 0;
end;

procedure TfUniDict.qrUniDictMONTHChange(Sender: TField);
begin
  qrSetParamValue.ParamByName('inPARAM_CODE').AsString := dbedtcode.Text;
  qrSetParamValue.ParamByName('inMONTH').AsInteger := Sender.Tag;
  qrSetParamValue.ParamByName('inYEAR').AsInteger := seYear.Value;
  qrSetParamValue.ParamByName('inValue').Value := Sender.Value;
  qrSetParamValue.ExecSQL;
end;

procedure TfUniDict.qrUniDictTypeAfterPost(DataSet: TDataSet);
begin
  CloseOpen(qrUniDictTypeLook);
  CloseOpen(qrUniDictType);
end;

procedure TfUniDict.qrUniDictTypeAfterScroll(DataSet: TDataSet);
var
  res: Variant;
begin
  // Восстанавливаем значение высоты строк в правой таблице
  res := FastSelectSQLOne('SELECT unidicttype_RowsHeight FROM unidicttype WHERE unidicttype_id=:0',
    VarArrayOf([qrUniDictType.FieldByName('unidicttype_id').Value]));

  if VarIsNull(res) then
    grUniDictParam.RowsHeight := 17
  else
    grUniDictParam.RowsHeight := res;

  seYearChange(Self);
  // Убираем показ всех месяцев на некоторых типах
  if (qrUniDictType.FieldByName('unidicttype_first_month').Value = 1) and not editMode then
  begin
    // Скрываем
    grUniDictParam.Columns[2].Title.Caption := 'Значение';
    grUniDictParam.Columns[3].Visible := False;
    grUniDictParam.Columns[4].Visible := False;
    grUniDictParam.Columns[5].Visible := False;
    grUniDictParam.Columns[6].Visible := False;
    grUniDictParam.Columns[7].Visible := False;
    grUniDictParam.Columns[8].Visible := False;
    grUniDictParam.Columns[9].Visible := False;
    grUniDictParam.Columns[10].Visible := False;
    grUniDictParam.Columns[11].Visible := False;
    grUniDictParam.Columns[12].Visible := False;
    grUniDictParam.Columns[13].Visible := False;
  end
  else
  begin
    // Показываем
    grUniDictParam.Columns[2].Title.Caption := 'Январь';
    grUniDictParam.Columns[3].Visible := True;
    grUniDictParam.Columns[4].Visible := True;
    grUniDictParam.Columns[5].Visible := True;
    grUniDictParam.Columns[6].Visible := True;
    grUniDictParam.Columns[7].Visible := True;
    grUniDictParam.Columns[8].Visible := True;
    grUniDictParam.Columns[9].Visible := True;
    grUniDictParam.Columns[10].Visible := True;
    grUniDictParam.Columns[11].Visible := True;
    grUniDictParam.Columns[12].Visible := True;
    grUniDictParam.Columns[13].Visible := True;
  end;
end;

procedure TfUniDict.qrUniDictTypeBeforeScroll(DataSet: TDataSet);
begin
  // Сохраняем высоту строк в правой таблице, если изменилась
  if grUniDictParam.RowsHeight <> qrUniDictType.FieldByName('unidicttype_RowsHeight').AsInteger then
    FastExecSQL('UPDATE unidicttype SET unidicttype_RowsHeight=:0 WHERE unidicttype_id=:1',
      VarArrayOf([grUniDictParam.RowsHeight, qrUniDictType.FieldByName('unidicttype_id').Value]));
end;

procedure TfUniDict.qrUniDictTypeUpdateError(ASender: TDataSet; AException: EFDException; ARow: TFDDatSRow;
  ARequest: TFDUpdateRequest; var AAction: TFDErrorAction);
begin
  ASender.Cancel;
  AAction := eaDefault;
  Application.MessageBox('Данный тип записи не может быть изменен', 'Предупреждение',
    MB_OK + MB_ICONWARNING + MB_TOPMOST);
end;

procedure TfUniDict.seYearChange(Sender: TObject);
begin
  qrUniDict.ParamByName('year').AsInteger := seYear.Value;
  qrUniDict.ParamByName('id_unidicttype').AsInteger := qrUniDictType.FieldByName('unidicttype_id').AsInteger;
  CloseOpen(qrUniDict);
end;

end.
