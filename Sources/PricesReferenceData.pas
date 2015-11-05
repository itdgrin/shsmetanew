unit PricesReferenceData;

interface

uses
  Windows,
  Messages,
  Classes,
  Controls,
  Forms,
  Buttons,
  ExtCtrls,
  fFramePriceTransportations,
  fFramePriceDumps,
  fFrameSpr,
  fFrameSmeta,
  fFrameMaterial,
  fFrameMechanizm,
  fFrameLoading,
  Tools,
  System.SysUtils;

type
  TFormPricesReferenceData = class(TSmForm)

    PanelPrices: TPanel;
    SpeedButtonPriceMaterials: TSpeedButton;
    SpeedButtonPriceMechanizms: TSpeedButton;
    SpeedButtonPriceTransportation: TSpeedButton;
    SpeedButtonPriceDumps: TSpeedButton;
    btnZP: TSpeedButton;
    btnLoading: TSpeedButton;

    constructor Create(AOwner: TComponent; const vDataBase: Char; const vPriceColumn: Boolean); reintroduce;

    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);

    procedure HideAllFrames;

    procedure SpeedButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    const CaptionButton = 'Цены по справоч. данным';
    const HintButton = 'Окно цены по справочным данным';
  private
    FramePriceMaterials: TSprMaterial;
    FramePriceMechanizms: TSprMechanizm;
    FramePriceTransportations: TFramePriceTransportations;
    FramePriceDumps: TFramePriceDumps;
    FramePriceLoading: TFrameLoading;

    procedure WMSysCommand(var Msg: TMessage); message WM_SYSCOMMAND;
  end;

var
  FormPricesReferenceData: TFormPricesReferenceData;

implementation

uses Main, Waiting, TariffDict;

{$R *.dfm}

procedure TFormPricesReferenceData.WMSysCommand(var Msg: TMessage);
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
    ShowWindow(FormPricesReferenceData.Handle, SW_HIDE); // Скрываем панель свёрнутой формы
    FormMain.PanelCover.Visible := False;
  end
  else
    inherited;
end;

// ---------------------------------------------------------------------------------------------------------------------

constructor TFormPricesReferenceData.Create(AOwner: TComponent; const vDataBase: Char;
  const vPriceColumn: Boolean);
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
  Caption := FormNamePricesReferenceData;

  // ----------------------------------------

  FramePriceMaterials := TSprMaterial.Create(Self, vPriceColumn, False, Date,
    1, True, False);
  FramePriceMaterials.Parent := Self;
  FramePriceMaterials.LoadSpr;
  FramePriceMaterials.Align := alClient;
  FramePriceMaterials.Visible := False;
  SpeedButtonPriceMaterials.Tag := Integer(FramePriceMaterials);

  FramePriceMechanizms := TSprMechanizm.Create(Self, vPriceColumn, False, Date);
  FramePriceMechanizms.Parent := Self;
  FramePriceMechanizms.LoadSpr;
  FramePriceMechanizms.Align := alClient;
  FramePriceMechanizms.Visible := False;
  SpeedButtonPriceMechanizms.Tag := Integer(FramePriceMechanizms);

  FramePriceTransportations := TFramePriceTransportations.Create(Self, Date);
  FramePriceTransportations.Parent := Self;
  FramePriceTransportations.align := alClient;
  FramePriceTransportations.Visible := False;
  SpeedButtonPriceTransportation.Tag := Integer(FramePriceTransportations);

  FramePriceDumps := TFramePriceDumps.Create(Self, Date);
  FramePriceDumps.Parent := Self;
  FramePriceDumps.align := alClient;
  FramePriceDumps.Visible := False;
  SpeedButtonPriceDumps.Tag := Integer(FramePriceDumps);

  if (not Assigned(fTariffDict)) then
    fTariffDict := TfTariffDict.Create(Self);
  fTariffDict.BorderStyle := bsNone;
  fTariffDict.Parent := Self;
  fTariffDict.Align := alClient;
  fTariffDict.Visible := False;
  btnZP.Tag := Integer(fTariffDict);

  FramePriceLoading := TFrameLoading.Create(Self, Date);
  FramePriceLoading.Parent := Self;
  FramePriceLoading.align := alClient;
  FramePriceLoading.Visible := False;
  btnLoading.Tag := Integer(FramePriceLoading);

  SpeedButtonClick(btnZP);
  fTariffDict.Visible := True;

  SetFormStyle;

  FormMain.PanelCover.Visible := False;

  FormMain.CreateButtonOpenWindow(CaptionButton, HintButton, Self);
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFormPricesReferenceData.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFormPricesReferenceData.FormCreate(Sender: TObject);
begin
  inherited;
  //
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFormPricesReferenceData.FormActivate(Sender: TObject);
begin
  // Если нажата клавиша Ctrl и выбираем форму, то делаем каскадирование с переносом этой формы на передний план
  FormMain.CascadeForActiveWindow;

  // Делаем нажатой кнопку активной формы (на главной форме внизу)
  FormMain.SelectButtonActiveWindow(CaptionButton);
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFormPricesReferenceData.FormDestroy(Sender: TObject);
begin
  FormPricesReferenceData := nil;

  // Удаляем кнопку от этого окна (на главной форме внизу)
  FormMain.DeleteButtonCloseWindow(CaptionButton);
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFormPricesReferenceData.HideAllFrames;
begin
  FramePriceMaterials.Visible := False;
  FramePriceMechanizms.Visible := False;
  FramePriceTransportations.Visible := False;
  FramePriceDumps.Visible := False;
  fTariffDict.Visible := False;
  FramePriceLoading.Visible := False;
end;


procedure TFormPricesReferenceData.SpeedButtonClick(Sender: TObject);
begin
  HideAllFrames;

  if not Assigned(Pointer((Sender as TComponent).Tag)) then exit;

  if TObject((Sender as TComponent).Tag) is TSmetaFrame then
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
      end
      else
        CheckCurPeriod;
    end;

  if TObject((Sender as TComponent).Tag) is TSprFrame then
    TSprFrame((Sender as TComponent).Tag).CheckCurPeriod;

  if (Self as TWinControl).Visible then
  begin
    TWinControl((Sender as TComponent).Tag).Visible := True;
    TWinControl((Sender as TComponent).Tag).SetFocus;
  end;
end;

end.
