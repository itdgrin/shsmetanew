object fKC6Journal: TfKC6Journal
  Left = 0
  Top = 0
  Caption = #1046#1091#1088#1085#1072#1083' '#1050#1057'-6'
  ClientHeight = 400
  ClientWidth = 962
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object pgcPage: TPageControl
    Left = 0
    Top = 57
    Width = 962
    Height = 343
    ActivePage = tsEstimate
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    MultiLine = True
    ParentFont = False
    Style = tsFlatButtons
    TabOrder = 1
    OnChange = pgcPageChange
    object tsEstimate: TTabSheet
      Caption = #1055#1086' '#1088#1072#1089#1094#1077#1085#1082#1072#1084
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabVisible = False
      object spl1: TSplitter
        Left = 0
        Top = 121
        Width = 954
        Height = 3
        Cursor = crVSplit
        Align = alTop
        ExplicitWidth = 214
      end
      object spl2: TSplitter
        Left = 0
        Top = 270
        Width = 954
        Height = 3
        Cursor = crVSplit
        Align = alBottom
        ExplicitLeft = -3
        ExplicitTop = 281
        ExplicitWidth = 591
      end
      object tvEstimates: TJvDBTreeView
        Left = 0
        Top = 0
        Width = 954
        Height = 121
        DataSource = dsTreeData
        MasterField = 'SM_ID'
        DetailField = 'PARENT'
        ItemField = 'NAME'
        StartMasterValue = '0'
        UseFilter = True
        PersistentNode = True
        ReadOnly = True
        Indent = 19
        Align = alTop
        TabOrder = 0
        OnClick = tvEstimatesClick
        RowSelect = True
        Mirror = False
      end
      object dbgrd2: TJvDBGrid
        Left = 0
        Top = 273
        Width = 954
        Height = 60
        Align = alBottom
        DataSource = dsDetail
        DrawingStyle = gdsClassic
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        ParentFont = False
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDrawColumnCell = dbgrdDataDrawColumnCell
        SelectColumnsDialogStrings.Caption = 'Select columns'
        SelectColumnsDialogStrings.OK = '&OK'
        SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
        EditControls = <>
        RowsHeight = 17
        TitleRowHeight = 17
        Columns = <
          item
            Expanded = False
            FieldName = 'Number'
            Title.Alignment = taCenter
            Title.Caption = #8470#1087#1087
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'MONTHYEAR'
            Title.Alignment = taCenter
            Title.Caption = #1052#1077#1089#1103#1094
            Width = 81
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'osnov'
            Title.Alignment = taCenter
            Title.Caption = #1054#1073#1086#1089#1085#1086#1074#1072#1085#1080#1077
            Width = 166
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'cnt'
            Title.Alignment = taCenter
            Title.Caption = #1050#1086#1083'-'#1074#1086
            Width = 54
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'docname'
            Title.Alignment = taCenter
            Title.Caption = #1044#1086#1082#1091#1084#1077#1085#1090
            Width = 351
            Visible = True
          end>
      end
      object dbgrdData: TJvDBGrid
        Left = 0
        Top = 124
        Width = 954
        Height = 146
        Align = alClient
        DataSource = dsData
        DrawingStyle = gdsClassic
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleHotTrack]
        ParentFont = False
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDrawColumnCell = dbgrdDataDrawColumnCell
        SelectColumnsDialogStrings.Caption = 'Select columns'
        SelectColumnsDialogStrings.OK = '&OK'
        SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
        EditControls = <>
        RowsHeight = 17
        TitleRowHeight = 17
      end
    end
    object tsPTM: TTabSheet
      Caption = #1055#1086' '#1055#1058#1052
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ImageIndex = 1
      ParentFont = False
      TabVisible = False
      object dbgrdPTM: TJvDBGrid
        Left = 0
        Top = 0
        Width = 954
        Height = 333
        Align = alClient
        DataSource = dsPTM
        DrawingStyle = gdsClassic
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        ParentFont = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        SelectColumnsDialogStrings.Caption = 'Select columns'
        SelectColumnsDialogStrings.OK = '&OK'
        SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
        EditControls = <>
        RowsHeight = 17
        TitleRowHeight = 17
      end
    end
    object tsSM: TTabSheet
      Caption = #1055#1086' '#1089#1084#1077#1090#1072#1084
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ImageIndex = 2
      ParentFont = False
      TabVisible = False
      object dbgrdEstimate: TJvDBGrid
        Left = 0
        Top = 0
        Width = 954
        Height = 333
        Align = alClient
        DataSource = dsEstimate
        DrawingStyle = gdsClassic
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        ParentFont = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        SelectColumnsDialogStrings.Caption = 'Select columns'
        SelectColumnsDialogStrings.OK = '&OK'
        SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
        EditControls = <>
        RowsHeight = 17
        TitleRowHeight = 17
      end
    end
  end
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 962
    Height = 57
    Align = alTop
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    DesignSize = (
      962
      57)
    object lbl1: TLabel
      Left = 8
      Top = 8
      Width = 39
      Height = 13
      Caption = #1054#1073#1098#1077#1082#1090
    end
    object lbl2: TLabel
      Left = 8
      Top = 32
      Width = 190
      Height = 13
      Caption = #1046#1091#1088#1085#1072#1083' 6-'#1050#1057' '#1087#1086' '#1086#1073#1098#1077#1082#1090#1091' '#1079#1072' '#1087#1077#1088#1080#1086#1076' '#1089
    end
    object lbl3: TLabel
      Left = 337
      Top = 32
      Width = 12
      Height = 13
      Caption = #1087#1086
    end
    object cbbMode: TComboBox
      Left = 650
      Top = 30
      Width = 83
      Height = 21
      Style = csDropDownList
      Anchors = [akTop, akRight]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ItemIndex = 0
      ParentFont = False
      TabOrder = 7
      TabStop = False
      Text = #1082#1086#1083#1080#1095#1077#1089#1090#1074#1086
      OnChange = cbbFromMonthChange
      Items.Strings = (
        #1082#1086#1083#1080#1095#1077#1089#1090#1074#1086
        #1089#1090#1086#1080#1084#1086#1089#1090#1100)
    end
    object rbRates: TRadioButton
      Left = 739
      Top = 32
      Width = 84
      Height = 17
      Anchors = [akTop, akRight]
      Caption = #1087#1086' '#1088#1072#1089#1094#1077#1085#1082#1072#1084
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 9
      TabStop = True
      OnClick = rbRatesClick
    end
    object rbPTM: TRadioButton
      Left = 829
      Top = 32
      Width = 56
      Height = 17
      Anchors = [akTop, akRight]
      Caption = #1087#1086' '#1055#1058#1052
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 10
      OnClick = rbRatesClick
    end
    object cbbFromMonth: TComboBox
      Left = 204
      Top = 30
      Width = 75
      Height = 21
      Style = csDropDownList
      DropDownCount = 12
      ItemIndex = 1
      TabOrder = 3
      Text = #1060#1077#1074#1088#1072#1083#1100
      OnChange = cbbFromMonthChange
      Items.Strings = (
        #1071#1085#1074#1072#1088#1100
        #1060#1077#1074#1088#1072#1083#1100
        #1052#1072#1088#1090
        #1040#1087#1088#1077#1083#1100
        #1052#1072#1081
        #1048#1102#1085#1100
        #1048#1102#1083#1100
        #1040#1074#1075#1091#1089#1090
        #1057#1077#1085#1090#1103#1073#1088#1100
        #1054#1082#1090#1103#1073#1088#1100
        #1053#1086#1103#1073#1088#1100
        #1044#1077#1082#1072#1073#1088#1100)
    end
    object cbbToMonth: TComboBox
      Left = 355
      Top = 30
      Width = 75
      Height = 21
      Style = csDropDownList
      DropDownCount = 12
      ItemIndex = 1
      TabOrder = 5
      Text = #1060#1077#1074#1088#1072#1083#1100
      OnChange = cbbFromMonthChange
      Items.Strings = (
        #1071#1085#1074#1072#1088#1100
        #1060#1077#1074#1088#1072#1083#1100
        #1052#1072#1088#1090
        #1040#1087#1088#1077#1083#1100
        #1052#1072#1081
        #1048#1102#1085#1100
        #1048#1102#1083#1100
        #1040#1074#1075#1091#1089#1090
        #1057#1077#1085#1090#1103#1073#1088#1100
        #1054#1082#1090#1103#1073#1088#1100
        #1053#1086#1103#1073#1088#1100
        #1044#1077#1082#1072#1073#1088#1100)
    end
    object seFromYear: TSpinEdit
      Left = 282
      Top = 30
      Width = 49
      Height = 22
      MaxValue = 2100
      MinValue = 1900
      TabOrder = 4
      Value = 2014
      OnChange = cbbFromMonthChange
    end
    object seToYear: TSpinEdit
      Left = 433
      Top = 30
      Width = 49
      Height = 22
      MaxValue = 2100
      MinValue = 1900
      TabOrder = 6
      Value = 2014
      OnChange = cbbFromMonthChange
    end
    object dblkcbbNAME: TDBLookupComboBox
      Left = 53
      Top = 5
      Width = 508
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      KeyField = 'OBJ_ID'
      ListField = 'NAME'
      ListSource = dsObject
      TabOrder = 0
    end
    object chkOHROPRPP: TCheckBox
      Left = 567
      Top = 7
      Width = 226
      Height = 17
      Anchors = [akTop, akRight]
      Caption = #1042#1082#1083#1102#1095#1080#1090#1100' '#1089#1090#1086#1080#1084'. '#1054#1061#1056#1080#1054#1055#1056' '#1080' '#1087#1083#1072#1085'. '#1087#1088#1080#1073'.'
      TabOrder = 1
      OnClick = cbbFromMonthChange
    end
    object chkZimUdor: TCheckBox
      Left = 799
      Top = 7
      Width = 162
      Height = 17
      Anchors = [akTop, akRight]
      Caption = #1042#1082#1083#1102#1095#1080#1090#1100' '#1089#1090#1086#1080#1084'. '#1079#1080#1084'. '#1091#1076#1086#1088'.'
      TabOrder = 2
      OnClick = cbbFromMonthChange
    end
    object rbSM: TRadioButton
      Left = 884
      Top = 31
      Width = 74
      Height = 19
      Anchors = [akTop, akRight]
      Caption = #1087#1086' '#1089#1084#1077#1090#1072#1084
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 8
      OnClick = rbRatesClick
    end
  end
  object qrTreeData: TFDQuery
    MasterSource = dsObject
    MasterFields = 'OBJ_ID'
    Connection = DM.Connect
    Transaction = DM.Read
    UpdateTransaction = DM.Write
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    SQL.Strings = (
      
        'SELECT SM_ID, SM_TYPE, OBJ_ID, CONCAT(SM_NUMBER, " ",  NAME) as ' +
        'NAME, DATE,'
      '       (PARENT_ID) as PARENT  '
      'FROM smetasourcedata'
      'WHERE ACT=0 AND '
      '      OBJ_ID=:OBJ_ID AND'
      '      DELETED = 0'
      'ORDER BY NAME')
    Left = 25
    Top = 64
    ParamData = <
      item
        Name = 'OBJ_ID'
        DataType = ftInteger
        ParamType = ptInput
        Size = 10
        Value = Null
      end>
  end
  object dsTreeData: TDataSource
    DataSet = qrTreeData
    Left = 56
    Top = 64
  end
  object qrData: TFDQuery
    Connection = DM.Connect
    Transaction = DM.Read
    UpdateTransaction = DM.Write
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    FormatOptions.AssignedValues = [fvMapRules, fvDefaultParamDataType, fvFmtDisplayNumeric]
    FormatOptions.OwnMapRules = True
    FormatOptions.MapRules = <
      item
        SourceDataType = dtMemo
        TargetDataType = dtAnsiString
      end
      item
        SourceDataType = dtByteString
        TargetDataType = dtAnsiString
      end>
    FormatOptions.DefaultParamDataType = ftBCD
    FormatOptions.FmtDisplayNumeric = '### ### ### ### ### ### ##0.######'
    UpdateOptions.AssignedValues = [uvUpdateChngFields, uvCheckReadOnly, uvCheckUpdatable]
    UpdateOptions.UpdateChangedFields = False
    UpdateOptions.CheckReadOnly = False
    UpdateOptions.CheckUpdatable = False
    SQL.Strings = (
      'SELECT '
      
        'CONCAT(IF(((sm.`SM_ID` = :SM_ID) OR (sm.`PARENT_ID` = :SM_ID)), ' +
        #39#39', :SM_ID), sm.`PARENT_ID`, sm.`SM_ID`, d.`ID`) as SORT_ID,'
      'CASE d.`ID_TYPE_DATA` '
      '  WHEN 1 THEN cr.`RATE_CODE`'
      '  WHEN 2 THEN mat.`MAT_CODE`'
      '  WHEN 3 THEN mech.`MECH_CODE`'
      '  WHEN 4 THEN dev.`DEVICE_CODE`'
      '  WHEN 5 THEN dmp.`DUMP_CODE_JUST`'
      '  WHEN 6 THEN tr.`TRANSP_CODE_JUST`'
      '  WHEN 7 THEN tr.`TRANSP_CODE_JUST`'
      '  WHEN 8 THEN tr.`TRANSP_CODE_JUST`'
      '  WHEN 9 THEN tr.`TRANSP_CODE_JUST`'
      '  WHEN 10 THEN ('#39#1045#1058'18'#39')'
      '  WHEN 11 THEN ('#39#1045#1058'20'#39')'
      'END AS OBJ_CODE, '
      'CASE d.`ID_TYPE_DATA` '
      '  WHEN 1 THEN cr.`RATE_CAPTION`'
      '  WHEN 2 THEN mat.`MAT_NAME`'
      '  WHEN 3 THEN mech.`MECH_NAME`'
      '  WHEN 4 THEN dev.`DEVICE_NAME`'
      '  WHEN 5 THEN dmp.`DUMP_NAME`'
      '  WHEN 6 THEN tr.`TRANSP_JUST`'
      '  WHEN 7 THEN tr.`TRANSP_JUST`'
      '  WHEN 8 THEN tr.`TRANSP_JUST`'
      '  WHEN 9 THEN tr.`TRANSP_JUST`'
      '  WHEN 10 THEN ('#39#1045#1058'18'#39')'
      '  WHEN 11 THEN ('#39#1045#1058'20'#39')'
      'END AS OBJ_NAME, '
      'IF(:BY_COUNT=1,'
      'CASE d.`ID_TYPE_DATA` '
      '  WHEN 1 THEN cr.`RATE_COUNT`'
      '  WHEN 2 THEN mat.`MAT_COUNT`'
      '  WHEN 3 THEN mech.`MECH_COUNT`'
      '  WHEN 4 THEN dev.`DEVICE_COUNT`'
      '  WHEN 5 THEN dmp.`DUMP_COUNT`'
      '  WHEN 6 THEN tr.`TRANSP_COUNT`'
      '  WHEN 7 THEN tr.`TRANSP_COUNT`'
      '  WHEN 8 THEN tr.`TRANSP_COUNT`'
      '  WHEN 9 THEN tr.`TRANSP_COUNT`'
      '  WHEN 10 THEN d.`E1820_COUNT`'
      '  WHEN 11 THEN d.`E1820_COUNT`'
      
        'END, ROUND(IF(:FL_INCL_OHROPR_PLPR=1, d.`ST_OHROPR`, d.`STOIM`)+' +
        'IF(:FL_INCL_WINTER=1, (d.`ZIM_UDOR` + d.`ZP_ZIM_UDOR`) * sm.`APP' +
        'LY_WINTERPRISE_FLAG`, 0.0))) AS OBJ_COUNT,'
      'IF(:BY_COUNT=1,'
      'CASE d.`ID_TYPE_DATA`'
      
        '  WHEN 1 THEN (SELECT SUM(`card_rate_act`.`RATE_COUNT`) FROM `ca' +
        'rd_rate_act`, `data_act` WHERE `card_rate_act`.`ID`=`data_act`.`' +
        'ID_TABLES` AND `data_act`.`ID_TYPE_DATA`=d.`ID_TYPE_DATA` AND `d' +
        'ata_act`.`ID_TABLES`=d.`ID_TABLES` AND `data_act`.`ID_ESTIMATE`=' +
        'd.`ID_ESTIMATE`)'
      
        '  WHEN 2 THEN (SELECT SUM(`materialcard_act`.`MAT_COUNT`) FROM `' +
        'materialcard_act`, `data_act` WHERE `materialcard_act`.`ID`=`dat' +
        'a_act`.`ID_TABLES` AND `data_act`.`ID_TYPE_DATA`=d.`ID_TYPE_DATA' +
        '` AND `data_act`.`ID_TABLES`=d.`ID_TABLES` AND `data_act`.`ID_ES' +
        'TIMATE`=d.`ID_ESTIMATE`)'
      
        '  WHEN 3 THEN (SELECT SUM(`mechanizmcard_act`.`MECH_COUNT`) FROM' +
        ' `mechanizmcard_act`, `data_act` WHERE `mechanizmcard_act`.`ID`=' +
        '`data_act`.`ID_TABLES` AND `data_act`.`ID_TYPE_DATA`=d.`ID_TYPE_' +
        'DATA` AND `data_act`.`ID_TABLES`=d.`ID_TABLES` AND `data_act`.`I' +
        'D_ESTIMATE`=d.`ID_ESTIMATE`)'
      
        '  WHEN 4 THEN (SELECT SUM(`devicescard_act`.`DEVICE_COUNT`) FROM' +
        ' `devicescard_act`, `data_act` WHERE `devicescard_act`.`ID`=`dat' +
        'a_act`.`ID_TABLES` AND `data_act`.`ID_TYPE_DATA`=d.`ID_TYPE_DATA' +
        '` AND `data_act`.`ID_TABLES`=d.`ID_TABLES` AND `data_act`.`ID_ES' +
        'TIMATE`=d.`ID_ESTIMATE`)'
      
        '  WHEN 5 THEN (SELECT SUM(`dumpcard_act`.`DUMP_COUNT`) FROM `dum' +
        'pcard_act`, `data_act` WHERE `dumpcard_act`.`ID`=`data_act`.`ID_' +
        'TABLES` AND `data_act`.`ID_TYPE_DATA`=d.`ID_TYPE_DATA` AND `data' +
        '_act`.`ID_TABLES`=d.`ID_TABLES` AND `data_act`.`ID_ESTIMATE`=d.`' +
        'ID_ESTIMATE`)'
      
        '  WHEN 6 THEN (SELECT SUM(`transpcard_act`.`TRANSP_COUNT`) FROM ' +
        '`transpcard_act`, `data_act` WHERE `transpcard_act`.`ID`=`data_a' +
        'ct`.`ID_TABLES` AND `data_act`.`ID_TYPE_DATA`=d.`ID_TYPE_DATA` A' +
        'ND `data_act`.`ID_TABLES`=d.`ID_TABLES` AND `data_act`.`ID_ESTIM' +
        'ATE`=d.`ID_ESTIMATE`)'
      
        '  WHEN 7 THEN (SELECT SUM(`transpcard_act`.`TRANSP_COUNT`) FROM ' +
        '`transpcard_act`, `data_act` WHERE `transpcard_act`.`ID`=`data_a' +
        'ct`.`ID_TABLES` AND `data_act`.`ID_TYPE_DATA`=d.`ID_TYPE_DATA` A' +
        'ND `data_act`.`ID_TABLES`=d.`ID_TABLES` AND `data_act`.`ID_ESTIM' +
        'ATE`=d.`ID_ESTIMATE`)'
      
        '  WHEN 8 THEN (SELECT SUM(`transpcard_act`.`TRANSP_COUNT`) FROM ' +
        '`transpcard_act`, `data_act` WHERE `transpcard_act`.`ID`=`data_a' +
        'ct`.`ID_TABLES` AND `data_act`.`ID_TYPE_DATA`=d.`ID_TYPE_DATA` A' +
        'ND `data_act`.`ID_TABLES`=d.`ID_TABLES` AND `data_act`.`ID_ESTIM' +
        'ATE`=d.`ID_ESTIMATE`)'
      
        '  WHEN 9 THEN (SELECT SUM(`transpcard_act`.`TRANSP_COUNT`) FROM ' +
        '`transpcard_act`, `data_act` WHERE `transpcard_act`.`ID`=`data_a' +
        'ct`.`ID_TABLES` AND `data_act`.`ID_TYPE_DATA`=d.`ID_TYPE_DATA` A' +
        'ND `data_act`.`ID_TABLES`=d.`ID_TABLES` AND `data_act`.`ID_ESTIM' +
        'ATE`=d.`ID_ESTIMATE`)'
      
        '  WHEN 10 THEN (SELECT SUM(`data_act`.`E1820_COUNT`) FROM `data_' +
        'act` WHERE `data_act`.`ID_TYPE_DATA`=d.`ID_TYPE_DATA` AND `data_' +
        'act`.`ID_TABLES`=d.`ID_TABLES` AND `data_act`.`ID_ESTIMATE`=d.`I' +
        'D_ESTIMATE`)'
      
        '  WHEN 11 THEN (SELECT SUM(`data_act`.`E1820_COUNT`) FROM `data_' +
        'act` WHERE `data_act`.`ID_TYPE_DATA`=d.`ID_TYPE_DATA` AND `data_' +
        'act`.`ID_TABLES`=d.`ID_TABLES` AND `data_act`.`ID_ESTIMATE`=d.`I' +
        'D_ESTIMATE`)'
      
        'END, ROUND((SELECT SUM(IF(:FL_INCL_OHROPR_PLPR=1, `data_act`.`ST' +
        '_OHROPR`, `data_act`.`STOIM`)+IF(:FL_INCL_WINTER=1, (`data_act`.' +
        '`ZIM_UDOR` + `data_act`.`ZP_ZIM_UDOR`) * sm.`APPLY_WINTERPRISE_F' +
        'LAG`, 0.0)) FROM `data_act` WHERE d.`ID_TABLES`=`data_act`.`ID_T' +
        'ABLES` AND d.`ID_TYPE_DATA`=`data_act`.`ID_TYPE_DATA` AND d.`ID_' +
        'ESTIMATE`=`data_act`.`ID_ESTIMATE`))) AS OBJ_COUNT_DONE,'
      'CASE d.`ID_TYPE_DATA` '
      '  WHEN 1 THEN cr.`RATE_UNIT`'
      '  WHEN 2 THEN mat.`MAT_UNIT`'
      '  WHEN 3 THEN mech.`MECH_UNIT`'
      '  WHEN 4 THEN dev.`DEVICE_UNIT`'
      '  WHEN 5 THEN dmp.`DUMP_UNIT`'
      '  WHEN 6 THEN tr.`CARG_UNIT`'
      '  WHEN 7 THEN tr.`CARG_UNIT`'
      '  WHEN 8 THEN tr.`CARG_UNIT`'
      '  WHEN 9 THEN tr.`CARG_UNIT`'
      '  WHEN 10 THEN ('#39#1096#1090'.'#39')'
      '  WHEN 11 THEN ('#39#1096#1090'.'#39')'
      'END AS OBJ_UNIT, '
      'd.`ID_TYPE_DATA` as ID_TYPE_DATA,'
      'd.`ID` as DATA_ESTIMATE_OR_ACT_ID,'
      'd.`ID_TABLES` AS ID_TABLES,'
      'sm.`SM_ID`'
      'FROM `smetasourcedata` sm, `data_estimate` d'
      
        'LEFT JOIN `card_rate` cr ON d.`ID_TYPE_DATA` = 1 AND cr.`ID` = d' +
        '.`ID_TABLES`'
      
        'LEFT JOIN `materialcard` mat ON d.`ID_TYPE_DATA` = 2 AND mat.`ID' +
        '` = d.`ID_TABLES`'
      
        'LEFT JOIN `mechanizmcard` mech ON d.`ID_TYPE_DATA` = 3 AND mech.' +
        '`ID` = d.`ID_TABLES`'
      
        'LEFT JOIN `devicescard` dev ON d.`ID_TYPE_DATA` = 4 AND dev.`ID`' +
        ' = d.`ID_TABLES`'
      
        'LEFT JOIN `dumpcard` dmp ON d.`ID_TYPE_DATA` = 5 AND dmp.`ID` = ' +
        'd.`ID_TABLES`'
      
        'LEFT JOIN `transpcard` tr ON d.`ID_TYPE_DATA` IN (6,7,8,9) AND t' +
        'r.`ID` = d.`ID_TABLES`'
      'WHERE sm.`SM_ID`=d.`ID_ESTIMATE` AND'
      '      ((sm.`SM_ID` = :SM_ID) OR '
      '       (sm.`PARENT_ID` = :SM_ID) OR'
      '       (sm.`PARENT_ID` IN '
      '        (SELECT `smetasourcedata`.`SM_ID` '
      '         FROM `smetasourcedata` '
      '         WHERE `smetasourcedata`.`PARENT_ID` = :SM_ID)))'
      'UNION ALL'
      '/* '#1042#1099#1074#1086#1076#1080#1084' '#1079#1072#1084#1077#1085#1103#1102#1097#1080#1077' '#1084#1072#1090#1077#1088#1080#1072#1083#1099' */'
      'SELECT '
      
        'CONCAT(IF(((sm.`SM_ID` = :SM_ID) OR (sm.`PARENT_ID` = :SM_ID)), ' +
        #39#39', :SM_ID), sm.`PARENT_ID`, sm.`SM_ID`, d.`ID`, mat.`ID`) as SO' +
        'RT_ID,'
      'CONCAT('#39'   '#39', mat.`MAT_CODE`) AS OBJ_CODE, '
      'mat.`MAT_NAME` AS OBJ_NAME,'
      '/*'#1057#1090#1086#1080#1084#1086#1089#1090#1100' '#1076#1086#1089#1090#1072#1077#1090#1089#1103' '#1085#1077#1074#1077#1088#1085#1086'*/'
      
        'IF(:BY_COUNT=1, mat.`MAT_COUNT`, ROUND(IF(:FL_INCL_OHROPR_PLPR=1' +
        ', d.`ST_OHROPR`, d.`STOIM`)+IF(:FL_INCL_WINTER=1, (d.`ZIM_UDOR` ' +
        '+ d.`ZP_ZIM_UDOR`) * sm.`APPLY_WINTERPRISE_FLAG`, 0.0))) AS OBJ_' +
        'COUNT, '
      'mat.`MAT_UNIT` AS OBJ_UNIT, '
      'd.`ID_TYPE_DATA` as ID_TYPE_DATA,'
      'd.`ID` as DATA_ESTIMATE_OR_ACT_ID,'
      'd.`ID_TABLES` AS ID_TABLES,'
      'sm.`SM_ID`'
      'FROM `smetasourcedata` sm, `data_estimate` d'
      'JOIN `card_rate` cr ON cr.`ID` = d.`ID_TABLES`'
      
        'JOIN `materialcard` mat ON cr.`ID` = d.`ID_TABLES` AND mat.`ID_C' +
        'ARD_RATE` = d.`ID_TABLES` AND mat.`ID_REPLACED` > 0'
      'WHERE sm.`SM_ID`=d.`ID_ESTIMATE` AND'
      '      d.`ID_TYPE_DATA` = 1 AND'
      '      ((sm.`SM_ID` = :SM_ID) OR '
      '       (sm.`PARENT_ID` = :SM_ID) OR'
      '       (sm.`PARENT_ID` IN '
      '        (SELECT `smetasourcedata`.`SM_ID` '
      '         FROM `smetasourcedata` '
      '         WHERE `smetasourcedata`.`PARENT_ID` = :SM_ID)))'
      'UNION ALL'
      '/* '#1047#1072#1075#1086#1083#1086#1074#1082#1080' '#1088#1072#1079#1076#1077#1083#1086#1074' */'
      'select CONCAT('
      
        'IF(((sm.`SM_ID` = :SM_ID) OR (sm.`PARENT_ID` = :SM_ID)), '#39#39', :SM' +
        '_ID), sm.`PARENT_ID`, sm.`SM_ID`) as SORT_ID,'
      
        'CONCAT(sm.`SM_NUMBER`, '#39' '#39', sm.`NAME`) AS OBJ_CODE, NULL AS OBJ_' +
        'NAME, '
      
        'IF(:BY_COUNT=1, NULL, ROUND(IF(:FL_INCL_OHROPR_PLPR=1, sm.`S_ST_' +
        'OHROPR`, sm.`S_STOIM`)+IF(:FL_INCL_WINTER=1, (sm.`S_ZIM_UDOR` + ' +
        'sm.`S_ZP_ZIM_UDOR`) * sm.`APPLY_WINTERPRISE_FLAG`, 0.0))) AS OBJ' +
        '_COUNT, '
      'NULL AS OBJ_UNIT,(sm.`SM_TYPE` * -1) as ID_TYPE_DATA,'
      'NULL AS DATA_ESTIMATE_OR_ACT_ID, NULL AS ID_TABLES, sm.`SM_ID`'
      'FROM `smetasourcedata` sm'
      'WHERE ((sm.`PARENT_ID` = :SM_ID) OR'
      '       (sm.`PARENT_ID` IN '
      '        (SELECT `smetasourcedata`.`SM_ID` '
      '         FROM `smetasourcedata` '
      '         WHERE `smetasourcedata`.`PARENT_ID` = :SM_ID)))'
      'ORDER BY SORT_ID')
    Left = 24
    Top = 184
    ParamData = <
      item
        Name = 'SM_ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = 344
      end
      item
        Name = 'BY_COUNT'
        DataType = ftInteger
        ParamType = ptInput
        Value = 1
      end
      item
        Name = 'FL_INCL_OHROPR_PLPR'
        DataType = ftInteger
        ParamType = ptInput
        Value = 1
      end
      item
        Name = 'FL_INCL_WINTER'
        DataType = ftInteger
        ParamType = ptInput
        Value = 1
      end>
  end
  object dsData: TDataSource
    DataSet = qrData
    Left = 56
    Top = 184
  end
  object qrDetail: TFDQuery
    OnCalcFields = qrDetailCalcFields
    MasterSource = dsData
    MasterFields = 'ID_TABLES;ID_TYPE_DATA'
    Connection = DM.Connect
    Transaction = DM.Read
    UpdateTransaction = DM.Write
    FormatOptions.AssignedValues = [fvMapRules, fvDefaultParamDataType]
    FormatOptions.OwnMapRules = True
    FormatOptions.MapRules = <
      item
        SourceDataType = dtMemo
        TargetDataType = dtAnsiString
      end>
    FormatOptions.DefaultParamDataType = ftBCD
    SQL.Strings = (
      'SELECT TRIM(sm.`NAME`) as docname, '
      
        '       (SELECT DATE FROM smetasourcedata WHERE SM_ID=(SELECT PAR' +
        'ENT_ID FROM smetasourcedata WHERE SM_ID=sm.PARENT_ID)) AS MONTHY' +
        'EAR,'
      '       CASE d.`ID_TYPE_DATA` '
      '          WHEN 1 THEN cr.`RATE_CODE` '
      '          WHEN 2 THEN mat.`MAT_CODE`'
      '          WHEN 3 THEN mech.`MECH_CODE`'
      '          WHEN 4 THEN dev.`DEVICE_CODE`'
      '          WHEN 5 THEN dmp.`DUMP_CODE_JUST`'
      '          WHEN 6 THEN tr.`TRANSP_CODE_JUST`'
      '          WHEN 7 THEN tr.`TRANSP_CODE_JUST`'
      '          WHEN 8 THEN tr.`TRANSP_CODE_JUST`'
      '          WHEN 9 THEN tr.`TRANSP_CODE_JUST`'
      '          WHEN 10 THEN ('#39#1045#1058'18'#39')'
      '          WHEN 11 THEN ('#39#1045#1058'20'#39')'
      '          END AS osnov,'
      '        CASE d.`ID_TYPE_DATA` '
      '          WHEN 1 THEN cr.RATE_COUNT '
      '          WHEN 2 THEN mat.MAT_COUNT'
      '          WHEN 3 THEN mech.MECH_COUNT'
      '          WHEN 4 THEN dev.DEVICE_COUNT'
      '          WHEN 5 THEN dmp.DUMP_COUNT'
      '          WHEN 6 THEN tr.TRANSP_COUNT'
      '          WHEN 7 THEN tr.TRANSP_COUNT'
      '          WHEN 8 THEN tr.TRANSP_COUNT'
      '          WHEN 9 THEN tr.TRANSP_COUNT'
      '          WHEN 10 THEN d.E1820_COUNT'
      '          WHEN 11 THEN d.E1820_COUNT'
      '        END AS cnt'
      'FROM `smetasourcedata` sm, `data_row` d'
      
        '  LEFT JOIN `card_rate` cr ON d.`ID_TYPE_DATA` = 1 AND cr.`ID` =' +
        ' d.`ID_TABLES` AND cr.DATA_ROW_ID=d.ID'
      
        '  LEFT JOIN `materialcard` mat ON d.`ID_TYPE_DATA` = 2 AND mat.`' +
        'ID` = d.`ID_TABLES` AND mat.DATA_ROW_ID=d.ID'
      
        '  LEFT JOIN `mechanizmcard` mech ON d.`ID_TYPE_DATA` = 3 AND mec' +
        'h.`ID` = d.`ID_TABLES` AND mech.DATA_ROW_ID=d.ID'
      
        '  LEFT JOIN `devicescard` dev ON d.`ID_TYPE_DATA` = 4 AND dev.`I' +
        'D` = d.`ID_TABLES` AND dev.DATA_ROW_ID=d.ID'
      
        '  LEFT JOIN `dumpcard` dmp ON d.`ID_TYPE_DATA` = 5 AND dmp.`ID` ' +
        '= d.`ID_TABLES` AND dmp.DATA_ROW_ID=d.ID'
      
        '  LEFT JOIN `transpcard` tr ON d.`ID_TYPE_DATA` IN (6,7,8,9) AND' +
        ' tr.`ID` = d.`ID_TABLES` AND tr.DATA_ROW_ID=d.ID'
      'WHERE sm.`DELETED` = 0 AND'
      '      sm.`FL_USE` = 1 AND'
      '      sm.`ACT` = 1 AND'
      '      sm.`SM_ID` = d.`SM_ID` AND'
      '      d.`ID_TABLES` = :ID_TABLES AND '
      '      d.`ID_TYPE_DATA` = :ID_TYPE_DATA')
    Left = 25
    Top = 336
    ParamData = <
      item
        Name = 'ID_TABLES'
        DataType = ftInteger
        ParamType = ptInput
        Value = 0
      end
      item
        Name = 'ID_TYPE_DATA'
        DataType = ftInteger
        ParamType = ptInput
        Value = 0
      end>
    object qrDetaildocname: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'docname'
      Origin = 'docname'
      ProviderFlags = []
      ReadOnly = True
      Size = 32767
    end
    object qrDetailosnov: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'osnov'
      Origin = 'osnov'
      ProviderFlags = []
      ReadOnly = True
    end
    object qrDetailcnt: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'cnt'
      Origin = 'cnt'
      ProviderFlags = []
      ReadOnly = True
      Precision = 10
      Size = 5
    end
    object qrDetailNumber: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'Number'
      Calculated = True
    end
    object qrDetailMONTHYEAR: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'MONTHYEAR'
      Origin = 'MONTHYEAR'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = 'mmmm yyyy'
    end
  end
  object dsDetail: TDataSource
    DataSet = qrDetail
    Left = 56
    Top = 336
  end
  object qrObject: TFDQuery
    AfterScroll = qrObjectAfterScroll
    Connection = DM.Connect
    Transaction = DM.Read
    UpdateTransaction = DM.Write
    SQL.Strings = (
      'SELECT OBJ_ID, FULL_NAME as NAME, BEG_STROJ as DATE'
      'FROM objcards '
      'WHERE DEL_FLAG=0'
      'ORDER BY NAME')
    Left = 25
  end
  object dsObject: TDataSource
    DataSet = qrObject
    Left = 56
    Top = 1
  end
  object qrPTM: TFDQuery
    Connection = DM.Connect
    Transaction = DM.Read
    UpdateTransaction = DM.Write
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    FormatOptions.AssignedValues = [fvMapRules, fvDefaultParamDataType, fvFmtDisplayNumeric]
    FormatOptions.OwnMapRules = True
    FormatOptions.MapRules = <
      item
        SourceDataType = dtByteString
        TargetDataType = dtAnsiString
      end>
    FormatOptions.DefaultParamDataType = ftBCD
    FormatOptions.FmtDisplayNumeric = '### ### ### ### ### ### ###'
    Left = 201
    Top = 136
  end
  object dsPTM: TDataSource
    DataSet = qrPTM
    Left = 232
    Top = 136
  end
  object qrEstimate: TFDQuery
    Connection = DM.Connect
    Transaction = DM.Read
    UpdateTransaction = DM.Write
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    FormatOptions.AssignedValues = [fvMapRules, fvDefaultParamDataType, fvFmtDisplayNumeric]
    FormatOptions.OwnMapRules = True
    FormatOptions.MapRules = <
      item
        SourceDataType = dtByteString
        TargetDataType = dtAnsiString
      end>
    FormatOptions.DefaultParamDataType = ftBCD
    FormatOptions.FmtDisplayNumeric = '### ### ### ### ### ### ###'
    Left = 289
    Top = 136
  end
  object dsEstimate: TDataSource
    DataSet = qrEstimate
    Left = 320
    Top = 136
  end
end
