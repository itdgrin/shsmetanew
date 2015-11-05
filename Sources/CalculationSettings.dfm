object FormCalculationSettings: TFormCalculationSettings
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080' '#1088#1072#1089#1095#1105#1090#1086#1074
  ClientHeight = 450
  ClientWidth = 607
  Color = clBtnFace
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
    607
    450)
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 0
    Top = 409
    Width = 607
    Height = 33
    Anchors = [akLeft, akRight, akBottom]
    Shape = bsTopLine
    ExplicitTop = 392
    ExplicitWidth = 621
  end
  object PageControl1: TPageControl
    Left = 8
    Top = 8
    Width = 591
    Height = 395
    ActivePage = TabSheet1
    Anchors = [akLeft, akTop, akRight, akBottom]
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = #1054#1089#1085#1086#1074#1085#1099#1077
      object GroupBox1: TGroupBox
        Left = 5
        Top = 5
        Width = 570
        Height = 180
        Caption = #1055#1091#1090#1080
        TabOrder = 0
        object Label1: TLabel
          Left = 16
          Top = 18
          Width = 52
          Height = 13
          Caption = #1056#1057#1053'-2012:'
        end
        object Label2: TLabel
          Left = 24
          Top = 45
          Width = 44
          Height = 13
          Caption = #1044#1072#1085#1085#1099#1077':'
        end
        object Label3: TLabel
          Left = 24
          Top = 72
          Width = 44
          Height = 13
          Caption = #1054#1090#1095#1105#1090#1099':'
        end
        object Label4: TLabel
          Left = 16
          Top = 99
          Width = 52
          Height = 13
          Caption = #1064#1072#1073#1083#1086#1085#1099':'
        end
        object Label5: TLabel
          Left = 8
          Top = 126
          Width = 60
          Height = 13
          Caption = #1042#1088#1077#1084#1077#1085#1085#1099#1077':'
        end
        object Label6: TLabel
          Left = 27
          Top = 153
          Width = 41
          Height = 13
          Caption = #1048#1084#1087#1086#1088#1090':'
        end
        object Edit1: TEdit
          Left = 74
          Top = 15
          Width = 463
          Height = 21
          Color = 14408667
          ReadOnly = True
          TabOrder = 0
        end
        object Edit2: TEdit
          Left = 74
          Top = 42
          Width = 463
          Height = 21
          Color = 14408667
          ReadOnly = True
          TabOrder = 2
        end
        object Edit3: TEdit
          Left = 74
          Top = 69
          Width = 463
          Height = 21
          Color = 14408667
          ReadOnly = True
          TabOrder = 4
        end
        object Edit4: TEdit
          Left = 74
          Top = 96
          Width = 463
          Height = 21
          Color = 14408667
          ReadOnly = True
          TabOrder = 6
        end
        object Edit5: TEdit
          Left = 74
          Top = 123
          Width = 463
          Height = 21
          Color = 14408667
          ReadOnly = True
          TabOrder = 8
        end
        object Edit6: TEdit
          Left = 74
          Top = 150
          Width = 463
          Height = 21
          Color = 14408667
          ReadOnly = True
          TabOrder = 10
        end
        object Button2: TButton
          Left = 543
          Top = 42
          Width = 20
          Height = 21
          Caption = '...'
          TabOrder = 3
        end
        object Button3: TButton
          Left = 543
          Top = 69
          Width = 20
          Height = 21
          Caption = '...'
          TabOrder = 5
        end
        object Button4: TButton
          Left = 543
          Top = 96
          Width = 20
          Height = 21
          Caption = '...'
          TabOrder = 7
        end
        object Button5: TButton
          Left = 543
          Top = 150
          Width = 20
          Height = 21
          Caption = '...'
          TabOrder = 11
        end
        object Button6: TButton
          Left = 543
          Top = 123
          Width = 20
          Height = 21
          Caption = '...'
          TabOrder = 9
        end
        object Button1: TButton
          Left = 543
          Top = 15
          Width = 20
          Height = 21
          Caption = '...'
          TabOrder = 1
        end
      end
      object GroupBox2: TGroupBox
        Left = 5
        Top = 191
        Width = 570
        Height = 130
        Caption = #1056#1077#1079#1077#1088#1074#1085#1086#1077' '#1082#1086#1087#1080#1088#1086#1074#1072#1085#1080#1077
        TabOrder = 1
        object Label7: TLabel
          Left = 8
          Top = 23
          Width = 29
          Height = 13
          Caption = #1055#1091#1090#1100':'
        end
        object LabelEvery: TLabel
          Left = 409
          Top = 73
          Width = 25
          Height = 13
          Caption = #1076#1085#1077#1081
        end
        object Label9: TLabel
          Left = 205
          Top = 100
          Width = 25
          Height = 13
          Caption = #1076#1085#1077#1081
        end
        object Label10: TLabel
          Left = 287
          Top = 100
          Width = 83
          Height = 13
          Caption = #1064#1072#1073#1083#1086#1085' '#1072#1088#1093#1080#1074#1072':'
        end
        object Edit7: TEdit
          Left = 43
          Top = 20
          Width = 494
          Height = 21
          Color = 14408667
          ReadOnly = True
          TabOrder = 0
        end
        object Button7: TButton
          Left = 543
          Top = 20
          Width = 20
          Height = 21
          Caption = '...'
          TabOrder = 1
        end
        object CheckBox1: TCheckBox
          Left = 8
          Top = 47
          Width = 165
          Height = 17
          Caption = #1055#1088#1080' '#1079#1072#1087#1091#1089#1082#1077' '#1087#1088#1086#1075#1088#1072#1084#1084#1099
          TabOrder = 2
        end
        object CheckBox2: TCheckBox
          Left = 287
          Top = 47
          Width = 218
          Height = 17
          Caption = #1048#1089#1087#1086#1083#1100#1079#1086#1074#1072#1090#1100' '#1087#1083#1072#1085#1080#1088#1086#1074#1097#1080#1082' Windows'
          TabOrder = 3
        end
        object CheckBox3: TCheckBox
          Left = 8
          Top = 72
          Width = 165
          Height = 17
          Caption = #1055#1088#1080' '#1079#1072#1082#1088#1099#1090#1080#1080' '#1087#1088#1086#1075#1088#1072#1084#1084#1099
          TabOrder = 5
        end
        object CheckBoxEvery: TCheckBox
          Left = 287
          Top = 72
          Width = 60
          Height = 17
          Caption = #1050#1072#1078#1076#1099#1077
          TabOrder = 6
          OnClick = CheckBoxEveryClick
        end
        object EditEvery: TEdit
          Left = 353
          Top = 70
          Width = 50
          Height = 21
          Enabled = False
          TabOrder = 4
          OnKeyPress = EditDeleteDataKeyPress
        end
        object CheckBoxDeleteData: TCheckBox
          Left = 8
          Top = 99
          Width = 135
          Height = 17
          Caption = #1059#1076#1072#1083#1080#1090#1100' '#1076#1072#1085#1085#1099#1077' '#1073#1086#1083#1077#1077
          TabOrder = 10
          OnClick = CheckBoxDeleteDataClick
        end
        object EditDeleteData: TEdit
          Left = 149
          Top = 95
          Width = 50
          Height = 21
          Enabled = False
          TabOrder = 7
          OnKeyPress = EditDeleteDataKeyPress
        end
        object Edit10: TEdit
          Left = 376
          Top = 97
          Width = 161
          Height = 21
          Color = 14408667
          ReadOnly = True
          TabOrder = 8
        end
        object Button8: TButton
          Left = 543
          Top = 97
          Width = 20
          Height = 21
          Caption = '...'
          TabOrder = 9
        end
      end
    end
  end
  object ButtonSave: TButton
    Left = 393
    Top = 417
    Width = 100
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    TabOrder = 1
    OnClick = ButtonSaveClick
  end
  object ButtonCancel: TButton
    Left = 499
    Top = 417
    Width = 100
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 2
    OnClick = ButtonCancelClick
  end
end
