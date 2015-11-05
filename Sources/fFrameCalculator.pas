unit fFrameCalculator;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  JvExStdCtrls, JvEdit, JvExDBGrids, JvDBGrid, Vcl.ExtCtrls, Clipbrd, Data.FmtBcd;

type
  TCalculator = class(TFrame)
    Panel: TPanel;
    edtCoast: TJvEdit;
    edtCount: TJvEdit;
    edtNDS: TJvEdit;
    lbCoast: TLabel;
    lbNDS: TLabel;
    lbCount: TLabel;
    edtPriceNDS: TJvEdit;
    lbPriceNDS: TLabel;
    ButtonPanel: TPanel;
    btnSetResult: TButton;
    btnHide: TButton;
    procedure FrameExit(Sender: TObject);
    procedure btnHideClick(Sender: TObject);
    procedure edtCountKeyPress(Sender: TObject; var Key: Char);
    procedure btnSetResultClick(Sender: TObject);
    procedure edtPriceNDSChange(Sender: TObject);
    procedure edtCountChange(Sender: TObject);
    procedure edtCoastChange(Sender: TObject);
  private
    FGrd: TJvDBGrid;
    FFieldName: string;
    FCalc: Boolean;
    FCoast,
    FCount,
    FPrice: TBcd;
    FNDS: Integer;
    { Private declarations }
  public
    procedure ShowCalculator(AGrd: TJvDBGrid; ACoast, ACount, APrice: TBcd;
      ANDS: Integer; AFieldName: string);
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TCalculator.ShowCalculator(AGrd: TJvDBGrid; ACoast, ACount, APrice: TBcd;
  ANDS: Integer; AFieldName: string);
var p: TPoint;
begin
  if not Assigned(AGrd) then
    Exit;
  FGrd := AGrd;
  FFieldName := AFieldName;

  FCalc := True;
  if ACount > 0 then
    edtCount.Text := BcdToStr(ACount)
  else edtCount.Text :=  '0';

  if ANDS > 0 then
    edtNDS.Text := IntToStr(Trunc(ANDS))
  else edtNDS.Text :=  '0';

  if ACoast > 0 then
    edtCoast.Text := CurrToStr(Trunc(BCDToCurrency(ACoast)))
  else edtCoast.Text :=  '0';

  if APrice > 0 then
    edtPriceNDS.Text := CurrToStr(Trunc(BCDToCurrency(APrice)))
  else edtPriceNDS.Text :=  '0';

  FCoast := StrToBcd(edtCoast.Text);
  FCount := StrToBcd(edtCount.Text);
  FNDS := StrToInt(edtNDS.Text);
  FPrice := StrToBcd(edtPriceNDS.Text);

  FCalc := False;

  p := AGrd.ClientToParent(AGrd.CellRect(AGrd.Col, AGrd.Row).BottomRight,
    Self.Parent);

  Top := p.Y + 1;
  Left := p.X - Width + 2;

  Visible := True;
  btnHide.SetFocus;
end;

procedure TCalculator.btnHideClick(Sender: TObject);
begin
  FrameExit(Sender);
end;

procedure TCalculator.btnSetResultClick(Sender: TObject);
begin
  FGrd.DataSource.DataSet.Edit;
  FGrd.DataSource.DataSet.FieldByName(FFieldName).Value := BCDToCurrency(FCoast);
  FrameExit(Sender);
end;

procedure TCalculator.edtCountKeyPress(Sender: TObject; var Key: Char);
var f: Extended;
    s: string;
begin
  if CharInSet(Key, [^C, ^X, ^Z]) then
      Exit;

  if (Key = ^V) then
  begin
    //Проверка на корректность вставляемого текста
    if TryStrToFloat(Clipboard.AsText, f) then
    begin
      s :=
        Copy(edtCount.Text, 1, edtCount.SelStart) +
        Clipboard.AsText +
        Copy(edtCount.Text, edtCount.SelStart + edtCount.SelLength + 1,
          Length(edtCount.Text) - edtCount.SelStart - edtCount.SelLength);
      if TryStrToFloat(s, f) then
        Exit;
    end;
  end;

  case Key of
    '0'..'9',#8: ;
    '.',',':
     begin
       Key := FormatSettings.DecimalSeparator;
       if (pos(FormatSettings.DecimalSeparator, edtCount.Text) <> 0) or
          (edtCount.Text = '') then
        Key:= #0;
     end;
     else Key:= #0;
  end;
end;

procedure TCalculator.edtCoastChange(Sender: TObject);
begin
  if not FCalc then
  begin
    FCalc := True;
    if not TryStrToBcd(edtCoast.Text, FCoast) then
      FCoast := 0;
    FPrice := Round(BCDToCurrency(FCount * FCoast));
    edtPriceNDS.Text := BcdToStr(FPrice);
    FCalc := False;
  end;
end;

procedure TCalculator.edtCountChange(Sender: TObject);
begin
  if not FCalc then
  begin
    FCalc := True;
    if not TryStrToBcd(edtCount.Text, FCount) then
      FCount := 0;
    if FCount > 0 then
      FCoast := Round(BCDToCurrency(FPrice/FCount))
    else FCoast := 0;
    edtCoast.Text := BcdToStr(FCoast);
    FCalc := False;
  end;
end;

procedure TCalculator.edtPriceNDSChange(Sender: TObject);
begin
  if not FCalc then
  begin
    FCalc := True;
    if not TryStrToBcd(edtPriceNDS.Text, FPrice) then
      FPrice := 0;
    if FCount > 0 then
      FCoast := Round(BCDToCurrency(FPrice/FCount))
    else FCoast := 0;
    edtCoast.Text := BcdToStr(FCoast);
    FCalc := False;
  end;
end;

procedure TCalculator.FrameExit(Sender: TObject);
begin
  if Assigned(FGrd) then
    if FGrd.CanFocus then
      FGrd.SetFocus;
  FGrd := nil;
  Visible := False;
end;

end.
