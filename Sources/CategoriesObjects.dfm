object fCategoriesObjects: TfCategoriesObjects
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = #1042#1080#1076#1099' '#1089#1090#1088#1086#1080#1090#1077#1083#1100#1089#1090#1074#1072
  ClientHeight = 140
  ClientWidth = 234
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object grMain: TJvDBGrid
    Left = 0
    Top = 0
    Width = 234
    Height = 140
    Align = alClient
    DataSource = dsMain
    DrawingStyle = gdsClassic
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    PopupMenu = pm1
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDrawColumnCell = grMainDrawColumnCell
    AutoAppend = False
    IniStorage = FormStorage
    OnTitleBtnClick = grMainTitleBtnClick
    ScrollBars = ssNone
    AutoSizeColumns = True
    AutoSizeColumnIndex = 1
    SelectColumnsDialogStrings.Caption = 'Select columns'
    SelectColumnsDialogStrings.OK = '&OK'
    SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
    CanDelete = False
    EditControls = <>
    ReduceFlicker = False
    RowsHeight = 17
    TitleRowHeight = 17
    WordWrap = True
    WordWrapAllFields = True
    Columns = <
      item
        Expanded = False
        FieldName = 'CAT_ID'
        Title.Alignment = taCenter
        Title.Caption = #8470' '#1087'/'#1087
        Width = 44
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cat_name'
        Title.Alignment = taCenter
        Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        Width = 172
        Visible = True
      end>
  end
  object FormStorage: TJvFormStorage
    AppStorage = FormMain.AppIni
    AppStoragePath = '%FORM_NAME%\'
    StoredValues = <>
    Left = 24
    Top = 32
  end
  object qrMain: TFDQuery
    Connection = DM.Connect
    Transaction = DM.Read
    UpdateTransaction = DM.Write
    UpdateOptions.UpdateTableName = 'objcategory'
    UpdateOptions.KeyFields = 'CAT_ID'
    SQL.Strings = (
      'SELECT * FROM objcategory'
      'ORDER BY 1')
    Left = 24
    Top = 72
  end
  object dsMain: TDataSource
    DataSet = qrMain
    Left = 67
    Top = 72
  end
  object pm1: TPopupMenu
    Left = 120
    Top = 72
    object mN1: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      OnClick = mN1Click
    end
    object mN2: TMenuItem
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      OnClick = mN2Click
    end
    object mN3: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100
      OnClick = mN3Click
    end
  end
end
