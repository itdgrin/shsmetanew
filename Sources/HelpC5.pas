unit HelpC5;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, ComCtrls, StdCtrls, ExtCtrls,
  Grids, DBGrids, Tools;

type
  TFormHelpC5 = class(TSmForm)
    PanelMenu: TPanel;
    PanelMenu1: TPanel;
    LabelObject: TLabel;
    Label1: TLabel;
    EditObject: TEdit;
    DateTimePicker1: TDateTimePicker;
    PanelMenu2: TPanel;
    Label2: TLabel;
    Edit1: TEdit;
    PanelMenu3: TPanel;
    Label3: TLabel;
    Edit2: TEdit;
    PanelMenu4: TPanel;
    Label4: TLabel;
    Edit3: TEdit;
    PanelMenu5: TPanel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    DateTimePicker2: TDateTimePicker;
    DateTimePicker3: TDateTimePicker;
    PanelMenu6: TPanel;
    Label8: TLabel;
    PanelMenu7: TPanel;
    Label9: TLabel;
    Label10: TLabel;
    Edit4: TEdit;
    Edit5: TEdit;
    PanelBottom: TPanel;
    PanelBottomButtons: TPanel;
    Panel1: TPanel;
    Label11: TLabel;
    Edit6: TEdit;
    DBGrid1: TDBGrid;

    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);

  private
    const CaptionButton = 'Справка С-5';
    const HintButton = 'Окно справки С-5';
  public

  end;

var
  FormHelpC5: TFormHelpC5;

implementation

uses Main;

{$R *.dfm}
// ---------------------------------------------------------------------------------------------------------------------

procedure TFormHelpC5.FormCreate(Sender: TObject);
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

procedure TFormHelpC5.FormActivate(Sender: TObject);
begin
  // Если нажата клавиша Ctrl и выбираем форму, то делаем
  // каскадирование с переносом этой формы на передний план
  FormMain.CascadeForActiveWindow;

  // Делаем нажатой кнопку активной формы (на главной форме внизу)
  FormMain.SelectButtonActiveWindow(CaptionButton);
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFormHelpC5.FormShow(Sender: TObject);
begin
  // Устанавливаем фокус
  EditObject.SetFocus;
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFormHelpC5.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFormHelpC5.FormDestroy(Sender: TObject);
begin
  FormHelpC5 := nil;

  // Удаляем кнопку от этого окна (на главной форме внизу)
  FormMain.DeleteButtonCloseWindow(CaptionButton);
end;

// ---------------------------------------------------------------------------------------------------------------------

end.
