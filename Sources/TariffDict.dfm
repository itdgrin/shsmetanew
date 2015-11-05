object fTariffDict: TfTariffDict
  Left = 0
  Top = 0
  Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1090#1072#1088#1080#1092#1086#1074
  ClientHeight = 430
  ClientWidth = 549
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object pgc: TPageControl
    Left = 3
    Top = 3
    Width = 543
    Height = 432
    ActivePage = ts1
    Align = alCustom
    Anchors = [akLeft, akTop, akRight, akBottom]
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    MultiLine = True
    ParentFont = False
    TabHeight = 1
    TabOrder = 0
    TabPosition = tpBottom
    TabStop = False
    TabWidth = 140
    OnChange = pgcChange
    object ts1: TTabSheet
      Caption = #1058#1072#1088#1080#1092#1099' '#1087#1086' '#1079#1072#1088#1087#1083#1072#1090#1077
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object spl1: TSplitter
        Left = 180
        Top = 30
        Height = 393
        ExplicitLeft = 248
        ExplicitTop = 72
        ExplicitHeight = 100
      end
      object pnlLeft: TPanel
        Left = 0
        Top = 30
        Width = 180
        Height = 393
        Align = alLeft
        BevelOuter = bvSpace
        Caption = 'pnlLeft'
        Constraints.MinWidth = 180
        TabOrder = 1
        object grCategory: TJvDBGrid
          Left = 1
          Top = 1
          Width = 178
          Height = 391
          Align = alClient
          DataSource = dsCategory
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnDrawColumnCell = grStavkaDrawColumnCell
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
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'COEF'
              Title.Alignment = taCenter
              Title.Caption = #1050'-'#1092
              Width = 46
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SUMMA'
              Title.Alignment = taCenter
              Title.Caption = #1057#1091#1084#1084#1072
              Width = 63
              Visible = True
            end>
        end
      end
      object pnlClient: TPanel
        Left = 183
        Top = 30
        Width = 352
        Height = 393
        Align = alClient
        BevelOuter = bvSpace
        Caption = 'pnlClient'
        TabOrder = 2
        object grStavka: TJvDBGrid
          Left = 1
          Top = 1
          Width = 350
          Height = 391
          Align = alClient
          DataSource = dsStavka
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          ParentFont = False
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnDrawColumnCell = grStavkaDrawColumnCell
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
              FieldName = 'MONTH_YEAR'
              Title.Alignment = taCenter
              Title.Caption = #1052#1077#1089#1103#1094
              Width = 38
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'STAVKA_M_RAB'
              Title.Alignment = taCenter
              Title.Caption = #1075'. '#1052#1080#1085#1089#1082
              Width = 38
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'STAVKA_RB_RAB'
              Title.Alignment = taCenter
              Title.Caption = #1041#1088#1077#1089#1090#1089#1082#1072#1103
              Width = 38
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'STAVKA_RB_RAB'
              Title.Alignment = taCenter
              Title.Caption = #1042#1080#1090#1077#1073#1089#1082#1072#1103
              Width = 38
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'STAVKA_RB_RAB'
              Title.Alignment = taCenter
              Title.Caption = #1043#1088#1086#1076#1085#1077#1085#1089#1082#1072#1103
              Width = 38
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'STAVKA_RB_RAB'
              Title.Alignment = taCenter
              Title.Caption = #1043#1086#1084#1077#1083#1100#1089#1082#1072#1103
              Width = 38
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'STAVKA_RB_RAB'
              Title.Alignment = taCenter
              Title.Caption = #1052#1080#1085#1089#1082#1072#1103
              Width = 38
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'STAVKA_RB_RAB'
              Title.Alignment = taCenter
              Title.Caption = #1052#1086#1075#1080#1083#1077#1074#1089#1082#1072#1103
              Width = 60
              Visible = True
            end>
        end
      end
      object pnlTop: TPanel
        Left = 0
        Top = 0
        Width = 535
        Height = 30
        Align = alTop
        BevelOuter = bvSpace
        TabOrder = 0
        object lbl1: TLabel
          Left = 8
          Top = 5
          Width = 55
          Height = 13
          Caption = #1090#1072#1088#1080#1092#1099' '#1085#1072
        end
        object lbl2: TLabel
          Left = 192
          Top = 5
          Width = 166
          Height = 13
          Caption = #1087#1086' '#1088#1077#1089#1087#1091#1073#1083#1080#1082#1077' '#1089#1090#1072#1074#1082#1072' 4 '#1088#1072#1079#1088#1103#1076#1072
        end
        object dbedtInDate: TDBEdit
          Left = 67
          Top = 5
          Width = 121
          Height = 21
          DataField = 'MONTH_YEAR2'
          DataSource = dsStavka
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object dbedtSTAVKA_M_RAB: TDBEdit
          Left = 364
          Top = 5
          Width = 121
          Height = 21
          DataField = 'STAVKA_M_RAB'
          DataSource = dsStavka
          TabOrder = 1
        end
      end
    end
    object ts2: TTabSheet
      Caption = #1057#1090#1072#1090#1080#1089#1090#1080#1095#1077#1089#1082#1080#1077' '#1080#1085#1076#1077#1082#1089#1099
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object pnlTop1: TPanel
        Left = 0
        Top = 0
        Width = 535
        Height = 30
        Align = alTop
        BevelOuter = bvSpace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object lbl3: TLabel
          Left = 7
          Top = 5
          Width = 59
          Height = 13
          Caption = #1048#1085#1076#1077#1082#1089#1099' '#1079#1072
        end
        object seYear: TSpinEdit
          Left = 153
          Top = 3
          Width = 56
          Height = 22
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxValue = 2100
          MinValue = 1900
          ParentFont = False
          TabOrder = 1
          Value = 2014
          OnChange = seYearChange
        end
        object cbbFromMonth: TComboBox
          Left = 72
          Top = 3
          Width = 75
          Height = 21
          Style = csDropDownList
          DropDownCount = 12
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ItemIndex = 0
          ParentFont = False
          TabOrder = 0
          Text = #1071#1085#1074#1072#1088#1100
          OnChange = seYearChange
          Items.Strings = (
            #1071#1085#1074#1072#1088#1100
            #1060#1077#1074#1088#1072#1083#1100
            #1052#1072#1088#1090
            #1040#1087#1088#1077#1083#1100
            #1052#1072#1081
            #1048#1102#1085#1100
            #1048#1102#1083#1100
            #1040#1074#1075#1091#1089#1090
            #1057#1077#1085#1090#1103#1073#1088#1100
            #1054#1082#1090#1103#1073#1088#1100
            #1053#1086#1103#1073#1088#1100
            #1044#1077#1082#1072#1073#1088#1100)
        end
      end
      object pnlClient1: TPanel
        Left = 0
        Top = 30
        Width = 535
        Height = 393
        Align = alClient
        BevelOuter = bvSpace
        Caption = 'pnlClient1'
        TabOrder = 1
        object grIndexes: TJvDBGrid
          Left = 1
          Top = 1
          Width = 533
          Height = 391
          Align = alClient
          DataSource = dsIndexes
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          ParentFont = False
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnDrawColumnCell = grStavkaDrawColumnCell
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
              FieldName = 'param_name'
              Title.Alignment = taCenter
              Title.Caption = #1050#1086#1085#1089#1090#1072#1085#1090#1099
              Width = 385
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'code'
              Title.Alignment = taCenter
              Title.Caption = #1055#1089#1077#1074#1076#1086#1085#1080#1084
              Width = 63
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VALUE'
              Title.Alignment = taCenter
              Title.Caption = #1047#1085#1072#1095#1077#1085#1080#1077
              Width = 66
              Visible = True
            end>
        end
      end
    end
  end
  object qrCategory: TFDQuery
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
      '       ROUND(`COEF` * :IN_STAVKA) AS SUMMA,'
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
        Name = 'IN_STAVKA'
        DataType = ftBCD
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'IN_DATE'
        DataType = ftDate
        ParamType = ptInput
        Value = Null
      end>
  end
  object dsCategory: TDataSource
    DataSet = qrCategory
    Left = 152
    Top = 342
  end
  object qrStavka: TFDQuery
    AfterScroll = qrStavkaAfterScroll
    Connection = DM.Connect
    Transaction = DM.Read
    UpdateTransaction = DM.Write
    FormatOptions.AssignedValues = [fvDefaultParamDataType, fvFmtDisplayNumeric]
    FormatOptions.DefaultParamDataType = ftBCD
    FormatOptions.FmtDisplayNumeric = '### ### ### ### ### ### ##0.####'
    SQL.Strings = (
      'SELECT '
      '  `STAVKA_ID`,'
      '  `YEAR`,'
      '  `MONAT`,'
      '  `STAVKA_RB_RAB`,'
      '  `STAVKA_RB_MACH`,'
      '  `STAVKA_M_RAB`,'
      '  `STAVKA_M_MACH`,'
      '  CONVERT(CONCAT(`YEAR`,'#39'-'#39',`MONAT`,'#39'-01'#39'), DATE) AS MONTH_YEAR,'
      '  CONVERT(CONCAT(`YEAR`,'#39'-'#39',`MONAT`,'#39'-01'#39'), DATE) AS MONTH_YEAR2'
      'FROM '
      '  `stavka`'
      'ORDER BY `YEAR` DESC, `MONAT` DESC  ')
    Left = 463
    Top = 342
    object qrStavkaSTAVKA_ID: TWordField
      AutoGenerateValue = arAutoInc
      FieldName = 'STAVKA_ID'
      Origin = 'STAVKA_ID'
      ProviderFlags = [pfInWhere, pfInKey]
      DisplayFormat = '### ### ### ### ### ### ##0.####'
    end
    object qrStavkaYEAR: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'YEAR'
      Origin = 'YEAR'
      DisplayFormat = '### ### ### ### ### ### ##0.####'
    end
    object qrStavkaMONAT: TWordField
      AutoGenerateValue = arDefault
      FieldName = 'MONAT'
      Origin = 'MONAT'
      DisplayFormat = '### ### ### ### ### ### ##0.####'
    end
    object qrStavkaSTAVKA_RB_RAB: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'STAVKA_RB_RAB'
      Origin = 'STAVKA_RB_RAB'
      DisplayFormat = '### ### ### ### ### ### ##0.####'
    end
    object qrStavkaSTAVKA_RB_MACH: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'STAVKA_RB_MACH'
      Origin = 'STAVKA_RB_MACH'
      DisplayFormat = '### ### ### ### ### ### ##0.####'
    end
    object qrStavkaSTAVKA_M_RAB: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'STAVKA_M_RAB'
      Origin = 'STAVKA_M_RAB'
      DisplayFormat = '### ### ### ### ### ### ##0.####'
    end
    object qrStavkaSTAVKA_M_MACH: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'STAVKA_M_MACH'
      Origin = 'STAVKA_M_MACH'
      DisplayFormat = '### ### ### ### ### ### ##0.####'
    end
    object qrStavkaMONTH_YEAR: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'MONTH_YEAR'
      Origin = 'MONTH_YEAR'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = 'yyyy MMMM'
    end
    object qrStavkaMONTH_YEAR2: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'MONTH_YEAR2'
      Origin = 'MONTH_YEAR2'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = '1 mmmm yyyy'
    end
  end
  object dsStavka: TDataSource
    DataSet = qrStavka
    Left = 496
    Top = 342
  end
  object qrIndexes: TFDQuery
    Connection = DM.Connect
    Transaction = DM.Read
    UpdateTransaction = DM.Write
    FormatOptions.AssignedValues = [fvDefaultParamDataType, fvFmtDisplayNumeric]
    FormatOptions.DefaultParamDataType = ftBCD
    FormatOptions.FmtDisplayNumeric = '### ### ### ### ### ### ##0.####'
    SQL.Strings = (
      'SELECT id_unidictparam,code,param_name,param_description,'
      'FN_getParamValue(code, :month, :year) AS VALUE'
      'FROM '
      '  unidictparam'
      'WHERE id_unidicttype=2')
    Left = 287
    Top = 270
    ParamData = <
      item
        Name = 'MONTH'
        DataType = ftBCD
        ParamType = ptInput
        Value = 10000c
      end
      item
        Name = 'YEAR'
        DataType = ftBCD
        ParamType = ptInput
        Value = 20150000c
      end>
  end
  object dsIndexes: TDataSource
    DataSet = qrIndexes
    Left = 320
    Top = 270
  end
end
