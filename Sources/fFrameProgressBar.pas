unit fFrameProgressBar;

interface

uses
  Forms, ComCtrls, Classes, Controls, ExtCtrls;

type
  TFrameProgressBar = class(TFrame)
    ProgressBar: TProgressBar;
    Shape: TShape;

  private

  public
    procedure SetMinMax(const vMin, vMax: Integer);
    procedure IncPosition(const Value: Integer);
  end;

implementation

{$R *.dfm}
// ---------------------------------------------------------------------------------------------------------------------

procedure TFrameProgressBar.SetMinMax(const vMin, vMax: Integer);
begin
  with ProgressBar do
  begin
    Min := vMin;
    Max := vMax;
    Position := 1;
  end;
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFrameProgressBar.IncPosition(const Value: Integer);
begin
  ProgressBar.Position := Value;
end;

// ---------------------------------------------------------------------------------------------------------------------

end.
