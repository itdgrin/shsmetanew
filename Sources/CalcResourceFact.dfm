object fCalcResourceFact: TfCalcResourceFact
  Left = 0
  Top = 0
  Caption = #1056#1072#1089#1095#1077#1090' '#1092#1072#1082#1090#1080#1095#1077#1089#1082#1086#1081' '#1089#1090#1086#1080#1084#1086#1089#1090#1080' ['#1088#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077' '#1079#1072#1087#1088#1077#1097#1077#1085#1086']'
  ClientHeight = 362
  ClientWidth = 654
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
  PixelsPerInch = 96
  TextHeight = 13
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 654
    Height = 56
    Align = alTop
    TabOrder = 0
    DesignSize = (
      654
      56)
    object lbl1: TLabel
      Left = 8
      Top = 8
      Width = 23
      Height = 13
      Caption = #1040#1082#1090':'
    end
    object lbl6: TLabel
      Left = 8
      Top = 32
      Width = 87
      Height = 13
      Caption = #1056#1072#1089#1095#1077#1090#1085#1099#1081' '#1084#1077#1089#1103#1094
    end
    object btnShowDiff: TSpeedButton
      Left = 454
      Top = 29
      Width = 122
      Height = 22
      Anchors = [akTop, akRight]
      Caption = #1055#1086#1082#1072#1079#1072#1090#1100' '#1086#1090#1082#1083#1086#1085#1077#1085#1080#1077
      OnClick = btnShowDiffClick
    end
    object edtEstimateName: TEdit
      Left = 37
      Top = 5
      Width = 487
      Height = 21
      TabStop = False
      Anchors = [akLeft, akTop, akRight]
      Color = clMenuBar
      ReadOnly = True
      TabOrder = 1
      Text = #1057#1084#1077#1090#1072
    end
    object cbbFromMonth: TComboBox
      Left = 101
      Top = 29
      Width = 75
      Height = 21
      Style = csDropDownList
      DropDownCount = 12
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ItemIndex = 0
      ParentFont = False
      TabOrder = 2
      Text = #1071#1085#1074#1072#1088#1100
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
      Left = 179
      Top = 29
      Width = 49
      Height = 22
      Enabled = False
      MaxValue = 2100
      MinValue = 1900
      ReadOnly = True
      TabOrder = 3
      Value = 2014
    end
    object cbbNDS: TComboBox
      Left = 582
      Top = 29
      Width = 67
      Height = 21
      Style = csDropDownList
      Anchors = [akTop, akRight]
      DropDownCount = 12
      Enabled = False
      ItemIndex = 0
      TabOrder = 4
      Text = #1073#1077#1079' '#1053#1044#1057
      OnChange = pgcChange
      Items.Strings = (
        #1073#1077#1079' '#1053#1044#1057
        #1089' '#1053#1044#1057)
    end
    object pnlCalculationYesNo: TPanel
      Left = 530
      Top = 3
      Width = 120
      Height = 23
      Cursor = crHandPoint
      Anchors = [akTop, akRight]
      Caption = #1056#1072#1089#1095#1105#1090#1099' '#1079#1072#1087#1088#1077#1097#1077#1085#1099
      Color = clRed
      ParentBackground = False
      TabOrder = 0
      OnClick = pnlCalculationYesNoClick
    end
  end
  object pgc: TPageControl
    Left = 0
    Top = 56
    Width = 654
    Height = 306
    ActivePage = ts2
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    MultiLine = True
    ParentFont = False
    PopupMenu = pm
    TabOrder = 1
    OnChange = pgcChange
    object ts1: TTabSheet
      Caption = #1056#1072#1089#1095#1077#1090' '#1089#1090#1086#1080#1084#1086#1089#1090#1080
      TabVisible = False
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object lbl2: TLabel
        Left = 0
        Top = 0
        Width = 646
        Height = 278
        Align = alClient
        Alignment = taCenter
        AutoSize = False
        Caption = #1042' '#1088#1072#1079#1088#1072#1073#1086#1090#1082#1077'...'
        Layout = tlCenter
        ExplicitWidth = 80
        ExplicitHeight = 13
      end
    end
    object ts2: TTabSheet
      Caption = #1060#1072#1082#1090#1080#1095#1077#1089#1082#1080#1077'  '#1084#1072#1090#1077#1088#1080#1072#1083#1099
      ImageIndex = 1
      object spl2: TSplitter
        Left = 0
        Top = 193
        Width = 646
        Height = 3
        Cursor = crVSplit
        Align = alBottom
        ExplicitTop = 57
        ExplicitWidth = 179
      end
      object pnlMatTop: TPanel
        Left = 0
        Top = 0
        Width = 646
        Height = 28
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        DesignSize = (
          646
          28)
        object edtMatCodeFilter: TEdit
          Left = 4
          Top = 2
          Width = 121
          Height = 21
          TabOrder = 0
          TextHint = #1055#1086#1080#1089#1082' '#1087#1086' '#1082#1086#1076#1091'...'
          OnChange = edtMatCodeFilterChange
          OnClick = edtMatCodeFilterClick
        end
        object edtMatNameFilter: TEdit
          Left = 131
          Top = 2
          Width = 510
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
          TextHint = #1055#1086#1080#1089#1082' '#1087#1086' '#1085#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1102'...'
          OnChange = edtMatCodeFilterChange
          OnClick = edtMatCodeFilterClick
        end
      end
      object pnlMatClient: TPanel
        Left = 0
        Top = 28
        Width = 646
        Height = 165
        Align = alClient
        BevelOuter = bvNone
        Caption = 'pnlMatClient'
        TabOrder = 1
        object grMaterial: TJvDBGrid
          Left = 0
          Top = 0
          Width = 646
          Height = 146
          Align = alClient
          DataSource = dsMainData
          DrawingStyle = gdsClassic
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          PopupMenu = pm
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnDrawColumnCell = grMaterialDrawColumnCell
          IniStorage = FormStorage
          OnTitleBtnClick = grMaterialTitleBtnClick
          AutoSizeColumns = True
          SelectColumnsDialogStrings.Caption = 'Select columns'
          SelectColumnsDialogStrings.OK = '&OK'
          SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
          EditControls = <>
          RowsHeight = 17
          TitleRowHeight = 17
          OnCanEditCell = grMaterialCanEditCell
          Columns = <
            item
              Expanded = False
              FieldName = 'CODE'
              Title.Alignment = taCenter
              Title.Caption = #1050#1086#1076
              Width = 15
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NAME'
              Title.Alignment = taCenter
              Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
              Width = 56
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'UNIT'
              Title.Alignment = taCenter
              Title.Caption = #1045#1076'. '#1080#1079#1084'.'
              Width = 20
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CNT'
              Title.Alignment = taCenter
              Title.Caption = #1050#1086#1083'-'#1074#1086
              Width = 18
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'COAST'
              Title.Alignment = taCenter
              Title.Caption = #1062#1077#1085#1072
              Width = 51
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'forecast_cost_index'
              Title.Alignment = taCenter
              Title.Caption = #1048#1085#1076#1077#1082#1089' '#1088#1086#1089#1090#1072
              Width = 57
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PRICE'
              Title.Alignment = taCenter
              Title.Caption = #1057#1090#1086#1080#1084#1086#1089#1090#1100
              Width = 51
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PROC_TRANSP'
              Title.Alignment = taCenter
              Title.Caption = '% '#1090#1088#1072#1085#1089#1087'.'
              Width = 35
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TRANSP'
              Title.Alignment = taCenter
              Title.Caption = #1058#1088#1072#1085#1089#1087#1086#1088#1090
              Width = 51
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PROC_ZAC'
              Title.Caption = '% '#1079#1072#1082#1072#1079#1095#1080#1082#1072
              Width = 35
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PROC_PODR'
              Title.Caption = '% '#1087#1086#1076#1088#1103#1076#1095#1080#1082#1072
              Width = 41
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TRANSP_PROC_ZAC'
              Title.Caption = '% '#1090#1088#1072#1085#1089'. '#1079#1072#1082#1072#1079#1095#1080#1082#1072
              Width = 44
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TRANSP_PROC_PODR'
              Title.Caption = '% '#1090#1088#1072#1085#1089'. '#1087#1086#1076#1088#1103#1076#1095#1080#1082#1072
              Width = 51
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DOC_DATE'
              Title.Alignment = taCenter
              Title.Caption = #1053#1072#1082#1083'. '#1076#1072#1090#1072
              Width = 35
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DOC_NUM'
              Title.Alignment = taCenter
              Title.Caption = #1053#1072#1082#1083'. '#8470
              Width = 55
              Visible = True
            end>
        end
        object JvDBGridFooter1: TJvDBGridFooter
          Left = 0
          Top = 146
          Width = 646
          Height = 19
          SizeGrip = True
          Columns = <
            item
              Alignment = taRightJustify
              FieldName = 'PRICE'
            end
            item
              Alignment = taRightJustify
              FieldName = 'TRANSP'
            end>
          DataSource = dsMainData
          DBGrid = grMaterial
          OnCalculate = JvDBGridFooter1Calculate
        end
      end
      object pnlMatBott: TPanel
        Left = 0
        Top = 196
        Width = 646
        Height = 82
        Align = alBottom
        Caption = 'pnlMatBott'
        TabOrder = 2
        object spl1: TSplitter
          Left = 1
          Top = 22
          Width = 644
          Height = 3
          Cursor = crVSplit
          Align = alTop
          ExplicitTop = 1
          ExplicitWidth = 129
        end
        object grMaterialBott: TJvDBGrid
          Left = 1
          Top = 25
          Width = 644
          Height = 56
          Align = alClient
          Constraints.MinHeight = 40
          DataSource = dsMaterialDetail
          DrawingStyle = gdsClassic
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnDrawColumnCell = grMaterialBottDrawColumnCell
          AutoAppend = False
          IniStorage = FormStorage
          AutoSizeColumns = True
          SelectColumnsDialogStrings.Caption = 'Select columns'
          SelectColumnsDialogStrings.OK = '&OK'
          SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
          EditControls = <>
          RowsHeight = 17
          TitleRowHeight = 17
          OnCanEditCell = grMaterialCanEditCell
          Columns = <
            item
              Expanded = False
              FieldName = 'F1'
              Title.Alignment = taCenter
              Title.Caption = #8470#1087#1087
              Width = 65
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CODE'
              Title.Alignment = taCenter
              Title.Caption = #1054#1073#1086#1089#1085#1086#1074#1072#1085#1080#1077
              Width = 65
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CNT'
              Title.Alignment = taCenter
              Title.Caption = #1054#1073#1098#1077#1084' '#1088#1072#1073#1086#1090
              Width = 65
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CNT_DONE'
              Title.Alignment = taCenter
              Title.Caption = #1056#1072#1089#1093#1086#1076
              Width = 65
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'COAST'
              Title.Alignment = taCenter
              Title.Caption = #1062#1077#1085#1072
              Width = 65
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PROC_TRANSP'
              Title.Caption = '% '#1090#1088#1072#1085#1089#1087'.'
              Width = 37
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TRANSP'
              Title.Caption = #1058#1088#1072#1085#1089#1087#1086#1088#1090
              Width = 43
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MAT_PROC_ZAC'
              Title.Caption = '% '#1079#1072#1082#1072#1079#1095#1080#1082#1072
              Width = 43
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MAT_PROC_PODR'
              Title.Caption = '% '#1087#1086#1076#1088#1103#1076#1095#1080#1082#1072
              Width = 52
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TRANSP_PROC_ZAC'
              Title.Caption = '% '#1090#1088#1072#1085#1089'. '#1079#1072#1082#1072#1079#1095#1080#1082#1072
              Width = 56
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TRANSP_PROC_PODR'
              Title.Caption = '% '#1090#1088#1072#1085#1089'. '#1087#1086#1076#1088#1103#1076#1095#1080#1082#1072
              Width = 61
              Visible = True
            end>
        end
        object dbmmoNAME: TDBMemo
          Left = 1
          Top = 1
          Width = 644
          Height = 21
          Align = alTop
          Constraints.MinHeight = 21
          DataField = 'NAME'
          DataSource = dsMainData
          ScrollBars = ssVertical
          TabOrder = 0
        end
      end
    end
    object ts3: TTabSheet
      Caption = #1060#1072#1082#1090#1080#1095#1077#1089#1082#1080#1077' '#1084#1077#1093#1072#1085#1080#1079#1084#1099
      ImageIndex = 2
      object spl4: TSplitter
        Left = 0
        Top = 209
        Width = 646
        Height = 3
        Cursor = crVSplit
        Align = alBottom
        ExplicitTop = 224
        ExplicitWidth = 608
      end
      object pnlMechClient: TPanel
        Left = 0
        Top = 28
        Width = 646
        Height = 181
        Align = alClient
        BevelOuter = bvNone
        Caption = 'pnlMatClient'
        TabOrder = 1
        object grMech: TJvDBGrid
          Left = 0
          Top = 0
          Width = 646
          Height = 162
          Align = alClient
          DataSource = dsMainData
          DrawingStyle = gdsClassic
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          PopupMenu = pm
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnDrawColumnCell = grMaterialDrawColumnCell
          IniStorage = FormStorage
          OnTitleBtnClick = grMaterialTitleBtnClick
          AutoSizeColumns = True
          SelectColumnsDialogStrings.Caption = 'Select columns'
          SelectColumnsDialogStrings.OK = '&OK'
          SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
          EditControls = <>
          RowsHeight = 17
          TitleRowHeight = 17
          WordWrap = True
          WordWrapAllFields = True
          OnCanEditCell = grMaterialCanEditCell
          Columns = <
            item
              Expanded = False
              FieldName = 'CODE'
              Title.Alignment = taCenter
              Title.Caption = #1050#1086#1076
              Width = 39
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NAME'
              Title.Alignment = taCenter
              Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
              Visible = False
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'UNIT'
              Title.Alignment = taCenter
              Title.Caption = #1045#1076'. '#1080#1079#1084'.'
              Width = 25
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CNT'
              Title.Alignment = taCenter
              Title.Caption = #1050#1086#1083'-'#1074#1086
              Width = 22
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'COAST'
              Title.Alignment = taCenter
              Title.Caption = #1062#1077#1085#1072
              Width = 91
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'forecast_cost_index'
              Title.Alignment = taCenter
              Title.Caption = #1048#1085#1076#1077#1082#1089' '#1088#1086#1089#1090#1072
              Width = 59
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PRICE'
              Title.Alignment = taCenter
              Title.Caption = #1057#1090#1086#1080#1084#1086#1089#1090#1100
              Width = 91
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'COAST_ZP'
              Title.Alignment = taCenter
              Title.Caption = #1047#1072#1088#1087#1083'. '#1084#1072#1096'.'
              Width = 91
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PRICE_ZP'
              Title.Alignment = taCenter
              Title.Caption = #1057#1090'-'#1089#1090#1100' '#1079#1072#1088#1087#1083#1072#1090#1099
              Width = 98
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PROC_ZAC'
              Title.Alignment = taCenter
              Title.Caption = '% '#1079#1072#1082#1072#1079#1095#1080#1082#1072
              Width = 57
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PROC_PODR'
              Title.Alignment = taCenter
              Title.Caption = '% '#1087#1086#1076#1088#1103#1076#1095#1080#1082#1072
              Width = 47
              Visible = True
            end>
        end
        object JvDBGridFooter2: TJvDBGridFooter
          Left = 0
          Top = 162
          Width = 646
          Height = 19
          SizeGrip = True
          Columns = <
            item
              Alignment = taRightJustify
              FieldName = 'PRICE'
            end
            item
              Alignment = taRightJustify
              FieldName = 'CNT'
            end
            item
              Alignment = taRightJustify
              FieldName = 'COAST_ZP'
            end
            item
              Alignment = taRightJustify
              FieldName = 'PRICE_ZP'
            end>
          DataSource = dsMainData
          DBGrid = grMech
          OnCalculate = JvDBGridFooter1Calculate
        end
      end
      object pnlMechBott: TPanel
        Left = 0
        Top = 212
        Width = 646
        Height = 66
        Align = alBottom
        Caption = 'pnlMatBott'
        TabOrder = 2
        object spl3: TSplitter
          Left = 1
          Top = 22
          Width = 644
          Height = 3
          Cursor = crVSplit
          Align = alTop
          ExplicitTop = 1
          ExplicitWidth = 129
        end
        object grMechBott: TJvDBGrid
          Left = 1
          Top = 25
          Width = 644
          Height = 40
          Align = alClient
          Constraints.MinHeight = 40
          DataSource = dsMechDetail
          DrawingStyle = gdsClassic
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnDrawColumnCell = grMechBottDrawColumnCell
          AutoAppend = False
          IniStorage = FormStorage
          AutoSizeColumns = True
          SelectColumnsDialogStrings.Caption = 'Select columns'
          SelectColumnsDialogStrings.OK = '&OK'
          SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
          EditControls = <>
          RowsHeight = 17
          TitleRowHeight = 17
          OnCanEditCell = grMaterialCanEditCell
          Columns = <
            item
              Expanded = False
              Title.Alignment = taCenter
              Title.Caption = #8470#1087#1087
              Width = 90
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CODE'
              Title.Alignment = taCenter
              Title.Caption = #1054#1073#1086#1089#1085#1086#1074#1072#1085#1080#1077
              Width = 90
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CNT'
              Title.Alignment = taCenter
              Title.Caption = #1054#1073#1098#1077#1084' '#1088#1072#1073#1086#1090
              Width = 90
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CNT_DONE'
              Title.Alignment = taCenter
              Title.Caption = #1056#1072#1089#1093#1086#1076
              Width = 90
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'COAST'
              Title.Alignment = taCenter
              Title.Caption = #1062#1077#1085#1072
              Width = 90
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ZP_MASH'
              Title.Alignment = taCenter
              Title.Caption = #1047#1055' '#1084#1072#1096'.'
              Width = 51
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PROC_ZAC'
              Title.Alignment = taCenter
              Title.Caption = '% '#1079#1072#1082#1072#1079#1095#1080#1082#1072
              Width = 57
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PROC_PODR'
              Title.Alignment = taCenter
              Title.Caption = '% '#1087#1086#1076#1088#1103#1076#1095#1080#1082#1072
              Width = 62
              Visible = True
            end>
        end
        object dbmmoNAME1: TDBMemo
          Left = 1
          Top = 1
          Width = 644
          Height = 21
          Align = alTop
          Constraints.MinHeight = 21
          DataField = 'NAME'
          ScrollBars = ssVertical
          TabOrder = 0
        end
      end
      object pnlMechTop: TPanel
        Left = 0
        Top = 0
        Width = 646
        Height = 28
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        DesignSize = (
          646
          28)
        object edtMechCodeFilter: TEdit
          Left = 4
          Top = 2
          Width = 121
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          TextHint = #1055#1086#1080#1089#1082' '#1087#1086' '#1082#1086#1076#1091'...'
          OnChange = edtMatCodeFilterChange
          OnClick = edtMatCodeFilterClick
        end
        object edtMechNameFilter: TEdit
          Left = 131
          Top = 2
          Width = 510
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
          TextHint = #1055#1086#1080#1089#1082' '#1087#1086' '#1085#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1102'...'
          OnChange = edtMatCodeFilterChange
          OnClick = edtMatCodeFilterClick
        end
      end
    end
    object ts4: TTabSheet
      Caption = #1060#1072#1082#1090#1080#1095#1077#1089#1082#1086#1077' '#1086#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1077
      ImageIndex = 3
      object spl5: TSplitter
        Left = 0
        Top = 209
        Width = 646
        Height = 3
        Cursor = crVSplit
        Align = alBottom
        ExplicitLeft = 3
        ExplicitTop = 225
        ExplicitWidth = 608
      end
      object pnlDevTop: TPanel
        Left = 0
        Top = 0
        Width = 646
        Height = 28
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        DesignSize = (
          646
          28)
        object edt1: TEdit
          Left = 4
          Top = 2
          Width = 121
          Height = 21
          TabOrder = 0
          TextHint = #1055#1086#1080#1089#1082' '#1087#1086' '#1082#1086#1076#1091'...'
          OnChange = edtMatCodeFilterChange
          OnClick = edtMatCodeFilterClick
        end
        object edt2: TEdit
          Left = 131
          Top = 2
          Width = 510
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
          TextHint = #1055#1086#1080#1089#1082' '#1087#1086' '#1085#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1102'...'
          OnChange = edtMatCodeFilterChange
          OnClick = edtMatCodeFilterClick
        end
      end
      object pnlDevClient: TPanel
        Left = 0
        Top = 28
        Width = 646
        Height = 181
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object grDev: TJvDBGrid
          Left = 0
          Top = 0
          Width = 646
          Height = 162
          Align = alClient
          DataSource = dsMainData
          DrawingStyle = gdsClassic
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
          OnDrawColumnCell = grMaterialDrawColumnCell
          IniStorage = FormStorage
          OnTitleBtnClick = grMaterialTitleBtnClick
          AutoSizeColumns = True
          SelectColumnsDialogStrings.Caption = 'Select columns'
          SelectColumnsDialogStrings.OK = '&OK'
          SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
          EditControls = <>
          RowsHeight = 17
          TitleRowHeight = 17
          WordWrap = True
          WordWrapAllFields = True
          OnCanEditCell = grMaterialCanEditCell
          Columns = <
            item
              Expanded = False
              FieldName = 'CODE'
              Title.Alignment = taCenter
              Title.Caption = #1050#1086#1076
              Width = 47
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NAME'
              Title.Alignment = taCenter
              Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
              Visible = False
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'UNIT'
              Title.Alignment = taCenter
              Title.Caption = #1045#1076'. '#1080#1079#1084'.'
              Width = 47
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CNT'
              Title.Alignment = taCenter
              Title.Caption = #1050#1086#1083'-'#1074#1086
              Width = 47
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'COAST'
              Title.Alignment = taCenter
              Title.Caption = #1062#1077#1085#1072
              Width = 47
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'forecast_cost_index'
              Title.Alignment = taCenter
              Title.Caption = #1048#1085#1076#1077#1082#1089' '#1088#1086#1089#1090#1072
              Width = 57
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PRICE'
              Title.Alignment = taCenter
              Title.Caption = #1057#1090#1086#1080#1084#1086#1089#1090#1100
              Width = 47
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PROC_TRANSP'
              Title.Alignment = taCenter
              Title.Caption = '% '#1090#1088#1072#1085#1089#1087'.'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'TRANSP'
              Title.Alignment = taCenter
              Title.Caption = #1058#1088#1072#1085#1089#1087#1086#1088#1090
              Width = 42
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DOC_DATE'
              Title.Alignment = taCenter
              Title.Caption = #1053#1072#1082#1083'. '#1076#1072#1090#1072
              Width = 47
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DOC_NUM'
              Title.Alignment = taCenter
              Title.Caption = #1053#1072#1082#1083'. '#8470
              Width = 43
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PROC_ZAC'
              Title.Caption = '% '#1079#1072#1082#1072#1079#1095#1080#1082#1072
              Width = 43
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PROC_PODR'
              Title.Caption = '% '#1087#1086#1076#1088#1103#1076#1095#1080#1082#1072
              Width = 46
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TRANSP_PROC_ZAC'
              Title.Caption = '% '#1090#1088#1072#1085#1089'. '#1079#1072#1082#1072#1079#1095#1080#1082#1072
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TRANSP_PROC_PODR'
              Title.Caption = '% '#1090#1088#1072#1085#1089'. '#1087#1086#1076#1088#1103#1076#1095#1080#1082#1072
              Width = 54
              Visible = True
            end>
        end
        object JvDBGridFooter3: TJvDBGridFooter
          Left = 0
          Top = 162
          Width = 646
          Height = 19
          SizeGrip = True
          Columns = <
            item
              Alignment = taRightJustify
              FieldName = 'PRICE'
            end
            item
              Alignment = taRightJustify
              FieldName = 'CNT'
            end
            item
              Alignment = taRightJustify
              FieldName = 'TRANSP'
            end>
          DataSource = dsMainData
          DBGrid = grDev
          OnCalculate = JvDBGridFooter1Calculate
        end
      end
      object pnlDevBott: TPanel
        Left = 0
        Top = 212
        Width = 646
        Height = 66
        Align = alBottom
        TabOrder = 2
        object spl6: TSplitter
          Left = 1
          Top = 22
          Width = 644
          Height = 3
          Cursor = crVSplit
          Align = alTop
          ExplicitTop = 1
          ExplicitWidth = 129
        end
        object grDevBott: TJvDBGrid
          Left = 1
          Top = 25
          Width = 644
          Height = 40
          Align = alClient
          Constraints.MinHeight = 40
          DataSource = dsDevicesDetail
          DrawingStyle = gdsClassic
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          AutoAppend = False
          IniStorage = FormStorage
          AutoSizeColumns = True
          SelectColumnsDialogStrings.Caption = 'Select columns'
          SelectColumnsDialogStrings.OK = '&OK'
          SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
          EditControls = <>
          RowsHeight = 17
          TitleRowHeight = 17
          OnCanEditCell = grMaterialCanEditCell
          Columns = <
            item
              Expanded = False
              Title.Alignment = taCenter
              Title.Caption = #8470#1087#1087
              Width = 71
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CODE'
              Title.Alignment = taCenter
              Title.Caption = #1054#1073#1086#1089#1085#1086#1074#1072#1085#1080#1077
              Width = 71
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CNT'
              Title.Alignment = taCenter
              Title.Caption = #1054#1073#1098#1077#1084' '#1088#1072#1073#1086#1090
              Width = 71
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CNT_DONE'
              Title.Alignment = taCenter
              Title.Caption = #1056#1072#1089#1093#1086#1076
              Width = 71
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'COAST'
              Title.Alignment = taCenter
              Title.Caption = #1062#1077#1085#1072
              Width = 71
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TRANSP'
              Title.Caption = #1058#1088#1072#1085#1089#1087#1086#1088#1090
              Width = 39
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PROC_ZAC'
              Title.Caption = '% '#1079#1072#1082#1072#1079#1095#1080#1082#1072
              Width = 67
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PROC_PODR'
              Title.Caption = '% '#1087#1086#1076#1088#1103#1076#1095#1080#1082#1072
              Width = 45
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TRANSP_PROC_ZAC'
              Title.Caption = '% '#1090#1088#1072#1085#1089'. '#1079#1072#1082#1072#1079#1095#1080#1082#1072
              Width = 55
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TRANSP_PROC_PODR'
              Title.Caption = '% '#1090#1088#1072#1085#1089'. '#1087#1086#1076#1088#1103#1076#1095#1080#1082#1072
              Width = 57
              Visible = True
            end>
        end
        object dbmmoNAME2: TDBMemo
          Left = 1
          Top = 1
          Width = 644
          Height = 21
          Align = alTop
          Constraints.MinHeight = 21
          DataField = 'NAME'
          ScrollBars = ssVertical
          TabOrder = 0
        end
      end
    end
    object ts5: TTabSheet
      Caption = #1056#1072#1089#1095#1077#1090' '#1089#1090#1086#1080#1084#1086#1089#1090#1080
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ImageIndex = 4
      ParentFont = False
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object pnlRatesTop: TPanel
        Left = 0
        Top = 0
        Width = 646
        Height = 9
        Align = alTop
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object pnlRatesClient: TPanel
        Left = 0
        Top = 9
        Width = 646
        Height = 269
        Align = alClient
        Caption = #1042' '#1088#1072#1079#1088#1072#1073#1086#1090#1082#1077'...'
        TabOrder = 1
      end
    end
  end
  object pm: TPopupMenu
    OnPopup = pmPopup
    Left = 556
    Top = 168
    object mN4: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      OnClick = mN4Click
    end
    object mN5: TMenuItem
      Caption = #1057#1086#1079#1076#1072#1090#1100' '#1082#1086#1087#1080#1102
      OnClick = mN5Click
    end
    object mN6: TMenuItem
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      OnClick = mN6Click
    end
    object mN3: TMenuItem
      Caption = '-'
    end
    object N1: TMenuItem
      Caption = #1042#1099#1076#1077#1083#1080#1090#1100
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #1042#1099#1076#1077#1083#1080#1090#1100' '#1074#1089#1077
      OnClick = N2Click
    end
    object N4: TMenuItem
      Caption = '-'
    end
    object mDetete: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100
      OnClick = mDeteteClick
    end
    object mRestore: TMenuItem
      Caption = #1042#1086#1089#1089#1090#1072#1085#1086#1074#1080#1090#1100
      OnClick = mRestoreClick
    end
    object mN7: TMenuItem
      Caption = '-'
    end
    object mShowDeleted: TMenuItem
      AutoCheck = True
      Caption = #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1091#1076#1072#1083#1077#1085#1085#1099#1077
      OnClick = pgcChange
    end
  end
  object qrMainData: TFDQuery
    BeforeOpen = qrMainDataBeforeOpen
    AfterOpen = qrMainDataAfterOpen
    OnNewRecord = qrMainDataNewRecord
    Connection = DM.Connect
    Transaction = DM.Read
    UpdateTransaction = DM.Write
    FetchOptions.AssignedValues = [evCache, evAutoFetchAll]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    FormatOptions.AssignedValues = [fvMapRules, fvDefaultParamDataType, fvFmtDisplayNumeric]
    FormatOptions.OwnMapRules = True
    FormatOptions.MapRules = <
      item
        SourceDataType = dtMemo
        TargetDataType = dtAnsiString
      end>
    FormatOptions.DefaultParamDataType = ftBCD
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate, uvUpdateChngFields, uvCheckReadOnly, uvCheckUpdatable]
    UpdateOptions.EnableDelete = False
    UpdateOptions.UpdateChangedFields = False
    UpdateOptions.CheckReadOnly = False
    UpdateOptions.CheckUpdatable = False
    UpdateOptions.UpdateTableName = 'smeta.fact_data'
    UpdateOptions.KeyFields = 'fact_data_id'
    SQL.Strings = (
      'SELECT '
      '  f.fact_data_id,'
      '  f.CODE, /* '#1054#1073#1086#1089#1085#1086#1074#1072#1085#1080#1077'*/'
      '  f.NAME, /* '#1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' */'
      '  f.UNIT, /* '#1045#1076'. '#1080#1079#1084#1077#1088#1077#1085#1080#1103' */'
      '  f.CNT, /* '#1050#1086#1083'-'#1074#1086' */'
      '  f.DOC_DATE, /* '#1044#1072#1090#1072' '#1076#1086#1082#1091#1084#1077#1085#1090#1072' */'
      '  f.DOC_NUM, /* '#1053#1086#1084#1077#1088' '#1076#1086#1082#1091#1084#1077#1085#1090#1072' */'
      '  f.PROC_TRANSP, /* % '#1090#1088#1072#1085#1089#1087'. */'
      '  f.FCOAST,'
      '  f.COAST, /* '#1062#1077#1085#1072' */ '
      '  f.PRICE, /* '#1057#1090#1086#1080#1084#1086#1089#1090#1100' */ '
      '  f.TRANSP, /* '#1090#1088#1072#1085#1089#1087'. */ '
      '  f.DELETED,'
      '  f.PROC_ZAC,'
      '  f.PROC_PODR,'
      '  f.TRANSP_PROC_ZAC,'
      '  f.TRANSP_PROC_PODR,'
      '  f.NDS,'
      '  f.COAST_ZP,'
      '  f.PRICE_ZP,'
      '  f.SRC_OBJECT_ID,'
      '  f.forecast_cost_index,'
      '  f.ID_TYPE_DATA,'
      '  f.ID_ACT'
      'FROM fact_data f'
      '/*'
      
        'LEFT JOIN materialcard_temp mat ON mat.ID=f.ID_TABLES AND f.ID_T' +
        'YPE_DATA=2'
      
        'LEFT JOIN mechanizmcard_temp mech ON mech.ID=f.ID_TABLES AND f.I' +
        'D_TYPE_DATA=3'
      
        'LEFT JOIN devicescard_temp dev ON dev.ID=f.ID_TABLES AND f.ID_TY' +
        'PE_DATA=4 '
      '*/'
      
        'WHERE ((f.DELETED = 0) OR (:SHOW_DELETED)) AND f.ID_TYPE_DATA=:I' +
        'D_TYPE_DATA AND f.ID_ACT=:ID_ACT'
      'ORDER BY 2')
    Left = 27
    Top = 168
    ParamData = <
      item
        Name = 'SHOW_DELETED'
        DataType = ftBCD
        ParamType = ptInput
        Value = 0c
      end
      item
        Name = 'ID_TYPE_DATA'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'ID_ACT'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object qrMainDatafact_data_id: TFDAutoIncField
      FieldName = 'fact_data_id'
      Origin = 'fact_data_id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object strngfldMainDataCODE: TStringField
      FieldName = 'CODE'
      Origin = 'CODE'
      Required = True
    end
    object strngfldMainDataNAME: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NAME'
      Origin = 'NAME'
      Size = 300
    end
    object strngfldMainDataUNIT: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'UNIT'
      Origin = 'UNIT'
      Size = 100
    end
    object qrMainDataCNT: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'CNT'
      Origin = 'CNT'
      OnChange = qrMainDataCNTChange
      Precision = 24
    end
    object qrMainDataDOC_DATE: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'DOC_DATE'
      Origin = 'DOC_DATE'
    end
    object strngfldMainDataDOC_NUM: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DOC_NUM'
      Origin = 'DOC_NUM'
      Size = 50
    end
    object qrMainDataPROC_TRANSP: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'PROC_TRANSP'
      Origin = 'PROC_TRANSP'
      OnChange = qrMainDataPROC_TRANSPChange
      Precision = 24
    end
    object qrMainDataFCOAST: TShortintField
      AutoGenerateValue = arDefault
      FieldName = 'FCOAST'
      Origin = 'FCOAST'
    end
    object qrMainDataCOAST: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'COAST'
      Origin = 'COAST'
      OnChange = qrMainDataCNTChange
      Precision = 24
    end
    object qrMainDataPRICE: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'PRICE'
      Origin = 'PRICE'
      OnChange = qrMainDataPRICEChange
      Precision = 24
    end
    object qrMainDataTRANSP: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'TRANSP'
      Origin = 'TRANSP'
      Precision = 24
    end
    object qrMainDataDELETED: TShortintField
      AutoGenerateValue = arDefault
      FieldName = 'DELETED'
      Origin = 'DELETED'
    end
    object qrMainDataPROC_ZAC: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'PROC_ZAC'
      Origin = 'PROC_ZAC'
      OnChange = qrMainDataPROC_ZACChange
      Precision = 24
    end
    object qrMainDataPROC_PODR: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'PROC_PODR'
      Origin = 'PROC_PODR'
      OnChange = qrMainDataPROC_PODRChange
      Precision = 24
    end
    object qrMainDataTRANSP_PROC_ZAC: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'TRANSP_PROC_ZAC'
      Origin = 'TRANSP_PROC_ZAC'
      OnChange = qrMainDataTRANSP_PROC_ZACChange
      Precision = 24
    end
    object qrMainDataTRANSP_PROC_PODR: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'TRANSP_PROC_PODR'
      Origin = 'TRANSP_PROC_PODR'
      OnChange = qrMainDataTRANSP_PROC_PODRChange
      Precision = 24
    end
    object qrMainDataNDS: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'NDS'
      Origin = 'NDS'
      Precision = 5
      Size = 2
    end
    object qrMainDataCOAST_ZP: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'COAST_ZP'
      Origin = 'COAST_ZP'
      OnChange = qrMainDataCNTChange
      Precision = 24
    end
    object qrMainDataPRICE_ZP: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'PRICE_ZP'
      Origin = 'PRICE_ZP'
      Precision = 24
    end
    object qrMainDataSRC_OBJECT_ID: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'SRC_OBJECT_ID'
      Origin = 'SRC_OBJECT_ID'
    end
    object qrMainDataforecast_cost_index: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'forecast_cost_index'
      Origin = 'forecast_cost_index'
      OnChange = qrMainDataCNTChange
      Precision = 24
    end
    object qrMainDataID_TYPE_DATA: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'ID_TYPE_DATA'
      Origin = 'ID_TYPE_DATA'
    end
    object qrMainDataID_ACT: TLongWordField
      AutoGenerateValue = arDefault
      FieldName = 'ID_ACT'
      Origin = 'ID_ACT'
    end
  end
  object dsMainData: TDataSource
    DataSet = qrMainData
    Left = 27
    Top = 216
  end
  object FormStorage: TJvFormStorage
    AppStorage = FormMain.AppIni
    AppStoragePath = '%FORM_NAME%\'
    Options = []
    StoredProps.Strings = (
      'pnlMatBott.Height'
      'pnlMechBott.Height'
      'pnlDevBott.Height')
    StoredValues = <>
    Left = 552
    Top = 216
  end
  object qrMaterialDetail: TFDQuery
    BeforeOpen = qrMainDataBeforeOpen
    MasterSource = dsMainData
    MasterFields = 'SRC_OBJECT_ID'
    Connection = DM.Connect
    Transaction = DM.Read
    UpdateTransaction = DM.Write
    FetchOptions.AssignedValues = [evCache, evAutoFetchAll]
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
    UpdateOptions.AssignedValues = [uvUpdateChngFields, uvCheckReadOnly, uvCheckUpdatable]
    UpdateOptions.UpdateChangedFields = False
    UpdateOptions.CheckReadOnly = False
    UpdateOptions.CheckUpdatable = False
    SQL.Strings = (
      'SELECT '
      '  IF(m.ID_REPLACED<>0, m.ID_REPLACED, m.ID) AS F1,'
      '  COALESCE(c.RATE_CODE, m.MAT_CODE) AS CODE, '
      
        '  COALESCE(c.RATE_COUNT, IFNULL(m.MAT_COUNT, 0)) AS CNT, /* '#1050#1086#1083'-' +
        #1074#1086' */'
      
        '  IF(:NDS=1, IF(m.FCOAST_NDS<>0, 1, 0), IF(m.FCOAST_NO_NDS<>0, 1' +
        ', 0)) AS FCOAST, /* '#1062#1077#1085#1072' F */ '
      
        '  IF(:NDS=1, IF(m.FCOAST_NDS<>0, m.FCOAST_NDS, m.COAST_NDS), IF(' +
        'm.FCOAST_NO_NDS<>0, m.FCOAST_NO_NDS, m.COAST_NO_NDS)) AS COAST, ' +
        '/* '#1062#1077#1085#1072' */'
      
        '  /* IFNULL((SELECT SUM(MAT_COUNT) FROM MATERIALCARD_ACT WHERE I' +
        'D=m.ID AND DELETED = 0), 0) AS CNT_DONE, '#1042#1099#1087#1086#1083#1085#1077#1085#1086'*/ '
      '  IFNULL(m.MAT_COUNT, 0) AS CNT_DONE, /* '#1056#1072#1089#1093#1086#1076' */'
      '  m.DELETED,'
      '  d.ID AS data_estimate_id,'
      '  m.MAT_PROC_ZAC,'
      '  m.MAT_PROC_PODR,'
      '  m.TRANSP_PROC_ZAC,'
      '  m.TRANSP_PROC_PODR,'
      '  m.PROC_TRANSP,'
      
        '  IF(:NDS=1, IF(m.FTRANSP_NDS<>0, m.FTRANSP_NDS, m.TRANSP_NDS), ' +
        'IF(m.FTRANSP_NO_NDS<>0, m.FTRANSP_NO_NDS, m.TRANSP_NO_NDS)) AS T' +
        'RANSP,'
      '  m.MAT_ID,'
      '  m.ID,'
      '  m.REPLACED,'
      '  m.ID_REPLACED'
      'FROM        '
      'data_row_temp AS d '
      
        'left join card_rate_temp AS c on d.ID_TYPE_DATA = 1 AND c.ID = d' +
        '.ID_TABLES '
      
        'join materialcard_temp AS m on ((d.ID_TYPE_DATA = 2 AND m.ID = d' +
        '.ID_TABLES) OR (m.ID_CARD_RATE = c.ID)) AND m.MAT_ID = :SRC_OBJE' +
        'CT_ID'
      'WHERE'
      '  ((m.DELETED = 0) OR (:SHOW_DELETED))'
      'ORDER BY 1,2')
    Left = 27
    Top = 264
    ParamData = <
      item
        Name = 'NDS'
        DataType = ftInteger
        ParamType = ptInput
        Value = 0
      end
      item
        Name = 'SRC_OBJECT_ID'
        ParamType = ptInput
      end
      item
        Name = 'SHOW_DELETED'
        DataType = ftBCD
        ParamType = ptInput
      end>
  end
  object dsMaterialDetail: TDataSource
    DataSet = qrMaterialDetail
    Left = 27
    Top = 312
  end
  object qrEstimate: TFDQuery
    AfterOpen = qrMainDataAfterOpen
    Connection = DM.Connect
    Transaction = DM.Read
    UpdateTransaction = DM.Write
    FetchOptions.AssignedValues = [evCache, evAutoFetchAll]
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
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate, uvUpdateChngFields, uvCheckReadOnly, uvCheckUpdatable]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.UpdateChangedFields = False
    UpdateOptions.CheckReadOnly = False
    UpdateOptions.CheckUpdatable = False
    SQL.Strings = (
      
        'SELECT smetasourcedata.NAME AS NAME, objcards.STATE_NDS AS NDS, ' +
        'MONTH(smetasourcedata.DATE) AS MONTH, YEAR(smetasourcedata.DATE)' +
        ' AS YEAR'
      'FROM '
      '  smetasourcedata,objcards '
      'WHERE '
      'smetasourcedata.SM_ID=:SM_ID AND '
      'smetasourcedata.OBJ_ID=objcards.OBJ_ID')
    Left = 483
    Top = 8
    ParamData = <
      item
        Name = 'SM_ID'
        ParamType = ptInput
      end>
  end
  object qrMechDetail: TFDQuery
    BeforeOpen = qrMainDataBeforeOpen
    MasterSource = dsMainData
    MasterFields = 'SRC_OBJECT_ID'
    Connection = DM.Connect
    Transaction = DM.Read
    UpdateTransaction = DM.Write
    FetchOptions.AssignedValues = [evCache, evAutoFetchAll]
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
    UpdateOptions.AssignedValues = [uvUpdateChngFields, uvCheckReadOnly, uvCheckUpdatable]
    UpdateOptions.UpdateChangedFields = False
    UpdateOptions.CheckReadOnly = False
    UpdateOptions.CheckUpdatable = False
    SQL.Strings = (
      'SELECT '
      '  IF(m.ID_REPLACED<>0, m.ID_REPLACED, m.ID),'
      '  COALESCE(c.RATE_CODE, m.MECH_CODE) AS CODE, '
      
        '  COALESCE(c.RATE_COUNT, IFNULL(m.MECH_COUNT, 0)) AS CNT, /* '#1050#1086#1083 +
        '-'#1074#1086' */'
      
        '  IF(:NDS=1, IF(m.FCOAST_NDS<>0, m.FCOAST_NDS, m.COAST_NDS), IF(' +
        'm.FCOAST_NO_NDS<>0, m.FCOAST_NO_NDS, m.COAST_NO_NDS)) AS COAST, ' +
        '/* '#1062#1077#1085#1072' */'
      
        '  IF(:NDS=1, IF(m.FZP_MACH_NDS<>0, m.FZP_MACH_NDS, m.ZP_MACH_NDS' +
        '), IF(m.FZP_MACH_NO_NDS<>0, m.FZP_MACH_NO_NDS, m.ZP_MACH_NO_NDS)' +
        ') AS ZP_MASH, /* '#1047#1055' '#1084#1072#1096#1080#1085#1080#1089#1090#1072' */ '
      '  IFNULL(m.MECH_COUNT, 0) AS CNT_DONE, /* '#1056#1072#1089#1093#1086#1076' */'
      '  m.DELETED,'
      '  d.ID AS data_estimate_id,'
      '  m.PROC_ZAC,'
      '  m.PROC_PODR,'
      '  m.MECH_ID,'
      '  m.ID,'
      '  m.REPLACED,'
      '  m.ID_REPLACED'
      'FROM        '
      'data_row_temp AS d '
      
        'left join card_rate_temp AS c on d.ID_TYPE_DATA = 1 AND c.ID = d' +
        '.ID_TABLES '
      
        'join mechanizmcard_temp AS m on ((d.ID_TYPE_DATA = 3 AND m.ID = ' +
        'd.ID_TABLES) OR (m.ID_CARD_RATE = c.ID)) AND m.MECH_ID = :SRC_OB' +
        'JECT_ID'
      'WHERE'
      '  ((m.DELETED = 0) OR (:SHOW_DELETED))'
      'ORDER BY 1,2')
    Left = 99
    Top = 264
    ParamData = <
      item
        Name = 'NDS'
        DataType = ftInteger
        ParamType = ptInput
        Value = 0
      end
      item
        Name = 'SRC_OBJECT_ID'
        ParamType = ptInput
      end
      item
        Name = 'SHOW_DELETED'
        DataType = ftBCD
        ParamType = ptInput
      end>
  end
  object dsMechDetail: TDataSource
    DataSet = qrMechDetail
    Left = 99
    Top = 312
  end
  object qrDevicesDetail: TFDQuery
    BeforeOpen = qrMainDataBeforeOpen
    MasterSource = dsMainData
    MasterFields = 'SRC_OBJECT_ID'
    Connection = DM.Connect
    Transaction = DM.Read
    UpdateTransaction = DM.Write
    FetchOptions.AssignedValues = [evCache, evAutoFetchAll]
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
    UpdateOptions.AssignedValues = [uvUpdateChngFields, uvCheckReadOnly, uvCheckUpdatable]
    UpdateOptions.UpdateChangedFields = False
    UpdateOptions.CheckReadOnly = False
    UpdateOptions.CheckUpdatable = False
    SQL.Strings = (
      'SELECT '
      '  m.DEVICE_CODE AS CODE, '
      '  IFNULL(m.DEVICE_COUNT, 0) AS CNT, /* '#1050#1086#1083'-'#1074#1086' */'
      
        '  IF(:NDS=1, IF(m.FCOAST_NDS<>0, m.FCOAST_NDS, 0), IF(m.FCOAST_N' +
        'O_NDS<>0, m.FCOAST_NO_NDS, 0)) AS COAST, /* '#1062#1077#1085#1072' */'
      
        '  IF(:NDS=1, IF(DEVICE_TRANSP_NDS<>0, DEVICE_TRANSP_NDS, 0), IF(' +
        'DEVICE_TRANSP_NO_NDS<>0, DEVICE_TRANSP_NO_NDS, 0)) AS TRANSP,  /' +
        '* '#1090#1088#1072#1085#1089#1087'. */'
      '  IFNULL(m.DEVICE_COUNT, 0) AS CNT_DONE, /* '#1056#1072#1089#1093#1086#1076' */'
      '  0 as DELETED,'
      '  d.ID AS data_estimate_id,'
      '  m.PROC_ZAC,'
      '  m.PROC_PODR,'
      '  m.TRANSP_PROC_ZAC,'
      '  m.TRANSP_PROC_PODR,'
      '  m.DEVICE_ID,'
      '  m.ID'
      'FROM        '
      'data_row_temp AS d '
      
        'join devicescard_temp AS m on d.ID_TYPE_DATA = 4 AND m.ID = d.ID' +
        '_TABLES AND m.DEVICE_ID = :SRC_OBJECT_ID'
      '')
    Left = 155
    Top = 264
    ParamData = <
      item
        Name = 'NDS'
        DataType = ftInteger
        ParamType = ptInput
        Value = 0
      end
      item
        Name = 'SRC_OBJECT_ID'
        ParamType = ptInput
      end>
  end
  object dsDevicesDetail: TDataSource
    DataSet = qrDevicesDetail
    Left = 155
    Top = 312
  end
end
