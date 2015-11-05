unit DataModule;

interface

uses
  Classes, DB, ImgList, Controls, Menus, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Comp.Client, FireDAC.Phys.MySQL, FireDAC.VCLUI.Wait, FireDAC.Comp.UI,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet;

type
  TDM = class(TDataModule)
    Connect: TFDConnection;
    Read: TFDTransaction;
    Write: TFDTransaction;
    FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;

  private
    { Private declarations }
  public
    constructor Create(AOwner: TComponent); override;
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

constructor TDM.Create(AOwner: TComponent);
begin
  inherited;
  //Для того, что-бы в дизайн тайме было подключение, а при запуске не было
  Connect.Params.Clear;
end;

end.
