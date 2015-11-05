object fDebugTables: TfDebugTables
  Left = 0
  Top = 0
  AlphaBlend = True
  Caption = 'fDebugTables'
  ClientHeight = 450
  ClientWidth = 722
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poMainFormCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnDestroy = FormDestroy
  OnDeactivate = FormDeactivate
  PixelsPerInch = 96
  TextHeight = 13
  object spl2: TSplitter
    Left = 153
    Top = 33
    Height = 417
    ExplicitLeft = 208
    ExplicitTop = 328
    ExplicitHeight = 100
  end
  object ScrollBox1: TScrollBox
    Left = 156
    Top = 33
    Width = 566
    Height = 417
    Align = alClient
    TabOrder = 2
    object spl1: TSplitter
      Left = 0
      Top = 0
      Width = 562
      Height = 3
      Cursor = crVSplit
      Align = alTop
      ExplicitLeft = -24
      ExplicitTop = 408
    end
    object JvDBGrid1: TJvDBGrid
      Left = 0
      Top = 3
      Width = 562
      Height = 410
      Align = alClient
      DataSource = ds1
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      AutoSort = False
      SelectColumn = scGrid
      SelectColumnsDialogStrings.Caption = 'Select columns'
      SelectColumnsDialogStrings.OK = '&OK'
      SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
      ColumnResize = gcrNone
      EditControls = <>
      RowsHeight = 17
      TitleRowHeight = 17
    end
  end
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 722
    Height = 33
    Align = alTop
    TabOrder = 0
    DesignSize = (
      722
      33)
    object lbl1: TLabel
      Left = 175
      Top = 9
      Width = 99
      Height = 13
      Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1090#1072#1073#1083#1080#1094#1099':'
    end
    object btnRefresh: TBitBtn
      Left = 641
      Top = 4
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      TabOrder = 1
      OnClick = btnRefreshClick
    end
    object chkAutoUpdate: TCheckBox
      Left = 10
      Top = 8
      Width = 167
      Height = 17
      Caption = #1054#1073#1085#1086#1074#1083#1103#1090#1100' '#1072#1074#1090#1086#1084#1072#1090#1080#1095#1077#1089#1082#1080
      TabOrder = 3
    end
    object edtTableName: TEdit
      Left = 280
      Top = 6
      Width = 121
      Height = 21
      TabOrder = 2
    end
    object btnAddTable: TBitBtn
      Left = 407
      Top = 4
      Width = 75
      Height = 25
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      TabOrder = 0
      OnClick = btnAddTableClick
    end
  end
  object lst: TListBox
    Left = 0
    Top = 33
    Width = 153
    Height = 417
    Align = alLeft
    ItemHeight = 13
    Items.Strings = (
      'data_row_temp'
      'calculation_coef_temp')
    PopupMenu = pm1
    TabOrder = 1
    ExplicitLeft = -1
    ExplicitTop = 31
  end
  object ds1: TDataSource
    DataSet = qr1
    Left = 400
    Top = 209
  end
  object qr1: TFDQuery
    Connection = DM.Connect
    Transaction = DM.Read
    UpdateTransaction = DM.Write
    SQL.Strings = (
      'select * from calculation_coef_temp')
    Left = 360
    Top = 209
  end
  object FormStorage: TJvFormStorage
    AppStorage = FormMain.AppIni
    AppStoragePath = '%FORM_NAME%\'
    Options = [fpSize, fpLocation]
    StoredProps.Strings = (
      'lst.Items'
      'chkAutoUpdate.Checked')
    StoredValues = <>
    Left = 272
    Top = 200
  end
  object tmr1: TTimer
    OnTimer = tmr1Timer
    Left = 460
    Top = 209
  end
  object pm1: TPopupMenu
    Left = 24
    Top = 128
    object mN1: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100
      OnClick = mN1Click
    end
  end
end
