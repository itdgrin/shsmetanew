object fCalcResourceFactDiff: TfCalcResourceFactDiff
  Left = 0
  Top = 0
  Caption = #1056#1072#1089#1095#1077#1090' '#1086#1090#1082#1083#1086#1085#1077#1085#1080#1081
  ClientHeight = 491
  ClientWidth = 867
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
  object pgc: TPageControl
    Left = 0
    Top = 0
    Width = 867
    Height = 460
    ActivePage = ts2
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    MultiLine = True
    ParentFont = False
    TabOrder = 0
    object ts2: TTabSheet
      Caption = #1052#1072#1090#1077#1088#1080#1072#1083#1099
      ImageIndex = 1
      TabVisible = False
      object pnlMatClient: TPanel
        Left = 0
        Top = 0
        Width = 859
        Height = 450
        Align = alClient
        BevelOuter = bvNone
        Caption = 'pnlMatClient'
        TabOrder = 0
        object grMaterial: TJvDBGrid
          Left = 0
          Top = 0
          Width = 859
          Height = 431
          Align = alClient
          DataSource = dsMainData
          DrawingStyle = gdsClassic
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnDrawColumnCell = grMaterialDrawColumnCell
          AutoAppend = False
          IniStorage = FormStorage
          SelectColumnsDialogStrings.Caption = 'Select columns'
          SelectColumnsDialogStrings.OK = '&OK'
          SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
          CanDelete = False
          EditControls = <>
          AutoSizeRows = False
          ReduceFlicker = False
          RowsHeight = 17
          TitleRowHeight = 36
          WordWrap = True
          WordWrapAllFields = True
          Columns = <
            item
              Expanded = False
              FieldName = 'CODE'
              Title.Alignment = taCenter
              Title.Caption = #1050#1086#1076
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NAME'
              Title.Alignment = taCenter
              Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
              Width = 80
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'UNIT'
              Title.Alignment = taCenter
              Title.Caption = #1045#1076'. '#1080#1079#1084'.'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CNT'
              Title.Alignment = taCenter
              Title.Caption = #1050#1086#1083'-'#1074#1086
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'COAST'
              Title.Alignment = taCenter
              Title.Caption = #1062#1077#1085#1072
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'forecast_cost_index'
              Title.Alignment = taCenter
              Title.Caption = #1048#1085#1076#1077#1082#1089' '#1088#1086#1089#1090#1072
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PRICE'
              Title.Alignment = taCenter
              Title.Caption = #1057#1090#1086#1080#1084#1086#1089#1090#1100
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ZAC'
              Title.Alignment = taCenter
              Title.Caption = #1057#1090#1086#1080#1084#1086#1089#1090#1100' '#13#10#1079#1072#1082#1072#1079#1095#1080#1082#1072
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PODR'
              Title.Alignment = taCenter
              Title.Caption = #1057#1090#1086#1080#1084#1086#1089#1090#1100' '#1087#1086#1076#1088#1103#1076#1095#1080#1082#1072
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'COAST_ZP'
              Title.Alignment = taCenter
              Title.Caption = #1047#1072#1088#1087#1083#1072#1090#1072
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PRICE_ZP'
              Title.Alignment = taCenter
              Title.Caption = #1057#1090#1086#1080#1084#1086#1089#1090#1100' '#1079#1072#1088#1087#1083#1072#1090#1099
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TRANSP'
              Title.Alignment = taCenter
              Title.Caption = #1058#1088#1072#1085#1089#1087#1086#1088#1090
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TRANSP_ZAC'
              Title.Alignment = taCenter
              Title.Caption = #1058#1088#1072#1085#1089'. '#1079#1072#1082#1072#1079#1095#1080#1082#1072
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TRANSP_PODR'
              Title.Alignment = taCenter
              Title.Caption = #1058#1088#1072#1085#1089'. '#1087#1086#1076#1088#1103#1076#1095#1080#1082#1072
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NAME_1'
              Title.Alignment = taCenter
              Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'UNIT_1'
              Title.Alignment = taCenter
              Title.Caption = #1045#1076'. '#1080#1079#1084'.'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CNT_1'
              Title.Alignment = taCenter
              Title.Caption = #1050#1086#1083'-'#1074#1086
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'COAST_1'
              Title.Alignment = taCenter
              Title.Caption = #1062#1077#1085#1072
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PRICE_1'
              Title.Alignment = taCenter
              Title.Caption = #1057#1090#1086#1080#1084#1086#1089#1090#1100
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ZAC_1'
              Title.Alignment = taCenter
              Title.Caption = #1057#1090#1086#1080#1084#1086#1089#1090#1100' '#1079#1072#1082#1072#1079#1095#1080#1082#1072
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PODR_1'
              Title.Alignment = taCenter
              Title.Caption = #1057#1090#1086#1080#1084#1086#1089#1090#1100' '#1087#1086#1076#1088#1103#1076#1095#1080#1082#1072
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'COAST_ZP_1'
              Title.Alignment = taCenter
              Title.Caption = #1047#1072#1088#1087#1083#1072#1090#1072
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PRICE_ZP_1'
              Title.Alignment = taCenter
              Title.Caption = #1057#1090#1086#1080#1084#1086#1089#1090#1100' '#1079#1072#1088#1087#1083#1072#1090#1099
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TRANSP_1'
              Title.Alignment = taCenter
              Title.Caption = #1058#1088#1072#1085#1089#1087#1086#1088#1090
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TRANSP_ZAC_1'
              Title.Alignment = taCenter
              Title.Caption = #1058#1088#1072#1085#1089'. '#1079#1072#1082#1072#1079#1095#1080#1082#1072
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TRANSP_PODR_1'
              Title.Alignment = taCenter
              Title.Caption = #1058#1088#1072#1085#1089'. '#1087#1086#1076#1088#1103#1076#1095#1080#1082#1072
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DIFF_PRICE'
              Title.Alignment = taCenter
              Title.Caption = #1054#1090#1082#1083#1086#1085#1077#1085#1080#1077' '#1089#1090#1086#1080#1084#1086#1089#1090#1080
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DIFF_ZAC'
              Title.Alignment = taCenter
              Title.Caption = #1054#1090#1082#1083#1086#1085#1077#1085#1080#1077' '#1089#1090#1086#1080#1084#1086#1089#1090#1080' '#1079#1072#1082#1072#1079#1095#1080#1082#1072
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DIFF_PODR'
              Title.Alignment = taCenter
              Title.Caption = #1054#1090#1082#1083#1086#1085#1077#1085#1080#1077' '#1089#1090#1086#1080#1084#1086#1089#1090#1080' '#1087#1086#1076#1088#1103#1076#1095#1080#1082#1072
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DIFF_PRICE_ZP'
              Title.Alignment = taCenter
              Title.Caption = #1054#1090#1082#1083#1086#1085#1077#1085#1080#1077' '#1079#1072#1088#1087#1083#1072#1090#1072
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DIFF_TRANSP'
              Title.Alignment = taCenter
              Title.Caption = #1054#1090#1082#1083#1086#1085#1077#1085#1080#1077' '#1090#1088#1072#1085#1089#1087#1086#1088#1090#1072
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DIFF_TRANSP_ZAC'
              Title.Alignment = taCenter
              Title.Caption = #1054#1090#1082#1083#1086#1085#1077#1085#1080#1077' '#1090#1088#1072#1085#1089#1087#1086#1088#1090#1072' '#1079#1072#1082#1072#1079#1095#1080#1082#1072
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DIFF_TRANSP_PODR'
              Title.Alignment = taCenter
              Title.Caption = #1054#1090#1082#1083#1086#1085#1077#1085#1080#1077' '#1090#1088#1072#1085#1089#1087#1086#1088#1090#1072' '#1087#1086#1076#1088#1103#1076#1095#1080#1082#1072
              Width = 80
              Visible = True
            end>
        end
        object JvDBGridFooter1: TJvDBGridFooter
          Left = 0
          Top = 431
          Width = 859
          Height = 19
          SizeGrip = True
          Columns = <
            item
              Alignment = taRightJustify
              DisplayMask = '### ### ### ### ### ### ###'
              FieldName = 'PRICE'
            end
            item
              Alignment = taRightJustify
              DisplayMask = '### ### ### ### ### ### ###'
              FieldName = 'ZAC'
            end
            item
              Alignment = taRightJustify
              DisplayMask = '### ### ### ### ### ### ###'
              FieldName = 'PODR'
            end
            item
              DisplayMask = '### ### ### ### ### ### ###'
              FieldName = 'PRICE_ZP'
            end
            item
              Alignment = taRightJustify
              DisplayMask = '### ### ### ### ### ### ###'
              FieldName = 'TRANSP'
            end
            item
              Alignment = taRightJustify
              DisplayMask = '### ### ### ### ### ### ###'
              FieldName = 'TRANSP_ZAC'
            end
            item
              Alignment = taRightJustify
              DisplayMask = '### ### ### ### ### ### ###'
              FieldName = 'TRANSP_PODR'
            end
            item
              Alignment = taRightJustify
              DisplayMask = '### ### ### ### ### ### ###'
              FieldName = 'PRICE_1'
            end
            item
              Alignment = taRightJustify
              DisplayMask = '### ### ### ### ### ### ###'
              FieldName = 'ZAC_1'
            end
            item
              Alignment = taRightJustify
              DisplayMask = '### ### ### ### ### ### ###'
              FieldName = 'PODR_1'
            end
            item
              DisplayMask = '### ### ### ### ### ### ###'
              FieldName = 'PRICE_ZP_1'
            end
            item
              Alignment = taRightJustify
              DisplayMask = '### ### ### ### ### ### ###'
              FieldName = 'TRANSP_1'
            end
            item
              Alignment = taRightJustify
              DisplayMask = '### ### ### ### ### ### ###'
              FieldName = 'TRANSP_ZAC_1'
            end
            item
              Alignment = taRightJustify
              DisplayMask = '### ### ### ### ### ### ###'
              FieldName = 'TRANSP_PODR_1'
            end
            item
              Alignment = taRightJustify
              DisplayMask = '### ### ### ### ### ### ###'
              FieldName = 'DIFF_PRICE'
            end
            item
              Alignment = taRightJustify
              DisplayMask = '### ### ### ### ### ### ###'
              FieldName = 'DIFF_ZAC'
            end
            item
              Alignment = taRightJustify
              DisplayMask = '### ### ### ### ### ### ###'
              FieldName = 'DIFF_PODR'
            end
            item
              DisplayMask = '### ### ### ### ### ### ###'
              FieldName = 'DIFF_PRICE_ZP'
            end
            item
              Alignment = taRightJustify
              DisplayMask = '### ### ### ### ### ### ###'
              FieldName = 'DIFF_TRANSP'
            end
            item
              Alignment = taRightJustify
              DisplayMask = '### ### ### ### ### ### ###'
              FieldName = 'DIFF_TRANSP_ZAC'
            end
            item
              Alignment = taRightJustify
              DisplayMask = '### ### ### ### ### ### ###'
              FieldName = 'DIFF_TRANSP_PODR'
            end>
          DataSource = dsMainData
          DBGrid = grMaterial
          OnCalculate = JvDBGridFooter1Calculate
        end
      end
    end
    object ts3: TTabSheet
      Caption = #1052#1077#1093#1072#1085#1080#1079#1084#1099
      ImageIndex = 2
      TabVisible = False
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 446
      object pnlMechClient: TPanel
        Left = 0
        Top = 0
        Width = 859
        Height = 450
        Align = alClient
        BevelOuter = bvNone
        Caption = 'pnlMatClient'
        TabOrder = 0
        ExplicitHeight = 446
        object JvDBGridFooter2: TJvDBGridFooter
          Left = 0
          Top = 431
          Width = 859
          Height = 19
          SizeGrip = True
          Columns = <
            item
              Alignment = taRightJustify
              FieldName = 'PRICE'
            end
            item
              Alignment = taRightJustify
              FieldName = 'CNT'
            end
            item
              Alignment = taRightJustify
              FieldName = 'COAST_ZP'
            end
            item
              Alignment = taRightJustify
              FieldName = 'PRICE_ZP'
            end>
          ExplicitTop = 427
        end
      end
    end
    object ts4: TTabSheet
      Caption = #1054#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1077
      ImageIndex = 3
      TabVisible = False
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 446
      object pnlDevClient: TPanel
        Left = 0
        Top = 0
        Width = 859
        Height = 450
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        ExplicitHeight = 446
        object JvDBGridFooter3: TJvDBGridFooter
          Left = 0
          Top = 431
          Width = 859
          Height = 19
          SizeGrip = True
          Columns = <
            item
              Alignment = taRightJustify
              FieldName = 'PRICE'
            end
            item
              Alignment = taRightJustify
              FieldName = 'CNT'
            end
            item
              Alignment = taRightJustify
              FieldName = 'TRANSP'
            end>
          ExplicitTop = 427
        end
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 460
    Width = 867
    Height = 31
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object Button1: TButton
      Left = 4
      Top = 4
      Width = 198
      Height = 25
      Caption = #1054#1090#1082#1083#1086#1085#1077#1085#1080#1103' '#1087#1086' '#1084#1072#1090#1077#1088#1080#1072#1083#1072#1084
      TabOrder = 0
      OnClick = Button1Click
    end
  end
  object qrMainData: TFDQuery
    BeforeOpen = qrMainDataBeforeOpen
    AfterOpen = qrMainDataAfterOpen
    Connection = DM.Connect
    Transaction = DM.Read
    UpdateTransaction = DM.Write
    FetchOptions.AssignedValues = [evCache, evAutoFetchAll]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    FormatOptions.AssignedValues = [fvMapRules, fvDefaultParamDataType, fvFmtDisplayNumeric]
    FormatOptions.OwnMapRules = True
    FormatOptions.MapRules = <
      item
        SourceDataType = dtMemo
        TargetDataType = dtAnsiString
      end
      item
        SourceDataType = dtFmtBCD
        TargetDataType = dtDouble
      end>
    FormatOptions.DefaultParamDataType = ftBCD
    FormatOptions.FmtDisplayNumeric = '### ### ### ### ### ### ##0.########'
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate, uvUpdateChngFields, uvCheckReadOnly, uvCheckUpdatable]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.UpdateChangedFields = False
    UpdateOptions.CheckReadOnly = False
    UpdateOptions.CheckUpdatable = False
    UpdateOptions.UpdateTableName = 'smeta.fact_data'
    UpdateOptions.KeyFields = 'fact_data_id'
    Left = 27
    Top = 168
  end
  object dsMainData: TDataSource
    DataSet = qrMainData
    Left = 27
    Top = 216
  end
  object FormStorage: TJvFormStorage
    AppStorage = FormMain.AppIni
    AppStoragePath = '%FORM_NAME%\'
    Options = []
    StoredValues = <>
    Left = 24
    Top = 264
  end
  object JvDBGridExcelExport1: TJvDBGridExcelExport
    Caption = 'Exporting to MS Excel...'
    Grid = grMaterial
    Close = scAlways
    AutoFit = False
    Left = 296
    Top = 456
  end
end
