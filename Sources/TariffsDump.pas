unit TariffsDump;

interface

uses
  Windows,
  Messages,
  Classes,
  Controls,
  Forms,
  Tools,
  ExtCtrls,
  System.SysUtils,
  fFramePriceDumps;

type
  TFormTariffsDump = class(TSmForm)

    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
  private
    const CaptionButton = 'Тар. по свалкам';
    const HintButton = 'Окно тарифы по свалкам';
  private
    procedure WMSysCommand(var Msg: TMessage); message WM_SYSCOMMAND;
  public
    FramePriceDump: TFramePriceDumps;

  end;

var
  FormTariffsDump: TFormTariffsDump;

implementation

uses Main, Waiting;

{$R *.dfm}

procedure TFormTariffsDump.WMSysCommand(var Msg: TMessage);
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
    ShowWindow(FormTariffsDump.Handle, SW_HIDE); // Скрываем панель свёрнутой формы
    FormMain.PanelCover.Visible := False;
  end
  else
    inherited;
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFormTariffsDump.FormCreate(Sender: TObject);
begin
  // Настройка размеров и положения формы
  ClientWidth := FormMain.ClientWidth div 2;
  ClientHeight := FormMain.ClientHeight div 2;
  Top := 10; // (GetSystemMetrics(SM_CYFRAME) + GetSystemMetrics(SM_CYCAPTION)) * -1;
  Left := 10; // GetSystemMetrics(SM_CXFRAME) * -1;

  WindowState := wsMaximized;
  Caption := FormNamePriceDumps;

  // ----------------------------------------

  FramePriceDump := TFramePriceDumps.Create(Self, Date);
  FramePriceDump.Parent := Self;
  FramePriceDump.Align := alClient;
  FramePriceDump.Visible := true;

  FormWaiting.Show;
  Application.ProcessMessages;

  FramePriceDump.ReceivingAll;

  FormWaiting.Close;
  FormMain.PanelCover.Visible := False;

  // Создаём кнопку от этого окна (на главной форме внизу)
  FormMain.CreateButtonOpenWindow(CaptionButton, HintButton, Self, 1);
  inherited;
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFormTariffsDump.FormActivate(Sender: TObject);
begin
  // Если нажата клавиша Ctrl и выбираем форму, то делаем
  // каскадирование с переносом этой формы на передний план
  FormMain.CascadeForActiveWindow;

  // Делаем нажатой кнопку активной формы (на главной форме внизу)
  FormMain.SelectButtonActiveWindow(CaptionButton);
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFormTariffsDump.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFormTariffsDump.FormDestroy(Sender: TObject);
begin
  FormTariffsDump := nil;

  // Удаляем кнопку от этого окна (на главной форме внизу)
  FormMain.DeleteButtonCloseWindow(CaptionButton);
end;

end.
