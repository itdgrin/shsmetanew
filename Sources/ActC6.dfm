object FormActC6: TFormActC6
  Left = 0
  Top = 0
  Caption = #1040#1082#1090' '#1057'-6'
  ClientHeight = 432
  ClientWidth = 677
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object ImageSplitterBottom: TImage
    Left = 312
    Top = 106
    Width = 15
    Height = 5
    Cursor = crVSplit
  end
  object ImageSplitterTop: TImage
    Left = 320
    Top = 114
    Width = 15
    Height = 5
    Cursor = crVSplit
  end
  object SplitterBottom: TSplitter
    Left = 0
    Top = 334
    Width = 677
    Height = 5
    Cursor = crVSplit
    Align = alBottom
    ResizeStyle = rsUpdate
    ExplicitTop = 413
    ExplicitWidth = 702
  end
  object PanelMenu: TPanel
    Left = 0
    Top = 0
    Width = 677
    Height = 200
    Align = alTop
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 0
    object PanelMenu1: TPanel
      Left = 0
      Top = 0
      Width = 677
      Height = 25
      Align = alTop
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 0
      DesignSize = (
        677
        25)
      object LabelPeriod: TLabel
        Left = 542
        Top = 5
        Width = 42
        Height = 13
        Anchors = [akTop, akRight]
        Caption = #1055#1077#1088#1080#1086#1076':'
      end
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
        Width = 479
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
      end
      object DateTimePicker1: TDateTimePicker
        Left = 589
        Top = 2
        Width = 85
        Height = 21
        Anchors = [akTop, akRight]
        Date = 41533.600063831020000000
        Time = 41533.600063831020000000
        TabOrder = 1
      end
    end
    object PanelMenu2: TPanel
      Left = 0
      Top = 25
      Width = 677
      Height = 25
      Align = alTop
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 1
      object CheckBoxAddionalData: TCheckBox
        Left = 8
        Top = 4
        Width = 153
        Height = 17
        Hint = #1057#1082#1088#1099#1090#1100'/'#1087#1086#1082#1072#1079#1072#1090#1100' '#1087#1072#1085#1077#1083#1100' '#1076#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1099#1093' '#1076#1072#1085#1085#1099#1093
        Caption = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1099#1077' '#1076#1072#1085#1085#1099#1077
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = CheckBoxAddionalDataClick
      end
    end
    object PanelMenu8: TPanel
      Left = 0
      Top = 175
      Width = 677
      Height = 25
      Align = alTop
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 7
      object Label9: TLabel
        Left = 8
        Top = 6
        Width = 142
        Height = 13
        Caption = #1044#1086#1075#1086#1074#1086#1088#1072#1085#1103' ('#1082#1086#1085#1090#1088#1072#1082#1090#1085#1072#1103'):'
      end
      object Label10: TLabel
        Left = 262
        Top = 6
        Width = 50
        Height = 13
        Caption = #1041#1072#1079#1080#1089#1085#1072#1103':'
      end
      object Edit4: TEdit
        Left = 156
        Top = 2
        Width = 100
        Height = 21
        TabOrder = 0
      end
      object Edit5: TEdit
        Left = 318
        Top = 2
        Width = 100
        Height = 21
        TabOrder = 1
      end
    end
    object PanelMenu7: TPanel
      Left = 0
      Top = 150
      Width = 677
      Height = 25
      Align = alTop
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 6
      object Label8: TLabel
        Left = 8
        Top = 6
        Width = 266
        Height = 13
        Caption = #1062#1077#1085#1072' '#1085#1072' '#1076#1072#1090#1091' '#1079#1072#1082#1083#1102#1095#1077#1085#1080#1103' '#1076#1086#1075#1086#1074#1086#1088#1072', '#1090#1099#1089#1103#1095' '#1088#1091#1073#1083#1077#1081':'
      end
    end
    object PanelMenu6: TPanel
      Left = 0
      Top = 125
      Width = 677
      Height = 25
      Align = alTop
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 5
      object Label5: TLabel
        Left = 8
        Top = 6
        Width = 133
        Height = 13
        Caption = #1057#1088#1086#1082#1080' '#1074#1099#1087#1086#1083#1085#1077#1085#1080#1103' '#1088#1072#1073#1086#1090':'
      end
      object Label6: TLabel
        Left = 147
        Top = 6
        Width = 36
        Height = 13
        Caption = #1085#1072#1095#1072#1083#1086
      end
      object Label7: TLabel
        Left = 280
        Top = 6
        Width = 54
        Height = 13
        Caption = #1086#1082#1086#1085#1095#1072#1085#1080#1077
      end
      object DateTimePicker2: TDateTimePicker
        Left = 189
        Top = 2
        Width = 85
        Height = 21
        Date = 41533.600063831020000000
        Time = 41533.600063831020000000
        TabOrder = 0
      end
      object DateTimePicker3: TDateTimePicker
        Left = 340
        Top = 2
        Width = 85
        Height = 21
        Date = 41533.600063831020000000
        Time = 41533.600063831020000000
        TabOrder = 1
      end
    end
    object PanelMenu5: TPanel
      Left = 0
      Top = 100
      Width = 677
      Height = 25
      Align = alTop
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 4
      DesignSize = (
        677
        25)
      object Label4: TLabel
        Left = 8
        Top = 6
        Width = 107
        Height = 13
        Caption = #1044#1086#1087'. '#1089#1086#1075#1083#1072#1096#1077#1085#1080#1077' '#8470':'
      end
      object Edit3: TEdit
        Left = 121
        Top = 2
        Width = 553
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
      end
    end
    object PanelMenu4: TPanel
      Left = 0
      Top = 75
      Width = 677
      Height = 25
      Align = alTop
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 3
      DesignSize = (
        677
        25)
      object Label3: TLabel
        Left = 8
        Top = 6
        Width = 61
        Height = 13
        Caption = #1055#1086#1076#1088#1103#1076#1095#1080#1082':'
      end
      object Edit2: TEdit
        Left = 75
        Top = 2
        Width = 599
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
      end
    end
    object PanelMenu3: TPanel
      Left = 0
      Top = 50
      Width = 677
      Height = 25
      Align = alTop
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 2
      DesignSize = (
        677
        25)
      object Label1: TLabel
        Left = 18
        Top = 6
        Width = 51
        Height = 13
        Caption = #1047#1072#1082#1072#1079#1095#1080#1082':'
      end
      object Edit1: TEdit
        Left = 75
        Top = 2
        Width = 599
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
      end
    end
  end
  object PanelBottom: TPanel
    Left = 0
    Top = 339
    Width = 677
    Height = 93
    Align = alBottom
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 2
    object PanelBottomButtons: TPanel
      Left = 0
      Top = 66
      Width = 677
      Height = 27
      Align = alBottom
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 1
    end
    object DBGrid2: TDBGrid
      Left = 0
      Top = 0
      Width = 677
      Height = 66
      Align = alClient
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
  end
  object PanelTop: TPanel
    Left = 0
    Top = 200
    Width = 677
    Height = 134
    Align = alClient
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 1
    object DBGrid1: TDBGrid
      Left = 0
      Top = 0
      Width = 677
      Height = 134
      Align = alClient
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
  end
end
