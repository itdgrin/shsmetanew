unit OwnData;

interface

uses
  Windows,
  Messages,
  Classes,
  Controls,
  System.SysUtils,
  Forms,
  Buttons,
  ExtCtrls,
  fFrameRates,
  fFrameMaterial,
  fFrameMechanizm,
  fFrameEquipment,
  fFrameSmeta,
  Tools;

type
  TFormOwnData = class(TSmForm)

    PanelOwnData: TPanel;

    SpeedButtonMaterials: TSpeedButton;
    SpeedButtonMechanisms: TSpeedButton;
    SpeedButtonEquipments: TSpeedButton;
    SpeedButtonRates: TSpeedButton;

    constructor Create(AOwner: TComponent; const vDataBase: Char; const vPriceColumn: Boolean); reintroduce;

    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);

    procedure HideAllFrames;

    procedure SpeedButtonClick(Sender: TObject);
  private const
    CaptionButton = 'Собственные данные';

  const
    HintButton = 'Окно собственных данных';
  private
    procedure WMSysCommand(var Msg: TMessage); message WM_SYSCOMMAND;

  public
    FrameRates: TFrameRates;
    FramePriceMaterials: TSprMaterial;
    FramePriceMechanizms: TSprMechanizm;
    FrameEquipments: TSprEquipment;
  end;

var
  FormOwnData: TFormOwnData;

implementation

uses Main, Waiting;

{$R *.dfm}
// ---------------------------------------------------------------------------------------------------------------------

procedure TFormOwnData.WMSysCommand(var Msg: TMessage);
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
    ShowWindow(FormOwnData.Handle, SW_HIDE); // Скрываем панель свёрнутой формы
    FormMain.PanelCover.Visible := False;
  end
  else
    inherited;
end;

// ---------------------------------------------------------------------------------------------------------------------

constructor TFormOwnData.Create(AOwner: TComponent; const vDataBase: Char; const vPriceColumn: Boolean);
begin
  inherited Create(AOwner);

  // ----------------------------------------

  FormMain.PanelCover.Visible := True; // Показываем панель на главной форме

  // ----------------------------------------

  // Настройка размеров и положения формы

  ClientWidth := FormMain.ClientWidth;
  ClientHeight := FormMain.ClientHeight;
  Top := (GetSystemMetrics(SM_CYFRAME) + GetSystemMetrics(SM_CYCAPTION)) * -1;
  Left := GetSystemMetrics(SM_CXFRAME) * -1;

  WindowState := wsMaximized;
  Caption := FormNameOwnData;

  // ----------------------------------------

  FrameRates := TFrameRates.Create(Self, vDataBase, False);
  FrameRates.Parent := Self;
  FrameRates.Align := alClient;
  FrameRates.Visible := False;
  SpeedButtonRates.Tag := Integer(FrameRates);

  FramePriceMaterials := TSprMaterial.Create(Self, vPriceColumn, False, Date, 1, True, False, 2);
  FramePriceMaterials.Parent := Self;
  FramePriceMaterials.LoadSpr;
  FramePriceMaterials.Align := alClient;
  FramePriceMaterials.Visible := False;
  SpeedButtonMaterials.Tag := Integer(FramePriceMaterials);

  FramePriceMechanizms := TSprMechanizm.Create(Self, vPriceColumn, False, Date, 2);
  FramePriceMechanizms.Parent := Self;
  FramePriceMechanizms.LoadSpr;
  FramePriceMechanizms.Align := alClient;
  FramePriceMechanizms.Visible := False;
  SpeedButtonMechanisms.Tag := Integer(FramePriceMechanizms);

  FrameEquipments := TSprEquipment.Create(Self, vPriceColumn, False, 2);
  FrameEquipments.Parent := Self;
  FrameEquipments.LoadSpr;
  FrameEquipments.Align := alClient;
  FrameEquipments.Visible := False;
  SpeedButtonEquipments.Tag := Integer(FrameEquipments);

  SpeedButtonClick(SpeedButtonRates);
  FrameRates.Visible := True;
  FormMain.PanelCover.Visible := False;

  FormMain.CreateButtonOpenWindow(CaptionButton, HintButton, Self);

  SetFormStyle;
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFormOwnData.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFormOwnData.FormActivate(Sender: TObject);
begin
  // Если нажата клавиша Ctrl и выбираем форму, то делаем каскадирование с переносом этой формы на передний план
  FormMain.CascadeForActiveWindow;

  // Делаем нажатой кнопку активной формы (на главной форме внизу)
  FormMain.SelectButtonActiveWindow(CaptionButton);
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFormOwnData.FormDestroy(Sender: TObject);
begin
  FormOwnData := nil;

  // Удаляем кнопку от этого окна (на главной форме внизу)
  FormMain.DeleteButtonCloseWindow(CaptionButton);
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFormOwnData.HideAllFrames;
begin
  FrameRates.Visible := False;
  FramePriceMaterials.Visible := False;
  FramePriceMechanizms.Visible := False;
  FrameEquipments.Visible := False;
end;

procedure TFormOwnData.SpeedButtonClick(Sender: TObject);
begin
  HideAllFrames;

  if not Assigned(TSmetaFrame((Sender as TComponent).Tag)) then
    exit;

  with TSmetaFrame((Sender as TComponent).Tag) do
  begin
    if not Loaded then
    begin
      FormWaiting.Show;
      Application.ProcessMessages;
      try
        ReceivingAll;
      finally
        FormWaiting.Close;
      end;
    end;

    if (Self as TWinControl).Visible then
    begin
      TWinControl((Sender as TComponent).Tag).Visible := True;
      TWinControl((Sender as TComponent).Tag).SetFocus;
    end;
  end;
end;

// ---------------------------------------------------------------------------------------------------------------------

end.
