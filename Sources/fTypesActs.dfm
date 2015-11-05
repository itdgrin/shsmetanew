object FrameTypesActs: TFrameTypesActs
  Left = 0
  Top = 0
  Width = 600
  Height = 400
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  ParentFont = False
  TabOrder = 0
  object VST: TVirtualStringTree
    Left = 0
    Top = 0
    Width = 600
    Height = 400
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Header.AutoSizeIndex = -1
    Header.Font.Charset = DEFAULT_CHARSET
    Header.Font.Color = clWindowText
    Header.Font.Height = -11
    Header.Font.Name = 'Tahoma'
    Header.Font.Style = []
    Header.MainColumn = 1
    Header.Options = [hoVisible]
    ParentFont = False
    PopupMenu = PopupMenu
    TabOrder = 0
    TreeOptions.MiscOptions = [toAcceptOLEDrop, toFullRepaintOnResize, toGridExtensions, toInitOnSave, toToggleOnDblClick, toWheelPanning, toEditOnClick]
    TreeOptions.PaintOptions = [toHideFocusRect, toShowButtons, toShowDropmark, toShowHorzGridLines, toShowVertGridLines, toThemeAware, toUseBlendedImages]
    TreeOptions.SelectionOptions = [toExtendedFocus]
    OnAfterCellPaint = VSTAfterCellPaint
    OnBeforeCellPaint = VSTBeforeCellPaint
    OnFocusChanged = VSTFocusChanged
    OnGetText = VSTGetText
    OnResize = VSTResize
    ExplicitLeft = 3
    ExplicitTop = 3
    Columns = <
      item
        Position = 0
        WideText = #8470' '#1087'/'#1087
      end
      item
        Options = [coAllowClick, coDraggable, coEnabled, coParentBidiMode, coParentColor, coResizable, coShowDropMark, coAllowFocus]
        Position = 1
        WideText = #1050#1086#1076
      end
      item
        Position = 2
        Width = 200
        WideText = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      end>
    WideDefaultText = 'node'
  end
  object PopupMenu: TPopupMenu
    Left = 24
    Top = 88
    object PMAdd: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      OnClick = PMAddClick
    end
    object PMEdit: TMenuItem
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      OnClick = PMEditClick
    end
    object PMDelete: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100
      OnClick = PMDeleteClick
    end
  end
  object ADOQueryTemp: TFDQuery
    Connection = DM.Connect
    Transaction = DM.Read
    UpdateTransaction = DM.Write
    Left = 92
    Top = 32
  end
  object ADOQuery: TFDQuery
    Connection = DM.Connect
    Transaction = DM.Read
    UpdateTransaction = DM.Write
    Left = 20
    Top = 32
  end
end
