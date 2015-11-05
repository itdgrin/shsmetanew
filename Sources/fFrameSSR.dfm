inherited FrameSSR: TFrameSSR
  Width = 797
  Height = 335
  DoubleBuffered = True
  ParentBackground = False
  ParentDoubleBuffered = False
  ParentFont = False
  OnEnter = FrameEnter
  OnExit = FrameExit
  ExplicitWidth = 797
  ExplicitHeight = 335
  object Panel: TPanel
    Left = 0
    Top = 25
    Width = 797
    Height = 291
    Align = alClient
    BevelOuter = bvNone
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 1
    object ImageSplitter: TImage
      Left = 312
      Top = 395
      Width = 15
      Height = 5
      Cursor = crVSplit
    end
    object Splitter: TSplitter
      Left = 0
      Top = 251
      Width = 797
      Height = 5
      Cursor = crVSplit
      Align = alBottom
      ResizeStyle = rsUpdate
      ExplicitTop = 25
      ExplicitWidth = 488
    end
    object PanelSearch: TPanel
      Left = 0
      Top = 0
      Width = 797
      Height = 25
      Align = alTop
      BevelOuter = bvNone
      DoubleBuffered = True
      ParentBackground = False
      ParentDoubleBuffered = False
      TabOrder = 0
      DesignSize = (
        797
        25)
      object LabelSearch: TLabel
        Left = 8
        Top = 6
        Width = 34
        Height = 13
        Caption = #1055#1086#1080#1089#1082':'
      end
      object lbPrikazRef: TLabel
        Left = 700
        Top = 6
        Width = 100
        Height = 13
        Cursor = crHandPoint
        Anchors = [akTop, akRight]
        Caption = #1053#1056#1056' 8.01.103 - 2012'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsUnderline]
        ParentFont = False
        OnClick = lbPrikazRefClick
      end
      object EditSearch: TEdit
        Left = 46
        Top = 3
        Width = 648
        Height = 21
        Hint = 
          #1042#1074#1077#1076#1080#1090#1077' '#1089#1083#1086#1074#1072' '#1095#1077#1088#1077#1079' '#1087#1088#1086#1073#1077#1083' '#1080' '#1085#1072#1078#1084#1080#1090#1077' - Enter, '#1076#1083#1103' '#1086#1095#1080#1089#1090#1082#1080' '#1085#1072#1078#1084#1080#1090 +
          #1077' - Esc'
        Margins.Left = 100
        Margins.Bottom = 0
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
      Top = 256
      Width = 797
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
        Width = 797
        Height = 35
        Align = alClient
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 0
        OnEnter = MemoEnter
      end
    end
    object PanelStringGrid: TPanel
      Left = 0
      Top = 25
      Width = 797
      Height = 226
      Align = alClient
      BevelOuter = bvNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 1
      OnResize = PanelStringGridResize
      object SpeedButtonShowHide: TSpeedButton
        Tag = 1
        Left = 0
        Top = 211
        Width = 797
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
        Width = 225
        Height = 239
        ColCount = 2
        DefaultRowHeight = 20
        DefaultDrawing = False
        FixedCols = 0
        RowCount = 2
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goThumbTracking]
        PopupMenu = PopupMenu
        TabOrder = 0
        OnClick = StringGridClick
        OnDrawCell = StringGridDrawCell
        OnEnter = StringGridEnter
        OnExit = StringGridExit
        OnKeyDown = StringGridKeyDown
        OnKeyPress = StringGridKeyPress
        OnMouseDown = StringGridMouseDown
        OnMouseMove = StringGridMouseMove
      end
      object StringGrid2: TStringGrid
        Left = 231
        Top = 6
        Width = 195
        Height = 224
        ColCount = 2
        DefaultRowHeight = 20
        DefaultDrawing = False
        FixedCols = 0
        RowCount = 2
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goThumbTracking]
        PopupMenu = PopupMenu
        TabOrder = 1
        OnClick = StringGrid2Click
        OnDrawCell = StringGrid2DrawCell
        OnEnter = StringGridEnter
        OnExit = StringGridExit
        OnKeyDown = StringGridKeyDown
        OnKeyPress = StringGridKeyPress
        OnMouseDown = StringGridMouseDown
        OnMouseMove = StringGridMouseMove
      end
    end
  end
  object PanelMenu: TPanel
    Left = 0
    Top = 0
    Width = 797
    Height = 25
    Align = alTop
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 0
    DesignSize = (
      797
      25)
    object SpeedButton1: TSpeedButton
      Tag = 1
      Left = 612
      Top = 2
      Width = 21
      Height = 21
      Anchors = [akTop, akRight]
      GroupIndex = 1
      Down = True
      Caption = '1'
      OnClick = SpeedButtonClick
      ExplicitLeft = 535
    end
    object SpeedButton2: TSpeedButton
      Tag = 2
      Left = 635
      Top = 2
      Width = 21
      Height = 21
      Anchors = [akTop, akRight]
      GroupIndex = 1
      Caption = '2'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      OnClick = SpeedButtonClick
      ExplicitLeft = 558
    end
    object SpeedButton3: TSpeedButton
      Tag = 3
      Left = 658
      Top = 2
      Width = 21
      Height = 21
      Anchors = [akTop, akRight]
      GroupIndex = 1
      Caption = '3'
      OnClick = SpeedButtonClick
      ExplicitLeft = 581
    end
    object SpeedButton4: TSpeedButton
      Tag = 4
      Left = 681
      Top = 2
      Width = 21
      Height = 21
      Anchors = [akTop, akRight]
      GroupIndex = 1
      Caption = '4'
      OnClick = SpeedButtonClick
      ExplicitLeft = 604
    end
    object SpeedButton5: TSpeedButton
      Tag = 5
      Left = 704
      Top = 2
      Width = 21
      Height = 21
      Anchors = [akTop, akRight]
      GroupIndex = 1
      Caption = '5'
      OnClick = SpeedButtonClick
      ExplicitLeft = 627
    end
    object SpeedButton6: TSpeedButton
      Tag = 6
      Left = 727
      Top = 2
      Width = 21
      Height = 21
      Anchors = [akTop, akRight]
      GroupIndex = 1
      Caption = '6'
      Enabled = False
      OnClick = SpeedButtonClick
      ExplicitLeft = 650
    end
    object SpeedButton7: TSpeedButton
      Tag = 7
      Left = 750
      Top = 2
      Width = 21
      Height = 21
      Anchors = [akTop, akRight]
      GroupIndex = 1
      Caption = '7'
      Enabled = False
      OnClick = SpeedButtonClick
      ExplicitLeft = 673
    end
    object SpeedButton8: TSpeedButton
      Tag = 8
      Left = 773
      Top = 2
      Width = 21
      Height = 21
      Anchors = [akTop, akRight]
      GroupIndex = 1
      Caption = '8'
      Enabled = False
      OnClick = SpeedButtonClick
      ExplicitLeft = 696
    end
    object ComboBox: TComboBox
      Left = 3
      Top = 2
      Width = 603
      Height = 21
      Style = csDropDownList
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      OnClick = ComboBoxClick
      Items.Strings = (
        
          '1. '#1057#1084#1077#1090#1085#1099#1077' '#1085#1086#1088#1084#1099' '#1076#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1099#1093' '#1079#1072#1090#1088#1072#1090' '#1087#1088#1080' '#1087#1088#1086#1080#1079#1074#1086#1076#1089#1090#1074#1077' '#1057#1052#1056' '#1074' '#1079#1080 +
          #1084#1085#1077#1077' '#1074#1088#1077#1084#1103' '#1087#1086' '#1074#1080#1076#1072#1084' '#1089#1090#1088#1086#1080#1090#1077#1083#1100#1089#1090#1074#1072
        
          '2. '#1057#1084#1077#1090#1085#1099#1077' '#1085#1086#1088#1084#1099' '#1079#1072#1090#1088#1072#1090' '#1085#1072' '#1089#1090#1088#1086#1080#1090#1077#1083#1100#1089#1090#1074#1086' '#1074#1088#1077#1084#1077#1085#1085#1099#1093' '#1089#1076#1072#1085#1080#1081' '#1080' '#1089#1086#1086#1088 +
          #1091#1078#1077#1085#1080#1081
        '4. '#1057#1086#1076#1077#1088#1078#1072#1085#1080#1077' '#1077#1076#1080#1085#1099#1093' '#1079#1072#1082#1072#1079#1095#1080#1082#1086#1074
        '7. '#1056#1077#1079#1077#1088#1074' '#1085#1072' '#1085#1077#1087#1088#1077#1076#1074#1080#1076#1077#1085#1085#1099#1077' '#1088#1072#1073#1086#1090#1099' '#1080' '#1079#1072#1090#1088#1072#1090#1099
        '8. '#1047#1072#1090#1088#1072#1090#1099', '#1089#1074#1103#1079#1072#1085#1085#1099#1077' '#1089' '#1087#1086#1076#1074#1080#1078#1085#1099#1084' '#1088#1072#1079#1098#1077#1079#1076#1085#1099#1084' '#1093#1072#1088#1072#1082#1090#1077#1088#1086#1084' '#1088#1072#1073#1086#1090)
    end
  end
  inline FrameStatusBar: TFrameStatusBar
    Left = 0
    Top = 316
    Width = 797
    Height = 19
    Align = alBottom
    DoubleBuffered = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentDoubleBuffered = False
    ParentFont = False
    TabOrder = 2
    ExplicitTop = 316
    ExplicitWidth = 797
    inherited StatusBar: TStatusBar
      Width = 797
      ExplicitWidth = 797
    end
  end
  object PopupMenu: TPopupMenu
    Left = 88
    Top = 128
    object CopyCell: TMenuItem
      Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100
      OnClick = CopyCellClick
    end
    object SSRSearch: TMenuItem
      Caption = #1055#1086#1080#1089#1082
      object SSRSearchFast: TMenuItem
        Caption = #1041#1099#1089#1090#1088#1099#1081
        Checked = True
      end
      object SSRSearchAccurate: TMenuItem
        Caption = #1052#1072#1082#1089#1080#1084#1072#1083#1100#1085#1086' '#1090#1086#1095#1085#1099#1081
        Enabled = False
      end
    end
  end
  object ADOQuery: TFDQuery
    Connection = DM.Connect
    Transaction = DM.Read
    UpdateTransaction = DM.Write
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    Left = 30
    Top = 152
  end
end
