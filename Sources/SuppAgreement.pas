unit SuppAgreement;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.DBCtrls, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids,
  JvExDBGrids, JvDBGrid, Vcl.Buttons, Vcl.StdCtrls, Tools;

type
  TfSuppAgreement = class(TSmForm)
    grMain: TJvDBGrid;
    pnl1: TPanel;
    pnl2: TPanel;
    dbnvgr1: TDBNavigator;
    qrMain: TFDQuery;
    dsMain: TDataSource;
    edtSearch: TEdit;
    btnSearch: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure qrMainNewRecord(DataSet: TDataSet);
    procedure grMainTitleClick(Column: TColumn);
    procedure btnSearchClick(Sender: TObject);
    procedure edtSearchKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    OBJ_ID: Integer;
  public

  end;

var
  fSuppAgreement: TfSuppAgreement;

procedure ShowSuppAgreement(const AOBJ_ID: Integer);

implementation

uses DataModule, GlobsAndConst;

{$R *.dfm}
{ TfSuppAgreement }

procedure TfSuppAgreement.btnSearchClick(Sender: TObject);
begin
  qrMain.Filter := 'UPPER(onDate) LIKE UPPER(''%' + Trim(edtSearch.Text) + '%'') OR ' +
    'UPPER(NUM) LIKE UPPER(''%' + Trim(edtSearch.Text) + '%'')';
  if (btnSearch.Tag = 0) and qrMain.FindFirst then
    btnSearch.Tag := 1
  else if not qrMain.FindNext then
    btnSearch.Tag := 0;
end;

procedure TfSuppAgreement.edtSearchKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
    btnSearch.Click;
end;

procedure TfSuppAgreement.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfSuppAgreement.FormCreate(Sender: TObject);
begin
  inherited;
end;

procedure TfSuppAgreement.FormDestroy(Sender: TObject);
begin
  fSuppAgreement := nil;
end;

procedure TfSuppAgreement.grMainTitleClick(Column: TColumn);
var
  s: string;
begin
  if not CheckQrActiveEmpty(qrMain) then
    Exit;
  s := '';
  if grMain.SortMarker = smDown then
    s := ' DESC';
  qrMain.SQL[qrMain.SQL.Count - 1] := 'ORDER BY ' + grMain.SortedField + s;
  CloseOpen(qrMain);
end;

procedure TfSuppAgreement.qrMainNewRecord(DataSet: TDataSet);
var NewId: Integer;
begin
  DM.qrDifferent.Active := False;
  DM.qrDifferent.SQL.Text := 'SELECT GetNewID(:IDType)';
  DM.qrDifferent.ParamByName('IDType').Value := C_ID_SUPPAG;
  DM.qrDifferent.Active := True;
  NewId := 0;
  if not DM.qrDifferent.Eof then
    NewId := DM.qrDifferent.Fields[0].AsInteger;
  DM.qrDifferent.Active := False;

  qrMain.FieldByName('supp_agreement_id').value := NewId;
  qrMain.FieldByName('OBJ_ID').Value := OBJ_ID;
  qrMain.FieldByName('onDate').Value := Now;
end;

procedure ShowSuppAgreement(const AOBJ_ID: Integer);
begin
  if (not Assigned(fSuppAgreement)) then
    fSuppAgreement := TfSuppAgreement.Create(nil);
  fSuppAgreement.OBJ_ID := AOBJ_ID;
  fSuppAgreement.qrMain.ParamByName('OBJ_ID').Value := AOBJ_ID;
  CloseOpen(fSuppAgreement.qrMain);
  fSuppAgreement.ShowModal;
end;

end.
