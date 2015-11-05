unit AdditionData;

interface

uses
  Windows,
  Messages,
  Classes,
  Controls,
  Forms,
  ExtCtrls,
  Buttons,
  StdCtrls,
  SysUtils,
  fFrameRates,
  Main,
  Waiting,
  Tools,
  fFrameSmeta,
  fFrameMaterial,
  fFrameMechanizm,
  fFrameEquipment;

type
  TFormAdditionData = class(TSmForm)

    PanelTopMenu: TPanel;

    SpeedButtonRates: TSpeedButton;
    SpeedButtonMaterial: TSpeedButton;
    SpeedButtonMechanizm: TSpeedButton;
    SpeedButtonEquipment: TSpeedButton;

    constructor Create(AOwner: TComponent; const vDataBase: Char;
      ASMSubType: Integer = 0); reintroduce;

    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);

    procedure HideAllFrames;
    procedure SpeedButtonClick(Sender: TObject);
  private const
    CaptionButton = 'Добавление данных';

  const
    HintButton = 'Окно добавления данных';
  private
    procedure WMSysCommand(var Msg: TMessage); message WM_SYSCOMMAND;
  public
    FrameRates: TFrameRates;
    FramePriceMaterial: TSprMaterial;
    FramePriceMechanizm: TSprMechanizm;
    FrameEquipment: TSprEquipment;
  end;

var
  FormAdditionData: TFormAdditionData;

implementation

uses CalculationEstimate, fFrameSpr;

{$R *.dfm}
// ---------------------------------------------------------------------------------------------------------------------

procedure TFormAdditionData.WMSysCommand(var Msg: TMessage);
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
    ShowWindow(Self.Handle, SW_HIDE); // Скрываем панель свёрнутой формы
    FormMain.PanelCover.Visible := False;
  end
  else
    inherited;
end;

// ---------------------------------------------------------------------------------------------------------------------

constructor TFormAdditionData.Create(AOwner: TComponent; const vDataBase: Char;
  ASMSubType: Integer);
var
  TmpDate: TDateTime;
  TmpBaseType: Byte;
begin
  inherited Create(AOwner);

  // Настройка размеров и положения формы
  ClientWidth := FormMain.ClientWidth div 2;
  ClientHeight := FormMain.ClientHeight div 2;
  Top := 10; // (GetSystemMetrics(SM_CYFRAME) + GetSystemMetrics(SM_CYCAPTION)) * -1;
  Left := 10; // GetSystemMetrics(SM_CXFRAME) * -1;

  WindowState := wsMaximized;
  Caption := FormNameAdditionData;

  if Assigned(FormCalculationEstimate) then
    TmpDate := EncodeDate(FormCalculationEstimate.YearEstimate, FormCalculationEstimate.MonthEstimate, 1)
  else
    TmpDate := Date;

  // ----------------------------------------

  FrameRates := TFrameRates.Create(Self, vDataBase, True, ASMSubType);
  FrameRates.Parent := Self;
  FrameRates.Align := alClient;
  FrameRates.Visible := False;
  SpeedButtonRates.Tag := Integer(FrameRates);

  TmpBaseType := 1;
  if vDataBase = '1' then
    TmpBaseType := 2;

  FramePriceMaterial := TSprMaterial.Create(Self, True, True, TmpDate,
    FormCalculationEstimate.Region, True, False, TmpBaseType);
  FramePriceMaterial.Parent := Self;
  FramePriceMaterial.LoadSpr;
  FramePriceMaterial.Align := alClient;
  FramePriceMaterial.Visible := False;
  SpeedButtonMaterial.Tag := Integer(FramePriceMaterial);

  FramePriceMechanizm := TSprMechanizm.Create(Self, True, True, TmpDate,
    TmpBaseType);
  FramePriceMechanizm.Parent := Self;
  FramePriceMechanizm.LoadSpr;
  FramePriceMechanizm.Align := alClient;
  FramePriceMechanizm.Visible := False;
  SpeedButtonMechanizm.Tag := Integer(FramePriceMechanizm);

  FrameEquipment := TSprEquipment.Create(Self, True, True, TmpBaseType);
  FrameEquipment.Parent := Self;
  FrameEquipment.LoadSpr;
  FrameEquipment.Align := alClient;
  FrameEquipment.Visible := False;
  SpeedButtonEquipment.Tag := Integer(FrameEquipment);

  SpeedButtonClick(SpeedButtonRates);
  FrameRates.Visible := True;

  // Создаём кнопку от этого окна (на главной форме внизу)
  FormMain.CreateButtonOpenWindow(CaptionButton, HintButton, Self);

  SetFormStyle;
end;

procedure TFormAdditionData.FormActivate(Sender: TObject);
begin
  // Если нажата клавиша Ctrl и выбираем форму, то делаем
  // каскадирование с переносом этой формы на передний план
  FormMain.CascadeForActiveWindow;

  // Делаем нажатой кнопку активной формы (на главной форме внизу)
  FormMain.SelectButtonActiveWindow(CaptionButton);
end;

procedure TFormAdditionData.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;

  FormCalculationEstimate.WindowState := wsMaximized;
  FormCalculationEstimate.Refresh;
end;

procedure TFormAdditionData.FormDestroy(Sender: TObject);
begin
  FormAdditionData := nil;
  // Удаляем кнопку от этого окна (на главной форме внизу)
  FormMain.DeleteButtonCloseWindow(CaptionButton);
end;

procedure TFormAdditionData.HideAllFrames;
begin
  FrameRates.Visible := False;
  FramePriceMaterial.Visible := False;
  FramePriceMechanizm.Visible := False;
  FrameEquipment.Visible := False;
end;

procedure TFormAdditionData.SpeedButtonClick(Sender: TObject);
begin
  HideAllFrames;

  if not Assigned(Pointer((Sender as TComponent).Tag)) then exit;

  if TObject((Sender as TComponent).Tag) is TSmetaFrame then
    with TSmetaFrame((Sender as TComponent).Tag) do
    begin
      if not Loaded then
      begin
        ReceivingAll;
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
