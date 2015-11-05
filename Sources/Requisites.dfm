object FormRequisites: TFormRequisites
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = #1056#1077#1082#1074#1080#1079#1080#1090#1099
  ClientHeight = 199
  ClientWidth = 401
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 35
    Top = 8
    Width = 52
    Height = 13
    Caption = #1048#1085#1074#1077#1089#1090#1086#1088':'
  end
  object Label2: TLabel
    Left = 36
    Top = 35
    Width = 51
    Height = 13
    Caption = #1047#1072#1082#1072#1079#1095#1080#1082':'
  end
  object Label3: TLabel
    Left = 9
    Top = 62
    Width = 78
    Height = 13
    Caption = #1043#1077#1085#1087#1086#1076#1088#1103#1076#1095#1080#1082':'
  end
  object Label4: TLabel
    Left = 8
    Top = 89
    Width = 79
    Height = 13
    Caption = #1057#1091#1073#1087#1086#1076#1088#1103#1076#1095#1080#1082':'
  end
  object Label5: TLabel
    Left = 37
    Top = 116
    Width = 50
    Height = 13
    Caption = #1040#1082#1090' '#1089#1076#1072#1083':'
  end
  object Label6: TLabel
    Left = 25
    Top = 143
    Width = 62
    Height = 13
    Caption = #1040#1082#1090' '#1087#1088#1080#1085#1103#1083':'
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 93
    Top = 4
    Width = 300
    Height = 21
    TabOrder = 0
  end
  object DBLookupComboBox2: TDBLookupComboBox
    Left = 93
    Top = 31
    Width = 300
    Height = 21
    TabOrder = 1
  end
  object DBLookupComboBox3: TDBLookupComboBox
    Left = 93
    Top = 58
    Width = 300
    Height = 21
    TabOrder = 2
  end
  object DBLookupComboBox4: TDBLookupComboBox
    Left = 93
    Top = 85
    Width = 300
    Height = 21
    TabOrder = 3
  end
  object DBLookupComboBox5: TDBLookupComboBox
    Left = 93
    Top = 112
    Width = 300
    Height = 21
    TabOrder = 4
  end
  object DBLookupComboBox6: TDBLookupComboBox
    Left = 93
    Top = 139
    Width = 300
    Height = 21
    TabOrder = 5
  end
  object ButtonSave: TButton
    Left = 193
    Top = 166
    Width = 97
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    TabOrder = 6
    OnClick = ButtonSaveClick
  end
  object ButtonCancel: TButton
    Left = 296
    Top = 166
    Width = 97
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 7
    OnClick = ButtonCancelClick
  end
end
