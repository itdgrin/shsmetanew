object fRoundSetup: TfRoundSetup
  Left = 0
  Top = 0
  Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080' '#1086#1082#1088#1091#1075#1083#1077#1085#1080#1081
  ClientHeight = 237
  ClientWidth = 253
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  DesignSize = (
    253
    237)
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 8
    Top = 8
    Width = 172
    Height = 13
    Caption = #1055#1088#1080' '#1088#1072#1089#1095#1077#1090#1077' '#1089#1090#1086#1080#1084#1086#1089#1090#1080' '#1088#1072#1089#1094#1077#1085#1082#1080':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lbl2: TLabel
    Left = 8
    Top = 40
    Width = 118
    Height = 13
    Caption = #1055#1088#1080' '#1088#1072#1089#1095#1077#1090#1077' '#1080#1085#1076#1077#1082#1089#1086#1074':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lbl5: TLabel
    Left = 8
    Top = 143
    Width = 178
    Height = 13
    Caption = #1055#1088#1080' '#1088#1072#1089#1095#1077#1090#1077' '#1082#1086#1083#1080#1095#1077#1089#1090#1074#1072' '#1088#1077#1089#1091#1088#1089#1086#1074':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lbl6: TLabel
    Left = 8
    Top = 170
    Width = 183
    Height = 13
    Caption = #1048#1085#1076#1077#1082#1089' '#1088#1086#1089#1090#1072' '#1086#1082#1088#1091#1075#1083#1103#1090#1100' '#1076#1086' '#1079#1085#1072#1082#1086#1074':'
  end
  object JvDBSpinEdit1: TJvDBSpinEdit
    Left = 192
    Top = 8
    Width = 47
    Height = 21
    MaxValue = 10.000000000000000000
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    DataField = 'round_RATE'
    DataSource = dsMainData
  end
  object JvDBSpinEdit2: TJvDBSpinEdit
    Left = 192
    Top = 35
    Width = 47
    Height = 21
    MaxValue = 10.000000000000000000
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    DataField = 'round_INDEX'
    DataSource = dsMainData
  end
  object grp1: TGroupBox
    Left = 8
    Top = 62
    Width = 237
    Height = 75
    Caption = #1055#1088#1080' '#1088#1072#1089#1095#1077#1090#1077' '#1053#1086#1088#1084' '#1054#1061#1056#1080#1054#1055#1056':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    object lbl3: TLabel
      Left = 7
      Top = 22
      Width = 63
      Height = 13
      Caption = #1076#1083#1103' '#1052#1080#1085#1089#1082#1072':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lbl4: TLabel
      Left = 7
      Top = 46
      Width = 62
      Height = 13
      Caption = #1076#1083#1103' '#1087#1088#1086#1095#1080#1093':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object JvDBSpinEdit3: TJvDBSpinEdit
      Left = 184
      Top = 19
      Width = 47
      Height = 21
      MaxValue = 10.000000000000000000
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      DataField = 'round_OXROPR_M'
      DataSource = dsMainData
    end
    object JvDBSpinEdit4: TJvDBSpinEdit
      Left = 184
      Top = 46
      Width = 47
      Height = 21
      MaxValue = 10.000000000000000000
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      DataField = 'round_OXROPR'
      DataSource = dsMainData
    end
  end
  object JvDBSpinEdit5: TJvDBSpinEdit
    Left = 192
    Top = 143
    Width = 47
    Height = 21
    MaxValue = 10.000000000000000000
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    DataField = 'round_CNT_RESOURCES'
    DataSource = dsMainData
  end
  object btn1: TBitBtn
    Left = 170
    Top = 204
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #1054#1090#1084#1077#1085#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    OnClick = btn1Click
  end
  object btn2: TBitBtn
    Left = 89
    Top = 204
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    OnClick = btn2Click
  end
  object JvDBSpinEdit6: TJvDBSpinEdit
    Left = 192
    Top = 170
    Width = 47
    Height = 21
    MaxValue = 10.000000000000000000
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    DataField = 'round_GROW_INDEX'
    DataSource = dsMainData
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
    Left = 99
    Top = 32
  end
  object dsMainData: TDataSource
    DataSet = qrMainData
    Left = 99
    Top = 78
  end
end
