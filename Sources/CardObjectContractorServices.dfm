object fCardObjectContractorServices: TfCardObjectContractorServices
  Left = 0
  Top = 0
  Caption = #1059#1089#1083#1091#1075#1080' '#1075#1077#1085#1077#1088#1072#1083#1100#1085#1086#1075#1086' '#1087#1086#1076#1088#1103#1076#1095#1080#1082#1072
  ClientHeight = 442
  ClientWidth = 464
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnClose = FormClose
  OnDestroy = FormDestroy
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object pnlBott: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 403
    Width = 458
    Height = 36
    Align = alBottom
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    DesignSize = (
      458
      36)
    object btnCancel: TBitBtn
      Left = 378
      Top = 6
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
      TabOrder = 1
      OnClick = btnCancelClick
    end
    object btnSave: TBitBtn
      Left = 297
      Top = 6
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
      TabOrder = 0
      OnClick = btnSaveClick
    end
  end
  object grMain: TJvDBGrid
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 458
    Height = 394
    Align = alClient
    DataSource = dsMain
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleHotTrack]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDrawColumnCell = grMainDrawColumnCell
    AutoAppend = False
    PostOnEnterKey = True
    ScrollBars = ssNone
    ShowCellHint = True
    AutoSizeColumns = True
    SelectColumnsDialogStrings.Caption = 'Select columns'
    SelectColumnsDialogStrings.OK = '&OK'
    SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
    CanDelete = False
    EditControls = <>
    AutoSizeRows = False
    RowsHeight = 45
    TitleRowHeight = 17
    WordWrap = True
    WordWrapAllFields = True
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Checked'
        Title.Alignment = taCenter
        Title.Caption = #1048#1089#1087'.'
        Width = 43
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'param_name'
        Title.Alignment = taCenter
        Title.Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1091#1089#1083#1091#1075#1080
        Width = 348
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALUE'
        Title.Alignment = taCenter
        Title.Caption = #1055#1088#1086#1094#1077#1085#1090
        Width = 60
        Visible = True
      end>
  end
  object qrMain: TFDQuery
    AfterOpen = qrMainAfterOpen
    OnCalcFields = qrMainCalcFields
    Connection = DM.Connect
    Transaction = DM.Read
    UpdateTransaction = DM.Write
    FormatOptions.AssignedValues = [fvDefaultParamDataType, fvFmtDisplayNumeric]
    FormatOptions.DefaultParamDataType = ftBCD
    FormatOptions.FmtDisplayNumeric = '### ### ### ### ### ### ##0.####'
    UpdateOptions.AssignedValues = [uvUpdateNonBaseFields]
    SQL.Strings = (
      'SELECT id_unidictparam,code,param_name,param_description,'
      'FN_getParamValue(code, :month, :year) AS VALUE, (-1) AS NO'
      'FROM '
      '  unidictparam'
      'WHERE id_unidicttype=7')
    Left = 287
    Top = 270
    ParamData = <
      item
        Name = 'MONTH'
        DataType = ftBCD
        ParamType = ptInput
        Value = 10000c
      end
      item
        Name = 'YEAR'
        DataType = ftBCD
        ParamType = ptInput
        Value = 20150000c
      end>
    object qrMainid_unidictparam: TFDAutoIncField
      FieldName = 'id_unidictparam'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = '### ### ### ### ### ### ##0.####'
    end
    object strngfldMaincode: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'code'
      ProviderFlags = []
      Size = 50
    end
    object strngfldMainparam_name: TStringField
      FieldName = 'param_name'
      Size = 500
    end
    object strngfldMainparam_description: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'param_description'
      Origin = 'param_description'
      Size = 1000
    end
    object qrMainVALUE: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'VALUE'
      Origin = 'VALUE'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = '### ### ### ### ### ### ##0.####'
    end
    object qrMainChecked: TBooleanField
      FieldKind = fkCalculated
      FieldName = 'Checked'
      OnChange = qrMainCheckedChange
      Calculated = True
    end
    object qrMainNO: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'NO'
      Origin = 'NO'
      DisplayFormat = '### ### ### ### ### ### ##0.####'
    end
  end
  object dsMain: TDataSource
    DataSet = qrMain
    Left = 320
    Top = 270
  end
  object FormStorage: TJvFormStorage
    AppStorage = FormMain.AppIni
    AppStoragePath = '%FORM_NAME%\'
    Options = [fpState, fpSize, fpLocation, fpActiveControl]
    StoredValues = <>
    Left = 24
    Top = 264
  end
end
