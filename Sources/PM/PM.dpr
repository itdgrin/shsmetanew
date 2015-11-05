program PM;

uses
  Vcl.Forms,
  Main in 'Main.pas' {fMain},
  DataModule in 'DataModule.pas' {DM: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfMain, fMain);
  Application.CreateForm(TDM, DM);
  Application.Run;
end.
