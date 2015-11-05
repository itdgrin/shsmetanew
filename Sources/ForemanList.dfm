object fForemanList: TfForemanList
  Left = 0
  Top = 0
  Caption = #1057#1087#1080#1089#1086#1082' '#1087#1088#1086#1088#1072#1073#1086#1074
  ClientHeight = 451
  ClientWidth = 351
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object grMain: TJvDBGrid
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 345
    Height = 380
    Align = alClient
    DataSource = dsMain
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDrawColumnCell = grMainDrawColumnCell
    IniStorage = FormStorage
    AutoSizeColumns = True
    SelectColumnsDialogStrings.Caption = 'Select columns'
    SelectColumnsDialogStrings.OK = '&OK'
    SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
    EditControls = <>
    RowsHeight = 17
    TitleRowHeight = 17
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'NUMPP'
        Title.Alignment = taCenter
        Title.Caption = #8470#1087#1087
        Width = 35
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'foreman_first_name'
        Title.Alignment = taCenter
        Title.Caption = #1060#1072#1084#1080#1083#1080#1103
        Width = 98
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'foreman_name'
        Title.Alignment = taCenter
        Title.Caption = #1048#1084#1103
        Width = 98
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'foreman_second_name'
        Title.Alignment = taCenter
        Title.Caption = #1054#1090#1095#1077#1089#1090#1074#1086
        Width = 94
        Visible = True
      end>
  end
  object dbnvgr1: TDBNavigator
    AlignWithMargins = True
    Left = 3
    Top = 389
    Width = 345
    Height = 25
    DataSource = dsMain
    Align = alBottom
    Hints.Strings = (
      #1053#1072' '#1087#1077#1088#1074#1091#1102' '#1079#1072#1087#1080#1089#1100
      #1055#1088#1077#1076#1099#1076#1091#1097#1072#1103' '#1079#1072#1087#1080#1089#1100
      #1057#1083#1077#1076#1091#1102#1097#1072#1103' '#1079#1072#1087#1080#1089#1100
      #1053#1072' '#1087#1086#1089#1083#1077#1076#1085#1102#1102' '#1079#1072#1087#1080#1089#1100
      #1053#1086#1074#1072#1103' '#1079#1072#1087#1080#1089#1100
      #1059#1076#1072#1083#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
      #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1079#1072#1087#1080#1089#1100
      #1057#1086#1093#1088#1072#1085#1080#1090#1100
      #1054#1090#1084#1077#1085#1080#1090#1100
      #1054#1073#1085#1086#1074#1080#1090#1100
      'Apply updates'
      'Cancel updates')
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    TabStop = True
  end
  object pnlSelect: TPanel
    Left = 0
    Top = 417
    Width = 351
    Height = 34
    Align = alBottom
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    object btn1: TBitBtn
      Left = 271
      Top = 4
      Width = 75
      Height = 25
      Caption = #1054#1090#1084#1077#1085#1072
      TabOrder = 1
      OnClick = btn1Click
    end
    object btn2: TBitBtn
      Left = 190
      Top = 4
      Width = 75
      Height = 25
      Caption = #1042#1099#1073#1088#1072#1090#1100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = btn2Click
    end
  end
  object qrMain: TFDQuery
    OnCalcFields = qrMainCalcFields
    Connection = DM.Connect
    Transaction = DM.Read
    UpdateTransaction = DM.Write
    UpdateOptions.UpdateTableName = 'smeta.foreman'
    UpdateOptions.KeyFields = 'foreman_id'
    SQL.Strings = (
      'SELECT * FROM foreman'
      'ORDER BY foreman_first_name')
    Left = 256
    Top = 152
    object qrMainforeman_id: TFDAutoIncField
      FieldName = 'foreman_id'
      Origin = 'foreman_id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object strngfldMainforeman_name: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'foreman_name'
      Origin = 'foreman_name'
      Size = 100
    end
    object strngfldMainforeman_first_name: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'foreman_first_name'
      Origin = 'foreman_first_name'
      Size = 11
    end
    object strngfldMainforeman_second_name: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'foreman_second_name'
      Origin = 'foreman_second_name'
      Size = 100
    end
    object qrMainNUMPP: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'NUMPP'
      Calculated = True
    end
  end
  object dsMain: TDataSource
    DataSet = qrMain
    Left = 200
    Top = 152
  end
  object FormStorage: TJvFormStorage
    AppStorage = FormMain.AppIni
    AppStoragePath = '%FORM_NAME%\'
    Options = []
    StoredValues = <>
    Left = 32
    Top = 224
  end
end
