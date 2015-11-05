object fEditExpression: TfEditExpression
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = #1042#1099#1095#1080#1089#1083#1077#1085#1080#1077' '#1074#1099#1088#1072#1078#1077#1085#1080#1081'('#1092#1086#1088#1084#1091#1083#1072')'
  ClientHeight = 31
  ClientWidth = 417
  Color = clCream
  TransparentColorValue = clFuchsia
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  KeyPreview = True
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  DesignSize = (
    417
    31)
  PixelsPerInch = 96
  TextHeight = 13
  object btnCancel: TSpeedButton
    Left = 391
    Top = 5
    Width = 23
    Height = 21
    Anchors = [akTop, akRight]
    Caption = #1061
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    OnClick = btnCancelClick
  end
  object btnOk: TSpeedButton
    Left = 367
    Top = 5
    Width = 23
    Height = 21
    Anchors = [akTop, akRight]
    Caption = #1054#1082
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    OnClick = btnOkClick
  end
  object lbl1: TLabel
    Left = 3
    Top = 4
    Width = 18
    Height = 19
    Caption = 'f ='
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
  end
  object edtFormula: TEdit
    Left = 24
    Top = 5
    Width = 340
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    TextHint = #1042#1074#1077#1076#1080#1090#1077' '#1092#1086#1088#1084#1091#1083#1091'...'
  end
end
