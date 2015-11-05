object frmReplacement: TfrmReplacement
  Left = 0
  Top = 0
  Caption = #1047#1072#1084#1077#1085#1072' '#1084#1072#1090#1077#1088#1080#1072#1083#1086#1074', '#1084#1077#1093#1072#1085#1080#1079#1084#1086#1074' '#1080' '#1086#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1103
  ClientHeight = 602
  ClientWidth = 779
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 779
    Height = 68
    Align = alTop
    TabOrder = 0
    object groupReplace: TGroupBox
      Left = 145
      Top = 1
      Width = 633
      Height = 66
      Align = alClient
      Caption = ' '#1052#1072#1090#1077#1088#1080#1072#1083#1072': '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      object Label2: TLabel
        Left = 13
        Top = 21
        Width = 24
        Height = 13
        Caption = #1050#1086#1076':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label3: TLabel
        Left = 146
        Top = 21
        Width = 77
        Height = 13
        Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object edtSourceCode: TEdit
        Left = 40
        Top = 18
        Width = 98
        Height = 21
        Color = 14802912
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
      object edtSourceName: TMemo
        Left = 229
        Top = 18
        Width = 396
        Height = 41
        Color = 14802912
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
    end
    object rgroupType: TRadioGroup
      Left = 1
      Top = 1
      Width = 144
      Height = 66
      Align = alLeft
      Caption = ' '#1047#1072#1084#1077#1085#1072' '
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Items.Strings = (
        #1052#1072#1090#1077#1088#1080#1072#1083#1086#1074
        #1052#1077#1093#1072#1085#1080#1079#1084#1086#1074
        #1054#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1103)
      ParentFont = False
      TabOrder = 0
      OnClick = rgroupTypeClick
    end
  end
  object groupEntry: TGroupBox
    Left = 0
    Top = 68
    Width = 779
    Height = 113
    Align = alTop
    Caption = ' '#1042#1093#1086#1078#1076#1077#1085#1080#1103
    TabOrder = 1
    object ListEntry: TListView
      Left = 2
      Top = 15
      Width = 775
      Height = 96
      Align = alClient
      Checkboxes = True
      Columns = <
        item
          Caption = #1057#1084#1077#1090#1072
          Width = 300
        end
        item
          Caption = #1056#1072#1089#1094#1077#1085#1082#1072
          Width = 80
        end
        item
          Caption = #1052#1072#1090#1077#1088#1080#1072#1083
          Width = 100
        end
        item
          Caption = #1053#1086#1088#1084#1072
          Width = 70
        end
        item
          Caption = #1050#1086#1083'-'#1074#1086
          Width = 70
        end
        item
          Caption = #1045#1076'. '#1080#1079#1084'.'
          Width = 80
        end>
      ColumnClick = False
      GridLines = True
      ReadOnly = True
      RowSelect = True
      PopupMenu = PMEntry
      TabOrder = 0
      ViewStyle = vsReport
      OnChange = ListEntryChange
      OnCustomDrawItem = ListEntryCustomDrawItem
    end
  end
  object groupCatalog: TGroupBox
    Left = 0
    Top = 270
    Width = 779
    Height = 299
    Align = alClient
    Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082
    DoubleBuffered = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentDoubleBuffered = False
    ParentFont = False
    TabOrder = 3
    object Panel5: TPanel
      Left = 2
      Top = 15
      Width = 775
      Height = 282
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 0
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 569
    Width = 779
    Height = 33
    Align = alBottom
    TabOrder = 4
    object btnReplace: TButton
      AlignWithMargins = True
      Left = 590
      Top = 4
      Width = 104
      Height = 25
      Align = alRight
      Caption = #1047#1072#1084#1077#1085#1080#1090#1100
      TabOrder = 1
      OnClick = btnReplaceClick
    end
    object btnCancel: TButton
      AlignWithMargins = True
      Left = 700
      Top = 4
      Width = 75
      Height = 25
      Align = alRight
      Caption = #1054#1090#1084#1077#1085#1072
      TabOrder = 2
      OnClick = btnCancelClick
    end
    object btnDelReplacement: TButton
      Tag = 1
      AlignWithMargins = True
      Left = 464
      Top = 4
      Width = 120
      Height = 25
      Align = alRight
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1079#1072#1084#1077#1085#1099
      TabOrder = 0
      Visible = False
      OnClick = btnReplaceClick
    end
  end
  object groupRep: TGroupBox
    Left = 0
    Top = 181
    Width = 779
    Height = 89
    Align = alTop
    Caption = ' '#1047#1072#1084#1077#1085#1080#1090#1100' '#1085#1072':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    object Panel2: TPanel
      Left = 750
      Top = 15
      Width = 27
      Height = 72
      Align = alRight
      BevelOuter = bvNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      object SpeedButton1: TSpeedButton
        Left = 2
        Top = -1
        Width = 24
        Height = 24
        Glyph.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          000000000000000000000A21022C28830AAF33A70CE337B80CFF35B709FF2DA3
          05E3217E02AF0820002C00000000000000000000000000000000000000000000
          0000000000002C860EAF3FC114FF37C708FF34CB01FF33CC00FF33CC00FF33CB
          01FF33C302FF30B604FF207D01AF000000000000000000000000000000000306
          02083EB019E33DC710FF33CC00FF33CC00FF33CC00FF33CC00FF33CC00FF33CC
          00FF33CC00FF33CC00FF31BE02FF29A001E3010500080000000000000000318A
          14AF40C913FF33CC00FF33CC00FF33CC00FF33CC00FF33CC00FF259500FF2595
          00FF33CC00FF33CC00FF33CC00FF31BE02FF207D01AF00000000102A08344CCB
          22FF33CC00FF33CC00FF33CC00FF33CC00FF33CC00FFFFFFFFFFFFFFFFFF2595
          00FF33CC00FF33CC00FF33CC00FF33CC00FF30B604FF09250034389718BB3ECC
          0FFF33CC00FF33CC00FF33CC00FF33CC00FF33CC00FFFFFFFFFFFFFFFFFF2595
          00FF33CC00FF33CC00FF33CC00FF33CC00FF33C302FF238802BB4DBB28E535CC
          03FF33CC00FF33CC00FF33CC00FF259500FF259500FFFFFFFFFFFFFFFFFF2595
          00FF259500FF259500FF259500FF33CC00FF33CB01FF2DA305E559D231FF33CC
          00FF33CC00FF33CC00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF259500FF33CC00FF33CC00FF35B709FF5CD434FF33CC
          00FF33CC00FF33CC00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF33CC00FF33CC00FF33CC00FF37B80CFF54BF30E536CC
          03FF33CC00FF33CC00FF33CC00FF33CC00FF33CC00FFFFFFFFFFFFFFFFFF2595
          00FF33CC00FF33CC00FF33CC00FF33CC00FF34CB01FF33A80DE53F9B20BB43CF
          14FF33CC00FF33CC00FF33CC00FF33CC00FF33CC00FFFFFFFFFFFFFFFFFF2595
          00FF33CC00FF33CC00FF33CC00FF33CC00FF37C708FF2B8D0ABB132C0B345BD6
          32FF33CC00FF33CC00FF33CC00FF33CC00FF33CC00FFFFFFFFFFFFFFFFFF33CC
          00FF33CC00FF33CC00FF33CC00FF33CC00FF3FC114FF0C270434000000003D92
          20AF4DD220FF33CC00FF33CC00FF33CC00FF33CC00FF33CC00FF33CC00FF33CC
          00FF33CC00FF33CC00FF33CC00FF3DC710FF2C860EAF00000000000000000407
          040853BF2EE34DD220FF33CC00FF33CC00FF33CC00FF33CC00FF33CC00FF33CC
          00FF33CC00FF33CC00FF40C913FF3EB019E30306020800000000000000000000
          0000000000003D9220AF5BD632FF43CF14FF36CC03FF33CC00FF33CC00FF35CC
          03FF3ECC0FFF4CCB22FF318A14AF000000000000000000000000000000000000
          000000000000000000000F26072E3C9220AF50BD2CE35CD434FF59D231FF4AB9
          25E3368D18AF0D25052E00000000000000000000000000000000}
        OnClick = SpeedButton1Click
      end
      object SpeedButton2: TSpeedButton
        Left = 2
        Top = 24
        Width = 24
        Height = 24
        Glyph.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          000000000000000000000209212C0A2281AF0C2AA4E30C2DB3FF092BB2FF0524
          9EE3021A7BAF00061F2C00000000000000000000000000000000000000000000
          0000000000000E2684AF1335BCFF072BBEFF0127BDFF0026BDFF0026BCFF0126
          BCFF0227B8FF0326B0FF011979AF000000000000000000000000000000000203
          06081836AEE31033C0FF0026BFFF0025BBFF0025B8FF0024B6FF0024B6FF0024
          B6FF0025B8FF0025BBFF0226B5FF01209CE3000105080000000000000000142B
          89AF1336C3FF0026BFFF0025BAFF0024B6FF0024B2FF0023B0FF0023AFFF0023
          B0FF0024B2FF0024B6FF0025BAFF0226B5FF011979AF00000000080E29342143
          C7FF0026C1FF0025BBFF0024B6FF0023B1FF0023ADFF0022AAFF0022A9FF0022
          AAFF0023ADFF0023B1FF0024B6FF0025BBFF0326B0FF00072434183195BB0F34
          C6FF0026BEFF0025B8FF0024B2FF0023ADFF0022A8FF0021A4FF0021A2FF0021
          A4FF0022A8FF0023ADFF0024B2FF0025B8FF0227B8FF021C84BB2845B8E50329
          C3FF0026BDFF0024B6FF0023B0FF001E95FF001E95FF001E95FF001E95FF001E
          95FF001E95FF001E95FF001E95FF0024B6FF0126BCFF05249EE53151CFFF0027
          C3FF0026BCFF0024B6FFFEFEFFFFF9FAFEFFF4F6FDFFF0F2FCFFEBEEFBFFE6EA
          FAFFE1E6F9FFDCE2F8FF001E95FF0024B6FF0026BCFF092BB2FF3453D1FF0027
          C3FF0026BDFF0024B6FFFFFFFFFFFAFBFEFFF5F7FDFFF1F3FCFFECEFFBFFE7EB
          FAFFE2E7F9FFDDE2F8FF0023B0FF0024B6FF0026BDFF0C2DB3FF304CBDE5032A
          C6FF0026BEFF0025B8FF5970CDFF586EC9FF566CC6FF546AC3FF5269C1FF5167
          C2FF4F67C4FF4D66C7FF0024B2FF0025B8FF0127BDFF0D2AA4E520389ABB1439
          CBFF0026C1FF0025BBFF0024B6FF0023B1FF0023ADFF0022AAFF0022A9FF0022
          AAFF0023ADFF0023B1FF0024B6FF0025BBFF072BBEFF0A238ABB0B112B343252
          D3FF0027C4FF0026BFFF0025BAFF0024B6FF0024B2FF0023B0FF0023AFFF0023
          B0FF0024B2FF0024B6FF0025BAFF0026BFFF1335BCFF040B2734000000002037
          91AF2043CFFF0027C3FF0026BFFF0025BBFF0025B8FF0024B6FF0024B6FF0024
          B6FF0025B8FF0025BBFF0026BFFF1033C0FF0E2684AF00000000000000000404
          07082E4BBDE32043CFFF0027C4FF0026C1FF0026BEFF0026BDFF0026BCFF0026
          BDFF0026BEFF0026C1FF1336C3FF1836AEE30203060800000000000000000000
          000000000000203791AF3252D3FF1439CBFF032AC6FF0027C3FF0027C3FF0329
          C3FF0F34C6FF2143C7FF142B89AF000000000000000000000000000000000000
          00000000000000000000070D262E203690AF2C48BBE33453D1FF3151CFFF2543
          B6E3182F8BAF050B242E00000000000000000000000000000000}
        OnClick = SpeedButton2Click
      end
    end
    object grdRep: TStringGrid
      Left = 2
      Top = 15
      Width = 748
      Height = 72
      Align = alClient
      ColCount = 9
      DefaultRowHeight = 16
      RowCount = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
      ParentFont = False
      TabOrder = 0
      OnKeyPress = grdRepKeyPress
      OnMouseMove = grdRepMouseMove
      OnSelectCell = grdRepSelectCell
      OnSetEditText = grdRepSetEditText
    end
  end
  object qrRep: TFDQuery
    Connection = DM.Connect
    Transaction = DM.Read
    UpdateTransaction = DM.Write
    Left = 441
    Top = 153
  end
  object qrTemp: TFDQuery
    Connection = DM.Connect
    Transaction = DM.Read
    UpdateTransaction = DM.Write
    FetchOptions.AssignedValues = [evRecordCountMode]
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    Left = 520
    Top = 145
  end
  object PMEntry: TPopupMenu
    AutoHotkeys = maManual
    OnPopup = PMEntryPopup
    Left = 608
    Top = 145
    object pmShowRep: TMenuItem
      Caption = #1048#1089#1087#1086#1083#1100#1079#1086#1074#1072#1090#1100' '#1079#1072#1084#1077#1085#1103#1102#1097#1080#1077
      OnClick = pmShowRepClick
    end
    object pmCurRate: TMenuItem
      Caption = 'CurRate'
      object pmSelectRate: TMenuItem
        Tag = 1
        Caption = #1042#1099#1073#1088#1072#1090#1100
        OnClick = pmSelectRateClick
      end
      object pmDeselectRate: TMenuItem
        Caption = #1054#1090#1084#1077#1085#1080#1090#1100
        OnClick = pmSelectRateClick
      end
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object pmSelectAll: TMenuItem
      Tag = 1
      Caption = #1042#1099#1073#1088#1072#1090#1100' '#1074#1089#1077
      OnClick = pmSelectAllClick
    end
    object pmDeselectAll: TMenuItem
      Caption = #1054#1090#1084#1077#1085#1080#1090#1100' '#1074#1089#1077
      OnClick = pmSelectAllClick
    end
  end
end
