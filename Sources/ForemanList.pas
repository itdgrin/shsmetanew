unit ForemanList;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.DBGrids, JvExDBGrids, JvDBGrid, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, Tools,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.ExtCtrls, Vcl.DBCtrls, JvComponentBase, JvFormPlacement, Vcl.StdCtrls, Vcl.Buttons, System.UITypes;

type
  TfForemanList = class(TSmForm)
    grMain: TJvDBGrid;
    qrMain: TFDQuery;
    dsMain: TDataSource;
    dbnvgr1: TDBNavigator;
    FormStorage: TJvFormStorage;
    qrMainforeman_id: TFDAutoIncField;
    strngfldMainforeman_name: TStringField;
    strngfldMainforeman_first_name: TStringField;
    strngfldMainforeman_second_name: TStringField;
    qrMainNUMPP: TIntegerField;
    pnlSelect: TPanel;
    btn1: TBitBtn;
    btn2: TBitBtn;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure grMainDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure qrMainCalcFields(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
  public
    OutValue: Integer;
  end;

var
  fForemanList: TfForemanList;

implementation

{$R *.dfm}

uses Main, DataModule;

procedure TfForemanList.btn1Click(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfForemanList.btn2Click(Sender: TObject);
begin
  OutValue := 0;
  if not qrMain.IsEmpty then
    OutValue := qrMain.FieldByName('foreman_id').AsInteger;
  ModalResult := mrOk;
end;

procedure TfForemanList.FormActivate(Sender: TObject);
begin
  // Если нажата клавиша Ctrl и выбираем форму, то делаем
  // каскадирование с переносом этой формы на передний план
  FormMain.CascadeForActiveWindow;
  // Делаем нажатой кнопку активной формы (на главной форме внизу)
  FormMain.SelectButtonActiveWindow(Caption);
end;

procedure TfForemanList.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfForemanList.FormCreate(Sender: TObject);
begin
  inherited;
  FormKind := kdNone;
  // Создаём кнопку от этого окна (на главной форме внизу)
  FormMain.CreateButtonOpenWindow(Caption, Caption, Self, 1);
  CloseOpen(qrMain);
end;

procedure TfForemanList.FormDestroy(Sender: TObject);
begin
  // Удаляем кнопку от этого окна (на главной форме внизу)
  FormMain.DeleteButtonCloseWindow(Caption);
  fForemanList := nil;
end;

procedure TfForemanList.FormResize(Sender: TObject);
begin
  if qrMain.RecordCount > grMain.VisibleRowCount then
    grMain.ScrollBars := ssVertical
  else
    grMain.ScrollBars := ssNone;
end;

procedure TfForemanList.FormShow(Sender: TObject);
begin
  pnlSelect.Visible := FormKind in [kdSelect];
end;

procedure TfForemanList.grMainDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer;
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

procedure TfForemanList.qrMainCalcFields(DataSet: TDataSet);
begin
  qrMainNUMPP.Value := qrMain.RecNo;
  if qrMainNUMPP.Value = 0 then
    qrMainNUMPP.Value := 1;
end;

end.
