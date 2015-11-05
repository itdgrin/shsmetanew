object fWinterPrice: TfWinterPrice
  Left = 0
  Top = 0
  Caption = #1047#1080#1084#1085#1077#1077' '#1091#1076#1086#1088#1086#1078#1072#1085#1080#1077
  ClientHeight = 575
  ClientWidth = 870
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  DesignSize = (
    870
    575)
  PixelsPerInch = 96
  TextHeight = 13
  object tvEstimates: TJvDBTreeView
    Left = 8
    Top = 8
    Width = 529
    Height = 524
    DataSource = dsTreeData
    MasterField = 'ZNORMATIVS_ID'
    DetailField = 'PARENT_ID'
    ItemField = 'NAME_EX_2'
    UseFilter = False
    PersistentNode = False
    DragMode = dmAutomatic
    HideSelection = False
    Indent = 19
    OnExpanding = tvEstimatesExpanding
    OnExpanded = tvEstimatesExpanded
    Align = alCustom
    TabOrder = 0
    PopupMenu = pmZnormativ
    Anchors = [akLeft, akTop, akRight, akBottom]
    HotTrack = True
    Mirror = False
  end
  object grp1: TGroupBox
    Left = 543
    Top = 167
    Width = 319
    Height = 91
    Anchors = [akTop, akRight]
    Caption = #1057#1090#1072#1074#1082#1072', %:'
    TabOrder = 4
    object lblCoef: TLabel
      Left = 8
      Top = 23
      Width = 39
      Height = 13
      Caption = #1054#1073#1097#1080#1081':'
    end
    object lblCoefZP: TLabel
      Left = 8
      Top = 44
      Width = 52
      Height = 13
      Caption = #1047#1072#1088#1087#1083#1072#1090#1072':'
    end
    object lblCoefZPMach: TLabel
      Left = 8
      Top = 65
      Width = 110
      Height = 13
      Caption = #1047#1072#1088#1087#1083#1072#1090#1072' '#1084#1072#1096#1080#1085#1080#1089#1090#1072':'
    end
    object dbedtCOEF: TDBEdit
      Left = 154
      Top = 20
      Width = 156
      Height = 21
      Color = clSilver
      DataField = 'COEF'
      DataSource = dsZnormativs_value
      TabOrder = 1
    end
    object dbedtCOEF_ZP: TDBEdit
      Left = 154
      Top = 41
      Width = 156
      Height = 21
      Color = clSilver
      DataField = 'COEF_ZP'
      DataSource = dsZnormativs_value
      TabOrder = 2
    end
    object dbedtCOEF_ZP_MACH: TDBEdit
      Left = 154
      Top = 62
      Width = 156
      Height = 21
      Color = clSilver
      DataField = 'COEF_ZP_MACH'
      DataSource = dsZnormativs_value
      TabOrder = 3
    end
    object dbnvgr1: TDBNavigator
      Left = 270
      Top = 0
      Width = 40
      Height = 18
      DataSource = dsZnormativs_value
      VisibleButtons = [nbPost, nbCancel]
      TabOrder = 0
    end
  end
  object grRates: TJvDBGrid
    Left = 543
    Top = 264
    Width = 319
    Height = 268
    Anchors = [akTop, akRight, akBottom]
    DataSource = dsZnormativs_detail
    Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    PopupMenu = pmZnormativDetail
    TabOrder = 5
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDrawColumnCell = grRatesDrawColumnCell
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
        FieldName = 'S'
        Title.Alignment = taCenter
        Title.Caption = #1057
        Width = 155
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PO'
        Title.Alignment = taCenter
        Title.Caption = #1055#1086
        Width = 158
        Visible = True
      end>
  end
  object pnl1: TPanel
    Left = 0
    Top = 538
    Width = 870
    Height = 37
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 6
    DesignSize = (
      870
      37)
    object lbl1: TLabel
      Left = 8
      Top = 0
      Width = 35
      Height = 13
      Caption = #1053#1086#1084#1077#1088':'
    end
    object lbl2: TLabel
      Left = 111
      Top = 0
      Width = 52
      Height = 13
      Caption = #1053#1072#1079#1074#1072#1085#1080#1077':'
    end
    object btnClose: TBitBtn
      Left = 787
      Top = 6
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = #1047#1072#1082#1088#1099#1090#1100
      TabOrder = 3
      OnClick = btnCloseClick
    end
    object btnSelect: TBitBtn
      Left = 706
      Top = 6
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = #1042#1099#1073#1088#1072#1090#1100
      ModalResult = 1
      TabOrder = 2
      OnClick = btnSelectClick
    end
    object dbedtNUM: TDBEdit
      Left = 49
      Top = 0
      Width = 56
      Height = 21
      DataField = 'NUM'
      DataSource = dsTreeData
      TabOrder = 0
      OnExit = dbedtNUMExit
    end
    object dbedtNAME: TDBEdit
      Left = 169
      Top = 0
      Width = 469
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'NAME'
      DataSource = dsTreeData
      TabOrder = 1
      OnExit = dbedtNUMExit
    end
  end
  object grChangeDate: TJvDBGrid
    Left = 543
    Top = 8
    Width = 319
    Height = 113
    Anchors = [akTop, akRight]
    DataSource = dsZnormChangeDate
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    PopupMenu = pmZnormativOnDate
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDrawColumnCell = grRatesDrawColumnCell
    AutoSort = False
    SelectColumnsDialogStrings.Caption = 'Select columns'
    SelectColumnsDialogStrings.OK = '&OK'
    SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
    EditControls = <>
    RowsHeight = 17
    TitleRowHeight = 17
    WordWrap = True
    WordWrapAllFields = True
    Columns = <
      item
        Expanded = False
        FieldName = 'onDate'
        Title.Alignment = taCenter
        Title.Caption = #1044#1072#1090#1072' '#1080#1079#1084#1077#1085#1077#1085#1080#1103' '#1089#1090#1072#1074#1086#1082
        Width = 130
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'reason'
        Title.Alignment = taCenter
        Title.Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'doc_date'
        Title.Alignment = taCenter
        Title.Caption = #1044#1072#1090#1072
        Width = 48
        Visible = True
      end>
  end
  object chkShowDeleted: TCheckBox
    Left = 357
    Top = 9
    Width = 179
    Height = 17
    Anchors = [akTop, akRight]
    Caption = #1087#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1091#1076#1072#1083#1077#1085#1085#1099#1077' '#1079#1072#1087#1080#1089#1080
    TabOrder = 2
    OnClick = chkShowDeletedClick
  end
  object memChangeDate: TDBMemo
    Left = 543
    Top = 127
    Width = 319
    Height = 34
    Anchors = [akTop, akRight]
    DataField = 'FULLREASON'
    DataSource = dsZnormChangeDate
    ReadOnly = True
    TabOrder = 3
  end
  object qrTreeData: TFDQuery
    BeforeDelete = qrTreeDataBeforeDelete
    AfterScroll = qrTreeDataAfterScroll
    OnCalcFields = qrTreeDataCalcFields
    Connection = DM.Connect
    Transaction = DM.Read
    UpdateTransaction = DM.Write
    UpdateOptions.AssignedValues = [uvRefreshMode]
    UpdateOptions.UpdateTableName = 'smeta.znormativs'
    UpdateOptions.KeyFields = 'ZNORMATIVS_ID'
    SQL.Strings = (
      'SELECT '
      '  `ZNORMATIVS_ID`,'
      '  `NUM`,'
      '  `NAME`,'
      '  `PARENT_ID`,'
      '  `DEL_FLAG`'
      'FROM '
      '  `znormativs`'
      'WHERE (`DEL_FLAG` = 0) OR (:SHOW_DELETED)'
      'ORDER BY `NUM`=0, -`NUM` DESC, `NUM`;')
    Left = 33
    Top = 18
    ParamData = <
      item
        Name = 'SHOW_DELETED'
        DataType = ftBoolean
        ParamType = ptInput
        Value = False
      end>
    object qrTreeDataZNORMATIVS_ID: TFDAutoIncField
      FieldName = 'ZNORMATIVS_ID'
      Origin = 'ZNORMATIVS_ID'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object strngfldTreeDataNUM: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NUM'
      Origin = 'NUM'
      Size = 10
    end
    object strngfldTreeDataNAME: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NAME'
      Origin = 'NAME'
      Size = 512
    end
    object qrTreeDataPARENT_ID: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'PARENT_ID'
      Origin = 'PARENT_ID'
    end
    object strngfldTreeDataNAME_EX_2: TStringField
      DisplayWidth = 1000
      FieldKind = fkCalculated
      FieldName = 'NAME_EX_2'
      Size = 1000
      Calculated = True
    end
    object qrTreeDataDEL_FLAG: TShortintField
      AutoGenerateValue = arDefault
      FieldName = 'DEL_FLAG'
      Origin = 'DEL_FLAG'
    end
  end
  object dsTreeData: TDataSource
    DataSet = qrTreeData
    Left = 32
    Top = 66
  end
  object qrZnormativs_detail: TFDQuery
    BeforeDelete = qrZnormativs_detailBeforeDelete
    OnNewRecord = qrZnormativs_detailNewRecord
    MasterSource = dsTreeData
    MasterFields = 'ZNORMATIVS_ID'
    Connection = DM.Connect
    Transaction = DM.Read
    UpdateTransaction = DM.Write
    SQL.Strings = (
      'select * from znormativs_detail'
      'WHERE `ZNORMATIVS_ID`=:ZNORMATIVS_ID')
    Left = 585
    Top = 306
    ParamData = <
      item
        Name = 'ZNORMATIVS_ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = 0
      end>
  end
  object dsZnormativs_detail: TDataSource
    DataSet = qrZnormativs_detail
    Left = 586
    Top = 402
  end
  object pmZnormativ: TPopupMenu
    Left = 32
    Top = 112
    object mRepair: TMenuItem
      Caption = #1042#1086#1089#1089#1090#1072#1085#1086#1074#1080#1090#1100
      Enabled = False
    end
    object mAddZnormativ: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      Enabled = False
    end
    object mDelZnormativ: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100
      OnClick = mDelZnormativClick
    end
  end
  object tmr1: TTimer
    OnTimer = tmr1Timer
    Left = 32
    Top = 160
  end
  object pmZnormativDetail: TPopupMenu
    Left = 587
    Top = 351
    object mAddZnormativDetail: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      OnClick = mAddZnormativDetailClick
    end
    object mDelZnormativDetail: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100
      OnClick = mDelZnormativDetailClick
    end
  end
  object qrZnormChangeDate: TFDQuery
    BeforeDelete = qrZnormChangeDateBeforeDelete
    AfterScroll = qrTreeDataAfterScroll
    Connection = DM.Connect
    Transaction = DM.Read
    UpdateTransaction = DM.Write
    UpdateOptions.UpdateTableName = 'smeta.znormativs_ondate'
    SQL.Strings = (
      'SELECT `znormativs_ondate`.*'
      'FROM `znormativs_ondate`'
      'WHERE `DEL_FLAG` = 0'
      'ORDER BY `onDate` DESC')
    Left = 697
    Top = 34
  end
  object dsZnormChangeDate: TDataSource
    DataSet = qrZnormChangeDate
    Left = 696
    Top = 82
  end
  object pmZnormativOnDate: TPopupMenu
    Left = 578
    Top = 40
    object mN1: TMenuItem
      Caption = #1055#1086#1082#1072#1079#1072#1090#1100' '#1080#1089#1093#1086#1076#1085#1099#1081' '#1076#1086#1082#1091#1084#1077#1085#1090
      OnClick = mN1Click
    end
    object mAddDate: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      OnClick = mAddDateClick
    end
    object mDelDate: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100
      OnClick = mDelDateClick
    end
  end
  object qrZnormativs_value: TFDQuery
    OnNewRecord = qrZnormativs_valueNewRecord
    Connection = DM.Connect
    Transaction = DM.Read
    UpdateTransaction = DM.Write
    FormatOptions.AssignedValues = [fvDefaultParamDataType]
    FormatOptions.DefaultParamDataType = ftBCD
    UpdateOptions.UpdateTableName = 'smeta.znormativs_value'
    SQL.Strings = (
      'SELECT '
      '  `ZNORMATIVS_ID`,'
      '  `ZNORMATIVS_ONDATE_ID`,'
      '  `COEF`,'
      '  `COEF_ZP`,'
      '  `COEF_ZP_MACH`,'
      '  `DEL_FLAG`'
      'FROM `znormativs_value`'
      
        'WHERE `ZNORMATIVS_ID`=:ZNORMATIVS_ID AND `ZNORMATIVS_ONDATE_ID`=' +
        ':ZNORMATIVS_ONDATE_ID')
    Left = 713
    Top = 402
    ParamData = <
      item
        Name = 'ZNORMATIVS_ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = 0
      end
      item
        Name = 'ZNORMATIVS_ONDATE_ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = 1
      end>
  end
  object dsZnormativs_value: TDataSource
    DataSet = qrZnormativs_value
    Left = 712
    Top = 346
  end
end
