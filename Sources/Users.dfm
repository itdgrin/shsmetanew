object fUsers: TfUsers
  Left = 0
  Top = 0
  ActiveControl = dblklst1
  Caption = #1059#1095#1077#1090#1085#1099#1077' '#1079#1072#1087#1080#1089#1080' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1077#1081
  ClientHeight = 449
  ClientWidth = 589
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object pgc1: TPageControl
    Left = 0
    Top = 0
    Width = 589
    Height = 449
    ActivePage = ts1
    Align = alClient
    TabOrder = 0
    OnChanging = pgc1Changing
    object ts2: TTabSheet
      Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1080
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object spl2: TSplitter
        Left = 185
        Top = 36
        Width = 5
        Height = 385
        ExplicitHeight = 383
      end
      object tlb1: TToolBar
        Left = 0
        Top = 0
        Width = 581
        Height = 36
        ButtonHeight = 36
        ButtonWidth = 86
        Caption = 'tlb1'
        Images = DM.ilIcons_16x16
        ShowCaptions = True
        TabOrder = 0
        object btn5: TToolButton
          Left = 0
          Top = 0
          Caption = #1044#1086#1073#1072#1074#1080#1090#1100
          ImageIndex = 39
          Style = tbsTextButton
          OnClick = btn5Click
        end
        object btn6: TToolButton
          Left = 86
          Top = 0
          Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100
          ImageIndex = 35
        end
        object btn7: TToolButton
          Left = 172
          Top = 0
          Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
          ImageIndex = 44
          OnClick = btn7Click
        end
        object btn8: TToolButton
          Left = 258
          Top = 0
          Caption = #1059#1076#1072#1083#1080#1090#1100
          ImageIndex = 38
        end
      end
      object pnl3: TPanel
        Left = 0
        Top = 36
        Width = 185
        Height = 385
        Align = alLeft
        Caption = 'pnl1'
        TabOrder = 1
        object lbl3: TLabel
          AlignWithMargins = True
          Left = 4
          Top = 4
          Width = 177
          Height = 13
          Align = alTop
          Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1080':'
          ExplicitWidth = 76
        end
        object dblklst2: TDBLookupListBox
          Left = 1
          Top = 20
          Width = 183
          Height = 364
          Align = alClient
          BevelKind = bkSoft
          BorderStyle = bsNone
          KeyField = 'USER_ID'
          ListField = 'USER_NAME'
          ListSource = dsUser
          TabOrder = 0
          ExplicitHeight = 351
        end
      end
      object pnl4: TPanel
        Left = 190
        Top = 36
        Width = 391
        Height = 385
        Align = alClient
        Enabled = False
        TabOrder = 2
        object lbl4: TLabel
          AlignWithMargins = True
          Left = 4
          Top = 117
          Width = 383
          Height = 13
          Align = alTop
          Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080' '#1076#1086#1089#1090#1091#1087#1072':'
          ExplicitWidth = 103
        end
        object pnl6: TPanel
          Left = 1
          Top = 1
          Width = 389
          Height = 113
          Align = alTop
          TabOrder = 0
          object lbl6: TLabel
            Left = 5
            Top = 5
            Width = 97
            Height = 13
            Caption = #1048#1084#1103' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103':'
          end
          object lbl7: TLabel
            Left = 5
            Top = 59
            Width = 41
            Height = 13
            Caption = #1055#1072#1088#1086#1083#1100':'
          end
          object lbl8: TLabel
            Left = 5
            Top = 86
            Width = 126
            Height = 13
            Caption = #1055#1086#1076#1090#1074#1077#1088#1078#1076#1077#1085#1080#1077' '#1087#1072#1088#1086#1083#1103':'
          end
          object lbl9: TLabel
            Left = 5
            Top = 32
            Width = 40
            Height = 13
            Caption = #1043#1088#1091#1087#1087#1072':'
          end
          object dbedtUSER_NAME: TDBEdit
            Left = 108
            Top = 5
            Width = 274
            Height = 21
            DataField = 'USER_NAME'
            DataSource = dsUser
            TabOrder = 0
          end
          object dblkcbbUSER_GROUP_ID: TDBLookupComboBox
            Left = 108
            Top = 32
            Width = 274
            Height = 21
            DataField = 'USER_GROUP_ID'
            DataSource = dsUser
            KeyField = 'USER_GROUP_ID'
            ListField = 'USER_GROUP_NAME'
            ListSource = dsUserGroup
            TabOrder = 1
          end
          object dbedtUSER_PASS: TDBEdit
            Left = 137
            Top = 59
            Width = 245
            Height = 21
            DataField = 'USER_PASS'
            DataSource = dsUser
            PasswordChar = '*'
            TabOrder = 2
          end
          object edt1: TEdit
            Left = 137
            Top = 86
            Width = 245
            Height = 21
            PasswordChar = '*'
            TabOrder = 3
          end
        end
        object tvDocuments: TJvDBTreeView
          AlignWithMargins = True
          Left = 4
          Top = 136
          Width = 383
          Height = 245
          DataSource = dsTreeData
          MasterField = 'doc_id'
          DetailField = 'parent_id'
          IconField = 'doc_type'
          ItemField = 'doc_name'
          StartMasterValue = '0'
          UseFilter = True
          PersistentNode = True
          DragMode = dmAutomatic
          HideSelection = False
          Indent = 19
          Align = alClient
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          TabOrder = 1
          ParentFont = False
          RowSelect = True
          Mirror = False
        end
      end
    end
    object ts1: TTabSheet
      Caption = #1043#1088#1091#1087#1087#1099' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1077#1081
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object spl1: TSplitter
        Left = 185
        Top = 36
        Width = 5
        Height = 385
        ExplicitHeight = 383
      end
      object pnl1: TPanel
        Left = 0
        Top = 36
        Width = 185
        Height = 385
        Align = alLeft
        Caption = 'pnl1'
        TabOrder = 1
        object lbl1: TLabel
          AlignWithMargins = True
          Left = 4
          Top = 4
          Width = 177
          Height = 13
          Align = alTop
          Caption = #1043#1088#1091#1087#1087#1099' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1077#1081':'
          ExplicitWidth = 122
        end
        object dblklst1: TDBLookupListBox
          Left = 1
          Top = 20
          Width = 183
          Height = 364
          Align = alClient
          BevelKind = bkSoft
          BorderStyle = bsNone
          KeyField = 'USER_GROUP_ID'
          ListField = 'USER_GROUP_NAME'
          ListSource = dsUserGroup
          TabOrder = 0
          ExplicitHeight = 351
        end
      end
      object pnl2: TPanel
        Left = 190
        Top = 36
        Width = 391
        Height = 385
        Align = alClient
        Enabled = False
        TabOrder = 2
        object lbl2: TLabel
          AlignWithMargins = True
          Left = 4
          Top = 36
          Width = 383
          Height = 13
          Align = alTop
          Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080' '#1076#1086#1089#1090#1091#1087#1072':'
          ExplicitWidth = 103
        end
        object pnl5: TPanel
          Left = 1
          Top = 1
          Width = 389
          Height = 32
          Align = alTop
          TabOrder = 0
          object lbl5: TLabel
            Left = 5
            Top = 5
            Width = 52
            Height = 13
            Caption = #1053#1072#1079#1074#1072#1085#1080#1077':'
          end
          object dbedtUSER_GROUP_NAME: TDBEdit
            Left = 63
            Top = 5
            Width = 320
            Height = 21
            DataField = 'USER_GROUP_NAME'
            DataSource = dsUserGroup
            TabOrder = 0
          end
        end
        object JvDBTreeView1: TJvDBTreeView
          AlignWithMargins = True
          Left = 4
          Top = 55
          Width = 383
          Height = 326
          DataSource = dsTreeData
          MasterField = 'doc_id'
          DetailField = 'parent_id'
          IconField = 'doc_type'
          ItemField = 'doc_name'
          StartMasterValue = '0'
          UseFilter = True
          PersistentNode = True
          DragMode = dmAutomatic
          HideSelection = False
          Indent = 19
          Align = alClient
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          TabOrder = 1
          ParentFont = False
          RowSelect = True
          Mirror = False
        end
      end
      object tlb3: TToolBar
        Left = 0
        Top = 0
        Width = 581
        Height = 36
        ButtonHeight = 36
        ButtonWidth = 86
        Caption = 'tlb1'
        Images = DM.ilIcons_16x16
        ShowCaptions = True
        TabOrder = 0
        object btn2: TToolButton
          Left = 0
          Top = 0
          Caption = #1044#1086#1073#1072#1074#1080#1090#1100
          ImageIndex = 39
          Style = tbsTextButton
          OnClick = btn2Click
        end
        object btn1: TToolButton
          Left = 86
          Top = 0
          Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100
          ImageIndex = 35
        end
        object btn3: TToolButton
          Left = 172
          Top = 0
          Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
          ImageIndex = 44
          OnClick = btn3Click
        end
        object btn4: TToolButton
          Left = 258
          Top = 0
          Caption = #1059#1076#1072#1083#1080#1090#1100
          ImageIndex = 38
        end
      end
    end
  end
  object FormStorage: TJvFormStorage
    AppStorage = FormMain.AppIni
    AppStoragePath = '%FORM_NAME%\'
    Options = []
    StoredProps.Strings = (
      'pnl1.Height'
      'pnl3.Height')
    StoredValues = <>
    Left = 40
    Top = 272
  end
  object qrUserGroup: TFDQuery
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
    UpdateOptions.UpdateTableName = 'smeta.user_group'
    UpdateOptions.KeyFields = 'USER_GROUP_ID'
    SQL.Strings = (
      'SELECT * FROM USER_GROUP')
    Left = 43
    Top = 152
  end
  object dsUserGroup: TDataSource
    DataSet = qrUserGroup
    Left = 43
    Top = 200
  end
  object qrUser: TFDQuery
    AfterInsert = qrUserAfterEdit
    AfterEdit = qrUserAfterEdit
    BeforePost = qrUserBeforePost
    AfterPost = qrUserAfterPost
    AfterScroll = qrUserAfterScroll
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
    UpdateOptions.UpdateTableName = 'smeta.user'
    UpdateOptions.KeyFields = 'USER_ID'
    SQL.Strings = (
      'SELECT * FROM USER')
    Left = 107
    Top = 160
  end
  object dsUser: TDataSource
    DataSet = qrUser
    Left = 107
    Top = 208
  end
  object qrTreeData: TFDQuery
    Connection = DM.Connect
    Transaction = DM.Read
    UpdateTransaction = DM.Write
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    SQL.Strings = (
      'SELECT * '
      'FROM '
      '  `doc` '
      'WHERE `doc_id` > 100'
      'ORDER BY `doc_name`')
    Left = 233
    Top = 270
  end
  object dsTreeData: TDataSource
    DataSet = qrTreeData
    Left = 232
    Top = 318
  end
end
