object FormSummaryCalculationSettings: TFormSummaryCalculationSettings
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = #1057#1074#1086#1076#1085#1099#1077' '#1088#1072#1089#1095#1105#1090#1099' - '#1053#1072#1089#1090#1088#1086#1081#1082#1072
  ClientHeight = 347
  ClientWidth = 525
  Color = clBtnFace
  DoubleBuffered = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 320
    Width = 525
    Height = 27
    Align = alBottom
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 1
    DesignSize = (
      525
      27)
    object Button1: TButton
      Left = 3
      Top = 1
      Width = 110
      Height = 25
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077
      TabOrder = 0
    end
    object Button2: TButton
      Left = 296
      Top = 1
      Width = 110
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      Default = True
      TabOrder = 1
    end
    object Button3: TButton
      Left = 412
      Top = 1
      Width = 110
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1054#1090#1084#1077#1085#1072
      TabOrder = 2
      OnClick = Button3Click
    end
  end
  object DBGrid: TDBGrid
    Left = 0
    Top = 0
    Width = 525
    Height = 320
    Align = alClient
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        Title.Caption = #8470' '#1087'/'#1087
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        Title.Caption = #1053#1072#1079#1074#1072#1085#1080#1077
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        Title.Caption = #1041#1072#1079#1086#1074#1072#1103' '#1089#1090#1086#1080#1084#1086#1089#1090#1100
        Width = 110
        Visible = True
      end
      item
        Expanded = False
        Title.Caption = #1058#1077#1082#1091#1097#1072#1103' '#1089#1090#1086#1080#1084#1086#1089#1090#1100
        Width = 110
        Visible = True
      end>
  end
end
