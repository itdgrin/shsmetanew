object fCopyToOwnDialog: TfCopyToOwnDialog
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1085#1080#1077
  ClientHeight = 111
  ClientWidth = 273
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    AlignWithMargins = True
    Left = 10
    Top = 26
    Width = 253
    Height = 39
    Margins.Left = 10
    Margins.Top = 0
    Margins.Right = 10
    Align = alTop
    Caption = #1091#1078#1077' '#1089#1086#1076#1077#1088#1078#1080#1090#1089#1103' '#1074' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1077'.'#13#10#13#10#1042#1099#1073#1077#1088#1080#1090#1077' '#1085#1077#1086#1073#1093#1086#1076#1080#1084#1086#1077' '#1076#1077#1081#1089#1090#1074#1080#1077':'
    ExplicitWidth = 175
  end
  object lbl2: TLabel
    AlignWithMargins = True
    Left = 10
    Top = 10
    Width = 253
    Height = 13
    Margins.Left = 10
    Margins.Top = 10
    Margins.Right = 10
    Align = alTop
    Caption = #1047#1072#1087#1080#1089#1100' '#1089' '#1085#1072#1079#1074#1072#1085#1080#1077#1084':'
    ExplicitWidth = 103
  end
  object btn1: TBitBtn
    Left = 8
    Top = 79
    Width = 75
    Height = 25
    Caption = #1047#1072#1084#1077#1085#1080#1090#1100
    ModalResult = 1
    TabOrder = 0
  end
  object btn2: TBitBtn
    Left = 89
    Top = 79
    Width = 96
    Height = 25
    Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
    TabOrder = 1
    OnClick = btn2Click
  end
  object btn3: TBitBtn
    Left = 191
    Top = 79
    Width = 75
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 2
  end
end
