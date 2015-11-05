object fTrPersSelect: TfTrPersSelect
  Left = 0
  Top = 0
  Caption = #1042#1099#1073#1086#1088' '#1087#1088#1086#1094#1077#1085#1090#1072' '#1090#1088#1072#1085#1089#1087#1086#1088#1090#1072
  ClientHeight = 200
  ClientWidth = 313
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
  object Panel4: TPanel
    Left = 0
    Top = 167
    Width = 313
    Height = 33
    Align = alBottom
    TabOrder = 7
    object btnSelect: TButton
      AlignWithMargins = True
      Left = 85
      Top = 4
      Width = 114
      Height = 25
      Align = alRight
      Caption = #1042#1099#1073#1088#1072#1090#1100
      TabOrder = 0
      OnClick = btnSelectClick
    end
    object btnCancel: TButton
      AlignWithMargins = True
      Left = 205
      Top = 4
      Width = 101
      Height = 25
      Margins.Right = 6
      Align = alRight
      Caption = #1054#1090#1084#1077#1085#1072
      TabOrder = 1
      OnClick = btnCancelClick
    end
  end
  object rbTrPers1: TRadioButton
    Tag = 1
    Left = 16
    Top = 18
    Width = 265
    Height = 17
    Caption = #1052#1072#1090#1077#1088#1080#1072#1083#1099' '#1076#1083#1103' '#1086#1073#1097#1077#1089#1090#1074#1077#1085#1085#1099#1093' '#1088#1072#1073#1086#1090
    TabOrder = 0
    OnClick = rbTrPersClick
  end
  object rbTrPers2: TRadioButton
    Tag = 2
    Left = 16
    Top = 41
    Width = 265
    Height = 17
    Caption = #1052#1077#1090#1072#1083#1080#1095#1077#1089#1082#1080#1077' '#1082#1086#1085#1089#1090#1088#1091#1082#1094#1080#1080
    TabOrder = 1
    OnClick = rbTrPersClick
  end
  object rbTrPers3: TRadioButton
    Tag = 3
    Left = 16
    Top = 65
    Width = 265
    Height = 17
    Caption = #1052#1072#1090#1077#1088#1080#1072#1083#1099' '#1076#1083#1103' '#1089#1072#1085#1080#1090#1072#1088#1085#1086'-'#1090#1077#1093#1085#1080#1095#1077#1089#1082#1080#1093' '#1088#1072#1073#1086#1090
    TabOrder = 2
    OnClick = rbTrPersClick
  end
  object rbTrPers4: TRadioButton
    Tag = 4
    Left = 16
    Top = 89
    Width = 265
    Height = 19
    Caption = #1052#1072#1090#1077#1088#1080#1072#1083#1099' '#1076#1083#1103' '#1101#1083#1077#1082#1090#1088#1086#1084#1086#1085#1090#1072#1078#1085#1099#1093' '#1088#1072#1073#1086#1090
    TabOrder = 3
    OnClick = rbTrPersClick
  end
  object rbTrPers5: TRadioButton
    Tag = 5
    Left = 16
    Top = 113
    Width = 265
    Height = 17
    Caption = #1052#1072#1090#1077#1088#1080#1072#1083#1099' '#1074' '#1087#1086#1089#1090#1088#1086#1077#1095#1085#1099#1093' '#1091#1089#1083#1086#1074#1080#1103#1093
    TabOrder = 4
    OnClick = rbTrPersClick
  end
  object rbTrPers6: TRadioButton
    Tag = 6
    Left = 16
    Top = 137
    Width = 17
    Height = 17
    Checked = True
    TabOrder = 6
    TabStop = True
    OnClick = rbTrPersClick
  end
  object edtrbTrPers: TEdit
    Left = 32
    Top = 136
    Width = 89
    Height = 21
    Alignment = taRightJustify
    TabOrder = 5
    Text = '0'
    OnExit = edtrbTrPersExit
    OnKeyPress = edtrbTrPersKeyPress
  end
end
