object ManSprCardForm: TManSprCardForm
  Left = 0
  Top = 0
  Caption = #1050#1072#1088#1090#1086#1095#1082#1072' '#1089#1086#1073#1089#1090#1074#1077#1085#1085#1086#1075#1086
  ClientHeight = 395
  ClientWidth = 774
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object gbMain: TGroupBox
    Left = 0
    Top = 0
    Width = 774
    Height = 123
    Align = alTop
    TabOrder = 0
    DesignSize = (
      774
      123)
    object lbCode: TLabel
      Left = 16
      Top = 2
      Width = 24
      Height = 13
      Caption = #1050#1086#1076':'
    end
    object lbUnit: TLabel
      Left = 205
      Top = 2
      Width = 45
      Height = 13
      Caption = #1045#1076'. '#1080#1079#1085'.:'
    end
    object lbName: TLabel
      Left = 16
      Top = 43
      Width = 77
      Height = 13
      Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077':'
    end
    object edtCode: TEdit
      Left = 10
      Top = 16
      Width = 184
      Height = 21
      TabOrder = 0
    end
    object memName: TMemo
      Left = 10
      Top = 58
      Width = 754
      Height = 56
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
    end
    object cbUnit: TComboBox
      Left = 200
      Top = 16
      Width = 564
      Height = 21
      AutoDropDown = True
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
    end
  end
  object gbAdditInfo: TGroupBox
    Left = 0
    Top = 270
    Width = 774
    Height = 89
    Align = alBottom
    Caption = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1099#1077' '#1076#1072#1085#1085#1099#1077' '
    TabOrder = 2
    object lbAdditInfo1: TLabel
      Left = 11
      Top = 20
      Width = 34
      Height = 13
      Caption = #1052#1072#1089#1089#1072':'
    end
    object lbAdditInfo2: TLabel
      Left = 11
      Top = 47
      Width = 36
      Height = 13
      Caption = #1052#1072#1088#1082#1072':'
    end
    object lbAdditInfo3: TLabel
      Left = 189
      Top = 20
      Width = 36
      Height = 13
      Caption = #1084'2('#1084'3):'
    end
    object lbAdditInfo4: TLabel
      Left = 189
      Top = 48
      Width = 31
      Height = 13
      Caption = #1043#1054#1057#1058':'
    end
    object lbAdditInfo5: TLabel
      Left = 369
      Top = 20
      Width = 57
      Height = 13
      Caption = #1064#1080#1088#1080#1085#1072', '#1084':'
    end
    object lbAdditInfo6: TLabel
      Left = 369
      Top = 43
      Width = 55
      Height = 13
      Caption = #1044#1083#1080#1085#1085#1072', '#1084':'
    end
    object lbAdditInfo7: TLabel
      Left = 369
      Top = 66
      Width = 54
      Height = 13
      Caption = #1042#1099#1089#1086#1090#1072', '#1084':'
    end
    object edtAdditInfo1: TEdit
      Left = 53
      Top = 17
      Width = 121
      Height = 21
      TabOrder = 0
    end
    object edtAdditInfo2: TEdit
      Left = 53
      Top = 44
      Width = 121
      Height = 21
      TabOrder = 4
    end
    object edtAdditInfo3: TEdit
      Left = 230
      Top = 17
      Width = 121
      Height = 21
      TabOrder = 1
    end
    object edtAdditInfo4: TEdit
      Left = 230
      Top = 44
      Width = 121
      Height = 21
      TabOrder = 5
    end
    object edtAdditInfo5: TEdit
      Left = 429
      Top = 17
      Width = 121
      Height = 21
      TabOrder = 2
    end
    object edtAdditInfo6: TEdit
      Left = 429
      Top = 40
      Width = 121
      Height = 21
      TabOrder = 3
    end
    object edtAdditInfo7: TEdit
      Left = 429
      Top = 63
      Width = 121
      Height = 21
      TabOrder = 6
    end
  end
  object gpPrices: TGroupBox
    Left = 0
    Top = 123
    Width = 774
    Height = 147
    Align = alClient
    Caption = ' '#1062#1077#1085#1072' '#1087#1086' '#1085#1072#1082#1083#1072#1076#1085#1099#1084' '
    TabOrder = 1
    object grPrices: TJvDBGrid
      Left = 2
      Top = 15
      Width = 770
      Height = 130
      Align = alClient
      DataSource = dsPrices
      DrawingStyle = gdsClassic
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      SelectColumnsDialogStrings.Caption = 'Select columns'
      SelectColumnsDialogStrings.OK = '&OK'
      SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
      EditControls = <>
      RowsHeight = 17
      TitleRowHeight = 17
      Columns = <
        item
          Expanded = False
          FieldName = 'DOC_DATE'
          Title.Alignment = taCenter
          Title.Caption = #1044#1072#1090#1072
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DOC_NOM'
          Title.Alignment = taCenter
          Title.Caption = #1053#1086#1084#1077#1088
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PROVIDER'
          Title.Alignment = taCenter
          Title.Caption = #1055#1086#1089#1090#1072#1074#1097#1080#1082
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'COASTNONDS'
          Title.Alignment = taCenter
          Title.Caption = #1062#1077#1085#1072' '#1073#1077#1079' '#1053#1044#1057', '#1088#1091#1073
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'COASTNDS'
          Title.Alignment = taCenter
          Title.Caption = #1062#1077#1085#1072' '#1089' '#1053#1044#1057', '#1088#1091#1073
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRIPT'
          Title.Alignment = taCenter
          Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
          Width = 200
          Visible = True
        end>
    end
  end
  object pnlButtons: TPanel
    Left = 0
    Top = 359
    Width = 774
    Height = 36
    Align = alBottom
    TabOrder = 3
    DesignSize = (
      774
      36)
    object btnClose: TButton
      Left = 663
      Top = 6
      Width = 101
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1054#1090#1084#1077#1085#1072
      TabOrder = 1
      OnClick = btnCloseClick
    end
    object btnSave: TButton
      Left = 512
      Top = 6
      Width = 145
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1057#1086#1093#1085#1072#1085#1080#1090#1100
      Default = True
      TabOrder = 0
      OnClick = btnSaveClick
    end
  end
  object mtPrices: TFDMemTable
    Active = True
    FieldDefs = <
      item
        Name = 'DOC_NOM'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'DOC_DATE'
        DataType = ftDate
      end
      item
        Name = 'COASTNDS'
        DataType = ftExtended
      end
      item
        Name = 'COASTNONDS'
        DataType = ftExtended
      end
      item
        Name = 'DESCRIPT'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'PROVIDER'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'ID'
        DataType = ftInteger
      end>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired]
    UpdateOptions.CheckRequired = False
    StoreDefs = True
    Left = 176
    Top = 187
    object mtPricesDOC_NOM: TStringField
      FieldName = 'DOC_NOM'
    end
    object mtPricesDOC_DATE: TDateField
      FieldName = 'DOC_DATE'
      OnSetText = mtPricesDOC_DATESetText
      EditMask = '!99/99/00##;1;_'
    end
    object mtPricesCOASTNDS: TExtendedField
      FieldName = 'COASTNDS'
      Precision = 19
    end
    object mtPricesCOASTNONDS: TExtendedField
      FieldName = 'COASTNONDS'
      Precision = 19
    end
    object mtPricesDESCRIPT: TStringField
      FieldName = 'DESCRIPT'
      Size = 100
    end
    object mtPricesPROVIDER: TStringField
      FieldName = 'PROVIDER'
      Size = 100
    end
    object mtPricesID: TIntegerField
      FieldName = 'ID'
    end
  end
  object dsPrices: TDataSource
    DataSet = mtPrices
    Left = 232
    Top = 187
  end
end
