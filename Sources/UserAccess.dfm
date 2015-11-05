object fUserAccess: TfUserAccess
  Left = 0
  Top = 0
  Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1072' '#1087#1088#1072#1074' '#1076#1086#1089#1090#1091#1087#1072
  ClientHeight = 334
  ClientWidth = 286
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
    286
    334)
  PixelsPerInch = 96
  TextHeight = 13
  object bvl2: TBevel
    Left = 8
    Top = 35
    Width = 270
    Height = 3
    Anchors = [akLeft, akTop, akRight]
    ExplicitWidth = 259
  end
  object bvl1: TBevel
    Left = 8
    Top = 67
    Width = 270
    Height = 3
    Anchors = [akLeft, akTop, akRight]
    ExplicitWidth = 259
  end
  object pnl1: TPanel
    Left = 0
    Top = 293
    Width = 286
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 6
    DesignSize = (
      286
      41)
    object btnCancel: TBitBtn
      Left = 203
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = #1054#1090#1084#1077#1085#1072
      TabOrder = 1
      OnClick = btnCancelClick
    end
    object btnSave: TBitBtn
      Left = 122
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      TabOrder = 0
      OnClick = btnSaveClick
    end
  end
  object rbAll: TRadioButton
    Left = 8
    Top = 44
    Width = 139
    Height = 17
    Caption = #1074#1089#1077#1084' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103#1084
    TabOrder = 2
    OnClick = rbFromListClick
  end
  object rbOnlyMe: TRadioButton
    Left = 8
    Top = 8
    Width = 73
    Height = 17
    Caption = #1074#1083#1072#1076#1077#1083#1077#1094
    TabOrder = 0
    OnClick = rbFromListClick
  end
  object grMain: TJvDBGrid
    Left = 8
    Top = 99
    Width = 270
    Height = 196
    Align = alCustom
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = dsMain
    Enabled = False
    Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleHotTrack]
    TabOrder = 5
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnCellClick = grMainCellClick
    AutoAppend = False
    ScrollBars = ssVertical
    AutoSizeColumns = True
    AutoSizeColumnIndex = 2
    SelectColumnsDialogStrings.Caption = 'Select columns'
    SelectColumnsDialogStrings.OK = '&OK'
    SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
    CanDelete = False
    EditControls = <>
    RowsHeight = 17
    TitleRowHeight = 17
    Columns = <
      item
        Expanded = False
        FieldName = 'CHECKED'
        Title.Alignment = taCenter
        Title.Caption = #1063#1090#1077#1085#1080#1077
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CHECKED_WRITE'
        Title.Alignment = taCenter
        Title.Caption = #1047#1072#1087#1080#1089#1100
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'USER_NAME'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #1048#1084#1103' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103
        Width = 163
        Visible = True
      end>
  end
  object chkAllowWrite: TCheckBox
    Left = 164
    Top = 44
    Width = 114
    Height = 17
    Anchors = [akTop, akRight]
    Caption = #1088#1072#1079#1088#1077#1096#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
    TabOrder = 3
  end
  object dblkcbb1: TDBLookupComboBox
    Left = 87
    Top = 8
    Width = 191
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    KeyField = 'USER_ID'
    ListField = 'USER_NAME'
    ListSource = dsUser
    TabOrder = 1
  end
  object rbFromList: TRadioButton
    Left = 8
    Top = 76
    Width = 259
    Height = 17
    Caption = #1074#1099#1073#1088#1072#1085#1085#1099#1084' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103#1084' '#1080#1079' '#1089#1087#1080#1089#1082#1072':'
    TabOrder = 4
    OnClick = rbFromListClick
  end
  object qrMain: TFDQuery
    BeforeOpen = qrMainBeforeOpen
    OnCalcFields = qrMainCalcFields
    CachedUpdates = True
    Connection = DM.Connect
    Transaction = DM.Read
    UpdateTransaction = DM.Write
    FetchOptions.AssignedValues = [evRowsetSize, evCache, evRecordCountMode, evAutoFetchAll]
    FetchOptions.RowsetSize = 500
    FetchOptions.RecordCountMode = cmTotal
    FormatOptions.AssignedValues = [fvMapRules, fvDefaultParamDataType, fvFmtDisplayNumeric]
    FormatOptions.OwnMapRules = True
    FormatOptions.MapRules = <
      item
        NameMask = 'SELECTED'
        TargetDataType = dtBoolean
      end
      item
        NameMask = 'SELECTED_WRITE'
        TargetDataType = dtBoolean
      end>
    FormatOptions.DefaultParamDataType = ftBCD
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate, uvUpdateChngFields, uvUpdateMode, uvLockMode, uvRefreshMode, uvCountUpdatedRecords, uvCheckRequired, uvCheckReadOnly, uvCheckUpdatable, uvUpdateNonBaseFields]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.UpdateChangedFields = False
    UpdateOptions.UpdateNonBaseFields = True
    UpdateOptions.RefreshMode = rmManual
    UpdateOptions.CountUpdatedRecords = False
    UpdateOptions.CheckRequired = False
    UpdateOptions.CheckReadOnly = False
    UpdateOptions.CheckUpdatable = False
    SQL.Strings = (
      'SELECT U.*, '
      
        'EXISTS(SELECT UA.USER_ID FROM user_access AS UA WHERE UA.USER_ID' +
        '=U.USER_ID AND UA.DOC_TYPE_ID=:DOC_TYPE_ID AND UA.MASTER_ID=:MAS' +
        'TER_ID) AS SELECTED,'
      
        'EXISTS(SELECT UA.USER_ID FROM user_access AS UA WHERE UA.USER_ID' +
        '=U.USER_ID AND UA.DOC_TYPE_ID=:DOC_TYPE_ID AND UA.MASTER_ID=:MAS' +
        'TER_ID AND UA.ACCESS_TYPE=2) AS SELECTED_WRITE'
      'FROM user AS U'
      'WHERE U.USER_ID <> :USER_ID'
      'ORDER BY U.USER_NAME')
    Left = 43
    Top = 120
    ParamData = <
      item
        Name = 'DOC_TYPE_ID'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'MASTER_ID'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'USER_ID'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object qrMainUSER_ID: TFDAutoIncField
      FieldName = 'USER_ID'
      Origin = 'USER_ID'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qrMainUSER_NAME: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'USER_NAME'
      Origin = 'USER_NAME'
      Size = 50
    end
    object qrMainSELECTED: TBooleanField
      AutoGenerateValue = arDefault
      FieldName = 'SELECTED'
      Origin = 'SELECTED'
    end
    object blnfldMainCHECKED: TBooleanField
      FieldKind = fkCalculated
      FieldName = 'CHECKED'
      OnChange = blnfldMainCHECKEDChange
      Calculated = True
    end
    object qrMainSELECTED_WRITE: TBooleanField
      AutoGenerateValue = arDefault
      FieldName = 'SELECTED_WRITE'
      Origin = 'SELECTED_WRITE'
    end
    object blnfldMainCHECKED_WRITE: TBooleanField
      FieldKind = fkCalculated
      FieldName = 'CHECKED_WRITE'
      OnChange = blnfldMainCHECKED_WRITEChange
      Calculated = True
    end
  end
  object dsMain: TDataSource
    DataSet = qrMain
    Left = 43
    Top = 168
  end
  object qrUser: TFDQuery
    BeforeOpen = qrMainBeforeOpen
    OnCalcFields = qrMainCalcFields
    CachedUpdates = True
    Connection = DM.Connect
    Transaction = DM.Read
    UpdateTransaction = DM.Write
    FetchOptions.AssignedValues = [evRowsetSize, evCache, evRecordCountMode, evAutoFetchAll]
    FetchOptions.RowsetSize = 500
    FetchOptions.RecordCountMode = cmTotal
    FormatOptions.AssignedValues = [fvMapRules, fvDefaultParamDataType, fvFmtDisplayNumeric]
    FormatOptions.OwnMapRules = True
    FormatOptions.MapRules = <
      item
        NameMask = 'SELECTED'
        TargetDataType = dtBoolean
      end
      item
        NameMask = 'SELECTED_WRITE'
        TargetDataType = dtBoolean
      end>
    FormatOptions.DefaultParamDataType = ftBCD
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate, uvUpdateChngFields, uvUpdateMode, uvLockMode, uvRefreshMode, uvCountUpdatedRecords, uvCheckRequired, uvCheckReadOnly, uvCheckUpdatable, uvUpdateNonBaseFields]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.UpdateChangedFields = False
    UpdateOptions.UpdateNonBaseFields = True
    UpdateOptions.RefreshMode = rmManual
    UpdateOptions.CountUpdatedRecords = False
    UpdateOptions.CheckRequired = False
    UpdateOptions.CheckReadOnly = False
    UpdateOptions.CheckUpdatable = False
    SQL.Strings = (
      'SELECT *'
      'FROM user'
      'ORDER BY USER_NAME')
    Left = 187
    Top = 112
  end
  object dsUser: TDataSource
    DataSet = qrUser
    Left = 187
    Top = 160
  end
end
