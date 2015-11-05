object fInstructionHelp: TfInstructionHelp
  Left = 0
  Top = 0
  Caption = #1052#1077#1090#1086#1076#1080#1095#1077#1082#1080#1077' '#1091#1082#1072#1079#1072#1085#1080#1103
  ClientHeight = 365
  ClientWidth = 812
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  ShowHint = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object spl1: TSplitter
    Left = 380
    Top = 35
    Height = 298
    ExplicitLeft = 576
    ExplicitTop = 104
    ExplicitHeight = 100
  end
  object pnl1: TPanel
    Left = 0
    Top = 333
    Width = 812
    Height = 32
    Align = alBottom
    TabOrder = 3
    DesignSize = (
      812
      32)
    object btn1: TBitBtn
      Left = 3
      Top = 3
      Width = 126
      Height = 25
      Caption = #1054#1090#1082#1088#1099#1090#1100' '#1076#1086#1082#1091#1084#1077#1085#1090
      TabOrder = 0
      OnClick = tvDocumentsDblClick
    end
    object btn2: TBitBtn
      Left = 734
      Top = 3
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = #1047#1072#1082#1088#1099#1090#1100
      TabOrder = 1
      OnClick = btn2Click
    end
  end
  object tvDocuments: TJvDBTreeView
    AlignWithMargins = True
    Left = 3
    Top = 38
    Width = 374
    Height = 292
    DataSource = dsTreeData
    MasterField = 'doc_id'
    DetailField = 'parent_id'
    IconField = 'doc_type'
    ItemField = 'doc_name'
    StartMasterValue = '2'
    UseFilter = True
    PersistentNode = True
    DragMode = dmAutomatic
    HideSelection = False
    Indent = 19
    Align = alLeft
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    TabOrder = 2
    OnDblClick = tvDocumentsDblClick
    ParentFont = False
    RowSelect = True
    Mirror = False
  end
  object grMain1: TJvDBGrid
    Left = 383
    Top = 35
    Width = 429
    Height = 298
    Align = alClient
    DataSource = dsTreeData
    DrawingStyle = gdsClassic
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ParentFont = False
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDrawColumnCell = grMain1DrawColumnCell
    OnDblClick = tvDocumentsDblClick
    AutoAppend = False
    AutoSizeColumns = True
    SelectColumnsDialogStrings.Caption = 'Select columns'
    SelectColumnsDialogStrings.OK = '&OK'
    SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
    CanDelete = False
    EditControls = <>
    AutoSizeRows = False
    ReduceFlicker = False
    RowsHeight = 17
    TitleRowHeight = 17
    WordWrap = True
    WordWrapAllFields = True
    Columns = <
      item
        Expanded = False
        FieldName = 'doc_name'
        Title.Alignment = taCenter
        Title.Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
        Width = 117
        Visible = True
      end
      item
        Expanded = False
        Title.Alignment = taCenter
        Title.Caption = #1044#1072#1090#1072
        Width = 48
        Visible = True
      end
      item
        Expanded = False
        Title.Alignment = taCenter
        Title.Caption = #1054#1088#1075#1072#1085
        Width = 57
        Visible = True
      end
      item
        Expanded = False
        Title.Alignment = taCenter
        Title.Caption = #1058#1080#1087' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
        Width = 88
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'doc_description'
        Title.Alignment = taCenter
        Title.Caption = #1054#1087#1080#1089#1072#1085#1080#1077
        Width = 98
        Visible = True
      end>
  end
  object pnl2: TPanel
    Left = 0
    Top = 0
    Width = 812
    Height = 35
    Align = alTop
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    DesignSize = (
      812
      35)
    object lbl3: TLabel
      Left = 7
      Top = 9
      Width = 34
      Height = 13
      Caption = #1055#1086#1080#1089#1082':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object btnSearch: TSpeedButton
      Left = 734
      Top = 4
      Width = 73
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1055#1086#1080#1089#1082
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000C40E0000C40E00001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        8888888888888888888800000888880000080F000888880F00080F000888880F
        0008000000080000000800F000000F00000800F000800F00000800F000800F00
        00088000000000000088880F00080F0008888800000800000888888000888000
        88888880F08880F0888888800088800088888888888888888888}
      ParentFont = False
      OnClick = btnSearchClick
      ExplicitLeft = 730
    end
    object edtSearch: TEdit
      Left = 47
      Top = 6
      Width = 681
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      TextHint = #1042#1074#1077#1076#1080#1090#1077' '#1090#1077#1082#1089#1090' '#1076#1083#1103' '#1087#1086#1080#1089#1082#1072'...'
    end
  end
  object qrTreeData: TFDQuery
    BeforeOpen = qrTreeDataBeforeOpen
    Connection = DM.Connect
    Transaction = DM.Read
    UpdateTransaction = DM.Write
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    SQL.Strings = (
      '/*'
      'SELECT * '
      'FROM '
      '  `doc` '
      'WHERE (doc_id>=2 and doc_id<=4) or (doc_id>=9 and doc_id<=35)'
      'ORDER BY doc_type, doc_name'
      '*/'
      'SELECT *'
      'FROM '
      '  `doc` dm'
      
        'WHERE /* ((doc_id>=2 and doc_id<=4) or (doc_id>=9 and doc_id<=35' +
        ') or (doc_id>=37 and doc_id<=41)) */'
      
        '  ((dm.parent_id=2) or (SELECT d.parent_id FROM doc d where d.do' +
        'c_id=dm.parent_id)=2)'
      
        'AND UPPER(CONCAT(IFNULL(doc_name, ""), IFNULL(doc_description, "' +
        '"))) LIKE UPPER(:search)'
      'ORDER BY CONCAT('
      
        'IF(parent_id<>2, CONCAT("0000000002", CONCAT(LEFT("0000000000", ' +
        '10-LENGTH(parent_id)), parent_id)), '
      'CONCAT(LEFT("0000000000", 10-LENGTH(parent_id)), parent_id)),'
      
        'IF(doc_type=0, CONCAT(LEFT("0000000000", 10-LENGTH(doc_id)), doc' +
        '_id), ""), doc_type'
      '), doc_name')
    Left = 41
    Top = 38
    ParamData = <
      item
        Name = 'SEARCH'
        DataType = ftString
        ParamType = ptInput
        Value = ''
      end>
  end
  object dsTreeData: TDataSource
    DataSet = qrTreeData
    Left = 40
    Top = 86
  end
  object FormStorage: TJvFormStorage
    AppStorage = FormMain.AppIni
    AppStoragePath = '%FORM_NAME%\'
    Options = []
    StoredProps.Strings = (
      'tvDocuments.Width')
    StoredValues = <>
    Left = 40
    Top = 144
  end
end
