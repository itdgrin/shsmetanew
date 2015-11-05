object FormOXRandOPR: TFormOXRandOPR
  Left = 0
  Top = 0
  Caption = #1054#1061#1056' '#1080' '#1054#1055#1056
  ClientHeight = 368
  ClientWidth = 693
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
  object PanelMenu: TPanel
    Left = 0
    Top = 0
    Width = 693
    Height = 25
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Panel1: TPanel
      Left = 0
      Top = 0
      Width = 693
      Height = 25
      Align = alTop
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 0
      OnResize = Panel1Resize
      object Label1: TLabel
        Left = 217
        Top = 6
        Width = 56
        Height = 13
        Caption = #1042#1080#1076' '#1088#1072#1073#1086#1090':'
      end
      object LabelResolution: TLabel
        Left = 495
        Top = 6
        Width = 82
        Height = 13
        Caption = #1055#1086#1089#1090#1072#1085#1086#1074#1083#1077#1085#1080#1077':'
      end
      object BevelLine: TBevel
        Left = 211
        Top = 3
        Width = 9
        Height = 19
        Shape = bsLeftLine
      end
      object RadioButtonMinsk: TRadioButton
        Left = 135
        Top = 4
        Width = 75
        Height = 17
        Caption = '3. '#1075'. '#1052#1080#1085#1089#1082
        TabOrder = 4
        OnClick = SelectRegion
      end
      object RadioButtonCity: TRadioButton
        Left = 8
        Top = 4
        Width = 60
        Height = 17
        Caption = '1. '#1043#1086#1088#1086#1076
        Checked = True
        TabOrder = 2
        TabStop = True
        OnClick = SelectRegion
      end
      object RadioButtonVillage: TRadioButton
        Left = 74
        Top = 4
        Width = 55
        Height = 17
        Caption = '2. '#1057#1077#1083#1086
        TabOrder = 3
        OnClick = SelectRegion
      end
      object ComboBoxResolution: TComboBox
        Left = 583
        Top = 2
        Width = 107
        Height = 21
        Style = csDropDownList
        TabOrder = 1
      end
      object DBLookupComboBoxTypeConstruction: TDBLookupComboBox
        Left = 279
        Top = 2
        Width = 210
        Height = 21
        TabOrder = 0
        OnClick = DBLookupComboBoxTypeConstructionClick
      end
    end
  end
  object DBGrid: TDBGrid
    Left = 0
    Top = 25
    Width = 693
    Height = 298
    Align = alClient
    DataSource = DataSourceTable
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ParentFont = False
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Id'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'IdStroj'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'IdOrder'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Number'
        Title.Caption = #1050#1086#1076
        Width = 45
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NameWork'
        Title.Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1088#1072#1073#1086#1090#1099
        Width = 117
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'P1'
        Title.Caption = '% '#1085#1072#1082#1083#1072#1076#1085#1099#1093
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'P2'
        Title.Caption = '% '#1087#1083#1072#1085#1086#1074#1099#1093
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'P3'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'P4'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'DataBegin'
        Title.Caption = #1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1072
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'DataBegin'
        Title.Caption = #1044#1072#1090#1072' '#1086#1082#1086#1085#1095#1072#1085#1080#1103
        Visible = False
      end>
  end
  object Memo: TMemo
    Left = 0
    Top = 323
    Width = 693
    Height = 45
    Align = alBottom
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 2
  end
  object DataSourceTable: TDataSource
    DataSet = ADOQueryTable
    Left = 120
    Top = 136
  end
  object DataSourceTypeConstruction: TDataSource
    DataSet = ADOQueryTypeConstruction
    Left = 208
    Top = 72
  end
  object ADOQueryTypeConstruction: TFDQuery
    Connection = DM.Connect
    Transaction = DM.Read
    UpdateTransaction = DM.Write
    Left = 32
    Top = 72
  end
  object ADOQueryTable: TFDQuery
    AfterScroll = ADOQueryTableAfterScroll
    Connection = DM.Connect
    Transaction = DM.Read
    UpdateTransaction = DM.Write
    Left = 32
    Top = 136
  end
  object ADOQueryTemp: TFDQuery
    Connection = DM.Connect
    Transaction = DM.Read
    UpdateTransaction = DM.Write
    Left = 32
    Top = 200
  end
end
