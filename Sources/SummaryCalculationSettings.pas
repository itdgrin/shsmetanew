unit SummaryCalculationSettings;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, Grids, DBGrids, StdCtrls,
  ExtCtrls, Tools;

type
  TFormSummaryCalculationSettings = class(TSmForm)
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    DBGrid: TDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormSummaryCalculationSettings: TFormSummaryCalculationSettings;

implementation

uses Main;

{$R *.dfm}
// ---------------------------------------------------------------------------------------------------------------------

procedure TFormSummaryCalculationSettings.FormCreate(Sender: TObject);
begin
  with Constraints do
  begin
    MinHeight := Height;
    MaxHeight := Height;
    MinWidth := Width;
    MaxWidth := Width;
  end;
  inherited;
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFormSummaryCalculationSettings.FormShow(Sender: TObject);
begin
  Left := FormMain.Left + (FormMain.Width - Width) div 2;
  Top := FormMain.Top + (FormMain.Height - Height) div 2;

  // Устанавливаем фокус
  DBGrid.SetFocus;
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFormSummaryCalculationSettings.Button3Click(Sender: TObject);
begin
  Close;
end;

// ---------------------------------------------------------------------------------------------------------------------

end.
