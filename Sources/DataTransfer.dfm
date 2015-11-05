object FormDataTransfer: TFormDataTransfer
  Left = 0
  Top = 0
  Caption = #1055#1077#1088#1077#1085#1086#1089' '#1076#1072#1085#1085#1099#1093
  ClientHeight = 421
  ClientWidth = 733
  Color = clBtnFace
  DoubleBuffered = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object ImageSplitterCenter: TImage
    Left = 425
    Top = 97
    Width = 5
    Height = 15
    Cursor = crHSplit
    AutoSize = True
  end
  object SplitterCenter: TSplitter
    Left = 353
    Top = 0
    Width = 5
    Height = 394
    ResizeStyle = rsUpdate
    ExplicitLeft = 361
    ExplicitTop = 8
  end
  object PanelBottomButtons: TPanel
    Left = 0
    Top = 394
    Width = 733
    Height = 27
    Align = alBottom
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 2
    object Button1: TButton
      Left = 3
      Top = 1
      Width = 110
      Height = 25
      Caption = #1054#1090#1082#1088#1099#1090#1100
      TabOrder = 0
    end
    object Button2: TButton
      Left = 119
      Top = 1
      Width = 110
      Height = 25
      Caption = #1055#1077#1088#1077#1085#1077#1089#1090#1080
      TabOrder = 1
    end
    object Button3: TButton
      Left = 235
      Top = 1
      Width = 110
      Height = 25
      Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100
      TabOrder = 2
    end
    object Button4: TButton
      Left = 351
      Top = 1
      Width = 110
      Height = 25
      Caption = #1059#1076#1072#1083#1080#1090#1100
      TabOrder = 3
    end
  end
  object PanelLeft: TPanel
    Left = 0
    Top = 0
    Width = 353
    Height = 394
    Align = alLeft
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 0
    object TreeView1: TTreeView
      Left = 0
      Top = 0
      Width = 353
      Height = 394
      Align = alClient
      Indent = 19
      TabOrder = 0
    end
  end
  object PanelRight: TPanel
    Left = 358
    Top = 0
    Width = 375
    Height = 394
    Align = alClient
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 1
    object TreeView2: TTreeView
      Left = 0
      Top = 0
      Width = 375
      Height = 394
      Align = alClient
      Indent = 19
      TabOrder = 0
    end
  end
end
