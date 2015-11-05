object FormCalculationEstimate: TFormCalculationEstimate
  Left = 0
  Top = 0
  Caption = #1057#1084#1077#1090#1085#1099#1081' '#1088#1072#1089#1095#1077#1090
  ClientHeight = 537
  ClientWidth = 918
  Color = clBtnFace
  DoubleBuffered = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  Visible = True
  OnActivate = FormActivate
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PanelTopMenu: TPanel
    Left = 0
    Top = 0
    Width = 918
    Height = 37
    Align = alTop
    BevelOuter = bvNone
    Ctl3D = True
    ParentBackground = False
    ParentCtl3D = False
    TabOrder = 0
    OnResize = PanelTopMenuResize
    object btnDump: TSpeedButton
      Left = 849
      Top = 6
      Width = 20
      Height = 25
      Hint = #1054#1087#1080#1089#1072#1085#1080#1077' '#1088#1072#1073#1086#1090' '#1074' '#1088#1072#1089#1094#1077#1085#1082#1077
      GroupIndex = 2
      Caption = #1057#1074#1072#1083#1082#1080
      Enabled = False
      ParentShowHint = False
      ShowHint = True
      Visible = False
      OnClick = btnDumpClick
    end
    object btnTransp: TSpeedButton
      Left = 875
      Top = 8
      Width = 18
      Height = 23
      Hint = #1054#1087#1080#1089#1072#1085#1080#1077' '#1088#1072#1073#1086#1090' '#1074' '#1088#1072#1089#1094#1077#1085#1082#1077
      GroupIndex = 2
      Caption = #1058#1088#1072#1085#1089#1087#1086#1088#1090
      Enabled = False
      ParentShowHint = False
      ShowHint = True
      Visible = False
      OnClick = btnTranspClick
    end
    object btnStartup: TSpeedButton
      Left = 899
      Top = 8
      Width = 23
      Height = 23
      Hint = #1054#1087#1080#1089#1072#1085#1080#1077' '#1088#1072#1073#1086#1090' '#1074' '#1088#1072#1089#1094#1077#1085#1082#1077
      GroupIndex = 2
      Caption = #1056#1077#1075#1091#1083#1080#1088#1086#1074#1082#1072
      Enabled = False
      ParentShowHint = False
      ShowHint = True
      Visible = False
      OnClick = btnStartupClick
    end
    object SpeedButtonLocalEstimate: TSpeedButton
      AlignWithMargins = True
      Left = 3
      Top = 1
      Width = 102
      Height = 35
      Margins.Top = 1
      Margins.Right = 1
      Margins.Bottom = 1
      Align = alLeft
      GroupIndex = 1
      Down = True
      Caption = #1051#1086#1082#1072#1083#1100#1085#1072#1103' '#1089#1084#1077#1090#1072
      OnClick = SpeedButtonLocalEstimateClick
      ExplicitHeight = 25
    end
    object SpeedButtonSummaryCalculation: TSpeedButton
      AlignWithMargins = True
      Left = 595
      Top = 1
      Width = 101
      Height = 35
      Margins.Left = 0
      Margins.Top = 1
      Margins.Right = 1
      Margins.Bottom = 1
      Align = alLeft
      GroupIndex = 1
      Caption = #1057#1074#1086#1076#1085#1099#1077' '#1088#1072#1089#1095#1105#1090#1099
      OnClick = SpeedButtonSummaryCalculationClick
      ExplicitTop = 4
    end
    object SpeedButtonSSR: TSpeedButton
      AlignWithMargins = True
      Left = 746
      Top = 1
      Width = 48
      Height = 35
      Margins.Left = 0
      Margins.Top = 1
      Margins.Right = 1
      Margins.Bottom = 1
      Align = alLeft
      GroupIndex = 1
      Caption = #1057#1057#1056
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      OnClick = SpeedButtonSSRClick
      ExplicitTop = 4
    end
    object BevelTopMenu: TBevel
      Left = 183
      Top = 0
      Width = 2
      Height = 37
      Align = alLeft
      Shape = bsLeftLine
      ExplicitLeft = 464
      ExplicitTop = 4
      ExplicitHeight = 19
    end
    object SpeedButtonModeTables: TSpeedButton
      Left = 928
      Top = 6
      Width = 28
      Height = 25
      Hint = #1056#1077#1078#1080#1084' '#1087#1086#1082#1072#1079#1072' '#1090#1072#1073#1083#1080#1094': '#1084#1072#1090#1077#1088#1080#1072#1083#1099', '#1084#1077#1093#1072#1085#1080#1079#1084#1099', '#1086#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1103
      Enabled = False
      Flat = True
      ParentShowHint = False
      ShowHint = True
      Transparent = False
      Visible = False
      OnClick = SpeedButtonModeTablesClick
    end
    object btnResMat: TSpeedButton
      Tag = 1
      AlignWithMargins = True
      Left = 185
      Top = 1
      Width = 82
      Height = 35
      Margins.Left = 0
      Margins.Top = 1
      Margins.Right = 1
      Margins.Bottom = 1
      Align = alLeft
      GroupIndex = 1
      Caption = #1042#1077#1076#1086#1084#1086#1089#1090#1100' '#1084#1072#1090#1077#1088#1080#1072#1083#1086#1074
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      OnClick = btnResMatClick
      ExplicitLeft = 335
      ExplicitHeight = 25
    end
    object btnResMech: TSpeedButton
      Tag = 2
      AlignWithMargins = True
      Left = 268
      Top = 1
      Width = 82
      Height = 35
      Margins.Left = 0
      Margins.Top = 1
      Margins.Right = 1
      Margins.Bottom = 1
      Align = alLeft
      GroupIndex = 1
      Caption = #1042#1077#1076#1086#1084#1086#1089#1090#1100' '#1084#1077#1093#1072#1085#1080#1079#1084#1086#1074
      OnClick = btnResMatClick
      ExplicitLeft = 420
      ExplicitHeight = 25
    end
    object btnResDev: TSpeedButton
      Tag = 3
      AlignWithMargins = True
      Left = 351
      Top = 1
      Width = 92
      Height = 35
      Margins.Left = 0
      Margins.Top = 1
      Margins.Right = 1
      Margins.Bottom = 1
      Align = alLeft
      GroupIndex = 1
      Caption = #1042#1077#1076#1086#1084#1086#1089#1090#1100' '#1086#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1103
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      OnClick = btnResMatClick
      ExplicitLeft = 455
      ExplicitTop = 0
      ExplicitHeight = 25
    end
    object btnResZP: TSpeedButton
      Tag = 4
      AlignWithMargins = True
      Left = 444
      Top = 1
      Width = 74
      Height = 35
      Margins.Left = 0
      Margins.Top = 1
      Margins.Right = 1
      Margins.Bottom = 1
      Align = alLeft
      GroupIndex = 1
      Caption = #1056#1072#1089#1095#1077#1090' '#1047#1055
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      OnClick = btnResMatClick
      ExplicitLeft = 600
      ExplicitTop = 4
      ExplicitHeight = 25
    end
    object btnResCalc: TSpeedButton
      Tag = 77
      AlignWithMargins = True
      Left = 697
      Top = 1
      Width = 48
      Height = 35
      Margins.Left = 0
      Margins.Top = 1
      Margins.Right = 1
      Margins.Bottom = 1
      Align = alLeft
      GroupIndex = 1
      Caption = #1050#1086#1085#1090#1088#1072#1082#1090#1085#1072#1103' '#1094#1077#1085#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Visible = False
      OnClick = btnResMatClick
      ExplicitTop = 8
    end
    object btnKC6J: TSpeedButton
      AlignWithMargins = True
      Left = 107
      Top = 1
      Width = 75
      Height = 35
      Margins.Left = 1
      Margins.Top = 1
      Margins.Right = 1
      Margins.Bottom = 1
      Align = alLeft
      GroupIndex = 1
      Caption = #1046#1091#1088#1085#1072#1083' 6-KC'
      OnClick = btnKC6JClick
      ExplicitLeft = 186
    end
    object btnCalcFact: TBitBtn
      AlignWithMargins = True
      Left = 795
      Top = 1
      Width = 40
      Height = 35
      Margins.Left = 0
      Margins.Top = 1
      Margins.Right = 1
      Margins.Bottom = 1
      Align = alLeft
      Caption = #1056#1072#1089#1095#1077#1090' '#1092#1072#1082#1090#1080#1095#1077#1089#1082#1080#1093' '#1079#1072#1090#1088#1072#1090
      TabOrder = 1
      TabStop = False
      WordWrap = True
      OnClick = btnCalcFactClick
    end
    object btn3: TBitBtn
      AlignWithMargins = True
      Left = 519
      Top = 1
      Width = 75
      Height = 35
      Margins.Left = 0
      Margins.Top = 1
      Margins.Right = 1
      Margins.Bottom = 1
      Align = alLeft
      Caption = #1056#1072#1089#1095#1077#1090' '#1089#1090#1086#1080#1084#1086#1089#1090#1080
      TabOrder = 0
      TabStop = False
      WordWrap = True
      OnClick = btn2Click
    end
  end
  object PanelLocalEstimate: TPanel
    Left = 0
    Top = 176
    Width = 912
    Height = 324
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 6
    object ImageSplitterBottom: TImage
      Left = 200
      Top = 365
      Width = 15
      Height = 5
      Cursor = crVSplit
      AutoSize = True
    end
    object SplitterBottom: TSplitter
      Left = 0
      Top = 225
      Width = 912
      Height = 5
      Cursor = crVSplit
      Align = alBottom
      Color = clBtnFace
      ParentColor = False
      ResizeStyle = rsUpdate
      ExplicitTop = 0
    end
    object PanelClient: TPanel
      Left = 0
      Top = 0
      Width = 912
      Height = 225
      Align = alClient
      Alignment = taRightJustify
      BevelOuter = bvNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 0
      object ImageSplitterCenter: TImage
        Left = 425
        Top = 97
        Width = 5
        Height = 15
        Cursor = crHSplit
        AutoSize = True
      end
      object SplitterCenter: TSplitter
        Left = 361
        Top = 25
        Width = 5
        Height = 200
        ExplicitLeft = 407
        ExplicitTop = 29
        ExplicitHeight = 199
      end
      object PanelTopClient: TPanel
        Left = 0
        Top = 0
        Width = 912
        Height = 25
        Align = alTop
        BevelOuter = bvNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 0
        DesignSize = (
          912
          25)
        object Label2: TLabel
          Left = 8
          Top = 4
          Width = 22
          Height = 13
          Caption = #1058#1080#1087':'
        end
        object LabelCategory: TLabel
          Left = 200
          Top = 4
          Width = 40
          Height = 13
          Caption = #1056#1072#1079#1088#1103#1076':'
        end
        object btnMaterials: TSpeedButton
          Left = 505
          Top = -1
          Width = 100
          Height = 25
          Hint = #1052#1072#1090#1077#1088#1080#1072#1083#1099' '#1087#1086' '#1088#1072#1089#1094#1077#1085#1082#1077
          Anchors = [akTop, akRight]
          GroupIndex = 2
          Down = True
          Caption = #1052#1072#1090#1077#1088#1080#1072#1083#1099
          Enabled = False
          ParentShowHint = False
          ShowHint = True
          OnClick = btnMaterialsClick
        end
        object btnMechanisms: TSpeedButton
          Left = 607
          Top = -1
          Width = 100
          Height = 25
          Hint = #1052#1077#1093#1072#1085#1080#1079#1084#1099' '#1087#1086' '#1088#1072#1089#1094#1077#1085#1082#1077
          Anchors = [akTop, akRight]
          GroupIndex = 2
          Caption = #1052#1077#1093#1072#1085#1080#1079#1084#1099
          Enabled = False
          ParentShowHint = False
          ShowHint = True
          OnClick = btnMechanismsClick
        end
        object btnEquipments: TSpeedButton
          Left = 709
          Top = -1
          Width = 100
          Height = 25
          Hint = #1054#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1103' '#1087#1086' '#1088#1072#1089#1094#1077#1085#1082#1077
          Anchors = [akTop, akRight]
          GroupIndex = 2
          Caption = #1054#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1077
          Enabled = False
          ParentShowHint = False
          ShowHint = True
          OnClick = btnEquipmentsClick
        end
        object btnDescription: TSpeedButton
          Left = 811
          Top = -1
          Width = 100
          Height = 25
          Hint = #1054#1087#1080#1089#1072#1085#1080#1077' '#1088#1072#1073#1086#1090' '#1074' '#1088#1072#1089#1094#1077#1085#1082#1077
          Anchors = [akTop, akRight]
          GroupIndex = 2
          Caption = #1057#1086#1089#1090#1072#1074' '#1088#1072#1073#1086#1090
          Enabled = False
          ParentShowHint = False
          ShowHint = True
          OnClick = btnDescriptionClick
        end
        object lblForeman: TLabel
          Left = 482
          Top = 4
          Width = 46
          Height = 13
          Cursor = crHandPoint
          Caption = #1055#1088#1086#1088#1072#1073':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = lblForemanClick
        end
        object lblForemanFIO: TLabel
          Left = 534
          Top = 4
          Width = 23
          Height = 13
          Cursor = crHandPoint
          Caption = #1060#1048#1054
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = lblForemanClick
        end
        object edtRateActive: TEdit
          Left = 272
          Top = 1
          Width = 93
          Height = 21
          Alignment = taCenter
          Color = 8454016
          ReadOnly = True
          TabOrder = 2
          Text = #1044#1077#1081#1089#1090#1074#1091#1102#1097#1072#1103
        end
        object edtRateActiveDate: TEdit
          Left = 366
          Top = 1
          Width = 91
          Height = 21
          Alignment = taCenter
          BevelInner = bvLowered
          BevelOuter = bvNone
          Color = 14802912
          ReadOnly = True
          TabOrder = 3
          Text = #1076#1072#1090#1072' '#1085#1077' '#1091#1082#1072#1079#1072#1085#1072
        end
        object EditCategory: TEdit
          Left = 241
          Top = 1
          Width = 30
          Height = 21
          Alignment = taCenter
          Color = 14802912
          ReadOnly = True
          TabOrder = 1
        end
        object dblkcbbID_TYPE_DATA: TDBLookupComboBox
          Left = 31
          Top = 1
          Width = 165
          Height = 21
          DataField = 'ID_TYPE_DATA'
          DataSource = dsRatesEx
          KeyField = 'ID_TYPE_DATA'
          ListField = 'TYPE_NAME'
          ListSource = dsTypeData
          TabOrder = 0
        end
      end
      object PanelClientLeft: TPanel
        Left = 0
        Top = 25
        Width = 361
        Height = 200
        Align = alLeft
        BevelOuter = bvNone
        ParentBackground = False
        ShowCaption = False
        TabOrder = 1
        object ImageSplitterLeft: TImage
          Left = 313
          Top = 40
          Width = 15
          Height = 62
          Cursor = crVSplit
          AutoSize = True
        end
        object SplitterLeft: TSplitter
          Left = 0
          Top = 156
          Width = 361
          Height = 5
          Cursor = crVSplit
          Align = alBottom
          ResizeStyle = rsUpdate
          ExplicitTop = 108
          ExplicitWidth = 425
        end
        object dbmmoCAPTION: TDBMemo
          Left = 0
          Top = 161
          Width = 361
          Height = 39
          Align = alBottom
          DataField = 'OBJ_NAME'
          DataSource = dsRatesEx
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ScrollBars = ssVertical
          TabOrder = 1
          OnExit = dbmmoCAPTIONExit
        end
        object grRatesEx: TJvDBGrid
          Left = 0
          Top = 0
          Width = 361
          Height = 156
          Align = alClient
          DataSource = dsRatesEx
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleHotTrack]
          ParentFont = False
          PopupMenu = pmTableLeft
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnDrawColumnCell = dbgrdRates12DrawColumnCell
          OnEnter = dbgrdRatesEnter
          OnExit = grRatesExExit
          OnKeyDown = dbgrdRatesKeyDown
          AutoAppend = False
          IniStorage = FormStorage
          MultiSelect = True
          AutoSizeColumns = True
          SelectColumnsDialogStrings.Caption = 'Select columns'
          SelectColumnsDialogStrings.OK = '&OK'
          SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
          CanDelete = False
          EditControls = <>
          RowsHeight = 17
          TitleRowHeight = 17
          OnCanEditCell = grRatesExCanEditCell
          Columns = <
            item
              Expanded = False
              FieldName = 'ITERATOR'
              Title.Alignment = taCenter
              Title.Caption = #8470' '#1087'/'#1087
              Width = 31
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOM_ROW_MANUAL'
              Title.Alignment = taCenter
              Title.Caption = #8470
              Width = 31
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'OBJ_CODE'
              Title.Alignment = taCenter
              Title.Caption = #1050#1086#1076
              Width = 136
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'OBJ_COUNT'
              Title.Alignment = taCenter
              Title.Caption = #1050#1086#1083'-'#1074#1086
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'OBJ_UNIT'
              Title.Alignment = taCenter
              Title.Caption = #1045#1076'. '#1080#1079#1084'.'
              Width = 82
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SORT_ID'
              Title.Alignment = taCenter
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'ID_TYPE_DATA'
              Title.Alignment = taCenter
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'DATA_ESTIMATE_OR_ACT_ID'
              Title.Alignment = taCenter
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'ID_TABLES'
              Title.Alignment = taCenter
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'SM_ID'
              Title.Alignment = taCenter
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'WORK_ID'
              Title.Alignment = taCenter
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'ZNORMATIVS_ID'
              Title.Alignment = taCenter
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'APPLY_WINTERPRISE_FLAG'
              Title.Alignment = taCenter
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'ID_RATE'
              Title.Alignment = taCenter
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'SORT_ID2'
              Title.Alignment = taCenter
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'NUM_ROW'
              Title.Alignment = taCenter
              Title.Caption = #1055#1086#1088#1103#1076#1082#1086#1074#1099#1081' '#1085#1086#1084#1077#1088
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'ID_REPLACED'
              Title.Caption = 'ID_REPLACED ('#1048#1044' '#1084#1072#1090#1077#1088#1080#1072#1083#1072', '#1079#1072#1084#1077#1085#1103#1077#1084#1086#1075#1086' '#1076#1072#1085#1085#1099#1084')'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'ID_ACT'
              Visible = False
            end>
        end
      end
      object PanelNoData: TPanel
        Left = 366
        Top = 25
        Width = 546
        Height = 200
        Align = alClient
        BevelOuter = bvNone
        ParentBackground = False
        TabOrder = 3
        OnResize = PanelNoDataResize
        object ShapeNoData: TShape
          Left = 0
          Top = 0
          Width = 546
          Height = 200
          Align = alClient
          Brush.Color = clWindow
          Pen.Color = clMedGray
          ExplicitLeft = 106
          ExplicitTop = 42
          ExplicitWidth = 207
          ExplicitHeight = 111
        end
        object ImageNoData: TImage
          Left = 0
          Top = 0
          Width = 546
          Height = 200
          Align = alClient
          Center = True
          Picture.Data = {
            0954506E67496D61676589504E470D0A1A0A0000000D49484452000001000000
            010008060000012B7598F0000000097048597300000B1300000B1301009A9C18
            000001366943435050686F746F73686F70204943432070726F66696C65000078
            DAAD8EB14AC3501440CF8BA2E2502B04717078932828B6EA60C6A42D4510ACD5
            21C9D6A4A14A69125E5ED57E84A35B071777BFC0C9517050FC02FF4071EAE010
            218383089EE9DCC3E572C1A8D875A7619461106BD56E3AD2F57C39FBC40C5300
            D009B3D46EB50E00E2248EF8C1E72B02E079D3AE3B0DFEC67C982A0D4C80ED6E
            9485202A40FF42A71AC41830837EAA41DC01A63A69D7403C00A55EEE2F4029C8
            FD0D2829D7F3417C0066CFF57C30E60033C87D05307574A9016A493A5267BD53
            2DAB966549BB9B04913C1E653A1A64723F0E139526AAA3A32E90FF07C062BED8
            6E3A72AD6A597BEBFC33AEE7CBDCDE8F1080587A2C5A413854E7DF2A8C9DDFE7
            E2C678190E6F617A52B4DD2BB8D98085EBA2AD56A1BC05F7E32FC0C64FFDE85A
            4F6200004DCB4944415478DAED7D097C14C7957EF58CEEFB46122040DCC21C41
            DC876D0C186C63271B87E0D8C6178E93ECC6D826BEE223607C05EF6EF61F3B9B
            CDCF7692FD858D17C7D94DB271D67682BDB1034202099D082174202E09DDF7DC
            DDFF7ADD5D3D35AD9ED1CC684E4D3D684D777575F5EBD75F7DF5EAE82A4E1004
            144CE19C29C0719CCECB3405C183A7D25400DF3CBAE9E295628E0AB3F1BCCECA
            F37A8B15366B94C5C6E3CD1665B60A7A3807970D0FF40B776EDD5881F72FE374
            F9092B101B131D038710C6F302070A58AD36BDD96A8B827D3356C666E38902A8
            ADA599BB61DDEAA41979D9A7799EAFC569DB26A440D5C913DBF3F2F395708BC5
            821571FE60BDBDBD68F1E2C5C88AE3353735F5DEF1E52FFF14A76FF5DE023A61
            7B525292BBAF13F56105727373C5FDE8E86874FCD83174E3A64DAFE343B3335C
            B85680F34C81C1C141949D9D25EEEB7412862F5CB880162C587008EF1AB59470
            A940B460F54881D1D15194959535E6355DB97205CD9B37EF10BE97C123056290
            CD23050023B5B5B5E8FCF9F3A205E035C0AFC96442F7DC734F1F4EEB276A60BA
            5420CE430C405AA084D56A8534C49BC36F5757176ABD7CF5FF766CDB7A1AC719
            725B818428CE23059C096063D4C27F326F56C1397CBF5EB715488E8DF2A5021F
            CF2E980A0AF479A4407272B24F141831DB4081468F2C901A17ADA9C089D2D2FD
            F0BB76CD9A97C831EC935F75FC81810134EC8D026909B16E59A0B4B4F499356B
            D61C2A2929D9BF6EDD3A4D05868C16CF15484F8CF3C92B0005060D66CF15C848
            8AF7990203A326A60028701EDFAFC72B052A2A2A761B0C86C20D1B3628203B76
            ECD8FE9C9C9CA398E78F373636AE1F1A1A2A2C2E2E3E0CE12B56AC38545E5EFE
            0CC40FA802F9F9F9C79B9B9B77433C383F6105AAABABF7D38905ED15041D0313
            56C060FE64F6F47C50A09B29C014081F054E7CF697ED77DD73CF8415F88F7FFF
            7774FDF6DB4081267CBF2EB71580EA18AEFFE1BAA02D4AFA25F541B13AA687B8
            7A9D8E8FD2EB6CD17A9D35264A6F8D860D1F47E9F578D339F8E773DCE581404A
            682AC081332FD78A3D490B6FBC276D034E15385956B6272B7FFA19728CE340D5
            5C6A1FB0F051669B354AACA2E3AAB9D506ED0378C327562F9A9D9F959EFA2E72
            5119754B8153A74E3D9433B5E09C5EAF8B92144008DA012CBC4D07ED0352E304
            2F2A20B50F60052D66E1745949EC5DBB76464FCBCEF80DBE6CD41D253415A828
            2F7F105BA0F14A5BCB563A1CEA78CE042AA4555555E896EDDB91D566434B972C
            791307F78DA784A602A72B2A1EC8CC9B763E35316E2B72534081F253A7D0C68D
            1BC563A817C6C5C5BD8377DB5D35D7682A505559795FFA94FCE6D404F7158074
            B0F38256AF5EA5280049C7C7C7FD1A1FB6386BAED154A0BAAA6A775A4E5E4B72
            5CB4DB0A80343434A065CB968D094F4C4CFC2DFEA9D7B284A60235D5D5F7A666
            E7B6A6C4C778A40054C34F9E3C89B06F28B60DC006E9DB1057F5F0830F7C8EA3
            F4AB31A1A9406D6DED3D29993917D23CC00008E000800A69EAF57AB16DC08601
            5977EEFC5FD35292D2572E5FFE7BB714A8ABABBB273923FB42467282470A3893
            EE81E1A326B3D9B670F6CC52B714A83F73E6EEC4F4ACB6ECB4649F28D0D53F74
            14674D2B2E0D4BD5E7B415A8AFFF46625AE6C59CF494310A949595ED5FBD7AF5
            4BE4D71D053AFB078F6202735F8186B367EF8A4FCDB8949B913A4601D2364084
            B407745CBB56983B654A8B96021D7D031E2AD0D070577C4AFAA5BCACF4310A90
            3600F88563D81F1C1C4C1F1D1D4DCFCDCDD554A0BDA7CF3305CE3534EC8A4B49
            BF9C9F9DE1130C5CEDEEF5508173E776C525A75D9E9A93E91305AE74F5786781
            A0294030103405CEE26C9880B321284057C1E11C1CC32FA92943B51D7EB1FBDE
            42E29078E43A8F15203CE08D02A41A4F1A2970916CF4588133980993301306ED
            15D4E1C2281917464153A0A6A6E6DED4AC29AD41538038244153003B97F7A5E7
            E435074D81CAD3A7EFCFC89DDA14340588571C340548BD20680A40CD281B2B30
            6D4AD696A028507AE2C49EACA90567A0CE27B60B586C7AB3D82E20D607A52A19
            2FE8F41CC7E3EA1B1FA5E7ACD17ABD35261A6FD02E1025B50FE838CE2171B715
            08A4045D81608BDB0680F10C8F3EFA68F19E3D0FCF731E096F82D4AE212041BC
            4A0C17C423D2DEC1C12D7108279F22574A572024F7FC0ADCEA952BFE8077FA91
            17ED1EFE304034AEF5EDC6FC581F05B52E8D061C488B47828EE705D8D7D9789E
            C3FB70AC83260C9B007907E1305E274098208543FB0B7E429D20594CB0E0CA5D
            777717BA6EEEACF4DC29D9DC948CB42F70F26D7833FBDA181E19A0FCD4A97BD3
            A6E49F0503E0CC8FFF4BED378A016083070643E087C476E0E021793084201982
            A70D83CFE36362004E440FFE6B319B85AB972EE9CED4D6447FFB913D308684D7
            E1A84F3CFA9DAB478E1C0122813100365F18C233039497DF837D8406D1008275
            AB2F3AB5B504B2008C45696C6C449B6EBC71CCF99263C7F82D37DFFC6F48CA1E
            D68918C22303E012FAEE94ECDC73FE3600E8D4DFDF8F5A5A5AD0BAB56B1DCE91
            6129602418A8812BE7FF8E0F3BF06641BE6A23756680CACACA6F603FB9110CC0
            D9CC7E330008B430C1D89B55AB56E16C656FD5820787730683413454745414EA
            1F18409B376FFE7D777777238E62F2C4101E19A0AAB2F2AEA4CC9CF3A201AC26
            BF1AC06834A2F6F676B470E14267FA204E29640471EC506C7C42437262C2291C
            7411B999353C32407575F5AEC4F4AC26310BF016BF1A8034F5C1DB1E1E1E4666
            B3590C872C409AFEA45658416C02ECEBEB438DAD6D25890909B66F3E787F97D5
            6A3DEB8E113C32406D4DCDD7E3D3329BC100D1C8E65703782AC019A366DBA723
            A3233C870D53BC7851030EEEF5A901EAEAEA76C6A5A4B78001E2F428A40C0023
            94CC82EE284683158AD97933A737A8874A4DD80067B001626503C447716E1B00
            D7F1772F59B2E4B0B3635F19C0247047F1E35BE189E6688C9299B001EACF9CF9
            5A4C725A2B1820215AB7D5DDBEE4D2D2D2FD6BA8615DF471A9DCDC1B1313D3BE
            7CF9F2B74B55CDBF6B3486836909F4491B79E45F039C3D7BF6CEE8C4940B6080
            C418BDDB063871E2C4FEB56BD7BEA43E865F3A5E7676F6D13973E61CEFE8E828
            6C6D6DDD4D5FE38E010C36C1BF0668387BF6AB5189296D6080A4D828B70DA01E
            57478E7B7A7AF2CE9D3BF708092771C000D809DAAD3516CF950146ADBC9F0DD0
            D0F0D5A88464D100D087E78BE114BE1230C088C5163803401F62A81960D86C0D
            1C07848101C60C4F99B801EAEBEF8C4E4A1D6300D26300121F1FDF0243186134
            616767E7163A8C1E0048F6E9618FD0D300BD0C709E849174E95E07751A0133C0
            195C0CC6CAC5A0DA00EA87A9AAAADA895DD822723D519E4E935C430C05025D31
            F04B87693D38090F28026847881840FD50AE1ED61304383340501180EBDF5F8F
            4FCD688E580EC02EECD713E4CA50C81AC0C68B4D657E31407555D5AEC48CECA6
            303140937A98E6840D40378844A4012A4F9FFE4672D694C688350066E9BB53E5
            46D1883400DD2C1E91063875F2E4BDE9B953CF8689019AD543C5276C80936565
            BB33F2A6D5437B247463F13C825E1F64937B7DF0CD753641EAF581AE65AA4788
            B30948E921C2B784364D81C3B7D7E15F9D4E877F395EA743BC5EDE876E679D8E
            83635E2F9E13377C0E9FD72141DDF54C4410A46FABFD6100E8919881B71CE4F9
            C0EE400A3CD008DEA03668F6990126AB30033003786080094CFAE0B15E78133B
            04FD3530C26303E0874FAAADADFB3B1BA67A976A6B8D10911E84D0368C031047
            8C50F756468820696C017AFDD5976BFEF0873FD4E2102BF270D60C7F19607AD3
            C52B535DD13F2F8FF4E0053232441A20011360F036F10B1C6A8004D28BF1E581
            123064461C3A23F0E208919191616EB4BD357ACF9E3D1F2389D57D3220622206
            28C006C8C765B1F8DF8501709AA201389B7D4408F61144DFC06E1CD12F80F8A2
            3174A2011012BBC28707FB85AE6B9DBA6D9BAF4F1EEEE94C2A2A2A824F5006FC
            6104AF0C208D8E71E40332D8893C14BC794134022F8F110227487486606C907D
            880C0E17205C1094BEEEFEFE5E74A1A559FFD5DB6F4D04BB26C5E8D3D3D2D2FE
            13EF836B3BA111213E3340941EC609DA8D20484690C6FB100F10F6E1CD0BF631
            4236E20DCAD983975C37D13B14D901FFEBEFEDE59ACE37E8EEFAEA57D24D56AB
            01DF848F8FD6A5632BFC0ED94783F88417BC3240EDE9D3E99999E92B394E9B11
            204DD29FEF8DC0E0888E8E0EB4EDE69B451F9FE8D879ED1ADA74D34DFF81772F
            232F87C4F8C40095656599376DDE543C911B8F67804B972EA1F9F3E6891F6111
            813080D9FC050B3EC087ADC8C3E130616300181902D3E2C4C7C5A19933672AE1
            ED57AFA282193350774F0FBA6BD7AE4F3EFFFCF33A34C12173216900C83EF0B0
            30546ECD9A354AF8551C366DDA34717F7864047DFCA73F5DB9F7BEFBE09B51AF
            8B49EF0D7093FF0C00D3045DC3F9FDECD9B368C78EDB94F0CB972FA382820207
            439D387EDCBAED965B60CCE020F2A284F0DA00376EBAC16F068039923A3B3BE1
            4B426C801D4A380C848AC3D96204BF7D3012F0017044737333BA69F3E69F4214
            4F8DE0BD016EBCDE6F0680515FDDDDDDE267B1DBB66D1B373E7086C9681CCCCB
            CF3F2C1BC1EDEC10920680BA008CFA6A6D6D45EBD7AFD7D2C5618C206C7D0383
            E72F5E684D5AB76EDD7B387814B9593A786D804D7ECC02600018F808D9E0E2C5
            8BA807B33EE4773246906CC400608CB253E5753FFAE77F4E8D8F8B2DC3C13062
            D4E25703DC74D38D7E3300E8043C00799D0C8B856C01062046A0C70C031FFCF5
            8B63A753D3D347EFDEB5736E6A4ACA117C6A407063CA43AF0DB0D98FC5207930
            B1C1153F386CB20E0E1B31169C3F517AB2343E29D980FD7461FBE64D50676840
            6EB8CB5E1B60CB969BFC6A004F449CC8A0AEAE242D3367D46C3609F7EEBC5338
            D7D858EA57036CDDBA39640C00525D77A6246FEAF4118BD5CA7FE5D66DF01D74
            A95F3960DBB6ADA167806905C338DBF03B6EDECCE122D4BF06D8BEFDE6903240
            556D1D6D00F021CA42C200811827AC36C07DBBBEA62B3971E2845F0D70CB2DDB
            DC32807ACE094FE6A0F0442A6B6A1503ECDEF5353D7EFE12BF1AE0D65BB7BB65
            005703A5CBCBCBF7E2F23E1DF621ACA9A9693D76811DBE977577B0F4E9EA9AC0
            1AE036370DA09EFC03042600C10E4E7ADD99337BD51386AAF7DD958A801BE0B6
            5BDC33809391E2555555E2B48D0E8691E3A9AF71CB0055D58135C08E1DB7BA65
            006723C57145A7B8BDBD7D0739575959B9FB4B5FFAD261AD6BDC91F2CAAAF032
            00D927E17979791FCE9A35ABC22706F8FA9D3A9C8DFC5B0ADC7EFB6D21E5079C
            3A5DC90C406501DD097FFB0177DCB123A40C70B2E234330033806C8047BFF570
            F4471F7D742C920D10231BC07F2D42CC009401E88F23D45F75A8C3D4FBE38581
            900F29E0C30A32E937AE5388F50812CFC1008FEC89F9E8E38F036B005A71ECC8
            3C131B1B7B957C274466249BA801481AF9F9F91F5EBD7A75071D8736C077B101
            3E0E9401E09317F8D57A40722D6D003A4D579FD6D061F0D1153D679CD6ECEB41
            3380B33748E6939B2802609F36003956CF7F1F1403687D300592919171BCB7B7
            57E9D2D1E97446ECDB1FF2C4005A0830994CE9030303C5244E525252FDB265CB
            3E501B602F26C1FF0D04096A4171228B034C445831C80C10C4623014040C908F
            0D60C30678FEA97D71EFBFFFFE17116B80179EFE5EFC9123473E8F5C033CB52F
            FEC8FBEF47AE017016887F9F1920820D8039200173C05F23D7004FED4BC01C10
            B906C05920E1FD48364000B2402936C0EDA16B00FF6781D0364000B240C81B20
            111BE0FF22D6003F3CB83FF9DD77DFFDD46F0680AF66A6E6646E0EF643D372B5
            ABF753FCEC3630C0A1970FA4BCF3CE3B47FD6300BCC3C3175EBCF4A113992358
            F93C8E271F44890B56932FC7C43041F9AA4CFA7A1CBE0087E4F43A4ED0C3BE8E
            B3C1D7E37AF8529C93BE1C97BE20872FC7C5AFCA05E90B72C43BFB5C07DF873F
            74707FCA3BEFBEEB730388DF0D8A37818790668A561ED826D8BF10B3DAA4EF03
            A52FC490DD0010173931007E48D88FA21E5ACF89FB82F829BD6410F1D37AF1D3
            7BCEF9178CAF1F7831F9E7BFF885CFB3004C1F09F38AC7B87541F0041E1A6695
            BDE6D3AEB1C92ACC00916E80481706800817BF00001798F0394F2CDEE2F0A60F
            F643FAEAB1E45F98CEC1246FE24A202482BFE7BAF0CB43F95A67F9E567959596
            EEC8A41671F55404B22A8B20B99D90344C4A204D3121CEB420BAA2BC40665D20
            2EA6E466CAAEA77C9DA0ACE3211D233A1EB183742FFBCA2F9CF43C30A1032F5E
            64E36D78E3D192C2BCBC9FBDF5D6F9436FBC5183A30C21F9337614A0494F7CFA
            BEFC0000F8D63DEF6459D91698720BC2A499263C9B788A00407E511040EA10E2
            3EFDA21530C0CC0BBC744C0040D29027698097EC305F89B4B08B7C2FCA1E2A00
            70BCD50A5FA70A469391331A0CE8F6CD1BF3F169FEF4C952CBD6AD5B3FC3FB30
            73257CC50E0CA13043A883C17F003879720B2C47046172F3012C2DAD83AFFDDC
            494706803C2307C9F5D22A3CD24B17C86C1D88D4AE0565A51E19040A007844E7
            7A819EB006090E2C03C7D46A26083ECD84395D2C660B1A191D41C3438368A0AF
            5F973F253B6EC5F2657A0036AEB4229B71246DFAF4E97FC6977422E94B7E7139
            2414E2ACE037009C3A797233CC3A2819D10E009DF8830F5CE0804CA683E4172C
            1505520E165FB89D19C4447835230864362269DD2A5C7428533689D7886C8208
            98905C34101038E47EF1189FB05AADDCF0D0101AE8EFE37A7BBA755D5DD7F4DF
            F9E6C309361B6F95AEE0106025215A97B162C58AD2A6A626A88CC3A43FE02BC0
            47AF210904BF01A0FCD4A9CDB01E1784D10038F0D4BE8DF88E31DECC44089A5A
            27302DCD44847CC40C5F681BB10E26A3113DF3DC73E27C1E89894966493F99B6
            B0646666EAAB6B6B5A9ED8B7AF04499319001042AE78F01F00CACB6F82895721
            8C00A0A2F444C6B22F2D2DCEC8C808F6737B2C64BD2358EB08267581390D6EBE
            F966E98B7679F2065AE0E8426BABF879FFE5B636D3B65B6F85C99FE06B76281E
            081082CE0A7E0340050640AA060056AD5E591C4ACB12B92B24F7030060568F2E
            0C80C58B1723576086299060FA23000930455363A3B0EB1BDFF87D5F5F1FCC02
            46FC84A0160FFE034045C526987B1AC2260B00C8641E30AB595757174A4D4911
            41E04CE0A5CF9831C3210D6091DA9A1AF4E1871F9E7EFD873FAC42D24A89B49F
            10D0E2C16F00388D01903289000076020680595C060100DDDDE24C6F5ACB6012
            514F7745A765C0D7B6B6B4A0AB972F8FDCFEE52FFF1792FC04230A70F1E03700
            549E3E7D234CBF0F61340056AE5A11960000111D40FCE28001C00F80790EEFB8
            FD76E4CC82703E3F3FDF7982F2AC375054B435370B7FB773E7079861600A7028
            1E02D2B8E43F005456DE084B9242180D80152B96872D00A0080000C07C4E0000
            98E4EEB6DB6E43CE6C086C018BE5C21C6FF1F1F1B0881E8A8D8D7598F80A26C5
            026089CBA38D8E8A615FBEE38E3F0C0D0F5FC15186910404281EFC5234F80D00
            55959537C00A241036590040D704444710FB015BB76E55E6B6F28500688C66CB
            F998287D0E169845F91A72AC39F814040C001E08710421A71210C0D476F3E6CD
            43A9A9A9624E27EB03C390152802C06984B8506D842AA17AF233C93E52780A76
            2AE7CF9F8F962D5BD61E151333ACD7E913F63CF460DB7BEFBD07738A83B3488A
            059FCD2DEE37005457555D0F8B30490F48F9002B8BC31600823CD13B290A20B7
            C20B860D9801E81CD880CC694836F282B50040268024D7415A1555D5D52929A9
            C6D8F838FE3B8F3C32BDE14C1DB762E5CA4F7074F00F4813B34F98C07F00A8AE
            BE1E16A58630875A40183B8120BCDC510020206D03649FBC44D90E487A769D72
            ACCEF94408B0C8CCA1D5B5674E25A7A599A0170A56B58F898D13AE9B377BE1DC
            79F33E44525F43E06712773B4119003535351B611D3AC9087600AC0ED36AA05A
            048DD63F122EDBC1E3340100E00C36B5B69DC8CCCE3100CBF0361BD0098C8C44
            CF3FFDA4F0D7BFFE153AD860C6649FB080DF00508B0110AF0180B56B574F0A00
            F84B0000172E5D86A93047ADF8E55BCD66E50DDD79C76D50AB80D6557101F590
            6680DADADA8DB0142784D10058B76E0D03800B8105E3010053A7CF100100C580
            D42D2EA03BB66F8579510100E010863600EAEAEA36C4A5A48B8BC5D20058BF7E
            2D03800B0100B45EBC24028087D575640080C8D3A242EB6A7FC8D702CE6000C4
            6A0060C386750C002E0400D0D276B1646A010600EF0800795A58E8620F03009C
            39B31ED6E3863035007CBD24254C490BBFCEA6A51DEF7C280900A0F9429B2600
            E4293101007D0C00943000782F7E03403D06408C0600366E5CEF730094CA5314
            CF9A354B7366EED6D6D6DDF04BCFC57CF2E4C967B06D61D83AB4C055E03A7CFC
            C8C848111CC7C4C4B42F5FBEFCED0B172E1463AF5C0C83F366B3390FF661FE26
            92CED2A54B7D3A1B38D402260500CED6D7AF8B4E4ABD00613400AEBF7E83CF01
            00D32DC3EF780020533263476A4B5F5FDF7A78D1A9A9A90E43D77B7A7A360030
            A64D9BF6C1F4E9D3EB4978474747A13A1D7F88D40E70611200E0ECD975D18929
            17208C06C00D7E0040890C80754E5E8CFA7CA53C77772ACEF98B162DFAD09D7B
            00005A6400ACF33300CE4F6A00DCB0D1F70090A7E17636E5B6D6791206D3F9E1
            A2E110ECD7D4D4EC1C1E1E2ED24A4B04404BCB6E57F7F185880068690D7F0034
            9C3DBB362A31A54D32B21D00B00A97AF0170FEFC79717EC6B973E71EF7F43C9C
            83F958611FE66574960676CED2AF5DBB56E4EA3EBE10004063738B3600A469D1
            C596C0D0074043C3DAA884E480006032894B0048938287370060193A0600E702
            0038D7D4CC0010A9327900E0C4076000702D2E0110563E00038057E20A00F2BA
            18D036D1E7CE0C48EE48C0AB810C00AE651C00C07CE0D070C500305965F200C0
            4953B0330090F512483BBBC5624987F551E018962181B0F6F6F6C2E6E666B131
            263636566CC6EDEEEEDE40DAF4972C59F2664A4A4A1F9D9ED6D2067438ACFED1
            D9D9B985BE0F082C5902AD8564E10B67F168515F43DF2F2A2AAA6FCD9A356FB6
            B4B414C3D227104616D8701B00D284F8E10100679D415A00301A8D71E5E5E5CF
            D0C675C7E020172F5E2CC2DB4ED8D732FCECD9B31DAE250052030000356DDAB4
            A324DEE5CB97B7984CA63C3500A0E510D6C681387ABDDE98919171A6A0A0A0DE
            1900E87B9063B29888D6F3B80280BC2A4A7800C05977B01600C86A480B162C78
            3B2B2BABDD1900483C721DAC9E82737C0BC951810000AD0F012EEC13E6D20200
            CD5C6A3D272F009C8C085203A0AAAA4A6C7F57E70A2D8393978AA9BF62F1E2C5
            1FD22F000496ED292A2A3A4AC7F5671140B30F80D166B3C5392B02C83D69106B
            ADB2E30A00F2B240930700C438603067E911EA24C6C2657E5E5B5B9B18865F46
            7B6161E1312847E995BCC88BA58F89A8C321770E0D0DE5E132DA88D3AA20F1A0
            ACC62F2A0EEBDA9E9797D742E2A9F5C3A06B21ACA5BE86DC8B8E439EA1B7B7B7
            504BBF490300678342B500E06ABD2977E24C269934B50067C3C25935D0B54C1E
            0038F9308401C0B54C9A6AA0B34FC318005C0B0D00F1F50B82F20DA0BC2614CC
            4E1AFA0070F6712803806B710500795D3CF854BC37F401E0E4F3700600D7E212
            00D2BA80E101006713443000B816378A000680C92C930600CE26896200702DE3
            F800B02820388161000027D3C43100B896717C005814313C00E06CA2480600D7
            324E1190F07EB800407BAEE0120C801B19005CC8A46100EDD9C21900C69349C3
            005AEB0530008C2F0C00112EAE0070E8E0FEE477DE7DB712850300B4D60C6200
            185F5C02405A161900D0137600E010A713C83D79815AC3475AB3875E07485E14
            8AC423CB2E9345A2C47460252FFB8A60CA3A4008D9D70D12EFE56C1D20AC8F00
            53F971E215B02433279E83B58C74E26A42E20AC5B05433FED54122E2D2CDF0CB
            49AB1E0B3A242EF98CEC61CA8AC802498B23E9729CB42A15C7B96D7078F1610B
            80B2D2D2ADF4BA818230762128FB8A5FCAD26F882CF9A6B50E2059194C5A11CC
            0E002A1CD14BC5395B07500D00CE1100F8A54A0B96C9E1E2866400482F587A91
            3200247070F67D8EC411EFE13D00D422AF0B1EF20010178E5CBD7AF5829FFDEC
            673371EEB14A270812ECCB85292B2CC9EF469D1659CDCB1E1F89F36FCA402269
            48AF515AB2C94115D5B548F326D4CA9F9CA28620BE3C72817C4F0765C4172910
            8D1CB5962E5385CBC0435E981B565AC34543CCC68D1B4FE2C34B781B0CD94FC3
            64E30008609D7560039D6C553B04884914DB8A9BA7C7484E1BA9E2C02F995F5F
            4785F1F23EB98657A5A1751CCC34C8F3F2D40673045B899D4372A24826E1250C
            00112E0C00112E0C00112E0C00112E0C00112EFEAA06922A9F376B4487AAA8AB
            A08A84C222D05E3F941F1A82C05050FF8F977F270B08489D1CEAE1F04D3F2CDE
            E460BC700482BF9A82338EFDED6FB72625A778BFD6BB472D87521B9056CBA172
            DA9E86DC002CA8B33247A766BFC0BE36102C0A653519B8EB6FB8E1CF485AB685
            ACE0C5DBA3871708FC018044FC53D072B93D9D274B6C7921547F01B4F5CB7D09
            74BF80D239C429FD09F673727F01E963E0496713221D4752DA8E1D47E27DE47B
            D815E1451CD96C5624D8AC820DA7B574666EC1AC59B3FE079FED45F6F57E95E2
            219C40E00F00A4E29FC2A68B5762C5632FD2203959E931244090DAFBA98E2129
            AEF2D2794127F61A2205003AAAE308A97A0E39A9E750B99FD8E3886420488F82
            60CD1E9104AC5633B298F066B5A0D54B16E624C5E893A64C99F2BF9815BA5100
            D7FAF5B5F80B00B3310062E4638E720ADD12C14ECF62AF20D575CCA99841DD73
            A802880200E51A1A0082604F17D901E0D0732801404016B399331A0DC86830E0
            93BCEEFA35AB529362A35217CE9FF779C7B56BB0CE2F2CE546D6F90D1B100404
            00F27800B741E00000B99B970200E93AE6A8AE6334663C010181CC00882E0290
            0404F9BB5BB168C109703C22C7F2A320090050F65BCC26583256181A1EE20C23
            43DCCE3B766419CD1653726C54DA9D5FFDBBD39F7DF6197C080BAB7999501881
            206000D04944A073270D050082941B550C601F0780A36831003D4680575DC3AB
            C62320D957401210E463490F58F413BECE0680E19CCF8D8C0CA381FE7E6E7060
            80BBFF1B77668F1ACCA38092C498A894975F3AD0FAA37FF9976A24F905340842
            DA2F083800DC290E1495047BB9CC0BBCC38B1719801A48A231780429395D0681
            948EEC500A8872FE085B8C2D02E097B7DAD0A861148D0C0F73BDBD3D5C5F6FB7
            EE9BF7DD933562348D70F20B4E8C8D4EFAE84F1F0EDE7DF7DD30E50B806014D9
            57FC0E5910041C003A1103649885B6C89EB8DD23278E9D521B40AADCAE0C2973
            A819880042D27032C5F3E7918333899422865411C70200CA8D91D11161787088
            EBE9E9D2F57477EAEEBC63475A7C429234C71F275D181F1B1DD37ABE515F5C5C
            FC1992167A061088EBFCA2102D12820300D127708E0087F25F2045020D068ACE
            91CC06760610E3D243C324002007BF40F407109D9E1D004ADB83FC62A1188095
            C2870607B89EEE6E5D57E735DDFA552B9266CD9E6DE5A8EA9F0E634AA7D7E947
            077A53703511DA0A0004C3C8CE042107828002E054C9F18C3FFED76F979315B5
            3D1571856EABD5AB6B272264F02AAC126E329BC5AD68D122B474D932F17C6262
            92591E1FA6945FF953F3A3D66FDCF83B24ADF60DD5448746A35001414001F0DA
            0BCF6DF9FABDF7A2B8B838AFD2066F9C5EA23D50425E3EACE63D323282FAFBFA
            609650B469D326511FADF6AEC1A12134DCDF2FECBAFBEE3FF6F6F676E0A02114
            8235848002E0CD1FBEB6E5B9030790B70C102C11DB012C16980514E11A00EAEE
            E9417D1804B76CDF8E4815553D22B5179F0760B4B5B4A0575F7FFDAF7FFEF39F
            4935119820646A080105C04FDEF8A1088070139A01E0C38D1E0C808E8E0E74C7
            EDB73BBD66083300B044747434AAABA9417FF9CB5F6A0F1C3C588EEC7D082151
            436000705380010000B0B42BA6740500CEBA3B868787C5979F9898285E575F5F
            8F2E5EB8D0F1F5BBEEFA04D9DB0A481F42D08A04060037853000E4EC5ECC00D7
            AE5D43B7DD769B4B00C4C4C488000001C7F1F2A54BA8F9FC79C36DB7DFFEDF68
            6C5B415040C000E0A680B3E70080CE4E74EBADB722DE66D38C0FCE22610022C0
            2257AF5E0510D8B6DD72CB6F7150D03B921800DC14C8E90400E00002036CC74E
            A033008C8E8E8ADD893400C42F56309340F1D1D4D828DC7DEFBDBF936B080404
            01AF213000B829000093C9A400A01333C0CD37DFEC1400506300D64849491973
            0EC2BBBABB516B73337AE5D5573FFAF4D34F61712D6830223584808D2D083C00
            F61FF0E7F3F84D080080DA0900B66CD982C3B50160C6653EB040464686E6799B
            8DC77EC2103AD7700ED710FE5CF6F22BAF404712B41504B49A1870007C7FFFFE
            09DE2138020080974A0360C3FAF5283A2646333E388DFDB8B690939BEB344DE8
            6A1EC54CD1D8D080EAEBEA2E3CFCAD6F411F82BA4B5998340078EBD0EB610D00
            70E2C0BBEFEFEF475D5D5D68E99225283D3D5D333ED8F5CA952B2877CA1464C0
            BE0300421A576056BE28062711D2055FE12A8EDBD2DC3C70EF7DF7410D014000
            1D4D7E0741E001F0831FF8E339FC2E040040EBC000DDB80C9F3973262A282870
            7A4D5B5B9B0896848404B1F91BAA85311463407A000AC22A204D0D0D9687BFFD
            ED5F23C7B602BF39860C006E0A690E0600406B2000001CBCC58B17FB247D0018
            00A1F4F871D476F972CD638F3D06CBD7A80797F81C040C006E0ADD1F00350168
            0E86B0356BD6F8F43E7FFCDDEFD06D5FF9CAB5BD8F3EDAFACB5FFEB20EA9869F
            33000449E8FE00F0034831B06DDB36B77B27C96028F5A028723DFCFEF1F7BF47
            B77EE52B67399E9F929D9D5D82EF771149034E95BE035F828001C04D013B4179
            4D6A02D027002C0065FA9C3973C4970A340E20010711CEC13E341841B101D740
            1CD2134A8301B6A8A82854585888606A95CDDBB7B7596DB651E3C8487E4E4ECE
            4738081A8BA0D9D8E7454160AB81615C0B00A11D41020270F28011200CC06193
            1B86E04593174EFF928D16F20E20CE7F1E3E8CAE5BB1B2FCC97D4F6425252699
            FEF4C7FFD1EDBAEBAE2FF0E91E642F0A7CC6020C001E08C9E1A467105E3A0103
            3412C139D23944723A0D003AF74B5F9D28D3E429C079E7A73F452B375E7F521F
            15CDAF282E8E5B59FCA5DCB4D45418687A1949AD853EF50582D01218DE0020BE
            008000723CBC78F2F26183F334BDAB73BE9A01489ABCFCFDC18FDE7803DD78CB
            6D25304031263A5A983A355F5F38637AE182050BFE84A431868405427392A8C9
            0C00925BE1651136200D3C646818B1A7D60B7736128AA40769BC7AE000BA7DD7
            378ED9AC361E06A54663102C9C3B276FD5CA156730DB804308CDC5E10B80E7C3
            B43388084DDB74EE25612A5B28BFE3D50008005E7CF659B4FB916F7F6EB25804
            DEC68B134C828398959A3477F9F2E5FF8BA42E64AB7C2D03403084AEB66985BB
            F32924F1016801003CF7D453E8EF9F7CFAFF70F12298CD16416E2A16A204DBCC
            75EBD61E43528DC024DF2FFC00F0C24B11B104B0C74218E4D97DFBD0132FECFF
            CC62B5F0560B2E626C56E905998D3357AE5C7902EF5D45E10C80170F1E0CB069
            C34B9E7EFC71F4F44BAF7C6AE36DC0003C196F60191D9A858B000680C92E0080
            670EBEFA297EF3F277A982580C584706672D5EB28400409C7925EC00F0AF0080
            975F0EBC55C3489E7AEC31F4FD575EFF14533FAF2C1680DF91797860D6E2C58B
            150084653BC0BFFEE3A12D3F600070294FEEDD2B02405C369C1794061FE360DF
            ACEBAEBB4E04000EF27EEE25953000849838038079A87F56D1A245E10F80FDAF
            BC124073869F3CF9E8A3E8594D000C60001431004C76710600EBE8D0CC050B16
            94E1DD2B0C0094D4D4D4EC86DFD4D4D4FA19336654A8CFB7B5B5150F0C0C14C1
            FE92254B0EFBF4E67E106700B08C0CCE5CB87021000018C0E4ABFB051C00075E
            7DD5A7F72B2B2B133B17B2B2B28ECE9E3DFBB8FA7C7373F3FAEEEEEE2DB0BF7A
            F5EA906F85FA1E00E0E5D7B40030030300968C6100A085016062C200106232E9
            01F0D26BAFF9F47EA5A5A50A00E6CC993306004D4D4D0A00D6AC59A300A0A7A7
            27EFFCF9F38FA8E32F5AB4E8CDE4E4E43E3A6D67326BD6ACC353A64C69F1E5F3
            ECFBEE773501809DC019D8096400500B794929292915999999F5EAF3F845170D
            0E0E16C33E01C0D0D050FA993367F6C2BE4EA7336664641CEBEDEDDD802D2ECE
            5DF3A52F7DE9506C6CACB1BABA7A3749C7603014C26F7C7CBCF2C2A74D9B7614
            DFB3DD97CF33A901F0533F00E0C438B99496B53200C835D92AD638535FBF03C0
            121515D5B772C58A37B5EEB39662117FC813931E00AFBFEED3FB9D3871C26D06
            58BB76ED4BF435D9D9D947D5F1BBBABAB6D071D5F75187FB5A9EF8877FD00480
            CD305C307FFEFC538801C051E897E9CC0750BF54728D2B6100F036C1710070D0
            C70028A10030570300E72900AC935F1EB9669D072FD39B6BBC91C7273D007EF8
            439FDEAFA4A4C40E80B973C702E0FC793B00D6AD7B89BEA6B0B0F0706E6EAEE2
            D4994CA6B88A8A8A675253532B706DE043ADFB9034FC258FFFFDDF33007822DE
            0000D700760C0C0C887E415E5EDE87B83A5781FD84F4BABA3AB166004EE0AA55
            ABDED4BA4FB000C01B460AE6CD9FC700A0166F000082AB8FCF906A9F5AB45E72
            D001601C993E6FDE3C9867308C01F04F6F6C79D9C70080170CBF494949ED3837
            8F6994696F6F2F1C1E1ECE837D354020D75FBC7871BDD96C166779C8CACAAA28
            2828A877751F2D90F9521EFBCE77180022591800225C1800225C263D005E3974
            2880E60C3FD9FBED6F6B0240308D4EC7FE0703C0641706800817670060454084
            080340840B0D0041FCC30010514200207D12C82B00907D0018F57C850160120B
            0340840B0340848B3300601FA040F601180026B3300044B84424002A2A2A7693
            61D76AD9B0618343FFFBB163C734C7F3AD58B1E2505C5C9CB898736363E3FACE
            CECE2D3084BBB8B8F8B0FA3E39393947B1318FD3E939BB0F097716CF9D6BE8FB
            198DC6B8F2F2F267D4E144221A00F4987B0208DAE0F4CBCFC8C8380EFDF8C3C3
            C345248CC40D15005CBC78B1086F3B619F0094C48151476BD6AC79539D464402
            A0A4A4441C9DA3F5B2C70BEBEEEECE6B686878840E0F150080949696EEB55AAD
            E28093D8D8D87693C994E72A1D6700B019460AE6CF9FA40070F765AB0546F4B4
            B5B5AD27E3FBD4000083C3D73B24FEE5CB97B7C00BD002C0ECD9B31D3E1D6F6E
            6EDE4DA749E2D12C959C9CDC4253F87860224217576A710E80E119F2A0D0C805
            00BCF09A9A9ABDCEEEAD0680B3785A00182F4D57F16014F1E2C58B3F7406009A
            A5A0E82A2A2A3AEA2C2D060037C2402027420EC4066D715604F88301687D68A0
            41B8BB0CE08AD5220E00B5B5B5E210EDA4A4A4FA65CB967DA0369AFAA5C2C79C
            EBD6AD531251BF043A2C103E001DAE15A7AAAA6A27EDA882387300231200C468
            EA72D11900E8B86AAA0F240080D6B1FFB185AEAD68C521ECB460C182B731C8FB
            4815B0A0A0E003AD11C8110580F1CA5FF58B75B7BCF62700B4243F3FFFC3C2C2
            C20A67D7D0EC565F5FBFA5B7B777BDD63D419C0140FE3A787202005E88565A6A
            6A272F77686848CC75E9E9E9F56078088363EC1388DF06C0B700384E1EA65A23
            9C27D7B6B4B414E32A591C8947D2835F75838C3A9C1CD3A24E9FBE86DCCB55DA
            EAEB41221200CE9C2277AA82934D18002861007000C04C798288C90300266385
            0120C2C51900E48922190026BB300044B8B8010018156C9CE06D146100083119
            C70720B5000680C92ACE00601E1E9C5954B4900160B20B0340840B0340848B33
            00988606662D5A54446A010C0093551800225C1800225C9C03A01F03601103C0
            6417170028C400208B4631004C566100887061008870710600E3605FE175D75D
            C70030D9850120C2C519000C037DB3172FBEAE1431004C6E710E805E0C80C50C
            00935D1800225C9C0160B4BF77F692250C00935E1800225C9C03A00703600903
            C0641706800817670018E9EB9EB374E9D213285C01C021A4FBB77FFEC7CD0C00
            AE850120C2651C0040117099016012CB38B500680A660098CCE29401B013B874
            C9121810020030F8EA7E0C002126CE8B000C80A5610E807F3A7860C5F3070EA4
            66656505D0A4E1235D9D9DE89F0FBDD1B5F7D9E76A9CF800A408083300E00DEF
            EAE04EF87EF89ED27DC57FD23E47C279F805BD7801F108F6050EC9E1D81AD239
            1C9197AF8174791E71242D1E9E87A401BB488C239E93F441E203EBE012BC2FA9
            86040C52412745107452385C88C3756202F898876B75101FCE2388C789F17472
            5C8039FEE5214DF91C12C3956BC474DC32B8F83CD48A21610D00B083F4C291FC
            F26520D801201EF3040C1200381100F6974E01802771C1523A5E7ED10440C87E
            2FE700905E84F492C49785000002125F9E03002480C8002071C5978C6FC1E908
            10A86BC8CB2700D021E95E923DDCB6A56416E9050DF776CF59B62C0C01607F18
            81D36000659FB7877363F7A517AF0500F1C50A2203D819C47D0088BFE2BE1D00
            CA0BA61840640839373BBC70C2020A28C83EA21840620641B68F57060F3700CC
            6ABDDC9E6CE3790B0500447232C5008E2F4DFDD2EDE71C01C06300284501BC3A
            85F2351980BC7C0200E9E5486A39BE3409003A2587C3CB9B1000C4FB1066F024
            F7AB05D702E6E15A004C3615F20D4189F867FAC71F7DB43A7FEA341BB8318AF9
            A917211D927B73CA1F72462C34A5329E0EE594D3F63494302A587D9DF609EA14
            A10749492A9772CA8F83A1A49C2C68DC4A90E373F44D85318A786653FDCFDF7D
            A7F7CDB7DEAAC287D7B05D2CDEA5A491B61F00108D7FD2F09683B70404FED618
            BB33F140E005C10B1FC05B17DE86A186E0ABC4FD010078D951788B957F398428
            0E90A3C99B80ECD9883E06D151D7086E5C43EEC1CB1B9D86D6B180ECE014E430
            6E9C6B029D8640C5B1E2CD4CEC23F8E8C5F91C004CC24B1800225C1800225C18
            00225C1800983089606104C08449040B2300264C22581801306112C1121604C0
            D93BD149E78F9EDA67BD8CA1215AEF8174D291CE39B2EF547CD5C1C5C43D0979
            0290333FF48A42AF328C308BDBBE6D5BFAF5D75F9F63B55AA531A6BCCF7AC699
            782164CC0E8D254EA793BAB3F57ADB175F7CD17DF4E8D13E7C088B9C406F360C
            6D208480909351328C0CFC2FE1400050DAC3F82218649672F42F7F593F7DC6CC
            517D5CC2D560E843EC450F4C9307AD131473F638D2C8471246AE91C7312B23CE
            E8A1B2243D69BC877DA03B1D0F492323C55FA28B200F8497A990CE90F2A848A4
            A42D5F83101940AF3C8BA07A2E6AB01DB20FA9757C3F08BE5D90C7E28803F8C4
            1BD9245216872D4D498C4E4F49884B7CE3D0A1AA5FFCF2979770F828DE604423
            900121029A0C1C40C988C07F120E0400257F3CDE52F09659565ABA32337FFA99
            60E842DB8ACACC64BCB9A23219EB4E853B2500E57A2513CB999ECAB0246D4F08
            80D295E3C90055071DA45F9A00E8D1B7CA3D3D2000515FDE26F9F9361B9C403C
            3E07F7488A8F8F5E593427DF6C3470870FFFAAF9A9A79E3A8B242280B1ED4004
            30D6CD8618190454C28100A0F48751C5F09D41D6C9B2B2651979D3EA557102D2
            0E406556E5D672A615F7E538525CDA2B2025BCE335EE12009D5995CC2B086309
            80260879A8BD7C1D9287E2CBDF4920F958A008405006E72BC445677E721F07BB
            93C72304C08B1F326272B2221B26009BD58AACF81CAEAA21DE6A4333A7E6262C
            983B2B4D0F5FD958CDD19F7DFA69F7030F3C50353C3C3C84EC5E01540F800C68
            CF8011819F64D21080F8051EE2541F62F856ECA5A2745B294CE090AAF497E208
            C48D5632AB420682A307A11477BC94E1E4ECC4A9AA0A8ABB4E3EA852D214D3E1
            393531C9DE3895711D094026209A1CA8E7D22000950740BEAE230400A53E44B2
            58AC9CD56615AC2613325BAD9CCD6211CC163367369BD02D9BAECF8A8D8B132C
            56AB252E3626361AF109E71B1B8D98084ED7D7D7F720BB5700ED058408D46440
            E914E2000E71093F023879725946EE546D02907E1426403EEE21A0EAFF52DA02
            FD519BF2052289ED50FF97AF1B93A9E5AA0155FF57BC0787529FF222A47834A9
            20E553DBB15513592FE25950FADBD3567B008A53E34800BC8A00743201F07223
            2C544B78AB05E1CC8D49C08C2C98004C660B67341A90D52C11C092450B93AE5B
            383F7ED4683210B68EC22E415C942EB9A7BB4B78EEB9E7CEFEE637BFB9888347
            904404E015D8E48DFED48791810F64321380DD2BF0915019C86503A0124F18D3
            B826674692E915179ECAB01471A81A00891E3C6FCFB876F2805934C636E6F163
            75501A00E97602F97A795F79DE316D02C8FEDD1A22152F2000B033FCDA6C5664
            36E3CC8F89C0643472784346BC998C06DDE8A80165A426477FF58EDBD2460CC6
            11A2AEF27936BCE898E8649C46F42F7FF1F34B723B011001AB1EF849C28E004E
            9D3CB9343D77EA59551CE704C0C973714C90071C1AC8D4B61B53D2AB1B0015F2
            E068737BDB0028F094D7A19C73BC8EE865CFD4631B006902706853D0ACEAD04F
            EF9071A5D32209200E677CC16CB6C8A5BF99338C8E72A3A3C3C86430EA460C23
            9C717484FBD6430FA5E1544CBCF26533B114A7DC30312E265EE06D71A7CACA86
            76EEDC593530303088EC64401A0D59F5608212110440FF78AD888B06407BC31B
            89EA58B2DA5D773A933ABADD76975E401A8421FF920955E47D643F47B72520BB
            E740EAFBC869FDDF510F7B7A5423A2F44CEAF7E2681DE2D240C96FB188A53F32
            994C38C38F2283715437323C8246474774A32323BA3BEFB82D292F3F5F305B6C
            168E5856B0CF18228FEE122756D147E9A3A3119FDCD1D16EDDB3674F4D494909
            4C8B008D865AED04AC7AE0A1841D01949F3AB5346D4ABE4704D0585F9F84EB9F
            7ABB4BE00D1368D5FFC9FD550D64B2931C9790C0CF9C3DC780A48CC7213B6110
            775F5DA7A7BD0787063CBA0110A9A6BA12A7D0538D2B9013B3B7F823C19E2B1C
            09C0F11AA42207378D235601B06B022DFF660B7800400066ECF68F20C3A8811B
            1D19E68687611BD4AD59B9227ECDAA95D146B3D5A86864371B5184A7AB6F30B9
            60B45E48351A0CBA7FF9D18F9AFEF19FFEA9198D6D2760D5030F65D21200065D
            D43F1EF8C1BACCBCDC98BCA953516C6CEC841C004F05EC2A7685E14D6C240B71
            3BFBEA99C5A9DA785E6E0FB089DE00D94CD02B6036A3A9F87DECD8B103F5F6F6
            2A24041E83E0E88938BB098A8E8A4231D1D1C2E52B57AE3EB8674F99D56A1D46
            52D5808C34A41B0C1911B890494B00E5274EA47FF1E95F8AEF7DE821949E9E8E
            A2B12319680200E1236898322100C8F856B127C0226678680434180CB80A308A
            464646905EA743B7DE7AABE82928552437ED04690F0C0EA281FE7E141B1383FA
            FAFA20DDE1EF3DF9E4DF1A1A1A60B8B1B3C145AC7AA021E14700E5E54BD272F2
            1A54713409A0F46F9F173FFABDEFA1E4E4E4603F4644882B0280CC0F1BAE0688
            DBDF7DE52B5E93E3202600C8F8999999A26777F5EA55D4DDD5055E84F5BD2347
            2A7EF18B5FB4E168E015D0ED04C42B60D5034A263D01EC7DF24994949414ECC7
            881821AE3F71FF8100A0F4272400991FBC801B6FB84124666FF00769F4630F00
            569948C4EF56241C7CAFCECE4E71858591E161E17C53D38547F7EEAD50550F68
            2260D50314860450810920951140C80A5DFF17C703800780EBFE840070E64443
            434368F9F2E5625B80375E0010C0E0C000CACACE4689898962181989088390FA
            B177D0D1DE8E86B0A780EF35F0BDA79EFABCA9A9A91F391201AB1EA07024808A
            8AC5A9D9B9E7547118018488408626D500BA0AA010002EFD81040A0B0BD18205
            0BBC220048630013005401B4DE2DF140A0D1B1A7A7075DEBE8807B9A7F75F870
            E9AFDF7BEF0A927A0FC8D788115D3D6004C0C4A7427A01483B00644271230420
            5703B2B1FBBE62E54AE9FB010F85100034EE120F608C1E486A58043D807CA0CA
            00ED04C3838342FDD9B3E7B157502D570F483B0199A320A2AA07614700A73101
            A430020859210D8190F961030F40F402A01740EE090002888B8B4337DC708357
            0400694023607A5A1A4A1AA781978C69005232C944D08BBD02A842F40F0CF43E
            F3ECB37FA3AA07E01590B10411513D6004C0C4A7A2EE09500840D51300E7A02B
            D01B0280B4BABBBB516A4A0A4A4D4BF348372002A89A8CC8BD11EDEDEDC8383A
            6A7AEFFDF74B7EF5AB5FC164256460116927D0F208260D11841D01549E3E7D5D
            72D69446551C97DD808C000227340190760093DC08488F058086C02FDF71C7F8
            037F3404080508201E7B1199DEAC372D2D486A6F27C0550348CF303ACA373434
            9C7DF4B1C76A90633B015D3DD02482702581C94D005FFC9511401084B401C02F
            ED01C0263602E20D4ADF4D9B3689EFC6530C42BA308A10BC88FCFCFC09E94ABC
            02D0B10B1301540F3011A0ABEDED9DFFF0DDEF7E3E303040BA110911B86C300C
            3722083F02A8ACBC2E3933C72D02380104B06F1F2380008B7A2830642E2869C1
            03808D7800C5C5C5282F2FCFABB1003018A80797DA3010C8220F3A0242B08953
            91496D1044172D81385151518AC7A2C3A0898A8E467ABD5EBC06BA12A17A72AD
            A3C3F0EC73CF1DC58440262B21D503F5FC04BC2AFDD0CE58B2300260E273D1EA
            0A34D16301640F60CE9C3968FEFCF95E7505927106B0894BB3EB74E246EFD3C7
            6AA1BF5B203A93760BDA5B01FD87FAFB51FBB56B4DF7DD7F3FACD00D1E01A91E
            A81B0CC3CE1B083B02A8AAAC5C949499735E158711400889BA2B90AE0618A89E
            00E8C75FB16245487E2F410802F4FDECCF7F469BB66EED8CD2EB637EFCE69BAD
            070F1E04FCD1230C49D520ECAA058C0098F85CD43D01F47800BA3700E26CDEBC
            598C17AA020470F4934FD0864D379D4F494DC1750C3EABA7A75BB77DFBF6CA73
            E7CE399B9B206C48801100139F0B4D00A4DB4D3D2A9078020B172E44D3A64D53
            AE7126CEBEE474160EE304E03E709E8C08D48A4BC27273739563186014131323
            1E83CE257FFB1B5ABCBCB8293925194A7A14C5E9636C366BE66FDE3FD2B5E7E1
            876B71D000B2CF4DA0D57548EC1272996D521300EB05089ED0ED00EAAA00F106
            0809D0DE01210BD2A0471A1489C82FDAE198D4F5B5E2A87F5D098943D2830641
            D0EB8FBFFB1DDABC7DFBB95B6EB9356AEEBCB9B1F8B96C569BCDC00928EBCAE5
            4BC2AA55ABCA0607077B91BD5AA0D56D284AA89140D811407555555162467693
            2A0E23801013DA0B507F224C4F1002995EFC68483E260D87E43A422444E84C4A
            1FAB1BFB6852182FF32BB331C93AD3F70392FAE0BDF7D0BCEB16D72426279BF4
            5151426C4C9CB07DDBD6D4850B1724D978DE6C181ECEB8F7DE7B2B3FF9E413F8
            CE00AA04E00D68B50B90FB844CA60B3F02A8AE2E4A4CCF729B00F63202088AD0
            19892601420424A393360231D343C3A1AAE4A7A72E5332B47C0F52D26B95F66A
            4F813EAFD69308211BBA77001A2BFFFDE73F474B8A575426A5A6413D5F80754D
            C03B88C264307DFAB4A84DD76F9C8AE327EE7FF1C5C6FFF7E31F033661025332
            7620A449607213000C0566041034A14940C9D0AA29C34866A7333D9D11B5F0A9
            550D509F7327F3D37A121DE9FBC2318C37F8D95B6FA1B5376E2A4F4E49338963
            0805718E4281C324A00732888A16A6E6E5C62E59B470CE4F7FFAD30BCF3FFF3C
            0C5527B318AB4980DC3324325ED811404D75F5C284F4AC66551CA704F018FB16
            206842BBD644B43299BAD455EFABC5DD3ABE275500B58E442F20807F3974086D
            B9FD8EB28CCC6C938DB7C2BA0C026FE3A575119158DD103D0298A26CEEAC19F3
            7EFD1FFF71E585175F041280C641D226404880DC3324325EF811404DCDC284B4
            4C46006124AAD987C79CA333A0A7787495F15DC5D1D24FEB17BE1E7CE3D557D1
            97BF7E576956EE14236FE591151640E56119445E59160D4800EE131717AB4B8A
            8D2E7CE28927CE7EFAE9A7D026009E00F40E909183F47D839EF9C28E006A3101
            C47B40008F3FF514238010155F62CF1713BE6A9110CC3BF0DA810368D7030F9E
            989237D5C8DB6C828DB70956EC01C03E10002FCEBBAE344E0AC8629CB97BF7EE
            96C6C6C66B38887C6A0C558190FB8A90110013264E8454015EDDBF1FDDFBCD47
            4AF2A71518AD56AB60B359C52519784C0436AB4D5EAA81AC1881EB05A6D15977
            DD75572B26800EC40860820A4E90009E78FA6946004CBC162080577EF00374CF
            C3DF2C993A7D8641CAB4D25FABE40108F2EC438A0B62191D9AB96BD7AED673E7
            CE0101904142663ADD50C8FC20E14700B5B50BE35333DC2280322080679E6104
            C0C46B010278F9C517D1EE47BE051E804800829C7DC5CCAF9193CD43FDB3BEB6
            732723009F28C808804910852680690533690210C46F18B408607860E6D7BEF6
            B50B0D0D0D0E558050C9F4B4841D01D4D5D52D884B496F51C5D12680635F14EF
            6304C06402020470F0851734098072061CC4843D803BEFBCB3552600E2015818
            0178A32023002641146F0800AA005F6504E02305550470061340AC0704F0BD67
            9F6504C0C46B1109E0F9E7D1BD8400A47C3F0E010C6002F82A1000E9066404E0
            B5828C00980451BC2100CBC8E0CC3D0F3D74B1E4C48976C4DA0026A8A00F0820
            D417072D2B2BDB4F1F6765651D9D3D7BF67177AF6F6E6E5EDFDDDDBD850E5BBD
            7AF54BC17EAEC92040002F01017CF3118F08E0A1871EBA74E2C489AB88EA0560
            04E08D826A023873667E6C725AAB2A0E230046007E112F0960062680CB8C007C
            A120238071851180FF841140B0155411403D2680180F08E0C9EF7F3FE409A0B4
            B4740C01CC9933C76D02686A6A1A43006BD6AC1997002E5CB8503C3434546830
            180A799E8F23E15151517DB1B1B1EDD86E2D3367CEAC7076EDC0C040D1449E7B
            DAB46947333333DBFD65575F087C0BE02901584787663CF8E0838C007CA22023
            8071C51302B876ED5A615B5BDB4E3AC38F273A9DCE883D925FD19955EB9E9ECA
            AC59B30E4F9932A5652269F85B1801045B4115019CADAF9F179D947A41156752
            11802F448B00EAEBEB776097B6980E03B2993E7D7A052EF18D24CC6432C5E16A
            C516ADB8E31113104C6B6BEBEEF17409176104106C052740002781009E7B2EE4
            090003C5E704B076ED5A874C072E7B7B7BFB0E720C6EFECA952BDF749506AE1E
            A4D7D5D5EDA5C3E6CD9BF7B62BB7BDA3A3630C01A87509270102388031C40820
            580A4620016467677B5C05E8EAEA7270C7D599AEAAAA6A37D4F527AAEB78BA31
            0240C866182E78E08107AE3002F085826A02387B765E7462CA05551C46008C00
            FC228C0082ADE00409E0295C7F0B750228292919430073E7CE759B00CE9F3F3F
            8600D6AD5BE790E91A1A1AB6F4F6F6AE27C7500558B56AD59BEEDEC35D010268
            6969712000B52EE1244000FBBFFF7D460041539011C0B8E20E0140C35E4545C5
            337418B4EE171515BD9D9292D2A7956E4D4DCDCEE1E16187AEBEF9F3E78FDB06
            C008801180EF14640430AEB843002040029595958F39EB028C8F8F6FB1582CE9
            56AB355DEB7C6161E1E1DCDC5C97DD768C0010E20D2305F73F703F23009F28A8
            228086B367E74625A6B4A9E26813C0F1BF153F1D060470FCF8710702C8C9C9F1
            98003A3B3B1D0860FDFAF54E331D1001BE660B0677F178694355A1A0A0E0C3BC
            BC3CB7FAEBDBDBDBC710802B5D425D80007EF0ECB39E11807164FAFDF7DD77E5
            446929784A8C0026A46004100093D0154600C15690110093200A2380602BA826
            808686B95109C98C00980444BC2680FBC536004600135690110093200A238060
            2B38410278E68517180130F15A80005E7CE6198F0840308D4EBF0FAA008C007C
            A02023002641146F08807900BE5490110093200A2380602B38C15E0046004C26
            225E1300EB05F091828C00980451B4080009B03AB84071814ACC86E98F3EFA68
            FB471F7D04CB8333029890828C00980451BC21006804DCBB776F074500C3485A
            17800FF6F3A825EC08C0A36F0118013099A04C8000AE6102B88C18014C504146
            004C8228DE10006F1C2978ECB1C73A1801F8424146004C82288C0082AD202300
            2641144600C156702273027A4800F5F5F55B0C06439E27FAC5C7C7B71715151D
            751567707030BDA3A3A308E6E0D7FADE1EE6E08F8B8BBB9A959555EFEAB3DB96
            9696E2BEBEBE2277EFAD7E9EF4F4F4FAC2C2C20A7FA6E9697ADEDCA7BBBB3BAF
            ADADCDE1F367BD5E6F5CB66CD907CED2D3BA06A4B8B8F8B02B3DBC26006804FC
            F86346001356308004505151E1F1BC7930898633100188E969B8269A666363A3
            C377FFAEEEADF53C30CFC0BC79F38EFB334D4FD3F3F63E46A331EEF4E9D36326
            37993D7BF6613589D6D6D6EE50CF7D90949454EF8A3088300208B6824124800D
            1B368C99C8C25D806B812E3F3FFF4375090C40C671EF33994C79E3C56504306F
            CC24295A764E4D4DAD58BC78F18750EA637DEE7387249C092380602B38819581
            3C258063C78E2933F34CB414BE78F16211CEDCE93863A79BCDE6749CA18FBB02
            1D7D6F904064567FA4196802008159889A9B9B778F97A637BA7843003603B401
            ECEDF89811800F140C1001A841E4CC45F406E0D006804BA3425CF78F83760008
            1BAFAAE14E66F5540291A637E9C1E4A4595959C7E8743C210022A74E9D7A44ED
            4911292828F8006FF59E3E9F7704303CE3B1C71E6B6704E00B0527B03AB02704
            A07625B55C70107709C099FBE9AE4C160280CC1D1B1B7B95BE06DB24DE594625
            76F786009C3D0B34B2AE5CB9F26D6F9E8F1140B0150C000140666D686878841C
            0368D7AD5B77482BAE3B0400EE3FDE76D261106FC68C1947714937664A6DF010
            6A6A6A1C96E08A942A8056A685B6174F08C05983A05A162C58F0B696FD5D0923
            80602BA82680BABA05B129E92DAA385E138016789C95FE20EE005C1D0766D65D
            B3668DE6221CCE3C85482180AAAAAA316B0F7842005A040225FEE2C58B7F8549
            FD7675DA191919C73DE996F496009E78FCF1F6FF65E3007CA0A09F0840DDE8E6
            0B21BD065A253A11C810AE5C603ADE78C4120E04E0A990167A77BA0131793CA2
            1E53A18EA7D540081EDEF2E5CB7F1C17176744E3883704008B83EE7BE2094600
            3E51300C0980883BE300480318F6128C57AF5EDD419F53375C4D5602000F097B
            5D47E96775751F186CA4B615A4B16CD9B2B79D656AAD064277DA151801045B41
            1501D4610288F3030168F5F98F27BE488349688BB704F00426003614D8170A32
            02601244F19200666202B8CA08C0170AAA08A0B6B676617C6A46B32A8EC70400
            2E267DECED609589A6C124B4851140B015F413013061E28E7843009691C199FB
            F6ED6304E01305D5045053B3303E2D931100938088D704001E001B07E0030519
            013009A2300208B6828C00980451BC2100D3D0C0CC27BFB78F2600322B302300
            8F155411400D26800446004C0224CE0840A032BF9A03C0033870E040C7FBEFBF
            7F091FF62346001350504D00D5D50B13D2B31801300988784300E6E1C1992FBD
            74E01A26808BC85E056004E095822A02A8AEAE2E4A4CCF6A52C56104C0C42FE2
            2D011C3CF8D2B523478E300298B0828C009804511801045B4135015455152566
            643302601210F186004C4303B35E3EF852C7115605F081822A02A8AAAC5C9494
            99735E1587110013BF88B704803D800ED606E00B0519013009A2784700FD9800
            0E3202F089828C009804511801045B4146004C82285E1240212680764600BE50
            504500959595D72567E634AAE2300260E217F196005E7EF9E58E23478EC032F6
            8C0026A42023002641146F08C038D857F8CA2BAF3002F089826A02387DFABAE4
            AC298C00980444BC2600F000DE7F9F11C084156404C02488C20820D80AAA08E0
            7445C5E294ECDC73AA388C0098F845BC2100C340EF6C5C058046404600135690
            110093200A2380602BA822800A4C00A98C00980448BC2180D1FEDED9AFBDF66A
            3B6B04F485825E1340092680638C00984C481801045B41350194972F49CDC96B
            50C56104C0C42FE21D01F4CC7EED554C00AC0AE003055504508E09208D110093
            0089B704F02A2600D606E00B0519013009A2300208B6826A0238756A69DA94FC
            B3AA388C0098F845BC218091BEEE39AFBDF6DA554600BE50D00B02C0AF445751
            7A228D110093898AB704001EC06F7EF31B20009814941180D70A3202601244F1
            761CC09B3FFE71E73BEFBEDB8A18014C504115019C3A7972697AEE5446004C02
            225E7900FD3DB3DF7AF3CDCE77ED0400D3829B180178A32023002641940912C0
            0564F700180178A5A08A004E9E3CB92C23776ABD2ACE1802683C5B9FF8A7FFFA
            ED9AFDAFBECA088089D70204F0EC134FA0EF3EFDEC17E9995916F7DA007A66FF
            E4276F75BDF3CE3B7415801180570A7A4800F8E5481C80A5F3DAB598FFFEF5E1
            793D9D5D6946A3212ED8CFC224BC242E3EDE90939BDBFBF5FB1F3C9F969E6E55
            4EB8D108F8939FFCA49311802F1454134059D9B28CBC699A0480E0BF2088D99F
            7A2AE5190541A206F99813E458F24BE4EC71C4334026E2AF20C8C7709E97AEE5
            C9B5709DB42B9EE7A974ECF7B1EB21863BE8255DCF4B8A28F71664C5A4FBCB4F
            A2E821A72BC8B111A13C310A7D2C70CA19F958EA269553E7A4C4E4004EB6A06C
            49F946D2814E0E87DB72527CF14181723972BD6C4A898D25C5741CA7682F2625
            1FEB6473723AFBB5EA7411B2A723BF60F961E57876BD953808391A84B3DFDFA7
            22C82F5F8B00863101FCEB5B6FA91B01190178A5A03B042047841F25B3935352
            262199D9E199255F4E4D0AF2BE2AA352042065744432BA3D6DD8B75FA3900A15
            C6D304A0900EDCCB19011042919E45B0139B9CCEC40840B19D78AC2319482602
            256B72704EB986CEF06206A333A77C9EDC5749532217292D4ED603C9E4A1646C
            B24F11854244F4394432BE9D30E86B94307B1CFF893036070DF76202F8092300
            DF28E848009965A5A5CB33F3A79F71169F220005B22E088094AE8E99DC910094
            8C4D6576C97B10A45F8A44B40840F12200973C954115D291D3547445A484C1C4
            2050199CD251211D3BD6153D1CED67E70C4E7E243A4FD09946A72E51EDDE014D
            004AC6D34907630840A7A34B72FB3DC5FB2BE4A2490024333B78151C4522E439
            1C4A7BCEF159285DFC4F001A8209602E26806B98005A10EB0598A0821C17857F
            E2F19682B78CFFFAED6F972C2C5A64894D4EBDA4265FFA504D00D42939B32BAE
            3A15369600C6646292E9A90C4BD2A60980E7ED19D77EADC0F163ED6E2705071D
            942A853D1D877DF29C9E1100A7A4E090C1C5CB759C52422BF1950C2B5B93A3E3
            4B3770970004CA03B0A72D677ABAC477450076125395FE727ACA73A1E0647ECE
            66CD6ABF7229E7F1C71F6F282F2F6F47F6E5C12D8C00BC5190E3F4F887780140
            02C9A9A9A9C96B56AF4E2D282888E5E58C156C3D9944B0C82438343868AD387D
            7AA8A9A90932FD10DE06915CFA2391CB432FB385030140E686C2068820066FD0
            9A1F8B2452D0CBE794E8AACBB51E2E9CC9827E1ECE8BF32C8D89A5A18E2750BF
            B0D9F066C19B1949991E36E83D08C9CC2F3E4888EA355651BB3FA7FED58C2EFF
            0A4EC2C34104D52F93D012782F2E092354333D2D6143004C9830F1BD300260C2
            24828511001326112C8C0098308960F9FF2CAFFBC3D5F3EEC60000000049454E
            44AE426082}
          ExplicitLeft = 57
          ExplicitTop = 30
          ExplicitWidth = 256
          ExplicitHeight = 256
        end
        object LabelNoData1: TLabel
          Left = 140
          Top = 68
          Width = 289
          Height = 29
          Caption = #1044#1083#1103' '#1076#1072#1085#1085#1086#1081' '#1088#1072#1089#1094#1077#1085#1082#1080' '#1085#1077#1090
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGradientActiveCaption
          Font.Height = -24
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Visible = False
        end
        object LabelNoData2: TLabel
          Left = 140
          Top = 97
          Width = 286
          Height = 29
          Caption = #1076#1072#1085#1085#1099#1093' '#1076#1083#1103' '#1086#1090#1086#1073#1088#1072#1078#1077#1085#1080#1103
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGradientActiveCaption
          Font.Height = -24
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Visible = False
        end
      end
      object PanelClientRight: TPanel
        Left = 366
        Top = 25
        Width = 546
        Height = 200
        Align = alClient
        Alignment = taRightJustify
        BevelOuter = bvNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        ShowCaption = False
        TabOrder = 2
        Visible = False
        object ImageSplitterRightBottom: TImage
          Left = 312
          Top = 97
          Width = 15
          Height = 5
          Cursor = crVSplit
          AutoSize = True
        end
        object SplitterRightMemo: TSplitter
          Left = 0
          Top = 180
          Width = 546
          Height = 5
          Cursor = crVSplit
          Align = alBottom
          ResizeStyle = rsUpdate
          ExplicitTop = 164
        end
        object MemoRight: TMemo
          Left = 0
          Top = 185
          Width = 546
          Height = 15
          Align = alBottom
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          ScrollBars = ssVertical
          TabOrder = 1
          OnChange = MemoRightChange
          OnExit = MemoRightExit
        end
        object PanelClientRightTables: TPanel
          Left = 0
          Top = 0
          Width = 546
          Height = 180
          Align = alClient
          BevelOuter = bvNone
          Caption = 'PanelClientRightTables'
          ParentBackground = False
          ShowCaption = False
          TabOrder = 0
          OnResize = PanelClientRightTablesResize
          object ImageSplitterRight1: TImage
            Left = 208
            Top = 97
            Width = 15
            Height = 5
            Cursor = crVSplit
            AutoSize = True
          end
          object ImageSplitterRight2: TImage
            Left = 216
            Top = 105
            Width = 15
            Height = 5
            Cursor = crVSplit
            AutoSize = True
          end
          object SplitterRight1: TSplitter
            Left = 0
            Top = 24
            Width = 546
            Height = 5
            Cursor = crVSplit
            Align = alTop
            ResizeStyle = rsUpdate
            ExplicitTop = 30
            ExplicitWidth = 482
          end
          object SplitterRight2: TSplitter
            Left = 0
            Top = 51
            Width = 546
            Height = 5
            Cursor = crVSplit
            Align = alTop
            ResizeStyle = rsUpdate
            ExplicitTop = 65
            ExplicitWidth = 482
          end
          object dbgrdMechanizm: TJvDBGrid
            Left = 0
            Top = 29
            Width = 546
            Height = 22
            Align = alTop
            Color = clWhite
            Ctl3D = False
            DataSource = dsMechanizm
            DefaultDrawing = False
            DrawingStyle = gdsClassic
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleHotTrack]
            ParentCtl3D = False
            ParentFont = False
            PopupMenu = pmMechanizms
            TabOrder = 1
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnDrawColumnCell = dbgrdMechanizmDrawColumnCell
            OnEnter = dbgrdRatesEnter
            OnExit = dbgrdMechanizmExit
            OnKeyDown = dbgrdMechanizmKeyDown
            AutoAppend = False
            AutoSort = False
            IniStorage = FormStorage
            BevelInner = bvNone
            BevelOuter = bvNone
            SelectColumnsDialogStrings.Caption = 'Select columns'
            SelectColumnsDialogStrings.OK = '&OK'
            SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
            CanDelete = False
            EditControls = <>
            RowsHeight = 17
            TitleRowHeight = 17
            WordWrap = True
            OnCanEditCell = dbgrdMechanizmCanEditCell
            Columns = <
              item
                Expanded = False
                FieldName = 'NUM'
                ReadOnly = True
                Title.Alignment = taCenter
                Title.Caption = #8470
                Width = 25
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'MECH_CODE'
                ReadOnly = True
                Title.Alignment = taCenter
                Title.Caption = #1050#1086#1076
                Width = 85
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'MECH_NORMA'
                ReadOnly = True
                Title.Alignment = taCenter
                Title.Caption = #1053#1086#1088#1084#1072' '#1088#1072#1089#1093#1086#1076#1072
                Width = 50
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'KOEF'
                ReadOnly = True
                Title.Alignment = taCenter
                Title.Caption = #1050#1086#1101#1092'.'
                Width = 40
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'MECH_UNIT'
                ReadOnly = True
                Title.Alignment = taCenter
                Title.Caption = #1045#1076'. '#1080#1079#1084'.'
                Width = 42
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'MECH_COUNT'
                ReadOnly = True
                Title.Alignment = taCenter
                Title.Caption = #1050#1086#1083'-'#1074#1086
                Width = 60
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'COAST_NDS'
                ReadOnly = True
                Title.Alignment = taCenter
                Title.Caption = #1062#1077#1085#1072' ('#1057#1084') '#1089' '#1053#1044#1057', '#1088'.'
                Width = 70
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'COAST_NO_NDS'
                ReadOnly = True
                Title.Alignment = taCenter
                Title.Caption = #1062#1077#1085#1072' ('#1057#1084') '#1073#1077#1079' '#1053#1044#1057', '#1088'.'
                Width = 70
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PRICE_NDS'
                ReadOnly = True
                Title.Alignment = taCenter
                Title.Caption = #1057#1090#1086#1080#1084'. ('#1057#1084') '#1089' '#1053#1044#1057', '#1088'.'
                Width = 80
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PRICE_NO_NDS'
                ReadOnly = True
                Title.Alignment = taCenter
                Title.Caption = #1057#1090#1086#1080#1084'. ('#1057#1084') '#1073#1077#1079' '#1053#1044#1057', '#1088'.'
                Width = 80
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ZP_MACH_NDS'
                ReadOnly = True
                Title.Alignment = taCenter
                Title.Caption = #1053#1086#1088#1084#1072' '#1047#1055' ('#1057#1084') '#1089' '#1053#1044#1057', p.'
                Width = 75
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ZP_MACH_NO_NDS'
                ReadOnly = True
                Title.Alignment = taCenter
                Title.Caption = #1053#1086#1088#1084#1072' '#1047#1055' ('#1057#1084') '#1073#1077#1079' '#1053#1044#1057', p.'
                Width = 75
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ZPPRICE_NDS'
                ReadOnly = True
                Title.Alignment = taCenter
                Title.Caption = #1047#1055' '#1084#1072#1096'. ('#1057#1084') '#1089' '#1053#1044#1057', p.'
                Width = 80
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ZPPRICE_NO_NDS'
                ReadOnly = True
                Title.Alignment = taCenter
                Title.Caption = #1047#1055' '#1084#1072#1096'. ('#1057#1084') '#1073#1077#1079' '#1053#1044#1057', p.'
                Width = 80
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NDS'
                ReadOnly = True
                Title.Alignment = taCenter
                Title.Caption = #1053#1044#1057', %'
                Width = 35
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'FCOAST_NDS'
                Title.Alignment = taCenter
                Title.Caption = #1062#1077#1085#1072' ('#1092#1072#1082#1090') '#1089' '#1053#1044#1057', '#1088'.'
                Width = 75
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'FCOAST_NO_NDS'
                Title.Alignment = taCenter
                Title.Caption = #1062#1077#1085#1072' ('#1092#1072#1082#1090') '#1073#1077#1079' '#1053#1044#1057', '#1088'.'
                Width = 75
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'FPRICE_NDS'
                ReadOnly = True
                Title.Alignment = taCenter
                Title.Caption = #1057#1090#1086#1080#1084'. ('#1092#1072#1082#1090') '#1089' '#1053#1044#1057', '#1088'.'
                Width = 85
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'FPRICE_NO_NDS'
                ReadOnly = True
                Title.Alignment = taCenter
                Title.Caption = #1057#1090#1086#1080#1084'. ('#1092#1072#1082#1090') '#1073#1077#1079' '#1053#1044#1057', '#1088'.'
                Width = 85
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'FZP_MACH_NDS'
                Title.Alignment = taCenter
                Title.Caption = #1053#1086#1088#1084#1072' '#1047#1055' ('#1092#1072#1082#1090') '#1089' '#1053#1044#1057', p.'
                Width = 90
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'FZP_MACH_NO_NDS'
                Title.Alignment = taCenter
                Title.Caption = #1053#1086#1088#1084#1072' '#1047#1055' ('#1092#1072#1082#1090') '#1073#1077#1079' '#1053#1044#1057', p.'
                Width = 90
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'FZPPRICE_NDS'
                ReadOnly = True
                Title.Alignment = taCenter
                Title.Caption = #1047#1055' '#1084#1072#1096'. ('#1092#1072#1082#1090') '#1089' '#1053#1044#1057', p.'
                Width = 85
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'FZPPRICE_NO_NDS'
                ReadOnly = True
                Title.Alignment = taCenter
                Title.Caption = #1047#1055' '#1084#1072#1096'. ('#1092#1072#1082#1090') '#1073#1077#1079' '#1053#1044#1057', p.'
                Width = 85
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NORMATIV'
                ReadOnly = True
                Title.Alignment = taCenter
                Title.Caption = #1053#1086#1088#1084#1072#1090#1080#1074
                Width = 70
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NORM_TRYD'
                ReadOnly = True
                Title.Alignment = taCenter
                Title.Caption = #1053#1086#1088#1084'. '#1090#1088#1091#1076
                Width = 70
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TERYDOZATR'
                ReadOnly = True
                Title.Alignment = taCenter
                Title.Caption = #1058#1088#1091#1076#1086#1079#1072#1090#1088#1072#1090#1099
                Width = 80
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PROC_PODR'
                Title.Alignment = taCenter
                Title.Caption = #1055#1086#1076#1088'., %'
                Width = 40
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PROC_ZAC'
                Title.Alignment = taCenter
                Title.Caption = #1047#1072#1082'., %'
                Width = 40
                Visible = True
              end>
          end
          object dbgrdMaterial: TJvDBGrid
            Left = 0
            Top = 0
            Width = 546
            Height = 24
            Align = alTop
            Color = clWhite
            Ctl3D = False
            DataSource = dsMaterial
            DefaultDrawing = False
            DrawingStyle = gdsClassic
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleHotTrack]
            ParentCtl3D = False
            ParentFont = False
            PopupMenu = pmMaterials
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnDrawColumnCell = dbgrdMaterialDrawColumnCell
            OnEnter = dbgrdRatesEnter
            OnExit = dbgrdMaterialExit
            OnKeyDown = dbgrdMaterialKeyDown
            AutoAppend = False
            AutoSort = False
            IniStorage = FormStorage
            SelectColumnsDialogStrings.Caption = 'Select columns'
            SelectColumnsDialogStrings.OK = '&OK'
            SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
            CanDelete = False
            EditControls = <>
            RowsHeight = 17
            TitleRowHeight = 17
            WordWrap = True
            OnCanEditCell = dbgrdMaterialCanEditCell
            Columns = <
              item
                Expanded = False
                FieldName = 'NUM'
                Title.Alignment = taCenter
                Title.Caption = #8470
                Width = 25
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'MAT_CODE'
                ReadOnly = True
                Title.Alignment = taCenter
                Title.Caption = #1050#1086#1076
                Width = 85
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'MAT_NORMA'
                ReadOnly = True
                Title.Alignment = taCenter
                Title.Caption = #1053#1086#1088#1084#1072' '#1088#1072#1089#1093#1086#1076#1072
                Width = 50
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'KOEFMR'
                ReadOnly = True
                Title.Alignment = taCenter
                Title.Caption = #1050#1086#1101#1092'.'
                Width = 40
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'MAT_UNIT'
                ReadOnly = True
                Title.Alignment = taCenter
                Title.Caption = #1045#1076'. '#1080#1079#1084'.'
                Width = 50
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'MAT_COUNT'
                ReadOnly = True
                Title.Alignment = taCenter
                Title.Caption = #1050#1086#1083'-'#1074#1086
                Width = 60
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'COAST_NDS'
                ReadOnly = True
                Title.Alignment = taCenter
                Title.Caption = #1062#1077#1085#1072' ('#1057#1084') '#1089' '#1053#1044#1057', '#1088'.'
                Width = 70
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'COAST_NO_NDS'
                ReadOnly = True
                Title.Alignment = taCenter
                Title.Caption = #1062#1077#1085#1072' ('#1057#1084') '#1073#1077#1079' '#1053#1044#1057', '#1088'.'
                Width = 70
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PRICE_NDS'
                ReadOnly = True
                Title.Alignment = taCenter
                Title.Caption = #1057#1090#1086#1080#1084'. ('#1057#1084') '#1089' '#1053#1044#1057', '#1088'.'
                Width = 80
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PRICE_NO_NDS'
                ReadOnly = True
                Title.Alignment = taCenter
                Title.Caption = #1057#1090#1086#1080#1084'. ('#1057#1084') '#1073#1077#1079' '#1053#1044#1057', '#1088'.'
                Width = 80
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PROC_TRANSP'
                ReadOnly = True
                Title.Alignment = taCenter
                Title.Caption = #1053#1086#1088#1084#1072' '#1090#1088'. '#1088#1072#1089#1093'., %'
                Width = 60
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TRANSP_NDS'
                ReadOnly = True
                Title.Alignment = taCenter
                Title.Caption = #1058#1088#1072#1085#1089#1087'. ('#1057#1084') '#1089' '#1053#1044#1057', '#1088'.'
                Width = 70
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TRANSP_NO_NDS'
                ReadOnly = True
                Title.Alignment = taCenter
                Title.Caption = #1058#1088#1072#1085#1089#1087'. ('#1057#1084') '#1073#1077#1079' '#1053#1044#1057', '#1088'.'
                Width = 70
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NDS'
                ReadOnly = True
                Title.Alignment = taCenter
                Title.Caption = #1053#1044#1057', %'
                Width = 35
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'FCOAST_NDS'
                Title.Alignment = taCenter
                Title.Caption = #1062#1077#1085#1072' ('#1092#1072#1082#1090') '#1089' '#1053#1044#1057', '#1088'.'
                Width = 75
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'FCOAST_NO_NDS'
                Title.Alignment = taCenter
                Title.Caption = #1062#1077#1085#1072' ('#1092#1072#1082#1090') '#1073#1077#1079' '#1053#1044#1057', '#1088'.'
                Width = 75
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'FPRICE_NDS'
                ReadOnly = True
                Title.Alignment = taCenter
                Title.Caption = #1057#1090#1086#1080#1084'. ('#1092#1072#1082#1090') '#1089' '#1053#1044#1057', '#1088'.'
                Width = 85
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'FPRICE_NO_NDS'
                ReadOnly = True
                Title.Alignment = taCenter
                Title.Caption = #1057#1090#1086#1080#1084'. ('#1092#1072#1082#1090') '#1073#1077#1079' '#1053#1044#1057', '#1088'.'
                Width = 85
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'FTRANSP_NDS'
                Title.Alignment = taCenter
                Title.Caption = #1058#1088#1072#1085#1089#1087'. ('#1092#1072#1082#1090') '#1089' '#1053#1044#1057', '#1088'.'
                Width = 85
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'FTRANSP_NO_NDS'
                Title.Alignment = taCenter
                Title.Caption = #1058#1088#1072#1085#1089#1087'. ('#1092#1072#1082#1090') '#1073#1077#1079' '#1053#1044#1057', '#1088'.'
                Width = 85
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'MAT_PROC_PODR'
                Title.Alignment = taCenter
                Title.Caption = #1052#1072#1090'. '#1087#1086#1076#1088', %'
                Width = 50
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'MAT_PROC_ZAC'
                Title.Alignment = taCenter
                Title.Caption = #1052#1072#1090'. '#1079#1072#1082', %'
                Width = 50
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TRANSP_PROC_PODR'
                Title.Alignment = taCenter
                Title.Caption = #1058#1088#1072#1085#1089'. '#1087#1086#1076#1088', %'
                Width = 50
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TRANSP_PROC_ZAC'
                Title.Alignment = taCenter
                Title.Caption = #1058#1088#1072#1085#1089'. '#1079#1072#1082', %'
                Width = 50
                Visible = True
              end>
          end
          object dbgrdDevices: TJvDBGrid
            Left = 0
            Top = 56
            Width = 546
            Height = 25
            Align = alTop
            Ctl3D = False
            DataSource = dsDevices
            DefaultDrawing = False
            DrawingStyle = gdsClassic
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleHotTrack]
            ParentCtl3D = False
            ParentFont = False
            PopupMenu = pmDevices
            TabOrder = 2
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnDrawColumnCell = dbgrdDevicesDrawColumnCell
            OnEnter = dbgrdRatesEnter
            OnExit = dbgrdDevicesExit
            OnKeyDown = dbgrdDevicesKeyDown
            AutoAppend = False
            AutoSort = False
            IniStorage = FormStorage
            BevelInner = bvNone
            BevelOuter = bvNone
            SelectColumnsDialogStrings.Caption = 'Select columns'
            SelectColumnsDialogStrings.OK = '&OK'
            SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
            CanDelete = False
            EditControls = <>
            RowsHeight = 17
            TitleRowHeight = 17
            WordWrap = True
            Columns = <
              item
                Expanded = False
                FieldName = 'NUM'
                ReadOnly = True
                Title.Alignment = taCenter
                Title.Caption = #8470
                Width = 25
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DEVICE_CODE'
                ReadOnly = True
                Title.Alignment = taCenter
                Title.Caption = #1050#1086#1076
                Width = 85
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DEVICE_UNIT'
                ReadOnly = True
                Title.Alignment = taCenter
                Title.Caption = #1045#1076'. '#1080#1079#1084'.'
                Width = 50
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DEVICE_COUNT'
                ReadOnly = True
                Title.Alignment = taCenter
                Title.Caption = #1050#1086#1083'-'#1074#1086
                Width = 60
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NDS'
                ReadOnly = True
                Title.Alignment = taCenter
                Title.Caption = #1053#1044#1057', %'
                Width = 35
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'FCOAST_NDS'
                Title.Alignment = taCenter
                Title.Caption = #1062#1077#1085#1072' ('#1092#1072#1082#1090') '#1089' '#1053#1044#1057', '#1088'.'
                Width = 80
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'FCOAST_NO_NDS'
                Title.Alignment = taCenter
                Title.Caption = #1062#1077#1085#1072' ('#1092#1072#1082#1090') '#1073#1077#1079' '#1053#1044#1057', '#1088'.'
                Width = 80
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DEVICE_TRANSP_NDS'
                Title.Alignment = taCenter
                Title.Caption = #1058#1088#1072#1085#1089#1087'. ('#1092#1072#1082#1090') '#1089' '#1053#1044#1057', '#1088'.'
                Width = 90
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DEVICE_TRANSP_NO_NDS'
                Title.Alignment = taCenter
                Title.Caption = #1058#1088#1072#1085#1089#1087'. ('#1092#1072#1082#1090') '#1073#1077#1079' '#1053#1044#1057', '#1088'.'
                Width = 90
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'FPRICE_NDS'
                ReadOnly = True
                Title.Alignment = taCenter
                Title.Caption = #1057#1090#1086#1080#1084'. ('#1092#1072#1082#1090') '#1089' '#1053#1044#1057', '#1088'.'
                Width = 90
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'FPRICE_NO_NDS'
                ReadOnly = True
                Title.Alignment = taCenter
                Title.Caption = #1057#1090#1086#1080#1084'. ('#1092#1072#1082#1090') '#1073#1077#1079' '#1053#1044#1057', '#1088'.'
                Width = 90
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PROC_PODR'
                Title.Alignment = taCenter
                Title.Caption = #1054#1073'. '#1087#1086#1076#1088', %'
                Width = 50
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PROC_ZAC'
                Title.Alignment = taCenter
                Title.Caption = #1054#1073'. '#1079#1072#1082'., %'
                Width = 50
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TRANSP_PROC_PODR'
                Title.Alignment = taCenter
                Title.Caption = #1058#1088#1072#1085#1089'. '#1087#1086#1076#1088', %'
                Width = 50
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TRANSP_PROC_ZAC'
                Title.Alignment = taCenter
                Title.Caption = #1058#1088#1072#1085#1089'. '#1079#1072#1082', %'
                Width = 50
                Visible = True
              end>
          end
          object dbgrdDump: TJvDBGrid
            Left = 0
            Top = 99
            Width = 546
            Height = 30
            Align = alTop
            Ctl3D = False
            DataSource = dsDump
            DefaultDrawing = False
            DrawingStyle = gdsClassic
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleHotTrack]
            ParentCtl3D = False
            ParentFont = False
            PopupMenu = pmDumpTransp
            ReadOnly = True
            TabOrder = 4
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnDrawColumnCell = dbgrdDevicesDrawColumnCell
            OnEnter = dbgrdRatesEnter
            OnKeyDown = dbgrdDumpKeyDown
            AutoAppend = False
            AutoSort = False
            IniStorage = FormStorage
            SelectColumnsDialogStrings.Caption = 'Select columns'
            SelectColumnsDialogStrings.OK = '&OK'
            SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
            CanDelete = False
            EditControls = <>
            RowsHeight = 17
            TitleRowHeight = 17
            WordWrap = True
            Columns = <
              item
                Expanded = False
                FieldName = 'NUM'
                Title.Alignment = taCenter
                Title.Caption = #8470
                Width = 25
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DUMP_CODE_JUST'
                Title.Alignment = taCenter
                Title.Caption = #1050#1086#1076
                Width = 85
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DUMP_UNIT'
                Title.Alignment = taCenter
                Title.Caption = #1045#1076'. '#1080#1079#1084'.'
                Width = 50
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'WORK_YDW'
                Title.Alignment = taCenter
                Title.Caption = #1059#1076'. '#1074#1077#1089', '#1082#1075'/'#1084'3'
                Width = 50
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DUMP_COUNT'
                Title.Alignment = taCenter
                Title.Caption = #1050#1086#1083'-'#1074#1086
                Width = 60
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NDS'
                Title.Alignment = taCenter
                Title.Caption = #1053#1044#1057', %'
                Width = 35
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'COAST_NDS'
                Title.Alignment = taCenter
                Title.Caption = #1062#1077#1085#1072' '#1079#1072' '#1077#1076'. '#1089' '#1053#1044#1057', '#1088'.'
                Width = 75
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'COAST_NO_NDS'
                Title.Alignment = taCenter
                Title.Caption = #1062#1077#1085#1072' '#1079#1072' '#1077#1076'. '#1073#1077#1079' '#1053#1044#1057', '#1088'.'
                Width = 75
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PRICE_NDS'
                Title.Alignment = taCenter
                Title.Caption = #1057#1090#1086#1080#1084'. '#1089' '#1053#1044#1057', '#1088'.'
                Width = 80
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PRICE_NO_NDS'
                Title.Alignment = taCenter
                Title.Caption = #1057#1090#1086#1080#1084'. '#1073#1077#1079' '#1053#1044#1057', '#1088'.'
                Width = 80
                Visible = True
              end>
          end
          object dbgrdDescription: TJvDBGrid
            Left = 0
            Top = 81
            Width = 546
            Height = 18
            Align = alTop
            DataSource = dsDescription
            DefaultDrawing = False
            DrawingStyle = gdsClassic
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleHotTrack]
            TabOrder = 3
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnDrawColumnCell = dbgrdDescription1DrawColumnCell
            OnEnter = dbgrdRatesEnter
            AutoAppend = False
            AutoSort = False
            IniStorage = FormStorage
            SelectColumnsDialogStrings.Caption = 'Select columns'
            SelectColumnsDialogStrings.OK = '&OK'
            SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
            CanDelete = False
            EditControls = <>
            RowsHeight = 17
            TitleRowHeight = 17
            Columns = <
              item
                Expanded = False
                FieldName = 'work'
                Title.Alignment = taCenter
                Title.Caption = #1054#1087#1080#1089#1072#1085#1080#1077' '#1089#1086#1089#1090#1072#1074#1072' '#1088#1072#1073#1086#1090
                Visible = True
              end>
          end
          object dbgrdTransp: TJvDBGrid
            Left = 0
            Top = 145
            Width = 546
            Height = 30
            Align = alTop
            Ctl3D = False
            DataSource = dsTransp
            DefaultDrawing = False
            DrawingStyle = gdsClassic
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleHotTrack]
            ParentCtl3D = False
            ParentFont = False
            PopupMenu = pmDumpTransp
            ReadOnly = True
            TabOrder = 6
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnDrawColumnCell = dbgrdDevicesDrawColumnCell
            OnEnter = dbgrdRatesEnter
            OnKeyDown = dbgrdDumpKeyDown
            AutoAppend = False
            AutoSort = False
            IniStorage = FormStorage
            SelectColumnsDialogStrings.Caption = 'Select columns'
            SelectColumnsDialogStrings.OK = '&OK'
            SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
            CanDelete = False
            EditControls = <>
            RowsHeight = 17
            TitleRowHeight = 17
            WordWrap = True
            Columns = <
              item
                Expanded = False
                FieldName = 'NUM'
                Title.Alignment = taCenter
                Title.Caption = #8470
                Width = 28
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TRANSP_CODE_JUST'
                Title.Alignment = taCenter
                Title.Caption = #1050#1086#1076
                Width = 85
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TRANSP_UNIT'
                Title.Alignment = taCenter
                Title.Caption = #1045#1076'. '#1080#1079#1084'.'
                Width = 50
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CLASS'
                Title.Alignment = taCenter
                Title.Caption = #1050#1083#1072#1089#1089'  '#1075#1088#1091#1079#1072
                Width = 50
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CARG_YDW'
                Title.Alignment = taCenter
                Title.Caption = #1059#1076'. '#1074#1077#1089', '#1082#1075'/'#1084'3'
                Width = 50
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TRANSP_COUNT'
                Title.Alignment = taCenter
                Title.Caption = #1050#1086#1083'-'#1074#1086
                Width = 60
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NDS'
                Title.Alignment = taCenter
                Title.Caption = #1053#1044#1057', %'
                Width = 35
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'COAST_NDS'
                Title.Alignment = taCenter
                Title.Caption = #1062#1077#1085#1072' '#1079#1072' '#1077#1076'. '#1089' '#1053#1044#1057', '#1088'.'
                Width = 75
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'COAST_NO_NDS'
                Title.Alignment = taCenter
                Title.Caption = #1062#1077#1085#1072' '#1079#1072' '#1077#1076'. '#1073#1077#1079' '#1053#1044#1057', '#1088'.'
                Width = 75
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TRANSP_DIST'
                Title.Alignment = taCenter
                Title.Caption = #1056#1072#1089#1090#1086#1103#1085#1080#1077', '#1082#1084
                Width = 75
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'KOEF'
                Title.Alignment = taCenter
                Title.Caption = #1050#1086#1101#1092'.'
                Width = 40
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PRICE_NDS'
                Title.Alignment = taCenter
                Title.Caption = #1057#1090#1086#1080#1084'. '#1089' '#1053#1044#1057', '#1088'.'
                Width = 80
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PRICE_NO_NDS'
                Title.Alignment = taCenter
                Title.Caption = #1057#1090#1086#1080#1084'. '#1073#1077#1079' '#1053#1044#1057', '#1088'.'
                Width = 80
                Visible = True
              end>
          end
          object dbgrdStartup: TJvDBGrid
            Left = 0
            Top = 129
            Width = 546
            Height = 16
            Align = alTop
            Ctl3D = False
            DataSource = dsStartup
            DefaultDrawing = False
            DrawingStyle = gdsClassic
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleHotTrack]
            ParentCtl3D = False
            ReadOnly = True
            TabOrder = 5
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnDrawColumnCell = dbgrdDevicesDrawColumnCell
            OnEnter = dbgrdRatesEnter
            AutoAppend = False
            AutoSort = False
            IniStorage = FormStorage
            SelectColumnsDialogStrings.Caption = 'Select columns'
            SelectColumnsDialogStrings.OK = '&OK'
            SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
            CanDelete = False
            EditControls = <>
            RowsHeight = 17
            TitleRowHeight = 17
            WordWrap = True
            Columns = <
              item
                Expanded = False
                FieldName = 'NUM'
                Title.Alignment = taCenter
                Title.Caption = #8470
                Width = 25
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'RATE_CODE'
                Title.Alignment = taCenter
                Title.Caption = #1050#1086#1076
                Width = 85
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'RATE_COUNT'
                Title.Alignment = taCenter
                Title.Caption = #1050#1086#1083'-'#1074#1086
                Width = 60
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'RATE_UNIT'
                Title.Alignment = taCenter
                Title.Caption = #1045#1076'. '#1080#1079#1084'.'
                Width = 50
                Visible = True
              end>
          end
        end
      end
    end
    object PanelTableBottom: TPanel
      Left = 0
      Top = 254
      Width = 912
      Height = 70
      Align = alBottom
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 2
      object dbgrdCalculations: TJvDBGrid
        Left = 0
        Top = 0
        Width = 912
        Height = 45
        Align = alClient
        DataSource = dsCalculations
        DrawingStyle = gdsClassic
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleHotTrack]
        ParentFont = False
        PopupMenu = pmCoef
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        IniStorage = FormStorage
        OnResize = dbgrdCalculationsResize
        ScrollBars = ssNone
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
            FieldName = 'NAME'
            Title.Alignment = taCenter
            Title.Caption = ' '
            Width = 68
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'CNT'
            Title.Alignment = taCenter
            Title.Caption = #1050#1086#1083'-'#1074#1086
            Width = 68
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ZP'
            Title.Alignment = taCenter
            Title.Caption = #1047#1055
            Width = 68
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'EMiM'
            Title.Alignment = taCenter
            Title.Caption = #1069#1052#1080#1052
            Width = 68
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ZP_MASH'
            Title.Alignment = taCenter
            Title.Caption = #1047#1055' '#1084#1072#1096'.'
            Width = 68
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'MR'
            Title.Alignment = taCenter
            Title.Caption = #1052#1056
            Width = 68
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TRANSP'
            Title.Alignment = taCenter
            Title.Caption = #1058#1088#1072#1085#1089#1087'.'
            Width = 68
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'STOIM'
            Title.Alignment = taCenter
            Title.Caption = #1057#1090#1086#1080#1084#1086#1089#1090#1100
            Width = 68
            Visible = True
          end
          item
            Alignment = taRightJustify
            Expanded = False
            FieldName = 'OHROPR'
            Title.Alignment = taCenter
            Title.Caption = #1054#1061#1056' '#1080' '#1054#1055#1056
            Width = 68
            Visible = True
          end
          item
            Alignment = taRightJustify
            Expanded = False
            FieldName = 'PLAN_PRIB'
            Title.Alignment = taCenter
            Title.Caption = #1055#1083#1072#1085' '#1087#1088#1080#1073'.'
            Width = 68
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ST_OHROPR'
            Title.Alignment = taCenter
            Title.Caption = #1048#1090#1086#1075#1086' '#1089' '#1054#1061#1056#1080#1054#1055#1056
            Width = 68
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TRUD'
            Title.Alignment = taCenter
            Title.Caption = #1058#1088#1091#1076
            Width = 68
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TRUD_MASH'
            Title.Alignment = taCenter
            Title.Caption = #1058#1088#1091#1076' '#1084#1072#1096'.'
            Width = 67
            Visible = True
          end
          item
            Alignment = taRightJustify
            Expanded = False
            FieldName = 'ZIM_UDOR'
            Title.Alignment = taCenter
            Title.Caption = #1047#1080#1084'. '#1091#1076#1086#1088'.'
            Visible = False
          end
          item
            Alignment = taRightJustify
            Expanded = False
            FieldName = 'ZP_ZIM_UDOR'
            Title.Alignment = taCenter
            Title.Caption = #1047#1055' '#1074' '#1079#1080#1084'. '#1091#1076#1086#1088'.'
            Visible = False
          end>
      end
      object PanelBottom: TPanel
        Left = 0
        Top = 45
        Width = 912
        Height = 25
        Align = alBottom
        BevelOuter = bvNone
        ParentBackground = False
        TabOrder = 1
        object Label10: TLabel
          Left = 6
          Top = 5
          Width = 40
          Height = 13
          Caption = #1048#1058#1054#1043#1054':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Edit11: TEdit
          Left = 52
          Top = 2
          Width = 80
          Height = 21
          Color = 8454143
          ReadOnly = True
          TabOrder = 0
        end
        object Edit12: TEdit
          Left = 138
          Top = 2
          Width = 80
          Height = 21
          Color = 8454143
          ReadOnly = True
          TabOrder = 1
        end
        object Edit13: TEdit
          Left = 224
          Top = 2
          Width = 80
          Height = 21
          Color = 8454143
          ReadOnly = True
          TabOrder = 2
        end
        object Edit14: TEdit
          Left = 310
          Top = 2
          Width = 80
          Height = 21
          Color = 8454143
          ReadOnly = True
          TabOrder = 3
        end
      end
    end
    object Panel1: TPanel
      Left = 0
      Top = 230
      Width = 912
      Height = 24
      Align = alBottom
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 1
      OnResize = Panel1Resize
      object lbl1: TLabel
        AlignWithMargins = True
        Left = 334
        Top = 5
        Width = 108
        Height = 14
        Margins.Top = 5
        Margins.Bottom = 5
        Align = alLeft
        Caption = #1054#1061#1056' '#1054#1055#1056' '#1080' '#1055#1083'. '#1087#1088#1080#1073'.:'
        ExplicitHeight = 13
      end
      object lblZone: TLabel
        AlignWithMargins = True
        Left = 8
        Top = 5
        Width = 107
        Height = 14
        Margins.Left = 8
        Margins.Top = 5
        Margins.Bottom = 5
        Align = alLeft
        Caption = #1047#1086#1085#1072' '#1089#1090#1088#1086#1080#1090#1077#1083#1100#1089#1090#1074#1072':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ExplicitHeight = 13
      end
      object lblTypeWork: TLabel
        AlignWithMargins = True
        Left = 199
        Top = 5
        Width = 56
        Height = 14
        Margins.Top = 5
        Margins.Bottom = 5
        Align = alLeft
        Caption = #1042#1080#1076' '#1088#1072#1073#1086#1090':'
        ExplicitHeight = 13
      end
      object lblWinterPrice: TLabel
        AlignWithMargins = True
        Left = 609
        Top = 5
        Width = 121
        Height = 14
        Margins.Top = 5
        Margins.Bottom = 5
        Align = alLeft
        Caption = #1047#1080#1084#1085#1077#1077' '#1091#1076#1086#1088#1086#1078#1072#1085#1080#1077' '#1085#1072':'
        ExplicitHeight = 13
      end
      object EditWinterPrice: TEdit
        AlignWithMargins = True
        Left = 733
        Top = 2
        Width = 172
        Height = 20
        Cursor = crHandPoint
        Margins.Left = 0
        Margins.Top = 2
        Margins.Bottom = 2
        TabStop = False
        Align = alLeft
        Color = 14802912
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        PopupMenu = pmWinterPrise
        ReadOnly = True
        TabOrder = 3
        OnClick = nSelectWinterPriseClick
        ExplicitHeight = 21
      end
      object dblkcbbOXROPR: TDBLookupComboBox
        AlignWithMargins = True
        Left = 445
        Top = 2
        Width = 158
        Height = 21
        Margins.Left = 0
        Margins.Top = 2
        Margins.Bottom = 2
        Align = alLeft
        DataField = 'WORK_ID'
        DataSource = dsRatesEx
        DropDownRows = 10
        KeyField = 'work_id'
        ListField = 'NameWork'
        ListSource = dsOXROPR
        TabOrder = 2
      end
      object edtTypeWork: TEdit
        AlignWithMargins = True
        Left = 258
        Top = 2
        Width = 70
        Height = 20
        Margins.Left = 0
        Margins.Top = 2
        Margins.Bottom = 2
        Align = alLeft
        Alignment = taCenter
        BevelInner = bvLowered
        BevelOuter = bvNone
        Color = 14802912
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
        Text = #1042#1080#1076' '#1088#1072#1073#1086#1090
        ExplicitHeight = 21
      end
      object edtZone: TEdit
        AlignWithMargins = True
        Left = 118
        Top = 2
        Width = 75
        Height = 20
        Margins.Left = 0
        Margins.Top = 2
        Margins.Bottom = 2
        Align = alLeft
        Alignment = taCenter
        BevelInner = bvLowered
        BevelOuter = bvNone
        Color = 14802912
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        Text = #1047#1086#1085#1072' '#1088#1072#1089#1094#1077#1085#1086#1082
        ExplicitHeight = 21
      end
    end
  end
  object PanelData: TPanel
    Left = 0
    Top = 62
    Width = 918
    Height = 25
    Align = alTop
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 2
    DesignSize = (
      918
      25)
    object Label1: TLabel
      Left = 8
      Top = 6
      Width = 114
      Height = 13
      Cursor = crHandPoint
      Hint = #1054#1090#1082#1088#1099#1090#1100' '#1086#1082#1085#1086' '#1080#1089#1093#1086#1076#1085#1099#1093' '#1076#1072#1085#1085#1099#1093
      Caption = #1048#1089#1093#1086#1076#1085#1099#1077' '#1076#1072#1085#1085#1099#1077':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = Label1Click
    end
    object Label6: TLabel
      Left = 307
      Top = 6
      Width = 65
      Height = 13
      Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077':'
    end
    object EditVAT: TEdit
      Left = 248
      Top = 2
      Width = 50
      Height = 21
      BevelInner = bvLowered
      BevelOuter = bvSpace
      Color = 8454143
      ReadOnly = True
      TabOrder = 2
      Text = #1073#1077#1079' '#1053#1044#1057
    end
    object EditMonth: TEdit
      Left = 125
      Top = 2
      Width = 117
      Height = 21
      BevelInner = bvLowered
      BevelOuter = bvSpace
      Color = 8454143
      ReadOnly = True
      TabOrder = 1
      Text = #1071#1085#1074#1072#1088#1100' 2012 '#1075#1086#1076#1072
    end
    object Edit4: TEdit
      Left = 378
      Top = 2
      Width = 374
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 3
    end
    object PanelCalculationYesNo: TPanel
      Tag = 1
      Left = 758
      Top = 1
      Width = 153
      Height = 23
      Cursor = crHandPoint
      Anchors = [akTop, akRight]
      Caption = #1056#1072#1089#1095#1105#1090#1099' '#1088#1072#1079#1088#1077#1096#1077#1085#1099
      Color = 8454016
      ParentBackground = False
      TabOrder = 0
      OnClick = PanelCalculationYesNoClick
    end
  end
  object PanelEstimate: TPanel
    Left = 0
    Top = 87
    Width = 918
    Height = 25
    Align = alTop
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 3
    DesignSize = (
      918
      25)
    object LabelEstimate: TLabel
      Left = 17
      Top = 6
      Width = 36
      Height = 13
      Cursor = crHandPoint
      Hint = #1054#1090#1082#1088#1099#1090#1100' '#1086#1082#1085#1086' '#1089#1084#1077#1090
      Caption = #1057#1084#1077#1090#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = LabelEstimateClick
    end
    object BevelEstimate: TBevel
      Left = 48
      Top = 5
      Width = 13
      Height = 15
      Shape = bsRightLine
    end
    object LabelNameEstimate: TLabel
      Left = 67
      Top = 6
      Width = 52
      Height = 13
      Caption = #1053#1072#1079#1074#1072#1085#1080#1077':'
    end
    object btn1: TSpeedButton
      Left = 758
      Top = 2
      Width = 153
      Height = 22
      Hint = #1042#1099#1087#1086#1083#1085#1080#1090#1100' '#1087#1077#1088#1077#1088#1072#1089#1095#1077#1090
      Anchors = [akTop, akRight]
      Caption = #1042#1099#1087#1086#1083#1085#1080#1090#1100' '#1087#1077#1088#1077#1088#1072#1089#1095#1077#1090
      ParentShowHint = False
      ShowHint = True
      OnClick = btn1Click
    end
    object EditNameEstimate: TEdit
      Left = 125
      Top = 2
      Width = 627
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      Color = 14802912
      ReadOnly = True
      TabOrder = 0
    end
  end
  object PanelObject: TPanel
    Left = 0
    Top = 37
    Width = 918
    Height = 25
    Align = alTop
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 1
    DesignSize = (
      918
      25)
    object LabelObject: TLabel
      Left = 8
      Top = 6
      Width = 45
      Height = 13
      Cursor = crHandPoint
      Hint = #1054#1090#1082#1088#1099#1090#1100' '#1086#1082#1085#1086' '#1086#1073#1098#1077#1082#1090#1086#1074
      Caption = #1054#1073#1098#1077#1082#1090
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      PopupMenu = pmLblObj
      ShowHint = True
      OnClick = LabelObjectClick
    end
    object LabelNumberContract: TLabel
      Left = 588
      Top = 6
      Width = 68
      Height = 13
      Anchors = [akTop, akRight]
      Caption = #8470' '#1076#1086#1075#1086#1074#1086#1088#1072':'
      ExplicitLeft = 614
    end
    object LabelDateContract: TLabel
      Left = 758
      Top = 6
      Width = 81
      Height = 13
      Anchors = [akTop, akRight]
      Caption = #1044#1072#1090#1072' '#1076#1086#1075#1086#1074#1086#1088#1072':'
      ExplicitLeft = 784
    end
    object BevelObject: TBevel
      Left = 48
      Top = 5
      Width = 13
      Height = 15
      Shape = bsRightLine
    end
    object LabelNameObject: TLabel
      Left = 67
      Top = 6
      Width = 52
      Height = 13
      Caption = #1053#1072#1079#1074#1072#1085#1080#1077':'
    end
    object EditNameObject: TEdit
      Left = 125
      Top = 2
      Width = 457
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      Color = 14802912
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
    object EditNumberContract: TEdit
      Left = 662
      Top = 2
      Width = 90
      Height = 21
      Anchors = [akTop, akRight]
      Color = 14802912
      ReadOnly = True
      TabOrder = 1
    end
    object EditDateContract: TEdit
      Left = 845
      Top = 2
      Width = 66
      Height = 21
      Anchors = [akTop, akRight]
      Color = 14802912
      ReadOnly = True
      TabOrder = 2
    end
  end
  object PanelSSR: TPanel
    Left = 407
    Top = 108
    Width = 95
    Height = 53
    BevelOuter = bvNone
    Caption = 'PanelSSR'
    ParentBackground = False
    TabOrder = 5
    inline frSSR: TfrCalculationEstimateSSR
      Left = 0
      Top = 0
      Width = 95
      Height = 53
      Align = alClient
      TabOrder = 0
      ExplicitWidth = 95
      ExplicitHeight = 53
      inherited pnlSSR: TPanel
        Width = 95
        Height = 53
        ExplicitWidth = 95
        ExplicitHeight = 53
        inherited spl1: TSplitter
          Width = 95
          ExplicitWidth = 95
        end
        inherited pnlTop: TPanel
          Width = 95
          ExplicitWidth = 95
          inherited edt1: TEdit
            Width = 0
            ExplicitWidth = 0
          end
          inherited mmo1: TMemo
            Width = 0
            ExplicitWidth = 0
          end
        end
        inherited dbgrd1: TDBGrid
          Width = 95
        end
      end
    end
  end
  object pnlSummaryCalculations: TPanel
    Left = 290
    Top = 108
    Width = 100
    Height = 53
    BevelOuter = bvNone
    Caption = 'pnlSummaryCalculations'
    ParentBackground = False
    TabOrder = 4
    inline frSummaryCalculations: TfrCalculationEstimateSummaryCalculations
      Left = 0
      Top = 0
      Width = 100
      Height = 53
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      ExplicitWidth = 100
      ExplicitHeight = 53
      inherited grSummaryCalculation: TJvDBGrid
        Width = 100
        Height = 53
      end
    end
  end
  object pmSummaryCalculation: TPopupMenu
    Left = 424
    Top = 472
    object N1: TMenuItem
      Caption = #1050#1072#1088#1090#1086#1095#1082#1072
    end
    object N2: TMenuItem
      Caption = #1056#1072#1089#1095#1105#1090
    end
    object N3: TMenuItem
      Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1072' '#1088#1072#1089#1095#1105#1090#1086#1074
      OnClick = N3Click
    end
  end
  object pmSSRButtonAdd: TPopupMenu
    MenuAnimation = [maBottomToTop]
    Left = 352
    Top = 488
    object N4: TMenuItem
      Caption = #1054#1073#1098#1077#1082#1090
    end
    object N5: TMenuItem
      Caption = #1057#1084#1077#1090#1091
    end
  end
  object pmSSRButtonTax: TPopupMenu
    MenuAnimation = [maBottomToTop]
    Left = 80
    Top = 472
    object N6: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
    end
    object N7: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100
    end
  end
  object pmTableLeft: TPopupMenu
    Images = DM.ilIcons_16x16
    OnPopup = pmTableLeftPopup
    Left = 16
    Top = 488
    object PMAdd: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      ImageIndex = 42
      object PMAddRatMatMechEquip: TMenuItem
        Caption = #1056#1072#1089#1094#1077#1085#1082#1091'/'#1052#1072#1090#1077#1088#1080#1072#1083'/'#1052#1077#1093#1072#1085#1080#1079#1084'/'#1054#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1077
        object PMAddRatMatMechEquipRef: TMenuItem
          Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1072#1103
          OnClick = PMAddRatMatMechEquipRefClick
        end
        object PMAddRatMatMechEquipOwn: TMenuItem
          Caption = #1057#1086#1073#1089#1090#1074#1077#1085#1085#1072#1103
          OnClick = PMAddRatMatMechEquipOwnClick
        end
      end
      object PMAddAdditionTransportation: TMenuItem
        Caption = #1055#1077#1088#1077#1074#1086#1079#1082#1072
        object PMAddAdditionTransportationС310: TMenuItem
          Caption = #1040#1074#1090#1086#1084#1086#1073#1080#1083#1103#1084#1080' '#1089#1072#1084#1086#1089#1074#1072#1083#1072#1084#1080' '#1057'310'
          object PMAddAdditionTransportationС310Cargo: TMenuItem
            Tag = 6
            Caption = #1043#1088#1091#1079#1072
            OnClick = PMAddTranspClick
          end
          object PMAddAdditionTransportationС310Trash: TMenuItem
            Tag = 7
            Caption = #1052#1091#1089#1086#1088#1072
            OnClick = PMAddTranspClick
          end
        end
        object PMAddAdditionTransportationС311: TMenuItem
          Caption = #1041#1086#1088#1090#1086#1074#1099#1084#1080' '#1089#1072#1084#1086#1089#1074#1072#1083#1072#1084#1080' '#1057'311'
          object PMAddAdditionTransportationС311Cargo: TMenuItem
            Tag = 8
            Caption = #1043#1088#1091#1079#1072
            OnClick = PMAddTranspClick
          end
          object PMAddAdditionTransportationС311Trash: TMenuItem
            Tag = 9
            Caption = #1052#1091#1089#1086#1088#1072
            OnClick = PMAddTranspClick
          end
        end
      end
      object PMAddDump: TMenuItem
        Tag = 9
        Caption = #1055#1088#1080#1105#1084' '#1080' '#1079#1072#1093#1086#1088#1086#1085#1077#1085#1080#1077' '#1086#1090#1093#1086#1076#1086#1074' '#1041#1057'999-9901'
        OnClick = PMAddDumpClick
      end
      object PMAddAdditionHeating: TMenuItem
        Caption = #1055#1091#1089#1082' '#1080' '#1088#1077#1075#1091#1083#1080#1088#1086#1074#1082#1072' '#1086#1090#1086#1087#1083#1077#1085#1080#1103
        OnClick = PMAddAdditionHeatingClick
        object PMAddAdditionHeatingE18: TMenuItem
          Tag = 10
          Caption = #1056#1072#1089#1094#1077#1085#1082#1080' '#1045'18'
          OnClick = PMAddAdditionHeatingE18Click
        end
        object PMAddAdditionHeatingE20: TMenuItem
          Tag = 11
          Caption = #1056#1072#1089#1094#1077#1085#1082#1080' '#1045'20'
          OnClick = PMAddAdditionHeatingE18Click
        end
      end
      object PMAddAddition: TMenuItem
        Caption = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1086
        Visible = False
        object PopupMenuRatesAdd352: TMenuItem
          Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100' '#1082#1086#1101#1092'. '#1089#1086#1075#1083#1072#1089#1085#1086' '#1055#1088#1080#1082#1072#1079#1091' '#8470'352 '#1082' '#1074#1099#1076#1077#1083#1077#1085#1085#1099#1084' '#1089#1090#1088#1086#1082#1072#1084
          Visible = False
        end
        object N14: TMenuItem
          Caption = '-'
          Visible = False
        end
      end
      object PMSetTransPerc1: TMenuItem
        Tag = 1
        Caption = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1100' % '#1090#1088#1072#1085#1089#1087#1086#1088#1090#1072' '#1076#1083#1103' '#1057'103'
        OnClick = PMSetTransPercClick
      end
      object PMSetTransPerc2: TMenuItem
        Tag = 2
        Caption = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1100' % '#1090#1088#1072#1085#1089#1087#1086#1088#1090#1072' '#1076#1083#1103' '#1057'530, '#1057'533, '#1057'534'
        OnClick = PMSetTransPercClick
      end
      object PMSetTransPerc3: TMenuItem
        Tag = 3
        Caption = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1100' % '#1090#1088#1072#1085#1089#1087#1086#1088#1090#1072' '#1076#1083#1103' '#1074#1089#1077#1093' '#1084#1072#1090#1077#1088#1080#1072#1083#1086#1074
        OnClick = PMSetTransPercClick
      end
      object PMSetTransPerc4: TMenuItem
        Tag = 4
        Caption = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1100' % '#1090#1088#1072#1085#1089#1087#1086#1088#1090#1072' '#1076#1083#1103' '#1074#1089#1077#1093' '#1084#1072#1090#1077#1088#1080#1072#1083#1086#1074' '#1087#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
        OnClick = PMSetTransPercClick
      end
    end
    object PMInsertRow: TMenuItem
      Caption = #1042#1089#1090#1072#1074#1080#1090#1100' '#1089#1090#1088#1086#1082#1091
      OnClick = PMInsertRowClick
    end
    object PMCopy: TMenuItem
      Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100
      ImageIndex = 35
      OnClick = PMCopyClick
    end
    object PMPaste: TMenuItem
      Caption = #1042#1089#1090#1072#1074#1080#1090#1100
      OnClick = PMPasteClick
    end
    object PMDelete: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100
      ImageIndex = 38
      OnClick = PMDeleteClick
    end
    object mN12: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1085#1072#1073#1086#1088' '#1082#1086#1101#1092#1092#1080#1094#1080#1077#1085#1090#1086#1074
      OnClick = PopupMenuCoefAddSetClick
    end
    object PMEdit: TMenuItem
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      ImageIndex = 44
      OnClick = PMEditClick
    end
    object PMNumRow: TMenuItem
      Caption = #1059#1087#1088#1072#1074#1083#1077#1085#1080#1077' '#1085#1091#1084#1077#1088#1072#1094#1080#1077#1081
      OnClick = PMNumRowClick
      object PMRenumSelected: TMenuItem
        Caption = #1055#1088#1086#1085#1091#1084#1077#1088#1086#1074#1072#1090#1100' '#1074#1099#1076#1077#1083#1077#1085#1085#1099#1077' '#1089#1090#1088#1086#1082#1080
        Visible = False
        OnClick = PMRenumSelectedClick
      end
      object PMRenumPTM: TMenuItem
        Caption = #1055#1088#1086#1084#1091#1084#1077#1088#1086#1074#1072#1090#1100' '#1055#1058#1052
        OnClick = PMRenumPTMClick
      end
      object PMRenumCurSmet: TMenuItem
        Tag = 1
        Caption = #1055#1088#1086#1085#1091#1084#1077#1088#1086#1074#1072#1090#1100' '#1083#1086#1082#1072#1083#1100#1085#1091#1102' '#1089#1084#1077#1090#1091' '
        OnClick = PMRenumCurSmetClick
      end
      object PMRenumFromCurRowToSM: TMenuItem
        Tag = 2
        Caption = #1055#1088#1086#1085#1091#1084#1077#1088#1086#1074#1072#1090#1100' '#1086#1090' '#1090#1077#1082#1091#1097#1077#1081' '#1089#1090#1088#1086#1082#1080' '#1076#1086' '#1082#1086#1085#1094#1072' '#1083#1086#1082#1072#1083#1100#1085#1086#1081' '#1089#1084#1077#1090#1099
        OnClick = PMRenumCurSmetClick
      end
      object PMRenumAllList: TMenuItem
        Tag = 3
        Caption = #1055#1088#1086#1085#1091#1084#1077#1088#1086#1074#1072#1090#1100' '#1074#1089#1077' '#1083#1086#1082#1072#1083#1100#1085#1099#1077' '#1089#1084#1077#1090#1099
        OnClick = PMRenumCurSmetClick
      end
    end
    object mCopyToOwnBase: TMenuItem
      Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100' '#1074' '#1089#1086#1073#1089#1090#1074#1077#1085#1085#1091#1102' '#1073#1072#1079#1091
      OnClick = mCopyToOwnBaseClick
    end
    object N9: TMenuItem
      Caption = '-'
    end
    object PopupMenuTableLeftTechnicalPart: TMenuItem
      Caption = #1058#1077#1093'. '#1095#1072#1089#1090#1100
      object PopupMenuTableLeftTechnicalPart1: TMenuItem
        Tag = 1
        Caption = #1057#1086#1076#1077#1088#1078#1072#1085#1080#1077
        OnClick = PopupMenuTableLeftTechnicalPartClick
      end
      object PopupMenuTableLeftTechnicalPart2: TMenuItem
        Tag = 2
        Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082
        OnClick = PopupMenuTableLeftTechnicalPartClick
      end
      object PopupMenuTableLeftTechnicalPart3: TMenuItem
        Tag = 3
        Caption = #1055#1088#1077#1076#1080#1089#1083#1086#1074#1080#1077
        OnClick = PopupMenuTableLeftTechnicalPartClick
      end
      object PopupMenuTableLeftTechnicalPart4: TMenuItem
        Tag = 4
        Caption = #1058#1077#1093'. '#1095#1072#1089#1090#1100
        OnClick = PopupMenuTableLeftTechnicalPartClick
      end
      object PopupMenuTableLeftTechnicalPart5: TMenuItem
        Tag = 5
        Caption = #1058#1080#1090#1091#1083#1100#1085#1099#1081' '#1083#1080#1089#1090
        OnClick = PopupMenuTableLeftTechnicalPartClick
      end
      object PopupMenuTableLeftTechnicalPart6: TMenuItem
        Tag = 6
        Caption = #1055#1086#1089#1083#1077#1076#1085#1080#1081' '#1083#1080#1089#1090
        OnClick = PopupMenuTableLeftTechnicalPartClick
      end
    end
    object ModeData: TMenuItem
      Caption = #1056#1077#1078#1080#1084' '#1076#1072#1085#1085#1099#1093
      object Normal: TMenuItem
        Caption = #1053#1086#1088#1084#1072#1083#1100#1085#1099#1081
        Checked = True
      end
      object Extended: TMenuItem
        Caption = #1056#1072#1089#1096#1080#1088#1077#1085#1085#1099#1081
        Enabled = False
      end
    end
    object N22: TMenuItem
      Caption = '-'
      Visible = False
    end
    object StringGridRatesColumns: TMenuItem
      Caption = #1050#1086#1083#1086#1085#1082#1080
      ImageIndex = 52
      Visible = False
    end
    object PMCoefOrders: TMenuItem
      Caption = #1050#1086#1101#1092#1092#1080#1094#1080#1077#1085#1090' '#1087#1086' '#1087#1088#1080#1082#1072#1079#1072#1084
      Visible = False
    end
    object mN11: TMenuItem
      Caption = '-'
    end
    object mAddLocal: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1083#1086#1082#1072#1083#1100#1085#1091#1102' '#1089#1084#1077#1090#1091
      OnClick = mAddLocalClick
    end
    object mAddPTM: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1088#1072#1079#1076#1077#1083' '#1055#1058#1052
      OnClick = mAddPTMClick
    end
    object mEditEstimate: TMenuItem
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      ImageIndex = 44
      OnClick = mEditEstimateClick
    end
    object mBaseData: TMenuItem
      Caption = #1048#1089#1093#1086#1076#1085#1099#1077' '#1076#1072#1085#1085#1099#1077
      OnClick = mBaseDataClick
    end
    object mDelEstimate: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100
      ImageIndex = 38
      OnClick = mDelEstimateClick
    end
  end
  object pmMaterials: TPopupMenu
    Images = DM.ilIcons_16x16
    OnPopup = pmMaterialsPopup
    Left = 200
    Top = 472
    object PMMatEdit: TMenuItem
      AutoHotkeys = maAutomatic
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      ImageIndex = 44
      OnClick = PMMatMechEditClick
    end
    object PMTransPerc: TMenuItem
      Caption = '% '#1090#1088#1072#1085#1089#1087#1086#1088#1090#1072
      OnClick = PMTransPercClick
      object PMTrPerc1: TMenuItem
        Tag = 1
        Caption = #1052#1072#1090#1077#1088#1080#1072#1083#1099' '#1076#1083#1103' '#1086#1073#1097#1077#1089#1090#1074#1077#1085#1085#1099#1093' '#1088#1072#1073#1086#1090
        OnClick = PMTrPerc0Click
      end
      object PMTrPerc2: TMenuItem
        Tag = 2
        Caption = #1052#1077#1090#1072#1083#1080#1095#1077#1089#1082#1080#1077' '#1082#1086#1085#1089#1090#1088#1091#1082#1094#1080#1080
        OnClick = PMTrPerc0Click
      end
      object PMTrPerc3: TMenuItem
        Tag = 3
        Caption = #1052#1072#1090#1077#1088#1080#1072#1083#1099' '#1076#1083#1103' '#1089#1072#1085#1080#1090#1072#1088#1085#1086'-'#1090#1077#1093#1085#1080#1095#1077#1089#1082#1080#1093' '#1088#1072#1073#1086#1090
        OnClick = PMTrPerc0Click
      end
      object PMTrPerc4: TMenuItem
        Tag = 4
        Caption = #1052#1072#1090#1077#1088#1080#1072#1083#1099' '#1076#1083#1103' '#1101#1083#1077#1082#1090#1088#1086#1084#1086#1085#1090#1072#1078#1085#1099#1093' '#1088#1072#1073#1086#1090
        OnClick = PMTrPerc0Click
      end
      object PMTrPerc5: TMenuItem
        Tag = 5
        Caption = #1052#1072#1090#1077#1088#1080#1072#1083#1099' '#1074' '#1087#1086#1089#1090#1088#1086#1077#1095#1085#1099#1093' '#1091#1089#1083#1086#1074#1080#1103#1093
        OnClick = PMTrPerc0Click
      end
      object PMTrPerc0: TMenuItem
        Caption = '% '#1087#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
        OnClick = PMTrPerc0Click
      end
    end
    object PMMatManPrice: TMenuItem
      Tag = 2
      Caption = #1062#1077#1085#1099' '#1087#1086' '#1085#1072#1082#1083#1072#1076#1085#1099#1084
      OnClick = PMMatManPriceClick
    end
    object PMUseTransPerc: TMenuItem
      Caption = #1048#1089#1087#1086#1083#1100#1079#1086#1074#1072#1090#1100' % '#1090#1088#1072#1085#1089#1087#1086#1088#1090#1072
      OnClick = PMUseTransPercClick
    end
    object PMUseTransForThisCount: TMenuItem
      Caption = #1048#1089#1087#1086#1083#1100#1079#1086#1074#1072#1090#1100' '#1076#1083#1103' '#1079#1072#1076#1072#1085#1085#1086#1075#1086' '#1082#1086#1083'-'#1074#1072
      OnClick = PMUseTransForThisCountClick
    end
    object PMCalcMat: TMenuItem
      Caption = #1050#1072#1083#1100#1082#1091#1083#1103#1090#1086#1088' '#1094#1077#1085#1099
      OnClick = PMCalcMatClick
    end
    object N10: TMenuItem
      Caption = '-'
    end
    object PMMatFromRates: TMenuItem
      Caption = #1042#1099#1085#1077#1089#1090#1080' '#1079#1072' '#1088#1072#1089#1094#1077#1085#1082#1091
      ImageIndex = 6
      OnClick = PMMatFromRatesClick
    end
    object PMMatAddToRate: TMenuItem
      Tag = 2
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1074' '#1088#1072#1089#1094#1077#1085#1082#1091
      OnClick = PMMatAddToRateClick
    end
    object PMMatReplace: TMenuItem
      Caption = #1047#1072#1084#1077#1085#1080#1090#1100' '#1084#1072#1090#1077#1088#1080#1072#1083' / '#1055' '#1085#1072' '#1057
      OnClick = ReplacementClick
    end
    object PMMatDelete: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100
      ImageIndex = 38
      OnClick = PMMatDeleteClick
    end
    object PMMatRestore: TMenuItem
      Caption = #1042#1086#1089#1089#1090#1072#1085#1086#1074#1080#1090#1100
      ImageIndex = 49
      OnClick = PMMatRestoreClick
    end
    object N12: TMenuItem
      Caption = '-'
    end
    object PMMatAutoRep: TMenuItem
      Caption = #1040#1074#1090#1086#1079#1072#1084#1077#1085#1072' '#1084#1072#1090#1077#1088#1080#1083#1086#1074
      Checked = True
      OnClick = PMMechAutoRepClick
    end
  end
  object pmCoef: TPopupMenu
    OnPopup = pmCoefPopup
    Left = 504
    Top = 488
    object PopupMenuCoefCopy: TMenuItem
      Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100
      Visible = False
    end
    object PopupMenuCoefSeparator1: TMenuItem
      Caption = '-'
      Visible = False
    end
    object PopupMenuCoefAddSet: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1085#1072#1073#1086#1088' '#1082#1086#1101#1092#1092#1080#1094#1080#1077#1085#1090#1086#1074
      OnClick = PopupMenuCoefAddSetClick
    end
    object PopupMenuCoefDeleteSet: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1085#1072#1073#1086#1088' '#1082#1086#1101#1092#1092#1080#1094#1080#1077#1085#1090#1086#1074
      OnClick = PopupMenuCoefDeleteSetClick
    end
    object PopupMenuCoefOrders: TMenuItem
      Caption = #1048#1089#1087#1086#1083#1100#1079#1086#1074#1072#1090#1100' '#1082#1086#1101#1092#1092#1080#1094#1080#1077#1085#1090' '#1082' '#1047#1055' '#1087#1086' '#1087#1086#1089#1090#1072#1085#1086#1074#1083#1077#1085#1080#1102' '#8470'5'
      Checked = True
      Visible = False
      OnClick = PopupMenuCoefOrdersClick
    end
  end
  object pmMechanizms: TPopupMenu
    Images = DM.ilIcons_16x16
    OnPopup = pmMechanizmsPopup
    Left = 248
    Top = 488
    object PMMechEdit: TMenuItem
      Tag = 1
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      ImageIndex = 44
      OnClick = PMMatMechEditClick
    end
    object PMMechManPrice: TMenuItem
      Tag = 3
      Caption = #1062#1077#1085#1099' '#1087#1086' '#1085#1072#1082#1083#1072#1076#1085#1099#1084
      OnClick = PMMatManPriceClick
    end
    object PMCalcMech: TMenuItem
      Caption = #1050#1072#1083#1100#1082#1091#1083#1103#1090#1086#1088' '#1094#1077#1085#1099
      OnClick = PMCalcMechClick
    end
    object N8: TMenuItem
      Caption = '-'
    end
    object PMMechFromRates: TMenuItem
      Caption = #1042#1099#1085#1077#1089#1090#1080' '#1079#1072' '#1088#1072#1089#1094#1077#1085#1082#1091
      ImageIndex = 6
      OnClick = PMMechFromRatesClick
    end
    object PMMechReplace: TMenuItem
      Tag = 1
      Caption = #1047#1072#1084#1077#1085#1080#1090#1100' '#1084#1077#1093#1072#1085#1080#1079#1084
      OnClick = ReplacementClick
    end
    object PMMechAddToRate: TMenuItem
      Tag = 3
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1074' '#1088#1072#1089#1094#1077#1085#1082#1091
      OnClick = PMMatAddToRateClick
    end
    object PMMechDelete: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100
      ImageIndex = 38
      OnClick = PMMechDeleteClick
    end
    object PMMechRestore: TMenuItem
      Caption = #1042#1086#1089#1089#1090#1072#1085#1086#1074#1080#1090#1100
      ImageIndex = 49
      OnClick = PMMechRestoreClick
    end
    object N13: TMenuItem
      Caption = '-'
    end
    object PMMechAutoRep: TMenuItem
      Caption = #1040#1074#1090#1086#1079#1072#1084#1077#1085#1072' '#1084#1077#1093#1072#1085#1080#1079#1084#1086#1074
      Checked = True
      OnClick = PMMechAutoRepClick
    end
  end
  object qrDescription: TFDQuery
    BeforeInsert = qrMechanizmBeforeInsert
    AfterScroll = qrDescriptionAfterScroll
    Connection = DM.Connect
    Transaction = DM.Read
    UpdateTransaction = DM.Write
    SQL.Strings = (
      'SELECT FIRST_NAME AS "work"'
      'FROM normativ_directory '
      
        'WHERE type_directory = 6 AND parent_id=(SELECT normativg.normati' +
        'v_directory_id FROM normativg WHERE normativg.normativ_id = :IdN' +
        'orm)'
      'ORDER BY FIRST_NAME;')
    Left = 616
    Top = 80
    ParamData = <
      item
        Name = 'IDNORM'
        DataType = ftInteger
        ParamType = ptInput
        Size = 10
        Value = 0
      end>
    object qrDescriptionwork: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'work'
      Origin = 'work'
      ProviderFlags = []
      ReadOnly = True
      Size = 1024
    end
  end
  object qrTemp: TFDQuery
    Connection = DM.Connect
    Transaction = DM.Read
    UpdateTransaction = DM.Write
    FormatOptions.AssignedValues = [fvMapRules, fvDefaultParamDataType]
    FormatOptions.OwnMapRules = True
    FormatOptions.MapRules = <
      item
        SourceDataType = dtByteString
        TargetDataType = dtAnsiString
      end>
    FormatOptions.DefaultParamDataType = ftBCD
    Left = 224
    Top = 288
  end
  object qrTemp1: TFDQuery
    Connection = DM.Connect
    Transaction = DM.Read
    UpdateTransaction = DM.Write
    Left = 288
    Top = 288
  end
  object dsDescription: TDataSource
    DataSet = qrDescription
    Left = 656
    Top = 80
  end
  object qrMechanizm: TFDQuery
    BeforeInsert = qrMechanizmBeforeInsert
    BeforeScroll = qrMechanizmBeforeScroll
    AfterScroll = qrMechanizmAfterScroll
    CachedUpdates = True
    Connection = DM.Connect
    Transaction = DM.Read
    UpdateTransaction = DM.Write
    FetchOptions.AssignedValues = [evItems]
    FetchOptions.Items = [fiBlobs, fiDetails]
    FormatOptions.AssignedValues = [fvMapRules, fvMaxBcdPrecision, fvMaxBcdScale, fvFmtDisplayNumeric]
    FormatOptions.OwnMapRules = True
    FormatOptions.MapRules = <
      item
        SourceDataType = dtMemo
        TargetDataType = dtAnsiString
      end
      item
        SourceDataType = dtUInt32
        TargetDataType = dtInt32
      end
      item
        SourceDataType = dtBCD
        TargetDataType = dtDouble
      end>
    FormatOptions.MaxBcdPrecision = 19
    FormatOptions.MaxBcdScale = 8
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate, uvUpdateChngFields, uvCheckRequired, uvCheckReadOnly, uvCheckUpdatable, uvUpdateNonBaseFields]
    UpdateOptions.UpdateChangedFields = False
    UpdateOptions.UpdateNonBaseFields = True
    UpdateOptions.CheckRequired = False
    UpdateOptions.CheckReadOnly = False
    UpdateOptions.CheckUpdatable = False
    UpdateOptions.KeyFields = 'ID'
    SQL.Strings = (
      '/*'#1048#1089#1087#1086#1083#1100#1079#1091#1077#1090#1089#1103' '#1076#1083#1103' '#1086#1090#1083#1072#1076#1082#1080'*/'
      
        'SELECT *, 0.0 as SCROLL FROM mechanizmcard_temp WHERE ((:Type = ' +
        '0) and (ID = :IDValue)) or ((:Type = 1) and (ID_CARD_RATE_RATE =' +
        ' :IDValue)) ORDER BY ID;')
    Left = 616
    Top = 126
    ParamData = <
      item
        Name = 'TYPE'
        ParamType = ptInput
      end
      item
        Name = 'IDVALUE'
        ParamType = ptInput
      end>
    object qrMechanizmID: TFDAutoIncField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qrMechanizmID_CARD_RATE: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'ID_CARD_RATE'
      Origin = 'ID_CARD_RATE'
    end
    object qrMechanizmMECH_CODE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'MECH_CODE'
      Origin = 'MECH_CODE'
      Size = 15
    end
    object qrMechanizmMECH_NAME: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'MECH_NAME'
      Origin = 'MECH_NAME'
      Size = 32767
    end
    object qrMechanizmMECH_UNIT: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'MECH_UNIT'
      Origin = 'MECH_UNIT'
      Size = 100
    end
    object qrMechanizmFROM_RATE: TByteField
      AutoGenerateValue = arDefault
      FieldName = 'FROM_RATE'
      Origin = 'FROM_RATE'
    end
    object qrMechanizmNDS: TIntegerField
      FieldName = 'NDS'
      OnChange = MechRowChange
    end
    object qrMechanizmPROC_PODR: TSmallintField
      DisplayWidth = 3
      FieldName = 'PROC_PODR'
      OnChange = MechRowChange
      DisplayFormat = '##0'
      EditFormat = '##0'
    end
    object qrMechanizmPROC_ZAC: TSmallintField
      DisplayWidth = 3
      FieldName = 'PROC_ZAC'
      OnChange = MechRowChange
      DisplayFormat = '##0'
      EditFormat = '##0'
    end
    object qrMechanizmSCROLL: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'SCROLL'
      Origin = 'SCROLL'
      ProviderFlags = []
    end
    object qrMechanizmNUM: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'NUM'
      Origin = 'NUM'
      ProviderFlags = []
    end
    object qrMechanizmTITLE: TIntegerField
      FieldName = 'TITLE'
    end
    object qrMechanizmID_REPLACED: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'ID_REPLACED'
      Origin = 'ID_REPLACED'
    end
    object qrMechanizmREPLACED: TByteField
      AutoGenerateValue = arDefault
      FieldName = 'REPLACED'
      Origin = 'REPLACED'
    end
    object qrMechanizmADDED: TByteField
      FieldName = 'ADDED'
    end
    object qrMechanizmDELETED: TByteField
      FieldName = 'DELETED'
    end
    object qrMechanizmMECH_ID: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'MECH_ID'
      Origin = 'MECH_ID'
    end
    object qrMechanizmMECH_NORMA: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'MECH_NORMA'
      Origin = 'MECH_NORMA'
      OnChange = MechRowChange
      Precision = 24
    end
    object qrMechanizmMECH_COUNT: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'MECH_COUNT'
      Origin = 'MECH_COUNT'
      OnChange = MechRowChange
      Precision = 24
    end
    object qrMechanizmMECH_SUM_NO_NDS: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'MECH_SUM_NO_NDS'
      Origin = 'MECH_SUM_NO_NDS'
      Precision = 24
    end
    object qrMechanizmMECH_SUM_NDS: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'MECH_SUM_NDS'
      Origin = 'MECH_SUM_NDS'
      Precision = 24
    end
    object qrMechanizmMECH_ZPSUM_NO_NDS: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'MECH_ZPSUM_NO_NDS'
      Origin = 'MECH_ZPSUM_NO_NDS'
      Precision = 24
    end
    object qrMechanizmMECH_ZPSUM_NDS: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'MECH_ZPSUM_NDS'
      Origin = 'MECH_ZPSUM_NDS'
      Precision = 24
    end
    object qrMechanizmCOAST_NO_NDS: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'COAST_NO_NDS'
      Origin = 'COAST_NO_NDS'
      OnChange = MechRowChange
      Precision = 24
    end
    object qrMechanizmCOAST_NDS: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'COAST_NDS'
      Origin = 'COAST_NDS'
      OnChange = MechRowChange
      Precision = 24
    end
    object qrMechanizmZP_MACH_NO_NDS: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'ZP_MACH_NO_NDS'
      Origin = 'ZP_MACH_NO_NDS'
      OnChange = MechRowChange
      Precision = 24
    end
    object qrMechanizmZP_MACH_NDS: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'ZP_MACH_NDS'
      Origin = 'ZP_MACH_NDS'
      OnChange = MechRowChange
      Precision = 24
    end
    object qrMechanizmPRICE_NO_NDS: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'PRICE_NO_NDS'
      Origin = 'PRICE_NO_NDS'
      Precision = 24
    end
    object qrMechanizmPRICE_NDS: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'PRICE_NDS'
      Origin = 'PRICE_NDS'
      Precision = 24
    end
    object qrMechanizmZPPRICE_NO_NDS: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'ZPPRICE_NO_NDS'
      Origin = 'ZPPRICE_NO_NDS'
      Precision = 24
    end
    object qrMechanizmZPPRICE_NDS: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'ZPPRICE_NDS'
      Origin = 'ZPPRICE_NDS'
      Precision = 24
    end
    object qrMechanizmFCOAST_NO_NDS: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'FCOAST_NO_NDS'
      Origin = 'FCOAST_NO_NDS'
      OnChange = MechRowChange
      Precision = 24
    end
    object qrMechanizmFCOAST_NDS: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'FCOAST_NDS'
      Origin = 'FCOAST_NDS'
      OnChange = MechRowChange
      Precision = 24
    end
    object qrMechanizmFZP_MACH_NO_NDS: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'FZP_MACH_NO_NDS'
      Origin = 'FZP_MACH_NO_NDS'
      OnChange = MechRowChange
      Precision = 24
    end
    object qrMechanizmFZP_MACH_NDS: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'FZP_MACH_NDS'
      Origin = 'FZP_MACH_NDS'
      OnChange = MechRowChange
      Precision = 24
    end
    object qrMechanizmFPRICE_NO_NDS: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'FPRICE_NO_NDS'
      Origin = 'FPRICE_NO_NDS'
      OnChange = MechRowChange
      Precision = 24
    end
    object qrMechanizmFPRICE_NDS: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'FPRICE_NDS'
      Origin = 'FPRICE_NDS'
      OnChange = MechRowChange
      Precision = 24
    end
    object qrMechanizmFZPPRICE_NO_NDS: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'FZPPRICE_NO_NDS'
      Origin = 'FZPPRICE_NO_NDS'
      OnChange = MechRowChange
      Precision = 24
    end
    object qrMechanizmFZPPRICE_NDS: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'FZPPRICE_NDS'
      Origin = 'FZPPRICE_NDS'
      OnChange = MechRowChange
      Precision = 24
    end
    object qrMechanizmNORMATIV: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'NORMATIV'
      Origin = 'NORMATIV'
      OnChange = MechRowChange
      Precision = 24
    end
    object qrMechanizmNORM_TRYD: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'NORM_TRYD'
      Origin = 'NORM_TRYD'
      OnChange = MechRowChange
      Precision = 24
    end
    object qrMechanizmTERYDOZATR: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'TERYDOZATR'
      Origin = 'TERYDOZATR'
      OnChange = MechRowChange
      Precision = 24
    end
    object qrMechanizmKOEF: TFloatField
      FieldName = 'KOEF'
    end
    object qrMechanizmBASE: TByteField
      FieldName = 'BASE'
    end
  end
  object dsMechanizm: TDataSource
    DataSet = qrMechanizm
    Left = 656
    Top = 126
  end
  object qrMaterial: TFDQuery
    BeforeInsert = qrMechanizmBeforeInsert
    BeforeScroll = qrMaterialBeforeScroll
    AfterScroll = qrMaterialAfterScroll
    CachedUpdates = True
    Connection = DM.Connect
    Transaction = DM.Read
    UpdateTransaction = DM.Write
    FetchOptions.AssignedValues = [evItems]
    FetchOptions.Items = [fiBlobs, fiDetails]
    FormatOptions.AssignedValues = [fvMapRules, fvMaxBcdPrecision, fvMaxBcdScale, fvFmtDisplayNumeric]
    FormatOptions.OwnMapRules = True
    FormatOptions.MapRules = <
      item
        SourceDataType = dtMemo
        TargetDataType = dtAnsiString
      end
      item
        SourceDataType = dtUInt16
        TargetDataType = dtInt32
      end
      item
        SourceDataType = dtUInt32
        TargetDataType = dtInt32
      end
      item
        SourceDataType = dtBCD
        TargetDataType = dtDouble
      end>
    FormatOptions.MaxBcdPrecision = 19
    FormatOptions.MaxBcdScale = 8
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate, uvUpdateChngFields, uvCheckRequired, uvCheckReadOnly, uvCheckUpdatable, uvUpdateNonBaseFields]
    UpdateOptions.UpdateChangedFields = False
    UpdateOptions.UpdateNonBaseFields = True
    UpdateOptions.CheckRequired = False
    UpdateOptions.CheckReadOnly = False
    UpdateOptions.CheckUpdatable = False
    UpdateOptions.KeyFields = 'ID'
    SQL.Strings = (
      
        'SELECT *, 0 as NUM, 0 as SCROLL, 0 as TITLE FROM materialcard WH' +
        'ERE ((:Type = 0) and (ID = :IDValue)) or ((:Type = 1) and (ID_CA' +
        'RD_RATE = :IDValue)) ORDER BY ID;')
    Left = 512
    Top = 128
    ParamData = <
      item
        Name = 'TYPE'
        ParamType = ptInput
      end
      item
        Name = 'IDVALUE'
        ParamType = ptInput
      end>
    object qrMaterialID: TIntegerField
      FieldName = 'ID'
    end
    object qrMaterialID_CARD_RATE: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'ID_CARD_RATE'
      Origin = 'ID_CARD_RATE'
    end
    object qrMaterialID_REPLACED: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'ID_REPLACED'
      Origin = 'ID_REPLACED'
    end
    object qrMaterialCONSIDERED: TByteField
      AutoGenerateValue = arDefault
      FieldName = 'CONSIDERED'
      Origin = 'CONSIDERED'
    end
    object qrMaterialREPLACED: TByteField
      AutoGenerateValue = arDefault
      FieldName = 'REPLACED'
      Origin = 'REPLACED'
    end
    object qrMaterialMAT_ID: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'MAT_ID'
      Origin = 'MAT_ID'
    end
    object qrMaterialFROM_RATE: TByteField
      AutoGenerateValue = arDefault
      FieldName = 'FROM_RATE'
      Origin = 'FROM_RATE'
    end
    object qrMaterialMAT_NAME: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'MAT_NAME'
      Origin = 'MAT_NAME'
      Size = 32767
    end
    object qrMaterialMAT_CODE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'MAT_CODE'
      Origin = 'MAT_CODE'
      Size = 15
    end
    object qrMaterialMAT_UNIT: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'MAT_UNIT'
      Origin = 'MAT_UNIT'
      Size = 100
    end
    object qrMaterialNDS: TIntegerField
      FieldName = 'NDS'
      OnChange = MatRowChange
    end
    object qrMaterialSTATE_MATERIAL: TShortintField
      AutoGenerateValue = arDefault
      FieldName = 'STATE_MATERIAL'
      Origin = 'STATE_MATERIAL'
    end
    object qrMaterialSTATE_TRANSPORT: TByteField
      AutoGenerateValue = arDefault
      FieldName = 'STATE_TRANSPORT'
      Origin = 'STATE_TRANSPORT'
    end
    object qrMaterialMAT_PROC_ZAC: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'MAT_PROC_ZAC'
      Origin = 'MAT_PROC_ZAC'
      OnChange = MatRowChange
    end
    object qrMaterialMAT_PROC_PODR: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'MAT_PROC_PODR'
      Origin = 'MAT_PROC_PODR'
      OnChange = MatRowChange
    end
    object qrMaterialTRANSP_PROC_ZAC: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'TRANSP_PROC_ZAC'
      Origin = 'TRANSP_PROC_ZAC'
      OnChange = MatRowChange
    end
    object qrMaterialTRANSP_PROC_PODR: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'TRANSP_PROC_PODR'
      Origin = 'TRANSP_PROC_PODR'
      OnChange = MatRowChange
    end
    object qrMaterialNUM: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'NUM'
      Origin = 'NUM'
      ProviderFlags = []
    end
    object qrMaterialSCROLL: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'SCROLL'
      Origin = 'SCROLL'
      ProviderFlags = []
    end
    object qrMaterialTITLE: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'TITLE'
      Origin = 'TITLE'
      ProviderFlags = []
      ReadOnly = True
    end
    object qrMaterialCONS_REPLASED: TByteField
      FieldName = 'CONS_REPLASED'
    end
    object qrMaterialADDED: TByteField
      FieldName = 'ADDED'
    end
    object qrMaterialDELETED: TByteField
      FieldName = 'DELETED'
    end
    object qrMaterialMAT_NORMA: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'MAT_NORMA'
      Origin = 'MAT_NORMA'
      OnChange = MatRowChange
      Precision = 24
    end
    object qrMaterialMAT_COUNT: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'MAT_COUNT'
      Origin = 'MAT_COUNT'
      OnChange = MatRowChange
      Precision = 24
    end
    object qrMaterialMAT_SUM_NDS: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'MAT_SUM_NDS'
      Origin = 'MAT_SUM_NDS'
      Precision = 24
    end
    object qrMaterialMAT_SUM_NO_NDS: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'MAT_SUM_NO_NDS'
      Origin = 'MAT_SUM_NO_NDS'
      Precision = 24
    end
    object qrMaterialMAT_TRANSP_NO_NDS: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'MAT_TRANSP_NO_NDS'
      Origin = 'MAT_TRANSP_NO_NDS'
      Precision = 24
    end
    object qrMaterialMAT_TRANSP_NDS: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'MAT_TRANSP_NDS'
      Origin = 'MAT_TRANSP_NDS'
      Precision = 24
    end
    object qrMaterialCOAST_NO_NDS: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'COAST_NO_NDS'
      Origin = 'COAST_NO_NDS'
      OnChange = MatRowChange
      Precision = 24
    end
    object qrMaterialCOAST_NDS: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'COAST_NDS'
      Origin = 'COAST_NDS'
      OnChange = MatRowChange
      Precision = 24
    end
    object qrMaterialTRANSP_NO_NDS: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'TRANSP_NO_NDS'
      Origin = 'TRANSP_NO_NDS'
      OnChange = MatRowChange
      Precision = 24
    end
    object qrMaterialPROC_TRANSP: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'PROC_TRANSP'
      Origin = 'PROC_TRANSP'
      OnChange = MatRowChange
      Precision = 24
    end
    object qrMaterialTRANSP_NDS: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'TRANSP_NDS'
      Origin = 'TRANSP_NDS'
      OnChange = MatRowChange
      Precision = 24
    end
    object qrMaterialPRICE_NO_NDS: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'PRICE_NO_NDS'
      Origin = 'PRICE_NO_NDS'
      Precision = 24
    end
    object qrMaterialPRICE_NDS: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'PRICE_NDS'
      Origin = 'PRICE_NDS'
      Precision = 24
    end
    object qrMaterialFCOAST_NO_NDS: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'FCOAST_NO_NDS'
      Origin = 'FCOAST_NO_NDS'
      OnChange = MatRowChange
      Precision = 24
    end
    object qrMaterialFCOAST_NDS: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'FCOAST_NDS'
      Origin = 'FCOAST_NDS'
      OnChange = MatRowChange
      Precision = 24
    end
    object qrMaterialFTRANSP_NO_NDS: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'FTRANSP_NO_NDS'
      Origin = 'FTRANSP_NO_NDS'
      OnChange = MatRowChange
      Precision = 24
    end
    object qrMaterialFTRANSP_NDS: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'FTRANSP_NDS'
      Origin = 'FTRANSP_NDS'
      OnChange = MatRowChange
      Precision = 24
    end
    object qrMaterialFPRICE_NO_NDS: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'FPRICE_NO_NDS'
      Origin = 'FPRICE_NO_NDS'
      Precision = 24
    end
    object qrMaterialFPRICE_NDS: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'FPRICE_NDS'
      Origin = 'FPRICE_NDS'
      Precision = 24
    end
    object qrMaterialKOEFMR: TFloatField
      FieldName = 'KOEFMR'
    end
    object qrMaterialFTRANSCOUNT: TFMTBCDField
      FieldName = 'FTRANSCOUNT'
      OnChange = MatRowChange
    end
    object qrMaterialBASE: TByteField
      FieldName = 'BASE'
    end
  end
  object dsMaterial: TDataSource
    DataSet = qrMaterial
    Left = 552
    Top = 128
  end
  object qrDevices: TFDQuery
    BeforeInsert = qrMechanizmBeforeInsert
    BeforeScroll = qrDevicesBeforeScroll
    AfterScroll = qrDevicesAfterScroll
    OnCalcFields = qrMechanizmCalcFields
    Connection = DM.Connect
    Transaction = DM.Read
    UpdateTransaction = DM.Write
    FormatOptions.AssignedValues = [fvMapRules, fvMaxBcdPrecision, fvMaxBcdScale, fvFmtDisplayNumeric]
    FormatOptions.OwnMapRules = True
    FormatOptions.MapRules = <
      item
        SourceDataType = dtMemo
        TargetDataType = dtAnsiString
      end
      item
        SourceDataType = dtUInt32
        TargetDataType = dtInt32
      end
      item
        SourceDataType = dtUInt16
        TargetDataType = dtInt32
      end>
    FormatOptions.MaxBcdPrecision = 19
    FormatOptions.MaxBcdScale = 8
    UpdateOptions.KeyFields = 'ID'
    SQL.Strings = (
      '/*'#1048#1089#1087#1086#1083#1100#1079#1091#1077#1090#1089#1103' '#1076#1083#1103' '#1086#1090#1083#1072#1076#1082#1080'*/'
      
        'SELECT *, 0.0 as SCROLL FROM devicescard_temp WHERE (ID = :IDVal' +
        'ue) ORDER BY ID;')
    Left = 712
    Top = 128
    ParamData = <
      item
        Name = 'IDVALUE'
        DataType = ftInteger
        ParamType = ptInput
        Value = 12
      end>
    object qrDevicesDEVICE_ID: TIntegerField
      FieldName = 'DEVICE_ID'
      Origin = 'DEVICE_ID'
      Required = True
    end
    object qrDevicesDEVICE_CODE: TStringField
      FieldName = 'DEVICE_CODE'
      Origin = 'DEVICE_CODE'
      Required = True
      Size = 15
    end
    object qrDevicesDEVICE_NAME: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DEVICE_NAME'
      Origin = 'DEVICE_NAME'
      Size = 300
    end
    object qrDevicesDEVICE_COUNT: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'DEVICE_COUNT'
      Origin = 'DEVICE_COUNT'
      OnChange = DevRowChange
      Precision = 24
    end
    object qrDevicesDEVICE_UNIT: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DEVICE_UNIT'
      Origin = 'DEVICE_UNIT'
    end
    object qrDevicesDEVICE_SUM_NDS: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'DEVICE_SUM_NDS'
      Origin = 'DEVICE_SUM_NDS'
      OnChange = DevRowChange
      Precision = 24
    end
    object qrDevicesDEVICE_SUM_NO_NDS: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'DEVICE_SUM_NO_NDS'
      Origin = 'DEVICE_SUM_NO_NDS'
      OnChange = DevRowChange
      Precision = 24
    end
    object qrDevicesDEVICE_TRANSP_NO_NDS: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'DEVICE_TRANSP_NO_NDS'
      Origin = 'DEVICE_TRANSP_NO_NDS'
      OnChange = DevRowChange
      Precision = 24
    end
    object qrDevicesDEVICE_TRANSP_NDS: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'DEVICE_TRANSP_NDS'
      Origin = 'DEVICE_TRANSP_NDS'
      OnChange = DevRowChange
      Precision = 24
    end
    object qrDevicesFCOAST_NO_NDS: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'FCOAST_NO_NDS'
      Origin = 'FCOAST_NO_NDS'
      OnChange = DevRowChange
      Precision = 24
    end
    object qrDevicesFCOAST_NDS: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'FCOAST_NDS'
      Origin = 'FCOAST_NDS'
      OnChange = DevRowChange
      Precision = 24
    end
    object qrDevicesNDS: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'NDS'
      Origin = 'NDS'
      OnChange = DevRowChange
    end
    object qrDevicesFPRICE_NDS: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'FPRICE_NDS'
      Origin = 'FPRICE_NDS'
      OnChange = DevRowChange
      Precision = 24
    end
    object qrDevicesFPRICE_NO_NDS: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'FPRICE_NO_NDS'
      Origin = 'FPRICE_NO_NDS'
      OnChange = DevRowChange
      Precision = 24
    end
    object qrDevicesPROC_PODR: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'PROC_PODR'
      Origin = 'PROC_PODR'
      OnChange = DevRowChange
    end
    object qrDevicesPROC_ZAC: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'PROC_ZAC'
      Origin = 'PROC_ZAC'
      OnChange = DevRowChange
    end
    object qrDevicesTRANSP_PROC_PODR: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'TRANSP_PROC_PODR'
      Origin = 'TRANSP_PROC_PODR'
      OnChange = DevRowChange
    end
    object qrDevicesTRANSP_PROC_ZAC: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'TRANSP_PROC_ZAC'
      Origin = 'TRANSP_PROC_ZAC'
      OnChange = DevRowChange
    end
    object qrDevicesSCROLL: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'SCROLL'
      Origin = 'SCROLL'
      ProviderFlags = []
      ReadOnly = True
      Precision = 2
      Size = 1
    end
    object qrDevicesNUM: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'NUM'
      Calculated = True
    end
    object qrDevicesID: TIntegerField
      FieldName = 'ID'
    end
    object qrDevicesBASE: TByteField
      FieldName = 'BASE'
    end
  end
  object dsDevices: TDataSource
    DataSet = qrDevices
    Left = 752
    Top = 128
  end
  object pmDevices: TPopupMenu
    OnPopup = pmDevicesPopup
    Left = 296
    Top = 480
    object PMDevEdit: TMenuItem
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      OnClick = PMDevEditClick
    end
    object PMDevManPrice: TMenuItem
      Tag = 4
      Caption = #1062#1077#1085#1099' '#1087#1086' '#1085#1072#1082#1083#1072#1076#1085#1099#1084
      OnClick = PMMatManPriceClick
    end
    object PMCalcDevice: TMenuItem
      Caption = #1050#1072#1083#1100#1082#1091#1083#1103#1090#1086#1088' '#1094#1077#1085#1099
      OnClick = PMCalcDeviceClick
    end
    object N11: TMenuItem
      Caption = '-'
    end
    object PMDeviceReplace: TMenuItem
      Tag = 2
      Caption = #1047#1072#1084#1077#1085#1080#1090#1100' '#1086#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1077
      OnClick = ReplacementClick
    end
  end
  object qrCalculations: TFDQuery
    AfterOpen = qrCalculationsAfterOpen
    MasterSource = dsRatesEx
    MasterFields = 'SM_ID;ID_TYPE_DATA;ID_TABLES'
    Connection = DM.Connect
    Transaction = DM.Read
    UpdateTransaction = DM.Write
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    FormatOptions.AssignedValues = [fvMapRules, fvFmtDisplayNumeric]
    FormatOptions.OwnMapRules = True
    FormatOptions.MapRules = <
      item
        SourceDataType = dtMemo
        TargetDataType = dtAnsiString
      end
      item
        SourceDataType = dtByteString
        TargetDataType = dtAnsiString
      end
      item
        SourceDataType = dtBCD
        TargetDataType = dtDouble
      end
      item
        SourceDataType = dtBlob
        TargetDataType = dtAnsiString
      end
      item
        SourceDataType = dtFmtBCD
        TargetDataType = dtDouble
      end>
    FormatOptions.FmtDisplayNumeric = '### ### ### ##0.####'
    UpdateOptions.AssignedValues = [uvUpdateChngFields, uvCheckReadOnly, uvCheckUpdatable]
    UpdateOptions.UpdateChangedFields = False
    UpdateOptions.CheckReadOnly = False
    UpdateOptions.CheckUpdatable = False
    SQL.Strings = (
      'CALL CalcCalculation(:SM_ID, :ID_TYPE_DATA, :ID_TABLES, 1)')
    Left = 331
    Top = 424
    ParamData = <
      item
        Name = 'SM_ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'ID_TYPE_DATA'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'ID_TABLES'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object dsCalculations: TDataSource
    DataSet = qrCalculations
    Left = 404
    Top = 424
  end
  object qrDump: TFDQuery
    BeforeInsert = qrMechanizmBeforeInsert
    AfterScroll = qrDumpAfterScroll
    OnCalcFields = qrMechanizmCalcFields
    Connection = DM.Connect
    Transaction = DM.Read
    UpdateTransaction = DM.Write
    FormatOptions.AssignedValues = [fvMapRules, fvMaxBcdPrecision, fvMaxBcdScale, fvFmtDisplayNumeric]
    FormatOptions.OwnMapRules = True
    FormatOptions.MapRules = <
      item
        SourceDataType = dtMemo
        TargetDataType = dtAnsiString
      end
      item
        SourceDataType = dtUInt32
        TargetDataType = dtInt32
      end
      item
        SourceDataType = dtUInt16
        TargetDataType = dtInt32
      end>
    FormatOptions.MaxBcdPrecision = 19
    FormatOptions.MaxBcdScale = 8
    UpdateOptions.KeyFields = 'ID'
    SQL.Strings = (
      '/*'#1048#1089#1087#1086#1083#1100#1079#1091#1077#1090#1089#1103' '#1076#1083#1103' '#1086#1090#1083#1072#1076#1082#1080'*/'
      'SELECT * FROM dumpcard WHERE (ID = :IDValue) ORDER BY ID;')
    Left = 712
    Top = 85
    ParamData = <
      item
        Name = 'IDVALUE'
        DataType = ftInteger
        ParamType = ptInput
        Value = 11
      end>
    object qrDumpDUMP_NAME: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DUMP_NAME'
      Origin = 'DUMP_NAME'
      Size = 100
    end
    object qrDumpDUMP_CODE_JUST: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DUMP_CODE_JUST'
      Origin = 'DUMP_CODE_JUST'
      Size = 30
    end
    object qrDumpDUMP_JUST: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DUMP_JUST'
      Origin = 'DUMP_JUST'
      Size = 100
    end
    object qrDumpDUMP_UNIT: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DUMP_UNIT'
      Origin = 'DUMP_UNIT'
      Size = 30
    end
    object qrDumpDUMP_TYPE: TByteField
      AutoGenerateValue = arDefault
      FieldName = 'DUMP_TYPE'
      Origin = 'DUMP_TYPE'
    end
    object qrDumpWORK_UNIT: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'WORK_UNIT'
      Origin = 'WORK_UNIT'
      Size = 30
    end
    object qrDumpWORK_TYPE: TByteField
      AutoGenerateValue = arDefault
      FieldName = 'WORK_TYPE'
      Origin = 'WORK_TYPE'
    end
    object qrDumpNUM: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'NUM'
      Calculated = True
    end
    object qrDumpDUMP_COUNT: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'DUMP_COUNT'
      Origin = 'DUMP_COUNT'
      Precision = 24
    end
    object qrDumpDUMP_SUM_NDS: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'DUMP_SUM_NDS'
      Origin = 'DUMP_SUM_NDS'
      Precision = 24
    end
    object qrDumpDUMP_SUM_NO_NDS: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'DUMP_SUM_NO_NDS'
      Origin = 'DUMP_SUM_NO_NDS'
      Precision = 24
    end
    object qrDumpCOAST_NO_NDS: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'COAST_NO_NDS'
      Origin = 'COAST_NO_NDS'
      Precision = 24
    end
    object qrDumpCOAST_NDS: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'COAST_NDS'
      Origin = 'COAST_NDS'
      Precision = 24
    end
    object qrDumpWORK_COUNT: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'WORK_COUNT'
      Origin = 'WORK_COUNT'
      Precision = 24
    end
    object qrDumpWORK_YDW: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'WORK_YDW'
      Origin = 'WORK_YDW'
      Precision = 24
    end
    object qrDumpNDS: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'NDS'
      Origin = 'NDS'
    end
    object qrDumpPRICE_NDS: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'PRICE_NDS'
      Origin = 'PRICE_NDS'
      Precision = 24
    end
    object qrDumpPRICE_NO_NDS: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'PRICE_NO_NDS'
      Origin = 'PRICE_NO_NDS'
      Precision = 24
    end
    object qrDumpFCOAST_NDS: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'FCOAST_NDS'
      Origin = 'FCOAST_NDS'
      Precision = 24
    end
    object qrDumpFCOAST_NO_NDS: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'FCOAST_NO_NDS'
      Origin = 'FCOAST_NO_NDS'
      Precision = 24
    end
    object qrDumpFPRICE_NDS: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'FPRICE_NDS'
      Origin = 'FPRICE_NDS'
      Precision = 24
    end
    object qrDumpFPRICE_NO_NDS: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'FPRICE_NO_NDS'
      Origin = 'FPRICE_NO_NDS'
      Precision = 24
    end
    object qrDumpID: TIntegerField
      FieldName = 'ID'
    end
    object qrDumpDUMP_ID: TIntegerField
      FieldName = 'DUMP_ID'
    end
  end
  object dsDump: TDataSource
    DataSet = qrDump
    Left = 752
    Top = 85
  end
  object pmDumpTransp: TPopupMenu
    Left = 144
    Top = 488
    object PMDumpEdit: TMenuItem
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      OnClick = PMDumpEditClick
    end
  end
  object qrTransp: TFDQuery
    BeforeInsert = qrMechanizmBeforeInsert
    AfterScroll = qrTranspAfterScroll
    OnCalcFields = qrTranspCalcFields
    Connection = DM.Connect
    Transaction = DM.Read
    UpdateTransaction = DM.Write
    FormatOptions.AssignedValues = [fvMapRules, fvMaxBcdPrecision, fvMaxBcdScale, fvFmtDisplayNumeric]
    FormatOptions.OwnMapRules = True
    FormatOptions.MapRules = <
      item
        SourceDataType = dtMemo
        TargetDataType = dtAnsiString
      end
      item
        SourceDataType = dtUInt32
        TargetDataType = dtInt32
      end
      item
        SourceDataType = dtUInt16
        TargetDataType = dtInt32
      end>
    FormatOptions.MaxBcdPrecision = 19
    FormatOptions.MaxBcdScale = 8
    UpdateOptions.KeyFields = 'ID'
    SQL.Strings = (
      '/*'#1048#1089#1087#1086#1083#1100#1079#1091#1077#1090#1089#1103' '#1076#1083#1103' '#1086#1090#1083#1072#1076#1082#1080'*/'
      
        'SELECT *, '#39#1090#39' as TRANSP_UNIT FROM transpcard_temp WHERE (ID = :I' +
        'DValue) ORDER BY ID;')
    Left = 800
    Top = 85
    ParamData = <
      item
        Name = 'IDVALUE'
        DataType = ftString
        ParamType = ptInput
        Value = '0'
      end>
    object qrTranspTRANSP_TYPE: TByteField
      AutoGenerateValue = arDefault
      FieldName = 'TRANSP_TYPE'
      Origin = 'TRANSP_TYPE'
    end
    object qrTranspTRANSP_CODE_JUST: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'TRANSP_CODE_JUST'
      Origin = 'TRANSP_CODE_JUST'
      Size = 30
    end
    object qrTranspTRANSP_JUST: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'TRANSP_JUST'
      Origin = 'TRANSP_JUST'
      Size = 100
    end
    object qrTranspCARG_CLASS: TByteField
      AutoGenerateValue = arDefault
      FieldName = 'CARG_CLASS'
      Origin = 'CARG_CLASS'
    end
    object qrTranspCARG_UNIT: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CARG_UNIT'
      Origin = 'CARG_UNIT'
      Size = 30
    end
    object qrTranspCARG_TYPE: TByteField
      AutoGenerateValue = arDefault
      FieldName = 'CARG_TYPE'
      Origin = 'CARG_TYPE'
    end
    object qrTranspNUM: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'NUM'
      Calculated = True
    end
    object qrTranspCLASS: TStringField
      FieldKind = fkCalculated
      FieldName = 'CLASS'
      Calculated = True
    end
    object qrTranspTRANSP_UNIT: TStringField
      FieldName = 'TRANSP_UNIT'
    end
    object qrTranspTRANSP_COUNT: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'TRANSP_COUNT'
      Origin = 'TRANSP_COUNT'
      Precision = 24
    end
    object qrTranspTRANSP_DIST: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'TRANSP_DIST'
      Origin = 'TRANSP_DIST'
      Precision = 24
    end
    object qrTranspTRANSP_SUM_NDS: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'TRANSP_SUM_NDS'
      Origin = 'TRANSP_SUM_NDS'
      Precision = 24
    end
    object qrTranspTRANSP_SUM_NO_NDS: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'TRANSP_SUM_NO_NDS'
      Origin = 'TRANSP_SUM_NO_NDS'
      Precision = 24
    end
    object qrTranspCOAST_NO_NDS: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'COAST_NO_NDS'
      Origin = 'COAST_NO_NDS'
      Precision = 24
    end
    object qrTranspCOAST_NDS: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'COAST_NDS'
      Origin = 'COAST_NDS'
      Precision = 24
    end
    object qrTranspCARG_COUNT: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'CARG_COUNT'
      Origin = 'CARG_COUNT'
      Precision = 24
    end
    object qrTranspCARG_YDW: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'CARG_YDW'
      Origin = 'CARG_YDW'
      Precision = 24
    end
    object qrTranspNDS: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'NDS'
      Origin = 'NDS'
    end
    object qrTranspPRICE_NDS: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'PRICE_NDS'
      Origin = 'PRICE_NDS'
      Precision = 24
    end
    object qrTranspPRICE_NO_NDS: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'PRICE_NO_NDS'
      Origin = 'PRICE_NO_NDS'
      Precision = 24
    end
    object qrTranspKOEF: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'KOEF'
      Origin = 'KOEF'
      Precision = 24
    end
    object qrTranspID: TIntegerField
      FieldName = 'ID'
    end
  end
  object qrStartup: TFDQuery
    BeforeInsert = qrMechanizmBeforeInsert
    AfterScroll = qrStartupAfterScroll
    OnCalcFields = qrMechanizmCalcFields
    Connection = DM.Connect
    Transaction = DM.Read
    UpdateTransaction = DM.Write
    FormatOptions.AssignedValues = [fvMapRules, fvMaxBcdPrecision, fvMaxBcdScale, fvFmtDisplayNumeric]
    FormatOptions.OwnMapRules = True
    FormatOptions.MapRules = <
      item
        SourceDataType = dtMemo
        TargetDataType = dtAnsiString
      end
      item
        SourceDataType = dtUInt16
        TargetDataType = dtInt32
      end>
    FormatOptions.MaxBcdPrecision = 19
    FormatOptions.MaxBcdScale = 8
    SQL.Strings = (
      
        'select RATE_CODE, RATE_CAPTION, RATE_COUNT, RATE_UNIT from card_' +
        'rate_temp')
    Left = 800
    Top = 128
    object qrStartupRATE_CODE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'RATE_CODE'
      Origin = 'RATE_CODE'
    end
    object qrStartupRATE_CAPTION: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'RATE_CAPTION'
      Origin = 'RATE_CAPTION'
      Size = 32767
    end
    object qrStartupRATE_COUNT: TFMTBCDField
      FieldName = 'RATE_COUNT'
    end
    object qrStartupRATE_UNIT: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'RATE_UNIT'
      Origin = 'RATE_UNIT'
      Size = 100
    end
    object qrStartupNUM: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'NUM'
      Calculated = True
    end
  end
  object dsTransp: TDataSource
    DataSet = qrTransp
    Left = 840
    Top = 85
  end
  object dsStartup: TDataSource
    DataSet = qrStartup
    Left = 840
    Top = 128
  end
  object tmRate: TTimer
    Enabled = False
    Interval = 50
    OnTimer = tmRateTimer
    Left = 304
    Top = 225
  end
  object qrOXROPR: TFDQuery
    Connection = DM.Connect
    Transaction = DM.Read
    UpdateTransaction = DM.Write
    FormatOptions.AssignedValues = [fvMapRules, fvFmtDisplayNumeric, fvFmtEditNumeric]
    FormatOptions.OwnMapRules = True
    FormatOptions.MapRules = <
      item
        SourceDataType = dtMemo
        TargetDataType = dtAnsiString
      end
      item
        SourceDataType = dtFmtBCD
        TargetDataType = dtDouble
      end
      item
        SourceDataType = dtUInt32
        TargetDataType = dtInt32
      end
      item
        SourceDataType = dtUInt64
        TargetDataType = dtInt32
      end
      item
        SourceDataType = dtInt64
        TargetDataType = dtInt32
      end>
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate, uvUpdateChngFields, uvCountUpdatedRecords, uvCheckRequired, uvCheckReadOnly, uvCheckUpdatable]
    UpdateOptions.CountUpdatedRecords = False
    UpdateOptions.CheckRequired = False
    UpdateOptions.CheckReadOnly = False
    UpdateOptions.CheckUpdatable = False
    SQL.Strings = (
      
        'SELECT work_id, work_name as "NameWork" FROM objworks ORDER BY w' +
        'ork_id')
    Left = 224
    Top = 344
  end
  object dsOXROPR: TDataSource
    DataSet = qrOXROPR
    Left = 288
    Top = 344
  end
  object pmWinterPrise: TPopupMenu
    Left = 560
    Top = 472
    object nSelectWinterPrise: TMenuItem
      Caption = #1042#1099#1073#1088#1072#1090#1100' '#1080#1079' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072
      OnClick = nSelectWinterPriseClick
    end
    object nWinterPriseSetDefault: TMenuItem
      Caption = #1042#1086#1089#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1079#1085#1072#1095#1077#1085#1080#1077' '#1087#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
      OnClick = nWinterPriseSetDefaultClick
    end
  end
  object qrRatesEx: TFDQuery
    AfterOpen = qrRatesExAfterOpen
    BeforeScroll = qrRatesExBeforeScroll
    AfterScroll = qrRatesExAfterScroll
    OnCalcFields = qrRatesExCalcFields
    CachedUpdates = True
    Connection = DM.Connect
    Transaction = DM.Read
    UpdateTransaction = DM.Write
    FetchOptions.AssignedValues = [evItems]
    FetchOptions.Items = [fiBlobs, fiDetails]
    FormatOptions.AssignedValues = [fvMapRules, fvMaxBcdPrecision, fvMaxBcdScale, fvDefaultParamDataType, fvFmtDisplayNumeric, fvFmtEditNumeric]
    FormatOptions.OwnMapRules = True
    FormatOptions.MapRules = <
      item
        SourceDataType = dtMemo
        TargetDataType = dtAnsiString
      end
      item
        SourceDataType = dtUInt32
        TargetDataType = dtInt32
      end
      item
        SourceDataType = dtUInt64
        TargetDataType = dtInt32
      end
      item
        SourceDataType = dtInt64
        TargetDataType = dtInt32
      end
      item
        SourceDataType = dtBCD
        TargetDataType = dtDouble
      end
      item
        SourceDataType = dtFmtBCD
        TargetDataType = dtDouble
      end>
    FormatOptions.MaxBcdPrecision = 24
    FormatOptions.MaxBcdScale = 6
    FormatOptions.DefaultParamDataType = ftBCD
    FormatOptions.FmtDisplayNumeric = '### ### ### ### ### ### ### ##0.#######'
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate, uvUpdateChngFields, uvRefreshMode, uvRefreshDelete, uvCheckRequired, uvCheckReadOnly, uvCheckUpdatable, uvUpdateNonBaseFields]
    UpdateOptions.UpdateChangedFields = False
    UpdateOptions.UpdateNonBaseFields = True
    UpdateOptions.CheckRequired = False
    UpdateOptions.CheckReadOnly = False
    UpdateOptions.CheckUpdatable = False
    SQL.Strings = (
      'CALL `GetRates_ex`(:vIsACT, :EAID);')
    Left = 24
    Top = 216
    ParamData = <
      item
        Name = 'VISACT'
        DataType = ftInteger
        ParamType = ptInput
        Value = 0
      end
      item
        Name = 'EAID'
        DataType = ftInteger
        ParamType = ptInput
        Value = 0
      end>
    object strngfldRatesExSORT_ID: TStringField
      FieldName = 'SORT_ID'
      Size = 255
    end
    object qrRatesExITERATOR: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'ITERATOR'
      Origin = 'ITERATOR'
      ProviderFlags = []
      ReadOnly = True
    end
    object qrRatesExOBJ_CODE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'OBJ_CODE'
      Origin = 'OBJ_CODE'
      ProviderFlags = []
      OnChange = qrRatesExCODEChange
      Size = 151
    end
    object qrRatesExOBJ_NAME: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'OBJ_NAME'
      Origin = 'OBJ_NAME'
      ProviderFlags = []
      Size = 300
    end
    object qrRatesExOBJ_UNIT: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'OBJ_UNIT'
      Origin = 'OBJ_UNIT'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object qrRatesExID_TYPE_DATA: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'ID_TYPE_DATA'
      Origin = 'ID_TYPE_DATA'
      ProviderFlags = []
    end
    object qrRatesExDATA_ESTIMATE_OR_ACT_ID: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'DATA_ESTIMATE_OR_ACT_ID'
      Origin = 'DATA_ESTIMATE_OR_ACT_ID'
      ProviderFlags = []
    end
    object qrRatesExID_TABLES: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'ID_TABLES'
      Origin = 'ID_TABLES'
      ProviderFlags = []
    end
    object qrRatesExSM_ID: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'SM_ID'
      Origin = 'SM_ID'
      ProviderFlags = []
    end
    object qrRatesExWORK_ID: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'WORK_ID'
      Origin = 'WORK_ID'
      ProviderFlags = []
      OnChange = qrRatesWORK_IDChange
    end
    object qrRatesExZNORMATIVS_ID: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'ZNORMATIVS_ID'
      Origin = 'ZNORMATIVS_ID'
      ProviderFlags = []
    end
    object qrRatesExAPPLY_WINTERPRISE_FLAG: TShortintField
      AutoGenerateValue = arDefault
      FieldName = 'APPLY_WINTERPRISE_FLAG'
      Origin = 'APPLY_WINTERPRISE_FLAG'
      ProviderFlags = []
    end
    object qrRatesExID_RATE: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'ID_RATE'
      Origin = 'ID_RATE'
      ProviderFlags = []
    end
    object qrRatesExOBJ_COUNT: TFloatField
      FieldName = 'OBJ_COUNT'
      OnChange = qrRatesExCOUNTChange
    end
    object qrRatesExADDED_COUNT: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'ADDED_COUNT'
      Calculated = True
    end
    object qrRatesExREPLACED_COUNT: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'REPLACED_COUNT'
      Calculated = True
    end
    object qrRatesExINCITERATOR: TIntegerField
      FieldName = 'INCITERATOR'
    end
    object strngfldRatesExSORT_ID2: TStringField
      FieldName = 'SORT_ID2'
    end
    object qrRatesExNUM_ROW: TIntegerField
      FieldName = 'NUM_ROW'
    end
    object qrRatesExID_REPLACED: TIntegerField
      FieldName = 'ID_REPLACED'
    end
    object qrRatesExCONS_REPLASED: TIntegerField
      FieldName = 'CONS_REPLASED'
    end
    object qrRatesExCOEF_ORDERS: TIntegerField
      FieldName = 'COEF_ORDERS'
    end
    object qrRatesExNOM_ROW_MANUAL: TIntegerField
      FieldName = 'NOM_ROW_MANUAL'
      OnChange = qrRatesExNOM_ROW_MANUALChange
    end
  end
  object dsRatesEx: TDataSource
    DataSet = qrRatesEx
    OnDataChange = dsRatesExDataChange
    Left = 24
    Top = 264
  end
  object qrTypeData: TFDQuery
    Connection = DM.Connect
    Transaction = DM.Read
    UpdateTransaction = DM.Write
    FormatOptions.AssignedValues = [fvMapRules, fvFmtDisplayNumeric, fvFmtEditNumeric]
    FormatOptions.OwnMapRules = True
    FormatOptions.MapRules = <
      item
        SourceDataType = dtMemo
        TargetDataType = dtAnsiString
      end
      item
        SourceDataType = dtFmtBCD
        TargetDataType = dtDouble
      end
      item
        SourceDataType = dtUInt32
        TargetDataType = dtInt32
      end
      item
        SourceDataType = dtUInt64
        TargetDataType = dtInt32
      end
      item
        SourceDataType = dtInt64
        TargetDataType = dtInt32
      end>
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate, uvUpdateChngFields, uvCountUpdatedRecords, uvCheckRequired, uvCheckReadOnly, uvCheckUpdatable]
    UpdateOptions.CountUpdatedRecords = False
    UpdateOptions.CheckRequired = False
    UpdateOptions.CheckReadOnly = False
    UpdateOptions.CheckUpdatable = False
    SQL.Strings = (
      'SELECT '
      '  `ID` AS ID_TYPE_DATA,'
      '  CONCAT(`ID`, ". ", `NAME`) AS TYPE_NAME'
      'FROM '
      '  `types_data`'
      'ORDER BY `ID`')
    Left = 112
    Top = 216
  end
  object dsTypeData: TDataSource
    DataSet = qrTypeData
    Left = 112
    Top = 264
  end
  object pmAddRate: TPopupMenu
    Left = 616
    Top = 488
    object PMAddRateOld: TMenuItem
      AutoHotkeys = maManual
      Caption = 'Old'
      OnClick = PMAddRateOldClick
    end
    object PMAddRateNew: TMenuItem
      AutoHotkeys = maAutomatic
      Caption = 'New'
      OnClick = PMAddRateOldClick
    end
    object PMRateRef: TMenuItem
      Caption = #1054#1090#1082#1088#1099#1090#1100' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082
      OnClick = PMRateRefClick
    end
  end
  object pmLblObj: TPopupMenu
    Left = 16
    Top = 120
    object mN14: TMenuItem
      Caption = #1050#1072#1088#1090#1086#1095#1082#1072' '#1086#1073#1098#1077#1082#1090#1072
      OnClick = mN14Click
    end
    object mN15: TMenuItem
      Caption = #1042#1099#1073#1086#1088' '#1086#1073#1098#1077#1082#1090#1072' '#1076#1083#1103' '#1082#1086#1087#1080#1088#1086#1074#1072#1085#1080#1103' '#1076#1072#1085#1085#1099#1093
      OnClick = LabelObjectClick
    end
  end
  object qrObjects: TFDQuery
    Connection = DM.Connect
    Transaction = DM.Read
    UpdateTransaction = DM.Write
    SQL.Strings = (
      'SELECT DISTINCT obj_id        AS "IdObject",'
      '       objcards.fin_id        AS "IdIstFin",'
      '       objcards.cust_id       AS "IdClient",'
      '       objcards.general_id    AS "IdContractor",'
      '       objcards.cat_id        AS "IdCategory",'
      '       objcards.region_id     AS "IdRegion",'
      '       objcards.base_norm_id  AS "IdBasePrice",'
      '       objcards.stroj_id      AS "IdOXROPR",'
      '       objcards.mais_id       AS "IdMAIS",'
      '       num                    AS "NumberObject",'
      '       num_dog                AS "NumberContract",'
      '       date_dog               AS "DateContract",'
      '       agr_list               AS "ListAgreements",'
      '       objcards.full_name     AS "FullName",'
      '       objcards.name          AS "Name",'
      '       beg_stroj              AS "BeginConstruction",'
      '       srok_stroj             AS "TermConstruction",'
      '       ('
      '           SELECT DISTINCT NAME'
      '           FROM   istfin'
      '           WHERE  id = IdIstFin'
      '       )                      AS "NameIstFin",'
      '       ('
      '           SELECT DISTINCT name'
      '           FROM   clients'
      '           WHERE  client_id = IdClient'
      '       )                      AS "NameClient",'
      '       ('
      '           SELECT DISTINCT name'
      '           FROM   clients'
      '           WHERE  client_id = IdContractor'
      '       )                      AS "NameContractor",'
      '       objcategory.cat_name   AS "NameCategory",'
      '       state_nds              AS "VAT",'
      '       regions.region_name    AS "NameRegion",'
      '       baseprices.base_name   AS "BasePrice",'
      '       objstroj.name          AS "OXROPR",'
      '       encrypt                AS "CodeObject",'
      '       calc_econom            AS "CalculationEconom",'
      '       obj_id,'
      '       objcards.DEL_FLAG'
      'FROM   objcards,'
      '       istfin,'
      '       objcategory,'
      '       regions,'
      '       baseprices,'
      '       objstroj'
      'WHERE  objcards.cat_id = objcategory.cat_id'
      '       AND objcards.region_id = regions.region_id'
      '       AND objcards.base_norm_id = baseprices.base_id'
      '       AND objcards.stroj_id = objstroj.stroj_id'
      '       AND obj_id=:in_id')
    Left = 81
    Top = 120
    ParamData = <
      item
        Name = 'IN_ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object FormStorage: TJvFormStorage
    AppStorage = FormMain.AppIni
    AppStoragePath = '%FORM_NAME%\'
    Options = [fpActiveControl]
    StoredValues = <>
    Left = 168
    Top = 128
  end
end
