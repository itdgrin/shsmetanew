unit SignatureSSR;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, Tools;

type
  TFormSignatureSSR = class(TSmForm)
    label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    ButtonSave: TButton;
    ButtonCancel: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure ButtonCancelClick(Sender: TObject);
    procedure ButtonSaveClick(Sender: TObject);

  private

  public

  end;

const
  CaptionDialog = 'Подписи под ССР';

var
  FormSignatureSSR: TFormSignatureSSR;

implementation

uses Main;

{$R *.dfm}
// ---------------------------------------------------------------------------------------------------------------------

procedure TFormSignatureSSR.FormCreate(Sender: TObject);
begin
  inherited;
  with Constraints do
  begin
    MinHeight := Height;
    MaxHeight := Height;
    MinWidth := Width;
    MaxWidth := Width;
  end;
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFormSignatureSSR.FormShow(Sender: TObject);
begin
  Left := FormMain.Left + (FormMain.Width - Width) div 2;
  Top := FormMain.Top + (FormMain.Height - Height) div 2;

  ButtonSave.Tag := 0;
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFormSignatureSSR.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if ButtonSave.Tag = 0 then
    if ButtonSave.Tag = 0 then
      if MessageBox(0, PChar('Закрыть окно без сохранения?'), CaptionDialog,
        MB_ICONINFORMATION + MB_YESNO + mb_TaskModal) = mrYes then
        CanClose := true
      else
        CanClose := false;
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFormSignatureSSR.ButtonSaveClick(Sender: TObject);
begin
  ButtonSave.Tag := 1;
  MessageBox(0, PChar('Сохраниение зделанных изменений' + #13#10 + 'в реквизитах и закрытие окошка.'),
    CaptionDialog, MB_ICONINFORMATION + MB_OK + mb_TaskModal);
  Close;
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFormSignatureSSR.ButtonCancelClick(Sender: TObject);
begin
  Close;
end;

// ---------------------------------------------------------------------------------------------------------------------

end.
