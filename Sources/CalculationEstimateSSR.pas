unit CalculationEstimateSSR;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrCalculationEstimateSSR = class(TFrame)
    pnlSSR: TPanel;
    spl1: TSplitter;
    pnlTop: TPanel;
    lbl1: TLabel;
    lbl2: TLabel;
    edt1: TEdit;
    mmo1: TMemo;
    dbgrd1: TDBGrid;
  private
    { Private declarations }
  public
    function LoadData(const Args: Variant): Boolean;
  end;

implementation

{$R *.dfm}
{ TfrCalculationEstimateSSR }

function TfrCalculationEstimateSSR.LoadData(const Args: Variant): Boolean;
begin
  Result := True;
  try

  except
    Result := False;
  end;
end;

end.
