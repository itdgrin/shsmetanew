unit PartsEstimates;

interface

uses
  Windows, Messages, Classes, StdCtrls, Controls, Forms, ComCtrls, ExtCtrls, JvComponentBase, JvFormPlacement,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Vcl.Grids, Vcl.DBGrids, JvExDBGrids,
  JvDBGrid, Vcl.Menus, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, System.UITypes, Vcl.Mask,
  Vcl.DBCtrls, Graphics, Tools;

type
  TfPartsEstimates = class(TSmForm)
    FormStorage: TJvFormStorage;
    qrMain: TFDQuery;
    dsMain: TDataSource;
    pm1: TPopupMenu;
    mN1: TMenuItem;
    mN2: TMenuItem;
    mN3: TMenuItem;
    grMain: TJvDBGrid;

    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure mN1Click(Sender: TObject);
    procedure mN2Click(Sender: TObject);
    procedure mN3Click(Sender: TObject);
  private
  end;

var
  fPartsEstimates: TfPartsEstimates;

implementation

uses Main, DataModule;

{$R *.dfm}

procedure TfPartsEstimates.FormCreate(Sender: TObject);
begin
  inherited;
  // Создаём кнопку от этого окна (на главной форме внизу)
  FormMain.CreateButtonOpenWindow(Caption, Caption, Self, 1);
  CloseOpen(qrMain);
end;

procedure TfPartsEstimates.FormActivate(Sender: TObject);
begin
  // Если нажата клавиша Ctrl и выбираем форму, то делаем
  // каскадирование с переносом этой формы на передний план
  FormMain.CascadeForActiveWindow;
  // Делаем нажатой кнопку активной формы (на главной форме внизу)
  FormMain.SelectButtonActiveWindow(Caption);
end;

procedure TfPartsEstimates.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfPartsEstimates.FormDestroy(Sender: TObject);
begin
  // Удаляем кнопку от этого окна (на главной форме внизу)
  FormMain.DeleteButtonCloseWindow(Caption);
  fPartsEstimates := nil;
end;

procedure TfPartsEstimates.FormResize(Sender: TObject);
begin
  if qrMain.RecordCount > grMain.VisibleRowCount then
    grMain.ScrollBars := ssVertical
  else
    grMain.ScrollBars := ssNone;
end;

procedure TfPartsEstimates.mN1Click(Sender: TObject);
begin
  qrMain.Append;
end;

procedure TfPartsEstimates.mN2Click(Sender: TObject);
begin
  qrMain.Edit;
end;

procedure TfPartsEstimates.mN3Click(Sender: TObject);
begin
  qrMain.Delete;
end;

end.
