unit CalculationEstimateSummaryCalculations;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Tools, Vcl.Menus, JvDBGrid, JvExDBGrids, JvComponentBase, JvFormPlacement, System.UITypes;

type
  TfrCalculationEstimateSummaryCalculations = class(TFrame)
    grSummaryCalculation: TJvDBGrid;
    qrData: TFDQuery;
    dsData: TDataSource;
    pm1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    FormStorage: TJvFormStorage;
    UpdateSQL: TFDUpdateSQL;
    mN3: TMenuItem;
    mN4: TMenuItem;
    mN5: TMenuItem;
    mN6: TMenuItem;
    procedure grSummaryCalculationDblClick(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure grSummaryCalculationCanEditCell(Grid: TJvDBGrid; Field: TField; var AllowEdit: Boolean);
    procedure grSummaryCalculationDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer;
      Column: TColumn; State: TGridDrawState);
    procedure qrDataAfterPost(DataSet: TDataSet);
    procedure mN3Click(Sender: TObject);
    procedure qrDataAfterCancel(DataSet: TDataSet);
    procedure mN4Click(Sender: TObject);
    procedure pm1Popup(Sender: TObject);
    procedure mN5Click(Sender: TObject);
    procedure mN6Click(Sender: TObject);
  private
    SM_ID: Integer;
    function CanEditField(Field: TField): Boolean;
  public
    function LoadData(const Args: Variant): Boolean;
  end;

implementation

{$R *.dfm}

uses BasicData, CardObject, Main, CalculationEstimate;

function TfrCalculationEstimateSummaryCalculations.CanEditField(Field: TField): Boolean;
begin
  Result := False;

  if not CheckQrActiveEmpty(qrData) or (qrData.FieldByName('sm_type').AsInteger <> 3) or
    (FormCalculationEstimate.PanelCalculationYesNo.Tag = 0) or (Field = grSummaryCalculation.Columns[0].Field)
    or (Field = grSummaryCalculation.Columns[1].Field) or (Field = grSummaryCalculation.Columns[2].Field) or
    (Field = grSummaryCalculation.Columns[3].Field) or (Field = grSummaryCalculation.Columns[26].Field) then
    Exit;

  Result := True;
end;

procedure TfrCalculationEstimateSummaryCalculations.grSummaryCalculationCanEditCell(Grid: TJvDBGrid;
  Field: TField; var AllowEdit: Boolean);
begin
  AllowEdit := CanEditField(Field);
end;

procedure TfrCalculationEstimateSummaryCalculations.grSummaryCalculationDblClick(Sender: TObject);
var
  Key: Variant;
begin
  Key := qrData.FieldByName('id_estimate').Value;
  FormBasicData.ShowForm(qrData.FieldByName('OBJ_ID').AsInteger, qrData.FieldByName('id_estimate').AsInteger);
  LoadData(SM_ID);
  qrData.Locate('id_estimate', Key, []);
end;

procedure TfrCalculationEstimateSummaryCalculations.grSummaryCalculationDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  with grSummaryCalculation.Canvas do
  begin
    Brush.Color := PS.BackgroundRows;
    Font.Color := PS.FontRows;

    if not CanEditField(Column.Field) then
      Brush.Color := $00E1DFE0;

    if qrData.FieldByName('sm_type').AsInteger = 1 then
      Brush.Color := clSilver;

    if qrData.FieldByName('sm_type').AsInteger = 2 then
    begin
      Font.Style := Font.Style + [fsbold];
      Brush.Color := clSilver;
    end;

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
      Font.Style := Font.Style + [fsbold];
    end;

    if (not Column.ReadOnly) and (qrData.FieldByName(Column.FieldName).Value <>
      qrData.FieldByName(Column.FieldName + 'F').Value) then
      Font.Color := clRed;
  end;
  grSummaryCalculation.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

function TfrCalculationEstimateSummaryCalculations.LoadData(const Args: Variant): Boolean;
begin
  Result := True;
  try
    qrData.Active := False;
    qrData.ParamByName('SM_ID').Value := Args;
    qrData.Active := True;
    SM_ID := Args;
  except
    Result := False;
  end;
end;

procedure TfrCalculationEstimateSummaryCalculations.mN3Click(Sender: TObject);
begin
  grSummaryCalculation.Options := grSummaryCalculation.Options + [dgEditing];
  qrData.Edit;
end;

procedure TfrCalculationEstimateSummaryCalculations.mN4Click(Sender: TObject);
begin
  if CanEditField(grSummaryCalculation.SelectedField) then
  begin
    qrData.Edit;
    qrData.FieldByName(grSummaryCalculation.SelectedField.FieldName).Value := Null;
    qrData.Post;
  end;
end;

procedure TfrCalculationEstimateSummaryCalculations.mN5Click(Sender: TObject);
var
  I: Integer;
begin
  if Application.MessageBox('Вы действительно хотите сбросить все значения строки на стандартные?',
    'Сводный расчет', MB_YESNO + MB_ICONQUESTION + MB_TOPMOST) = IDYES then
  begin
    qrData.Edit;
    for I := 4 to grSummaryCalculation.Columns.Count - 1 do
      if grSummaryCalculation.Columns[I].Field <> nil then
        qrData.FieldByName(grSummaryCalculation.Columns[I].Field.FieldName).Value := Null;
    qrData.Post;
  end;
end;

procedure TfrCalculationEstimateSummaryCalculations.mN6Click(Sender: TObject);
var
  Key: Variant;
  I: Integer;
  SQL, sep: string;
begin
  if Application.MessageBox('Вы действительно хотите сбросить все значения на стандартные?', 'Сводный расчет',
    MB_YESNO + MB_ICONQUESTION + MB_TOPMOST) = IDYES then
  begin
    qrData.DisableControls;
    try
      Key := qrData.Fields[0].Value;
      qrData.First;
      while not qrData.Eof do
      begin
        if qrData.FieldByName('sm_type').AsInteger = 3 then
        begin
          SQL := '';
          sep := ',';
          for I := 4 to grSummaryCalculation.Columns.Count - 1 do
          begin
            if I = (grSummaryCalculation.Columns.Count - 1) then
              sep := '';
            if grSummaryCalculation.Columns[I].Field <> nil then
              SQL := SQL + grSummaryCalculation.Columns[I].Field.FieldName + 'F=NULL' + sep + ''#13;
          end;
          FastExecSQL('UPDATE summary_calculation SET'#13 + SQL + 'WHERE SM_ID=:0',
            VarArrayOf([qrData.FieldByName('id_estimate').Value]));
        end;
        qrData.Next;
      end;
    finally
      qrData.Locate(qrData.Fields[0].FieldName, Key, []);
      CloseOpen(qrData);
      qrData.EnableControls;
    end;
  end;
end;

procedure TfrCalculationEstimateSummaryCalculations.N5Click(Sender: TObject);
begin
  fCardObject.ShowModal;
end;

procedure TfrCalculationEstimateSummaryCalculations.pm1Popup(Sender: TObject);
begin
  mN3.Visible := FormCalculationEstimate.PanelCalculationYesNo.Tag = 1;
  mN4.Visible := CanEditField(grSummaryCalculation.SelectedField);
  mN5.Visible := FormCalculationEstimate.PanelCalculationYesNo.Tag = 1;
  mN6.Visible := FormCalculationEstimate.PanelCalculationYesNo.Tag = 1;
end;

procedure TfrCalculationEstimateSummaryCalculations.qrDataAfterCancel(DataSet: TDataSet);
begin
  grSummaryCalculation.Options := grSummaryCalculation.Options - [dgEditing];
end;

procedure TfrCalculationEstimateSummaryCalculations.qrDataAfterPost(DataSet: TDataSet);
begin
  CloseOpen(qrData);
  grSummaryCalculation.Options := grSummaryCalculation.Options - [dgEditing];
end;

end.
