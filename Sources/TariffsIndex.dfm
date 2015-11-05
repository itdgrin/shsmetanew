object FormTariffsIndex: TFormTariffsIndex
  Left = 0
  Top = 0
  Caption = #1058#1072#1088#1080#1092#1099' '#1087#1086' '#1089#1090#1072#1090#1080#1089#1090#1080#1095#1077#1089#1082#1080#1084' '#1080#1085#1076#1077#1082#1089#1072#1084
  ClientHeight = 400
  ClientWidth = 729
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
  WindowState = wsMaximized
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid: TDBGrid
    Left = 0
    Top = 25
    Width = 729
    Height = 346
    Align = alClient
    DataSource = DataSourceTariffsIndex
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick, dgTitleHotTrack]
    PopupMenu = PopupMenu
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnColEnter = DBGridColEnter
    OnDrawColumnCell = DBGridDrawColumnCell
    OnKeyPress = DBGridKeyPress
    OnMouseWheel = DBGridMouseWheel
    OnMouseWheelDown = DBGridMouseWheelDown
    OnMouseWheelUp = DBGridMouseWheelUp
  end
  object PanelTop: TPanel
    Left = 0
    Top = 0
    Width = 729
    Height = 25
    Align = alTop
    BevelOuter = bvLowered
    DoubleBuffered = True
    ParentBackground = False
    ParentDoubleBuffered = False
    TabOrder = 0
    DesignSize = (
      729
      25)
    object LabelData: TLabel
      Left = 8
      Top = 5
      Width = 97
      Height = 13
      Caption = #1048#1089#1093#1086#1076#1085#1099#1077' '#1076#1072#1085#1085#1099#1077':'
    end
    object LabelRecordCount: TLabel
      Left = 308
      Top = 6
      Width = 99
      Height = 13
      Caption = #1047#1072#1087#1080#1089#1077#1081' '#1074' '#1090#1072#1073#1083#1080#1094#1077':'
    end
    object LabelSearch: TLabel
      Left = 464
      Top = 6
      Width = 34
      Height = 13
      Caption = #1055#1086#1080#1089#1082':'
    end
    object EditMonth: TEdit
      Left = 111
      Top = 2
      Width = 120
      Height = 21
      TabStop = False
      Alignment = taCenter
      Color = 13619151
      ReadOnly = True
      TabOrder = 0
      Text = #1071#1085#1074#1072#1088#1100' 2012 '#1075#1086#1076#1072
    end
    object EditVAT: TEdit
      Left = 237
      Top = 2
      Width = 65
      Height = 21
      TabStop = False
      Alignment = taCenter
      Color = 13619151
      ReadOnly = True
      TabOrder = 1
      Text = #1073#1077#1079' '#1053#1044#1057
    end
    object EditRecordCount: TEdit
      Left = 413
      Top = 2
      Width = 45
      Height = 21
      TabStop = False
      Color = 13619151
      ReadOnly = True
      TabOrder = 2
    end
    object EditSearch: TEdit
      Left = 504
      Top = 2
      Width = 221
      Height = 21
      Hint = 
        #1042#1074#1077#1076#1080#1090#1077' '#1089#1083#1086#1074#1072' '#1095#1077#1088#1077#1079' '#1087#1088#1086#1073#1077#1083' '#1080' '#1085#1072#1078#1084#1080#1090#1077' - Enter, '#1076#1083#1103' '#1086#1095#1080#1089#1090#1082#1080' '#1085#1072#1078#1084#1080#1090 +
        #1077' - Esc'
      Anchors = [akLeft, akTop, akRight]
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnKeyPress = EditSearchKeyPress
    end
  end
  object PanelBottom: TPanel
    Left = 0
    Top = 371
    Width = 729
    Height = 29
    Align = alBottom
    ParentBackground = False
    TabOrder = 2
    DesignSize = (
      729
      29)
    object BitBtnFind: TBitBtn
      Left = 4
      Top = 2
      Width = 150
      Height = 25
      Anchors = [akLeft]
      Caption = 'F6 '#1055#1086#1080#1089#1082
      Enabled = False
      TabOrder = 0
    end
    object BitBtnLoad: TBitBtn
      Left = 160
      Top = 2
      Width = 150
      Height = 25
      Anchors = [akLeft]
      Caption = #1047#1072#1075#1088#1091#1079#1082#1072
      Enabled = False
      TabOrder = 1
    end
  end
  object PopupMenu: TPopupMenu
    Left = 80
    Top = 64
    object PopupMenuCopy: TMenuItem
      Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100
      OnClick = PopupMenuCopyClick
    end
  end
  object DataSourceTariffsIndex: TDataSource
    DataSet = ADOQueryTariffsIndex
    Left = 200
    Top = 112
  end
  object ADOQueryTariffsIndex: TFDQuery
    AfterScroll = ADOQueryTariffsIndexAfterScroll
    Connection = DM.Connect
    Transaction = DM.Read
    UpdateTransaction = DM.Write
    Left = 104
    Top = 120
  end
end
