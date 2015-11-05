unit KC6;

interface

uses
  Forms, Dialogs, StdCtrls, ComCtrls, ExtCtrls, Grids, DBGrids, Classes,
  Controls, DB, SysUtils, Messages, Menus, Variants, Windows, Graphics, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.Samples.Spin, Vcl.Mask, System.UITypes, JvDBGrid, JvExDBGrids, Vcl.DBCtrls, JvComponentBase,
  JvFormPlacement, JvExComCtrls, JvDBTreeView, Tools;

type
  TSplitter = class(ExtCtrls.TSplitter)
  public
    procedure Paint(); override;
  end;

type
  TfKC6 = class(TSmForm)

    PanelObject: TPanel;
    LabelObject: TLabel;
    EditObject: TEdit;

    PanelTree: TPanel;

    PanelKoef: TPanel;
    LabelKoef: TLabel;
    splTop: TSplitter;
    splBottom: TSplitter;

    PanelClient: TPanel;
    ImageSplitterTop: TImage;
    PanelBottomButton: TPanel;
    Button1: TButton;
    ButtonCancel: TButton;

    PanelBottom: TPanel;
    ImageSplitterBottom: TImage;
    Label1: TLabel;
    EditKoef: TSpinEdit;
    qrOtherActs: TFDQuery;
    dsOtherActs: TDataSource;
    dbgrd1: TJvDBGrid;
    qrOtherActsNumber: TIntegerField;
    qrOtherActsdocname: TStringField;
    qrOtherActsdate: TDateField;
    qrOtherActsosnov: TStringField;
    qrOtherActscnt: TFMTBCDField;
    grData: TJvDBGrid;
    qrData: TFDQuery;
    dsData: TDataSource;
    strngfldDataOBJ_CODE: TStringField;
    strngfldDataOBJ_UNIT: TStringField;
    qrDataOBJ_COUNT_OUT: TFloatField;
    qrDataID_TYPE_DATA: TIntegerField;
    qrDataSELECTED: TIntegerField;
    qrDataCHECKED: TBooleanField;
    qrDataSORT_ID: TStringField;
    qrDataITERATOR: TIntegerField;
    qrDataINCITERATOR: TIntegerField;
    qrDataSM_ID: TLongWordField;
    qrDataID_TABLES: TLongWordField;
    dbmmoOBJ_NAME: TDBMemo;
    strngfldDataOBJ_NAME: TStringField;
    qrTemp: TFDQuery;
    FormStorage: TJvFormStorage;
    qrDataOBJ_COUNT: TFloatField;
    qrDataCntDONE: TFloatField;
    qrDataOBJ_COUNT_IN: TFloatField;
    qrTreeData: TFDQuery;
    dsTreeData: TDataSource;
    tvEstimates: TJvDBTreeView;
    chkCopyTreeEstimates: TCheckBox;
    qrDataSORT_ID2: TStringField;

    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);

    procedure MyShow(const vIdObject: Integer);
    procedure RepaintImagesForSplitters();
    procedure ButtonCancelClick(Sender: TObject);

    procedure GetNameObject;
    procedure Button1Click(Sender: TObject);
    procedure CopyToAct(const vIdEstimate, vIdTypeData, vIdTables: Integer; const vCnt: Double;
      const vIdAct: Integer);
    procedure Label1Click(Sender: TObject);
    procedure EditKoefChange(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure qrOtherActsCalcFields(DataSet: TDataSet);
    procedure qrDataBeforeOpen(DataSet: TDataSet);
    procedure qrDataCalcFields(DataSet: TDataSet);
    procedure grDataDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure qrDataCHECKEDChange(Sender: TField);
    procedure qrDataAfterOpen(DataSet: TDataSet);
    procedure qrDataAfterScroll(DataSet: TDataSet);
    procedure grDataKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure grDataCanEditCell(Grid: TJvDBGrid; Field: TField; var AllowEdit: Boolean);
    procedure grDataKeyPress(Sender: TObject; var Key: Char);
    procedure grDataMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure qrDataOBJ_COUNT_INChange(Sender: TField);
    procedure qrTreeDataBeforeOpen(DataSet: TDataSet);
    procedure tvEstimatesCustomDrawItem(Sender: TCustomTreeView; Node: TTreeNode; State: TCustomDrawState;
      var DefaultDraw: Boolean);
    procedure tvEstimatesChange(Sender: TObject; Node: TTreeNode);
    procedure dbgrd1DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure grDataCellClick(Column: TColumn);
  private
    IdObject: Integer;
  public const
    Indent = '     ';

  end;

var
  fKC6: TfKC6;

implementation

uses Main, DataModule, DrawingTables, CalculationEstimate;

{$R *.dfm}

{ TSplitter }
procedure TSplitter.Paint();
begin
  // inherited;
  fKC6.RepaintImagesForSplitters();
end;

function CtrlDown: Boolean;
var
  State: TKeyboardState;
begin
  GetKeyboardState(State);
  Result := ((State[vk_Control] and 128) <> 0);
end;

procedure TfKC6.FormCreate(Sender: TObject);
begin
  inherited;
  // Загружаем изображения для сплиттеров
  with DM.ImageListHorozontalDots do
  begin
    GetIcon(0, ImageSplitterTop.Picture.Icon);
    GetIcon(0, ImageSplitterBottom.Picture.Icon);
  end;
  PanelBottom.Constraints.MinHeight := 100;
  PanelTree.Constraints.MinHeight := 100;
  // PanelClient.Constraints.MinHeight := 175;
end;

procedure TfKC6.FormResize(Sender: TObject);
begin
  FixDBGridColumnsWidth(dbgrd1);
end;

procedure TfKC6.FormShow(Sender: TObject);
begin
  // Настройка размеров и положения формы
  ClientWidth := FormMain.ClientWidth div 2;
  ClientHeight := FormMain.ClientHeight - 100;
  Top := 50;
  Left := ClientWidth div 2;
end;

procedure TfKC6.MyShow(const vIdObject: Integer);
begin
  IdObject := vIdObject;
  CloseOpen(qrData);
  CloseOpen(qrTreeData);
  tvEstimates.FullExpand;
  GetNameObject;
  if Assigned(FormCalculationEstimate) then
  begin
    chkCopyTreeEstimates.Checked := True;
    chkCopyTreeEstimates.Visible := FormCalculationEstimate.Act and (FormCalculationEstimate.getTYPE_ACT = 1);
  end;
  Show;
end;

procedure TfKC6.qrDataAfterOpen(DataSet: TDataSet);
var
  NumPP: Integer;
  Key: Variant;
begin
  if not CheckQrActiveEmpty(qrData) then
    Exit;
  Key := qrData.FieldByName('SORT_ID').Value;
  // Устанавливаем №пп
  qrData.DisableControls;
  qrData.AfterScroll := nil;
  qrData.OnCalcFields := nil;
  NumPP := 0;
  try
    qrData.First;
    while not qrData.Eof do
    begin
      NumPP := NumPP + qrData.FieldByName('INCITERATOR').AsInteger;
      qrData.Edit;
      if qrData.FieldByName('ID_TYPE_DATA').AsInteger < 0 then
        qrData.FieldByName('ITERATOR').Value := Null
      else
        qrData.FieldByName('ITERATOR').AsInteger := NumPP;
      qrData.Next;
    end;
  finally
    qrData.AfterScroll := qrDataAfterScroll;
    qrData.OnCalcFields := qrDataCalcFields;
    qrData.Locate('SORT_ID', Key, []);
    qrData.EnableControls;
  end;
end;

procedure TfKC6.qrDataAfterScroll(DataSet: TDataSet);
begin
  // Заполнение смежных актов
  qrOtherActs.Active := False;
  qrOtherActs.ParamByName('ID_TABLES').AsInteger := qrDataID_TABLES.Value;
  qrOtherActs.ParamByName('ID_TYPE_DATA').AsInteger := qrDataID_TYPE_DATA.Value;
  qrOtherActs.ParamByName('ID_OBJECT').AsInteger := IdObject;
  qrOtherActs.ParamByName('ID_ACT').AsInteger := qrData.ParamByName('ID_ACT').Value;

  qrOtherActs.Active := True;
  qrOtherActs.Last;
  qrOtherActs.First;
  dbgrd1.Repaint;
  if CheckQrActiveEmpty(qrTreeData) then
  begin
    tvEstimates.OnChange := nil;
    qrTreeData.Locate('SM_ID', qrData.FieldByName('SM_ID').Value, []);
    tvEstimates.Repaint;
    tvEstimates.OnChange := tvEstimatesChange;
  end;
end;

procedure TfKC6.qrDataBeforeOpen(DataSet: TDataSet);
begin
  if not Assigned(FormCalculationEstimate) then
    Exit;
  qrData.ParamByName('ID_OBJECT').Value := IdObject;
  qrData.ParamByName('ID_ACT').Value := FormCalculationEstimate.IdEstimate;
end;

procedure TfKC6.qrDataCalcFields(DataSet: TDataSet);
begin
  if qrDataID_TYPE_DATA.Value > 0 then
    qrDataOBJ_COUNT_OUT.Value := qrDataOBJ_COUNT.AsFloat - qrDataCntDONE.AsFloat - qrDataOBJ_COUNT_IN.AsFloat;
  qrDataCHECKED.OnChange := nil;
  if qrDataSELECTED.Value = 0 then
    qrDataCHECKED.Value := False
  else
    qrDataCHECKED.Value := True;
  { if qrDataOBJ_COUNT_IN.Value <> 0 then
    qrDataCHECKED.Value := True; }
  qrDataCHECKED.OnChange := qrDataCHECKEDChange;
end;

procedure TfKC6.qrDataCHECKEDChange(Sender: TField);
begin
  if qrDataCHECKED.Value then
    qrDataSELECTED.Value := 1
  else
    qrDataSELECTED.Value := 0;
end;

procedure TfKC6.qrDataOBJ_COUNT_INChange(Sender: TField);
begin
  if qrDataOBJ_COUNT_IN.Value <> 0 then
    qrDataSELECTED.Value := 1;
end;

procedure TfKC6.qrOtherActsCalcFields(DataSet: TDataSet);
begin
  qrOtherActsNumber.Value := DataSet.RecNo + 1;
end;

procedure TfKC6.qrTreeDataBeforeOpen(DataSet: TDataSet);
begin
  qrTreeData.ParamByName('OBJ_ID').Value := IdObject;
end;

procedure TfKC6.RepaintImagesForSplitters();
begin
  ImageSplitterTop.Top := splTop.Top;
  ImageSplitterTop.Left := splTop.Left + (splTop.Width - ImageSplitterTop.Width) div 2;

  ImageSplitterBottom.Top := splBottom.Top;
  ImageSplitterBottom.Left := splBottom.Left + (splBottom.Width - ImageSplitterBottom.Width) div 2;
end;

procedure TfKC6.Button1Click(Sender: TObject);
var
  Key: Variant;
  toAct: Integer;
begin
  if MessageBox(0, PChar('Перенести выделенные данные в акт?'), PWideChar(Caption),
    MB_ICONINFORMATION + MB_YESNO + mb_TaskModal) = mryes then
  begin
    qrTemp.SQL.Text :=
      'delete from data_row_temp WHERE SM_ID IN (SELECT SM_ID FROM smetasourcedata WHERE SOURCE_ID IS NOT NULL AND (PARENT_ID IN (SELECT SM_ID FROM smetasourcedata WHERE PARENT_ID = :ID_ACT) OR PARENT_ID = :ID_ACT));';
    qrTemp.ParamByName('ID_ACT').Value := FormCalculationEstimate.IdEstimate;
    qrTemp.ExecSQL;
    FastExecSQL
      ('DELETE FROM materialcard_temp WHERE DATA_ROW_ID NOT IN(SELECT DISTINCT ID FROM data_row_temp);',
      VarArrayOf([]));
    FastExecSQL
      ('DELETE FROM mechanizmcard_temp WHERE DATA_ROW_ID NOT IN(SELECT DISTINCT ID FROM data_row_temp);',
      VarArrayOf([]));
    FastExecSQL
      ('DELETE FROM devicescard_temp WHERE DATA_ROW_ID NOT IN(SELECT DISTINCT ID FROM data_row_temp);',
      VarArrayOf([]));
    FastExecSQL('DELETE FROM dumpcard_temp WHERE DATA_ROW_ID NOT IN(SELECT DISTINCT ID FROM data_row_temp);',
      VarArrayOf([]));
    FastExecSQL
      ('DELETE FROM transpcard_temp WHERE DATA_ROW_ID NOT IN(SELECT DISTINCT ID FROM data_row_temp);',
      VarArrayOf([]));
    FastExecSQL('DELETE FROM card_rate_temp WHERE DATA_ROW_ID NOT IN(SELECT DISTINCT ID FROM data_row_temp);',
      VarArrayOf([]));

    Key := qrDataSORT_ID.Value;
    qrData.DisableControls;
    qrData.AfterScroll := nil;
    // qrData.OnCalcFields := nil;
    if chkCopyTreeEstimates.Checked then
      toAct := FormCalculationEstimate.IdEstimate
    else
      toAct := FormCalculationEstimate.qrRatesExSM_ID.Value;
    try
      qrData.First;
      while not qrData.Eof do
      begin
        if qrDataCHECKED.Value and (qrDataID_TYPE_DATA.Value > 0) then
          CopyToAct(Integer(qrDataSM_ID.Value), Integer(qrDataID_TYPE_DATA.Value), qrDataID_TABLES.Value,
            Double(qrDataOBJ_COUNT_IN.Value), toAct);
        qrData.Next;
      end;
    finally
      qrData.Locate('SORT_ID', Key, []);
      qrData.EnableControls;
      qrData.AfterScroll := qrDataAfterScroll;
      // qrData.OnCalcFields := qrDataCalcFields;
    end;
  end;
  FormCalculationEstimate.OutputDataToTable;
end;

procedure TfKC6.ButtonCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfKC6.GetNameObject;
begin
  try
    with qrTemp do
    begin
      Active := False;
      SQL.Clear;
      SQL.Add('SELECT num, name FROM objcards WHERE obj_id = :obj_id;');
      ParamByName('obj_id').Value := IdObject;
      Active := True;

      EditObject.Text := IntToStr(FieldByName('num').AsInteger) + ' ' + FieldByName('name').AsString;
      Active := False;
    end;
  except
    on E: Exception do
      MessageBox(0, PChar('При получении имени и номера объекта возникла ошибка:' + sLineBreak + sLineBreak +
        E.Message), PWideChar(Caption), MB_ICONERROR + MB_OK + mb_TaskModal);
  end;
end;

procedure TfKC6.grDataCanEditCell(Grid: TJvDBGrid; Field: TField; var AllowEdit: Boolean);
begin
  AllowEdit := (not Grid.Columns[Grid.SelectedIndex].ReadOnly and (qrDataID_TYPE_DATA.Value > 0)) { or
    (Grid.SelectedField.FieldName = 'CHECKED') };
end;

procedure TfKC6.grDataCellClick(Column: TColumn);
var
  SORT_ID, Checked: Variant;
  TempBookmark: TBookMark;
begin
  if Column.Field = qrDataCHECKED then
  begin
    qrData.Edit;
    qrDataCHECKED.Value := not qrDataCHECKED.Value;
    qrData.CheckBrowseMode;
    SORT_ID := qrDataSORT_ID2.Value;
    Checked := qrDataCHECKED.Value;
    // Выделяем +/- такие же
    qrData.DisableControls;
    TempBookmark := grData.DataSource.DataSet.GetBookmark;
    qrData.AfterScroll := nil;
    try
      qrData.First;
      while not qrData.Eof do
      begin
        if Pos(SORT_ID, qrDataSORT_ID2.AsString) = 1 then
        begin
          qrData.Edit;
          qrDataCHECKED.Value := Checked;
        end;
        qrData.Next;
      end;
    finally
      grData.DataSource.DataSet.GotoBookmark(TempBookmark);
      grData.DataSource.DataSet.FreeBookmark(TempBookmark);
      qrData.EnableControls;
      qrData.AfterScroll := qrDataAfterScroll;
    end;

  end;
end;

procedure TfKC6.grDataDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
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

  with grData.Canvas do
  begin

    // if not CanEditField(Column.Field) then
    // Brush.Color := $00E1DFE0;

    // if qrData.FieldByName('sm_type').AsInteger = 1 then
    // Brush.Color := clSilver;
    //
    // if qrData.FieldByName('sm_type').AsInteger = 2 then
    // begin
    // Font.Style := Font.Style + [fsbold];
    // Brush.Color := clSilver;
    // end;

    if qrDataCHECKED.Value then
      grData.Canvas.Brush.Color := MixColors(grData.Canvas.Brush.Color, RGB(140, 200, 125), 100);

    if qrDataOBJ_COUNT_OUT.Value < 0 then
      grData.Canvas.Brush.Color := MixColors(grData.Canvas.Brush.Color, $00CBCAFF, 100);

    if qrDataID_TYPE_DATA.Value < 0 then
      grData.Canvas.Font.Style := grData.Canvas.Font.Style + [fsBold];
  end;
  grData.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfKC6.grDataKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_INSERT) or (Key = VK_SPACE) then
  begin
    qrData.Edit;
    // qrDataCHECKED.Value := not qrDataCHECKED.Value;
    if qrDataSELECTED.Value = 0 then
      qrDataSELECTED.Value := 1
    else
      qrDataSELECTED.Value := 0;
    qrData.Next;
  end;
end;

procedure TfKC6.grDataKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = ',' then
    Key := '.';
end;

procedure TfKC6.grDataMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if CtrlDown or (grData.SelectedField = qrDataCHECKED) then
  begin
    qrData.Edit;
    qrDataCHECKED.Value := not qrDataCHECKED.Value;
  end;
end;

procedure TfKC6.Label1Click(Sender: TObject);
begin
  EditKoef.Value := 0;
end;

procedure TfKC6.tvEstimatesChange(Sender: TObject; Node: TTreeNode);
begin
  qrData.Locate('SM_ID', qrTreeData.FieldByName('SM_ID').AsInteger, []);
end;

procedure TfKC6.tvEstimatesCustomDrawItem(Sender: TCustomTreeView; Node: TTreeNode; State: TCustomDrawState;
  var DefaultDraw: Boolean);
begin
  if Node.Selected then
  begin
    Sender.Canvas.Font.Color := clBlue;
    Sender.Canvas.Font.Style := Sender.Canvas.Font.Style + [fsItalic];
  end
end;

procedure TfKC6.CopyToAct(const vIdEstimate, vIdTypeData, vIdTables: Integer; const vCnt: Double;
  const vIdAct: Integer);
var
  doReplace: Boolean;
  mes: string;
  // Функция проверки наличия такой же строки в акте
  function checkExists(inFromEstimate, inAct, inTypeData, inIdTables: Integer): Boolean;
  var
    realAct: Integer;
    vLocalEstimateID, vLocalActID, vPTMActID: Variant;
  begin
    Result := False;
    realAct := inAct;
    // Если копирование вместе со структурой, то конечный inAct меняется
    if chkCopyTreeEstimates.Checked then
    begin
      vLocalEstimateID := FastSelectSQLOne
        ('SELECT sm.`PARENT_ID` FROM `smetasourcedata` sm WHERE sm.`SM_ID`=:0', VarArrayOf([inFromEstimate]));

      vLocalActID := FastSelectSQLOne
        ('SELECT sm.`SM_ID` FROM `smetasourcedata` sm WHERE ((sm.`SOURCE_ID`=:0) OR'#13 +
        '(sm.`SM_NUMBER`=(SELECT SM_NUMBER FROM `smetasourcedata` WHERE SM_ID=:1) AND sm.`NAME`=(SELECT `NAME` FROM `smetasourcedata` WHERE SM_ID=:2) AND sm.`SM_TYPE`=1)) AND sm.`PARENT_ID`=:3',
        VarArrayOf([vLocalEstimateID, vLocalEstimateID, vLocalEstimateID, inAct]));
      if VarIsNull(vLocalActID) then
        Exit;

      vPTMActID := FastSelectSQLOne
        ('SELECT sm.`SM_ID` FROM `smetasourcedata` sm WHERE ((sm.`SOURCE_ID`=:0) OR'#13 +
        '(sm.`SM_NUMBER`=(SELECT SM_NUMBER FROM `smetasourcedata` WHERE SM_ID=:1) AND sm.`NAME`=(SELECT `NAME` FROM `smetasourcedata` WHERE SM_ID=:2) AND sm.`SM_TYPE`=3)) AND sm.`PARENT_ID`=:3',
        VarArrayOf([inFromEstimate, inFromEstimate, inFromEstimate, vLocalActID]));
      if VarIsNull(vPTMActID) then
        Exit;
      realAct := vPTMActID;
    end;
    if not VarIsNull
      (FastSelectSQLOne('SELECT ID FROM DATA_ROW_TEMP WHERE SM_ID=:0 AND ID_TYPE_DATA=:1 AND ID_TABLES=:2',
      VarArrayOf([realAct, inTypeData, inIdTables]))) then
      Result := True;
    {
      case inTypeData of
      1:
      ;
      2:
      ;
      3:
      ;
      4:
      ;
      5:
      ;
      6, 7, 8, 9:
      ;
      10:
      ;
      11:
      ;
      end;
    }
  end;

begin
  try
    // По умолчанию всегда заменяем
    doReplace := True;
    // Если акт субподряда, то интерисуемся
    if FormCalculationEstimate.getTYPE_ACT = 1 then
    begin
      // Если строка уже добавлена
      if checkExists(vIdEstimate, vIdAct, vIdTypeData, vIdTables) then
      begin
        // выводим диалог выбора
        mes := 'Запись ' + string(strngfldDataOBJ_CODE.Value) + ' уже сожержится в акте.' + #13#10 +
          'Произвести замену существующей записи?' + #13#10 + 'Да - запись будет обновлена;' + #13#10 +
          'Нет - будет создана копия записи;' + #13#10 + 'Отмена - запись будет пропущена.';
        case Application.MessageBox(PWideChar(mes), 'Журна 6-КС', MB_YESNOCANCEL + MB_ICONQUESTION +
          MB_TOPMOST) of
          IDCANCEL:
            Exit;
          IDYES:
            begin
              doReplace := True;
            end;
          IDNO:
            doReplace := False;
        end;
      end;
    end;

    with qrTemp do
    begin
      SQL.Clear;
      SQL.Add('CALL DataToAct(:IdEstimate, :IdTypeData, :IdTables, :cnt, :vIdAct, :vCopyStruct, :inDoReplaceIfExists);');
      ParamByName('IdEstimate').Value := vIdEstimate;
      ParamByName('IdTypeData').Value := vIdTypeData;
      ParamByName('IdTables').Value := vIdTables;
      ParamByName('vIdAct').Value := vIdAct;
      ParamByName('cnt').Value := vCnt;
      ParamByName('vCopyStruct').Value := chkCopyTreeEstimates.Checked;
      // Если doReplace true - замена, false - создание копии в случае наличия записи
      ParamByName('inDoReplaceIfExists').Value := doReplace;
      ExecSQL;
    end;
  except
    on E: Exception do
      MessageBox(0, PChar('При занесении выделенных данные во временные таблицы возникла ошибка:' + sLineBreak
        + sLineBreak + E.Message), PWideChar(Caption), MB_ICONERROR + MB_OK + mb_TaskModal);
  end;
end;

procedure TfKC6.dbgrd1DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
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

procedure TfKC6.EditKoefChange(Sender: TObject);
var
  fl: Boolean;
  Key: Variant;
begin
  fl := False;
  Key := qrDataSORT_ID.Value;
  qrData.DisableControls;
  qrData.AfterScroll := nil;
  // qrData.OnCalcFields := nil;
  try
    qrData.First;
    while not qrData.Eof do
    begin
      if qrDataCHECKED.Value and (qrDataID_TYPE_DATA.Value > 0) then
      begin
        fl := True;
        qrData.Edit;
        qrDataOBJ_COUNT_IN.Value := (EditKoef.Value / 100) *
          (Double(qrDataOBJ_COUNT.Value) - Double(qrDataCntDONE.Value));
      end;
      qrData.Next;
    end;
  finally
    qrData.Locate('SORT_ID', Key, []);
    // qrData.OnCalcFields := qrDataCalcFields;
    qrData.AfterScroll := qrDataAfterScroll;
    qrData.EnableControls;
  end;
  // Высчитываем на текущей строке
  if not fl then
  begin
    qrDataOBJ_COUNT_IN.Value := (EditKoef.Value / 100) *
      (Double(qrDataOBJ_COUNT.Value) - Double(qrDataCntDONE.Value));
  end;
end;

end.
