object fLogIn: TfLogIn
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1042#1093#1086#1076' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103
  ClientHeight = 133
  ClientWidth = 257
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pgc1: TPageControl
    Left = 8
    Top = 8
    Width = 241
    Height = 118
    ActivePage = tsLogIn
    TabOrder = 0
    OnChange = pgc1Change
    object tsLogIn: TTabSheet
      Caption = #1042#1093#1086#1076
      object lbl1: TLabel
        Left = 8
        Top = 11
        Width = 76
        Height = 13
        Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100':'
      end
      object lbl2: TLabel
        Left = 8
        Top = 38
        Width = 41
        Height = 13
        Caption = #1055#1072#1088#1086#1083#1100':'
      end
      object btn1: TBitBtn
        Left = 154
        Top = 62
        Width = 75
        Height = 25
        Caption = #1054#1090#1084#1077#1085#1072
        ModalResult = 2
        TabOrder = 3
      end
      object btn2: TBitBtn
        Left = 73
        Top = 62
        Width = 75
        Height = 25
        Caption = #1042#1093#1086#1076
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        OnClick = btn2Click
      end
      object edtName: TEdit
        Left = 90
        Top = 8
        Width = 139
        Height = 21
        TabOrder = 0
      end
      object edtPass: TEdit
        Left = 90
        Top = 35
        Width = 139
        Height = 21
        PasswordChar = '*'
        TabOrder = 1
      end
    end
    object tsSetup: TTabSheet
      Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ImageIndex = 1
      ParentFont = False
      object lbl3: TLabel
        Left = 3
        Top = 3
        Width = 121
        Height = 13
        Caption = #1048#1084#1103' / IP-'#1072#1076#1088#1077#1089' '#1089#1077#1088#1074#1077#1088#1072':'
      end
      object lblStateCaption: TLabel
        Left = 3
        Top = 49
        Width = 40
        Height = 13
        Caption = #1057#1090#1072#1090#1091#1089':'
      end
      object lblState: TLabel
        Left = 49
        Top = 49
        Width = 63
        Height = 13
        Caption = #1085#1077' '#1076#1086#1089#1090#1091#1087#1077#1085
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object edtServerName: TEdit
        Left = 3
        Top = 22
        Width = 174
        Height = 21
        TabOrder = 1
        Text = 'localhost'
      end
      object btnConnect: TBitBtn
        Left = 183
        Top = 20
        Width = 47
        Height = 25
        Caption = #1058#1077#1089#1090
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnClick = btnConnectClick
      end
    end
  end
  object FormStorage: TJvFormStorage
    AppStorage = FormMain.AppIni
    AppStoragePath = '%FORM_NAME%\'
    Options = []
    StoredProps.Strings = (
      'edtName.Text'
      'edtServerName.Text')
    StoredValues = <>
    Left = 208
    Top = 10
  end
end
