unit fFrameMechanizm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, fFrameSpr, Vcl.ComCtrls, Vcl.StdCtrls,
  Vcl.Samples.Spin, Vcl.ExtCtrls, JvExControls, JvAnimatedImage, JvGIFCtrl,
  Vcl.Buttons, GlobsAndConst, Data.DB, Vcl.Menus;

type
  TSprMechanizm = class(TSprFrame)
    procedure ListSprDblClick(Sender: TObject);
    procedure ListSprResize(Sender: TObject);
    procedure ListSprCustomDrawItem(Sender: TCustomListView; Item: TListItem;
      State: TCustomDrawState; var DefaultDraw: Boolean);
  private
    FZpColIndex,
    FTrColIndex: Integer;
    { Private declarations }
  private
    { Private declarations }
    FAllowAddition: Boolean;
  protected
    function GetSprType: Integer; override;
    function CheckFindCode(AFindCode: string): string; override;
    procedure SprStyle; override;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent;
      const APriceColumn, vAllowAddition: Boolean;
      const AStarDate: TDateTime; ABaseType: Byte = 0); reintroduce;
  end;

implementation

{$R *.dfm}

uses CalculationEstimate, SprController;

constructor TSprMechanizm.Create(AOwner: TComponent;
      const APriceColumn, vAllowAddition: Boolean;
      const AStarDate: TDateTime; ABaseType: Byte);
begin
  FAllowAddition := vAllowAddition;
 // FNoEdCol := False;
  inherited Create(AOwner, APriceColumn, AStarDate, ABaseType);
end;

procedure TSprMechanizm.SprStyle;
var lc: TListColumn;
begin
  inherited;

  if (FBaseType = 1) then
  begin
    if FPriceColumn  then
    begin
      lc := ListSpr.Columns.Add;
      lc.Caption := 'ЗП машиниста, руб';
      FZpColIndex := lc.Index;
    end;
    lc := ListSpr.Columns.Add;
    lc.Caption := 'Затр. труда, чел.ч.';
    FTrColIndex := lc.Index;
  end;
end;

function TSprMechanizm.CheckFindCode(AFindCode: string): string;
begin
  if AFindCode.Length > 0 then
  begin
    AFindCode := UpperCase(AFindCode);
    if (AFindCode[1] = 'M') or (AFindCode[1] = 'V') then // латинская
      AFindCode[1] := 'М';      //кирилица
  end;
  Result := AFindCode;
end;

function TSprMechanizm.GetSprType: Integer;
begin
  Result := CMechIndex;
end;

procedure TSprMechanizm.ListSprCustomDrawItem(Sender: TCustomListView;
  Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  inherited;
  if (FBaseType = 1) then
  begin
    if FPriceColumn then
    begin
      if TSprRecord(Item.Data^).ZpMach > 0 then
        Item.SubItems.Add(FloatToStr(TSprRecord(Item.Data^).ZpMach))
      else Item.SubItems.Add('');
    end;
    if TSprRecord(Item.Data^).TrZatr > 0 then
      Item.SubItems.Add(FloatToStr(TSprRecord(Item.Data^).TrZatr))
    else Item.SubItems.Add('');
  end;
end;

procedure TSprMechanizm.ListSprDblClick(Sender: TObject);
var TmpPriceID: Integer;
begin
  inherited;
  TmpPriceID := 0;
  if lvDetPrice.ItemIndex > -1 then
    TmpPriceID := Integer(lvDetPrice.Items[lvDetPrice.ItemIndex].Data);

  if FAllowAddition and (ListSpr.ItemIndex > -1) then
    FormCalculationEstimate.AddMechanizm(
      TSprRecord(ListSpr.Items[ListSpr.ItemIndex].Data^).ID, TmpPriceID);
end;

procedure TSprMechanizm.ListSprResize(Sender: TObject);
begin
  inherited;
  if (FBaseType = 1) then
  begin
    if FPriceColumn then
      ListSpr.Columns[FZpColIndex].Width := 120;
    ListSpr.Columns[FTrColIndex].Width := 120;
  end;
end;

end.
