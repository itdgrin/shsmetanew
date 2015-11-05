inherited FrameRates: TFrameRates
  Width = 754
  Height = 530
  ParentFont = False
  OnResize = FrameResize
  ExplicitWidth = 754
  ExplicitHeight = 530
  object PanelRates: TPanel
    Left = 0
    Top = 0
    Width = 754
    Height = 511
    Align = alClient
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 0
    object SplitterLeft: TSplitter
      Left = 110
      Top = 0
      Width = 5
      Height = 511
      ResizeStyle = rsUpdate
      OnMoved = SplitterLeftMoved
      ExplicitLeft = 128
      ExplicitTop = 1
      ExplicitHeight = 430
    end
    object ImageSplitterLeft: TImage
      Left = 106
      Top = 20
      Width = 5
      Height = 15
      Cursor = crHSplit
      AutoSize = True
    end
    object ImageSplitterRight: TImage
      Left = 433
      Top = 105
      Width = 5
      Height = 15
      Cursor = crHSplit
      AutoSize = True
    end
    object SplitterRight: TSplitter
      Left = 660
      Top = 0
      Width = 5
      Height = 511
      Align = alRight
      ResizeStyle = rsUpdate
      OnMoved = SplitterRightMoved
      ExplicitLeft = 128
      ExplicitTop = 1
      ExplicitHeight = 458
    end
    object PanelLeft: TPanel
      Left = 0
      Top = 0
      Width = 110
      Height = 511
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 0
      object EditRate: TEdit
        Left = 0
        Top = 0
        Width = 110
        Height = 21
        Align = alTop
        Alignment = taCenter
        TabOrder = 0
        OnChange = EditRateChange
        OnEnter = EditRateEnter
        OnKeyPress = EditRateKeyPress
      end
      object grRates: TJvDBGrid
        Left = 0
        Top = 21
        Width = 110
        Height = 468
        Align = alClient
        DataSource = dsNormativ
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Options = [dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgTitleClick, dgTitleHotTrack]
        ParentFont = False
        PopupMenu = pmRatesEx
        ReadOnly = True
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDblClick = grRatesDblClick
        OnEnter = grRatesEnter
        OnExit = grRatesExit
        OnKeyPress = VSTKeyPress
        AutoAppend = False
        ScrollBars = ssVertical
        AutoSizeColumns = True
        SelectColumnsDialogStrings.Caption = 'Select columns'
        SelectColumnsDialogStrings.OK = '&OK'
        SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
        EditControls = <>
        RowsHeight = 16
        TitleRowHeight = 16
        Columns = <
          item
            Expanded = False
            FieldName = 'NumberNormative'
            Width = 105
            Visible = True
          end>
      end
      object pnlNaviator: TPanel
        Left = 0
        Top = 489
        Width = 110
        Height = 22
        Align = alBottom
        TabOrder = 2
        OnResize = pnlNaviatorResize
        object btnNext: TSpeedButton
          Left = 56
          Top = 1
          Width = 55
          Height = 20
          Hint = #1057#1083#1077#1076#1091#1102#1097#1072#1103' '#1089#1090#1088#1072#1085#1080#1094#1072
          Align = alLeft
          Caption = '>>'
          ParentShowHint = False
          ShowHint = True
          OnClick = btnNextClick
          ExplicitLeft = 55
          ExplicitTop = 0
          ExplicitHeight = 22
        end
        object btnPrev: TSpeedButton
          Left = 1
          Top = 1
          Width = 55
          Height = 20
          Hint = #1055#1088#1077#1076#1080#1076#1091#1097#1072#1103' '#1089#1090#1088#1072#1085#1080#1094#1072
          Align = alLeft
          Caption = '<<'
          ParentShowHint = False
          ShowHint = True
          OnClick = btnPrevClick
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitHeight = 22
        end
      end
    end
    object PanelRight: TPanel
      Left = 665
      Top = 0
      Width = 89
      Height = 511
      Align = alRight
      BevelOuter = bvLowered
      TabOrder = 2
    end
    object PanelCenter: TPanel
      Left = 115
      Top = 0
      Width = 545
      Height = 511
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object PanelShowHideButton: TPanel
        Left = 530
        Top = 0
        Width = 15
        Height = 511
        Align = alRight
        BevelOuter = bvNone
        TabOrder = 1
        object SpeedButtonShowHideRightPanel: TSpeedButton
          Left = 0
          Top = 0
          Width = 15
          Height = 511
          Align = alClient
          Flat = True
          ParentShowHint = False
          ShowHint = True
          OnClick = SpeedButtonShowHideRightPanelClick
          ExplicitTop = 120
          ExplicitHeight = 89
        end
      end
      object PanelCenterClient: TPanel
        Left = 0
        Top = 0
        Width = 530
        Height = 511
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object ImageSplitterTop: TImage
          Left = 312
          Top = 0
          Width = 15
          Height = 5
          Cursor = crVSplit
        end
        object SplitterTop: TSplitter
          Left = 0
          Top = 96
          Width = 530
          Height = 5
          Cursor = crVSplit
          Align = alTop
          ResizeStyle = rsUpdate
          OnMoved = SplitterTopMoved
          ExplicitTop = 245
          ExplicitWidth = 470
        end
        object PanelCollection: TPanel
          Left = 0
          Top = 0
          Width = 530
          Height = 96
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object PanelHeaderCollection: TPanel
            Left = 0
            Top = 25
            Width = 530
            Height = 25
            Align = alTop
            BevelOuter = bvNone
            ParentBackground = False
            TabOrder = 1
            object LabelSbornik: TLabel
              AlignWithMargins = True
              Left = 7
              Top = 5
              Width = 57
              Height = 17
              Hint = #1054#1090#1082#1088#1099#1090#1100' '#1086#1082#1085#1086' '#1080#1089#1093#1086#1076#1085#1099#1093' '#1076#1072#1085#1085#1099#1093
              Margins.Left = 7
              Margins.Top = 5
              Margins.Right = 7
              Align = alLeft
              Caption = #1057#1073#1086#1088#1085#1080#1082#1080':'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              OnClick = LabelSbornikClick
              OnMouseEnter = LabelSbornikMouseEnter
              OnMouseLeave = LabelSbornikMouseLeave
              ExplicitHeight = 13
            end
            object btnSelectCollection: TSpeedButton
              AlignWithMargins = True
              Left = 504
              Top = 1
              Width = 23
              Height = 23
              Hint = #1042#1099#1073#1088#1072#1090#1100' '#1089#1073#1086#1088#1085#1080#1082' '#1088#1072#1089#1094#1077#1085#1086#1082
              Margins.Top = 1
              Margins.Bottom = 1
              Align = alRight
              Caption = '...'
              ParentShowHint = False
              ShowHint = True
              Visible = False
              OnClick = btnSelectCollectionClick
              ExplicitLeft = 507
              ExplicitTop = 2
            end
            object EditCollection: TEdit
              AlignWithMargins = True
              Left = 71
              Top = 2
              Width = 427
              Height = 21
              Hint = 
                #1042#1074#1077#1076#1080#1090#1077' '#1095#1072#1089#1090#1100' '#1086#1087#1080#1089#1072#1085#1080#1103' '#1088#1072#1073#1086#1090' '#1080' '#1085#1072#1078#1084#1080#1090#1077' - Enter, '#1076#1083#1103' '#1086#1095#1080#1089#1090#1082#1080' '#1085#1072#1078#1084 +
                #1080#1090#1077' - Esc'
              Margins.Left = 0
              Margins.Top = 2
              Margins.Bottom = 2
              Align = alClient
              Color = 14802912
              ParentShowHint = False
              ReadOnly = True
              ShowHint = True
              TabOrder = 0
              OnKeyPress = EditSearchNormativeKeyPress
            end
          end
          object PanelSearchNormative: TPanel
            Left = 0
            Top = 0
            Width = 530
            Height = 25
            Align = alTop
            BevelOuter = bvNone
            ParentBackground = False
            TabOrder = 0
            DesignSize = (
              530
              25)
            object LabelSearchNormative: TLabel
              Left = 31
              Top = 6
              Width = 34
              Height = 13
              Caption = #1055#1086#1080#1089#1082':'
            end
            object EditSearchNormative: TEdit
              Left = 71
              Top = 2
              Width = 269
              Height = 21
              Hint = 
                #1042#1074#1077#1076#1080#1090#1077' '#1095#1072#1089#1090#1100' '#1086#1087#1080#1089#1072#1085#1080#1103' '#1088#1072#1073#1086#1090' '#1080' '#1085#1072#1078#1084#1080#1090#1077' - Enter, '#1076#1083#1103' '#1086#1095#1080#1089#1090#1082#1080' '#1085#1072#1078#1084 +
                #1080#1090#1077' - Esc'
              Anchors = [akLeft, akTop, akRight]
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              OnEnter = EditSearchNormativeEnter
              OnKeyPress = EditSearchNormativeKeyPress
            end
            object rb1: TRadioButton
              Left = 346
              Top = 2
              Width = 89
              Height = 17
              Anchors = [akTop, akRight]
              Caption = #1042#1089#1077' '#1088#1072#1089#1094#1077#1085#1082#1080
              Checked = True
              TabOrder = 1
              TabStop = True
              OnClick = chk1Click
            end
            object rb2: TRadioButton
              Left = 441
              Top = 2
              Width = 89
              Height = 17
              Anchors = [akTop, akRight]
              Caption = #1055#1091#1089#1082#1086#1085#1072#1083#1072#1076#1082#1072
              TabOrder = 2
              OnClick = chk1Click
            end
          end
          object dbmmoCaptionNormative: TDBMemo
            Left = 0
            Top = 50
            Width = 530
            Height = 46
            Align = alClient
            DataField = 'CaptionNormativ'
            DataSource = dsNormativ
            ReadOnly = True
            ScrollBars = ssVertical
            TabOrder = 2
          end
        end
        object Panel1: TPanel
          Left = 0
          Top = 101
          Width = 530
          Height = 410
          Align = alClient
          BevelOuter = bvNone
          Caption = 'Panel1'
          ShowCaption = False
          TabOrder = 1
          object ImageSplitter1: TImage
            Left = 320
            Top = 8
            Width = 15
            Height = 5
            Cursor = crVSplit
          end
          object ImageSplitter2: TImage
            Left = 328
            Top = 16
            Width = 15
            Height = 5
            Cursor = crVSplit
          end
          object PanelHorizontal1: TPanel
            Left = 0
            Top = 0
            Width = 530
            Height = 25
            Align = alTop
            BevelOuter = bvNone
            ParentBackground = False
            TabOrder = 0
            object LabelJustification: TLabel
              Left = 6
              Top = 6
              Width = 71
              Height = 13
              Caption = #1054#1073#1086#1089#1085#1086#1074#1072#1085#1080#1077':'
            end
            object LabelUnit: TLabel
              Left = 304
              Top = 6
              Width = 103
              Height = 13
              Caption = #1045#1076#1080#1085#1080#1094#1072' '#1080#1079#1084#1077#1088#1077#1085#1080#1103':'
            end
            object Edit5: TEdit
              Left = 189
              Top = 2
              Width = 109
              Height = 21
              Alignment = taCenter
              Color = 8454016
              Enabled = False
              ReadOnly = True
              TabOrder = 2
              Text = #1044#1077#1081#1089#1090#1074#1091#1102#1097#1072#1103
            end
            object dbedtNumberNormative: TDBEdit
              Left = 83
              Top = 2
              Width = 100
              Height = 21
              Color = 14802912
              DataField = 'NumberNormative'
              DataSource = dsNormativ
              ReadOnly = True
              TabOrder = 0
            end
            object dbedtUnit: TDBEdit
              Left = 413
              Top = 2
              Width = 100
              Height = 21
              Color = 14802912
              DataField = 'Unit'
              DataSource = dsNormativ
              ReadOnly = True
              TabOrder = 3
            end
            object cbbType: TComboBox
              Left = 189
              Top = 2
              Width = 109
              Height = 21
              Style = csDropDownList
              DropDownCount = 3
              ItemIndex = 0
              TabOrder = 1
              Text = #1056#1072#1089#1094#1077#1085#1082#1072
              OnChange = cbbTypeChange
              Items.Strings = (
                #1056#1072#1089#1094#1077#1085#1082#1072
                #1055#1091#1089#1082#1086#1085#1072#1083#1072#1076#1082#1072
                #1059#1053#1056)
            end
          end
          object PanelHorizontal2: TPanel
            Left = 0
            Top = 50
            Width = 530
            Height = 25
            Align = alTop
            BevelOuter = bvNone
            ParentBackground = False
            TabOrder = 2
            object LabelWinterPrice: TLabel
              AlignWithMargins = True
              Left = 8
              Top = 3
              Width = 121
              Height = 19
              Margins.Left = 8
              Align = alLeft
              Caption = #1047#1080#1084#1085#1077#1077' '#1091#1076#1086#1088#1086#1078#1072#1085#1080#1077' '#1085#1072':'
              ExplicitHeight = 13
            end
            object btnSelectWinterPrice: TSpeedButton
              AlignWithMargins = True
              Left = 504
              Top = 1
              Width = 23
              Height = 23
              Hint = #1042#1099#1073#1088#1072#1090#1100' '#1079#1080#1084#1085#1077#1077' '#1091#1076#1086#1088#1086#1078#1072#1085#1080#1077' '#1076#1083#1103' '#1088#1072#1089#1094#1077#1085#1082#1080
              Margins.Top = 1
              Margins.Bottom = 1
              Align = alRight
              Caption = '...'
              ParentShowHint = False
              ShowHint = True
              Visible = False
              OnClick = btnSelectWinterPriceClick
              ExplicitLeft = 546
              ExplicitTop = 2
            end
            object EditWinterPrice: TEdit
              AlignWithMargins = True
              Left = 135
              Top = 2
              Width = 363
              Height = 21
              Margins.Top = 2
              Margins.Bottom = 2
              Align = alClient
              Color = 14802912
              ReadOnly = True
              TabOrder = 0
            end
          end
          object PanelHorizontal3: TPanel
            Left = 0
            Top = 75
            Width = 530
            Height = 25
            Align = alTop
            BevelOuter = bvNone
            ParentBackground = False
            TabOrder = 3
            object Label2: TLabel
              Left = 8
              Top = 6
              Width = 127
              Height = 13
              Caption = #1057#1082#1088#1099#1090'/'#1087#1086#1082#1072#1079#1072#1090#1100' '#1087#1072#1085#1077#1083#1080':'
            end
            object CheckBoxNormСonsumption: TCheckBox
              Left = 141
              Top = 4
              Width = 97
              Height = 17
              Caption = #1053#1086#1088#1084#1099' '#1088#1072#1089#1093#1086#1076#1072
              Checked = True
              State = cbChecked
              TabOrder = 0
              OnClick = ShowHidePanels
            end
            object CheckBoxStructureWorks: TCheckBox
              Left = 244
              Top = 4
              Width = 90
              Height = 17
              Caption = #1057#1086#1089#1090#1072#1074' '#1088#1072#1073#1086#1090
              Checked = True
              State = cbChecked
              TabOrder = 1
              OnClick = ShowHidePanels
            end
            object CheckBoxChangesAdditions: TCheckBox
              Left = 340
              Top = 4
              Width = 155
              Height = 17
              Caption = #1048#1079#1084#1077#1085#1077#1085#1080#1103' '#1080' '#1076#1086#1087#1086#1083#1085#1077#1085#1080#1103
              Checked = True
              State = cbChecked
              TabOrder = 2
              OnClick = ShowHidePanels
            end
          end
          object Panel2: TPanel
            Left = 0
            Top = 25
            Width = 530
            Height = 25
            Align = alTop
            BevelOuter = bvNone
            ParentBackground = False
            TabOrder = 1
            DesignSize = (
              530
              25)
            object LabelOXROPR: TLabel
              Left = 6
              Top = 6
              Width = 141
              Height = 13
              Caption = #1054#1061#1056' '#1080' '#1054#1055#1056' '#1080' '#1055#1083#1072#1085' '#1087#1088#1080#1073#1099#1083#1080':'
            end
            object dblkcbbwork_id: TDBLookupComboBox
              Left = 153
              Top = 2
              Width = 371
              Height = 21
              Anchors = [akLeft, akTop, akRight]
              DataField = 'work_id'
              DropDownRows = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              KeyField = 'work_id'
              ListField = 'work_name'
              ListSource = dsObjWorks
              ParentFont = False
              TabOrder = 0
              OnCloseUp = dblkcbbwork_idCloseUp
            end
          end
          object Panel3: TPanel
            Left = 0
            Top = 100
            Width = 530
            Height = 310
            Align = alClient
            BevelOuter = bvNone
            Caption = 'Panel3'
            ShowCaption = False
            TabOrder = 4
            object Splitter2: TSplitter
              Left = 0
              Top = 170
              Width = 530
              Height = 5
              Cursor = crVSplit
              Align = alBottom
              ResizeStyle = rsUpdate
              ExplicitLeft = 6
              ExplicitTop = 169
              ExplicitWidth = 569
            end
            object Splitter1: TSplitter
              Left = 0
              Top = 65
              Width = 530
              Height = 5
              Cursor = crVSplit
              Align = alBottom
              ResizeStyle = rsUpdate
              ExplicitTop = 0
              ExplicitWidth = 569
            end
            object PanelChangesAdditions: TPanel
              Left = 0
              Top = 175
              Width = 530
              Height = 100
              Align = alBottom
              BevelOuter = bvNone
              Constraints.MinHeight = 20
              TabOrder = 2
              object PanelCAHeader: TPanel
                Left = 0
                Top = 0
                Width = 530
                Height = 20
                Align = alTop
                BevelOuter = bvNone
                Caption = #1048#1079#1084#1077#1085#1077#1085#1080#1103' '#1080' '#1076#1086#1087#1086#1083#1085#1077#1085#1080#1103
                Color = clActiveCaption
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentBackground = False
                ParentFont = False
                TabOrder = 0
              end
              object grHistory: TJvDBGrid
                Left = 0
                Top = 20
                Width = 530
                Height = 80
                Align = alClient
                DataSource = dsHistory
                Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
                TabOrder = 1
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'Tahoma'
                TitleFont.Style = []
                OnResize = grNCResize
                ScrollBars = ssNone
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
                    FieldName = 'date_beginer'
                    Title.Alignment = taCenter
                    Title.Caption = #1044#1072#1090#1072' '#1074#1089#1090#1091#1087#1083#1077#1085#1080#1103' '#1074' '#1089#1080#1083#1091
                    Width = 144
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'prikaz'
                    Title.Alignment = taCenter
                    Title.Caption = #1054#1089#1085#1086#1074#1072#1085#1080#1077
                    Width = 380
                    Visible = True
                  end>
              end
            end
            object PanelNormСonsumption: TPanel
              Left = 0
              Top = 0
              Width = 530
              Height = 65
              Align = alClient
              BevelOuter = bvNone
              Constraints.MinHeight = 20
              TabOrder = 0
              object PanelNCHeader: TPanel
                Left = 0
                Top = 0
                Width = 530
                Height = 20
                Align = alTop
                BevelOuter = bvNone
                Caption = #1053#1086#1088#1084#1072' '#1088#1072#1089#1093#1086#1076#1072
                Color = clActiveCaption
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentBackground = False
                ParentFont = False
                TabOrder = 0
              end
              object grNC: TJvDBGrid
                Left = 0
                Top = 20
                Width = 530
                Height = 45
                Align = alClient
                DataSource = dsNC
                Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleHotTrack]
                PopupMenu = pmNC
                ReadOnly = True
                TabOrder = 1
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'Tahoma'
                TitleFont.Style = []
                OnDrawColumnCell = grNCDrawColumnCell
                OnEnter = grNCEnter
                AutoAppend = False
                OnResize = grNCResize
                ScrollBars = ssNone
                AutoSizeColumns = True
                AutoSizeColumnIndex = 1
                SelectColumnsDialogStrings.Caption = 'Select columns'
                SelectColumnsDialogStrings.OK = '&OK'
                SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
                CanDelete = False
                EditControls = <>
                RowsHeight = 17
                TitleRowHeight = 17
                WordWrap = True
                WordWrapAllFields = True
                OnCanEditCell = grNCCanEditCell
                Columns = <
                  item
                    Alignment = taCenter
                    Expanded = False
                    FieldName = 'OBJ_CODE'
                    Title.Alignment = taCenter
                    Title.Caption = #1050#1086#1076
                    Width = 70
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'OBJ_NAME'
                    Title.Alignment = taCenter
                    Title.Caption = #1053#1072#1079#1074#1072#1085#1080#1077
                    Width = 312
                    Visible = True
                  end
                  item
                    Alignment = taRightJustify
                    Expanded = False
                    FieldName = 'OBJ_VALUE'
                    ReadOnly = False
                    Title.Alignment = taCenter
                    Title.Caption = #1053#1086#1088'. '#1088#1072#1089'.'
                    Width = 70
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'UNIT_NAME'
                    Title.Alignment = taCenter
                    Title.Caption = #1045#1076'. '#1080#1079#1084'.'
                    Width = 70
                    Visible = True
                  end>
              end
            end
            object PanelStructureWorks: TPanel
              Left = 0
              Top = 70
              Width = 530
              Height = 100
              Align = alBottom
              BevelOuter = bvNone
              Constraints.MinHeight = 20
              ParentBackground = False
              TabOrder = 1
              object PanelSWHeader: TPanel
                Left = 0
                Top = 0
                Width = 530
                Height = 20
                Align = alTop
                BevelOuter = bvNone
                Caption = #1057#1086#1089#1090#1072#1074' '#1088#1072#1073#1086#1090
                Color = clActiveCaption
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentBackground = False
                ParentFont = False
                TabOrder = 0
              end
              object grSostav: TJvDBGrid
                Left = 0
                Top = 20
                Width = 530
                Height = 80
                Align = alClient
                DataSource = dsSW
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                Options = [dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleHotTrack]
                ParentFont = False
                ReadOnly = True
                TabOrder = 1
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'Tahoma'
                TitleFont.Style = []
                AutoAppend = False
                OnResize = grNCResize
                ScrollBars = ssNone
                AutoSizeColumns = True
                SelectColumnsDialogStrings.Caption = 'Select columns'
                SelectColumnsDialogStrings.OK = '&OK'
                SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
                CanDelete = False
                EditControls = <>
                RowsHeight = 17
                TitleRowHeight = 17
                WordWrap = True
                WordWrapAllFields = True
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'FULL_NAME'
                    Title.Alignment = taCenter
                    Title.Caption = #1057#1086#1089#1090#1072#1074' '#1088#1072#1073#1086#1090
                    Width = 525
                    Visible = True
                  end>
              end
            end
            object pnlSaveCancel: TPanel
              Left = 0
              Top = 275
              Width = 530
              Height = 35
              Align = alBottom
              TabOrder = 3
              Visible = False
              DesignSize = (
                530
                35)
              object btnSave: TBitBtn
                Left = 368
                Top = 5
                Width = 75
                Height = 25
                Anchors = [akRight, akBottom]
                Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
                TabOrder = 0
                OnClick = btnSaveClick
              end
              object btnCancel: TBitBtn
                Left = 449
                Top = 5
                Width = 75
                Height = 25
                Anchors = [akRight, akBottom]
                Caption = #1054#1090#1084#1077#1085#1072
                TabOrder = 1
                OnClick = btnCancelClick
              end
            end
          end
        end
      end
    end
  end
  inline FrameStatusBar: TFrameStatusBar
    Left = 0
    Top = 511
    Width = 754
    Height = 19
    Align = alBottom
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 1
    ExplicitTop = 511
    ExplicitWidth = 754
    inherited StatusBar: TStatusBar
      Width = 754
      ExplicitWidth = 754
    end
  end
  object qrNC: TFDQuery
    BeforeOpen = qrNCBeforeOpen
    AfterOpen = qrNCAfterOpen
    BeforePost = qrNCBeforePost
    CachedUpdates = True
    Connection = DM.Connect
    Transaction = DM.Read
    UpdateTransaction = DM.Write
    FetchOptions.AssignedValues = [evItems]
    FetchOptions.Items = [fiBlobs, fiDetails]
    FormatOptions.AssignedValues = [fvMapRules]
    FormatOptions.OwnMapRules = True
    FormatOptions.MapRules = <
      item
        SourceDataType = dtByteString
        TargetDataType = dtAnsiString
      end>
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate, uvUpdateChngFields, uvCountUpdatedRecords, uvCheckRequired, uvCheckReadOnly, uvCheckUpdatable, uvUpdateNonBaseFields]
    UpdateOptions.UpdateChangedFields = False
    UpdateOptions.UpdateNonBaseFields = True
    UpdateOptions.CountUpdatedRecords = False
    UpdateOptions.CheckRequired = False
    UpdateOptions.CheckReadOnly = False
    UpdateOptions.CheckUpdatable = False
    SQL.Strings = (
      
        'SELECT 1 AS OBJ_TYPE, 1 AS FL_PART_NAME, NULL AS OBJ_CODE, "'#1052#1072#1096#1080 +
        #1085#1099' '#1080' '#1084#1077#1093#1072#1085#1080#1079#1084#1099'" AS OBJ_NAME, NULL AS OBJ_VALUE, NULL AS UNIT_NAM' +
        'E, NULL AS ID'
      'UNION ALL'
      
        'SELECT 1 AS OBJ_TYPE, 0 AS FL_PART_NAME, mech_code AS OBJ_CODE, ' +
        'mech_name AS OBJ_NAME, norm_ras AS OBJ_VALUE, unit_name AS UNIT_' +
        'NAME, mechanizmnorm.ID '
      'FROM mechanizm, mechanizmnorm, units'
      
        'WHERE mechanizm.unit_id = units.unit_id and mechanizm.mechanizm_' +
        'id = mechanizmnorm.mechanizm_id and mechanizmnorm.normativ_id = ' +
        ':IdNormativ'
      'UNION ALL'
      
        'SELECT 2 AS OBJ_TYPE, 1 AS FL_PART_NAME, NULL AS OBJ_CODE, "'#1052#1072#1090#1077 +
        #1088#1080#1072#1083#1099' '#1091#1095#1090#1105#1085#1085#1099#1077'" AS OBJ_NAME, NULL AS OBJ_VALUE, NULL AS UNIT_NAM' +
        'E, NULL AS ID'
      'UNION ALL'
      
        'SELECT 2 AS OBJ_TYPE, 0 AS FL_PART_NAME, mat_code AS OBJ_CODE, m' +
        'at_name AS OBJ_NAME, norm_ras  AS OBJ_VALUE, unit_name AS UNIT_N' +
        'AME, materialnorm.ID '
      'FROM materialnorm, material, units'
      
        'WHERE materialnorm.material_id = material.material_id and materi' +
        'al.unit_id = units.unit_id and mat_code LIKE "'#1057'%" and materialno' +
        'rm.normativ_id = :IdNormativ'
      'UNION ALL'
      
        'SELECT 3 AS OBJ_TYPE, 1 AS FL_PART_NAME, NULL AS OBJ_CODE, "'#1052#1072#1090#1077 +
        #1088#1080#1072#1083#1099' '#1085#1077#1091#1095#1090#1105#1085#1085#1099#1077'" AS OBJ_NAME, NULL AS OBJ_VALUE, NULL AS UNIT_N' +
        'AME, NULL AS ID'
      'UNION ALL'
      
        'SELECT 3 AS OBJ_TYPE, 0 AS FL_PART_NAME, mat_code AS OBJ_CODE, m' +
        'at_name AS OBJ_NAME, norm_ras  AS OBJ_VALUE, unit_name AS UNIT_N' +
        'AME, materialnorm.ID '
      'FROM materialnorm, material, units'
      
        'WHERE materialnorm.material_id = material.material_id and materi' +
        'al.unit_id = units.unit_id and mat_code LIKE "'#1055'%" and materialno' +
        'rm.normativ_id = :IdNormativ'
      'UNION ALL'
      
        'SELECT 4 AS OBJ_TYPE, 1 AS FL_PART_NAME, NULL AS OBJ_CODE, "'#1047#1072#1090#1088 +
        #1072#1090#1099' '#1090#1088#1091#1076#1072'" AS OBJ_NAME, NULL AS OBJ_VALUE, NULL AS UNIT_NAME, NU' +
        'LL AS ID'
      'UNION ALL'
      
        'SELECT 4 AS OBJ_TYPE, 0 AS FL_PART_NAME, NULL AS OBJ_CODE, works' +
        '.work_caption AS OBJ_NAME, normativwork.norma AS OBJ_VALUE, NULL' +
        ' AS UNIT_NAME, normativwork.ID '
      'FROM normativwork, works'
      
        'WHERE normativwork.work_id = works.work_id and normativwork.norm' +
        'ativ_id = :IdNormativ'
      'ORDER BY 1, 2 DESC, 3, 4')
    Left = 132
    Top = 240
    ParamData = <
      item
        Name = 'IDNORMATIV'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object ADOQuerySW: TFDQuery
    Connection = DM.Connect
    Transaction = DM.Read
    UpdateTransaction = DM.Write
    Left = 28
    Top = 184
  end
  object qrTemp: TFDQuery
    Connection = DM.Connect
    Transaction = DM.Read
    UpdateTransaction = DM.Write
    Left = 28
    Top = 232
  end
  object tmrFilter: TTimer
    Enabled = False
    Interval = 200
    OnTimer = tmrFilterTimer
    Left = 24
    Top = 96
  end
  object dsHistory: TDataSource
    DataSet = qrHistory
    Left = 171
    Top = 448
  end
  object qrHistory: TFDQuery
    AfterOpen = qrHistoryAfterOpen
    Connection = DM.Connect
    Transaction = DM.Read
    UpdateTransaction = DM.Write
    FetchOptions.AssignedValues = [evRecordCountMode]
    SQL.Strings = (
      'select distinct date_beginer, prikaz'
      'from normativg'
      
        'where (NORM_NUM like :NORM_NUM) AND ((`normativg`.`date_end` IS ' +
        'NOT NULL) OR (`normativg`.`date_beginer` IS NOT NULL))'
      'ORDER BY date_beginer DESC, date_end DESC')
    Left = 132
    Top = 448
    ParamData = <
      item
        Name = 'NORM_NUM'
        DataType = ftString
        ParamType = ptInput
        Value = ''
      end>
  end
  object dsNormativ: TDataSource
    DataSet = qrNormativ
    Left = 72
    Top = 24
  end
  object qrSW: TFDQuery
    BeforeOpen = qrSWBeforeOpen
    AfterOpen = qrSWAfterOpen
    Connection = DM.Connect
    Transaction = DM.Read
    UpdateTransaction = DM.Write
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    FormatOptions.AssignedValues = [fvDefaultParamDataType]
    FormatOptions.DefaultParamDataType = ftBCD
    SQL.Strings = (
      'SELECT FIRST_NAME AS FULL_NAME, normativ_directory_id'
      'FROM normativ_directory'
      'WHERE type_directory = 6 AND parent_id=:normativ_directory_id'
      'ORDER BY FIRST_NAME')
    Left = 137
    Top = 336
    ParamData = <
      item
        Name = 'NORMATIV_DIRECTORY_ID'
        ParamType = ptInput
      end>
  end
  object dsSW: TDataSource
    DataSet = qrSW
    Left = 168
    Top = 336
  end
  object tmrScroll: TTimer
    Enabled = False
    Interval = 200
    OnTimer = tmrScrollTimer
    Left = 72
    Top = 96
  end
  object qrNormativ: TFDQuery
    BeforeOpen = qrNormativBeforeOpen
    BeforeEdit = qrNormativBeforeEdit
    BeforePost = qrNormativBeforePost
    AfterPost = qrNormativAfterPost
    AfterCancel = qrNormativAfterPost
    OnNewRecord = qrNormativNewRecord
    Connection = DM.Connect
    Transaction = DM.Read
    UpdateTransaction = DM.Write
    UpdateOptions.AssignedValues = [uvCheckReadOnly]
    UpdateOptions.CheckReadOnly = False
    Left = 28
    Top = 24
  end
  object pmRatesEx: TPopupMenu
    OnPopup = pmRatesExPopup
    Left = 28
    Top = 280
    object mAddToEstimate: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1074' '#1088#1072#1089#1095#1077#1090
      OnClick = mAddToEstimateClick
    end
    object mCopyToOwnBase: TMenuItem
      Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100' '#1074' '#1089#1086#1073#1089#1090#1074#1077#1085#1085#1091#1102' '#1073#1072#1079#1091' '#1088#1072#1089#1094#1077#1085#1086#1082
      OnClick = mCopyToOwnBaseClick
    end
    object mN1: TMenuItem
      Caption = '-'
    end
    object mAdd: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      OnClick = mAddClick
    end
    object mEdit: TMenuItem
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      OnClick = mEditClick
    end
    object mDelete: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100
      OnClick = mDeleteClick
    end
  end
  object pmNC: TPopupMenu
    OnPopup = pmNCPopup
    Left = 203
    Top = 241
    object mNCAdd2: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      object mN3: TMenuItem
        Caption = #1042#1089#1077
        OnClick = mN3Click
      end
      object mN4: TMenuItem
        Caption = '-'
      end
      object mN11: TMenuItem
        Tag = 1
        Caption = #1057#1088#1077#1076#1085#1080#1081' '#1088#1072#1079#1088#1103#1076' '#1088#1072#1073#1086#1095#1080#1093'-'#1089#1090#1088#1086#1080#1090#1077#1083#1077#1081
        OnClick = mN31Click
      end
      object mN21: TMenuItem
        Tag = 2
        Caption = #1047#1072#1090#1088#1072#1090#1099' '#1090#1088#1091#1076#1072' '#1088#1072#1073#1086#1095#1080#1093
        OnClick = mN31Click
      end
      object mN31: TMenuItem
        Tag = 3
        Caption = #1047#1072#1090#1088#1072#1090#1099' '#1090#1088#1091#1076#1072' '#1084#1072#1096#1080#1085#1080#1089#1090#1086#1074
        OnClick = mN31Click
      end
    end
    object mNCAdd: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      OnClick = mNCAddClick
    end
    object mNCDel: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100
      OnClick = mNCDelClick
    end
  end
  object dsNC: TDataSource
    DataSet = qrNC
    Left = 168
    Top = 240
  end
  object qrObjWorks: TFDQuery
    Connection = DM.Connect
    Transaction = DM.Read
    UpdateTransaction = DM.Write
    UpdateOptions.AssignedValues = [uvCheckReadOnly]
    UpdateOptions.CheckReadOnly = False
    SQL.Strings = (
      
        'SELECT work_id, CONCAT(work_id, ". ",  work_name) AS work_name F' +
        'ROM objworks ORDER BY work_id;')
    Left = 156
    Top = 120
  end
  object dsObjWorks: TDataSource
    DataSet = qrObjWorks
    Left = 200
    Top = 120
  end
end
