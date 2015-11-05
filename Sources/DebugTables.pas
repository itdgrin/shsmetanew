unit DebugTables;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids,
  JvExDBGrids, JvDBGrid, Vcl.ExtCtrls, DataModule, Tools, Main, JvComponentBase, JvFormPlacement, Vcl.Menus;

type
  TfDebugTables = class(TSmForm)
    ScrollBox1: TScrollBox;
    pnl1: TPanel;
    JvDBGrid1: TJvDBGrid;
    btnRefresh: TBitBtn;
    ds1: TDataSource;
    qr1: TFDQuery;
    spl1: TSplitter;
    lst: TListBox;
    spl2: TSplitter;
    FormStorage: TJvFormStorage;
    chkAutoUpdate: TCheckBox;
    tmr1: TTimer;
    lbl1: TLabel;
    edtTableName: TEdit;
    btnAddTable: TBitBtn;
    pm1: TPopupMenu;
    mN1: TMenuItem;
    procedure btnRefreshClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure tmr1Timer(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnAddTableClick(Sender: TObject);
    procedure mN1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fDebugTables: TfDebugTables;

implementation

{$R *.dfm}

procedure TfDebugTables.btnAddTableClick(Sender: TObject);
begin
  lst.Items.Add(Trim(edtTableName.Text));
end;

procedure TfDebugTables.btnRefreshClick(Sender: TObject);
var
  newSQL: string;
begin
  if lst.ItemIndex = -1 then
    Exit;

  newSQL := 'SELECT * FROM ' + lst.Items[lst.ItemIndex] + ''#13#10;
  if qr1.SQL.Text <> newSQL then
  begin
    qr1.SQL.Text := newSQL;
    qr1.Active := True;
  end
  else
    try
      CloseOpen(qr1);
    except

    end;
end;

procedure TfDebugTables.FormActivate(Sender: TObject);
begin
  fDebugTables.AlphaBlendValue := 255;
end;

procedure TfDebugTables.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfDebugTables.FormDeactivate(Sender: TObject);
begin
  fDebugTables.AlphaBlendValue := 160;
end;

procedure TfDebugTables.FormDestroy(Sender: TObject);
begin
  fDebugTables := nil;
end;

procedure TfDebugTables.mN1Click(Sender: TObject);
begin
  if lst.ItemIndex = -1 then
    Exit;
  lst.DeleteSelected;
end;

procedure TfDebugTables.tmr1Timer(Sender: TObject);
begin
  if chkAutoUpdate.Checked then
    btnRefresh.Click;
end;

end.
