unit ForecastCostIndex;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.Samples.Spin,
  System.DateUtils, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids, JvExDBGrids, JvDBGrid,
  Vcl.Imaging.pngimage, Vcl.Buttons, System.UITypes, Tools;

type
  TfForecastCostIndex = class(TSmForm)
    pnlTop: TPanel;
    seYear: TSpinEdit;
    lbl1: TLabel;
    lbl2: TLabel;
    dblkcbbDocument: TDBLookupComboBox;
    qrDocument: TFDQuery;
    dsDocument: TDataSource;
    qrMain: TFDQuery;
    dsMain: TDataSource;
    pnlMain: TPanel;
    grMain: TJvDBGrid;
    btnRunDoc: TSpeedButton;
    imgNoData: TImage;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure seYearChange(Sender: TObject);
    procedure qrMainBeforeOpen(DataSet: TDataSet);
    procedure qrMainAfterOpen(DataSet: TDataSet);
    procedure qrDocumentAfterScroll(DataSet: TDataSet);
    procedure btnRunDocClick(Sender: TObject);
    procedure grMainDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fForecastCostIndex: TfForecastCostIndex;

implementation

uses DataModule, Main, FileStorage;

{$R *.dfm}

procedure TfForecastCostIndex.btnRunDocClick(Sender: TObject);
begin
  RunDocument(qrDocument);
end;

procedure TfForecastCostIndex.FormActivate(Sender: TObject);
begin
  // Если нажата клавиша Ctrl и выбираем форму, то делаем
  // каскадирование с переносом этой формы на передний план
  FormMain.CascadeForActiveWindow;
  // Делаем нажатой кнопку активной формы (на главной форме внизу)
  FormMain.SelectButtonActiveWindow(Caption);
end;

procedure TfForecastCostIndex.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfForecastCostIndex.FormCreate(Sender: TObject);
begin
  inherited;
  // Создаём кнопку от этого окна (на главной форме внизу)
  FormMain.CreateButtonOpenWindow(Caption, Caption, Self, 1);
  seYear.Value := YearOf(Now);
  dblkcbbDocument.KeyValue := 0;
  CloseOpen(qrDocument);
end;

procedure TfForecastCostIndex.FormDestroy(Sender: TObject);
begin
  // Удаляем кнопку от этого окна (на главной форме внизу)
  FormMain.DeleteButtonCloseWindow(Caption);
  fForecastCostIndex := nil;
end;

procedure TfForecastCostIndex.grMainDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer;
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

procedure TfForecastCostIndex.qrDocumentAfterScroll(DataSet: TDataSet);
begin
  //btnRunDoc.Enabled := DataSet.FieldByName('doc_id').AsInteger <> 0;
end;

procedure TfForecastCostIndex.qrMainAfterOpen(DataSet: TDataSet);
begin
  grMain.Visible := not qrMain.IsEmpty;
end;

procedure TfForecastCostIndex.qrMainBeforeOpen(DataSet: TDataSet);
begin
  qrMain.ParamByName('YEAR').Value := seYear.Value;
  qrMain.ParamByName('DOC').Value := dblkcbbDocument.KeyValue;
end;

procedure TfForecastCostIndex.seYearChange(Sender: TObject);
begin
  CloseOpen(qrMain);
end;

end.
