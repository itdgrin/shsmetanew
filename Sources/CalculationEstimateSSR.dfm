object frCalculationEstimateSSR: TfrCalculationEstimateSSR
  Left = 0
  Top = 0
  Width = 594
  Height = 384
  TabOrder = 0
  object pnlSSR: TPanel
    Left = 0
    Top = 0
    Width = 594
    Height = 384
    Align = alClient
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 0
    object spl1: TSplitter
      Left = 0
      Top = 65
      Width = 594
      Height = 5
      Cursor = crVSplit
      Align = alTop
      ExplicitWidth = 912
    end
    object pnlTop: TPanel
      Left = 0
      Top = 0
      Width = 594
      Height = 65
      Align = alTop
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 0
      DesignSize = (
        594
        65)
      object lbl1: TLabel
        Left = 8
        Top = 6
        Width = 115
        Height = 13
        Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1089#1090#1088#1086#1082#1080':'
      end
      object lbl2: TLabel
        Left = 8
        Top = 39
        Width = 152
        Height = 13
        Anchors = [akLeft]
        Caption = #1060#1086#1088#1084#1091#1083#1072' '#1076#1083#1103' '#1088#1072#1089#1095#1105#1090#1072' '#1089#1090#1088#1086#1082#1080':'
      end
      object edt1: TEdit
        Left = 129
        Top = 2
        Width = 461
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
      end
      object mmo1: TMemo
        Left = 166
        Top = 29
        Width = 424
        Height = 35
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
      end
    end
    object dbgrd1: TDBGrid
      Left = 0
      Top = 70
      Width = 594
      Height = 314
      Align = alClient
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          Title.Caption = #8470' '#1089#1090#1088#1086#1082#1080
          Visible = True
        end
        item
          Expanded = False
          Title.Caption = '%(R)'
          Visible = True
        end
        item
          Expanded = False
          Title.Caption = #1050#1092
          Visible = True
        end
        item
          Expanded = False
          Title.Caption = #1050#1092
          Visible = True
        end
        item
          Expanded = False
          Title.Caption = #8470
          Visible = True
        end
        item
          Expanded = False
          Title.Caption = #1053#1072#1079#1074#1072#1085#1080#1077
          Visible = True
        end
        item
          Expanded = False
          Title.Caption = #1047#1072#1088#1087#1083#1072#1090#1072
          Visible = True
        end
        item
          Expanded = False
          Title.Caption = #1069#1052#1080#1052
          Visible = True
        end
        item
          Expanded = False
          Title.Caption = #1074' '#1090'.'#1095'.'#1079#1072#1088'. '#1084#1072#1096'.'
          Visible = True
        end
        item
          Expanded = False
          Title.Caption = #1052#1072#1090#1077#1088#1080#1072#1083#1099
          Visible = True
        end
        item
          Expanded = False
          Title.Caption = #1058#1088#1072#1085#1089#1087#1086#1088#1090
          Visible = True
        end
        item
          Expanded = False
          Title.Caption = #1054#1061#1056' '#1080' '#1054#1055#1056
          Visible = True
        end
        item
          Expanded = False
          Title.Caption = #1055#1083#1072#1085' '#1087#1088#1080#1073#1099#1083#1080
          Visible = True
        end
        item
          Expanded = False
          Title.Caption = #1054#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1077
          Visible = True
        end>
    end
  end
end
