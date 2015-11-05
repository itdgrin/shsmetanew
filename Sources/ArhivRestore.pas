unit ArhivRestore;

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
  GlobsAndConst,
  Vcl.ComCtrls,
  Vcl.ExtCtrls,
  Tools,
  Vcl.StdCtrls, Vcl.Imaging.pngimage;

type
  TfrmArhRestore = class(TSmForm)
    ArchivPanel: TPanel;
    lbArchStatys: TLabel;
    pnlArchiv1: TPanel;
    pgArchiv: TProgressBar;
    imgArchive: TImage;
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    FCanClose: Boolean;
    procedure ThreadEXCEPTION(var Mes: TMessage); message WM_EXCEPTION;
    procedure ARCHIVEPROGRESS(var Mes: TMessage); message WM_ARCHIVEPROGRESS;
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TfrmArhRestore.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := FCanClose;
end;

procedure TfrmArhRestore.FormCreate(Sender: TObject);
begin
  inherited;
  FCanClose := False;
end;

procedure TfrmArhRestore.ThreadEXCEPTION(var Mes: TMessage);
begin
  if Assigned(TObject(Mes.WParam)) and (TObject(Mes.WParam) is Exception) then
    Application.ShowException(Exception(Mes.WParam));
  FCanClose := True;
  Close;
end;

procedure TfrmArhRestore.ARCHIVEPROGRESS(var Mes: TMessage);
begin
  if Mes.LParam = 0 then
  begin
    pgArchiv.Enabled := False;
    pgArchiv.State := pbsPaused;

    lbArchStatys.Caption := string(PChar(Mes.WParam));
  end;

  if Mes.LParam = 1 then
  begin
    pgArchiv.Enabled := true;
    pgArchiv.Style := pbstMarquee;
    pgArchiv.State := pbsNormal;

    lbArchStatys.Caption := string(PChar(Mes.WParam));
  end;

  if Mes.LParam = 2 then
  begin
    FCanClose := True;
    ModalResult := mrOk;
  end;
end;

end.
