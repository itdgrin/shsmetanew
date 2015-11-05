object fKC6: TfKC6
  Left = 0
  Top = 0
  ActiveControl = grData
  BorderIcons = [biSystemMenu]
  Caption = #1046#1091#1088#1085#1072#1083' 6-'#1050#1057
  ClientHeight = 428
  ClientWidth = 564
  Color = clBtnFace
  DoubleBuffered = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object ImageSplitterTop: TImage
    Left = 320
    Top = 114
    Width = 15
    Height = 5
    Cursor = crVSplit
  end
  object splTop: TSplitter
    Left = 0
    Top = 125
    Width = 564
    Height = 5
    Cursor = crVSplit
    Align = alTop
    ResizeStyle = rsUpdate
    ExplicitTop = 33
    ExplicitWidth = 659
  end
  object PanelBottomButton: TPanel
    Left = 0
    Top = 387
    Width = 564
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    Caption = 'Panel3'
    ShowCaption = False
    TabOrder = 3
    DesignSize = (
      564
      41)
    object Button1: TButton
      Left = 350
      Top = 8
      Width = 100
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = #1055#1077#1088#1077#1085#1077#1089#1090#1080
      Default = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = Button1Click
    end
    object ButtonCancel: TButton
      Left = 456
      Top = 8
      Width = 100
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = #1054#1090#1084#1077#1085#1072
      TabOrder = 1
      OnClick = ButtonCancelClick
    end
  end
  object PanelObject: TPanel
    Left = 0
    Top = 0
    Width = 564
    Height = 25
    Align = alTop
    BevelOuter = bvNone
    ParentBackground = False
    ShowCaption = False
    TabOrder = 0
    TabStop = True
    DesignSize = (
      564
      25)
    object LabelObject: TLabel
      Left = 8
      Top = 6
      Width = 43
      Height = 13
      Caption = #1054#1073#1098#1077#1082#1090':'
    end
    object EditObject: TEdit
      Left = 57
      Top = 2
      Width = 504
      Height = 21
      TabStop = False
      Anchors = [akLeft, akTop, akRight]
      Color = 14802912
      ReadOnly = True
      TabOrder = 0
    end
  end
  object PanelTree: TPanel
    Left = 0
    Top = 25
    Width = 564
    Height = 100
    Align = alTop
    BevelOuter = bvNone
    Caption = 'PanelTree'
    ShowCaption = False
    TabOrder = 1
    object tvEstimates: TJvDBTreeView
      Left = 0
      Top = 0
      Width = 564
      Height = 100
      DataSource = dsTreeData
      MasterField = 'SM_ID'
      DetailField = 'PARENT'
      ItemField = 'NAME'
      StartMasterValue = '0'
      UseFilter = True
      PersistentNode = True
      ReadOnly = True
      DragMode = dmAutomatic
      HideSelection = False
      Indent = 19
      OnChange = tvEstimatesChange
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TabOrder = 0
      ParentFont = False
      RowSelect = True
      OnCustomDrawItem = tvEstimatesCustomDrawItem
      Mirror = False
    end
  end
  object PanelClient: TPanel
    Left = 0
    Top = 130
    Width = 564
    Height = 257
    Align = alClient
    BevelOuter = bvNone
    Caption = 'PanelClient'
    ShowCaption = False
    TabOrder = 2
    object ImageSplitterBottom: TImage
      Left = 312
      Top = 106
      Width = 15
      Height = 5
      Cursor = crVSplit
    end
    object splBottom: TSplitter
      Left = 0
      Top = 96
      Width = 564
      Height = 5
      Cursor = crVSplit
      Align = alBottom
      ResizeStyle = rsUpdate
      ExplicitTop = 97
      ExplicitWidth = 661
    end
    object PanelKoef: TPanel
      Left = 0
      Top = 0
      Width = 564
      Height = 25
      Align = alTop
      BevelOuter = bvNone
      Caption = 'PanelKoef'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ShowCaption = False
      TabOrder = 0
      DesignSize = (
        564
        25)
      object LabelKoef: TLabel
        Left = 305
        Top = 6
        Width = 115
        Height = 13
        Anchors = [akTop, akRight]
        Caption = #1055#1088#1086#1094#1077#1085#1090' '#1087#1077#1088#1077#1088#1072#1089#1095#1105#1090#1072':'
      end
      object Label1: TLabel
        Left = 496
        Top = 4
        Width = 60
        Height = 16
        Cursor = crHandPoint
        Anchors = [akTop, akRight]
        Caption = #1057#1073#1088#1086#1089#1080#1090#1100
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clHotLight
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
        OnClick = Label1Click
      end
      object EditKoef: TSpinEdit
        Left = 426
        Top = 1
        Width = 64
        Height = 22
        Anchors = [akTop, akRight]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxValue = 100
        MinValue = 0
        ParentFont = False
        TabOrder = 0
        Value = 0
        OnChange = EditKoefChange
      end
      object chkCopyTreeEstimates: TCheckBox
        Left = 8
        Top = 2
        Width = 145
        Height = 17
        Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100' '#1089#1090#1088#1091#1082#1090#1091#1088#1091
        TabOrder = 1
      end
    end
    object PanelBottom: TPanel
      Left = 0
      Top = 133
      Width = 564
      Height = 124
      Align = alBottom
      BevelOuter = bvNone
      Caption = 'PanelBottom'
      ShowCaption = False
      TabOrder = 3
      object dbgrd1: TJvDBGrid
        Left = 0
        Top = 0
        Width = 564
        Height = 124
        Align = alClient
        DataSource = dsOtherActs
        DrawingStyle = gdsClassic
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        ParentFont = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDrawColumnCell = dbgrd1DrawColumnCell
        IniStorage = FormStorage
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
            FieldName = 'date'
            Title.Alignment = taCenter
            Title.Caption = #1052#1077#1089#1103#1094
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Number'
            Title.Alignment = taCenter
            Title.Caption = #8470' '#1087#1087
            Width = 121
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'osnov'
            Title.Alignment = taCenter
            Title.Caption = #1054#1073#1086#1089#1085#1086#1074#1072#1085#1080#1077
            Width = 122
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'cnt'
            Title.Alignment = taCenter
            Title.Caption = #1050#1086#1083'-'#1074#1086
            Width = 85
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'docname'
            Title.Alignment = taCenter
            Title.Caption = #1044#1086#1082#1091#1084#1077#1085#1090
            Width = 119
            Visible = True
          end>
      end
    end
    object grData: TJvDBGrid
      Left = 0
      Top = 25
      Width = 564
      Height = 71
      Align = alClient
      DataSource = dsData
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgTitleClick, dgTitleHotTrack]
      ParentFont = False
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnCellClick = grDataCellClick
      OnDrawColumnCell = grDataDrawColumnCell
      OnKeyDown = grDataKeyDown
      OnKeyPress = grDataKeyPress
      OnMouseDown = grDataMouseDown
      AutoAppend = False
      IniStorage = FormStorage
      AutoSizeColumns = True
      SelectColumnsDialogStrings.Caption = 'Select columns'
      SelectColumnsDialogStrings.OK = '&OK'
      SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
      EditControls = <>
      RowsHeight = 17
      TitleRowHeight = 17
      OnCanEditCell = grDataCanEditCell
      Columns = <
        item
          Expanded = False
          FieldName = 'CHECKED'
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Caption = #1042' '#1072#1082#1090
          Width = 36
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ITERATOR'
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Caption = #8470' '#1087'/'#1087
          Width = 35
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'OBJ_CODE'
          Title.Alignment = taCenter
          Title.Caption = #1054#1073#1086#1089#1085#1086#1074#1072#1085#1080#1077
          Width = 130
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'OBJ_COUNT'
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Caption = #1050#1086#1083'-'#1074#1086
          Width = 56
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'OBJ_UNIT'
          Title.Alignment = taCenter
          Title.Caption = #1045#1076'. '#1080#1079#1084'.'
          Width = 62
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CntDONE'
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Caption = #1042#1099#1087#1086#1083#1085#1077#1085#1086
          Width = 68
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'OBJ_COUNT_IN'
          Title.Alignment = taCenter
          Title.Caption = #1055#1088#1086#1094#1077#1085#1090#1086#1074#1082#1072
          Width = 85
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'OBJ_COUNT_OUT'
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Caption = #1054#1089#1090#1072#1090#1086#1082
          Width = 68
          Visible = True
        end>
    end
    object dbmmoOBJ_NAME: TDBMemo
      Left = 0
      Top = 101
      Width = 564
      Height = 32
      Align = alBottom
      DataField = 'OBJ_NAME'
      DataSource = dsData
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 2
    end
  end
  object qrOtherActs: TFDQuery
    OnCalcFields = qrOtherActsCalcFields
    Connection = DM.Connect
    Transaction = DM.Read
    UpdateTransaction = DM.Write
    FormatOptions.AssignedValues = [fvMapRules, fvFmtDisplayDateTime, fvFmtDisplayDate, fvStrsTrim2Len]
    FormatOptions.OwnMapRules = True
    FormatOptions.MapRules = <
      item
        SourceDataType = dtMemo
        TargetDataType = dtAnsiString
      end>
    FormatOptions.StrsTrim2Len = True
    FormatOptions.FmtDisplayDateTime = 'mmyyyy'
    FormatOptions.FmtDisplayDate = 'mmyyyy'
    SQL.Strings = (
      'SELECT TRIM(sm.`NAME`) as docname, '
      
        '       (SELECT DATE FROM smetasourcedata WHERE SM_ID=(SELECT PAR' +
        'ENT_ID FROM smetasourcedata WHERE SM_ID=sm.PARENT_ID)) AS DATE,'
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
      
        '      sm.`SM_ID` NOT IN (SELECT SM_ID FROM `smetasourcedata` WHE' +
        'RE PARENT_ID IN (SELECT SM_ID FROM `smetasourcedata` WHERE `smet' +
        'asourcedata`.`PARENT_ID` = :ID_ACT))'
      '      AND d.`ID_TABLES` = :ID_TABLES'
      '      AND d.`ID_TYPE_DATA` = :ID_TYPE_DATA'
      '      AND sm.`OBJ_ID` = :ID_OBJECT')
    Left = 249
    Top = 312
    ParamData = <
      item
        Name = 'ID_ACT'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'ID_TABLES'
        ParamType = ptInput
      end
      item
        Name = 'ID_TYPE_DATA'
        ParamType = ptInput
      end
      item
        Name = 'ID_OBJECT'
        ParamType = ptInput
      end>
    object qrOtherActsNumber: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'Number'
      Calculated = True
    end
    object qrOtherActsdocname: TStringField
      FieldName = 'docname'
    end
    object qrOtherActsdate: TDateField
      FieldName = 'date'
      DisplayFormat = 'mmmm yyyy'
    end
    object qrOtherActsosnov: TStringField
      FieldName = 'osnov'
    end
    object qrOtherActscnt: TFMTBCDField
      FieldName = 'cnt'
    end
  end
  object dsOtherActs: TDataSource
    DataSet = qrOtherActs
    Left = 312
    Top = 311
  end
  object qrData: TFDQuery
    BeforeOpen = qrDataBeforeOpen
    AfterOpen = qrDataAfterOpen
    AfterScroll = qrDataAfterScroll
    OnCalcFields = qrDataCalcFields
    Connection = DM.Connect
    Transaction = DM.Read
    UpdateTransaction = DM.Write
    FormatOptions.AssignedValues = [fvMapRules, fvFmtDisplayDateTime, fvFmtDisplayDate, fvStrsTrim2Len]
    FormatOptions.OwnMapRules = True
    FormatOptions.MapRules = <
      item
        SourceDataType = dtMemo
        TargetDataType = dtAnsiString
      end
      item
        SourceDataType = dtInt64
        TargetDataType = dtInt32
      end
      item
        SourceDataType = dtUInt64
        TargetDataType = dtInt32
      end
      item
        SourceDataType = dtFmtBCD
        TargetDataType = dtDouble
      end>
    FormatOptions.StrsTrim2Len = True
    FormatOptions.FmtDisplayDateTime = 'mmyyyy'
    FormatOptions.FmtDisplayDate = 'mmyyyy'
    SQL.Strings = (
      'SELECT '
      
        '  CAST(CONCAT(FN_getSortSM(sm.`SM_ID`), IF(d.`ID_TYPE_DATA` IN (' +
        '10,11), d.`ID_TYPE_DATA`, '#39#39')) AS CHAR(255)) as SORT_ID,'
      
        '  CAST(CONCAT(FN_getSortSM(sm.`SM_ID`), d.`ID`) AS CHAR(255)) as' +
        ' SORT_ID2,'
      '  1 AS INCITERATOR,'
      '  0 AS ITERATOR,'
      '  d.`NUM_ROW`,'
      '  CASE d.`ID_TYPE_DATA` '
      '    WHEN 1 THEN cr.`RATE_CODE`'
      
        '    WHEN 2 THEN CONCAT(IF(mat.`ID_REPLACED` > 0, '#39'   '#39', '#39#39'), mat' +
        '.`MAT_CODE`)'
      '    WHEN 3 THEN mech.`MECH_CODE`'
      '    WHEN 4 THEN dev.`DEVICE_CODE`'
      '    WHEN 5 THEN dmp.`DUMP_CODE_JUST`'
      '    WHEN 6 THEN tr.`TRANSP_CODE_JUST`'
      '    WHEN 7 THEN tr.`TRANSP_CODE_JUST`'
      '    WHEN 8 THEN tr.`TRANSP_CODE_JUST`'
      '    WHEN 9 THEN tr.`TRANSP_CODE_JUST`'
      '    WHEN 10 THEN ('#39#1045#1058'18'#39')'
      '    WHEN 11 THEN ('#39#1045#1058'20'#39')'
      '  END AS OBJ_CODE, '
      '  CASE d.`ID_TYPE_DATA`'
      '    WHEN 1 THEN cr.`RATE_CAPTION`'
      '    WHEN 2 THEN mat.`MAT_NAME`'
      '    WHEN 3 THEN mech.`MECH_NAME`'
      '    WHEN 4 THEN dev.`DEVICE_NAME`'
      '    WHEN 5 THEN dmp.`DUMP_NAME`'
      '    WHEN 6 THEN tr.`TRANSP_JUST`'
      '    WHEN 7 THEN tr.`TRANSP_JUST`'
      '    WHEN 8 THEN tr.`TRANSP_JUST`'
      '    WHEN 9 THEN tr.`TRANSP_JUST`'
      '    WHEN 10 THEN ("")'
      '    WHEN 11 THEN ("")'
      '  END AS OBJ_NAME,  '
      '  CASE d.`ID_TYPE_DATA` '
      '    WHEN 1 THEN cr.`RATE_COUNT`'
      '    WHEN 2 THEN mat.`MAT_COUNT`'
      '    WHEN 3 THEN mech.`MECH_COUNT`'
      '    WHEN 4 THEN dev.`DEVICE_COUNT`'
      '    WHEN 5 THEN dmp.`DUMP_COUNT`'
      '    WHEN 6 THEN tr.`TRANSP_COUNT`'
      '    WHEN 7 THEN tr.`TRANSP_COUNT`'
      '    WHEN 8 THEN tr.`TRANSP_COUNT`'
      '    WHEN 9 THEN tr.`TRANSP_COUNT`'
      '    WHEN 10 THEN d.`E1820_COUNT`'
      '    WHEN 11 THEN d.`E1820_COUNT`'
      '  END AS OBJ_COUNT,'
      '  CASE d.`ID_TYPE_DATA` '
      '    WHEN 1 THEN cr.`RATE_UNIT`'
      '    WHEN 2 THEN mat.`MAT_UNIT`'
      '    WHEN 3 THEN mech.`MECH_UNIT`'
      '    WHEN 4 THEN dev.`DEVICE_UNIT`'
      '    WHEN 5 THEN dmp.`DUMP_UNIT`'
      '    WHEN 6 THEN tr.`CARG_UNIT`'
      '    WHEN 7 THEN tr.`CARG_UNIT`'
      '    WHEN 8 THEN tr.`CARG_UNIT`'
      '    WHEN 9 THEN tr.`CARG_UNIT`'
      '    WHEN 10 THEN ('#39#1096#1090'.'#39')'
      '    WHEN 11 THEN ('#39#1096#1090'.'#39')'
      '  END AS OBJ_UNIT, '
      '  d.`ID_TYPE_DATA` as ID_TYPE_DATA,'
      '  d.`ID` as DATA_ESTIMATE_OR_ACT_ID,'
      '  d.`ID_TABLES` AS ID_TABLES,'
      '  sm.`SM_ID`,'
      '  NULL AS ID_RATE,'
      '  CASE d.`ID_TYPE_DATA` '
      '    WHEN 2 THEN mat.`ID_REPLACED`'
      '    WHEN 3 THEN mech.`ID_REPLACED`'
      '    ELSE NULL'
      '  END AS ID_REPLACED,'
      '/* '#1042#1099#1087#1086#1083#1085#1077#1085#1086' */'
      '  CASE d.`ID_TYPE_DATA` '
      
        '    WHEN 1 THEN IFNULL((SELECT SUM(a.RATE_COUNT) FROM `card_rate' +
        '` a WHERE a.`ID`=cr.`ID` AND a.`SM_ID` NOT IN '
      
        '(SELECT SM_ID FROM `smetasourcedata` WHERE PARENT_ID IN (SELECT ' +
        'SM_ID FROM `smetasourcedata` WHERE `smetasourcedata`.`PARENT_ID`' +
        ' = :ID_ACT)) AND a.`SM_ID` <> sm.`SM_ID`'
      
        'AND a.SM_ID NOT IN (SELECT SM_ID FROM `smetasourcedata` WHERE OB' +
        'J_ID=:ID_OBJECT AND ACT=1 AND TYPE_ACT<>0)), 0) '
      
        '    WHEN 2 THEN IFNULL((SELECT SUM(a.MAT_COUNT) FROM `materialca' +
        'rd` a WHERE a.`ID`=mat.`ID` AND a.`SM_ID` NOT IN '
      
        '(SELECT SM_ID FROM `smetasourcedata` WHERE PARENT_ID IN (SELECT ' +
        'SM_ID FROM `smetasourcedata` WHERE `smetasourcedata`.`PARENT_ID`' +
        ' = :ID_ACT)) AND a.`SM_ID` <> sm.`SM_ID`'
      
        'AND a.SM_ID NOT IN (SELECT SM_ID FROM `smetasourcedata` WHERE OB' +
        'J_ID=:ID_OBJECT AND ACT=1 AND TYPE_ACT<>0)), 0)'
      
        '    WHEN 3 THEN IFNULL((SELECT SUM(a.MECH_COUNT) FROM `mechanizm' +
        'card` a WHERE a.`ID`=mech.`ID` AND a.`SM_ID` NOT IN '
      
        '(SELECT SM_ID FROM `smetasourcedata` WHERE PARENT_ID IN (SELECT ' +
        'SM_ID FROM `smetasourcedata` WHERE `smetasourcedata`.`PARENT_ID`' +
        ' = :ID_ACT)) AND a.`SM_ID` <> sm.`SM_ID`'
      
        'AND a.SM_ID NOT IN (SELECT SM_ID FROM `smetasourcedata` WHERE OB' +
        'J_ID=:ID_OBJECT AND ACT=1 AND TYPE_ACT<>0)), 0)'
      
        '    WHEN 4 THEN IFNULL((SELECT SUM(a.DEVICE_COUNT) FROM `devices' +
        'card` a WHERE a.`ID`=dev.`ID` AND a.`SM_ID` NOT IN '
      
        '(SELECT SM_ID FROM `smetasourcedata` WHERE PARENT_ID IN (SELECT ' +
        'SM_ID FROM `smetasourcedata` WHERE `smetasourcedata`.`PARENT_ID`' +
        ' = :ID_ACT)) AND a.`SM_ID` <> sm.`SM_ID`'
      
        'AND a.SM_ID NOT IN (SELECT SM_ID FROM `smetasourcedata` WHERE OB' +
        'J_ID=:ID_OBJECT AND ACT=1 AND TYPE_ACT<>0)), 0)'
      
        '    WHEN 5 THEN IFNULL((SELECT SUM(a.DUMP_COUNT) FROM `dumpcard`' +
        ' a WHERE a.`ID`=dmp.`ID` AND a.`SM_ID` NOT IN '
      
        '(SELECT SM_ID FROM `smetasourcedata` WHERE PARENT_ID IN (SELECT ' +
        'SM_ID FROM `smetasourcedata` WHERE `smetasourcedata`.`PARENT_ID`' +
        ' = :ID_ACT)) AND a.`SM_ID` <> sm.`SM_ID`'
      
        'AND a.SM_ID NOT IN (SELECT SM_ID FROM `smetasourcedata` WHERE OB' +
        'J_ID=:ID_OBJECT AND ACT=1 AND TYPE_ACT<>0)), 0)'
      
        '    WHEN 6 THEN IFNULL((SELECT SUM(a.TRANSP_COUNT) FROM `transpc' +
        'ard` a WHERE a.`ID`=tr.`ID` AND a.`SM_ID` NOT IN '
      
        '(SELECT SM_ID FROM `smetasourcedata` WHERE PARENT_ID IN (SELECT ' +
        'SM_ID FROM `smetasourcedata` WHERE `smetasourcedata`.`PARENT_ID`' +
        ' = :ID_ACT)) AND a.`SM_ID` <> sm.`SM_ID`'
      
        'AND a.SM_ID NOT IN (SELECT SM_ID FROM `smetasourcedata` WHERE OB' +
        'J_ID=:ID_OBJECT AND ACT=1 AND TYPE_ACT<>0)), 0)'
      
        '    WHEN 7 THEN IFNULL((SELECT SUM(a.TRANSP_COUNT) FROM `transpc' +
        'ard` a WHERE a.`ID`=tr.`ID` AND a.`SM_ID` NOT IN '
      
        '(SELECT SM_ID FROM `smetasourcedata` WHERE PARENT_ID IN (SELECT ' +
        'SM_ID FROM `smetasourcedata` WHERE `smetasourcedata`.`PARENT_ID`' +
        ' = :ID_ACT)) AND a.`SM_ID` <> sm.`SM_ID`'
      
        'AND a.SM_ID NOT IN (SELECT SM_ID FROM `smetasourcedata` WHERE OB' +
        'J_ID=:ID_OBJECT AND ACT=1 AND TYPE_ACT<>0)), 0)'
      
        '    WHEN 8 THEN IFNULL((SELECT SUM(a.TRANSP_COUNT) FROM `transpc' +
        'ard` a WHERE a.`ID`=tr.`ID` AND a.`SM_ID` NOT IN '
      
        '(SELECT SM_ID FROM `smetasourcedata` WHERE PARENT_ID IN (SELECT ' +
        'SM_ID FROM `smetasourcedata` WHERE `smetasourcedata`.`PARENT_ID`' +
        ' = :ID_ACT)) AND a.`SM_ID` <> sm.`SM_ID`'
      
        'AND a.SM_ID NOT IN (SELECT SM_ID FROM `smetasourcedata` WHERE OB' +
        'J_ID=:ID_OBJECT AND ACT=1 AND TYPE_ACT<>0)), 0)'
      
        '    WHEN 9 THEN IFNULL((SELECT SUM(a.TRANSP_COUNT) FROM `transpc' +
        'ard` a WHERE a.`ID`=tr.`ID` AND a.`SM_ID` NOT IN '
      
        '(SELECT SM_ID FROM `smetasourcedata` WHERE PARENT_ID IN (SELECT ' +
        'SM_ID FROM `smetasourcedata` WHERE `smetasourcedata`.`PARENT_ID`' +
        ' = :ID_ACT)) AND a.`SM_ID` <> sm.`SM_ID`'
      
        'AND a.SM_ID NOT IN (SELECT SM_ID FROM `smetasourcedata` WHERE OB' +
        'J_ID=:ID_OBJECT AND ACT=1 AND TYPE_ACT<>0)), 0)'
      
        '    WHEN 10 THEN IFNULL((SELECT SUM(a.E1820_COUNT) FROM `data_ro' +
        'w` a WHERE a.`ID_TYPE_DATA`=d.`ID_TYPE_DATA` AND a.`SM_ID` NOT I' +
        'N '
      
        '(SELECT SM_ID FROM `smetasourcedata` WHERE PARENT_ID IN (SELECT ' +
        'SM_ID FROM `smetasourcedata` WHERE `smetasourcedata`.`PARENT_ID`' +
        ' = :ID_ACT)) AND (SELECT SOURCE_ID FROM smetasourcedata WHERE SM' +
        '_ID=a.`SM_ID`) = d.`SM_ID`'
      
        'AND a.SM_ID NOT IN (SELECT SM_ID FROM `smetasourcedata` WHERE OB' +
        'J_ID=:ID_OBJECT AND ACT=1 AND TYPE_ACT<>0)), 0)'
      
        '    WHEN 11 THEN IFNULL((SELECT SUM(a.E1820_COUNT) FROM `data_ro' +
        'w` a WHERE a.`ID_TYPE_DATA`=d.`ID_TYPE_DATA` AND a.`SM_ID` NOT I' +
        'N '
      
        '(SELECT SM_ID FROM `smetasourcedata` WHERE PARENT_ID IN (SELECT ' +
        'SM_ID FROM `smetasourcedata` WHERE `smetasourcedata`.`PARENT_ID`' +
        ' = :ID_ACT)) AND (SELECT SOURCE_ID FROM smetasourcedata WHERE SM' +
        '_ID=a.`SM_ID`) = d.`SM_ID`'
      
        'AND a.SM_ID NOT IN (SELECT SM_ID FROM `smetasourcedata` WHERE OB' +
        'J_ID=:ID_OBJECT AND ACT=1 AND TYPE_ACT<>0)), 0)'
      '  END AS CntDONE, '
      '/* '#1055#1088#1086#1094#1077#1085#1090#1086#1074#1082#1072' */'
      '  IFNULL('
      '  CASE d.`ID_TYPE_DATA` '
      '    WHEN 1 THEN crt.`RATE_COUNT`'
      '    WHEN 2 THEN matt.`MAT_COUNT`'
      '    WHEN 3 THEN mecht.`MECH_COUNT`'
      '    WHEN 4 THEN devt.`DEVICE_COUNT`'
      '    WHEN 5 THEN dmpt.`DUMP_COUNT`'
      '    WHEN 6 THEN trt.`TRANSP_COUNT`'
      '    WHEN 7 THEN trt.`TRANSP_COUNT`'
      '    WHEN 8 THEN trt.`TRANSP_COUNT`'
      '    WHEN 9 THEN trt.`TRANSP_COUNT`'
      '    WHEN 10 THEN dt.`E1820_COUNT`'
      '    WHEN 11 THEN dt.`E1820_COUNT`'
      '  END, 0) AS OBJ_COUNT_IN,'
      '  IF(  IFNULL('
      '  CASE d.`ID_TYPE_DATA` '
      '    WHEN 1 THEN crt.`RATE_COUNT`'
      '    WHEN 2 THEN matt.`MAT_COUNT`'
      '    WHEN 3 THEN mecht.`MECH_COUNT`'
      '    WHEN 4 THEN devt.`DEVICE_COUNT`'
      '    WHEN 5 THEN dmpt.`DUMP_COUNT`'
      '    WHEN 6 THEN trt.`TRANSP_COUNT`'
      '    WHEN 7 THEN trt.`TRANSP_COUNT`'
      '    WHEN 8 THEN trt.`TRANSP_COUNT`'
      '    WHEN 9 THEN trt.`TRANSP_COUNT`'
      '    WHEN 10 THEN dt.`E1820_COUNT`'
      '    WHEN 11 THEN dt.`E1820_COUNT`'
      '  END, 0), TRUE, FALSE) AS SELECTED'
      '  FROM `smetasourcedata` sm, `data_row` d'
      
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
      '  '
      
        '  LEFT JOIN `data_row_temp` dt ON dt.`ID_TYPE_DATA`=d.`ID_TYPE_D' +
        'ATA` AND dt.`ID_TABLES`=d.`ID_TABLES`'
      
        '  LEFT JOIN `card_rate_temp` crt ON dt.`ID_TYPE_DATA` = 1 AND cr' +
        't.`ID` = dt.`ID_TABLES` AND crt.`ID`=cr.`ID`'
      
        '  LEFT JOIN `materialcard_temp` matt ON dt.`ID_TYPE_DATA` = 2 AN' +
        'D matt.`ID` = dt.`ID_TABLES` AND matt.`ID`=mat.`ID`'
      
        '  LEFT JOIN `mechanizmcard_temp` mecht ON dt.`ID_TYPE_DATA` = 3 ' +
        'AND mecht.`ID` = dt.`ID_TABLES` AND mech.`ID`=mech.`ID`'
      
        '  LEFT JOIN `devicescard_temp` devt ON dt.`ID_TYPE_DATA` = 4 AND' +
        ' devt.`ID` = dt.`ID_TABLES` AND devt.`ID`=dev.`ID`'
      
        '  LEFT JOIN `dumpcard_temp` dmpt ON dt.`ID_TYPE_DATA` = 5 AND dm' +
        'pt.`ID` = dt.`ID_TABLES` AND dmpt.`ID`=dmp.`ID`'
      
        '  LEFT JOIN `transpcard_temp` trt ON dt.`ID_TYPE_DATA` IN (6,7,8' +
        ',9) AND trt.`ID` = dt.`ID_TABLES` AND trt.`ID`=tr.`ID`'
      '  WHERE sm.`DELETED` = 0 AND'
      '        sm.`ACT` = 0 AND'
      '  '#9'sm.`SM_ID`=d.`SM_ID` AND'
      '        sm.`OBJ_ID`=:ID_OBJECT'
      '        '
      '  UNION ALL'
      '  '
      '  select '
      
        '  CAST(CONCAT(FN_getSortSM(sm.`SM_ID`)) AS CHAR(255)) as SORT_ID' +
        ','
      
        '  CAST(CONCAT(FN_getSortSM(sm.`SM_ID`)) AS CHAR(255)) as SORT_ID' +
        '2,'
      '  0 AS INCITERATOR,'
      '  0 AS ITERATOR,'
      '  NULL AS NUM_ROW,'
      
        '  CONCAT(sm.`SM_NUMBER`, '#39' '#39', sm.`NAME`) AS OBJ_CODE, NULL AS OB' +
        'J_NAME, NULL AS OBJ_COUNT, NULL AS OBJ_UNIT,(sm.`SM_TYPE` * -1) ' +
        'as ID_TYPE_DATA,'
      
        '  NULL AS DATA_ESTIMATE_OR_ACT_ID, NULL AS ID_TABLES, sm.`SM_ID`' +
        ', NULL AS ID_RATE, NULL AS ID_REPLACED, NULL AS CntDONE, NULL AS' +
        ' OBJ_COUNT_IN, '
      
        '  EXISTS(SELECT SM_ID FROM `smetasourcedata` WHERE SOURCE_ID=sm.' +
        'SM_ID) AS SELECTED'
      '  FROM `smetasourcedata` sm'
      '  WHERE sm.`DELETED` = 0 AND'
      '        sm.`ACT` = 0 AND '
      '        sm.`OBJ_ID`=:ID_OBJECT'
      '                '
      '  ORDER BY SORT_ID, NUM_ROW, ID_TYPE_DATA;')
    Left = 481
    Top = 176
    ParamData = <
      item
        Name = 'ID_ACT'
        ParamType = ptInput
      end
      item
        Name = 'ID_OBJECT'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qrDataSORT_ID: TStringField
      FieldName = 'SORT_ID'
      Size = 255
    end
    object strngfldDataOBJ_CODE: TStringField
      FieldName = 'OBJ_CODE'
      ReadOnly = True
      Size = 512
    end
    object strngfldDataOBJ_UNIT: TStringField
      FieldName = 'OBJ_UNIT'
      ReadOnly = True
      Size = 512
    end
    object qrDataOBJ_COUNT_OUT: TFloatField
      FieldKind = fkCalculated
      FieldName = 'OBJ_COUNT_OUT'
      Calculated = True
    end
    object qrDataID_TYPE_DATA: TIntegerField
      FieldName = 'ID_TYPE_DATA'
    end
    object qrDataSELECTED: TIntegerField
      FieldName = 'SELECTED'
    end
    object qrDataCHECKED: TBooleanField
      FieldKind = fkCalculated
      FieldName = 'CHECKED'
      OnChange = qrDataCHECKEDChange
      Calculated = True
    end
    object qrDataITERATOR: TIntegerField
      FieldName = 'ITERATOR'
    end
    object qrDataINCITERATOR: TIntegerField
      FieldName = 'INCITERATOR'
    end
    object qrDataSM_ID: TLongWordField
      FieldName = 'SM_ID'
    end
    object qrDataID_TABLES: TLongWordField
      FieldName = 'ID_TABLES'
    end
    object strngfldDataOBJ_NAME: TStringField
      FieldName = 'OBJ_NAME'
      Size = 1024
    end
    object qrDataOBJ_COUNT: TFloatField
      FieldName = 'OBJ_COUNT'
    end
    object qrDataCntDONE: TFloatField
      FieldName = 'CntDONE'
    end
    object qrDataOBJ_COUNT_IN: TFloatField
      FieldName = 'OBJ_COUNT_IN'
      OnChange = qrDataOBJ_COUNT_INChange
    end
    object qrDataSORT_ID2: TStringField
      FieldName = 'SORT_ID2'
      Size = 255
    end
  end
  object dsData: TDataSource
    DataSet = qrData
    Left = 536
    Top = 175
  end
  object qrTemp: TFDQuery
    Connection = DM.Connect
    Transaction = DM.Read
    UpdateTransaction = DM.Write
    Left = 33
    Top = 32
  end
  object FormStorage: TJvFormStorage
    AppStorage = FormMain.AppIni
    AppStoragePath = '%FORM_NAME%\'
    Options = []
    StoredValues = <>
    Left = 32
    Top = 88
  end
  object qrTreeData: TFDQuery
    BeforeOpen = qrTreeDataBeforeOpen
    MasterFields = 'obj_id'
    Connection = DM.Connect
    Transaction = DM.Read
    UpdateTransaction = DM.Write
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    SQL.Strings = (
      
        'SELECT SM_ID, SM_TYPE, OBJ_ID, CONCAT(IFNULL(SM_NUMBER, ""), " "' +
        ',  IFNULL(NAME, ""), IF(DELETED=1, "-", "")) as NAME,'
      '       PARENT_ID as PARENT, DELETED'
      'FROM smetasourcedata'
      'WHERE ACT=0 AND '
      '      OBJ_ID=:OBJ_ID'
      '      AND ((DELETED=0) OR (:SHOW_DELETED=1))'
      'ORDER BY NAME')
    Left = 217
    Top = 32
    ParamData = <
      item
        Name = 'OBJ_ID'
        DataType = ftInteger
        ParamType = ptInput
        Size = 10
        Value = Null
      end
      item
        Name = 'SHOW_DELETED'
        DataType = ftInteger
        ParamType = ptInput
        Value = 0
      end>
  end
  object dsTreeData: TDataSource
    DataSet = qrTreeData
    Left = 216
    Top = 80
  end
end
