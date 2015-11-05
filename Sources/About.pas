unit About;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, ExtCtrls, StdCtrls, Tools;

type
  TfAbout = class(TSmForm)
    pnl1: TPanel;
    imgProgramIcon: TImage;
    lblProductName: TLabel;
    lblComments: TLabel;
    btnOKButton: TButton;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses Main;

{$R *.dfm}
// ---------------------------------------------------------------------------------------------------------------------

procedure TfAbout.FormCreate(Sender: TObject);
begin
  inherited;
  //
end;

procedure TfAbout.FormShow(Sender: TObject);
begin
  Left := FormMain.Left + (FormMain.Width - Width) div 2;
  Top := FormMain.Top + (FormMain.Height - Height) div 2;
end;

// ---------------------------------------------------------------------------------------------------------------------

end.
