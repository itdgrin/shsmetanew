object frCalculationEstimateSummaryCalculations: TfrCalculationEstimateSummaryCalculations
  Left = 0
  Top = 0
  Width = 824
  Height = 372
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  ParentFont = False
  TabOrder = 0
  object grSummaryCalculation: TJvDBGrid
    Left = 0
    Top = 0
    Width = 824
    Height = 372
    Align = alClient
    DataSource = dsData
    DrawingStyle = gdsClassic
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ParentFont = False
    ParentShowHint = False
    PopupMenu = pm1
    ShowHint = False
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDrawColumnCell = grSummaryCalculationDrawColumnCell
    OnDblClick = grSummaryCalculationDblClick
    AutoAppend = False
    IniStorage = FormStorage
    PostOnEnterKey = True
    SelectColumnsDialogStrings.Caption = 'Select columns'
    SelectColumnsDialogStrings.OK = '&OK'
    SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
    CanDelete = False
    EditControls = <>
    RowsHeight = 17
    TitleRowHeight = 17
    WordWrap = True
    WordWrapAllFields = True
    OnCanEditCell = grSummaryCalculationCanEditCell
    Columns = <
      item
        Expanded = False
        FieldName = 'TYPE_NAME'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #1058#1080#1087
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SM_NUMBER'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #1053#1086#1084#1077#1088
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SM_NAME'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #1053#1072#1079#1074#1072#1085#1080#1077
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #1054#1073#1098#1105#1084' '#1055#1058#1052
        Width = -1
        Visible = False
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'STOIM'
        Title.Alignment = taCenter
        Title.Caption = #1042#1057#1045#1043#1054
        Width = 100
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'ST_OHROPR'
        Title.Alignment = taCenter
        Title.Caption = #1042#1057#1045#1043#1054' '#1057' '#1054#1061#1056#1080#1054#1055#1056
        Width = 100
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'STOIM_SMR'
        Title.Alignment = taCenter
        Title.Caption = #1042#1057#1045#1043#1054' '#1057#1052#1056
        Width = 100
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'ZP'
        Title.Alignment = taCenter
        Title.Caption = #1047#1055
        Width = 90
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'TRUD'
        Title.Alignment = taCenter
        Title.Caption = #1058#1088#1091#1076#1086#1105#1084#1082#1086#1089#1090#1100
        Width = 90
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'TRUD_MASH'
        Title.Alignment = taCenter
        Title.Caption = #1058#1088#1091#1076'. '#1084#1072#1096'.'
        Width = 90
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'EMiM'
        Title.Alignment = taCenter
        Title.Caption = #1069#1052#1080#1052
        Width = 90
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'ZP_MASH'
        Title.Alignment = taCenter
        Title.Caption = #1047#1055' '#1084#1072#1096'.'
        Width = 90
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'MR'
        Title.Alignment = taCenter
        Title.Caption = #1052#1072#1090#1077#1088#1080#1072#1083
        Width = 90
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'TRANSP'
        Title.Alignment = taCenter
        Title.Caption = #1058#1088#1072#1085#1089#1087#1086#1088#1090
        Width = 90
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'OHROPR'
        Title.Alignment = taCenter
        Title.Caption = #1054#1061#1056#1080#1054#1055#1056
        Width = 90
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'PLAN_PRIB'
        Title.Alignment = taCenter
        Title.Caption = #1055#1083#1072#1085'. '#1087#1088#1080#1073'.'
        Width = 90
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'ZIM_UDOR'
        Title.Alignment = taCenter
        Title.Caption = #1047#1080#1084'. '#1091#1076#1086#1088'.'
        Width = 90
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'ZP_ZIM_UDOR'
        Title.Alignment = taCenter
        Title.Caption = #1047#1055' '#1079#1080#1084'. '#1091#1076#1086#1088'.'
        Width = 90
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'MR_DEVICE'
        Title.Alignment = taCenter
        Title.Caption = #1054#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1077
        Width = 90
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'TRANSP_DEVICE'
        Title.Alignment = taCenter
        Title.Caption = #1058#1088'. '#1086#1073#1086#1088#1091#1076'.'
        Width = 90
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        Title.Alignment = taCenter
        Title.Caption = #1048#1084#1087'. '#1084#1072#1090#1077#1088#1080#1072#1083#1099
        Visible = False
      end
      item
        Alignment = taRightJustify
        Expanded = False
        Title.Alignment = taCenter
        Title.Caption = #1048#1084#1087'. '#1086#1073#1086#1088#1091#1076'.'
        Visible = False
      end
      item
        Alignment = taRightJustify
        Expanded = False
        Title.Alignment = taCenter
        Title.Caption = #1056#1072#1079'. '#1089#1090#1086#1080#1084'. '#1084#1072#1090'.'
        Visible = False
      end
      item
        Alignment = taRightJustify
        Expanded = False
        Title.Alignment = taCenter
        Title.Caption = #1056#1072#1079'. '#1089#1090#1086#1080#1084'. '#1084#1077#1093'.'
        Visible = False
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'MR_DUMP'
        Title.Alignment = taCenter
        Title.Caption = #1057#1074#1072#1083#1082#1072
        Width = 90
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'DUMP_COUNT'
        Title.Alignment = taCenter
        Title.Caption = #1057#1074#1072#1083#1082#1072'('#1052#1047')'
        Width = 90
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'TEMP_BUILD'
        Title.Alignment = taCenter
        Title.Caption = 'B'#1088#1077#1084#1077#1085#1085#1099#1077' ('#1090#1080#1090#1091#1083#1100#1085#1099#1077') '#1079#1076#1072#1085#1080#1103' '#1080' '#1089#1086#1086#1088#1091#1078#1077#1085#1080#1103
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'TEMP_RET'
        Title.Alignment = taCenter
        Title.Caption = #1042#1086#1079#1074#1088'. '#1084#1072#1090'.'
        Width = 90
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'NormaAVG'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #1057#1088'. '#1088#1072#1079#1088#1103#1076
        Width = 90
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'MR_DUMP'
        Title.Alignment = taCenter
        Title.Caption = #1055#1088#1086#1095#1080#1077
        Width = 90
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'PR_352'
        Title.Alignment = taCenter
        Title.Caption = #1055#1088'. '#8470'352'
        Width = 90
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'TRUD_ZIM'
        Title.Alignment = taCenter
        Title.Caption = #1058#1088#1091#1076'. '#1079#1080#1084'.'
        Width = 90
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'SOC_STRAH'
        Title.Alignment = taCenter
        Title.Caption = #1057#1086#1094#1089#1090#1088#1072#1093
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'ZEM_NAL'
        Title.Alignment = taCenter
        Title.Caption = #1047#1077#1084#1077#1083#1100#1085#1099#1081' '#1085#1072#1083#1086#1075
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'VEDOMS_NAL'
        Title.Alignment = taCenter
        Title.Caption = #1057#1083#1091#1078#1073#1072' '#1074#1077#1076#1086#1084#1089#1090#1074#1077#1085#1085#1086#1075#1086' '#1082#1086#1085#1090#1088#1086#1083#1103
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'NDS'
        Title.Alignment = taCenter
        Title.Caption = #1053#1044#1057
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'DEBET_NAL'
        Title.Alignment = taCenter
        Title.Caption = #1053#1072#1083#1086#1075' '#1086#1090' '#1074#1099#1088#1091#1095#1082#1080
        Visible = True
      end>
  end
  object qrData: TFDQuery
    AfterPost = qrDataAfterPost
    AfterCancel = qrDataAfterCancel
    Connection = DM.Connect
    Transaction = DM.Read
    UpdateTransaction = DM.Write
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    FormatOptions.AssignedValues = [fvMapRules, fvDefaultParamDataType, fvFmtDisplayNumeric, fvFmtEditNumeric]
    FormatOptions.OwnMapRules = True
    FormatOptions.MapRules = <
      item
        SourceDataType = dtByteString
        TargetDataType = dtAnsiString
      end
      item
        SourceDataType = dtFmtBCD
        TargetDataType = dtDouble
      end>
    FormatOptions.FmtDisplayNumeric = '### ### ### ##0.####'
    FormatOptions.FmtEditNumeric = '########################.########'
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvCheckReadOnly]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.CheckReadOnly = False
    UpdateOptions.UpdateTableName = 'smeta.summary_calculation'
    UpdateOptions.KeyFields = 'id_estimate;id_act'
    UpdateObject = UpdateSQL
    SQL.Strings = (
      'SELECT '
      '  s.SM_ID AS id_estimate, '
      '  typesm.id as sm_type,'
      '  s.OBJ_ID,'
      '  typesm.NAME AS TYPE_NAME, '
      '  s.SM_NUMBER, '
      '  s.NAME AS SM_NAME,'
      '  SUM(IFNULL(d.ZPF, d.ZP)) AS ZP,'
      '  SUM(IFNULL(d.EMiMF, d.EMiM)) AS EMiM,'
      '  SUM(IFNULL(d.MRF, d.MR)) AS MR,'
      '  SUM(IFNULL(d.TRUDF, d.TRUD)) AS TRUD,'
      '  SUM(IFNULL(d.TRUD_MASHF, d.TRUD_MASH)) AS TRUD_MASH,'
      '  SUM(IFNULL(d.ZP_MASHF, d.ZP_MASH)) AS ZP_MASH,'
      '  SUM(IFNULL(d.TRANSPF, d.TRANSP)) AS TRANSP,'
      '  SUM(IFNULL(d.STOIMF, d.STOIM)) AS STOIM,'
      '  SUM(IFNULL(d.OHROPRF, d.OHROPR)) AS OHROPR,'
      '  SUM(IFNULL(d.PLAN_PRIBF, d.PLAN_PRIB)) AS PLAN_PRIB,'
      '  SUM(IFNULL(d.ST_OHROPRF, d.ST_OHROPR)) AS ST_OHROPR,'
      '  SUM(IFNULL(d.ZIM_UDORF, d.ZIM_UDOR)) AS ZIM_UDOR,'
      '  SUM(IFNULL(d.ZP_ZIM_UDORF, d.ZP_ZIM_UDOR)) AS ZP_ZIM_UDOR,'
      '  SUM(IFNULL(d.MR_DEVICEF, d.MR_DEVICE)) AS MR_DEVICE,'
      
        '  SUM(IFNULL(d.TRANSP_DEVICEF, d.TRANSP_DEVICE)) AS TRANSP_DEVIC' +
        'E,'
      '  SUM(IFNULL(d.MR_DUMPF, d.MR_DUMP)) AS MR_DUMP,'
      '  SUM(IFNULL(d.DUMP_COUNTF, d.DUMP_COUNT)) AS DUMP_COUNT,'
      '  SUM(IFNULL(d.TEMP_RETF, d.TEMP_RET)) AS TEMP_RET,'
      '  AVG(IFNULL(d.NormaAVGF, d.NormaAVG)) AS NormaAVG,'
      '  SUM(IFNULL(d.PR_352F, d.PR_352)) AS PR_352,'
      '  SUM(IFNULL(d.TRUD_ZIMF, d.TRUD_ZIM)) AS TRUD_ZIM,'
      '  SUM(IFNULL(d.SOC_STRAHF, d.SOC_STRAH)) AS SOC_STRAH,'
      '  SUM(IFNULL(d.ZEM_NALF, d.ZEM_NAL)) AS ZEM_NAL,'
      '  SUM(IFNULL(d.NDSF, d.NDS)) AS NDS,'
      '  SUM(IFNULL(d.DEBET_NALF, d.DEBET_NAL)) AS DEBET_NAL,'
      '  SUM(IFNULL(d.VEDOMS_NALF, d.VEDOMS_NAL)) AS VEDOMS_NAL,'
      '  SUM(IFNULL(d.STOIM_SMRF, d.STOIM_SMR)) AS STOIM_SMR,'
      '  SUM(IFNULL(d.TEMP_BUILDF, d.TEMP_BUILD)) AS TEMP_BUILD,'
      '  SUM(IFNULL(d.STOIM_SMRF, d.STOIM_SMR)) AS STOIM_SMR,'
      ''
      ''
      '  SUM(IFNULL(d.ZP, 0)) AS ZPF,'
      '  SUM(IFNULL(d.EMiM, 0)) AS EMiMF,'
      '  SUM(IFNULL(d.MR, 0)) AS MRF,'
      '  SUM(IFNULL(d.TRUD, 0)) AS TRUDF,'
      '  SUM(IFNULL(d.TRUD_MASH, 0)) AS TRUD_MASHF,'
      '  SUM(IFNULL(d.ZP_MASH, 0)) AS ZP_MASHF,'
      '  SUM(IFNULL(d.TRANSP, 0)) AS TRANSPF,'
      '  SUM(IFNULL(d.STOIM, 0)) AS STOIMF,'
      '  SUM(IFNULL(d.OHROPR, 0)) AS OHROPRF,'
      '  SUM(IFNULL(d.PLAN_PRIB, 0)) AS PLAN_PRIBF,'
      '  SUM(IFNULL(d.ST_OHROPR, 0)) AS ST_OHROPRF,'
      '  SUM(IFNULL(d.ZIM_UDOR, 0)) AS ZIM_UDORF,'
      '  SUM(IFNULL(d.ZP_ZIM_UDOR, 0)) AS ZP_ZIM_UDORF,'
      '  SUM(IFNULL(d.MR_DEVICE, 0)) AS MR_DEVICEF,'
      '  SUM(IFNULL(d.TRANSP_DEVICE, 0)) AS TRANSP_DEVICEF,'
      '  SUM(IFNULL(d.MR_DUMP, 0)) AS MR_DUMPF,'
      '  SUM(IFNULL(d.DUMP_COUNT, 0)) AS DUMP_COUNTF,'
      '  SUM(IFNULL(d.TEMP_RET, 0)) AS TEMP_RETF,'
      '  SUM(IFNULL(d.PR_352, 0)) AS PR_352F,'
      '  SUM(IFNULL(d.TRUD_ZIM, 0)) AS TRUD_ZIMF,'
      '  SUM(IFNULL(d.SOC_STRAH, 0)) AS SOC_STRAHF,'
      '  SUM(IFNULL(d.ZEM_NAL, 0)) AS ZEM_NALF,'
      '  SUM(IFNULL(d.NDS, 0)) AS NDSF,'
      '  SUM(IFNULL(d.DEBET_NAL, 0)) AS DEBET_NALF,'
      '  SUM(IFNULL(d.VEDOMS_NAL, 0)) AS VEDOMS_NALF,'
      '  SUM(IFNULL(d.STOIM_SMR, 0)) AS STOIM_SMRF,'
      '  SUM(IFNULL(d.TEMP_BUILD, 0)) AS TEMP_BUILDF,'
      '  SUM(IFNULL(d.STOIM_SMR, 0)) AS STOIM_SMRF'
      ''
      'FROM typesm, objcards o, smetasourcedata s'
      'LEFT JOIN summary_calculation d ON d.SM_ID IN'
      '  (SELECT SM_ID'
      '   FROM smetasourcedata '
      '   WHERE DELETED=0 AND'
      '    ((smetasourcedata.SM_ID = s.SM_ID) OR'
      '           (smetasourcedata.PARENT_ID = s.SM_ID) OR '
      '           (smetasourcedata.PARENT_ID IN ('
      '             SELECT SM_ID'
      '             FROM smetasourcedata'
      '             WHERE PARENT_ID = s.SM_ID AND DELETED=0)))'
      '  ) '
      'WHERE '
      '  s.SM_TYPE=typesm.ID AND '
      '  s.DELETED=0 AND'
      '  ((s.SM_ID = :SM_ID) OR'
      '           (s.PARENT_ID = :SM_ID) OR '
      '           (s.PARENT_ID IN ('
      '             SELECT SM_ID'
      '             FROM smetasourcedata'
      '             WHERE PARENT_ID = :SM_ID AND DELETED=0))) '
      '  AND o.OBJ_ID=s.OBJ_ID'
      'GROUP BY s.SM_ID, s.OBJ_ID, TYPE_NAME, s.SM_NUMBER, SM_NAME'
      
        'ORDER BY CONCAT(IF(s.SM_TYPE=1, s.SM_ID, ""), s.PARENT_ID, s.SM_' +
        'ID);')
    Left = 9
    Top = 40
    ParamData = <
      item
        Name = 'SM_ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object dsData: TDataSource
    DataSet = qrData
    Left = 48
    Top = 40
  end
  object pm1: TPopupMenu
    OnPopup = pm1Popup
    Left = 80
    Top = 40
    object mN3: TMenuItem
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1079#1072#1087#1080#1089#1100
      OnClick = mN3Click
    end
    object N1: TMenuItem
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077
      object N4: TMenuItem
        Caption = #1048#1089#1093#1086#1076#1085#1099#1077' '#1076#1072#1085#1085#1099#1077
        OnClick = grSummaryCalculationDblClick
      end
      object N5: TMenuItem
        Caption = #1054#1073#1098#1077#1082#1090
        OnClick = N5Click
      end
    end
    object N2: TMenuItem
      Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1072' '#1088#1072#1089#1095#1077#1090#1072
      Visible = False
    end
    object mN4: TMenuItem
      Caption = #1042#1086#1089#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1079#1085#1072#1095#1077#1085#1080#1077
      OnClick = mN4Click
    end
    object mN5: TMenuItem
      Caption = #1042#1086#1089#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1079#1085#1072#1095#1077#1085#1080#1077' '#1074#1089#1077#1081' '#1089#1090#1088#1086#1082#1080
      OnClick = mN5Click
    end
    object mN6: TMenuItem
      Caption = #1042#1086#1089#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1074#1089#1077' '#1079#1085#1072#1095#1077#1085#1080#1103
      OnClick = mN6Click
    end
  end
  object FormStorage: TJvFormStorage
    AppStorage = FormMain.AppIni
    AppStoragePath = '%FORM_NAME%\'
    Options = []
    StoredValues = <>
    Left = 32
    Top = 96
  end
  object UpdateSQL: TFDUpdateSQL
    Connection = DM.Connect
    ModifySQL.Strings = (
      'UPDATE '
      '  summary_calculation'
      'SET '
      '  SM_ID = :id_estimate,'
      '  ZPF = IF(:ZP=ZP, NULL, :ZP),'
      '  EMiMF = IF(:EMiM=EMiM, NULL, :EMiM),'
      '  MRF =  IF(:MR=MR, NULL, :MR),'
      '  TRUDF = IF( :TRUD=TRUD, NULL, :TRUD),'
      '  TRUD_MASHF =  IF(:TRUD_MASH=TRUD_MASH, NULL, :TRUD_MASH),'
      '  ZP_MASHF =  IF(:ZP_MASH=ZP_MASH, NULL, :ZP_MASH),'
      '  TRANSPF =  IF(:TRANSP=TRANSP, NULL, :TRANSP),'
      '  STOIMF =  IF(:STOIM=STOIM, NULL, :STOIM),'
      '  OHROPRF =  IF(:OHROPR=OHROPR, NULL, :OHROPR),'
      '  PLAN_PRIBF =  IF(:PLAN_PRIB=PLAN_PRIB, NULL, :PLAN_PRIB),'
      '  ST_OHROPRF =  IF(:ST_OHROPR=ST_OHROPR, NULL, :ST_OHROPR),'
      '  ZIM_UDORF =  IF(:ZIM_UDOR=ZIM_UDOR, NULL, :ZIM_UDOR),'
      
        '  ZP_ZIM_UDORF =  IF(:ZP_ZIM_UDOR=ZP_ZIM_UDOR, NULL, :ZP_ZIM_UDO' +
        'R),'
      '  MR_DEVICEF =  IF(:MR_DEVICE=MR_DEVICE, NULL, :MR_DEVICE),'
      
        '  TRANSP_DEVICEF =  IF(:TRANSP_DEVICE=TRANSP_DEVICE, NULL, :TRAN' +
        'SP_DEVICE),'
      '  MR_DUMPF =  IF(:MR_DUMP=MR_DUMP, NULL, :MR_DUMP),'
      '  DUMP_COUNTF = IF( :DUMP_COUNT=DUMP_COUNT, NULL, :DUMP_COUNT),'
      '  TEMP_RETF =  IF(:TEMP_RET=TEMP_RET, NULL, :TEMP_RET),'
      '  NormaAVGF =  IF(:NormaAVG=NormaAVG, NULL, :NormaAVG),'
      '  PR_352F =  IF(:PR_352=PR_352, NULL, :PR_352),'
      '  TRUD_ZIMF =  IF(:TRUD_ZIM=TRUD_ZIM, NULL, :TRUD_ZIM),'
      '  SOC_STRAHF =  IF( :SOC_STRAH=SOC_STRAH, NULL, :SOC_STRAH),'
      '  ZEM_NALF =  IF(:ZEM_NAL=ZEM_NAL, NULL, :ZEM_NAL),'
      '  NDSF=  IF(:NDS=NDS, NULL, :NDS),'
      '  DEBET_NALF=  IF(:DEBET_NAL=DEBET_NAL, NULL, :DEBET_NAL),'
      '  VEDOMS_NALF= IF(:VEDOMS_NAL=VEDOMS_NAL, NULL, :VEDOMS_NAL),'
      '  STOIM_SMRF= IF(:STOIM_SMR=STOIM_SMR, NULL, :STOIM_SMR),'
      '  TEMP_BUILDF= IF(:TEMP_BUILD=TEMP_BUILD, NULL, :TEMP_BUILD),'
      '  STOIM_SMRF= IF(:STOIM_SMR=STOIM_SMR, NULL, :STOIM_SMR)'
      'WHERE   SM_ID = :id_estimate;')
    Left = 32
    Top = 160
  end
end
