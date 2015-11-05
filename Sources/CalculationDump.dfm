object FormCalculationDump: TFormCalculationDump
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1056#1072#1089#1095#1105#1090' '#1089#1074#1072#1083#1082#1080
  ClientHeight = 245
  ClientWidth = 524
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  DesignSize = (
    524
    245)
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 0
    Top = 209
    Width = 524
    Height = 36
    Align = alBottom
    Shape = bsTopLine
    ExplicitTop = 210
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 524
    Height = 25
    Align = alTop
    BevelOuter = bvNone
    ParentBackground = False
    ShowCaption = False
    TabOrder = 0
    DesignSize = (
      524
      25)
    object LabelJustification: TLabel
      Left = 8
      Top = 6
      Width = 71
      Height = 13
      Caption = #1054#1073#1086#1089#1085#1086#1074#1072#1085#1080#1077':'
    end
    object EditJustificationNumber: TEdit
      Left = 85
      Top = 2
      Width = 80
      Height = 21
      TabStop = False
      Color = 14802912
      TabOrder = 0
      Text = #1041#1057'999-9901'
    end
    object EditJustification: TEdit
      Left = 171
      Top = 2
      Width = 350
      Height = 21
      TabStop = False
      Anchors = [akLeft, akTop, akRight]
      Color = 14802912
      TabOrder = 1
      Text = #1055#1083#1072#1090#1072' '#1079#1072' '#1087#1088#1080#1105#1084' '#1080' '#1079#1072#1093#1086#1088#1086#1085#1077#1085#1080#1077' '#1086#1090#1093#1086#1076#1086#1074' ('#1089#1090#1088#1086#1080#1090#1077#1083#1100#1085#1086#1075#1086' '#1084#1091#1089#1086#1088#1072')'
    end
  end
  object PanelMemo: TPanel
    Left = 0
    Top = 166
    Width = 524
    Height = 43
    Align = alBottom
    BevelOuter = bvNone
    ParentBackground = False
    ShowCaption = False
    TabOrder = 3
    object Memo: TMemo
      Left = 0
      Top = 0
      Width = 524
      Height = 43
      Align = alClient
      Lines.Strings = (
        'Memo')
      TabOrder = 0
    end
  end
  object ButtonCancel: TButton
    Left = 416
    Top = 215
    Width = 101
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #1054#1090#1084#1077#1085#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    OnClick = ButtonCancelClick
  end
  object ButtonSave: TButton
    Left = 296
    Top = 215
    Width = 114
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100
    Default = True
    TabOrder = 4
    OnClick = ButtonSaveClick
  end
  object Panel2: TPanel
    Left = 0
    Top = 25
    Width = 524
    Height = 24
    Align = alTop
    BevelOuter = bvNone
    ParentBackground = False
    ShowCaption = False
    TabOrder = 1
    TabStop = True
    DesignSize = (
      524
      24)
    object LabelND: TLabel
      Left = 8
      Top = 6
      Width = 90
      Height = 13
      Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1089#1074#1072#1083#1082#1080':'
    end
    object cmbND: TDBLookupComboBox
      Left = 104
      Top = 2
      Width = 415
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ListSource = DataSourceND
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      OnClick = cmbNDClick
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 49
    Width = 524
    Height = 117
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
    TabOrder = 2
    TabStop = True
    DesignSize = (
      524
      117)
    object Label7: TLabel
      Left = 103
      Top = 96
      Width = 62
      Height = 13
      Anchors = [akLeft, akBottom]
      Caption = #1057#1090#1086#1080#1084#1086#1089#1090#1100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitTop = 106
    end
    object Label8: TLabel
      Left = 357
      Top = 96
      Width = 50
      Height = 13
      Anchors = [akLeft, akBottom]
      Caption = #1089' '#1053#1044#1057', '#1088':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitTop = 106
    end
    object Label9: TLabel
      Left = 171
      Top = 96
      Width = 64
      Height = 13
      Anchors = [akLeft, akBottom]
      Caption = #1073#1077#1079' '#1053#1044#1057', '#1088':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitTop = 106
    end
    object GroupBox1: TGroupBox
      Left = 0
      Top = 0
      Width = 524
      Height = 45
      Align = alTop
      Caption = '  '#1057#1074#1072#1083#1082#1072
      TabOrder = 0
      object Label1: TLabel
        Left = 11
        Top = 18
        Width = 45
        Height = 13
        Caption = #1045#1076'. '#1080#1079#1084'.:'
      end
      object Label2: TLabel
        Left = 114
        Top = 18
        Width = 60
        Height = 13
        Caption = #1062#1077#1085#1072' '#1079#1072' '#1077#1076'.'
      end
      object Label3: TLabel
        Left = 175
        Top = 18
        Width = 59
        Height = 13
        Caption = #1073#1077#1079' '#1053#1044#1057', '#1088':'
      end
      object Label4: TLabel
        Left = 342
        Top = 18
        Width = 47
        Height = 13
        Caption = #1089' '#1053#1044#1057', '#1088':'
      end
      object edtDumpUnit: TEdit
        Left = 63
        Top = 15
        Width = 42
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
      object edtCoastNDS: TEdit
        Left = 397
        Top = 15
        Width = 92
        Height = 21
        Alignment = taRightJustify
        NumbersOnly = True
        TabOrder = 2
        OnChange = edtCoastNDSChange
      end
      object edtCoastNoNDS: TEdit
        Left = 241
        Top = 15
        Width = 92
        Height = 21
        Alignment = taRightJustify
        NumbersOnly = True
        TabOrder = 1
        OnChange = edtCoastNoNDSChange
      end
    end
    object GroupBox2: TGroupBox
      Left = 0
      Top = 45
      Width = 524
      Height = 45
      Align = alTop
      Caption = '  '#1052#1091#1089#1086#1088'  '
      TabOrder = 1
      object Label6: TLabel
        Left = 11
        Top = 19
        Width = 45
        Height = 13
        Caption = #1045#1076'. '#1080#1079#1084'.:'
      end
      object LabelMass: TLabel
        Left = 279
        Top = 19
        Width = 110
        Height = 13
        Caption = #1059#1076#1077#1083#1100#1085#1099#1081' '#1074#1077#1089', '#1082#1075'/'#1084'3:'
      end
      object LabelCount: TLabel
        Left = 114
        Top = 19
        Width = 64
        Height = 13
        Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object cmbUnit: TComboBox
        Left = 63
        Top = 16
        Width = 42
        Height = 21
        Style = csDropDownList
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ItemIndex = 0
        ParentFont = False
        TabOrder = 0
        Text = #1090
        OnChange = cmbUnitChange
        Items.Strings = (
          #1090
          #1084'3')
      end
      object edtYDW: TEdit
        Left = 397
        Top = 16
        Width = 92
        Height = 21
        Alignment = taRightJustify
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        OnChange = edtYDWChange
        OnKeyPress = EditKeyPress
      end
      object edtCount: TEdit
        Left = 185
        Top = 16
        Width = 84
        Height = 21
        Alignment = taRightJustify
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnChange = edtCountChange
        OnKeyPress = EditKeyPress
      end
    end
    object edtPriceNoNDS: TEdit
      Left = 243
      Top = 93
      Width = 101
      Height = 21
      Alignment = taRightJustify
      Anchors = [akLeft, akBottom]
      Color = 16514748
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      NumbersOnly = True
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
      Text = '0'
    end
    object edtPriceNDS: TEdit
      Left = 416
      Top = 93
      Width = 101
      Height = 21
      Alignment = taRightJustify
      Anchors = [akLeft, akBottom]
      Color = 16514748
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      NumbersOnly = True
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
      Text = '0'
    end
  end
  object DataSourceND: TDataSource
    DataSet = ADOQueryND
    Left = 120
    Top = 344
  end
  object ADOQueryND: TFDQuery
    Connection = DM.Connect
    Transaction = DM.Read
    UpdateTransaction = DM.Write
    Left = 33
    Top = 344
  end
  object qrTemp: TFDQuery
    Connection = DM.Connect
    Transaction = DM.Read
    UpdateTransaction = DM.Write
    Left = 200
    Top = 344
  end
end
