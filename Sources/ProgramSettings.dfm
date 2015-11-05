object FormProgramSettings: TFormProgramSettings
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080' '#1087#1088#1086#1075#1088#1072#1084#1084#1099
  ClientHeight = 406
  ClientWidth = 648
  Color = clBtnFace
  DoubleBuffered = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnShow = FormShow
  DesignSize = (
    648
    406)
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 0
    Top = 365
    Width = 648
    Height = 41
    Align = alBottom
    Shape = bsTopLine
    ExplicitLeft = 8
    ExplicitTop = 326
  end
  object pcSettings: TPageControl
    Left = 8
    Top = 8
    Width = 632
    Height = 351
    ActivePage = tsTables
    Anchors = [akLeft, akTop, akRight, akBottom]
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object tsTables: TTabSheet
      Caption = #1058#1072#1073#1083#1080#1094#1099
      ImageIndex = 2
      DesignSize = (
        624
        323)
      object Label1: TLabel
        Left = 287
        Top = 3
        Width = 260
        Height = 13
        Caption = #1055#1088#1080#1084#1077#1088' '#1101#1083#1077#1084#1077#1085#1090#1086#1074' '#1089' '#1085#1072#1089#1090#1088#1086#1077#1085#1085#1099#1084#1080' '#1089#1090#1080#1083#1103#1084#1080':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object GroupBoxColor: TGroupBox
        Left = 3
        Top = 3
        Width = 278
        Height = 317
        Anchors = [akLeft, akTop, akBottom]
        Caption = #1062#1074#1077#1090#1072
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object LabelFontSelectRow: TLabel
          Left = 8
          Top = 123
          Width = 168
          Height = 13
          Caption = #1062#1074#1077#1090' '#1090#1077#1082#1089#1090#1072' '#1074#1099#1076#1077#1083#1077#1085#1085#1086#1081' '#1089#1090#1088#1086#1082#1077
        end
        object LabelFontSelectCell: TLabel
          Left = 8
          Top = 165
          Width = 143
          Height = 13
          Caption = #1058#1077#1082#1089#1090' '#1074' '#1074#1099#1076#1077#1083#1077#1085#1085#1086#1081' '#1103#1095#1077#1081#1082#1077
        end
        object ShapeFontRows: TShape
          Left = 257
          Top = 79
          Width = 17
          Height = 17
          OnMouseDown = ShapeMouseDown
        end
        object ShapeBackgroundSelectRow: TShape
          Left = 257
          Top = 102
          Width = 17
          Height = 17
          OnMouseDown = ShapeMouseDown
        end
        object LabelBackgroundHead: TLabel
          Left = 8
          Top = 20
          Width = 55
          Height = 13
          Caption = #1060#1086#1085' '#1096#1072#1087#1082#1080
        end
        object LabelBackgroundSelectRow: TLabel
          Left = 8
          Top = 104
          Width = 124
          Height = 13
          Caption = #1060#1086#1085' '#1074#1099#1076#1077#1083#1077#1085#1085#1086#1081' '#1089#1090#1088#1086#1082#1080
        end
        object LabelBackgroundSelectCell: TLabel
          Left = 8
          Top = 146
          Width = 125
          Height = 13
          Caption = #1060#1086#1085' '#1074#1099#1076#1077#1083#1077#1085#1085#1086#1081' '#1103#1095#1077#1081#1082#1080
        end
        object ShapeBackgroundHead: TShape
          Left = 257
          Top = 18
          Width = 17
          Height = 17
          OnMouseDown = ShapeMouseDown
        end
        object ShapeBackgroundSelectCell: TShape
          Left = 257
          Top = 144
          Width = 17
          Height = 17
          OnMouseDown = ShapeMouseDown
        end
        object LabelFontHead: TLabel
          Left = 8
          Top = 39
          Width = 108
          Height = 13
          Caption = #1062#1074#1077#1090' '#1090#1077#1082#1089#1090#1072' '#1074' '#1096#1072#1087#1082#1077
        end
        object ShapeFontHead: TShape
          Left = 257
          Top = 37
          Width = 17
          Height = 17
          OnMouseDown = ShapeMouseDown
        end
        object ShapeFontSelectCell: TShape
          Left = 257
          Top = 163
          Width = 17
          Height = 17
          OnMouseDown = ShapeMouseDown
        end
        object LabelBackgroundRows: TLabel
          Left = 8
          Top = 62
          Width = 132
          Height = 13
          Caption = #1060#1086#1085' '#1085#1077#1074#1099#1076#1077#1083#1077#1085#1085#1099#1093' '#1089#1090#1088#1086#1082
        end
        object LabelFontRows: TLabel
          Left = 8
          Top = 81
          Width = 176
          Height = 13
          Caption = #1062#1074#1077#1090' '#1090#1077#1082#1089#1090#1072' '#1085#1077#1074#1099#1076#1077#1083#1077#1085#1085#1099#1093' '#1089#1090#1088#1086#1082
        end
        object ShapeFontSelectRow: TShape
          Left = 257
          Top = 121
          Width = 17
          Height = 17
          OnMouseDown = ShapeMouseDown
        end
        object ShapeBackgroundRows: TShape
          Left = 257
          Top = 60
          Width = 17
          Height = 17
          OnMouseDown = ShapeMouseDown
        end
        object ShapeSelectRowUnfocusedTable: TShape
          Left = 257
          Top = 186
          Width = 17
          Height = 17
          Brush.Color = clWindow
          OnMouseDown = ShapeMouseDown
        end
        object LabelSelectRowUnfocusedTable: TLabel
          Left = 8
          Top = 188
          Width = 218
          Height = 13
          Caption = #1042#1099#1076#1077#1083#1077#1085#1085#1072#1103' '#1089#1090#1088#1086#1082#1072' '#1074' '#1085#1077#1072#1082#1090#1080#1074#1085#1086#1081' '#1090#1072#1073#1083#1080#1094#1077
        end
        object Button3: TButton
          Left = 8
          Top = 328
          Width = 262
          Height = 25
          Caption = #1042#1086#1089#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1094#1074#1077#1090#1072' '#1087#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
          Enabled = False
          TabOrder = 1
        end
        object grp1: TGroupBox
          Left = 3
          Top = 208
          Width = 272
          Height = 107
          Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080' '#1096#1088#1080#1092#1090#1086#1074':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          object lblFontRow: TLabel
            Left = 10
            Top = 20
            Width = 98
            Height = 13
            Cursor = crHandPoint
            Caption = #1090#1072#1073#1083#1080#1095#1085#1099#1077' '#1076#1072#1085#1085#1099#1077
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            OnClick = lblFontRowClick
          end
          object lblFontControls: TLabel
            Left = 10
            Top = 39
            Width = 159
            Height = 13
            Cursor = crHandPoint
            Caption = #1101#1083#1077#1084#1077#1085#1090#1099' '#1091#1087#1088#1072#1074#1083#1077#1085#1080#1103' ('#1082#1085#1086#1087#1082#1080')'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            OnClick = lblFontRowClick
          end
          object lblFontText: TLabel
            Left = 10
            Top = 58
            Width = 159
            Height = 13
            Cursor = crHandPoint
            Caption = #1090#1077#1082#1089#1090#1086#1074#1099#1077' '#1087#1086#1083#1103' '#1074#1074#1086#1076#1072'/'#1074#1099#1074#1086#1076#1072
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            OnClick = lblFontRowClick
          end
        end
      end
      object StringGridDemo: TStringGrid
        Left = 287
        Top = 22
        Width = 334
        Height = 150
        ColCount = 3
        DefaultColWidth = 70
        DefaultRowHeight = 20
        DefaultDrawing = False
        FixedCols = 0
        RowCount = 3
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goThumbTracking]
        ParentFont = False
        TabOrder = 1
        OnClick = StringGridDemoClick
        OnDrawCell = StringGridDemoDrawCell
        OnEnter = StringGridDemoEnter
        OnExit = StringGridDemoExit
        OnMouseMove = StringGridDemoMouseMove
      end
      object ButtonDefaultSettingsTables: TButton
        Left = 287
        Top = 295
        Width = 334
        Height = 25
        Caption = #1042#1086#1089#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1085#1072#1089#1090#1088#1086#1081#1082#1080' '#1087#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        OnClick = ButtonDefaultSettingsTablesClick
      end
      object btnExample: TButton
        Left = 287
        Top = 178
        Width = 98
        Height = 25
        Caption = #1050#1085#1086#1087#1082#1072
        TabOrder = 2
      end
      object edtExample: TEdit
        Left = 391
        Top = 178
        Width = 230
        Height = 21
        TabOrder = 3
        Text = #1055#1086#1083#1077' '#1074#1074#1086#1076#1072'/'#1074#1099#1074#1086#1076#1072
      end
    end
    object tsUpdate: TTabSheet
      Caption = #1054#1073#1085#1086#1074#1083#1077#1085#1080#1103
      ImageIndex = 2
      DesignSize = (
        624
        323)
      object gbLocalMirrorSettings: TGroupBox
        Left = 3
        Top = 98
        Width = 598
        Height = 55
        Anchors = [akLeft, akTop, akRight]
        Caption = '   '
        Enabled = False
        TabOrder = 3
        DesignSize = (
          598
          55)
        object sbOpenDir: TSpeedButton
          Tag = 1
          Left = 556
          Top = 20
          Width = 23
          Height = 22
          Anchors = [akTop, akRight]
          Caption = '...'
          OnClick = sbOpenDirClick
          ExplicitLeft = 543
        end
        object lbMirrorPath: TLabel
          Left = 8
          Top = 23
          Width = 29
          Height = 13
          Caption = #1055#1091#1090#1100':'
        end
        object edtLocalMirrorPath: TEdit
          Left = 43
          Top = 21
          Width = 507
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
        end
      end
      object gbInetServSettings: TGroupBox
        Left = 3
        Top = 18
        Width = 598
        Height = 75
        Caption = '    '
        TabOrder = 1
        DesignSize = (
          598
          75)
        object sbOpenDir1: TSpeedButton
          Left = 543
          Top = 41
          Width = 23
          Height = 22
          Anchors = [akTop, akRight]
          Caption = '...'
          OnClick = sbOpenDirClick
        end
        object lbCreateMirrorPath: TLabel
          Left = 8
          Top = 44
          Width = 29
          Height = 13
          Caption = #1055#1091#1090#1100':'
        end
        object cbCreateLocalMirror: TCheckBox
          Left = 43
          Top = 20
          Width = 297
          Height = 17
          Caption = #1057#1086#1079#1076#1072#1074#1072#1090#1100' '#1079#1077#1088#1082#1072#1083#1086' '#1076#1083#1103' '#1086#1073#1085#1086#1083#1077#1085#1080#1081' '#1074' '#1083#1086#1082#1072#1083#1100#1085#1086#1081' '#1089#1077#1090#1080
          TabOrder = 0
        end
        object edtCreateMirrorPath: TEdit
          Left = 43
          Top = 42
          Width = 494
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
        end
      end
      object rbInetServer: TRadioButton
        Left = 16
        Top = 16
        Width = 257
        Height = 17
        Caption = #1054#1073#1085#1086#1074#1083#1103#1090#1100#1089#1103' '#1089' '#1080#1085#1090#1077#1088#1085#1077#1090'-'#1089#1077#1088#1074#1077#1088#1072' '#1086#1073#1085#1086#1074#1083#1077#1085#1080#1081
        Checked = True
        TabOrder = 0
        TabStop = True
        OnClick = rbInetServerClick
      end
      object rbLocalMirror: TRadioButton
        Left = 16
        Top = 95
        Width = 203
        Height = 17
        Caption = #1054#1073#1085#1086#1074#1083#1103#1090#1100#1089#1103' '#1089' '#1079#1077#1088#1082#1072#1083#1072' '#1086#1073#1085#1086#1074#1083#1077#1085#1080#1081
        TabOrder = 2
        OnClick = rbInetServerClick
      end
    end
    object tsAll: TTabSheet
      Caption = #1056#1072#1079#1085#1086#1077
      ImageIndex = 1
      object lblOXROPR: TLabel
        Left = 3
        Top = 239
        Width = 279
        Height = 13
        Caption = #1042#1080#1076' '#1088#1072#1073#1086#1090' '#1076#1083#1103' '#1054#1061#1056#1080#1054#1055#1056' '#1080' '#1055#1055' '#1088#1072#1089#1094#1077#1085#1086#1082' '#1087#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102':'
      end
      object GroupBoxRound: TGroupBox
        Left = 3
        Top = 3
        Width = 244
        Height = 46
        Caption = #1055#1088#1072#1074#1080#1083#1072' '#1086#1082#1088#1091#1075#1083#1077#1085#1080#1103' '#1095#1080#1089#1077#1083
        TabOrder = 0
        object LabelRound1: TLabel
          Left = 8
          Top = 20
          Width = 71
          Height = 13
          Caption = #1054#1082#1088#1091#1075#1083#1103#1090#1100' '#1076#1086
        end
        object LabelRound2: TLabel
          Left = 131
          Top = 20
          Width = 105
          Height = 13
          Caption = #1095#1080#1089#1077#1083' '#1087#1086#1089#1083#1077' '#1079#1072#1087#1103#1090#1086#1081
        end
        object ComboBoxRound: TComboBox
          Left = 85
          Top = 17
          Width = 40
          Height = 21
          ItemIndex = 0
          TabOrder = 0
          Text = '0'
          Items.Strings = (
            '0'
            '1'
            '2'
            '3'
            '4')
        end
      end
      object ButtonDefaultOtherSettings: TButton
        Left = 287
        Top = 295
        Width = 334
        Height = 25
        Caption = #1042#1086#1089#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1085#1072#1089#1090#1088#1086#1081#1082#1080' '#1087#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
        TabOrder = 12
        OnClick = ButtonDefaultOtherSettingsClick
      end
      object CheckBoxShowHint: TCheckBox
        Left = 3
        Top = 55
        Width = 286
        Height = 17
        Caption = #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1074#1089#1087#1083#1099#1074#1072#1102#1097#1091#1102' '#1087#1086#1076#1089#1082#1072#1079#1082#1091' '#1074' '#1090#1072#1073#1083#1080#1094#1072#1093
        TabOrder = 1
      end
      object chkAutoCreateEstimates: TCheckBox
        Left = 3
        Top = 78
        Width = 334
        Height = 17
        Caption = #1057#1086#1079#1076#1072#1074#1072#1090#1100' '#1085#1072#1073#1086#1088' '#1054#1073#1098#1077#1082#1090#1085#1072#1103'-'#1051#1086#1082#1072#1083#1100#1085#1072#1103'-'#1055#1058#1052' '#1072#1074#1090#1086#1084#1072#1090#1080#1095#1077#1089#1082#1080
        Checked = True
        State = cbChecked
        TabOrder = 2
      end
      object chkAutoExpandTreeEstimates: TCheckBox
        Left = 3
        Top = 101
        Width = 310
        Height = 17
        Caption = #1056#1072#1089#1082#1088#1099#1074#1072#1090#1100' '#1072#1074#1090#1086#1084#1072#1090#1080#1095#1077#1089#1082#1080' '#1076#1077#1088#1077#1074#1086' '#1089#1084#1077#1090'/'#1072#1082#1090#1086#1074' '#1086#1073#1098#1077#1082#1090#1072
        Checked = True
        State = cbChecked
        TabOrder = 3
      end
      object chkCalcResourcesAutoSave: TCheckBox
        Left = 3
        Top = 124
        Width = 470
        Height = 17
        Caption = 
          #1056#1072#1089#1095#1077#1090' '#1089#1090#1086#1080#1084#1086#1089#1090#1080' '#1088#1077#1089#1091#1088#1089#1086#1074' - '#1072#1090#1086#1084#1072#1090#1080#1095#1077#1089#1082#1086#1077' '#1089#1086#1093#1088#1072#1085#1077#1085#1080#1077' '#1080#1079#1084#1077#1085#1077#1085#1080#1081' '#1073 +
          #1077#1079' '#1087#1086#1076#1090#1074#1077#1088#1078#1076#1077#1085#1080#1103
        Checked = True
        State = cbChecked
        TabOrder = 4
      end
      object chkAutosaveRateDescr: TCheckBox
        Left = 3
        Top = 170
        Width = 470
        Height = 17
        Caption = #1040#1074#1090#1086#1089#1086#1093#1088#1072#1085#1077#1085#1080#1077' '#1087#1088#1080' '#1080#1079#1084#1077#1085#1077#1085#1080#1080' '#1086#1087#1080#1089#1072#1085#1080#1103' '#1088#1072#1089#1094#1077#1085#1082#1080
        Checked = True
        State = cbChecked
        TabOrder = 6
      end
      object chkAutoSaveCalcResourcesAfterExitCell: TCheckBox
        Left = 3
        Top = 147
        Width = 598
        Height = 17
        Caption = 
          #1056#1072#1089#1095#1077#1090' '#1089#1090#1086#1080#1084#1086#1089#1090#1080' '#1088#1077#1089#1091#1088#1089#1086#1074' - '#1072#1090#1086#1084#1072#1090#1080#1095#1077#1089#1082#1086#1077' '#1089#1086#1093#1088#1072#1085#1077#1085#1080#1077' '#1080#1079#1084#1077#1085#1077#1085#1080#1081' '#1087 +
          #1088#1080' '#1087#1077#1088#1077#1093#1086#1076#1077' '#1074#1085#1091#1090#1088#1080' '#1088#1077#1076#1072#1082#1090#1080#1088#1091#1077#1084#1086#1081' '#1079#1072#1087#1080#1089#1080
        TabOrder = 5
      end
      object chkShowNeedSaveDialog: TCheckBox
        Left = 3
        Top = 193
        Width = 350
        Height = 17
        Caption = #1047#1072#1087#1088#1086#1089' '#1085#1072' '#1089#1086#1093#1088#1072#1085#1077#1085#1080#1077' '#1089#1084#1077#1090#1099' '#1055#1045#1063#1040#1058#1068'-'#1057#1057#1056'-'#1056#1040#1057#1063#1045#1058' '#1057#1058#1054#1048#1052#1054#1057#1058#1048
        Checked = True
        State = cbChecked
        TabOrder = 7
      end
      object chkFindAutoRepInAllRate: TCheckBox
        Left = 3
        Top = 216
        Width = 494
        Height = 17
        Caption = #1048#1089#1082#1072#1090#1100' '#1072#1074#1090#1086#1079#1072#1084#1077#1085#1091' '#1087#1086' '#1074#1089#1077#1084' '#1088#1072#1089#1094#1077#1085#1082#1072#1084' '#1089#1084#1077#1090#1099
        TabOrder = 8
      end
      object dblkcbbOXROPR: TDBLookupComboBox
        Left = 285
        Top = 238
        Width = 336
        Height = 21
        Margins.Left = 0
        Margins.Top = 2
        Margins.Bottom = 2
        Align = alCustom
        DataField = 'def_work_id'
        DataSource = dsMainData
        DropDownRows = 10
        KeyField = 'work_id'
        ListField = 'NameWork'
        ListSource = dsOXROPR
        TabOrder = 9
      end
      object chkAddRateType1ToLocal: TCheckBox
        Left = 3
        Top = 264
        Width = 279
        Height = 17
        Caption = #1056#1072#1079#1088#1077#1096#1080#1090#1100' '#1076#1086#1073#1072#1074#1083#1103#1090#1100' '#1087#1091#1089#1082#1086#1085#1072#1083#1072#1076#1082#1091' '#1074' '#1083#1086#1082#1072#1083#1100#1085#1099#1077
        TabOrder = 10
      end
      object chkAddRateType0ToPNR: TCheckBox
        Left = 3
        Top = 287
        Width = 279
        Height = 17
        Caption = #1056#1072#1079#1088#1077#1096#1080#1090#1100' '#1076#1086#1073#1072#1074#1083#1103#1090#1100' '#1088#1072#1089#1094#1077#1085#1082#1080' '#1074' '#1055#1053#1056
        TabOrder = 11
      end
    end
  end
  object ButtonCancel: TButton
    Left = 540
    Top = 373
    Width = 100
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 2
    OnClick = ButtonCancelClick
  end
  object ButtonSave: TButton
    Left = 434
    Top = 373
    Width = 100
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    Default = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = ButtonSaveClick
  end
  object ColorDialog: TColorDialog
    Options = [cdFullOpen]
    Left = 592
    Top = 192
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
    Left = 592
    Top = 248
  end
  object dsOXROPR: TDataSource
    DataSet = qrOXROPR
    Left = 592
    Top = 304
  end
  object qrMainData: TFDQuery
    Connection = DM.Connect
    Transaction = DM.Read
    UpdateTransaction = DM.Write
    FetchOptions.AssignedValues = [evRowsetSize, evCache, evRecordCountMode, evAutoFetchAll]
    FetchOptions.RowsetSize = 500
    FetchOptions.RecordCountMode = cmTotal
    FetchOptions.Cache = [fiBlobs, fiMeta]
    FormatOptions.AssignedValues = [fvMapRules, fvDefaultParamDataType, fvFmtDisplayNumeric]
    FormatOptions.OwnMapRules = True
    FormatOptions.MapRules = <
      item
        SourceDataType = dtMemo
        TargetDataType = dtAnsiString
      end
      item
        SourceDataType = dtFmtBCD
        TargetDataType = dtDouble
      end>
    FormatOptions.DefaultParamDataType = ftBCD
    FormatOptions.FmtDisplayNumeric = '### ### ### ### ### ### ##0.########'
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate, uvUpdateChngFields, uvCheckReadOnly, uvCheckUpdatable]
    UpdateOptions.EnableDelete = False
    UpdateOptions.UpdateTableName = 'smeta.round_setup'
    SQL.Strings = (
      'SELECT * FROM round_setup')
    Left = 595
    Top = 32
  end
  object dsMainData: TDataSource
    DataSet = qrMainData
    Left = 595
    Top = 86
  end
  object dlgFont1: TFontDialog
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    MinFontSize = 16
    MaxFontSize = 6
    Options = []
    Left = 591
    Top = 139
  end
end
