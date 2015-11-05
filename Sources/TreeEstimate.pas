unit TreeEstimate;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.ComCtrls, JvExComCtrls, JvDBTreeView,
  JvComponentBase, JvFormPlacement, Vcl.Menus, Tools;

type
  TfTreeEstimate = class(TSmForm)
    qrTreeEstimates: TFDQuery;
    dsTreeEstimates: TDataSource;
    tvEstimates: TJvDBTreeView;
    FormStorage: TJvFormStorage;
    pmTree: TPopupMenu;
    mUse: TMenuItem;
    mN2: TMenuItem;
    mN3: TMenuItem;
    mN4: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure tvEstimatesClick(Sender: TObject);
    procedure tvEstimatesDblClick(Sender: TObject);
    procedure pmTreePopup(Sender: TObject);
    procedure mUseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fTreeEstimate: TfTreeEstimate;

implementation

uses Main, CalculationEstimate, DataModule;

{$R *.dfm}

procedure TfTreeEstimate.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfTreeEstimate.FormCreate(Sender: TObject);
begin
  inherited;
  //
end;

procedure TfTreeEstimate.FormDestroy(Sender: TObject);
begin
  fTreeEstimate := nil;
end;

procedure TfTreeEstimate.mUseClick(Sender: TObject);
begin
  if not mUse.Enabled then
    Exit;

  if mUse.Checked then
    FastExecSQL('DELETE FROM ACT_SETUP_TEMP WHERE ID_ESTIMATE=:0',
      VarArrayOf([qrTreeEstimates.FieldByName('sm_id').Value]))
  else
    FastExecSQL('INSERT INTO ACT_SETUP_TEMP(ID_ESTIMATE) VALUES(:0)',
      VarArrayOf([qrTreeEstimates.FieldByName('sm_id').Value]));

  CloseOpen(FormCalculationEstimate.qrRatesEx);
end;

procedure TfTreeEstimate.pmTreePopup(Sender: TObject);
begin
  mUse.Visible := FormCalculationEstimate.Act;
  // ≈сли меню доступно, то получаем состо€ние
  if mUse.Visible then
  begin
    mUse.Checked := FastSelectSQLOne
      ('SELECT DISTINCT id_estimate FROM data_row_temp WHERE id_estimate=:0 UNION SELECT DISTINCT id_estimate FROM ACT_SETUP_TEMP WHERE id_estimate=:1',
      VarArrayOf([qrTreeEstimates.FieldByName('sm_id').Value, qrTreeEstimates.FieldByName('sm_id').Value]))
      = qrTreeEstimates.FieldByName('sm_id').Value;
    mUse.Enabled :=
      VarIsNull(FastSelectSQLOne('SELECT DISTINCT id_estimate FROM data_row_temp WHERE id_estimate=:0',
      VarArrayOf([qrTreeEstimates.FieldByName('sm_id').Value])));
  end;
end;

procedure TfTreeEstimate.tvEstimatesClick(Sender: TObject);
begin
  if Assigned(FormCalculationEstimate) then
    FormCalculationEstimate.qrRatesEx.Locate('SM_ID', qrTreeEstimates.FieldByName('SM_ID').AsInteger, []);
end;

procedure TfTreeEstimate.tvEstimatesDblClick(Sender: TObject);
begin
  if Assigned(FormCalculationEstimate) then
  begin
    if not(FormCalculationEstimate.Act) then
    begin
      FormCalculationEstimate.flChangeEstimate := True;
      FormCalculationEstimate.Close;
      if (not Assigned(FormCalculationEstimate)) then
        FormCalculationEstimate := TFormCalculationEstimate.Create(qrTreeEstimates.FieldByName('SM_ID').AsInteger);
      FormCalculationEstimate.EditNameEstimate.Text := qrTreeEstimates.FieldByName('NAME').AsString;
      FormCalculationEstimate.IdEstimate := qrTreeEstimates.FieldByName('SM_ID').AsInteger;
      // —оздание временных таблиц
      FormCalculationEstimate.CreateTempTables;
      // «аполнен€ временных таблиц, заполнение формы
      FormCalculationEstimate.OpenAllData;
      FormCalculationEstimate.frSummaryCalculations.LoadData(FormCalculationEstimate.IdEstimate);
      FormCalculationEstimate.flChangeEstimate := False;
      FormCalculationEstimate.WindowState := wsMaximized;
      // Close;
    end
    else
    begin
      pmTreePopup(nil);
      mUse.Click; // Ќе совсев верно пока попап не произошел
    end;
  end;
end;

end.
