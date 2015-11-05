unit TypesActs;

interface

uses
  Classes, Controls, Forms, ExtCtrls, SysUtils, Tools;

type
  TFormTypesActs = class(TSmForm)
    Panel: TPanel;

    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  end;

var
  FormTypesActs: TFormTypesActs;

implementation

uses Main, fTypesActs;

var
  FrameTypesActs: TFrameTypesActs;

{$R *.dfm}
  // ---------------------------------------------------------------------------------------------------------------------

procedure TFormTypesActs.FormCreate(Sender: TObject);
begin
  inherited;
  // Настройка размеров и положения формы

  ClientWidth := FormMain.ClientWidth div 2;
  ClientHeight := FormMain.ClientHeight div 2;

  Left := FormMain.Left + (FormMain.Width - Width) div 2;
  Top := FormMain.Top + (FormMain.Height - Height) div 2;

  // -----------------------------------------

  Caption := FormNameTypesActs;

  Panel.Align := alClient;
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFormTypesActs.FormShow(Sender: TObject);
begin
  FrameTypesActs := TFrameTypesActs.Create(Self);
  with FrameTypesActs do
  begin
    Parent := Panel;
    Align := alClient;
    Visible := True;
  end;

  FrameTypesActs.TableFilling;
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFormTypesActs.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(FrameTypesActs);
end;

// ---------------------------------------------------------------------------------------------------------------------

end.
