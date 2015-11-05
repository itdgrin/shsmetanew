object fCardAct: TfCardAct
  Left = 0
  Top = 0
  BiDiMode = bdLeftToRight
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1050#1072#1088#1090#1086#1095#1082#1072' '#1072#1082#1090#1072
  ClientHeight = 167
  ClientWidth = 392
  Color = clBtnFace
  DoubleBuffered = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  ParentBiDiMode = False
  ShowHint = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  DesignSize = (
    392
    167)
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel: TBevel
    Left = 0
    Top = 126
    Width = 392
    Height = 41
    Align = alBottom
    Shape = bsTopLine
    ExplicitTop = 106
  end
  object ButtonSave: TButton
    Left = 178
    Top = 134
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
    TabOrder = 4
    OnClick = ButtonSaveClick
  end
  object ButtonClose: TButton
    Left = 284
    Top = 134
    Width = 100
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 5
    OnClick = ButtonCloseClick
  end
  object PanelDate: TPanel
    Left = 0
    Top = 0
    Width = 392
    Height = 25
    Align = alTop
    BevelOuter = bvNone
    Caption = 'PanelDate'
    ShowCaption = False
    TabOrder = 0
    object LabelDate: TLabel
      Left = 6
      Top = 5
      Width = 97
      Height = 13
      Caption = #1044#1072#1090#1072' '#1089#1086#1089#1090#1072#1074#1083#1077#1085#1080#1103':'
    end
    object lbl2: TLabel
      Left = 212
      Top = 6
      Width = 22
      Height = 13
      Caption = #1058#1080#1087':'
    end
    object edDate: TJvDBDateEdit
      Left = 109
      Top = 3
      Width = 97
      Height = 21
      DataField = 'DATE'
      DataSource = dsAct
      CheckOnExit = True
      ShowNullDate = False
      TabOrder = 0
      OnChange = edDateChange
    end
    object cbbType: TComboBox
      Left = 240
      Top = 3
      Width = 144
      Height = 21
      Style = csDropDownList
      ItemIndex = 0
      TabOrder = 1
      Text = #1087#1086' '#1089#1084#1077#1090#1077
      Items.Strings = (
        #1087#1086' '#1089#1084#1077#1090#1077
        #1076#1086#1087'. '#1088#1072#1073#1086#1090#1099
        #1080#1090#1086#1075#1086#1074#1099#1084#1080' '#1089#1091#1084#1084#1072#1084#1080)
    end
  end
  object PanelDescription: TPanel
    Left = 0
    Top = 50
    Width = 392
    Height = 50
    Align = alTop
    BevelOuter = bvNone
    Caption = 'PanelDescription'
    ShowCaption = False
    TabOrder = 2
    object LabelDescription: TLabel
      Left = 6
      Top = 16
      Width = 53
      Height = 13
      Caption = #1054#1087#1080#1089#1072#1085#1080#1077':'
    end
    object dbmmoDESCRIPTION: TDBMemo
      Left = 65
      Top = 4
      Width = 319
      Height = 45
      DataField = 'DESCRIPTION'
      DataSource = dsAct
      TabOrder = 0
    end
  end
  object PanelName: TPanel
    Left = 0
    Top = 25
    Width = 392
    Height = 25
    Align = alTop
    BevelOuter = bvNone
    Caption = 'PanelName'
    ShowCaption = False
    TabOrder = 1
    object LabelName: TLabel
      Left = 7
      Top = 5
      Width = 52
      Height = 13
      Caption = #1053#1072#1079#1074#1072#1085#1080#1077':'
    end
    object dbedtNAME: TDBEdit
      Left = 65
      Top = 2
      Width = 319
      Height = 21
      DataField = 'NAME'
      DataSource = dsAct
      TabOrder = 0
      OnChange = dbedtNAMEChange
    end
  end
  object pnl1: TPanel
    Left = 0
    Top = 100
    Width = 392
    Height = 25
    Align = alTop
    BevelOuter = bvNone
    Caption = 'PanelName'
    ShowCaption = False
    TabOrder = 3
    object lbl1: TLabel
      Left = 7
      Top = 5
      Width = 41
      Height = 13
      Caption = #1055#1088#1086#1088#1072#1073':'
    end
    object btn1: TSpeedButton
      Left = 361
      Top = 2
      Width = 23
      Height = 21
      Hint = #1042#1099#1073#1086#1088' '#1087#1088#1086#1088#1072#1073#1072' '#1080#1079' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072
      Caption = '...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = btn1Click
    end
    object dbedtNAME1: TDBEdit
      Left = 65
      Top = 2
      Width = 290
      Height = 21
      DataField = 'FOREMAN_'
      DataSource = dsAct
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      OnChange = dbedtNAMEChange
    end
  end
  object qrTemp: TFDQuery
    Connection = DM.Connect
    Transaction = DM.Read
    UpdateTransaction = DM.Write
    FormatOptions.AssignedValues = [fvDefaultParamDataType]
    FormatOptions.DefaultParamDataType = ftBCD
    Left = 20
    Top = 32
  end
  object qrAct: TFDQuery
    Connection = DM.Connect
    Transaction = DM.Read
    UpdateTransaction = DM.Write
    FormatOptions.AssignedValues = [fvMapRules]
    FormatOptions.OwnMapRules = True
    FormatOptions.MapRules = <
      item
        SourceDataType = dtMemo
        TargetDataType = dtAnsiString
      end>
    UpdateOptions.AssignedValues = [uvEDelete, uvUpdateChngFields, uvRefreshMode, uvCheckReadOnly, uvCheckUpdatable, uvUpdateNonBaseFields]
    UpdateOptions.RefreshMode = rmAll
    UpdateOptions.CheckReadOnly = False
    UpdateOptions.CheckUpdatable = False
    UpdateOptions.UpdateTableName = 'smeta.smetasourcedata'
    UpdateOptions.KeyFields = 'ID'
    SQL.Strings = (
      'select smetasourcedata.*, '
      
        'CONCAT(IFNULL(foreman_first_name, ""), " ", IFNULL(foreman_name,' +
        ' ""), " ", IFNULL(foreman_second_name, "")) AS FOREMAN_'
      'from smetasourcedata'
      
        'LEFT JOIN foreman ON smetasourcedata.foreman_id=foreman.foreman_' +
        'id'
      'where SM_ID=:id')
    Left = 212
    Top = 48
    ParamData = <
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object dsAct: TDataSource
    DataSet = qrAct
    Left = 256
    Top = 40
  end
  object qrMain: TFDQuery
    Connection = DM.Connect
    Transaction = DM.Read
    UpdateTransaction = DM.Write
    FormatOptions.AssignedValues = [fvFmtDisplayNumeric]
    FormatOptions.FmtDisplayNumeric = '#0.00'
    UpdateOptions.UpdateTableName = 'smeta.smetasourcedata'
    SQL.Strings = (
      'SELECT * '
      'FROM smetasourcedata'
      'WHERE SM_ID=:SM_ID')
    Left = 73
    Top = 43
    ParamData = <
      item
        Name = 'SM_ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
end
