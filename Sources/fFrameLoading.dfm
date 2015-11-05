inherited FrameLoading: TFrameLoading
  Width = 738
  Height = 374
  ParentFont = False
  OnResize = FrameResize
  ExplicitWidth = 738
  ExplicitHeight = 374
  object PanelSearch: TPanel
    Left = 0
    Top = 0
    Width = 738
    Height = 36
    Align = alTop
    BevelOuter = bvNone
    DoubleBuffered = True
    ParentBackground = False
    ParentDoubleBuffered = False
    TabOrder = 0
    object LabelYear: TLabel
      Left = 8
      Top = 11
      Width = 23
      Height = 13
      Caption = #1043#1086#1076':'
    end
    object LabelMonth: TLabel
      Left = 93
      Top = 11
      Width = 35
      Height = 13
      Caption = #1052#1077#1089#1103#1094':'
    end
    object cmbMonth: TComboBox
      Left = 132
      Top = 8
      Width = 82
      Height = 21
      Style = csDropDownList
      TabOrder = 1
      OnChange = edtYearChange
      Items.Strings = (
        #1071#1085#1074#1072#1088#1100
        #1060#1077#1074#1088#1072#1083#1100
        #1052#1072#1088#1090
        #1040#1087#1088#1077#1083#1100
        #1052#1072#1081
        #1048#1102#1085#1100
        #1048#1102#1083#1100
        #1040#1074#1075#1091#1089#1090
        #1057#1077#1085#1090#1103#1073#1088#1100
        #1054#1082#1090#1103#1073#1088#1100
        #1053#1086#1103#1073#1088#1100
        #1044#1077#1082#1072#1073#1088#1100)
    end
    object edtYear: TSpinEdit
      Left = 33
      Top = 8
      Width = 54
      Height = 22
      MaxLength = 4
      MaxValue = 2050
      MinValue = 1900
      TabOrder = 0
      Value = 2014
      OnChange = edtYearChange
    end
    object cmbTranspType: TComboBox
      Left = 221
      Top = 8
      Width = 197
      Height = 21
      Style = csDropDownList
      ItemIndex = 0
      TabOrder = 2
      Text = #1040#1074#1090#1086#1084#1086#1073#1080#1083#1100#1085#1099#1077' '#1087#1077#1088#1077#1074#1086#1079#1082#1080
      OnChange = edtYearChange
      Items.Strings = (
        #1040#1074#1090#1086#1084#1086#1073#1080#1083#1100#1085#1099#1077' '#1087#1077#1088#1077#1074#1086#1079#1082#1080
        #1046#1077#1083#1077#1079#1085#1086#1076#1086#1088#1086#1078#1085#1099#1077' '#1087#1077#1088#1077#1074#1086#1079#1082#1080)
    end
  end
  object grLoading: TJvDBGrid
    Left = 0
    Top = 36
    Width = 738
    Height = 319
    Align = alClient
    DataSource = dsLoading
    DefaultDrawing = False
    DrawingStyle = gdsClassic
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    AutoAppend = False
    AutoSort = False
    SelectColumnsDialogStrings.Caption = 'Select columns'
    SelectColumnsDialogStrings.OK = '&OK'
    SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
    CanDelete = False
    ColumnResize = gcrDataSet
    EditControls = <>
    RowsHeight = 17
    TitleRowHeight = 17
    Columns = <
      item
        Expanded = False
        FieldName = 'Num'
        Title.Alignment = taCenter
        Title.Caption = #8470
        Width = 30
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nam1'
        Title.Alignment = taCenter
        Title.Caption = #1057#1090#1088#1086#1080#1090#1077#1083#1100#1085#1099#1077' '#1084#1072#1090#1077#1088#1080#1072#1083#1099', '#1080#1079#1076#1077#1083#1080#1103' '#1080' '#1082#1086#1085#1089#1090#1088#1091#1082#1094#1080#1080
        Width = 178
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LoadNoNDS'
        Title.Alignment = taCenter
        Title.Caption = #1055#1086#1075#1088#1091#1079#1082#1072' '#1073#1077#1079' '#1053#1044#1057', '#1088#1091#1073
        Width = 130
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LoadNDS'
        Title.Alignment = taCenter
        Title.Caption = #1055#1086#1075#1088#1091#1079#1082#1072' '#1089' '#1053#1044#1057', '#1088#1091#1073
        Width = 130
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UnloadNoNDS'
        Title.Alignment = taCenter
        Title.Caption = #1056#1072#1079#1075#1088#1091#1079#1082#1072' '#1073#1077#1079' '#1053#1044#1057', '#1088#1091#1073
        Width = 130
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UnloadNDS'
        Title.Alignment = taCenter
        Title.Caption = #1056#1072#1079#1075#1088#1091#1079#1082#1072' '#1089' '#1053#1044#1057', '#1088#1091#1073
        Width = 89
        Visible = True
      end>
    Delphi2010OptionsMigrated = True
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 355
    Width = 738
    Height = 19
    Panels = <
      item
        Width = 120
      end>
    ExplicitLeft = 400
    ExplicitTop = 336
    ExplicitWidth = 0
  end
  object qrLoading: TFDQuery
    AfterScroll = qrLoadingAfterScroll
    OnCalcFields = qrLoadingCalcFields
    CachedUpdates = True
    Connection = DM.Connect
    FetchOptions.AssignedValues = [evItems]
    FetchOptions.Items = [fiBlobs, fiDetails]
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate, uvUpdateChngFields, uvRefreshDelete, uvCheckRequired, uvCheckReadOnly, uvCheckUpdatable, uvUpdateNonBaseFields]
    UpdateOptions.UpdateChangedFields = False
    UpdateOptions.UpdateNonBaseFields = True
    UpdateOptions.CheckRequired = False
    UpdateOptions.CheckReadOnly = False
    UpdateOptions.CheckUpdatable = False
    SQL.Strings = (
      
        'Select 1 as Num, tariffworks_name.WORK_ID, nam1, if(:TrType = 0,' +
        ' TARIFF_11, TARIFF_8) as LoadNoNDS, if(:TrType = 0, TARIFF_12, T' +
        'ARIFF_9) as UnloadNoNDS  '
      'from tariffworks_name, tariffworks '
      'where (tariffworks_name.WORK_ID = tariffworks.WORK_ID) and '
      '      (YEAR = :YEAR) and '
      '      (MONAT = :MONAT);')
    Left = 152
    Top = 152
    ParamData = <
      item
        Name = 'TRTYPE'
        DataType = ftString
        ParamType = ptInput
        Value = '0'
      end
      item
        Name = 'YEAR'
        DataType = ftString
        ParamType = ptInput
        Value = '2015'
      end
      item
        Name = 'MONAT'
        DataType = ftString
        ParamType = ptInput
        Value = '10'
      end>
    object qrLoadingWORK_ID: TFDAutoIncField
      FieldName = 'WORK_ID'
      Origin = 'work_id'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object qrLoadingnam1: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nam1'
      Origin = 'nam1'
      Size = 1024
    end
    object qrLoadingLoadNoNDS: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'LoadNoNDS'
      Origin = 'LoadNoNDS'
      ProviderFlags = []
      ReadOnly = True
      Precision = 11
      Size = 3
    end
    object qrLoadingUnloadNoNDS: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'UnloadNoNDS'
      Origin = 'UnloadNoNDS'
      ProviderFlags = []
      ReadOnly = True
      Precision = 11
      Size = 3
    end
    object qrLoadingLoadNDS: TBCDField
      FieldKind = fkCalculated
      FieldName = 'LoadNDS'
      Calculated = True
    end
    object qrLoadingUnloadNDS: TBCDField
      FieldKind = fkCalculated
      FieldName = 'UnloadNDS'
      Calculated = True
    end
    object qrLoadingNum: TLargeintField
      FieldName = 'Num'
    end
  end
  object dsLoading: TDataSource
    DataSet = qrLoading
    Left = 216
    Top = 152
  end
end
