object fObjectsAndEstimates: TfObjectsAndEstimates
  Left = 0
  Top = 0
  Caption = #1054#1073#1098#1077#1082#1090#1099' '#1080' '#1089#1084#1077#1090#1099
  ClientHeight = 518
  ClientWidth = 705
  Color = clBtnFace
  DoubleBuffered = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PanelMain: TPanel
    Left = 0
    Top = 0
    Width = 705
    Height = 518
    Align = alClient
    BevelOuter = bvNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    ShowCaption = False
    TabOrder = 0
    object ImageSplitterCenter: TImage
      Left = 304
      Top = 125
      Width = 15
      Height = 5
      Cursor = crVSplit
    end
    object SplitterCenter: TSplitter
      Left = 0
      Top = 321
      Width = 705
      Height = 5
      Cursor = crVSplit
      Align = alTop
      ResizeStyle = rsUpdate
      ExplicitTop = 100
      ExplicitWidth = 617
    end
    object PanelObjects: TPanel
      Left = 0
      Top = 0
      Width = 705
      Height = 321
      Align = alTop
      BevelOuter = bvNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      ShowCaption = False
      TabOrder = 0
      object dbgrdObjects: TJvDBGrid
        Left = 0
        Top = 25
        Width = 705
        Height = 268
        Align = alClient
        DataSource = dsObjects
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        ParentFont = False
        PopupMenu = pmObjects
        ReadOnly = True
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDrawColumnCell = dbgrdObjectsDrawColumnCell
        IniStorage = FormStorage
        TitleButtons = True
        OnTitleBtnClick = dbgrdObjectsTitleBtnClick
        SelectColumn = scGrid
        TitleArrow = True
        SelectColumnsDialogStrings.Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1072' '#1074#1080#1076#1080#1084#1086#1089#1090#1080' '#1082#1086#1083#1086#1085#1086#1082
        SelectColumnsDialogStrings.OK = '&OK'
        SelectColumnsDialogStrings.NoSelectionWarning = #1044#1086#1083#1078#1085#1072' '#1073#1099#1090#1100' '#1074#1099#1073#1088#1072#1085#1072' '#1093#1086#1090#1103' '#1073#1099' '#1086#1076#1085#1072' '#1082#1086#1083#1086#1085#1082#1072'!'
        EditControls = <>
        RowsHeight = 17
        TitleRowHeight = 17
        Columns = <
          item
            Expanded = False
            FieldName = 'NumberObject'
            Title.Alignment = taCenter
            Title.Caption = #8470' '#1086#1073#1098#1077#1082#1090#1072
            Width = 65
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CodeObject'
            Title.Alignment = taCenter
            Title.Caption = #1064#1080#1092#1088' '#1086#1073#1098#1077#1082#1090#1072
            Width = 85
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NumberContract'
            Title.Alignment = taCenter
            Title.Caption = #1053#1086#1084#1077#1088' '#1076#1086#1075#1086#1074#1086#1088#1072
            Width = 90
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DateContract'
            Title.Alignment = taCenter
            Title.Caption = #1044#1072#1090#1072' '#1076#1086#1075#1086#1074#1086#1088#1072
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FullName'
            Title.Alignment = taCenter
            Title.Caption = #1055#1086#1083#1085#1086#1077' '#1085#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1086#1073#1098#1077#1082#1090#1072
            Width = 250
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Name'
            Title.Alignment = taCenter
            Title.Caption = #1050#1088#1072#1090#1082#1086#1077' '#1085#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1086#1073#1098#1077#1082#1090#1072
            Width = 170
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'BeginConstruction'
            Title.Alignment = taCenter
            Title.Caption = #1053#1072#1095#1072#1083#1086' '#1089#1090#1088#1086#1080#1090#1077#1083#1100#1089#1090#1074#1072
            Width = 120
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TermConstruction'
            Title.Alignment = taCenter
            Title.Caption = #1057#1088#1086#1082' '#1089#1090#1088#1086#1080#1090#1077#1083#1100#1089#1090#1074#1072
            Width = 120
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NameIstFin'
            Title.Alignment = taCenter
            Title.Caption = #1048#1089#1090#1086#1095#1085#1080#1082' '#1092#1080#1085#1072#1085#1089#1080#1088#1086#1074#1072#1085#1080#1103
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NameClient'
            Title.Alignment = taCenter
            Title.Caption = #1047#1072#1082#1072#1079#1095#1080#1082
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NameContractor'
            Title.Alignment = taCenter
            Title.Caption = #1043#1077#1085#1087#1086#1076#1088#1103#1076#1095#1080#1082
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NameCategory'
            Title.Alignment = taCenter
            Title.Caption = #1050#1072#1090#1077#1075#1086#1088#1080#1103' '#1086#1073#1098#1077#1082#1090#1072
            Width = 200
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NameRegion'
            Title.Alignment = taCenter
            Title.Caption = #1056#1077#1075#1080#1086#1085
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'BasePrice'
            Title.Alignment = taCenter
            Title.Caption = #1041#1072#1079#1072' '#1088#1072#1089#1094#1077#1085#1086#1082
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OXROPR'
            Title.Alignment = taCenter
            Title.Caption = #1058#1080#1087' '#1054#1061#1056' '#1080' '#1054#1055#1056' '
            Width = 150
            Visible = True
          end>
      end
      object dbmmoFullName: TDBMemo
        Left = 0
        Top = 293
        Width = 705
        Height = 28
        Align = alBottom
        DataField = 'FullName'
        DataSource = dsObjects
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 2
      end
      object pnl1: TPanel
        Left = 0
        Top = 0
        Width = 705
        Height = 25
        Align = alTop
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        DesignSize = (
          705
          25)
        object lbl3: TLabel
          Left = 8
          Top = 5
          Width = 34
          Height = 13
          Caption = #1055#1086#1080#1089#1082':'
        end
        object btnSearch: TSpeedButton
          Left = 620
          Top = 0
          Width = 84
          Height = 25
          Anchors = [akTop, akRight]
          Caption = #1055#1086#1080#1089#1082
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Glyph.Data = {
            F6000000424DF600000000000000760000002800000010000000100000000100
            04000000000080000000C40E0000C40E00001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
            8888888888888888888800000888880000080F000888880F00080F000888880F
            0008000000080000000800F000000F00000800F000800F00000800F000800F00
            00088000000000000088880F00080F0008888800000800000888888000888000
            88888880F08880F0888888800088800088888888888888888888}
          ParentFont = False
          OnClick = btnSearchClick
        end
        object edtSearch: TEdit
          Left = 165
          Top = 2
          Width = 449
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
          TextHint = #1042#1074#1077#1076#1080#1090#1077' '#1090#1077#1082#1089#1090' '#1076#1083#1103' '#1087#1086#1080#1089#1082#1072'...'
          OnChange = edtSearchChange
          OnKeyDown = edtSearchKeyDown
        end
        object cbbSearch: TComboBox
          Left = 45
          Top = 2
          Width = 114
          Height = 21
          Style = csDropDownList
          ItemIndex = 0
          TabOrder = 0
          Text = #1087#1086' '#1085#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1102
          Items.Strings = (
            #1087#1086' '#1085#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1102
            #1087#1086' '#1079#1072#1082#1072#1079#1095#1080#1082#1091
            #1087#1086' '#1075#1077#1085#1087#1086#1076#1088#1103#1076#1095#1080#1082#1091)
        end
      end
    end
    object PanelBottom: TPanel
      Left = 0
      Top = 326
      Width = 705
      Height = 192
      Align = alClient
      BevelOuter = bvNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      ShowCaption = False
      TabOrder = 1
      OnResize = PanelBottomResize
      object ImageSplitterBottomCenter: TImage
        Left = 513
        Top = 73
        Width = 5
        Height = 15
        Cursor = crHSplit
        AutoSize = True
      end
      object SplitterBottomCenter: TSplitter
        Left = 358
        Top = 0
        Width = 5
        Height = 192
        ResizeStyle = rsUpdate
        ExplicitLeft = 345
        ExplicitHeight = 180
      end
      object PanelEstimates: TPanel
        Left = 0
        Top = 0
        Width = 358
        Height = 192
        Align = alLeft
        BevelOuter = bvNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 0
        object lblEstimates: TLabel
          Left = 0
          Top = 0
          Width = 358
          Height = 13
          Align = alTop
          Alignment = taCenter
          Caption = #1057#1084#1077#1090#1099
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ExplicitWidth = 39
        end
        object tvEstimates: TJvDBTreeView
          Left = 0
          Top = 13
          Width = 358
          Height = 179
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
          Align = alClient
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          TabOrder = 0
          OnDblClick = tvEstimatesDblClick
          PopupMenu = pmEstimates
          ParentFont = False
          RowSelect = True
          OnCustomDrawItem = tvEstimatesCustomDrawItem
          Mirror = False
        end
      end
      object PanelActs: TPanel
        Left = 363
        Top = 0
        Width = 342
        Height = 192
        Align = alClient
        BevelOuter = bvNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 1
        object lblActs: TLabel
          Left = 0
          Top = 0
          Width = 342
          Height = 13
          Align = alTop
          Alignment = taCenter
          Caption = #1040#1082#1090#1099' '#1074#1099#1087#1086#1083#1085#1077#1085#1085#1099#1093' '#1088#1072#1073#1086#1090
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ExplicitWidth = 156
        end
        object tvActs: TJvDBTreeView
          Left = 0
          Top = 13
          Width = 342
          Height = 179
          DataSource = dsActs
          MasterField = 'MASTER_ID'
          DetailField = 'PARENT_ID'
          ItemField = 'ITEAM_NAME'
          StartMasterValue = '0'
          UseFilter = False
          PersistentNode = True
          ReadOnly = True
          DragMode = dmAutomatic
          HideSelection = False
          Indent = 19
          Align = alClient
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          TabOrder = 0
          OnDblClick = PMActsEditClick
          PopupMenu = pmActs
          ParentFont = False
          RowSelect = True
          OnCustomDrawItem = tvActsCustomDrawItem
          Mirror = False
        end
      end
    end
  end
  object dsObjects: TDataSource
    DataSet = qrObjects
    Left = 32
    Top = 120
  end
  object pmObjects: TPopupMenu
    Images = DM.ilIcons_16x16
    OnPopup = pmObjectsPopup
    Left = 32
    Top = 168
    object PopupMenuObjectsAdd: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      ImageIndex = 39
      OnClick = PopupMenuObjectsAddClick
    end
    object PopupMenuObjectsEdit: TMenuItem
      Caption = #1050#1072#1088#1090#1086#1095#1082#1072' '#1086#1073#1098#1077#1082#1090#1072
      ImageIndex = 44
      OnClick = PopupMenuObjectsEditClick
    end
    object mDelete: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100
      ImageIndex = 38
      OnClick = mDeleteClick
    end
    object mDeleteObject: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1087#1086#1083#1085#1086#1089#1090#1100#1102
      ImageIndex = 36
      OnClick = mDeleteObjectClick
    end
    object mRepair: TMenuItem
      Caption = #1042#1086#1089#1089#1090#1072#1085#1086#1074#1080#1090#1100
      ImageIndex = 49
      OnClick = mRepairClick
    end
    object PopupMenuObjectsSeparator1: TMenuItem
      Caption = '-'
    end
    object PMExportObject: TMenuItem
      Caption = #1069#1082#1089#1087#1086#1088#1090' '#1086#1073#1098#1077#1082#1090#1072
      ImageIndex = 33
      OnClick = PMExportObjectClick
    end
    object PMImportObject: TMenuItem
      Caption = #1048#1084#1087#1086#1088#1090' '#1086#1073#1098#1077#1082#1090#1072
      ImageIndex = 7
      OnClick = PMImportObjectClick
    end
    object PMImportDir: TMenuItem
      Caption = #1048#1084#1087#1086#1088#1090' '#1080#1079' '#1087#1072#1087#1082#1080
      ImageIndex = 7
      OnClick = PMImportDirClick
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object mCopyObject: TMenuItem
      Caption = #1057#1086#1079#1076#1072#1090#1100' '#1082#1086#1087#1080#1102
      ImageIndex = 35
      OnClick = mCopyObjectClick
    end
    object mN3: TMenuItem
      Caption = '-'
    end
    object mShowDeleted: TMenuItem
      AutoCheck = True
      Caption = #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1091#1076#1072#1083#1077#1085#1085#1099#1077
      OnClick = mShowDeletedClick
    end
    object mN4: TMenuItem
      Caption = '-'
    end
    object mN6: TMenuItem
      Caption = #1050#1086#1083#1086#1085#1082#1080
      ImageIndex = 52
      OnClick = mN6Click
    end
    object mObjectAccess: TMenuItem
      Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1072' '#1087#1088#1072#1074' '#1076#1086#1089#1090#1091#1087#1072
      ImageIndex = 65
      OnClick = mObjectAccessClick
    end
  end
  object pmEstimates: TPopupMenu
    Images = DM.ilIcons_16x16
    OnPopup = pmEstimatesPopup
    Left = 24
    Top = 440
    object PopupMenuEstimatesAdd: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      ImageIndex = 42
      object PMEstimatesAddLocal: TMenuItem
        Tag = 1
        Caption = #1051#1086#1082#1072#1083#1100#1085#1072#1103
        OnClick = PopupMenuEstimatesAddClick
      end
      object PMEstimatesAddObject: TMenuItem
        Tag = 2
        Caption = #1054#1073#1098#1077#1082#1090#1085#1072#1103
        OnClick = PopupMenuEstimatesAddClick
      end
      object PMEstimatesAddPTM: TMenuItem
        Tag = 3
        Caption = #1055#1058#1052
        OnClick = PopupMenuEstimatesAddClick
      end
    end
    object PMEstimatesEdit: TMenuItem
      Caption = #1050#1072#1088#1090#1086#1095#1082#1072' '#1089#1084#1077#1090#1099
      ImageIndex = 44
      OnClick = PMEstimatesEditClick
    end
    object mDeleteEstimate: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100
      ImageIndex = 38
      OnClick = mDeleteEstimateClick
    end
    object PMEstimatesDelete: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1087#1086#1083#1085#1086#1089#1090#1100#1102
      ImageIndex = 36
      OnClick = PMEstimatesDeleteClick
    end
    object mReapirEstimate: TMenuItem
      Caption = #1042#1086#1089#1089#1090#1072#1085#1086#1074#1080#1090#1100
      ImageIndex = 49
      OnClick = mReapirEstimateClick
    end
    object PopupMenuEstimatesSeparator1: TMenuItem
      Caption = '-'
    end
    object PMEstimatesBasicData: TMenuItem
      Caption = #1048#1089#1093#1086#1076#1085#1099#1077' '#1076#1072#1085#1085#1099#1077' '#1089#1084#1077#1090#1099
      OnClick = PMEstimatesBasicDataClick
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object PMEstimateExpandSelected: TMenuItem
      Caption = #1056#1072#1089#1082#1088#1099#1090#1100' '#1074#1099#1076#1077#1083#1077#1085#1085#1091#1102
      OnClick = PMEstimateExpandSelectedClick
    end
    object PMEstimateExpand: TMenuItem
      Caption = #1056#1072#1089#1082#1088#1099#1090#1100' '#1074#1089#1077
      OnClick = PMEstimateExpandClick
    end
    object PMEstimateCollapse: TMenuItem
      Caption = #1057#1074#1077#1088#1085#1091#1090#1100' '#1074#1089#1077
      OnClick = PMEstimateCollapseClick
    end
    object mN9: TMenuItem
      Caption = '-'
    end
    object PMCopySmeta: TMenuItem
      Caption = #1057#1086#1079#1076#1072#1090#1100' '#1082#1086#1087#1080#1102
      ImageIndex = 35
      OnClick = PMCopySmetaClick
    end
    object mN15: TMenuItem
      Caption = '-'
    end
    object mShowDeletedEstimates: TMenuItem
      AutoCheck = True
      Caption = #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1091#1076#1072#1083#1077#1085#1085#1099#1077
      OnClick = mShowDeletedEstimatesClick
    end
    object mEstimateAccess: TMenuItem
      Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1072' '#1087#1088#1072#1074' '#1076#1086#1089#1090#1091#1087#1072
      ImageIndex = 65
      OnClick = mEstimateAccessClick
    end
  end
  object pmActs: TPopupMenu
    Images = DM.ilIcons_16x16
    OnPopup = pmActsPopup
    Left = 376
    Top = 440
    object PMActsOpen: TMenuItem
      Caption = #1054#1090#1082#1088#1099#1090#1100
      OnClick = PMActsOpenClick
    end
    object mN7: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      ImageIndex = 39
      object PMActsAdd: TMenuItem
        Caption = #1040#1082#1090
        OnClick = PMActsAddClick
      end
      object mN10: TMenuItem
        Tag = 1
        Caption = #1040#1082#1090' '#1089#1091#1073#1087#1086#1076#1088#1103#1076#1095#1080#1082#1072
        OnClick = PMActsAddClick
      end
      object mN11: TMenuItem
        Tag = 2
        Caption = #1040#1082#1090' '#1080#1090#1086#1075#1086#1074#1099#1084#1080' '#1089#1091#1084#1084#1072#1084#1080
        OnClick = PMActsAddClick
      end
    end
    object PMActsEdit: TMenuItem
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      ImageIndex = 44
      OnClick = PMActsEditClick
    end
    object PMActsDelete: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100
      ImageIndex = 38
      OnClick = PMActsDeleteClick
    end
    object mDeleteAct: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1087#1086#1083#1085#1086#1089#1090#1100#1102
      ImageIndex = 36
      OnClick = mDeleteActClick
    end
    object mRepAct: TMenuItem
      Caption = #1042#1086#1089#1089#1090#1072#1085#1086#1074#1080#1090#1100
      ImageIndex = 49
      OnClick = mRepActClick
    end
    object pmActProperty: TMenuItem
      Caption = #1050#1072#1088#1090#1086#1095#1082#1072' '#1072#1082#1090#1072
      OnClick = pmActPropertyClick
    end
    object mN5: TMenuItem
      Caption = '-'
    end
    object mREM6KC: TMenuItem
      Caption = #1042#1099#1085#1077#1089#1090#1080' '#1080#1079' 6'#1050#1057
      OnClick = mREM6KCClick
    end
    object mADD6KC: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1074' 6'#1050#1057
      OnClick = mADD6KCClick
    end
    object mN8: TMenuItem
      Caption = '-'
    end
    object mCopy: TMenuItem
      Caption = #1057#1086#1079#1076#1072#1090#1100' '#1082#1086#1087#1080#1102
      ImageIndex = 35
      OnClick = mCopyClick
    end
    object mN16: TMenuItem
      Caption = '-'
    end
    object mShowDeletedActs: TMenuItem
      AutoCheck = True
      Caption = #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1091#1076#1072#1083#1077#1085#1085#1099#1077
      OnClick = mShowDeletedActsClick
    end
    object mActAccess: TMenuItem
      Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1072' '#1087#1088#1072#1074' '#1076#1086#1089#1090#1091#1087#1072
      ImageIndex = 65
      OnClick = mActAccessClick
    end
  end
  object qrActsEx: TFDQuery
    BeforeOpen = qrObjectsBeforeOpen
    AfterOpen = qrActsExAfterOpen
    AfterScroll = qrActsExAfterOpen
    MasterSource = dsObjects
    MasterFields = 'obj_id'
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
    UpdateOptions.UpdateTableName = 'smeta.card_acts'
    UpdateOptions.KeyFields = 'ID'
    SQL.Strings = (
      
        'SELECT (YEAR(date)*12+MONTH(date)) AS PARENT_ID, SM_ID AS MASTER' +
        '_ID, '
      
        '  CONCAT(IF(FL_USE=1, "", "'#1041#1077#1079' 6'#1050#1057' "), IFNULL(TRIM(name), ""), I' +
        'F(DELETED=1, "-", "")) AS ITEAM_NAME,'
      '  DELETED, FL_USE, DATE, NAME, TYPE_ACT, USER_ID'
      'FROM smetasourcedata'
      'WHERE SM_TYPE=2'
      '  AND OBJ_ID=:OBJ_ID'
      '  AND ((DELETED=0) OR (:SHOW_DELETED=1))'
      '  AND ACT=1'
      
        '  AND ((:USER_ID=1) OR (USER_ID=:USER_ID) OR EXISTS(SELECT USER_' +
        'ID FROM user_access WHERE DOC_TYPE_ID=1 AND MASTER_ID=SM_ID AND ' +
        '((USER_ID=0) OR (USER_ID=:USER_ID)) LIMIT 1))'
      ''
      'UNION ALL'
      ''
      'SELECT DISTINCT 0 AS PARENT_ID, '
      '(YEAR(date)*12+MONTH(date)) AS MASTER_ID,'
      'CONCAT(YEAR(date), " ", ('
      'case MONTH(date) '
      'WHEN 1 THEN "'#1071#1053#1042#1040#1056#1068'"'
      'WHEN 2 THEN "'#1060#1045#1042#1056#1040#1051#1068'"'
      'WHEN 3 THEN "'#1052#1040#1056#1058'"'
      'WHEN 4 THEN "'#1040#1055#1056#1045#1051#1068'"'
      'WHEN 5 THEN "'#1052#1040#1049'"'
      'WHEN 6 THEN "'#1048#1070#1053#1068'"'
      'WHEN 7 THEN "'#1048#1070#1051#1068'"'
      'WHEN 8 THEN "'#1040#1042#1043#1059#1057#1058'"'
      'WHEN 9 THEN "'#1057#1045#1053#1058#1071#1041#1056#1068'"'
      'WHEN 10 THEN "'#1054#1050#1058#1071#1041#1056#1068'"'
      'WHEN 11 THEN "'#1053#1054#1071#1041#1056#1068'"'
      'WHEN 12 THEN "'#1044#1045#1050#1040#1041#1056#1068'"'
      'END)) AS ITEAM_NAME,'
      
        '0 AS DELETED, NULL AS FL_USE, DATE, NULL AS NAME, NULL AS TYPE_A' +
        'CT, NULL AS USER_ID'
      'FROM smetasourcedata'
      'WHERE SM_TYPE=2'
      '  AND OBJ_ID=:OBJ_ID'
      '  AND ((DELETED=0) OR (:SHOW_DELETED=1))'
      '  AND ACT=1'
      
        '  AND ((:USER_ID=1) OR (USER_ID=:USER_ID) OR EXISTS(SELECT USER_' +
        'ID FROM user_access WHERE DOC_TYPE_ID=1 AND MASTER_ID=SM_ID AND ' +
        '((USER_ID=0) OR (USER_ID=:USER_ID)) LIMIT 1))'
      'GROUP BY (YEAR(date)*12+MONTH(date))'
      'ORDER BY DATE, 3')
    Left = 377
    Top = 344
    ParamData = <
      item
        Name = 'OBJ_ID'
        ParamType = ptInput
      end
      item
        Name = 'SHOW_DELETED'
        ParamType = ptInput
      end
      item
        Name = 'USER_ID'
        ParamType = ptInput
      end>
  end
  object qrObjects: TFDQuery
    BeforeOpen = qrObjectsBeforeOpen
    AfterOpen = qrObjectsAfterOpen
    AfterScroll = qrObjectsAfterScroll
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
      '       objcards.DEL_FLAG,'
      '       objcards.USER_ID'
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
      '       AND ((objcards.DEL_FLAG=0) OR (:SHOW_DELETED=1))'
      
        '       AND ((:USER_ID=1) OR (objcards.USER_ID=:USER_ID) OR EXIST' +
        'S(SELECT USER_ID FROM user_access WHERE DOC_TYPE_ID=2 AND MASTER' +
        '_ID=objcards.obj_id AND ((USER_ID=0) OR (USER_ID=:USER_ID)) LIMI' +
        'T 1))'
      'ORDER BY num, num_dog,objcards.full_name')
    Left = 33
    Top = 72
    ParamData = <
      item
        Name = 'SHOW_DELETED'
        DataType = ftString
        ParamType = ptInput
        Value = '0'
      end
      item
        Name = 'USER_ID'
        ParamType = ptInput
      end>
  end
  object dsActs: TDataSource
    DataSet = qrActsEx
    Left = 377
    Top = 392
  end
  object dsTreeData: TDataSource
    DataSet = qrTreeData
    Left = 24
    Top = 392
  end
  object qrTreeData: TFDQuery
    BeforeOpen = qrObjectsBeforeOpen
    AfterOpen = qrTreeDataAfterOpen
    AfterScroll = qrTreeDataAfterOpen
    MasterSource = dsObjects
    MasterFields = 'obj_id'
    Connection = DM.Connect
    Transaction = DM.Read
    UpdateTransaction = DM.Write
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    SQL.Strings = (
      
        'SELECT SM_ID, SM_TYPE, OBJ_ID, CONCAT(IFNULL(SM_NUMBER, ""), " "' +
        ',  IFNULL(NAME, ""), IF(DELETED=1, "-", "")) as NAME,'
      '       PARENT_ID as PARENT, DELETED, USER_ID'
      'FROM smetasourcedata'
      'WHERE OBJ_ID=:OBJ_ID'
      '  AND ((DELETED=0) OR (:SHOW_DELETED=1))'
      '  AND ACT=0'
      
        '  AND ((:USER_ID=1) OR (USER_ID=:USER_ID) OR EXISTS(SELECT USER_' +
        'ID FROM user_access WHERE DOC_TYPE_ID=1 AND MASTER_ID=SM_ID AND ' +
        '((USER_ID=0) OR (USER_ID=:USER_ID)) LIMIT 1))'
      'ORDER BY NAME')
    Left = 25
    Top = 344
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
      end
      item
        Name = 'USER_ID'
        ParamType = ptInput
      end>
  end
  object SaveDialog: TSaveDialog
    Filter = 'xml|*.xml'
    Left = 648
    Top = 109
  end
  object OpenDialog: TOpenDialog
    Filter = 'xml|*.xml'
    Left = 648
    Top = 61
  end
  object FormStorage: TJvFormStorage
    AppStorage = FormMain.AppIni
    AppStoragePath = '%FORM_NAME%\'
    Options = [fpActiveControl]
    StoredProps.Strings = (
      'cbbSearch.ItemIndex'
      'dbgrdObjects.Tag')
    StoredValues = <>
    Left = 32
    Top = 224
  end
end
