inherited FramePriceTransportations: TFramePriceTransportations
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
    object PanelTable: TPanel
      Left = 0
      Top = 36
      Width = 488
      Height = 280
      Align = alClient
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 1
      object VST: TVirtualStringTree
        Left = 0
        Top = 0
        Width = 488
        Height = 280
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Header.AutoSizeIndex = 0
        Header.Font.Charset = DEFAULT_CHARSET
        Header.Font.Color = clWindowText
        Header.Font.Height = -11
        Header.Font.Name = 'Tahoma'
        Header.Font.Style = []
        Header.Height = 32
        Header.Options = [hoVisible]
        ParentFont = False
        PopupMenu = PopupMenu
        TabOrder = 0
        TreeOptions.MiscOptions = [toAcceptOLEDrop, toFullRepaintOnResize, toGridExtensions, toInitOnSave, toToggleOnDblClick, toWheelPanning, toEditOnClick]
        TreeOptions.PaintOptions = [toHideFocusRect, toShowButtons, toShowDropmark, toShowHorzGridLines, toShowVertGridLines, toThemeAware, toUseBlendedImages]
        TreeOptions.SelectionOptions = [toExtendedFocus]
        OnAfterCellPaint = VSTAfterCellPaint
        OnBeforeCellPaint = VSTBeforeCellPaint
        OnEnter = VSTEnter
        OnFocusChanged = VSTFocusChanged
        OnGetText = VSTGetText
        ExplicitTop = 32
        Columns = <
          item
            Options = [coAllowClick, coDraggable, coEnabled, coParentBidiMode, coParentColor, coResizable, coShowDropMark, coVisible, coFixed]
            Position = 0
            WideText = #8470' '#1087'/'#1087
          end
          item
            Position = 1
            WideText = #1054#1073#1086#1089#1085#1086#1074#1072#1085#1080#1077
          end
          item
            CaptionAlignment = taCenter
            Options = [coAllowClick, coDraggable, coEnabled, coParentBidiMode, coParentColor, coResizable, coShowDropMark, coVisible, coAllowFocus, coWrapCaption, coUseCaptionAlignment]
            Position = 2
            Width = 90
            WideText = 'I '#1082#1083#1072#1089#1089' '#1075#1088#1091#1079#1072' '#1073#1077#1079' '#1053#1044#1057', '#1088#1091#1073
          end
          item
            CaptionAlignment = taCenter
            Options = [coAllowClick, coDraggable, coEnabled, coParentBidiMode, coParentColor, coResizable, coShowDropMark, coVisible, coAllowFocus, coWrapCaption, coUseCaptionAlignment]
            Position = 3
            Width = 90
            WideText = 'I '#1082#1083#1072#1089#1089' '#1075#1088#1091#1079#1072'   '#1089' '#1053#1044#1057', '#1088#1091#1073
          end
          item
            CaptionAlignment = taCenter
            Options = [coAllowClick, coDraggable, coEnabled, coParentBidiMode, coParentColor, coResizable, coShowDropMark, coVisible, coAllowFocus, coWrapCaption, coUseCaptionAlignment]
            Position = 4
            Width = 90
            WideText = 'II '#1082#1083#1072#1089#1089' '#1075#1088#1091#1079#1072' '#1073#1077#1079' '#1053#1044#1057', '#1088#1091#1073
          end
          item
            CaptionAlignment = taCenter
            Options = [coAllowClick, coDraggable, coEnabled, coParentBidiMode, coParentColor, coResizable, coShowDropMark, coVisible, coAllowFocus, coWrapCaption, coUseCaptionAlignment]
            Position = 5
            Width = 90
            WideText = 'II '#1082#1083#1072#1089#1089' '#1075#1088#1091#1079#1072'  '#1089' '#1053#1044#1057', '#1088#1091#1073
          end
          item
            CaptionAlignment = taCenter
            Options = [coAllowClick, coDraggable, coEnabled, coParentBidiMode, coParentColor, coResizable, coShowDropMark, coVisible, coAllowFocus, coWrapCaption, coUseCaptionAlignment]
            Position = 6
            Width = 90
            WideText = 'III '#1082#1083#1072#1089#1089' '#1075#1088#1091#1079#1072' '#1073#1077#1079' '#1053#1044#1057', '#1088#1091#1073
          end
          item
            CaptionAlignment = taCenter
            Options = [coAllowClick, coDraggable, coEnabled, coParentBidiMode, coParentColor, coResizable, coShowDropMark, coVisible, coAllowFocus, coWrapCaption, coUseCaptionAlignment]
            Position = 7
            Width = 90
            WideText = 'III '#1082#1083#1072#1089#1089' '#1075#1088#1091#1079#1072' '#1089' '#1053#1044#1057', '#1088#1091#1073
          end
          item
            CaptionAlignment = taCenter
            Options = [coAllowClick, coDraggable, coEnabled, coParentBidiMode, coParentColor, coResizable, coShowDropMark, coVisible, coAllowFocus, coWrapCaption, coUseCaptionAlignment]
            Position = 8
            Width = 90
            WideText = 'IV '#1082#1083#1072#1089#1089' '#1075#1088#1091#1079#1072' '#1073#1077#1079' '#1053#1044#1057', '#1088#1091#1073
          end
          item
            CaptionAlignment = taCenter
            Options = [coAllowClick, coDraggable, coEnabled, coParentBidiMode, coParentColor, coResizable, coShowDropMark, coVisible, coAllowFocus, coWrapCaption, coUseCaptionAlignment]
            Position = 9
            Width = 90
            WideText = 'IV '#1082#1083#1072#1089#1089' '#1075#1088#1091#1079#1072' '#1089' '#1053#1044#1057', '#1088#1091#1073
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
        OnChange = ComboBoxMonthYearChange
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
        OnChange = ComboBoxMonthYearChange
      end
      object cmbTranspType: TComboBox
        Left = 221
        Top = 8
        Width = 197
        Height = 21
        Style = csDropDownList
        ItemIndex = 0
        TabOrder = 2
        Text = #1040#1074#1090#1086#1084#1086#1073#1080#1083#1103#1084#1080' '#1089#1072#1084#1086#1089#1074#1072#1083#1072#1084#1080' '#1057'310'
        OnChange = ComboBoxMonthYearChange
        Items.Strings = (
          #1040#1074#1090#1086#1084#1086#1073#1080#1083#1103#1084#1080' '#1089#1072#1084#1086#1089#1074#1072#1083#1072#1084#1080' '#1057'310'
          #1041#1086#1088#1090#1086#1074#1099#1084#1080' '#1089#1072#1084#1086#1089#1074#1072#1083#1072#1084#1080' '#1057'311')
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
    Top = 112
    object CopyCell: TMenuItem
      Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100
      OnClick = CopyCellClick
    end
    object PriceTransportationSearch: TMenuItem
      Caption = #1055#1086#1080#1089#1082
      object PriceTransportationSearchFast: TMenuItem
        Caption = #1041#1099#1089#1090#1088#1099#1081
        Checked = True
      end
      object PriceTransportationSearchAccurate: TMenuItem
        Caption = #1052#1072#1082#1089#1080#1084#1072#1083#1100#1085#1086' '#1090#1086#1095#1085#1099#1081
        Enabled = False
      end
    end
  end
  object ADOQuery: TFDQuery
    Connection = DM.Connect
    Transaction = DM.Read
    UpdateTransaction = DM.Write
    Left = 52
    Top = 113
  end
end
