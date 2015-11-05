unit CardObjectContractorServices;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Vcl.Grids, Vcl.DBGrids, JvExDBGrids, JvDBGrid, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.DBCtrls, Vcl.DBCGrids, JvComponentBase, JvFormPlacement,
  System.UITypes, Tools;

type
  TfCardObjectContractorServices = class(TSmForm)
    pnlBott: TPanel;
    btnCancel: TBitBtn;
    btnSave: TBitBtn;
    qrMain: TFDQuery;
    dsMain: TDataSource;
    grMain: TJvDBGrid;
    qrMainid_unidictparam: TFDAutoIncField;
    strngfldMaincode: TStringField;
    strngfldMainparam_name: TStringField;
    strngfldMainparam_description: TStringField;
    qrMainVALUE: TFloatField;
    qrMainChecked: TBooleanField;
    qrMainNO: TLargeintField;
    FormStorage: TJvFormStorage;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure qrMainCalcFields(DataSet: TDataSet);
    procedure qrMainCheckedChange(Sender: TField);
    procedure qrMainAfterOpen(DataSet: TDataSet);
    procedure FormResize(Sender: TObject);
    procedure grMainDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
  private
    flLoading: Boolean;
  public
    CheckMask: Integer;

  end;

var
  fCardObjectContractorServices: TfCardObjectContractorServices;

function EditContractorServices(const aCONTRACTOR_SERV: Integer): Variant;
procedure ShowContractorServices;

implementation

{$R *.dfm}

uses Main, DataModule;

procedure ShowContractorServices;
begin
  if (not Assigned(fCardObjectContractorServices)) then
    fCardObjectContractorServices := TfCardObjectContractorServices.Create(nil, NULL);
  fCardObjectContractorServices.CheckMask := 0;
  fCardObjectContractorServices.qrMain.ParamByName('MONTH').AsInteger := 1; // !!!
  fCardObjectContractorServices.qrMain.ParamByName('YEAR').AsInteger := 2015; // !!!
  fCardObjectContractorServices.qrMain.Active := True;
  fCardObjectContractorServices.grMain.Columns[0].Visible := False;
  fCardObjectContractorServices.pnlBott.Visible := False;
  fCardObjectContractorServices.grMain.ReadOnly := True;
  fCardObjectContractorServices.ShowModal;
end;

function EditContractorServices(const aCONTRACTOR_SERV: Integer): Variant;
var
  res: Variant;
begin
  Result := Null;
  if (not Assigned(fCardObjectContractorServices)) then
    fCardObjectContractorServices := TfCardObjectContractorServices.Create(nil, NULL);
  fCardObjectContractorServices.CheckMask := aCONTRACTOR_SERV;
  fCardObjectContractorServices.qrMain.ParamByName('MONTH').AsInteger := 1; // !!!
  fCardObjectContractorServices.qrMain.ParamByName('YEAR').AsInteger := 2015; // !!!
  fCardObjectContractorServices.qrMain.Active := True;
  if fCardObjectContractorServices.ShowModal = mrOk then
  begin
    res := VarArrayCreate([0, 1], varVariant);
    res[0] := fCardObjectContractorServices.CheckMask;
    fCardObjectContractorServices.qrMain.first;
    fCardObjectContractorServices.qrMain.DisableControls;
    res[1] := 0;
    while not fCardObjectContractorServices.qrMain.Eof do
    begin
      if fCardObjectContractorServices.qrMainChecked.Value then
        res[1] := res[1] + fCardObjectContractorServices.qrMainVALUE.Value;
      fCardObjectContractorServices.qrMain.Next;
    end;
    fCardObjectContractorServices.qrMain.EnableControls;
    Result := res;
  end;
end;

procedure TfCardObjectContractorServices.btnCancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfCardObjectContractorServices.btnSaveClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfCardObjectContractorServices.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfCardObjectContractorServices.FormDestroy(Sender: TObject);
begin
  fCardObjectContractorServices := nil;
end;

procedure TfCardObjectContractorServices.FormResize(Sender: TObject);
begin
  if qrMain.RecordCount > grMain.VisibleRowCount then
    grMain.ScrollBars := ssVertical
  else
    grMain.ScrollBars := ssNone;
end;

procedure TfCardObjectContractorServices.grMainDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
//
end;

procedure TfCardObjectContractorServices.qrMainAfterOpen(DataSet: TDataSet);
var
  RecNo: Integer;
begin
  flLoading := True;
  qrMain.first;
  RecNo := 0;
  while not qrMain.Eof do
  begin
    qrMain.Edit;
    qrMainNO.Value := RecNo;
    qrMain.Next;
    Inc(RecNo)
  end;
  qrMain.first;
  flLoading := False;
end;

procedure TfCardObjectContractorServices.qrMainCalcFields(DataSet: TDataSet);
begin
  qrMainChecked.Value := (CheckMask and (1 shl qrMainNO.Value)) = 0;
end;

procedure TfCardObjectContractorServices.qrMainCheckedChange(Sender: TField);
begin
  if not flLoading then
    CheckMask := (CheckMask xor (1 shl qrMainNO.Value));
end;

end.
