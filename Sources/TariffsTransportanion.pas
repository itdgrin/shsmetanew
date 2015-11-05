unit TariffsTransportanion;

interface

uses
  Windows,
  Messages,
  Classes,
  Controls,
  Forms,
  ExtCtrls,
  System.SysUtils,
  fFramePriceTransportations, Tools;

type
  TFormTariffsTransportation = class(TSmForm)

    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
  private
    const CaptionButton = 'Тар. по грузоперевозкам';
    const HintButton = 'Окно тарифы по грузоперевозкам';
  private
    procedure WMSysCommand(var Msg: TMessage); message WM_SYSCOMMAND;
  public
    FramePriceTransportation: TFramePriceTransportations;

  end;

var
  FormTariffsTransportation: TFormTariffsTransportation;

implementation

uses Main, Waiting;

{$R *.dfm}

// ---------------------------------------------------------------------------------------------------------------------

procedure TFormTariffsTransportation.WMSysCommand(var Msg: TMessage);
begin
  // SC_MAXIMIZE - Разворачивание формы во весь экран
  // SC_RESTORE - Сворачивание формы в окно
  // SC_MINIMIZE - Сворачивание формы в маленькую панель

  if (Msg.WParam = SC_MAXIMIZE) or (Msg.WParam = SC_RESTORE) then
  begin
    FormMain.PanelCover.Visible := True;
    inherited;
    FormMain.PanelCover.Visible := False;
  end
  else if Msg.WParam = SC_MINIMIZE then
  begin
    FormMain.PanelCover.Visible := True;
    inherited;
    ShowWindow(FormTariffsTransportation.Handle, SW_HIDE); // Скрываем панель свёрнутой формы
    FormMain.PanelCover.Visible := False;
  end
  else
    inherited;
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFormTariffsTransportation.FormCreate(Sender: TObject);
begin
  // Настройка размеров и положения формы
  ClientWidth := FormMain.ClientWidth div 2;
  ClientHeight := FormMain.ClientHeight div 2;
  Top := 10; // (GetSystemMetrics(SM_CYFRAME) + GetSystemMetrics(SM_CYCAPTION)) * -1;
  Left := 10; // GetSystemMetrics(SM_CXFRAME) * -1;

  WindowState := wsMaximized;
  Caption := FormNamePriceMaterials;

  // ----------------------------------------

  FramePriceTransportation := TFramePriceTransportations.Create(Self, Date);
  FramePriceTransportation.Parent := Self;
  FramePriceTransportation.Align := alClient;

  FormWaiting.Show;
  Application.ProcessMessages;

  FramePriceTransportation.ReceivingAll;

  FormWaiting.Close;
  FormMain.PanelCover.Visible := False;
  // ----------------------------------------

  // Создаём кнопку от этого окна (на главной форме внизу)
  FormMain.CreateButtonOpenWindow(CaptionButton, HintButton, Self, 1);
  inherited;
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFormTariffsTransportation.FormActivate(Sender: TObject);
begin
  // Если нажата клавиша Ctrl и выбираем форму, то делаем
  // каскадирование с переносом этой формы на передний план
  FormMain.CascadeForActiveWindow;

  // Делаем нажатой кнопку активной формы (на главной форме внизу)
  FormMain.SelectButtonActiveWindow(CaptionButton);
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFormTariffsTransportation.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFormTariffsTransportation.FormDestroy(Sender: TObject);
begin
  FormTariffsTransportation := nil;

  // Удаляем кнопку от этого окна (на главной форме внизу)
  FormMain.DeleteButtonCloseWindow(CaptionButton);
end;

end.
