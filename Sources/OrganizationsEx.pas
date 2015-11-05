unit OrganizationsEx;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, Tools,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, JvExDBGrids, JvDBGrid, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.DBCtrls, JvComponentBase, JvFormPlacement, System.UITypes;

type
  TfOrganizationsEx = class(TSmForm)
    qrMain: TFDQuery;
    dsMain: TDataSource;
    grMain: TJvDBGrid;
    pnlBott: TPanel;
    btnCancel: TBitBtn;
    btnSelect: TBitBtn;
    pnl1: TPanel;
    lbl1: TLabel;
    dbnvgr1: TDBNavigator;
    edtSearch: TEdit;
    dbmmoFULL_NAME: TDBMemo;
    lbl2: TLabel;
    FormStorage: TJvFormStorage;
    btnSearch: TSpeedButton;
    procedure btnCancelClick(Sender: TObject);
    procedure btnSelectClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure grMainTitleClick(Column: TColumn);
    procedure qrMainNewRecord(DataSet: TDataSet);
    procedure grMainDblClick(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure grMainDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fOrganizationsEx: TfOrganizationsEx;

  // Возвращает clients.client_id выбранной организации
function SelectOrganization(const ALocateValue: Variant): Variant;

implementation

{$R *.dfm}

uses cardOrganization, Main;

function SelectOrganization(const ALocateValue: Variant): Variant;
begin
  Result := Null;
  if (not Assigned(fOrganizationsEx)) then
    fOrganizationsEx := TfOrganizationsEx.Create(nil, NULL);
  fOrganizationsEx.grMain.OnDblClick := fOrganizationsEx.btnSelect.OnClick;
  if not VarIsNull(ALocateValue) then
    fOrganizationsEx.qrMain.Locate('client_id', ALocateValue, []);
  fOrganizationsEx.btnSelect.Visible := True;
  fOrganizationsEx.btnCancel.Visible := True;
  if fOrganizationsEx.ShowModal = mrOk then
    Result := fOrganizationsEx.qrMain.FieldByName('client_id').AsInteger;
end;

procedure TfOrganizationsEx.btnCancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfOrganizationsEx.btnSearchClick(Sender: TObject);
begin
  qrMain.Filter := 'UPPER(NAME) LIKE UPPER(''%' + Trim(edtSearch.Text) + '%'')';
  if (btnSearch.Tag = 0) and qrMain.FindFirst then
    btnSearch.Tag := 1
  else if not qrMain.FindNext then
    btnSearch.Tag := 0;
end;

procedure TfOrganizationsEx.btnSelectClick(Sender: TObject);
begin
  qrMain.CheckBrowseMode;
  ModalResult := mrOk;
end;

procedure TfOrganizationsEx.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfOrganizationsEx.FormCreate(Sender: TObject);
begin
  inherited;
  qrMain.Active := True;
end;

procedure TfOrganizationsEx.FormDestroy(Sender: TObject);
begin
  fOrganizationsEx := nil;
end;

procedure TfOrganizationsEx.grMainDblClick(Sender: TObject);
begin
  qrMain.Edit;
end;

procedure TfOrganizationsEx.grMainDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer;
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

procedure TfOrganizationsEx.grMainTitleClick(Column: TColumn);
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

procedure TfOrganizationsEx.qrMainNewRecord(DataSet: TDataSet);
begin
  if (not Assigned(fCardOrganization)) then
    fCardOrganization := TfCardOrganization.Create(nil);
  fCardOrganization.Show;
end;

end.
