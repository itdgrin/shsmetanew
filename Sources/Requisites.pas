unit Requisites;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, DBCtrls, StdCtrls, Tools;

type
  TFormRequisites = class(TSmForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    DBLookupComboBox3: TDBLookupComboBox;
    DBLookupComboBox4: TDBLookupComboBox;
    DBLookupComboBox5: TDBLookupComboBox;
    DBLookupComboBox6: TDBLookupComboBox;
    ButtonSave: TButton;
    ButtonCancel: TButton;

    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure ButtonSaveClick(Sender: TObject);
    procedure ButtonCancelClick(Sender: TObject);

  private

  public

  end;

const
  CaptionDialog = 'Реквизиты';

var
  FormRequisites: TFormRequisites;

implementation

uses Main;

{$R *.dfm}
// ---------------------------------------------------------------------------------------------------------------------

procedure TFormRequisites.FormCreate(Sender: TObject);
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

procedure TFormRequisites.FormShow(Sender: TObject);
begin
  Left := FormMain.Left + (FormMain.Width - Width) div 2;
  Top := FormMain.Top + (FormMain.Height - Height) div 2;

  ButtonSave.Tag := 0;
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFormRequisites.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
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

procedure TFormRequisites.ButtonSaveClick(Sender: TObject);
begin
  ButtonSave.Tag := 1;
  MessageBox(0, PChar('Сохраниение зделанных изменений' + #13#10 + 'в реквизитах и закрытие окошка.'), CaptionDialog,
    MB_ICONINFORMATION + MB_OK + mb_TaskModal);
  Close;
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFormRequisites.ButtonCancelClick(Sender: TObject);
begin
  Close;
end;

// ---------------------------------------------------------------------------------------------------------------------

end.
