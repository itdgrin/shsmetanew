unit CalcResourceFactDiff;

interface

uses
  ShellApi,Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, JvDBGridFooter, Vcl.Grids, Vcl.DBGrids, JvExDBGrids,
  JvDBGrid, Vcl.ExtCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, JvComponentBase, JvFormPlacement, Tools,
  Vcl.StdCtrls, Bde.DBTables, JvDBGridExport, System.UITypes;

type
  TfCalcResourceFactDiff = class(TSmForm)
    pgc: TPageControl;
    ts2: TTabSheet;
    pnlMatClient: TPanel;
    grMaterial: TJvDBGrid;
    JvDBGridFooter1: TJvDBGridFooter;
    ts3: TTabSheet;
    pnlMechClient: TPanel;
    JvDBGridFooter2: TJvDBGridFooter;
    ts4: TTabSheet;
    pnlDevClient: TPanel;
    JvDBGridFooter3: TJvDBGridFooter;
    qrMainData: TFDQuery;
    dsMainData: TDataSource;
    FormStorage: TJvFormStorage;
    Panel1: TPanel;
    Button1: TButton;
    JvDBGridExcelExport1: TJvDBGridExcelExport;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure qrMainDataBeforeOpen(DataSet: TDataSet);
    procedure qrMainDataAfterOpen(DataSet: TDataSet);
    procedure JvDBGridFooter1Calculate(Sender: TJvDBGridFooter; const FieldName: string;
      var CalcValue: Variant);
    procedure grMaterialDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure Button1Click(Sender: TObject);
  private
    Footer: Variant;
  public
    { Public declarations }
  end;

var
  fCalcResourceFactDiff: TfCalcResourceFactDiff;

implementation

{$R *.dfm}

uses Main, DataModule, CalcResourceFact, CalculationEstimate, Waiting;

procedure TfCalcResourceFactDiff.Button1Click(Sender: TObject);
begin
     FormWaiting.Show;
     JvDBGridExcelExport1.FileName :=  GetCurrentDir +'\reports\report\TMP\dif_mat.xls';
     JvDBGridExcelExport1.ExportGrid;
     ShellExecute(Handle, nil, 'report.exe', PChar('D' + INTTOSTR(FormCalculationEstimate.IdEstimate)),  PChar(GetCurrentDir +'\reports\report\'), SW_maximIZE);
     FormWaiting.Close;
end;

procedure TfCalcResourceFactDiff.FormActivate(Sender: TObject);
begin
  // Если нажата клавиша Ctrl и выбираем форму, то делаем
  // каскадирование с переносом этой формы на передний план
  FormMain.CascadeForActiveWindow;
  // Делаем нажатой кнопку активной формы (на главной форме внизу)
  FormMain.SelectButtonActiveWindow(Caption);
end;

procedure TfCalcResourceFactDiff.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfCalcResourceFactDiff.FormCreate(Sender: TObject);
begin
  inherited;
  // Создаём кнопку от этого окна (на главной форме внизу)
  FormMain.CreateButtonOpenWindow(Caption, Caption, fCalcResourceFactDiff, 1);
end;

procedure TfCalcResourceFactDiff.FormDestroy(Sender: TObject);
begin
  // Удаляем кнопку от этого окна (на главной форме внизу)
  FormMain.DeleteButtonCloseWindow(Caption);
  fCalcResourceFactDiff := nil;
end;

procedure TfCalcResourceFactDiff.grMaterialDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  with (Sender AS TJvDBGrid).Canvas do
  begin
    Brush.Color := clGradientInactiveCaption;
    Font.Color := PS.FontRows;

    if (gdSelected in State) then // Ячейка в фокусе
    begin
      Brush.Color := PS.BackgroundSelectCell;
      Font.Color := PS.FontSelectCell;
      Font.Style := Font.Style + [fsBold];
    end;
    if Pos('DIFF_', UpperCase(Column.FieldName)) > 0 then
    begin
      Brush.Color := clInfoBk;
      if qrMainData.FindField(Column.FieldName) <> nil then
      begin
        if qrMainData.FieldByName(Column.FieldName).Value < 0 then
          Font.Color := clRed
        else
          Font.Color := clNavy;
      end;
    end;
    if Pos('_1', UpperCase(Column.FieldName)) > 0 then
      Brush.Color := clMoneyGreen;
  end;

  (Sender AS TJvDBGrid).DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfCalcResourceFactDiff.JvDBGridFooter1Calculate(Sender: TJvDBGridFooter; const FieldName: string;
  var CalcValue: Variant);
begin
  try
    if not CheckQrActiveEmpty(Sender.DataSource.DataSet) then
      Exit;
    if (Sender.DataSource.DataSet.FindField(FieldName) <> nil) then
      CalcValue := Round(Footer[Sender.DataSource.DataSet.FieldByName(FieldName).Index]);
  except

  end;
end;

procedure TfCalcResourceFactDiff.qrMainDataAfterOpen(DataSet: TDataSet);
{var
  I: Integer;}
begin
  {for I := 0 to grMaterial.Columns.Count - 1 do
    grMaterial.Columns[I].Visible := qrMainData.FindField(grMaterial.Columns[I].FieldName) <> nil;  }
  if CheckQrActiveEmpty(DataSet) then
    Footer := CalcFooterSumm(qrMainData);
end;

procedure TfCalcResourceFactDiff.qrMainDataBeforeOpen(DataSet: TDataSet);
begin
  qrMainData.ParamByName('ID_ACT').Value := fCalcResourceFact.qrEstimate.ParamByName('SM_ID').Value;
  qrMainData.ParamByName('NDS').Value := fCalcResourceFact.cbbNDS.ItemIndex;
  qrMainData.ParamByName('IND').Value := 1;
end;

end.
