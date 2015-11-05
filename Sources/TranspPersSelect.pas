unit TranspPersSelect;

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
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  Tools,
  Clipbrd;

type
  TfTrPersSelect = class(TSmForm)
    Panel4: TPanel;
    btnSelect: TButton;
    btnCancel: TButton;
    rbTrPers1: TRadioButton;
    rbTrPers2: TRadioButton;
    rbTrPers3: TRadioButton;
    rbTrPers4: TRadioButton;
    rbTrPers5: TRadioButton;
    rbTrPers6: TRadioButton;
    edtrbTrPers: TEdit;
    procedure btnCancelClick(Sender: TObject);
    procedure btnSelectClick(Sender: TObject);
    procedure edtrbTrPersKeyPress(Sender: TObject; var Key: Char);
    procedure edtrbTrPersExit(Sender: TObject);
    procedure rbTrPersClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FSelectRb: Integer;
    FTranspPers: Double;
    FMatCode: string;
    FSelectType: Byte;
  public
    constructor Create(AOwner: TComponent); overload;
    property TranspPers: Double read FTranspPers;
    property MatCode: string read FMatCode;
    property SelectType: Byte read FSelectType;
  end;

implementation

{$R *.dfm}

procedure TfTrPersSelect.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfTrPersSelect.btnSelectClick(Sender: TObject);
begin
  FTranspPers := 0;
  FMatCode := '';

  case FSelectRb of
    1:
      FMatCode := 'С101-0000';
    2:
      FMatCode := 'С201-0000';
    3:
      FMatCode := 'С300-0000';
    4:
      FMatCode := 'С501-0000';
    5:
      FMatCode := 'С000-0000';
    6:
      FTranspPers := StrToIntDef(edtrbTrPers.Text, 0);
    else
      raise Exception.Create('Неизвестный тип транспорта.');
  end;

  if FSelectRb in [1, 2, 3, 4, 5] then
    FSelectType := 1
  else
    FSelectType := 2;

  ModalResult := mrOk;
end;

constructor TfTrPersSelect.Create(AOwner: TComponent);
begin
  inherited;
  rbTrPers1.Checked := True;
end;

procedure TfTrPersSelect.edtrbTrPersExit(Sender: TObject);
var
  s: string;
begin
  if (Length(TEdit(Sender).Text) > 0) and
    (TEdit(Sender).Text[High(TEdit(Sender).Text)] = FormatSettings.DecimalSeparator) then
  begin
    s := TEdit(Sender).Text;
    SetLength(s, Length(s) - 1);
    TEdit(Sender).Text := s;
  end;

  if TEdit(Sender).Text = '' then
    TEdit(Sender).Text := '0';
end;

procedure TfTrPersSelect.edtrbTrPersKeyPress(Sender: TObject; var Key: Char);
var
  s: string;
  f: Double;
begin
  if CharInSet(Key, [^C, ^X, ^Z]) then
    Exit;

  if (Key = ^V) then
  begin
    // Проверка на корректность вставляемого текста
    if TryStrToFloat(Clipboard.AsText, f) then
    begin
      s := Copy(TEdit(Sender).Text, 1, TEdit(Sender).SelStart) + Clipboard.AsText +
        Copy(TEdit(Sender).Text, TEdit(Sender).SelStart + TEdit(Sender).SelLength + 1,
        Length(TEdit(Sender).Text) - TEdit(Sender).SelStart - TEdit(Sender).SelLength);
      if TryStrToFloat(s, f) then
        Exit;
    end;
  end;

  case Key of
    '0' .. '9', #8:
      ;
    '.', ',':
      begin
        Key := FormatSettings.DecimalSeparator;
        if (pos(FormatSettings.DecimalSeparator, TEdit(Sender).Text) <> 0) or (TEdit(Sender).Text = '') then
          Key := #0;
      end;
  else
    Key := #0;
  end;
end;

procedure TfTrPersSelect.FormCreate(Sender: TObject);
begin
  inherited;
  //
end;

procedure TfTrPersSelect.rbTrPersClick(Sender: TObject);
begin
  FSelectRb := (Sender as TControl).Tag;
  edtrbTrPers.Enabled := FSelectRb = 6;
  if edtrbTrPers.Enabled then
    edtrbTrPers.SetFocus;
end;

end.
