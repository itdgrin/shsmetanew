object Calculator: TCalculator
  Left = 0
  Top = 0
  Width = 273
  Height = 138
  TabOrder = 0
  OnExit = FrameExit
  object Panel: TPanel
    Left = 0
    Top = 0
    Width = 273
    Height = 138
    Align = alClient
    BevelKind = bkFlat
    BevelOuter = bvNone
    TabOrder = 0
    object lbCoast: TLabel
      Left = 40
      Top = 73
      Width = 97
      Height = 13
      Caption = #1062#1077#1085#1072' '#1089' '#1053#1044#1057', '#1088#1091#1073':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbNDS: TLabel
      Left = 93
      Top = 29
      Width = 44
      Height = 13
      Caption = #1053#1044#1057', %:'
    end
    object lbCount: TLabel
      Left = 77
      Top = 51
      Width = 60
      Height = 13
      Caption = #1050#1086#1083'-'#1074#1086', '#1096#1090':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lbPriceNDS: TLabel
      Left = 21
      Top = 7
      Width = 116
      Height = 13
      Caption = #1057#1090#1086#1080#1084#1086#1089#1090#1100' c '#1053#1044#1057', '#1088#1091#1073':'
    end
    object edtCoast: TJvEdit
      Left = 144
      Top = 70
      Width = 121
      Height = 21
      BevelInner = bvNone
      BevelKind = bkFlat
      BevelOuter = bvNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      Text = ''
      OnChange = edtCoastChange
      NumbersOnly = True
    end
    object edtCount: TJvEdit
      Left = 144
      Top = 48
      Width = 121
      Height = 21
      BevelInner = bvNone
      BevelKind = bkFlat
      BevelOuter = bvNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Text = ''
      OnChange = edtCountChange
      OnKeyPress = edtCountKeyPress
    end
    object edtNDS: TJvEdit
      Left = 144
      Top = 26
      Width = 121
      Height = 21
      BevelInner = bvNone
      BevelKind = bkFlat
      BevelOuter = bvNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
      Text = ''
      NumbersOnly = True
    end
    object edtPriceNDS: TJvEdit
      Left = 144
      Top = 4
      Width = 121
      Height = 21
      BevelInner = bvNone
      BevelKind = bkFlat
      BevelOuter = bvNone
      TabOrder = 3
      Text = ''
      OnChange = edtPriceNDSChange
      NumbersOnly = True
    end
    object ButtonPanel: TPanel
      Left = 0
      Top = 96
      Width = 269
      Height = 38
      Align = alBottom
      BevelEdges = [beTop]
      BevelKind = bkFlat
      BevelOuter = bvNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      object btnSetResult: TButton
        AlignWithMargins = True
        Left = 184
        Top = 5
        Width = 80
        Height = 26
        Margins.Left = 0
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Align = alRight
        Caption = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1100
        TabOrder = 0
        OnClick = btnSetResultClick
      end
      object btnHide: TButton
        AlignWithMargins = True
        Left = 77
        Top = 5
        Width = 102
        Height = 26
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Align = alRight
        Caption = #1057#1082#1088#1099#1090#1100
        TabOrder = 1
        OnClick = btnHideClick
      end
    end
  end
end
