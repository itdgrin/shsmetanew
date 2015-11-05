object FormWorkSchedule: TFormWorkSchedule
  Left = 0
  Top = 0
  Caption = #1043#1088#1072#1092#1080#1082' '#1087#1088#1086#1080#1079#1074#1086#1076#1089#1090#1074#1072' '#1088#1072#1073#1086#1090
  ClientHeight = 406
  ClientWidth = 695
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
    Width = 695
    Height = 50
    Align = alTop
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 0
    object PanelMenu1: TPanel
      Left = 0
      Top = 0
      Width = 695
      Height = 25
      Align = alTop
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 0
      DesignSize = (
        695
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
        Width = 635
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
      end
    end
    object PanelMenu2: TPanel
      Left = 0
      Top = 25
      Width = 695
      Height = 25
      Align = alTop
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 1
      object LabelDateBuilding: TLabel
        Left = 8
        Top = 6
        Width = 109
        Height = 13
        Caption = #1044#1072#1090#1072' '#1089#1090#1088#1086#1080#1090#1077#1083#1100#1089#1090#1074#1072':'
      end
      object LabelStart: TLabel
        Left = 123
        Top = 6
        Width = 36
        Height = 13
        Caption = #1085#1072#1095#1072#1083#1086
      end
      object LabelEnd: TLabel
        Left = 256
        Top = 6
        Width = 54
        Height = 13
        Caption = #1086#1082#1086#1085#1095#1072#1085#1080#1077
      end
      object DateTimePickerStart: TDateTimePicker
        Left = 165
        Top = 2
        Width = 85
        Height = 21
        Date = 41533.672293113430000000
        Time = 41533.672293113430000000
        TabOrder = 0
      end
      object DateTimePickerEnd: TDateTimePicker
        Left = 316
        Top = 2
        Width = 85
        Height = 21
        Date = 41533.672293113430000000
        Time = 41533.672293113430000000
        TabOrder = 1
      end
    end
  end
  object PanelBottom: TPanel
    Left = 0
    Top = 279
    Width = 695
    Height = 100
    Align = alBottom
    ParentBackground = False
    TabOrder = 2
    object Panel4: TPanel
      Left = 1
      Top = 74
      Width = 693
      Height = 25
      Align = alBottom
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 3
      object Label1: TLabel
        Left = 8
        Top = 6
        Width = 100
        Height = 13
        Caption = #1041#1072#1079#1086#1074#1072#1103' '#1089#1090#1086#1080#1084#1086#1089#1090#1100':'
      end
      object Label2: TLabel
        Left = 220
        Top = 6
        Width = 121
        Height = 13
        Caption = #1057#1090#1086#1080#1084#1086#1089#1090#1100' '#1084#1072#1090#1077#1088#1080#1072#1083#1086#1074':'
      end
      object Edit2: TEdit
        Left = 114
        Top = 2
        Width = 100
        Height = 21
        TabOrder = 0
      end
      object Edit3: TEdit
        Left = 347
        Top = 2
        Width = 100
        Height = 21
        TabOrder = 1
      end
    end
    object Panel2: TPanel
      Left = 1
      Top = 24
      Width = 693
      Height = 25
      Align = alBottom
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 1
      object Label6: TLabel
        Left = 8
        Top = 6
        Width = 105
        Height = 13
        Caption = #1056#1072#1073#1086#1090#1099' '#1055#1058#1052' '#1085#1072#1095#1072#1083#1086':'
      end
      object Label7: TLabel
        Left = 119
        Top = 6
        Width = 36
        Height = 13
        Caption = #1085#1072#1095#1072#1083#1086
      end
      object Label8: TLabel
        Left = 267
        Top = 6
        Width = 54
        Height = 13
        Caption = #1086#1082#1086#1085#1095#1072#1085#1080#1077
      end
      object Label9: TLabel
        Left = 433
        Top = 6
        Width = 59
        Height = 13
        Caption = #1082#1086#1083#1080#1095#1077#1089#1090#1074#1086
      end
      object Edit7: TEdit
        Left = 161
        Top = 2
        Width = 100
        Height = 21
        TabOrder = 0
      end
      object Edit8: TEdit
        Left = 327
        Top = 2
        Width = 100
        Height = 21
        TabOrder = 1
      end
      object Edit9: TEdit
        Left = 498
        Top = 2
        Width = 100
        Height = 21
        TabOrder = 2
      end
    end
    object Panel3: TPanel
      Left = 1
      Top = 49
      Width = 693
      Height = 25
      Align = alBottom
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 2
      object Label3: TLabel
        Left = 8
        Top = 6
        Width = 146
        Height = 13
        Caption = #1053#1086#1088#1084#1072#1090#1080#1074#1085#1072#1103' '#1090#1088#1091#1076#1086#1105#1084#1082#1086#1089#1090#1100':'
      end
      object Label4: TLabel
        Left = 266
        Top = 6
        Width = 42
        Height = 13
        Caption = #1088#1072#1073#1086#1095#1080#1093
      end
      object Label5: TLabel
        Left = 420
        Top = 6
        Width = 48
        Height = 13
        Caption = #1095#1077#1083'. '#1089#1084#1077#1085
      end
      object Edit4: TEdit
        Left = 160
        Top = 2
        Width = 100
        Height = 21
        TabOrder = 0
      end
      object Edit5: TEdit
        Left = 314
        Top = 2
        Width = 100
        Height = 21
        TabOrder = 1
      end
      object Edit6: TEdit
        Left = 474
        Top = 2
        Width = 100
        Height = 21
        TabOrder = 2
      end
    end
    object Panel1: TPanel
      Left = 1
      Top = -1
      Width = 693
      Height = 25
      Align = alBottom
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 0
      DesignSize = (
        693
        25)
      object Label10: TLabel
        Left = 8
        Top = 6
        Width = 71
        Height = 13
        Caption = #1054#1073#1086#1089#1085#1086#1074#1072#1085#1080#1077':'
      end
      object Label11: TLabel
        Left = 291
        Top = 6
        Width = 77
        Height = 13
        Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077':'
      end
      object Edit10: TEdit
        Left = 85
        Top = 2
        Width = 200
        Height = 21
        TabOrder = 0
      end
      object Edit11: TEdit
        Left = 374
        Top = 2
        Width = 317
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
      end
    end
  end
  object PanelBottomButtons: TPanel
    Left = 0
    Top = 379
    Width = 695
    Height = 27
    Align = alBottom
    ParentBackground = False
    TabOrder = 3
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 50
    Width = 695
    Height = 229
    Align = alClient
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
end
