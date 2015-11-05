object fOrganizationsEx: TfOrganizationsEx
  Left = 0
  Top = 0
  ActiveControl = grMain
  Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1086#1088#1075#1072#1085#1080#1079#1072#1094#1080#1081
  ClientHeight = 410
  ClientWidth = 796
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object lbl2: TLabel
    Left = 0
    Top = 326
    Width = 796
    Height = 13
    Align = alBottom
    Caption = '   '#1055#1086#1083#1085#1086#1077' '#1085#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1086#1088#1075#1072#1085#1080#1079#1072#1094#1080#1080':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ExplicitWidth = 192
  end
  object grMain: TJvDBGrid
    AlignWithMargins = True
    Left = 3
    Top = 39
    Width = 790
    Height = 284
    Align = alClient
    DataSource = dsMain
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDrawColumnCell = grMainDrawColumnCell
    OnDblClick = grMainDblClick
    OnTitleClick = grMainTitleClick
    IniStorage = FormStorage
    PostOnEnterKey = True
    ShowCellHint = True
    SelectColumnsDialogStrings.Caption = 'Select columns'
    SelectColumnsDialogStrings.OK = '&OK'
    SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
    CanDelete = False
    EditControls = <>
    RowsHeight = 17
    TitleRowHeight = 17
    WordWrap = True
    WordWrapAllFields = True
    Columns = <
      item
        Expanded = False
        FieldName = 'CLIENT_ID'
        Title.Alignment = taCenter
        Title.Caption = #1050#1086#1076
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'NAME'
        Title.Alignment = taCenter
        Title.Caption = #1053#1072#1080#1084'. '#1086#1088#1075#1072#1085#1080#1079#1072#1094#1080#1080
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODE'
        Title.Alignment = taCenter
        Title.Caption = #1050#1086#1076' '#1073#1072#1085#1082#1072
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BANK'
        Title.Alignment = taCenter
        Title.Caption = #1053#1072#1080#1084'. '#1073#1072#1085#1082#1072
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ACCOUNT'
        Title.Alignment = taCenter
        Title.Caption = #8470' '#1089#1095#1105#1090#1072
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UNN'
        Title.Alignment = taCenter
        Title.Caption = #1059#1053#1053
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OKPO'
        Title.Alignment = taCenter
        Title.Caption = #1054#1050#1055#1054
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ADDRESS'
        Title.Alignment = taCenter
        Title.Caption = #1040#1076#1088#1077#1089
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RUK_PROF'
        Title.Alignment = taCenter
        Title.Caption = #1056#1091#1082'. '#1076#1086#1083#1078#1085#1086#1089#1090#1100
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RUK_FIO'
        Title.Alignment = taCenter
        Title.Caption = #1060'.'#1048'.'#1054'.'
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PHONE'
        Title.Alignment = taCenter
        Title.Caption = #1058#1077#1083'./'#1092#1072#1082#1089
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CONTACT_FIO'
        Title.Alignment = taCenter
        Title.Caption = #1050#1086#1085#1090#1072#1082#1090'. '#1083#1080#1094#1086
        Width = 73
        Visible = True
      end>
  end
  object pnlBott: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 371
    Width = 790
    Height = 36
    Align = alBottom
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    DesignSize = (
      790
      36)
    object btnCancel: TBitBtn
      Left = 710
      Top = 6
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = #1054#1090#1084#1077#1085#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      Visible = False
      OnClick = btnCancelClick
    end
    object btnSelect: TBitBtn
      Left = 629
      Top = 6
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = #1042#1099#1073#1088#1072#1090#1100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Visible = False
      OnClick = btnSelectClick
    end
    object dbnvgr1: TDBNavigator
      Left = 5
      Top = 6
      Width = 180
      Height = 25
      DataSource = dsMain
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbEdit]
      Align = alCustom
      Hints.Strings = (
        #1053#1072' '#1087#1077#1088#1074#1091#1102' '#1079#1072#1087#1080#1089#1100
        #1055#1088#1077#1076#1099#1076#1091#1097#1072#1103' '#1079#1072#1087#1080#1089#1100
        #1057#1083#1077#1076#1091#1102#1097#1072#1103' '#1079#1072#1087#1080#1089#1100
        #1053#1072' '#1087#1086#1089#1083#1077#1076#1085#1102#1102' '#1079#1072#1087#1080#1089#1100
        #1053#1086#1074#1072#1103' '#1079#1072#1087#1080#1089#1100
        #1059#1076#1072#1083#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
        #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1079#1072#1087#1080#1089#1100
        #1057#1086#1093#1088#1072#1085#1080#1090#1100
        #1054#1090#1084#1077#1085#1080#1090#1100
        #1054#1073#1085#1086#1074#1080#1090#1100
        'Apply updates'
        'Cancel updates')
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      TabStop = True
    end
  end
  object pnl1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 790
    Height = 30
    Align = alTop
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    DesignSize = (
      790
      30)
    object lbl1: TLabel
      Left = 8
      Top = 8
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
      Left = 710
      Top = 4
      Width = 75
      Height = 22
      Anchors = [akTop, akRight]
      Caption = #1055#1086#1080#1089#1082
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000C40E0000C40E00001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        8888888888888888888800000888880000080F000888880F00080F000888880F
        0008000000080000000800F000000F00000800F000800F00000800F000800F00
        00088000000000000088880F00080F0008888800000800000888888000888000
        88888880F08880F0888888800088800088888888888888888888}
      OnClick = btnSearchClick
    end
    object edtSearch: TEdit
      Left = 48
      Top = 5
      Width = 656
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      TextHint = #1074#1074#1077#1076#1080#1090#1077' '#1089#1090#1088#1086#1082#1091' '#1076#1083#1103' '#1087#1086#1080#1089#1082#1072'...'
    end
  end
  object dbmmoFULL_NAME: TDBMemo
    AlignWithMargins = True
    Left = 3
    Top = 342
    Width = 790
    Height = 23
    Align = alBottom
    DataField = 'NAME'
    DataSource = dsMain
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 2
  end
  object qrMain: TFDQuery
    BeforeEdit = qrMainNewRecord
    OnNewRecord = qrMainNewRecord
    Connection = DM.Connect
    Transaction = DM.Read
    UpdateTransaction = DM.Write
    FormatOptions.AssignedValues = [fvDefaultParamDataType, fvFmtDisplayNumeric]
    FormatOptions.DefaultParamDataType = ftBCD
    FormatOptions.FmtDisplayNumeric = '### ### ### ### ### ### ##0.####'
    UpdateOptions.AssignedValues = [uvUpdateNonBaseFields]
    SQL.Strings = (
      'SELECT * FROM clients'
      'ORDER BY 1')
    Left = 31
    Top = 86
  end
  object dsMain: TDataSource
    DataSet = qrMain
    Left = 64
    Top = 86
  end
  object FormStorage: TJvFormStorage
    AppStorage = FormMain.AppIni
    AppStoragePath = '%FORM_NAME%\'
    Options = []
    StoredValues = <>
    Left = 32
    Top = 136
  end
end
