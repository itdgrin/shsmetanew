unit SmUpdWait;

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
  JvExControls,
  JvAnimatedImage,
  JvGIFCtrl,
  Vcl.ExtCtrls,
  uSmUpdThread;

type
  TfWait = class(TForm)
    JvGIFAnimator1: TJvGIFAnimator;
    Label1: TLabel;
    Shape1: TShape;
    procedure FormCreate(Sender: TObject);
    procedure OnTerminate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FSmUpdThread: TSmUpdThread;
  public
  end;

var fWait: TfWait;
    MHandle: THandle;
    DestPath,
    UpdPath,
    FileName,
    AppName: string;

    UpdType: byte;
    StartApp: Boolean;
    NewAppVers: integer;

implementation

uses Winapi.ShellAPI, GlobsAndConst;

{$R *.dfm}

procedure TfWait.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(FSmUpdThread);
end;

procedure TfWait.FormCreate(Sender: TObject);
begin
  FSmUpdThread := TSmUpdThread.Create(True);
  FSmUpdThread.OnTerminate := OnTerminate;
  FSmUpdThread.Start;
  JvGIFAnimator1.Animate := True;
end;

procedure TfWait.OnTerminate(Sender: TObject);
begin
  Application.Terminate;
end;

end.
