object fCategoryList: TfCategoryList
  Left = 0
  Top = 0
  Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1084#1077#1078#1088#1072#1079#1088#1103#1076#1085#1099#1093' '#1082#1086#1101#1092#1092#1080#1094#1080#1077#1085#1090#1086#1074
  ClientHeight = 530
  ClientWidth = 374
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
  PixelsPerInch = 96
  TextHeight = 13
  object grCategory: TJvDBGrid
    Left = 0
    Top = 0
    Width = 374
    Height = 530
    Align = alClient
    DataSource = dsCategory
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDrawColumnCell = grCategoryDrawColumnCell
    AutoSizeColumns = True
    SelectColumnsDialogStrings.Caption = 'Select columns'
    SelectColumnsDialogStrings.OK = '&OK'
    SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
    EditControls = <>
    RowsHeight = 17
    TitleRowHeight = 17
    Columns = <
      item
        Expanded = False
        FieldName = 'VALUE'
        Title.Alignment = taCenter
        Title.Caption = #1056#1072#1079#1088#1103#1076
        Width = 185
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COEF'
        Title.Alignment = taCenter
        Title.Caption = #1050#1086#1101#1092#1092#1080#1094#1080#1077#1085#1090
        Width = 171
        Visible = True
      end>
  end
  object dsCategory: TDataSource
    DataSet = qrCategory
    Left = 152
    Top = 342
  end
  object qrCategory: TFDQuery
    BeforeOpen = qrCategoryBeforeOpen
    Connection = DM.Connect
    Transaction = DM.Read
    UpdateTransaction = DM.Write
    FormatOptions.AssignedValues = [fvDefaultParamDataType, fvFmtDisplayNumeric]
    FormatOptions.DefaultParamDataType = ftBCD
    FormatOptions.FmtDisplayNumeric = '### ### ### ### ### ### ##0.####'
    SQL.Strings = (
      'SELECT `CATEGORY_ID`,'
      '       `VALUE`,'
      '       `COEF`,'
      '    /*   ROUND(`COEF` * :IN_STAVKA) AS SUMMA, */'
      '       `DATE_BEG`'
      'FROM `category`'
      'WHERE `DATE_BEG` ='
      '      ('
      '        SELECT MAX(`category`.`DATE_BEG`)'
      '        FROM `category`'
      '        WHERE `category`.`DATE_BEG` <= :IN_DATE'
      '        LIMIT 1'
      '      )'
      'ORDER BY `VALUE`')
    Left = 119
    Top = 342
    ParamData = <
      item
        Name = 'IN_DATE'
        DataType = ftDate
        ParamType = ptInput
        Value = Null
      end>
  end
end
