object fCardOrganization: TfCardOrganization
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1050#1072#1088#1090#1086#1095#1082#1072' '#1086#1088#1075#1072#1085#1080#1079#1072#1094#1080#1080
  ClientHeight = 401
  ClientWidth = 455
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  DesignSize = (
    455
    401)
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel: TBevel
    Left = 0
    Top = 360
    Width = 455
    Height = 41
    Align = alBottom
    Shape = bsTopLine
    ExplicitTop = 157
    ExplicitWidth = 712
  end
  object lbl1: TLabel
    Left = 8
    Top = 11
    Width = 77
    Height = 13
    Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077':'
  end
  object lbl3: TLabel
    Left = 8
    Top = 38
    Width = 25
    Height = 13
    Caption = #1059#1053#1053':'
  end
  object lbl4: TLabel
    Left = 8
    Top = 145
    Width = 49
    Height = 13
    Caption = #8470' '#1089#1095#1105#1090#1072':'
  end
  object lbl5: TLabel
    Left = 8
    Top = 172
    Width = 34
    Height = 13
    Caption = #1054#1050#1055#1054':'
  end
  object lbl6: TLabel
    Left = 8
    Top = 199
    Width = 35
    Height = 13
    Caption = #1040#1076#1088#1077#1089':'
  end
  object lbl7: TLabel
    Left = 8
    Top = 226
    Width = 88
    Height = 13
    Caption = #1040#1076#1088#1077#1089' '#1101#1083'. '#1087#1086#1095#1090#1099':'
  end
  object lbl8: TLabel
    Left = 8
    Top = 253
    Width = 48
    Height = 13
    Caption = #1058#1077#1083#1077#1092#1086#1085':'
  end
  object lbl9: TLabel
    Left = 8
    Top = 280
    Width = 85
    Height = 13
    Caption = #1056#1091#1082'. '#1076#1086#1083#1078#1085#1086#1089#1090#1100':'
  end
  object lbl10: TLabel
    Left = 8
    Top = 307
    Width = 39
    Height = 13
    Caption = #1060'.'#1048'.'#1054'.:'
  end
  object lbl11: TLabel
    Left = 8
    Top = 334
    Width = 78
    Height = 13
    Caption = #1050#1086#1085#1090#1072#1082#1090'. '#1083#1080#1094#1086':'
  end
  object lbl12: TLabel
    Left = 273
    Top = 253
    Width = 29
    Height = 13
    Caption = #1060#1072#1082#1089':'
  end
  object lbl13: TLabel
    Left = 8
    Top = 92
    Width = 66
    Height = 13
    Caption = #1053#1072#1080#1084'. '#1073#1072#1085#1082#1072':'
  end
  object lbl14: TLabel
    Left = 8
    Top = 65
    Width = 57
    Height = 13
    Caption = #1050#1086#1076' '#1073#1072#1085#1082#1072':'
  end
  object lbl15: TLabel
    Left = 8
    Top = 118
    Width = 68
    Height = 13
    Caption = #1040#1076#1088#1077#1089' '#1073#1072#1085#1082#1072':'
  end
  object btnSave: TButton
    Left = 241
    Top = 368
    Width = 100
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    Default = True
    TabOrder = 14
    OnClick = btnSaveClick
  end
  object btnClose: TButton
    Left = 347
    Top = 368
    Width = 100
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 15
    OnClick = btnCloseClick
  end
  object dbedtNAME: TDBEdit
    Left = 102
    Top = 8
    Width = 345
    Height = 21
    DataField = 'NAME'
    DataSource = fOrganizationsEx.dsMain
    TabOrder = 0
  end
  object dbedtUNN: TDBEdit
    Left = 102
    Top = 35
    Width = 345
    Height = 21
    DataField = 'UNN'
    DataSource = fOrganizationsEx.dsMain
    TabOrder = 1
  end
  object dbedtACCOUNT: TDBEdit
    Left = 102
    Top = 142
    Width = 345
    Height = 21
    DataField = 'ACCOUNT'
    DataSource = fOrganizationsEx.dsMain
    TabOrder = 5
  end
  object dbedtOKPO: TDBEdit
    Left = 102
    Top = 169
    Width = 345
    Height = 21
    DataField = 'OKPO'
    DataSource = fOrganizationsEx.dsMain
    TabOrder = 6
  end
  object dbedtADDRESS: TDBEdit
    Left = 102
    Top = 196
    Width = 345
    Height = 21
    DataField = 'ADDRESS'
    DataSource = fOrganizationsEx.dsMain
    TabOrder = 7
  end
  object dbedtEMAIL: TDBEdit
    Left = 102
    Top = 223
    Width = 345
    Height = 21
    DataField = 'EMAIL'
    DataSource = fOrganizationsEx.dsMain
    TabOrder = 8
  end
  object dbedtPHONE: TDBEdit
    Left = 102
    Top = 250
    Width = 165
    Height = 21
    DataField = 'PHONE'
    DataSource = fOrganizationsEx.dsMain
    TabOrder = 9
  end
  object dbedtRUK_PROF: TDBEdit
    Left = 102
    Top = 277
    Width = 345
    Height = 21
    DataField = 'RUK_PROF'
    DataSource = fOrganizationsEx.dsMain
    TabOrder = 11
  end
  object dbedtRUK_FIO: TDBEdit
    Left = 102
    Top = 304
    Width = 345
    Height = 21
    DataField = 'RUK_FIO'
    DataSource = fOrganizationsEx.dsMain
    TabOrder = 12
  end
  object dbedtCONTACT_FIO: TDBEdit
    Left = 102
    Top = 331
    Width = 345
    Height = 21
    DataField = 'CONTACT_FIO'
    DataSource = fOrganizationsEx.dsMain
    TabOrder = 13
  end
  object dbedtFAX: TDBEdit
    Left = 320
    Top = 250
    Width = 127
    Height = 21
    DataField = 'FAX'
    DataSource = fOrganizationsEx.dsMain
    TabOrder = 10
  end
  object dbedtACCOUNT1: TDBEdit
    Left = 102
    Top = 62
    Width = 345
    Height = 21
    DataField = 'CODE'
    DataSource = fOrganizationsEx.dsMain
    TabOrder = 2
  end
  object dbedtOKPO1: TDBEdit
    Left = 102
    Top = 89
    Width = 345
    Height = 21
    DataField = 'BANK'
    DataSource = fOrganizationsEx.dsMain
    TabOrder = 3
  end
  object dbedtBANK: TDBEdit
    Left = 102
    Top = 116
    Width = 345
    Height = 21
    DataField = 'BANK_ADDRESS'
    DataSource = fOrganizationsEx.dsMain
    TabOrder = 4
  end
end
