object FramePriceTransportations: TFramePriceTransportations
  Left = 0
  Top = 0
  Width = 488
  Height = 335
  DoubleBuffered = True
  ParentBackground = False
  ParentDoubleBuffered = False
  TabOrder = 0
  OnEnter = FrameEnter
  OnExit = FrameExit
  OnResize = FrameResize
  object Panel: TPanel
    Left = 0
    Top = 0
    Width = 488
    Height = 335
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
      Top = 295
      Width = 488
      Height = 5
      Cursor = crVSplit
      Align = alBottom
      ResizeStyle = rsUpdate
      ExplicitTop = 25
    end
    object PanelStringGrid: TPanel
      Left = 0
      Top = 25
      Width = 488
      Height = 270
      Align = alClient
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 1
      OnResize = PanelStringGridResize
      object SpeedButtonShowHide: TSpeedButton
        Tag = 1
        Left = 0
        Top = 255
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
      object StringGrid: TStringGrid
        Left = 0
        Top = 0
        Width = 488
        Height = 255
        Align = alClient
        ColCount = 2
        DefaultRowHeight = 20
        DefaultDrawing = False
        FixedCols = 0
        RowCount = 2
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goThumbTracking]
        PopupMenu = PopupMenu
        TabOrder = 0
        OnClick = StringGridClick
        OnDblClick = StringGridDblClick
        OnDrawCell = StringGridDrawCell
        OnEnter = StringGridEnter
        OnExit = StringGridExit
        OnKeyDown = StringGridKeyDown
        OnKeyPress = StringGridKeyPress
        OnMouseDown = StringGridMouseDown
        OnMouseMove = StringGridMouseMove
      end
    end
    object PanelSearch: TPanel
      Left = 0
      Top = 0
      Width = 488
      Height = 25
      Align = alTop
      BevelOuter = bvNone
      DoubleBuffered = True
      ParentBackground = False
      ParentDoubleBuffered = False
      TabOrder = 0
      DesignSize = (
        488
        25)
      object LabelSearch: TLabel
        Left = 8
        Top = 6
        Width = 34
        Height = 13
        Caption = #1055#1086#1080#1089#1082':'
      end
      object EditSearch: TEdit
        Left = 48
        Top = 2
        Width = 437
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
    end
    object PanelMemo: TPanel
      Left = 0
      Top = 300
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
  object ADOQuery: TADOQuery
    Connection = DM.ADOConnection
    Parameters = <>
    Left = 16
    Top = 32
  end
  object PopupMenu: TPopupMenu
    Left = 80
    Top = 32
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
end
