unit ManualPriceSelect;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls, System.Actions,
  Vcl.ActnList, Tools;

type
  TfmManPriceSelect = class(TSmForm)
    gbDetPrice: TGroupBox;
    lvDetPrice: TListView;
    pnlButtons: TPanel;
    btnClose: TButton;
    btnSelect: TButton;
    gbMain: TGroupBox;
    lbCode: TLabel;
    lbUnit: TLabel;
    lbName: TLabel;
    edtCode: TEdit;
    memName: TMemo;
    edtUnit: TEdit;
    ActionList1: TActionList;
    acSelect: TAction;
    procedure acSelectUpdate(Sender: TObject);
    procedure acSelectExecute(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure lvDetPriceDblClick(Sender: TObject);
  private
    FDataType: Integer;
    FSprID: Integer;
    FCoastNoNDS: Extended;
    FCoastNDS: Extended;
  public
    constructor Create(AOwner: TComponent; const ASprID, ADataType: Integer;
      const ACode, AUnit, AName: string); reintroduce;

    property DataType: Integer read FDataType;
    property SprID: Integer read FSprID;
    property CoastNoNDS: Extended read FCoastNoNDS;
    property CoastNDS: Extended read FCoastNDS;
  end;

implementation

uses ManualSprItem;

{$R *.dfm}

{ TfmManPriceSelect }

procedure TfmManPriceSelect.acSelectExecute(Sender: TObject);
begin
  if lvDetPrice.ItemIndex = -1 then
  begin
    Close;
    Exit;
  end;

  FCoastNoNDS := StrToFloatDef(lvDetPrice.Items[lvDetPrice.ItemIndex].SubItems[2], 0);
  FCoastNDS := StrToFloatDef(lvDetPrice.Items[lvDetPrice.ItemIndex].SubItems[3], 0);

  ModalResult := mrOk;
end;

procedure TfmManPriceSelect.acSelectUpdate(Sender: TObject);
begin
  acSelect.Enabled := (lvDetPrice.ItemIndex > -1);
end;

procedure TfmManPriceSelect.btnCloseClick(Sender: TObject);
begin
  Close;
end;

constructor TfmManPriceSelect.Create(AOwner: TComponent; const ASprID,
  ADataType: Integer; const ACode, AUnit, AName: string);
begin
  inherited Create(AOwner);

  FDataType := ADataType;
  FSprID := ASprID;

  edtCode.Text := ACode;
  edtUnit.Text := AUnit;
  memName.Text := AName;

  case FDataType of
  2: Caption := Caption + ' материала';
  3: Caption := Caption + ' механизма';
  4: Caption := Caption + ' оборудовани€';
  end;

  //¬ процедуре используютс€ типы контроллера справочников
  GetSprManualPrice(lvDetPrice, ASprID, ADataType - 1);
end;

procedure TfmManPriceSelect.FormCreate(Sender: TObject);
begin
  inherited;
  //
end;

procedure TfmManPriceSelect.lvDetPriceDblClick(Sender: TObject);
begin
  if lvDetPrice.ItemIndex = -1 then
    Exit;
  acSelectExecute(nil);
end;

end.
