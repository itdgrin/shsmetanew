unit IndexesChangeCost;

interface

uses
  Classes, Controls, Forms, ExtCtrls, SysUtils, Tools;

type
  TFormIndexesChangeCost = class(TSmForm)
    Panel: TPanel;

    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  end;

var
  FormIndexesChangeCost: TFormIndexesChangeCost;

implementation

uses Main, fIndexesChangeCost;

var
  FrameIndexesChangeCost: TFrameIndexesChangeCost;

{$R *.dfm}
  // ---------------------------------------------------------------------------------------------------------------------

procedure TFormIndexesChangeCost.FormCreate(Sender: TObject);
begin
  inherited;
  // Настройка размеров и положения формы

  ClientWidth := FormMain.ClientWidth div 2;
  ClientHeight := FormMain.ClientHeight div 2;

  Left := FormMain.Left + (FormMain.Width - Width) div 2;
  Top := FormMain.Top + (FormMain.Height - Height) div 2;

  // -----------------------------------------

  Caption := FormNameIndexesChangeCost;

  Panel.Align := alClient;
end;

procedure TFormIndexesChangeCost.FormShow(Sender: TObject);
begin
  FrameIndexesChangeCost := TFrameIndexesChangeCost.Create(Self);
  with FrameIndexesChangeCost do
  begin
    Parent := Panel;
    Align := alClient;
    Visible := True;
  end;

  FrameIndexesChangeCost.TableFilling;
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFormIndexesChangeCost.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(FrameIndexesChangeCost);
end;

// ---------------------------------------------------------------------------------------------------------------------

end.
