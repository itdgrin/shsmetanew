unit TypeWorkList;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.DBGrids, JvExDBGrids, JvDBGrid, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, JvComponentBase, JvFormPlacement, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, System.UITypes, Tools;

type
  TfTypeWorkList = class(TSmForm)
    grMain: TJvDBGrid;
    qrMain: TFDQuery;
    dsMain: TDataSource;
    FormStorage: TJvFormStorage;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fTypeWorkList: TfTypeWorkList;

implementation

{$R *.dfm}

Uses Main, DataModule;

procedure TfTypeWorkList.FormActivate(Sender: TObject);
begin
  // Если нажата клавиша Ctrl и выбираем форму, то делаем
  // каскадирование с переносом этой формы на передний план
  FormMain.CascadeForActiveWindow;
  // Делаем нажатой кнопку активной формы (на главной форме внизу)
  FormMain.SelectButtonActiveWindow(Caption);
end;

procedure TfTypeWorkList.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfTypeWorkList.FormCreate(Sender: TObject);
begin
  inherited;
  // Создаём кнопку от этого окна (на главной форме внизу)
  FormMain.CreateButtonOpenWindow(Caption, Caption, Self, 1);
  CloseOpen(qrMain);
end;

procedure TfTypeWorkList.FormDestroy(Sender: TObject);
begin
  // Удаляем кнопку от этого окна (на главной форме внизу)
  FormMain.DeleteButtonCloseWindow(Caption);
  fTypeWorkList := nil;
end;

end.
