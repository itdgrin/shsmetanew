unit Waiting;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Tools,
  Dialogs, ExtCtrls, StdCtrls, gifImg, JvExControls, JvAnimatedImage, JvGIFCtrl;

type
  TFormWaiting = class(TSmForm)
    Shape1: TShape;
    Label1: TLabel;
    JvGIFAnimator1: TJvGIFAnimator;
    lbProcess: TLabel;

    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  FormWaiting: TFormWaiting;

implementation

uses Main;

{$R *.dfm}

procedure TFormWaiting.FormCreate(Sender: TObject);
begin
  JvGIFAnimator1.Animate := True;
end;
end.
