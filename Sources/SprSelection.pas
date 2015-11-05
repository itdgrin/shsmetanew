unit SprSelection;

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
  Vcl.ComCtrls,
  fFrameSpr,   Tools,
  SprController,
  GlobsAndConst;

type
  TfSprSelection = class(TSmForm)
    Panel4: TPanel;
    btnSelect: TButton;
    btnCancel: TButton;
    procedure btnCancelClick(Sender: TObject);
    procedure btnSelectClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FFrameType: Integer;
    FFrame: TSprFrame;
    FSelectID: Variant;
    procedure SelectSprItem(ASprRecord: PSprRecord);
  public
    property SelectID: Variant read FSelectID;
    constructor Create(AType: Integer); reintroduce;
    destructor Destroy; override;
  end;

function SelectMaterial(): Variant; //Не дает выбора между материалами и жби
function SelectMechanizm(): Variant;
function SelectDevice(): Variant;
function SelectFromSpr(AType: Integer): Variant;

implementation

uses fFrameMaterial, fFrameMechanizm, fFrameEquipment;

{$R *.dfm}

function SelectMaterial(): Variant;
begin
  Result := SelectFromSpr(2);
end;

function SelectMechanizm(): Variant;
begin
  Result := SelectFromSpr(3);
end;

function SelectDevice(): Variant;
begin
  Result := SelectFromSpr(4);
end;

function SelectFromSpr(AType: Integer): Variant;
var fSprSelection: TfSprSelection;
begin
  Result := null;
  if not AType in [2,3,4] then
    raise Exception.Create('Неизвестный тип справочника');
  fSprSelection := TfSprSelection.Create(AType);
  try
    if fSprSelection.ShowModal = mrOk then
      Result := fSprSelection.SelectID;
  finally
    FreeAndNil(fSprSelection);
  end;
end;

procedure TfSprSelection.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfSprSelection.btnSelectClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

constructor TfSprSelection.Create(AType: Integer);
begin
  inherited Create(nil);
  FSelectID := null;
  FFrameType := AType;
  case FFrameType of
  2:
  begin
    Caption := 'Выбор материала';
    FFrame := TSprMaterial.Create(Self, False, False, 0, 0, True, False); //Стартует с материалов
  end;
  3:
  begin
    Caption := 'Выбор механизма';
    FFrame := TSprMechanizm.Create(Self, False, False, 0);
  end;
  4:
  begin
    Caption := 'Выбор оборудования';
    FFrame := TSprEquipment.Create(Self, False, False);
  end;
  end;
  FFrame.Parent := Self;
  FFrame.Align := alClient;
  FFrame.OnSprItemSelect := SelectSprItem;
  FFrame.ListSpr.OnDblClick := btnSelectClick;
  FFrame.LoadSpr;
end;

destructor TfSprSelection.Destroy;
begin
  FreeAndNil(FFrame);
  inherited;
end;

procedure TfSprSelection.FormCreate(Sender: TObject);
begin
  inherited;
  //
end;

procedure TfSprSelection.SelectSprItem(ASprRecord: PSprRecord);
begin
  if Assigned(ASprRecord) then
    FSelectID := ASprRecord.ID
  else
    FSelectID := null;
end;

end.
