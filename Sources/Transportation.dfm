object FormTransportation: TFormTransportation
  Left = 195
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1055#1077#1088#1077#1074#1086#1079#1082#1072' '#1075#1088#1091#1079#1086#1074
  ClientHeight = 378
  ClientWidth = 445
  Color = clBtnFace
  DoubleBuffered = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnShow = FormShow
  DesignSize = (
    445
    378)
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 0
    Top = 342
    Width = 445
    Height = 36
    Align = alBottom
    Shape = bsTopLine
    ExplicitTop = 411
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 445
    Height = 25
    Align = alTop
    BevelOuter = bvNone
    ParentBackground = False
    ShowCaption = False
    TabOrder = 0
    DesignSize = (
      445
      25)
    object LabelJustification: TLabel
      Left = 8
      Top = 7
      Width = 71
      Height = 13
      Caption = #1054#1073#1086#1089#1085#1086#1074#1072#1085#1080#1077':'
    end
    object EditJustificationNumber: TEdit
      Left = 85
      Top = 4
      Width = 69
      Height = 21
      TabStop = False
      Color = 14802912
      ReadOnly = True
      TabOrder = 0
    end
    object EditJustification: TEdit
      Left = 160
      Top = 4
      Width = 282
      Height = 21
      TabStop = False
      Anchors = [akLeft, akTop, akRight]
      Color = 14802912
      ReadOnly = True
      TabOrder = 1
    end
  end
  object ButtonCancel: TButton
    Left = 334
    Top = 348
    Width = 101
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 4
    OnClick = ButtonCancelClick
  end
  object Panel2: TPanel
    Left = 0
    Top = 25
    Width = 445
    Height = 312
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
    TabStop = True
    DesignSize = (
      445
      312)
    object Label7: TLabel
      Left = 14
      Top = 292
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
      ExplicitTop = 334
    end
    object Label9: TLabel
      Left = 80
      Top = 292
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
    end
    object Label8: TLabel
      Left = 272
      Top = 293
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
      ExplicitTop = 335
    end
    object edtPriceNoNDS: TEdit
      Left = 157
      Top = 289
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
    object edtPriceNDS: TEdit
      Left = 334
      Top = 290
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
      TabOrder = 4
      Text = '0'
    end
    object grbGruz: TGroupBox
      Left = 0
      Top = 0
      Width = 445
      Height = 102
      Align = alTop
      Caption = '  '#1043#1088#1091#1079'  '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object Label6: TLabel
        Left = 14
        Top = 47
        Width = 45
        Height = 13
        Caption = #1045#1076'. '#1080#1079#1084'.:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label1: TLabel
        Left = 15
        Top = 74
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
      object LabelMass: TLabel
        Left = 208
        Top = 47
        Width = 110
        Height = 13
        Caption = #1059#1076#1077#1083#1100#1085#1099#1081' '#1074#1077#1089', '#1082#1075'/'#1084'3:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label2: TLabel
        Left = 14
        Top = 20
        Width = 33
        Height = 13
        Caption = #1050#1083#1072#1089#1089':'
      end
      object LabelDistance: TLabel
        Left = 208
        Top = 74
        Width = 76
        Height = 13
        Caption = #1056#1072#1089#1090#1086#1103#1085#1080#1077', '#1082#1084':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object cmbUnit: TComboBox
        Left = 102
        Top = 44
        Width = 83
        Height = 21
        Style = csDropDownList
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ItemIndex = 0
        ParentFont = False
        TabOrder = 1
        Text = #1090
        OnChange = cmbUnitChange
        Items.Strings = (
          #1090
          #1084'3')
      end
      object edtCount: TEdit
        Left = 102
        Top = 71
        Width = 83
        Height = 21
        Alignment = taRightJustify
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        OnChange = edtCountChange
        OnExit = EditExit
        OnKeyPress = EditKeyPress
      end
      object edtYDW: TEdit
        Left = 352
        Top = 44
        Width = 83
        Height = 21
        Alignment = taRightJustify
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        OnChange = edtCountChange
        OnExit = EditExit
        OnKeyPress = EditKeyPress
      end
      object cmbClass: TComboBox
        Left = 102
        Top = 17
        Width = 83
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
        Text = 'I'
        OnChange = EditDistanceChange
        Items.Strings = (
          'I'
          'II'
          'III'
          'IV')
      end
      object EditDistance: TEdit
        Left = 352
        Top = 71
        Width = 83
        Height = 21
        Alignment = taRightJustify
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        NumbersOnly = True
        ParentFont = False
        TabOrder = 4
        OnChange = EditDistanceChange
        OnExit = EditExit
      end
    end
    object grbKoef: TGroupBox
      Left = 0
      Top = 102
      Width = 445
      Height = 55
      Align = alTop
      Caption = 
        ' '#1053#1072#1076#1073#1072#1074#1082#1080' '#1079#1072' '#1087#1077#1088#1077#1074#1086#1079#1082#1091' '#1075#1088#1091#1079#1086#1074' '#1074' '#1089#1087#1077#1094#1080#1072#1083#1080#1079#1080#1088#1086#1074#1072#1085#1085#1086#1084' '#1087#1086#1076#1074#1080#1078#1085#1086#1084' '#1089#1086#1089 +
        #1090#1072#1074#1077'  '
      TabOrder = 1
      object cmbKoef: TComboBox
        Left = 29
        Top = 15
        Width = 414
        Height = 36
        Align = alClient
        Style = csOwnerDrawVariable
        Enabled = False
        ItemHeight = 30
        TabOrder = 1
        OnChange = cmbKoefChange
        OnDrawItem = cmbKoefDrawItem
        OnMeasureItem = cmbKoefMeasureItem
        Items.Strings = (
          'xvxv cx vfdsfvvvsddfdsfsdd fsdfddfd vcxv cvxcvxcvxc'
          'cxv cvcxvcxvxcvcvcx cvcxvcxv vcxvxv vxvxcv cxvxccvxcv ccxv'
          'sdfsdfsdfsdfsdd '
          
            'dsfsdfdsfsdfdsfdsfsddfdsfsdd fsdfddfdsfdsfdsfdsfdsfsd sfsdfsddf ' +
            'fdsdfs dsfsddfdsfsdd dsfsddfdsfsdd dsfsddfdsfsdd dsfsddfdsfsdd d' +
            'sfsddfdsfsdd dsfsddfdsfsdd dsfsddfdsfsdd'
          'fsfsdfsdfsdf '
          'gfgdfgdff gdffgdfg fgdffgdfgdfg fdgdfgdffgdf '
          'ertertert tertert ertertretert rtertert')
      end
      object Panel3: TPanel
        Left = 2
        Top = 15
        Width = 27
        Height = 38
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 0
        object cbKoef: TCheckBox
          Left = 7
          Top = -1
          Width = 13
          Height = 17
          TabOrder = 0
          OnClick = cbKoefClick
        end
      end
    end
    object grdPrice: TJvStringGrid
      Left = 0
      Top = 157
      Width = 445
      Height = 124
      Align = alTop
      ColCount = 6
      DefaultRowHeight = 17
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine]
      ParentFont = False
      TabOrder = 2
      OnKeyPress = grdPriceKeyPress
      OnSelectCell = grdPriceSelectCell
      Alignment = taLeftJustify
      FixedFont.Charset = DEFAULT_CHARSET
      FixedFont.Color = clWindowText
      FixedFont.Height = -11
      FixedFont.Name = 'Tahoma'
      FixedFont.Style = []
      OnExitCell = grdPriceExitCell
      OnSetCanvasProperties = grdPriceSetCanvasProperties
      OnGetCellAlignment = grdPriceGetCellAlignment
    end
  end
  object PanelBottom: TPanel
    Left = 0
    Top = 337
    Width = 445
    Height = 5
    Align = alBottom
    BevelOuter = bvNone
    ShowCaption = False
    TabOrder = 2
  end
  object ButtonAdd: TButton
    Left = 214
    Top = 348
    Width = 114
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100
    Default = True
    TabOrder = 3
    OnClick = ButtonAddClick
  end
  object qrTemp: TFDQuery
    Connection = DM.Connect
    Transaction = DM.Read
    UpdateTransaction = DM.Write
    Left = 81
    Top = 185
  end
end
