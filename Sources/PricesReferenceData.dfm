object FormPricesReferenceData: TFormPricesReferenceData
  Left = 0
  Top = 0
  ClientHeight = 109
  ClientWidth = 986
  Color = clBtnFace
  DoubleBuffered = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object PanelPrices: TPanel
    Left = 0
    Top = 0
    Width = 986
    Height = 25
    Align = alTop
    BevelOuter = bvNone
    Ctl3D = True
    DoubleBuffered = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentBackground = False
    ParentCtl3D = False
    ParentDoubleBuffered = False
    ParentFont = False
    TabOrder = 0
    object SpeedButtonPriceMaterials: TSpeedButton
      AlignWithMargins = True
      Left = 148
      Top = 0
      Width = 141
      Height = 25
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alLeft
      GroupIndex = 1
      Caption = #1062#1077#1085#1099' '#1085#1072' '#1084#1072#1090#1077#1088#1080#1072#1083#1099
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      OnClick = SpeedButtonClick
    end
    object SpeedButtonPriceMechanizms: TSpeedButton
      AlignWithMargins = True
      Left = 292
      Top = 0
      Width = 141
      Height = 25
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alLeft
      GroupIndex = 1
      Caption = #1062#1077#1085#1099' '#1085#1072' '#1084#1077#1093#1072#1085#1080#1079#1084#1099
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      OnClick = SpeedButtonClick
    end
    object SpeedButtonPriceTransportation: TSpeedButton
      AlignWithMargins = True
      Left = 436
      Top = 0
      Width = 181
      Height = 25
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alLeft
      GroupIndex = 1
      Caption = #1058#1072#1088#1080#1092#1099' '#1085#1072' '#1075#1088#1091#1079#1086#1087#1077#1088#1077#1074#1086#1079#1082#1080
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      OnClick = SpeedButtonClick
    end
    object SpeedButtonPriceDumps: TSpeedButton
      AlignWithMargins = True
      Left = 620
      Top = 0
      Width = 141
      Height = 25
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alLeft
      GroupIndex = 1
      Caption = #1058#1072#1088#1080#1092#1099' '#1085#1072' '#1089#1074#1072#1083#1082#1080
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      OnClick = SpeedButtonClick
    end
    object btnZP: TSpeedButton
      AlignWithMargins = True
      Left = 3
      Top = 0
      Width = 142
      Height = 25
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alLeft
      GroupIndex = 1
      Down = True
      Caption = #1058#1072#1088#1080#1092#1099' '#1087#1086' '#1079#1072#1088#1087#1083#1072#1090#1077
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      OnClick = SpeedButtonClick
    end
    object btnLoading: TSpeedButton
      Left = 764
      Top = 0
      Width = 205
      Height = 25
      GroupIndex = 1
      Caption = #1058#1072#1088#1080#1092#1099' '#1085#1072' '#1087#1086#1075#1088#1091#1079#1082#1091'/'#1088#1072#1079#1075#1088#1091#1079#1086#1082#1091
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      OnClick = SpeedButtonClick
    end
  end
end
