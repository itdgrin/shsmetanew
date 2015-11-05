unit HelpC3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, Grids, DBGrids,
  ComCtrls, ExtCtrls, Tools;

type
  TFormHelpC3 = class(TSmForm)
    PanelMenu: TPanel;
    PanelMenu1: TPanel;
    LabelObject: TLabel;
    EditObject: TEdit;
    Label1: TLabel;
    DateTimePicker1: TDateTimePicker;
    Panel1: TPanel;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Button1: TButton;

    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Button1Click(Sender: TObject);

  private
    const CaptionButton = 'Справка С-3';
    const HintButton = 'Окно справки С-3';
  public

  end;

var
  FormHelpC3: TFormHelpC3;

implementation

uses Main, Requisites;

{$R *.dfm}
// ---------------------------------------------------------------------------------------------------------------------

procedure TFormHelpC3.FormCreate(Sender: TObject);
begin
  inherited;
  // Настройка размеров и положения формы
  ClientWidth := FormMain.ClientWidth div 2;
  ClientHeight := FormMain.ClientHeight div 2;
  Top := 20;
  Left := 20;

  WindowState := wsMaximized;

  // Создаём кнопку от этого окна (на главной форме внизу)
  FormMain.CreateButtonOpenWindow(CaptionButton, HintButton, Self);
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFormHelpC3.FormActivate(Sender: TObject);
begin
  // Если нажата клавиша Ctrl и выбираем форму, то делаем
  // каскадирование с переносом этой формы на передний план
  FormMain.CascadeForActiveWindow;

  // Делаем нажатой кнопку активной формы (на главной форме внизу)
  FormMain.SelectButtonActiveWindow(CaptionButton);
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFormHelpC3.FormShow(Sender: TObject);
begin
  // Устанавливаем фокус
  EditObject.SetFocus;
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFormHelpC3.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFormHelpC3.FormDestroy(Sender: TObject);
begin
  FormHelpC3 := nil;

  // Удаляем кнопку от этого окна (на главной форме внизу)
  FormMain.DeleteButtonCloseWindow(CaptionButton);
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFormHelpC3.Button1Click(Sender: TObject);
begin
  FormRequisites.ShowModal;
end;

// ---------------------------------------------------------------------------------------------------------------------

end.
