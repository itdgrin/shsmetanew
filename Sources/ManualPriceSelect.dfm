object fmManPriceSelect: TfmManPriceSelect
  Left = 0
  Top = 0
  Caption = #1042#1099#1073#1086#1088' '#1094#1077#1085#1099
  ClientHeight = 312
  ClientWidth = 744
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object gbDetPrice: TGroupBox
    Left = 0
    Top = 105
    Width = 744
    Height = 171
    Align = alClient
    Caption = '  '#1062#1077#1085#1099' '#1087#1086' '#1085#1072#1082#1083#1072#1076#1085#1099#1084'   '
    TabOrder = 1
    object lvDetPrice: TListView
      Left = 2
      Top = 15
      Width = 740
      Height = 154
      Align = alClient
      Columns = <
        item
          Caption = #1044#1072#1090#1072
          Width = 70
        end
        item
          Caption = #1053#1086#1084#1077#1088
          Width = 70
        end
        item
          Caption = #1055#1086#1089#1090#1072#1074#1097#1080#1082
          Width = 150
        end
        item
          Alignment = taRightJustify
          Caption = #1062#1077#1085#1072' '#1073#1077#1079' '#1053#1044#1057', '#1088#1091#1073
          Width = 120
        end
        item
          Alignment = taRightJustify
          Caption = #1062#1077#1085#1072' '#1089' '#1053#1044#1057', '#1088#1091#1073
          Width = 120
        end
        item
          Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
          Width = 200
        end>
      GridLines = True
      ReadOnly = True
      RowSelect = True
      TabOrder = 0
      ViewStyle = vsReport
      OnDblClick = lvDetPriceDblClick
    end
  end
  object pnlButtons: TPanel
    Left = 0
    Top = 276
    Width = 744
    Height = 36
    Align = alBottom
    TabOrder = 2
    DesignSize = (
      744
      36)
    object btnClose: TButton
      Left = 633
      Top = 6
      Width = 101
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1054#1090#1084#1077#1085#1072
      TabOrder = 1
      OnClick = btnCloseClick
    end
    object btnSelect: TButton
      Left = 512
      Top = 6
      Width = 115
      Height = 25
      Action = acSelect
      Anchors = [akTop, akRight]
      Default = True
      TabOrder = 0
    end
  end
  object gbMain: TGroupBox
    Left = 0
    Top = 0
    Width = 744
    Height = 105
    Align = alTop
    TabOrder = 0
    DesignSize = (
      744
      105)
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
      ReadOnly = True
      TabOrder = 0
    end
    object memName: TMemo
      Left = 10
      Top = 58
      Width = 724
      Height = 39
      Anchors = [akLeft, akTop, akRight]
      ReadOnly = True
      TabOrder = 2
    end
    object edtUnit: TEdit
      Left = 200
      Top = 16
      Width = 534
      Height = 21
      ReadOnly = True
      TabOrder = 1
    end
  end
  object ActionList1: TActionList
    Left = 592
    Top = 185
    object acSelect: TAction
      Caption = #1042#1099#1073#1086#1088
      OnExecute = acSelectExecute
      OnUpdate = acSelectUpdate
    end
  end
end
