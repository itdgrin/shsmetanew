unit CategoriesObjects;

interface

uses
  Winapi.Windows, StdCtrls, Forms, ExtCtrls, SysUtils, JvComponentBase, JvFormPlacement, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.Grids, Vcl.DBGrids, JvExDBGrids, JvDBGrid, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Menus,
  System.UITypes, Tools;

type
  TfCategoriesObjects = class(TSmForm)
    FormStorage: TJvFormStorage;
    qrMain: TFDQuery;
    dsMain: TDataSource;
    grMain: TJvDBGrid;
    pm1: TPopupMenu;
    mN1: TMenuItem;
    mN2: TMenuItem;
    mN3: TMenuItem;

    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure grMainDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure FormActivate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure mN1Click(Sender: TObject);
    procedure mN2Click(Sender: TObject);
    procedure mN3Click(Sender: TObject);
    procedure grMainTitleBtnClick(Sender: TObject; ACol: Integer; Field: TField);
  end;

var
  fCategoriesObjects: TfCategoriesObjects;

implementation

uses Main, DataModule;

{$R *.dfm}

procedure TfCategoriesObjects.FormCreate(Sender: TObject);
begin
  inherited;
  // Создаём кнопку от этого окна (на главной форме внизу)
  FormMain.CreateButtonOpenWindow(Caption, Caption, Self, 1);
  CloseOpen(qrMain);
end;

procedure TfCategoriesObjects.FormDestroy(Sender: TObject);
begin
  // Удаляем кнопку от этого окна (на главной форме внизу)
  FormMain.DeleteButtonCloseWindow(Caption);
  fCategoriesObjects := nil;
end;

procedure TfCategoriesObjects.FormResize(Sender: TObject);
begin
  if qrMain.RecordCount > grMain.VisibleRowCount then
    grMain.ScrollBars := ssVertical
  else
    grMain.ScrollBars := ssNone;
end;

procedure TfCategoriesObjects.grMainDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer;
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

procedure TfCategoriesObjects.grMainTitleBtnClick(Sender: TObject; ACol: Integer; Field: TField);
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

procedure TfCategoriesObjects.mN1Click(Sender: TObject);
begin
  qrMain.Append;
end;

procedure TfCategoriesObjects.mN2Click(Sender: TObject);
begin
  qrMain.Edit;
end;

procedure TfCategoriesObjects.mN3Click(Sender: TObject);
begin
  qrMain.Delete;
end;

procedure TfCategoriesObjects.FormActivate(Sender: TObject);
begin
  // Если нажата клавиша Ctrl и выбираем форму, то делаем
  // каскадирование с переносом этой формы на передний план
  FormMain.CascadeForActiveWindow;
  // Делаем нажатой кнопку активной формы (на главной форме внизу)
  FormMain.SelectButtonActiveWindow(Caption);
end;

procedure TfCategoriesObjects.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
