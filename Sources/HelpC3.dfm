object FormHelpC3: TFormHelpC3
  Left = 0
  Top = 0
  Caption = #1057#1087#1088#1072#1074#1082#1072' '#1057'-3'
  ClientHeight = 347
  ClientWidth = 649
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
  object PanelMenu: TPanel
    Left = 0
    Top = 0
    Width = 649
    Height = 50
    Align = alTop
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 0
    object PanelMenu1: TPanel
      Left = 0
      Top = 0
      Width = 649
      Height = 25
      Align = alTop
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 0
      DesignSize = (
        649
        25)
      object LabelObject: TLabel
        Left = 8
        Top = 6
        Width = 43
        Height = 13
        Caption = #1054#1073#1098#1077#1082#1090':'
      end
      object Label1: TLabel
        Left = 513
        Top = 6
        Width = 42
        Height = 13
        Anchors = [akTop, akRight]
        Caption = #1055#1077#1088#1080#1086#1076':'
      end
      object EditObject: TEdit
        Left = 57
        Top = 2
        Width = 450
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
      end
      object DateTimePicker1: TDateTimePicker
        Left = 561
        Top = 2
        Width = 85
        Height = 21
        Anchors = [akTop, akRight]
        Date = 41534.009584780090000000
        Time = 41534.009584780090000000
        TabOrder = 1
      end
    end
    object Panel1: TPanel
      Left = 0
      Top = 25
      Width = 649
      Height = 25
      Align = alTop
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 1
      DesignSize = (
        649
        25)
      object CheckBox1: TCheckBox
        Left = 8
        Top = 6
        Width = 80
        Height = 17
        Caption = #1055#1086' '#1089#1090#1088#1086#1081#1082#1077
        TabOrder = 2
      end
      object CheckBox2: TCheckBox
        Left = 94
        Top = 6
        Width = 100
        Height = 17
        Caption = #1055#1086' '#1082#1072#1090#1077#1075#1086#1088#1080#1103#1084
        TabOrder = 3
      end
      object RadioButton1: TRadioButton
        Tag = 1
        Left = 544
        Top = 4
        Width = 100
        Height = 17
        Anchors = [akTop, akRight]
        Caption = #1057#1090#1088#1086#1082#1080' '#1089#1087#1088#1072#1074#1082#1080
        TabOrder = 1
      end
      object RadioButton2: TRadioButton
        Left = 463
        Top = 4
        Width = 75
        Height = 17
        Anchors = [akTop, akRight]
        Caption = #1042#1089#1077' '#1089#1090#1088#1086#1082#1080
        Checked = True
        TabOrder = 0
        TabStop = True
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 320
    Width = 649
    Height = 27
    Align = alBottom
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 2
    object Button1: TButton
      Left = 3
      Top = 1
      Width = 120
      Height = 25
      Caption = #1056#1077#1082#1074#1080#1079#1080#1090#1099
      TabOrder = 0
      OnClick = Button1Click
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 50
    Width = 649
    Height = 270
    Align = alClient
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
end
