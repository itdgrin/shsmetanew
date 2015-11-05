object fOXROPRSetup: TfOXROPRSetup
  Left = 0
  Top = 0
  Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1072' '#1054#1061#1056#1080#1054#1055#1056' '#1080' '#1055#1055
  ClientHeight = 282
  ClientWidth = 418
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  DesignSize = (
    418
    282)
  PixelsPerInch = 96
  TextHeight = 13
  object grONormaivs: TJvDBGrid
    Left = 8
    Top = 8
    Width = 402
    Height = 240
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = dsONormativs
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
    AutoSizeColumns = True
    AutoSizeColumnIndex = 2
    SelectColumnsDialogStrings.Caption = 'Select columns'
    SelectColumnsDialogStrings.OK = '&OK'
    SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
    EditControls = <>
    RowsHeight = 17
    TitleRowHeight = 17
    Columns = <
      item
        Expanded = False
        FieldName = 'S'
        Title.Alignment = taCenter
        Title.Caption = #1057
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PO'
        Title.Alignment = taCenter
        Title.Caption = #1055#1086
        Width = 95
        Visible = True
      end
      item
        DropDownRows = 22
        Expanded = False
        FieldName = 'WorkLooK'
        Title.Alignment = taCenter
        Title.Caption = #1058#1080#1087' '#1054#1061#1056#1080#1054#1055#1056' '#1080' '#1055#1055
        Width = 188
        Visible = True
      end>
  end
  object pnl1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 254
    Width = 412
    Height = 25
    Align = alBottom
    BevelOuter = bvNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object dbnvgr1: TDBNavigator
      Left = 0
      Top = 0
      Width = 240
      Height = 25
      DataSource = dsONormativs
      Align = alLeft
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
      TabOrder = 0
      TabStop = True
    end
  end
  object qrONormativs: TFDQuery
    Connection = DM.Connect
    Transaction = DM.Read
    UpdateTransaction = DM.Write
    FormatOptions.AssignedValues = [fvDefaultParamDataType, fvFmtDisplayNumeric]
    FormatOptions.DefaultParamDataType = ftBCD
    FormatOptions.FmtDisplayNumeric = '### ### ### ### ### ### ##0.####'
    SQL.Strings = (
      'SELECT '
      '  `ID`,'
      '  `INTERVAL_ID`,'
      '  `S`,'
      '  `PO`,'
      '  `COEF`,'
      '  `COEF_ZP`,'
      '  `COEF_ZP_MACH`,'
      '  `DATE_BEG`,'
      '  `DATE_END`,'
      '  `WORK_ID`'
      'FROM '
      '  `onormativs`'
      'ORDER BY `S`, `PO`;')
    Left = 271
    Top = 78
    object qrONormativsID: TFDAutoIncField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
      DisplayFormat = '### ### ### ### ### ### ##0.####'
    end
    object qrONormativsINTERVAL_ID: TLongWordField
      AutoGenerateValue = arDefault
      FieldName = 'INTERVAL_ID'
      Origin = 'INTERVAL_ID'
      DisplayFormat = '### ### ### ### ### ### ##0.####'
    end
    object strngfldONormativsS: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'S'
      Origin = 'S'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 50
    end
    object strngfldONormativsPO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'PO'
      Origin = 'PO'
      Size = 50
    end
    object qrONormativsDATE_BEG: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'DATE_BEG'
      Origin = 'DATE_BEG'
    end
    object qrONormativsDATE_END: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'DATE_END'
      Origin = 'DATE_END'
    end
    object qrONormativsWORK_ID: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'WORK_ID'
      Origin = 'WORK_ID'
      DisplayFormat = '### ### ### ### ### ### ##0.####'
    end
    object strngfldONormativsWorkLooK: TStringField
      FieldKind = fkLookup
      FieldName = 'WorkLooK'
      LookupDataSet = qrWorkList
      LookupKeyFields = 'WORK_ID'
      LookupResultField = 'WORK_NAME'
      KeyFields = 'WORK_ID'
      Size = 150
      Lookup = True
    end
  end
  object dsONormativs: TDataSource
    DataSet = qrONormativs
    Left = 304
    Top = 78
  end
  object qrWorkList: TFDQuery
    Connection = DM.Connect
    Transaction = DM.Read
    UpdateTransaction = DM.Write
    FormatOptions.AssignedValues = [fvDefaultParamDataType, fvFmtDisplayNumeric]
    FormatOptions.DefaultParamDataType = ftBCD
    FormatOptions.FmtDisplayNumeric = '### ### ### ### ### ### ##0.####'
    SQL.Strings = (
      'SELECT '
      '  `WORK_ID`,'
      '  `WORK_NAME`'
      'FROM '
      '  `objworks`'
      'ORDER BY `WORK_NAME`;')
    Left = 271
    Top = 150
  end
  object dsWorkList: TDataSource
    DataSet = qrWorkList
    Left = 304
    Top = 150
  end
end
