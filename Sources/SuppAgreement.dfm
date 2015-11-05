object fSuppAgreement: TfSuppAgreement
  Left = 0
  Top = 0
  Caption = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1099#1077' '#1089#1086#1075#1083#1072#1096#1077#1085#1080#1103
  ClientHeight = 316
  ClientWidth = 294
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
  object grMain: TJvDBGrid
    Left = 0
    Top = 29
    Width = 294
    Height = 256
    Align = alClient
    DataSource = dsMain
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnTitleClick = grMainTitleClick
    SelectColumn = scGrid
    AutoSizeColumns = True
    SelectColumnsDialogStrings.Caption = 'Select columns'
    SelectColumnsDialogStrings.OK = '&OK'
    SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
    EditControls = <>
    RowsHeight = 17
    TitleRowHeight = 17
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'onDate'
        Title.Alignment = taCenter
        Title.Caption = #1044#1072#1090#1072
        Width = 92
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUM'
        Title.Alignment = taCenter
        Title.Caption = #1053#1086#1084#1077#1088
        Width = 184
        Visible = True
      end>
  end
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 294
    Height = 29
    Align = alTop
    TabOrder = 0
    DesignSize = (
      294
      29)
    object btnSearch: TSpeedButton
      Left = 208
      Top = 3
      Width = 81
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
      Left = 4
      Top = 4
      Width = 198
      Height = 21
      Align = alCustom
      Anchors = [akLeft, akTop, akRight]
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      TextHint = #1042#1074#1077#1076#1080#1090#1077' '#1090#1077#1082#1089#1090' '#1076#1083#1103' '#1087#1086#1080#1089#1082#1072'...'
      OnKeyDown = edtSearchKeyDown
    end
  end
  object pnl2: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 288
    Width = 288
    Height = 25
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object dbnvgr1: TDBNavigator
      Left = 0
      Top = 0
      Width = 240
      Height = 25
      DataSource = dsMain
      Align = alLeft
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
  object qrMain: TFDQuery
    AutoCalcFields = False
    OnNewRecord = qrMainNewRecord
    Connection = DM.Connect
    Transaction = DM.Read
    UpdateTransaction = DM.Write
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate, uvUpdateChngFields, uvUpdateMode, uvCountUpdatedRecords, uvCheckRequired, uvCheckReadOnly, uvCheckUpdatable, uvUpdateNonBaseFields]
    UpdateOptions.EnableDelete = False
    UpdateOptions.UpdateChangedFields = False
    UpdateOptions.UpdateNonBaseFields = True
    UpdateOptions.UpdateMode = upWhereAll
    UpdateOptions.CountUpdatedRecords = False
    UpdateOptions.CheckRequired = False
    UpdateOptions.CheckReadOnly = False
    UpdateOptions.CheckUpdatable = False
    UpdateOptions.UpdateTableName = 'smeta.supp_agreement'
    SQL.Strings = (
      'SELECT *'
      'FROM supp_agreement'
      'WHERE OBJ_ID=:OBJ_ID'
      'ORDER BY onDate DESC;')
    Left = 18
    Top = 72
    ParamData = <
      item
        Name = 'OBJ_ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = 0
      end>
  end
  object dsMain: TDataSource
    DataSet = qrMain
    Left = 18
    Top = 120
  end
end
