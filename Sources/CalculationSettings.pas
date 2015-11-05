unit CalculationSettings;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, ExtCtrls,
  ComCtrls, Tools;

type
  TFormCalculationSettings = class(TSmForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Bevel1: TBevel;
    ButtonSave: TButton;
    ButtonCancel: TButton;
    GroupBox1: TGroupBox;
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button1: TButton;
    GroupBox2: TGroupBox;
    Label7: TLabel;
    Edit7: TEdit;
    Button7: TButton;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBoxEvery: TCheckBox;
    EditEvery: TEdit;
    LabelEvery: TLabel;
    CheckBoxDeleteData: TCheckBox;
    EditDeleteData: TEdit;
    Label9: TLabel;
    Label10: TLabel;
    Edit10: TEdit;
    Button8: TButton;

    procedure FormShow(Sender: TObject);

    procedure ButtonSaveClick(Sender: TObject);
    procedure ButtonCancelClick(Sender: TObject);
    procedure CheckBoxDeleteDataClick(Sender: TObject);
    procedure EditDeleteDataKeyPress(Sender: TObject; var Key: Char);
    procedure CheckBoxEveryClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  private

  public

  end;

var
  FormCalculationSettings: TFormCalculationSettings;

implementation

uses Main;

{$R *.dfm}
// ---------------------------------------------------------------------------------------------------------------------

procedure TFormCalculationSettings.FormCreate(Sender: TObject);
begin
  inherited;
  //
end;

procedure TFormCalculationSettings.FormShow(Sender: TObject);
begin
  Left := FormMain.Left + (FormMain.Width - Width) div 2;
  Top := FormMain.Top + (FormMain.Height - Height) div 2;
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFormCalculationSettings.CheckBoxEveryClick(Sender: TObject);
begin
  with (Sender as TCheckBox) do
    EditEvery.Enabled := Checked;
end;

procedure TFormCalculationSettings.CheckBoxDeleteDataClick(Sender: TObject);
begin
  with (Sender as TCheckBox) do
    EditDeleteData.Enabled := Checked;
end;

procedure TFormCalculationSettings.EditDeleteDataKeyPress(Sender: TObject; var Key: Char);
begin
  if not CharInSet(Key, ['0' .. '9', #8]) then
    Key := #0;
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFormCalculationSettings.ButtonSaveClick(Sender: TObject);
begin
  // Close;
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFormCalculationSettings.ButtonCancelClick(Sender: TObject);
begin
  Close;
end;

// ---------------------------------------------------------------------------------------------------------------------

end.
