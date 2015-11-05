unit RoundSetup;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask, JvExMask, JvSpin, JvDBSpinEdit,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Tools;

type
  TfRoundSetup = class(TSmForm)
    lbl1: TLabel;
    JvDBSpinEdit1: TJvDBSpinEdit;
    lbl2: TLabel;
    JvDBSpinEdit2: TJvDBSpinEdit;
    grp1: TGroupBox;
    lbl3: TLabel;
    JvDBSpinEdit3: TJvDBSpinEdit;
    lbl4: TLabel;
    JvDBSpinEdit4: TJvDBSpinEdit;
    lbl5: TLabel;
    JvDBSpinEdit5: TJvDBSpinEdit;
    btn1: TBitBtn;
    btn2: TBitBtn;
    qrMainData: TFDQuery;
    dsMainData: TDataSource;
    lbl6: TLabel;
    JvDBSpinEdit6: TJvDBSpinEdit;
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fRoundSetup: TfRoundSetup;

implementation

{$R *.dfm}

uses Main, DataModule;

procedure TfRoundSetup.btn1Click(Sender: TObject);
begin
  Close;
end;

procedure TfRoundSetup.btn2Click(Sender: TObject);
begin
  if qrMainData.State in [dsEdit, dsInsert] then
    qrMainData.Post;
  Close;
end;

procedure TfRoundSetup.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qrMainData.Cancel;
  Action := caFree;
end;

procedure TfRoundSetup.FormCreate(Sender: TObject);
begin
  inherited;
  CloseOpen(qrMainData);
end;

procedure TfRoundSetup.FormDestroy(Sender: TObject);
begin
  fRoundSetup := nil;
end;

end.
