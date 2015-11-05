object fCoefficients: TfCoefficients
  Left = 0
  Top = 0
  Caption = #1053#1072#1073#1086#1088#1099' '#1082#1086#1101#1092#1092#1080#1094#1080#1077#1085#1090#1086#1074' '#1082' '#1089#1090#1072#1090#1100#1103#1084' '#1079#1072#1090#1088#1072#1090
  ClientHeight = 393
  ClientWidth = 749
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnShow = FormShow
  DesignSize = (
    749
    393)
  PixelsPerInch = 96
  TextHeight = 13
  object grCoef: TJvDBGrid
    Left = 8
    Top = 12
    Width = 733
    Height = 336
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = dsCoef
    DrawingStyle = gdsClassic
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    PopupMenu = pm1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDrawColumnCell = grCoefDrawColumnCell
    OnDblClick = btnAddClick
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
        Expanded = False
        FieldName = 'coef_name'
        Title.Alignment = taCenter
        Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        Width = 139
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CoefTypeLook'
        Title.Alignment = taCenter
        Title.Caption = #1058#1080#1087
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'osn_zp'
        Title.Alignment = taCenter
        Title.Caption = #1047#1055
        Width = 72
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'eksp_mach'
        Title.Alignment = taCenter
        Title.Caption = #1069#1052#1080#1052
        Width = 72
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'mat_res'
        Title.Alignment = taCenter
        Title.Caption = #1052#1056
        Width = 72
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'work_pers'
        Title.Alignment = taCenter
        Title.Caption = #1058#1047' '#1088#1072#1073'.'
        Width = 72
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'work_mach'
        Title.Alignment = taCenter
        Title.Caption = #1058#1047' '#1084#1072#1096'.'
        Width = 72
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'oxropr'
        Title.Alignment = taCenter
        Title.Caption = #1054#1061#1056#1080#1054#1055#1056
        Width = 72
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'planprib'
        Title.Alignment = taCenter
        Title.Caption = #1055#1055
        Width = 63
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ZP_MASH'
        Title.Alignment = taCenter
        Title.Caption = #1047#1055' '#1084#1072#1096'.'
        Width = 74
        Visible = True
      end>
  end
  object pnl1: TPanel
    Left = 8
    Top = 350
    Width = 733
    Height = 35
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 1
    ExplicitWidth = 596
    DesignSize = (
      733
      35)
    object btnClose: TButton
      Left = 653
      Top = 4
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = #1047#1072#1082#1088#1099#1090#1100
      TabOrder = 2
      OnClick = btnCloseClick
      ExplicitLeft = 516
    end
    object dbnvgr1: TDBNavigator
      Left = 0
      Top = 4
      Width = 216
      Height = 25
      DataSource = dsCoef
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbEdit, nbPost, nbCancel]
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
      OnClick = dbnvgr1Click
    end
    object btnAdd: TButton
      Left = 570
      Top = 4
      Width = 77
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = #1042#1099#1073#1088#1072#1090#1100
      Default = True
      TabOrder = 1
      OnClick = btnAddClick
      ExplicitLeft = 433
    end
  end
  object qrCoef: TFDQuery
    BeforeEdit = qrCoefNewRecord
    AfterPost = qrCoefAfterPost
    AfterCancel = qrCoefAfterPost
    OnNewRecord = qrCoefNewRecord
    Connection = DM.Connect
    Transaction = DM.Read
    UpdateTransaction = DM.Write
    FormatOptions.AssignedValues = [fvDefaultParamDataType, fvDataSnapCompatibility, fvFmtDisplayNumeric]
    FormatOptions.DefaultParamDataType = ftBCD
    FormatOptions.FmtDisplayNumeric = '#0.00'
    UpdateOptions.UpdateTableName = 'smeta.coef'
    SQL.Strings = (
      
        'SELECT coef_id, coef_name, osn_zp, eksp_mach, mat_res, work_pers' +
        ' , work_mach, coef_type_id, oxropr, planprib, ZP_MASH'
      'FROM coef '
      'ORDER BY IFNULL(coef_type_id, 999999999), coef_name')
    Left = 25
    Top = 66
    object qrCoefcoef_id: TFDAutoIncField
      FieldName = 'coef_id'
      Origin = 'COEF_ID'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
      DisplayFormat = '#0.00'
    end
    object strngfldCoefcoef_name: TStringField
      FieldName = 'coef_name'
      Origin = 'COEF_NAME'
      Required = True
      Size = 150
    end
    object qrCoefosn_zp: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'osn_zp'
      Origin = 'OSN_ZP'
      DisplayFormat = '#0.00'
      Precision = 5
      Size = 2
    end
    object qrCoefeksp_mach: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'eksp_mach'
      Origin = 'EKSP_MACH'
      DisplayFormat = '#0.00'
      Precision = 5
      Size = 2
    end
    object qrCoefmat_res: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'mat_res'
      Origin = 'MAT_RES'
      DisplayFormat = '#0.00'
      Precision = 5
      Size = 2
    end
    object qrCoefwork_pers: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'work_pers'
      Origin = 'WORK_PERS'
      DisplayFormat = '#0.00'
      Precision = 5
      Size = 2
    end
    object qrCoefwork_mach: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'work_mach'
      Origin = 'WORK_MACH'
      DisplayFormat = '#0.00'
      Precision = 5
      Size = 2
    end
    object qrCoefcoef_type_id: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'coef_type_id'
      Origin = 'COEF_TYPE_ID'
      DisplayFormat = '#0.00'
    end
    object qrCoefoxropr: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'oxropr'
      Origin = 'OXROPR'
      DisplayFormat = '#0.00'
      Precision = 5
      Size = 2
    end
    object qrCoefplanprib: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'planprib'
      Origin = 'PLANPRIB'
      DisplayFormat = '#0.00'
      Precision = 5
      Size = 2
    end
    object strngfldCoefCoefTypeLook: TStringField
      FieldKind = fkLookup
      FieldName = 'CoefTypeLook'
      LookupDataSet = qrCoef_Type
      LookupKeyFields = 'coef_type_id'
      LookupResultField = 'coef_type_name'
      KeyFields = 'coef_type_id'
      Size = 50
      Lookup = True
    end
    object qrCoefZP_MASH: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'ZP_MASH'
      Origin = 'ZP_MASH'
      DisplayFormat = '#0.00'
      Precision = 5
      Size = 2
    end
  end
  object dsCoef: TDataSource
    DataSet = qrCoef
    Left = 72
    Top = 66
  end
  object pm1: TPopupMenu
    Left = 112
    Top = 64
    object N5: TMenuItem
      Caption = #1042' '#1088#1072#1089#1094#1077#1085#1082#1091
      OnClick = btnAddClick
    end
    object N4: TMenuItem
      Caption = '-'
    end
    object N1: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      OnClick = N2Click
    end
    object N3: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100
      OnClick = N3Click
    end
  end
  object qrCoef_Type: TFDQuery
    BeforeEdit = qrCoefNewRecord
    AfterPost = qrCoefAfterPost
    AfterCancel = qrCoefAfterPost
    OnNewRecord = qrCoefNewRecord
    Connection = DM.Connect
    Transaction = DM.Read
    UpdateTransaction = DM.Write
    FormatOptions.AssignedValues = [fvFmtDisplayNumeric]
    FormatOptions.FmtDisplayNumeric = '#0.00'
    SQL.Strings = (
      'SELECT '
      '  `coef_type_id`,'
      '  `coef_type_name`'
      'FROM '
      '  `coef_type`'
      'ORDER BY `coef_type_name`')
    Left = 49
    Top = 130
  end
  object dsCoef_Type: TDataSource
    DataSet = qrCoef_Type
    Left = 112
    Top = 130
  end
  object FormStorage: TJvFormStorage
    AppStorage = FormMain.AppIni
    AppStoragePath = '%FORM_NAME%\'
    Options = []
    StoredValues = <>
    Left = 32
    Top = 200
  end
end
