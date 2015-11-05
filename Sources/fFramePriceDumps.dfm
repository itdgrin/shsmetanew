inherited FramePriceDumps: TFramePriceDumps
  Width = 488
  Height = 335
  DoubleBuffered = True
  ParentBackground = False
  ParentDoubleBuffered = False
  ParentFont = False
  OnEnter = FrameEnter
  OnExit = FrameExit
  OnResize = FrameResize
  ExplicitWidth = 488
  ExplicitHeight = 335
  object Panel: TPanel
    Left = 0
    Top = 0
    Width = 488
    Height = 316
    Align = alClient
    BevelOuter = bvNone
    DoubleBuffered = True
    ParentDoubleBuffered = False
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
      Width = 488
      Height = 5
      Cursor = crVSplit
      Align = alBottom
      ResizeStyle = rsUpdate
      ExplicitTop = 25
    end
    object PanelTable: TPanel
      Left = 0
      Top = 36
      Width = 488
      Height = 240
      Align = alClient
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 1
      OnResize = PanelTableResize
      object SpeedButtonShowHide: TSpeedButton
        Tag = 1
        Left = 0
        Top = 225
        Width = 488
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
      object VST: TVirtualStringTree
        Left = 0
        Top = 0
        Width = 488
        Height = 225
        Align = alClient
        Header.AutoSizeIndex = 0
        Header.Font.Charset = DEFAULT_CHARSET
        Header.Font.Color = clWindowText
        Header.Font.Height = -11
        Header.Font.Name = 'Tahoma'
        Header.Font.Style = []
        Header.Options = [hoVisible]
        PopupMenu = PopupMenu
        TabOrder = 0
        TreeOptions.MiscOptions = [toAcceptOLEDrop, toFullRepaintOnResize, toGridExtensions, toInitOnSave, toToggleOnDblClick, toWheelPanning, toEditOnClick]
        TreeOptions.PaintOptions = [toHideFocusRect, toShowButtons, toShowDropmark, toShowHorzGridLines, toShowVertGridLines, toThemeAware, toUseBlendedImages]
        TreeOptions.SelectionOptions = [toExtendedFocus]
        OnAfterCellPaint = VSTAfterCellPaint
        OnBeforeCellPaint = VSTBeforeCellPaint
        OnEnter = VSTEnter
        OnExit = VSTExit
        OnFocusChanged = VSTFocusChanged
        OnGetText = VSTGetText
        OnKeyPress = VSTKeyPress
        ExplicitTop = 32
        Columns = <
          item
            Options = [coAllowClick, coDraggable, coEnabled, coParentBidiMode, coParentColor, coResizable, coShowDropMark, coVisible, coFixed]
            Position = 0
            WideText = #8470' '#1087'/'#1087
          end
          item
            Options = [coAllowClick, coDraggable, coEnabled, coParentBidiMode, coParentColor, coResizable, coShowDropMark, coVisible, coAllowFocus, coUseCaptionAlignment]
            Position = 1
            Width = 110
            WideText = #1053#1072#1079#1074#1072#1085#1080#1077' '#1089#1074#1072#1083#1082#1080
          end
          item
            Position = 2
            Width = 115
            WideText = #1062#1077#1085#1072' '#1073#1077#1079' '#1053#1044#1057', '#1088#1091#1073
          end
          item
            Position = 3
            Width = 115
            WideText = #1062#1077#1085#1072' '#1089' '#1053#1044#1057', '#1088#1091#1073
          end
          item
            Position = 4
            Width = 75
            WideText = #1045#1076'. '#1080#1079#1084'.'
          end
          item
            Position = 5
            Width = 155
            WideText = #1053#1072#1079#1074#1072#1085#1080#1077' '#1086#1073#1083#1072#1089#1090#1080
          end>
        WideDefaultText = 'node'
      end
    end
    object PanelSearch: TPanel
      Left = 0
      Top = 0
      Width = 488
      Height = 36
      Align = alTop
      BevelOuter = bvNone
      DoubleBuffered = True
      ParentBackground = False
      ParentDoubleBuffered = False
      TabOrder = 0
      DesignSize = (
        488
        36)
      object LabelSearch: TLabel
        Left = 221
        Top = 11
        Width = 34
        Height = 13
        Caption = #1055#1086#1080#1089#1082':'
      end
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
      object EditSearch: TEdit
        Left = 261
        Top = 8
        Width = 220
        Height = 21
        Hint = 
          #1042#1074#1077#1076#1080#1090#1077' '#1089#1083#1086#1074#1072' '#1095#1077#1088#1077#1079' '#1087#1088#1086#1073#1077#1083' '#1080' '#1085#1072#1078#1084#1080#1090#1077' - Enter, '#1076#1083#1103' '#1086#1095#1080#1089#1090#1082#1080' '#1085#1072#1078#1084#1080#1090 +
          #1077' - Esc'
        Anchors = [akLeft, akTop, akRight]
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnEnter = EditSearchEnter
        OnKeyPress = EditSearchKeyPress
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
        TabOrder = 2
        Value = 2014
        OnChange = edtYearChange
      end
    end
    object PanelMemo: TPanel
      Left = 0
      Top = 281
      Width = 488
      Height = 35
      Align = alBottom
      BevelOuter = bvNone
      Constraints.MinHeight = 35
      DoubleBuffered = True
      ParentBackground = False
      ParentDoubleBuffered = False
      ShowCaption = False
      TabOrder = 2
      object Memo: TMemo
        Left = 0
        Top = 0
        Width = 488
        Height = 35
        Align = alClient
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 0
        OnEnter = MemoEnter
      end
    end
  end
  inline FrameStatusBar: TFrameStatusBar
    Left = 0
    Top = 316
    Width = 488
    Height = 19
    Align = alBottom
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 1
    ExplicitTop = 316
    ExplicitWidth = 488
    inherited StatusBar: TStatusBar
      Width = 488
      ExplicitWidth = 488
    end
  end
  object PopupMenu: TPopupMenu
    Left = 112
    Top = 80
    object CopyCell: TMenuItem
      Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100
      OnClick = CopyCellClick
    end
    object DumpSearch: TMenuItem
      Caption = #1055#1086#1080#1089#1082
      object DumpSearchFast: TMenuItem
        Caption = #1041#1099#1089#1090#1088#1099#1081
        Checked = True
      end
      object DumpSearchAccurate: TMenuItem
        Caption = #1052#1072#1082#1089#1080#1084#1072#1083#1100#1085#1086' '#1090#1086#1095#1085#1099#1081
        Enabled = False
      end
    end
  end
  object ADOQuery: TFDQuery
    Connection = DM.Connect
    Transaction = DM.Read
    UpdateTransaction = DM.Write
    Left = 28
    Top = 88
  end
end
