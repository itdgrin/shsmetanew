inherited FrameOXROPR: TFrameOXROPR
  Width = 548
  Height = 335
  DoubleBuffered = True
  ParentBackground = False
  ParentDoubleBuffered = False
  ParentFont = False
  ExplicitWidth = 548
  ExplicitHeight = 335
  object Panel: TPanel
    Left = 0
    Top = 0
    Width = 548
    Height = 316
    Align = alClient
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 0
    object ImageSplitter: TImage
      Left = 312
      Top = 395
      Width = 15
      Height = 5
      Cursor = crVSplit
    end
    object Splitter: TSplitter
      Left = 0
      Top = 276
      Width = 548
      Height = 5
      Cursor = crVSplit
      Align = alBottom
      ResizeStyle = rsUpdate
      ExplicitTop = 25
      ExplicitWidth = 488
    end
    object PanelTable: TPanel
      Left = 0
      Top = 25
      Width = 548
      Height = 251
      Align = alClient
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 1
      OnResize = PanelTableResize
      object SpeedButtonShowHide: TSpeedButton
        Tag = 1
        Left = 0
        Top = 236
        Width = 548
        Height = 15
        Align = alBottom
        Flat = True
        ParentShowHint = False
        ShowHint = True
        OnClick = SpeedButtonShowHideClick
        ExplicitLeft = -568
        ExplicitTop = 161
        ExplicitWidth = 796
      end
      object JvDBGrid1: TJvDBGrid
        Left = 0
        Top = 0
        Width = 548
        Height = 236
        Align = alClient
        DataSource = dsMain
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDrawColumnCell = JvDBGrid1DrawColumnCell
        AutoAppend = False
        IniStorage = fOXROPR.FormStorage
        PostOnEnterKey = True
        AutoSizeColumns = True
        AutoSizeColumnIndex = 1
        SelectColumnsDialogStrings.Caption = 'Select columns'
        SelectColumnsDialogStrings.OK = '&OK'
        SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
        CanDelete = False
        EditControls = <>
        RowsHeight = 17
        TitleRowHeight = 17
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'Number'
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = #1050#1086#1076
            Width = 42
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NameWork'
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1088#1072#1073#1086#1090
            Width = 294
            Visible = True
          end
          item
            Expanded = False
            Title.Alignment = taCenter
            Title.Caption = '% '#1054#1061#1056#1080#1054#1055#1056
            Width = 74
            Visible = True
          end
          item
            Expanded = False
            Title.Alignment = taCenter
            Title.Caption = '% '#1087#1083#1072#1085#1086#1074#1086#1081' '#1087#1088#1080#1073#1099#1083#1080
            Width = 118
            Visible = True
          end>
      end
    end
    object PanelMemo: TPanel
      Left = 0
      Top = 281
      Width = 548
      Height = 35
      Align = alBottom
      BevelOuter = bvNone
      Constraints.MinHeight = 35
      DoubleBuffered = True
      ParentBackground = False
      ParentDoubleBuffered = False
      ShowCaption = False
      TabOrder = 2
      object dbmmoNameWork: TDBMemo
        Left = 0
        Top = 0
        Width = 548
        Height = 35
        Align = alClient
        DataField = 'NameWork'
        DataSource = dsMain
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 0
      end
    end
    object PanelTop: TPanel
      Left = 0
      Top = 0
      Width = 548
      Height = 25
      Align = alTop
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 0
      OnResize = PanelTopResize
      object LabelTypeWork: TLabel
        Left = 217
        Top = 6
        Width = 56
        Height = 13
        Caption = #1042#1080#1076' '#1088#1072#1073#1086#1090':'
      end
      object LabelResolution: TLabel
        Left = 399
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
        TabStop = True
        OnClick = RadioButtonClick
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
        OnClick = RadioButtonClick
      end
      object RadioButtonVillage: TRadioButton
        Left = 74
        Top = 4
        Width = 55
        Height = 17
        Caption = '2. '#1057#1077#1083#1086
        TabOrder = 3
        TabStop = True
        OnClick = RadioButtonClick
      end
      object ComboBoxResolution: TComboBox
        Left = 487
        Top = 2
        Width = 58
        Height = 21
        Style = csDropDownList
        TabOrder = 1
        OnChange = ComboBoxResolutionChange
      end
      object DBLookupComboBoxTypeWork: TDBLookupComboBox
        Left = 279
        Top = 2
        Width = 114
        Height = 21
        TabOrder = 0
        OnClick = DBLookupComboBoxTypeWorkClick
      end
    end
  end
  inline FrameStatusBar: TFrameStatusBar
    Left = 0
    Top = 316
    Width = 548
    Height = 19
    Align = alBottom
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 1
    ExplicitTop = 316
    ExplicitWidth = 548
    inherited StatusBar: TStatusBar
      Width = 548
      ExplicitWidth = 548
    end
  end
  object PopupMenu: TPopupMenu
    Left = 72
    Top = 72
    object CopyCell: TMenuItem
      Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100
    end
    object OXROPRSearch: TMenuItem
      Caption = #1055#1086#1080#1089#1082
      object OXROPRSearchFast: TMenuItem
        Caption = #1041#1099#1089#1090#1088#1099#1081
        Checked = True
      end
      object OXROPRSearchAccurate: TMenuItem
        Caption = #1052#1072#1082#1089#1080#1084#1072#1083#1100#1085#1086' '#1090#1086#1095#1085#1099#1081
        Enabled = False
      end
    end
  end
  object DataSourceTypeWork: TDataSource
    DataSet = ADOQueryTypeWork
    Left = 152
    Top = 64
  end
  object ADOQueryTemp: TFDQuery
    Connection = DM.Connect
    Transaction = DM.Read
    UpdateTransaction = DM.Write
    Left = 152
    Top = 120
  end
  object ADOQueryTypeWork: TFDQuery
    Connection = DM.Connect
    Transaction = DM.Read
    UpdateTransaction = DM.Write
    Left = 72
    Top = 128
  end
  object qrMain: TFDQuery
    BeforePost = qrMainBeforePost
    AfterScroll = qrMainAfterScroll
    Connection = DM.Connect
    Transaction = DM.Read
    UpdateTransaction = DM.Write
    FormatOptions.AssignedValues = [fvMapRules, fvFmtDisplayNumeric]
    FormatOptions.OwnMapRules = True
    FormatOptions.MapRules = <
      item
        SourceDataType = dtBlob
        TargetDataType = dtAnsiString
      end
      item
        SourceDataType = dtByteString
        TargetDataType = dtAnsiString
      end>
    FormatOptions.FmtDisplayNumeric = '0.000'
    UpdateOptions.AssignedValues = [uvUpdateChngFields, uvUpdateMode, uvLockMode, uvRefreshMode, uvCheckRequired, uvCheckReadOnly, uvCheckUpdatable]
    UpdateOptions.UpdateMode = upWhereChanged
    UpdateOptions.CheckReadOnly = False
    UpdateOptions.UpdateTableName = 'objdetailex'
    UpdateOptions.KeyFields = 'ID'
    Left = 24
    Top = 72
  end
  object dsMain: TDataSource
    DataSet = qrMain
    Left = 24
    Top = 129
  end
end
