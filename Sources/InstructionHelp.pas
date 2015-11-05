unit InstructionHelp;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Vcl.ComCtrls, JvExComCtrls, JvDBTreeView, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Buttons, JvComponentBase, JvFormPlacement, Vcl.Grids, Vcl.DBGrids,
  JvExDBGrids, JvDBGrid, System.UITypes, Tools;

type
  TfInstructionHelp = class(TSmForm)
    pnl1: TPanel;
    qrTreeData: TFDQuery;
    dsTreeData: TDataSource;
    tvDocuments: TJvDBTreeView;
    btn1: TBitBtn;
    btn2: TBitBtn;
    grMain1: TJvDBGrid;
    spl1: TSplitter;
    FormStorage: TJvFormStorage;
    pnl2: TPanel;
    lbl3: TLabel;
    edtSearch: TEdit;
    btnSearch: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure tvDocumentsDblClick(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure grMain1DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure btnSearchClick(Sender: TObject);
    procedure qrTreeDataBeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fInstructionHelp: TfInstructionHelp;

implementation

{$R *.dfm}

uses Main, DataModule, FileStorage;

procedure TfInstructionHelp.btn2Click(Sender: TObject);
begin
  Close;
end;

procedure TfInstructionHelp.btnSearchClick(Sender: TObject);
begin
  qrTreeData.Active := False;
  qrTreeData.Active := True;
end;

procedure TfInstructionHelp.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfInstructionHelp.FormCreate(Sender: TObject);
begin
  inherited;
  CloseOpen(qrTreeData);
end;

procedure TfInstructionHelp.FormDestroy(Sender: TObject);
begin
  fInstructionHelp := nil;
end;

procedure TfInstructionHelp.grMain1DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer;
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

procedure TfInstructionHelp.qrTreeDataBeforeOpen(DataSet: TDataSet);
begin
  qrTreeData.ParamByName('search').AsString := '%' + Trim(edtSearch.Text) + '%';
end;

procedure TfInstructionHelp.tvDocumentsDblClick(Sender: TObject);
begin
  if not CheckQrActiveEmpty(qrTreeData) then
    Exit;
  RunDocument(qrTreeData, False);
end;

end.
