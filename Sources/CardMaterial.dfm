object FormCardMaterial: TFormCardMaterial
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1050#1072#1088#1090#1086#1095#1082#1072' '#1084#1072#1090#1077#1088#1080#1072#1083#1072
  ClientHeight = 188
  ClientWidth = 509
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object StringGrid: TStringGrid
    Left = 0
    Top = 100
    Width = 509
    Height = 47
    Align = alClient
    DefaultRowHeight = 20
    DefaultDrawing = False
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
    TabOrder = 3
    OnDrawCell = StringGridDrawCell
  end
  object Memo: TMemo
    Left = 0
    Top = 25
    Width = 509
    Height = 72
    Align = alTop
    BevelInner = bvNone
    BevelOuter = bvSpace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ScrollBars = ssVertical
    TabOrder = 1
  end
  object PanelTop: TPanel
    Left = 0
    Top = 0
    Width = 509
    Height = 25
    Align = alTop
    BevelOuter = bvNone
    Caption = 'PanelTop'
    ShowCaption = False
    TabOrder = 0
    DesignSize = (
      509
      25)
    object LabelCode: TLabel
      Left = 8
      Top = 5
      Width = 81
      Height = 13
      Caption = #1050#1086#1076' '#1084#1072#1090#1077#1088#1080#1072#1083#1072':'
    end
    object EditCode: TEdit
      Left = 95
      Top = 2
      Width = 411
      Height = 21
      TabStop = False
      Anchors = [akLeft, akTop, akRight]
      Color = 14802912
      ReadOnly = True
      TabOrder = 0
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 147
    Width = 509
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    Caption = 'PanelBottom'
    ShowCaption = False
    TabOrder = 4
    DesignSize = (
      509
      41)
    object ButtonSave: TButton
      Left = 295
      Top = 8
      Width = 100
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      Default = True
      TabOrder = 0
      OnClick = ButtonSaveClick
    end
    object ButtonClose: TButton
      Left = 401
      Top = 8
      Width = 100
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = #1054#1090#1084#1077#1085#1072
      TabOrder = 1
      OnClick = ButtonCloseClick
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 97
    Width = 509
    Height = 3
    Align = alTop
    BevelOuter = bvNone
    Caption = 'PanelSeparator'
    ShowCaption = False
    TabOrder = 2
  end
  object ADOQueryTemp: TFDQuery
    Connection = DM.Connect
    Transaction = DM.Read
    UpdateTransaction = DM.Write
    Left = 145
    Top = 40
  end
end
