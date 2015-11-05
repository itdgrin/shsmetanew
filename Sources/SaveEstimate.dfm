object FormSaveEstimate: TFormSaveEstimate
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1089#1084#1077#1090#1091' '#1082#1072#1082'...'
  ClientHeight = 97
  ClientWidth = 397
  Color = clBtnFace
  TransparentColor = True
  TransparentColorValue = clGreen
  DoubleBuffered = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  DesignSize = (
    397
    97)
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 0
    Top = 56
    Width = 397
    Height = 41
    Align = alBottom
    Shape = bsTopLine
    ExplicitLeft = -40
    ExplicitTop = 99
    ExplicitWidth = 326
  end
  object ButtonSave: TButton
    Left = 289
    Top = 64
    Width = 100
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    Default = True
    TabOrder = 3
    OnClick = ButtonSaveClick
  end
  object ButtonCancel: TButton
    Left = 183
    Top = 64
    Width = 100
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 2
    OnClick = ButtonCancelClick
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 397
    Height = 25
    Align = alTop
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 0
    object LabelNumberEstimate: TLabel
      Left = 39
      Top = 6
      Width = 51
      Height = 13
      Caption = #8470' '#1089#1084#1077#1090#1099':'
    end
    object EditNumberEstimate: TEdit
      Left = 100
      Top = 2
      Width = 294
      Height = 21
      Color = 14802912
      ReadOnly = True
      TabOrder = 0
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 25
    Width = 397
    Height = 25
    Align = alTop
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 1
    object LabelNameEstimate: TLabel
      Left = 8
      Top = 6
      Width = 86
      Height = 13
      Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1089#1084#1077#1090#1099':'
    end
    object EditNameEstimate: TEdit
      Left = 100
      Top = 2
      Width = 294
      Height = 21
      TabOrder = 0
    end
  end
  object ADOQueryTemp: TFDQuery
    Connection = DM.Connect
    Transaction = DM.Read
    UpdateTransaction = DM.Write
    Left = 57
    Top = 45
  end
end
