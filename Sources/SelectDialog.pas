unit SelectDialog;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.DBGrids, JvExDBGrids, JvDBGrid, JvComponentBase,
  JvFormPlacement, Data.DB, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, Tools,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client, System.UITypes;

type
  TfSelectDialog = class(TSmForm)
    dsMainData: TDataSource;
    FormStorage: TJvFormStorage;
    grMain1: TJvDBGrid;
    pnl1: TPanel;
    btn1: TBitBtn;
    btn2: TBitBtn;
    procedure grMain1DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function ShowSelectDialog(const ACapt: String{; const ADataSet: Pointer}): Boolean;

implementation

uses Main, DataModule, CalculationEstimate;

{$R *.dfm}

function ShowSelectDialog(const ACapt: String{; const ADataSet: Pointer}): Boolean;
var
  fSelectDialog: TfSelectDialog;
begin
  Result := False;
  fSelectDialog := nil;
  try
    if (not Assigned(fSelectDialog)) then
      fSelectDialog := TfSelectDialog.Create(nil);
    fSelectDialog.Caption := ACapt;
    //fSelectDialog.dsMainData.DataSet := TFDQuery(ADataSet);
    if fSelectDialog.ShowModal = mrOk then
      Result := True;
  finally
    FreeAndNil(fSelectDialog);
  end;
end;

procedure TfSelectDialog.FormCreate(Sender: TObject);
begin
  inherited;
end;

procedure TfSelectDialog.grMain1DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer;
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

end.
