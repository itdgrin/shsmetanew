program MAISEditor;

uses
  Vcl.Forms,
  MainUnit in 'MainUnit.pas' {frmMAIS},
  DataModule in '..\DataModule.pas' {DM: TDataModule},
  GlobsAndConst in '..\GlobsAndConst.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMAIS, frmMAIS);
  Application.CreateForm(TDM, DM);
  Application.Run;
end.
