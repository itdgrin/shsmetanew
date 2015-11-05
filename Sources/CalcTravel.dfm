object fCalcTravel: TfCalcTravel
  Left = 0
  Top = 0
  Caption = #1056#1072#1089#1095#1077#1090' '#1082#1086#1084#1072#1085#1076#1080#1088#1086#1074#1086#1095#1085#1099#1093
  ClientHeight = 354
  ClientWidth = 609
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Visible = True
  OnActivate = FormActivate
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  DesignSize = (
    609
    354)
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 8
    Top = 8
    Width = 65
    Height = 13
    Caption = #1054#1089#1085#1086#1074#1072#1085#1080#1077':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
  end
  object lbl4: TLabel
    Left = 8
    Top = 38
    Width = 48
    Height = 13
    Caption = #1057#1086#1089#1090#1072#1074#1080#1083
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object dbedtPREPARER: TDBEdit
    Left = 79
    Top = 35
    Width = 210
    Height = 21
    DataField = 'PREPARER'
    DataSource = fTravelList.dsTravel
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
  end
  object grCalc: TJvDBGrid
    Left = 8
    Top = 62
    Width = 593
    Height = 284
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = dsCalc
    DrawingStyle = gdsClassic
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ParentFont = False
    TabOrder = 6
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDrawColumnCell = grCalcDrawColumnCell
    OnKeyPress = grCalcKeyPress
    AutoAppend = False
    IniStorage = FormStorage
    AutoSizeColumns = True
    SelectColumnsDialogStrings.Caption = 'Select columns'
    SelectColumnsDialogStrings.OK = '&OK'
    SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
    EditControls = <>
    RowsHeight = 17
    TitleRowHeight = 17
    Columns = <
      item
        Expanded = False
        FieldName = 'NUMPP'
        Title.Alignment = taCenter
        Title.Caption = #8470' '#1087#1087
        Width = 39
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NAIMEN'
        Title.Alignment = taCenter
        Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1079#1072#1090#1088#1072#1090
        Width = 161
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CALC'
        Title.Alignment = taCenter
        Title.Caption = #1056#1072#1089#1095#1077#1090
        Width = 287
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TOTAL'
        Title.Alignment = taCenter
        Title.Caption = #1057#1090#1086#1080#1084#1086#1089#1090#1100
        Width = 98
        Visible = True
      end>
  end
  object dblkcbbAct: TDBLookupComboBox
    Left = 143
    Top = 8
    Width = 458
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DataField = 'SM_ID'
    DataSource = fTravelList.dsTravel
    KeyField = 'SM_ID'
    ListField = 'NAME'
    ListSource = dsActList
    TabOrder = 1
    OnClick = dblkcbbActClick
  end
  object cbbSource: TComboBox
    Left = 79
    Top = 8
    Width = 58
    Height = 21
    AutoCloseUp = True
    Style = csDropDownList
    ItemIndex = 0
    TabOrder = 0
    Text = #1072#1082#1090
    OnChange = cbbSourceChange
    Items.Strings = (
      #1072#1082#1090
      #1089#1084#1077#1090#1072)
  end
  object dbchkFL_Full_month: TDBCheckBox
    Left = 295
    Top = 35
    Width = 146
    Height = 17
    Caption = #1056#1072#1089#1095#1077#1090' '#1079#1072' '#1087#1086#1083#1085#1099#1081' '#1084#1077#1089#1103#1094
    DataField = 'FL_Full_month'
    DataSource = fTravelList.dsTravel
    TabOrder = 4
    ValueChecked = '1'
    ValueUnchecked = '0'
  end
  object dblkcbbSmeta: TDBLookupComboBox
    Left = 143
    Top = 8
    Width = 458
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DataField = 'SM_ID'
    DataSource = fTravelList.dsTravel
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    KeyField = 'SM_ID'
    ListField = 'NAME'
    ListSource = dsSmetaList
    ParentFont = False
    TabOrder = 2
    Visible = False
    OnClick = dblkcbbActClick
  end
  object chkEnableEditing: TCheckBox
    Left = 439
    Top = 35
    Width = 162
    Height = 17
    Anchors = [akTop, akRight]
    Caption = #1056#1072#1079#1088#1077#1096#1080#1090#1100' '#1088#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    OnClick = chkEnableEditingClick
  end
  object dsCalc: TDataSource
    DataSet = qrCalc
    Left = 36
    Top = 150
  end
  object qrCalc: TFDQuery
    BeforePost = qrCalcBeforePost
    AfterPost = qrCalcAfterPost
    Connection = DM.Connect
    Transaction = DM.Read
    UpdateTransaction = DM.Write
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    FormatOptions.AssignedValues = [fvMapRules, fvDefaultParamDataType, fvFmtDisplayNumeric, fvFmtEditNumeric]
    FormatOptions.OwnMapRules = True
    FormatOptions.MapRules = <
      item
        SourceDataType = dtMemo
        TargetDataType = dtAnsiString
      end
      item
        SourceDataType = dtByteString
        TargetDataType = dtAnsiString
      end
      item
        SourceDataType = dtBCD
        TargetDataType = dtDouble
      end
      item
        SourceDataType = dtBlob
        TargetDataType = dtAnsiString
      end>
    FormatOptions.DefaultParamDataType = ftBCD
    FormatOptions.FmtDisplayNumeric = '### ### ### ##0.###'
    FormatOptions.FmtEditNumeric = '############.###'
    UpdateOptions.AssignedValues = [uvUpdateChngFields, uvCheckReadOnly, uvCheckUpdatable]
    UpdateOptions.UpdateChangedFields = False
    UpdateOptions.CheckReadOnly = False
    UpdateOptions.CheckUpdatable = False
    SQL.Strings = (
      
        'CALL `CalcTravel`(:ID_ESTIMATE, :STOIM_KM, :KM, :SUTKI_KOMANDIR,' +
        ' :FLFullMonth, :HOUSING_KOMANDIR, :HOUR_IN_DAY, '
      
        '                  :COUNT_WORK_DAY_IN_MONTH, :CUNT_DAY_IN_MONTH, ' +
        ':NORMAT, :NORMATF, :SUTKI, :SUTKIF, :KVARTIR, :KVARTIRF,'
      '                  :PROEZD, :PROEZDF, :TOTAL, :TOTALF);')
    Left = 35
    Top = 94
    ParamData = <
      item
        Name = 'ID_ESTIMATE'
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'STOIM_KM'
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'KM'
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'SUTKI_KOMANDIR'
        ParamType = ptInput
      end
      item
        Name = 'FLFULLMONTH'
        ParamType = ptInput
      end
      item
        Name = 'HOUSING_KOMANDIR'
        ParamType = ptInput
      end
      item
        Name = 'HOUR_IN_DAY'
        ParamType = ptInput
      end
      item
        Name = 'COUNT_WORK_DAY_IN_MONTH'
        ParamType = ptInput
      end
      item
        Name = 'CUNT_DAY_IN_MONTH'
        ParamType = ptInput
      end
      item
        Name = 'NORMAT'
        DataType = ftFloat
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'NORMATF'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'SUTKI'
        DataType = ftFloat
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'SUTKIF'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'KVARTIR'
        DataType = ftFloat
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'KVARTIRF'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'PROEZD'
        DataType = ftFloat
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'PROEZDF'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'TOTAL'
        DataType = ftFloat
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'TOTALF'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
  end
  object qrActList: TFDQuery
    MasterSource = fTravelList.dsObject
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
    SQL.Strings = (
      'SELECT '
      '  `smetasourcedata`.`SM_ID`,'
      
        '  CONCAT(`smetasourcedata`.`SM_NUMBER`, '#39' '#39', `smetasourcedata`.`' +
        'NAME`) AS NAME'
      'FROM '
      '  `smetasourcedata`'
      'WHERE `OBJ_ID`=:OBJ_ID AND `SM_TYPE`=2 AND ACT=1;')
    Left = 233
    Top = 96
    ParamData = <
      item
        Name = 'OBJ_ID'
        DataType = ftString
        ParamType = ptInput
        Value = '0'
      end>
  end
  object dsActList: TDataSource
    DataSet = qrActList
    Left = 280
    Top = 96
  end
  object qrSmetaList: TFDQuery
    MasterSource = fTravelList.dsObject
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
    SQL.Strings = (
      'SELECT '
      '  `smetasourcedata`.`SM_ID`,'
      
        '  CONCAT(`smetasourcedata`.`SM_NUMBER`, '#39' '#39', `smetasourcedata`.`' +
        'NAME`) AS NAME'
      'FROM '
      '  `smetasourcedata`'
      'WHERE `OBJ_ID`=:OBJ_ID AND `SM_TYPE`<>3 AND ACT=0;')
    Left = 233
    Top = 152
    ParamData = <
      item
        Name = 'OBJ_ID'
        DataType = ftString
        ParamType = ptInput
        Value = '40'
      end>
  end
  object dsSmetaList: TDataSource
    DataSet = qrSmetaList
    Left = 280
    Top = 152
  end
  object FormStorage: TJvFormStorage
    AppStorage = FormMain.AppIni
    AppStoragePath = '%FORM_NAME%\'
    Options = []
    StoredValues = <>
    Left = 32
    Top = 224
  end
end
