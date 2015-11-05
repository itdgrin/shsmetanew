unit fFrameSmeta;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs;

type
  TSmetaFrame = class(TFrame)
  protected
    fLoaded: boolean;
  public
    procedure ReceivingAll; Virtual; Abstract;
    procedure CheckCurPeriod; Virtual; Abstract;
    property Loaded: boolean read fLoaded;
  end;

implementation

{$R *.dfm}

end.
