object dmReportF: TdmReportF
  OldCreateOrder = False
  Height = 689
  Width = 1069
  object frxZP_OBJ: TfrxDBDataset
    UserName = 'frxZP_OBJ'
    CloseDataSource = True
    FieldAliases.Strings = (
      'OBJECT_NAME=OBJECT_NAME'
      'LOCAL_NAME=LOCAL_NAME'
      'PTM_NAME=PTM_NAME'
      'RATE_CODE=RATE_CODE'
      'RATE_CAPTION=RATE_CAPTION'
      'RATE_UNIT=RATE_UNIT'
      'RATE_COUNT=RATE_COUNT'
      'TRUD_ED=TRUD_ED'
      'TRUD=TRUD'
      'NORMA=NORMA'
      'COEF=COEF'
      'K_TRUD=K_TRUD'
      'K_ZP=K_ZP'
      'ZP_ED=ZP_ED'
      'ZP=ZP')
    DataSet = qrZP_OBJ
    BCDToCurrency = False
    Left = 16
    Top = 56
  end
  object frxReport: TfrxReport
    Version = '4.13.2'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42048.002529965300000000
    ReportOptions.LastChange = 42120.459527777780000000
    ScriptLanguage = 'PascalScript'
    StoreInDFM = False
    Left = 16
    Top = 8
  end
  object qrZP_OBJ: TFDQuery
    AutoCalcFields = False
    Connection = DM.Connect
    Transaction = trReportRead
    UpdateTransaction = trReportWrite
    SQL.Strings = (
      
        'select CONCAT(`ssd`.`SM_NUMBER`, " ", `ssd`.`NAME`) as `OBJECT_N' +
        'AME`,'
      
        '       CONCAT(`ssd1`.`SM_NUMBER`, " ", `ssd1`.`NAME`) as `LOCAL_' +
        'NAME`,'
      
        '       CONCAT(`ssd2`.`SM_NUMBER`, " ", `ssd2`.`NAME`) as `PTM_NA' +
        'ME`,'
      '       `cr`.`RATE_CODE`,'
      '       UCASE(`cr`.`RATE_CAPTION`) `RATE_CAPTION`,'
      '       `cr`.`RATE_UNIT`,'
      '       `cr`.`RATE_COUNT`,'
      
        '       `de`.`TRUD` / IF(IFNULL(`cr`.`RATE_COUNT`, 1) = 0, 1, IFN' +
        'ULL(`cr`.`RATE_COUNT`, 1)) `TRUD_ED`,'
      '       `de`.`TRUD`,'
      '       `nw`.`NORMA`,'
      
        '       IF(IFNULL(`c`.`COEF`, 0) = 0, "F", TRIM(TRAILING "0" FROM' +
        ' CONVERT(`c`.`COEF`, CHAR(8)))) `COEF`,'
      '       `de`.`K_TRUD`,'
      '       `de`.`K_ZP`,'
      
        '       `de`.`ZP` / IF(IFNULL(`cr`.`RATE_COUNT`, 1) = 0, 1, IFNUL' +
        'L(`cr`.`RATE_COUNT`, 1)) `ZP_ED`,'
      '       `de`.`ZP`'#9'   '
      'from `smetasourcedata` `ssd`'
      
        'inner join `smetasourcedata` `ssd1` on `ssd1`.`PARENT_ID` = `ssd' +
        '`.`SM_ID` '
      '                                   and `ssd1`.`SM_TYPE` = 1'
      
        'inner join `smetasourcedata` `ssd2` on `ssd2`.`PARENT_ID` = `ssd' +
        '1`.`SM_ID`'
      '                                   and `ssd2`.`SM_TYPE` = 3'
      
        'inner join `data_estimate` `de` on `de`.`ID_ESTIMATE` = `ssd2`.`' +
        'SM_ID`'
      '                               and `de`.`ID_TYPE_DATA` = 1'
      'inner join `card_rate` `cr` on `cr`.`ID` = `de`.`ID_TABLES`'
      
        'left join `normativwork` `nw` on `nw`.`NORMATIV_ID` = `cr`.`RATE' +
        '_ID`'
      '                             and `nw`.`WORK_ID` = 1'
      'left join `category` `c` on `c`.`VALUE` * 10 = `nw`.`NORMA` * 10'
      
        '                        and `c`.`DATE_BEG` <= CONVERT(CONCAT(:YE' +
        'AR, '#39'-'#39', :MONTH, '#39'-01'#39'), DATE)'
      'where `ssd`.`SM_ID` = :SM_ID'
      '  and `ssd`.`SM_TYPE` = 2  '
      'order by `OBJECT_NAME`, `LOCAL_NAME`, `PTM_NAME`, `RATE_CODE`')
    Left = 16
    Top = 112
    ParamData = <
      item
        Name = 'YEAR'
        DataType = ftString
        ParamType = ptInput
        Value = '2014'
      end
      item
        Name = 'MONTH'
        DataType = ftString
        ParamType = ptInput
        Value = '4'
      end
      item
        Name = 'SM_ID'
        DataType = ftString
        ParamType = ptInput
        Value = '344'
      end>
  end
  object trReportRead: TFDTransaction
    Options.ReadOnly = True
    Options.StopOptions = [xoIfCmdsInactive, xoIfAutoStarted, xoFinishRetaining]
    Connection = DM.Connect
    Left = 920
    Top = 16
  end
  object trReportWrite: TFDTransaction
    Options.ReadOnly = True
    Options.StopOptions = [xoIfCmdsInactive, xoIfAutoStarted, xoFinishRetaining]
    Connection = DM.Connect
    Left = 992
    Top = 16
  end
  object qrTMP: TFDQuery
    Connection = DM.Connect
    Transaction = trReportRead
    UpdateTransaction = trReportWrite
    Left = 88
    Top = 8
  end
  object frxZP_OBJ_ACT: TfrxDBDataset
    UserName = 'frxZP_OBJ_ACT'
    CloseDataSource = True
    FieldAliases.Strings = (
      'RATE_ID=RATE_ID'
      'OBJ_NAME=OBJ_NAME'
      'LOCAL_NAME=LOCAL_NAME'
      'PTM_NAME=PTM_NAME'
      'RATE_CODE=RATE_CODE'
      'RATE_CAPTION=RATE_CAPTION'
      'RATE_UNIT=RATE_UNIT'
      'RATE_COUNT=RATE_COUNT'
      'K_TRUD=K_TRUD'
      'TRUD=TRUD'
      'ZP=ZP'
      'K_ZP=K_ZP'
      'NORMA=NORMA'
      'COEF=COEF'
      'TRUD_ED=TRUD_ED'
      'ZP_ED=ZP_ED')
    DataSet = qrZP_OBJ_ACT
    BCDToCurrency = False
    Left = 88
    Top = 56
  end
  object qrZP_OBJ_ACT: TFDQuery
    AutoCalcFields = False
    Connection = DM.Connect
    Transaction = trReportRead
    UpdateTransaction = trReportWrite
    SQL.Strings = (
      'select `cra`.`RATE_ID`, '
      
        '       CONCAT(`ssd0`.`SM_NUMBER`, " ", `ssd0`.`NAME`) `OBJ_NAME`' +
        ', '
      
        '       CONCAT(`ssd1`.`SM_NUMBER`, " ", `ssd1`.`NAME`) `LOCAL_NAM' +
        'E`, '
      
        '       CONCAT(`ssd2`.`SM_NUMBER`, " ", `ssd2`.`NAME`) `PTM_NAME`' +
        ', '
      '       `cra`.`RATE_CODE`, '
      '       UCASE(`cra`.`RATE_CAPTION`) `RATE_CAPTION`, '
      '       `cra`.`RATE_UNIT`, '
      '       `cra`.`RATE_COUNT`, '
      '       `da`.`K_TRUD`, '
      '       IFNULL(`da`.`TRUD`, 0) `TRUD`, '
      '       `da`.`ZP`, '
      '       `da`.`K_ZP`, '
      '       `nw`.`NORMA`,'
      
        '       IF(IFNULL(`c`.`COEF`, 0) = 0, "F", TRIM(TRAILING "0" FROM' +
        ' CONVERT(`c`.`COEF`, CHAR(8)))) `COEF`,'
      
        '      `da`.`TRUD` / IF(IFNULL(`cra`.`RATE_COUNT`, 1) = 0, 1, IFN' +
        'ULL(`cra`.`RATE_COUNT`, 1)) `TRUD_ED`, '
      
        '      `da`.`ZP` / IF(IFNULL(`cra`.`RATE_COUNT`, 1) = 0, 1, IFNUL' +
        'L(`cra`.`RATE_COUNT`, 1)) `ZP_ED`'
      #9'   '
      'from `data_act` `da`'
      
        'inner join `card_rate_act` `cra` on `cra`.`ID` = `da`.`ID_TABLES' +
        '` '
      '                               and `cra`.`ID_ACT` = :ID_ACT'
      
        'inner join `smetasourcedata` `ssd2` on `ssd2`.`SM_ID` = `da`.`ID' +
        '_ESTIMATE`'
      '                                   and `ssd2`.`SM_TYPE` = 3'
      
        'inner join `smetasourcedata` `ssd1` on `ssd1`.`SM_ID` = `ssd2`.`' +
        'PARENT_ID`'
      '                                   and `ssd1`.`SM_TYPE` = 1'
      
        'inner join `smetasourcedata` `ssd0` on `ssd0`.`SM_ID` = `ssd1`.`' +
        'PARENT_ID`'
      '                                   and `ssd0`.`SM_TYPE` = 2'
      
        'left join `normativwork` `nw` on `nw`.`NORMATIV_ID` = `cra`.`RAT' +
        'E_ID`'
      '                 '#9#9'     and `nw`.`WORK_ID` = 1 '
      
        'left join `category` `c` on `c`.`VALUE` * 10 = `nw`.`NORMA` * 10' +
        ' '
      
        '                        and IFNULL(`c`.`DATE_BEG`, CONVERT('#39'1900' +
        '-01-01'#39', DATE)) <= CONVERT(CONCAT(:YEAR,'#39'-'#39',:MONTH,'#39'-01'#39'), DATE)' +
        '    '
      ''
      'where `da`.`ID_ACT` = :ID_ACT '
      '  and `da`.`ID_TYPE_DATA` = 1'
      'order by `OBJ_NAME`, `LOCAL_NAME`, `PTM_NAME`, `RATE_CODE`')
    Left = 88
    Top = 112
    ParamData = <
      item
        Name = 'ID_ACT'
        DataType = ftString
        ParamType = ptInput
        Value = '10'
      end
      item
        Name = 'YEAR'
        DataType = ftString
        ParamType = ptInput
        Value = '2014'
      end
      item
        Name = 'MONTH'
        DataType = ftString
        ParamType = ptInput
        Value = '4'
      end>
  end
  object qrRASX_MAT: TFDQuery
    AutoCalcFields = False
    Connection = DM.Connect
    Transaction = trReportRead
    UpdateTransaction = trReportWrite
    SQL.Strings = (
      
        'select mca.`MAT_CODE`, UCASE(mca.`MAT_NAME`) as MAT_NAME, mca.`M' +
        'AT_UNIT`, mca.`MAT_NORMA`,'
      
        #9'   cra.`RATE_CODE`, UCASE(cra.`RATE_CAPTION`) as RATE_CAPTION, ' +
        'cra.`RATE_UNIT`, cra.`RATE_COUNT`,'
      
        #9'   cra.`COEF_ORDERS`, IFNULL(mca.`MAT_NORMA`, 0) * IFNULL(cra.`' +
        'RATE_COUNT`, 0) as VAL, '
      #9'   CONCAT(ssd0.`SM_NUMBER`, " ", ssd0.`NAME`) as PTM_NAME,'
      #9'   CONCAT(ssd1.`SM_NUMBER`, " ", ssd1.`NAME`) as LOCAL_NAME,'
      ' '#9'   CONCAT(ssd2.`SM_NUMBER`, " ", ssd2.`NAME`) as OBJECT_NAME, '
      '           1 as TAB'
      'from `materialcard_act` mca'
      ''
      'left join `card_rate_act` cra on cra.`ID_ACT` = mca.`ID_ACT`'
      'left join `data_estimate` da on da.`ID_TABLES` = cra.`ID`'
      
        'inner join `smetasourcedata` `ssd2` on `ssd2`.`SM_ID` = `da`.`ID' +
        '_ESTIMATE`'
      '                                   and `ssd2`.`SM_TYPE` = 3'
      
        'inner join `smetasourcedata` `ssd1` on `ssd1`.`SM_ID` = `ssd2`.`' +
        'PARENT_ID`'
      '                                   and `ssd1`.`SM_TYPE` = 1'
      
        'inner join `smetasourcedata` `ssd0` on `ssd0`.`SM_ID` = `ssd1`.`' +
        'PARENT_ID`'
      ''
      'where mca.`ID_ACT` = :ID_ACT'
      '  and mca.`CONSIDERED` = 1'
      'ORDER BY LOCAL_NAME, RATE_CODE, MAT_CODE')
    Left = 176
    Top = 112
    ParamData = <
      item
        Name = 'ID_ACT'
        DataType = ftString
        ParamType = ptInput
        Value = '10'
      end>
  end
  object frxRASX_MAT: TfrxDBDataset
    UserName = 'frxRASX_MAT'
    CloseDataSource = True
    FieldAliases.Strings = (
      'MAT_CODE=MAT_CODE'
      'MAT_NAME=MAT_NAME'
      'MAT_UNIT=MAT_UNIT'
      'MAT_NORMA=MAT_NORMA'
      'RATE_CODE=RATE_CODE'
      'RATE_CAPTION=RATE_CAPTION'
      'RATE_UNIT=RATE_UNIT'
      'RATE_COUNT=RATE_COUNT'
      'COEF_ORDERS=COEF_ORDERS'
      'VAL=VAL'
      'PTM_NAME=PTM_NAME'
      'LOCAL_NAME=LOCAL_NAME'
      'OBJECT_NAME=OBJECT_NAME'
      'TAB=TAB')
    DataSet = qrRASX_MAT
    BCDToCurrency = False
    Left = 176
    Top = 56
  end
  object qrRASX_MAT2: TFDQuery
    AutoCalcFields = False
    Connection = DM.Connect
    Transaction = trReportRead
    UpdateTransaction = trReportWrite
    SQL.Strings = (
      
        'select mca.`MAT_CODE`, UCASE(mca.`MAT_NAME`) as MAT_NAME, mca.`M' +
        'AT_UNIT`, mca.`MAT_NORMA`,'
      #9'   cra.`RATE_COUNT`,'
      
        #9'   cra.`COEF_ORDERS`, IFNULL(mca.`MAT_NORMA`, 0) * IFNULL(cra.`' +
        'RATE_COUNT`, 0) as VAL,'
      #9'   mca.`COAST_NDS`, 2 as TAB'
      'from `materialcard_act` mca'
      'left join `card_rate_act` cra on cra.`ID_ACT` = mca.`ID_ACT`'
      'where mca.`ID_ACT` = :ID_ACT'
      '  and mca.`CONSIDERED` = 0'
      'order by MAT_CODE')
    Left = 248
    Top = 112
    ParamData = <
      item
        Name = 'ID_ACT'
        DataType = ftString
        ParamType = ptInput
        Value = '10'
      end>
  end
  object frxRASX_MAT2: TfrxDBDataset
    UserName = 'frxRASX_MAT2'
    CloseDataSource = True
    FieldAliases.Strings = (
      'MAT_CODE=MAT_CODE'
      'MAT_NAME=MAT_NAME'
      'MAT_UNIT=MAT_UNIT'
      'MAT_NORMA=MAT_NORMA'
      'RATE_COUNT=RATE_COUNT'
      'COEF_ORDERS=COEF_ORDERS'
      'VAL=VAL'
      'COAST_NDS=COAST_NDS'
      'TAB=TAB')
    DataSet = qrRASX_MAT2
    BCDToCurrency = False
    Left = 248
    Top = 56
  end
  object frxHTMLExport: TfrxHTMLExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    FixedWidth = True
    Background = False
    Centered = False
    EmptyLines = True
    Print = False
    PictureType = gpPNG
    Left = 984
    Top = 272
  end
  object frxRTFExport: TfrxRTFExport
    FileName = 'D:\!NEW_WORK\trunk\Reports\test.rtf'
    UseFileCache = True
    DefaultPath = '..\Doc\'
    ShowProgress = True
    OverwritePrompt = True
    CreationTime = 42102.919928379640000000
    DataOnly = False
    PictureType = gpPNG
    ExportPageBreaks = False
    OpenAfterExport = True
    Wysiwyg = True
    Creator = 'FastReport'
    SuppressPageHeadersFooters = False
    HeaderFooterMode = hfText
    AutoSize = False
    Left = 984
    Top = 328
  end
  object frxSimpleTextExport: TfrxSimpleTextExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    Frames = False
    EmptyLines = False
    OEMCodepage = False
    DeleteEmptyColumns = True
    Left = 984
    Top = 216
  end
  object frxWRS_OBJ: TfrxDBDataset
    UserName = 'frxWRS_OBJ'
    CloseDataSource = True
    FieldAliases.Strings = (
      'zp_rab=zp_rab'
      'ZP_MASH=ZP_MASH'
      'KZP=KZP'
      'RATE_CODE=RATE_CODE'
      'RATE_CAPTION=RATE_CAPTION'
      'RATE_COUNT=RATE_COUNT'
      'RATE_UNIT=RATE_UNIT'
      'NAME1=NAME1'
      'v_rab=v_rab'
      'v_mash=v_mash')
    DataSet = qWRS_OBJ
    BCDToCurrency = False
    Left = 24
    Top = 240
  end
  object qWRS_OBJ: TFDQuery
    AutoCalcFields = False
    Connection = DM.Connect
    Transaction = trReportRead
    UpdateTransaction = trReportWrite
    SQL.Strings = (
      '')
    Left = 24
    Top = 288
  end
  object frxRSMO_OBJ: TfrxDBDataset
    UserName = 'frxRSMO_OBJ'
    CloseDataSource = True
    FieldAliases.Strings = (
      'MAT_CODE=MAT_CODE'
      'MAT_NAME=MAT_NAME'
      'MAT_UNIT=MAT_UNIT'
      'MAT_COUNT=MAT_COUNT'
      'PRICE_NO_NDS=PRICE_NO_NDS'
      'PROC_TRANSP=PROC_TRANSP'
      'TRANSP_NO_NDS=TRANSP_NO_NDS'
      'TYPE_MT=TYPE_MT'
      'TYPE_NAME=TYPE_NAME'
      'COAST_NO_NDS=COAST_NO_NDS'
      'PRICE_NDS=PRICE_NDS'
      'TRANSP_NDS=TRANSP_NDS'
      'COAST_NDS=COAST_NDS'
      'NDS=NDS')
    DataSet = qRSMO_OBJ
    BCDToCurrency = False
    Left = 104
    Top = 240
  end
  object qRSMO_OBJ: TFDQuery
    AutoCalcFields = False
    Connection = DM.Connect
    Transaction = trReportRead
    UpdateTransaction = trReportWrite
    SQL.Strings = (
      '/*explain*/'
      ''
      'SELECT '#9
      #9'`sm`.`MAT_CODE`,'
      #9'`sm`.`MAT_NAME`,'
      #9'`sm`.`MAT_UNIT`,'
      #9'SUM(`sm`.`MAT_COUNT`) `MAT_COUNT`,'
      #9'`sm`.`COAST_NO_NDS`,'
      #9'`sm`.`COAST_NDS`,'
      #9'SUM(`sm`.`PRICE_NO_NDS`) `PRICE_NO_NDS`,'
      #9'SUM(`sm`.`PRICE_NDS`) `PRICE_NDS`,'
      #9'`sm`.`PROC_TRANSP`,'
      #9'SUM(`sm`.`TRANSP_NO_NDS`) `TRANSP_NO_NDS`,'
      #9'SUM(`sm`.`TRANSP_NDS`) `TRANSP_NDS`,'
      #9'`sm`.`TYPE_MT`,'
      #9'`sm`.`TYPE_NAME`,'
      '    0 `FROM_GROUP`,'
      '`sm`.`NDS`'
      'FROM ('
      
        '/* BEGIN ================================= '#1084#1072#1090#1077#1088#1080#1072#1083#1099' '#1074' '#1088#1072#1089#1094#1077#1085#1082#1072#1093 +
        ' =========================================== BEGIN*/'
      'SELECT '
      #9'`mat_in_rate`.`MAT_CODE`,'
      #9'`mat_in_rate`.`MAT_NAME`,'
      #9'`mat_in_rate`.`MAT_UNIT`,'
      #9'SUM(`mat_in_rate`.`MAT_COUNT`) `MAT_COUNT`,'
      #9'`mat_in_rate`.`COAST_NO_NDS`,'
      #9'`mat_in_rate`.`COAST_NDS`,'
      #9'SUM(`mat_in_rate`.`PRICE_NO_NDS`) `PRICE_NO_NDS`,'
      #9'SUM(`mat_in_rate`.`PRICE_NDS`) `PRICE_NDS`,'
      #9'`mat_in_rate`.`PROC_TRANSP`,'
      #9'SUM(`mat_in_rate`.`TRANSP_NO_NDS`) `TRANSP_NO_NDS`,'
      #9'SUM(`mat_in_rate`.`TRANSP_NDS`) `TRANSP_NDS`,'
      #9'`mat_in_rate`.`TYPE_MT`,'
      #9'`mat_in_rate`.`TYPE_NAME`,'
      #9'`mat_in_rate`.`NDS`        '
      '      '
      'FROM ('
      '/*'#1084#1072#1090#1077#1088#1080#1072#1083#1099' '#1074' '#1088#1072#1089#1094#1077#1085#1082#1072#1093'('#1087#1086#1076#1088#1103#1076#1095#1080#1082#1072')*/'
      'SELECT'
      #9'`mtc`.`MAT_CODE`,'
      #9'UCASE(`mtc`.`MAT_NAME`) `MAT_NAME`,'
      #9'`mtc`.`MAT_UNIT`,'
      #9'`mtc`.`MAT_COUNT`,'
      #9'`mtc`.`COAST_NO_NDS`,'
      '`mtc`.`COAST_NDS`,'
      
        #9'(`mtc`.`PRICE_NO_NDS` * (`mtc`.`MAT_PROC_PODR` / 100)) `PRICE_N' +
        'O_NDS`,'
      '(`mtc`.`PRICE_NDS` * (`mtc`.`MAT_PROC_PODR` / 100)) `PRICE_NDS`,'
      #9'`mtc`.`PROC_TRANSP`,'
      
        #9'(`mtc`.`TRANSP_NO_NDS` * (`mtc`.`TRANSP_PROC_PODR` / 100)) `TRA' +
        'NSP_NO_NDS`,'
      
        '(`mtc`.`TRANSP_NDS` * (`mtc`.`TRANSP_PROC_PODR` / 100)) `TRANSP_' +
        'NDS`,'
      #9'0 `TYPE_MT`,'
      '        '#39#1052#1072#1090#1077#1088#1080#1072#1083#1099' '#1087#1086#1076#1088#1103#1076#1095#1080#1082#1072#39' `TYPE_NAME`,'
      '`mtc`.`NDS`'
      ''
      'FROM `smetasourcedata` `ssd`'
      
        'INNER JOIN `smetasourcedata` `ssd1` ON `ssd1`.`PARENT_ID` = `ssd' +
        '`.`SM_ID` '
      '                                   AND `ssd1`.`SM_TYPE` = 1'
      
        'INNER JOIN `smetasourcedata` `ssd2` ON `ssd2`.`PARENT_ID` = `ssd' +
        '1`.`SM_ID`'
      '                                   AND `ssd2`.`SM_TYPE` = 3 '
      
        'INNER JOIN `data_estimate` `de` ON `de`.`ID_ESTIMATE` = `ssd2`.`' +
        'SM_ID` '
      '                               AND `de`.`ID_TYPE_DATA` = 1'
      'INNER JOIN `card_rate` `cr` ON `cr`.`ID` = `de`.`ID_TABLES`'
      
        'INNER JOIN `materialcard` `mtc` ON `mtc`.`ID_CARD_RATE` = `cr`.`' +
        'ID`'
      ''
      'WHERE `ssd`.`SM_ID` = :SM_ID'
      '  AND `ssd`.`SM_TYPE` = 2'
      
        '  AND (`mtc`.`MAT_PROC_PODR` > 0 OR `mtc`.`TRANSP_PROC_PODR` > 0' +
        ')'
      ' '
      ' UNION ALL'
      '/*'#1084#1072#1090#1077#1088#1080#1072#1083#1099' '#1074' '#1088#1072#1089#1094#1077#1085#1082#1072#1093'('#1079#1072#1082#1072#1079#1095#1080#1082#1072')*/ '
      'SELECT'
      #9'`mtc`.`MAT_CODE`,'
      #9'UCASE(`mtc`.`MAT_NAME`) `MAT_NAME`,'
      #9'`mtc`.`MAT_UNIT`,'
      #9'`mtc`.`MAT_COUNT`,'
      #9'`mtc`.`COAST_NO_NDS`,'
      '`mtc`.`COAST_NDS`,'
      
        #9'(`mtc`.`PRICE_NO_NDS` * (`mtc`.`MAT_PROC_ZAC` / 100)) `PRICE_NO' +
        '_NDS`,'
      '(`mtc`.`PRICE_NDS` * (`mtc`.`MAT_PROC_ZAC` / 100)) `PRICE_NDS`,'
      #9'`mtc`.`PROC_TRANSP`,'
      
        #9'(`mtc`.`TRANSP_NO_NDS` * (`mtc`.`TRANSP_PROC_ZAC` / 100)) `TRAN' +
        'SP_NO_NDS`,'
      
        '(`mtc`.`TRANSP_NDS` * (`mtc`.`TRANSP_PROC_ZAC` / 100)) `TRANSP_N' +
        'DS`,'
      #9'1 `TYPE_MT`,'
      '        '#39#1052#1072#1090#1077#1088#1080#1072#1083#1099' '#1079#1072#1082#1072#1079#1095#1080#1082#1072#39' `TYPE_NAME`,'
      '`mtc`.`NDS`'
      ''
      'FROM `smetasourcedata` `ssd`'
      
        'INNER JOIN `smetasourcedata` `ssd1` ON `ssd1`.`PARENT_ID` = `ssd' +
        '`.`SM_ID` '
      '                                   AND `ssd1`.`SM_TYPE` = 1'
      
        'INNER JOIN `smetasourcedata` `ssd2` ON `ssd2`.`PARENT_ID` = `ssd' +
        '1`.`SM_ID`'
      '                                   AND `ssd2`.`SM_TYPE` = 3 '
      
        'INNER JOIN `data_estimate` `de` ON `de`.`ID_ESTIMATE` = `ssd2`.`' +
        'SM_ID` '
      '                               AND `de`.`ID_TYPE_DATA` = 1'
      'INNER JOIN `card_rate` `cr` ON `cr`.`ID` = `de`.`ID_TABLES`'
      
        'INNER JOIN `materialcard` `mtc` ON `mtc`.`ID_CARD_RATE` = `cr`.`' +
        'ID`'
      ''
      'WHERE `ssd`.`SM_ID` = :SM_ID'
      '  AND `ssd`.`SM_TYPE` = 2'
      '  AND (`mtc`.`MAT_PROC_ZAC` > 0 OR `mtc`.`TRANSP_PROC_ZAC` > 0)'
      ') `mat_in_rate`'
      'GROUP BY '
      #9'`mat_in_rate`.`MAT_CODE`,'
      #9'`mat_in_rate`.`MAT_NAME`,'
      #9'`mat_in_rate`.`MAT_UNIT`,'
      #9'`mat_in_rate`.`COAST_NO_NDS`,'
      #9'`mat_in_rate`.`PROC_TRANSP`,'
      #9'`mat_in_rate`.`TYPE_MT`,'
      #9'`mat_in_rate`.`TYPE_NAME`'
      
        '/* END   ================================= '#1084#1072#1090#1077#1088#1080#1072#1083#1099' '#1074' '#1088#1072#1089#1094#1077#1085#1082#1072#1093 +
        ' ============================================ END*/'
      'UNION ALL'
      
        '/* BEGIN ================================= '#1084#1072#1090#1077#1088#1080#1072#1083#1099' '#1074#1085#1077' '#1088#1072#1089#1094#1077#1085#1086 +
        #1082' =========================================== BEGIN*/'
      'SELECT '
      #9'`mat_out_rate`.`MAT_CODE`,'
      #9'`mat_out_rate`.`MAT_NAME`,'
      #9'`mat_out_rate`.`MAT_UNIT`,'
      #9'SUM(`mat_out_rate`.`MAT_COUNT`) `MAT_COUNT`,'
      #9'`mat_out_rate`.`COAST_NO_NDS`,'
      '`mat_out_rate`.`COAST_NDS`,'
      #9'SUM(`mat_out_rate`.`PRICE_NO_NDS`) `PRICE_NO_NDS`,'
      'SUM(`mat_out_rate`.`PRICE_NDS`) `PRICE_NDS`,'
      #9'`mat_out_rate`.`PROC_TRANSP`,'
      #9'SUM(`mat_out_rate`.`TRANSP_NO_NDS`) `TRANSP_NO_NDS`,'
      'SUM(`mat_out_rate`.`TRANSP_NDS`) `TRANSP_NDS`,'
      #9'`mat_out_rate`.`TYPE_MT`,'
      #9'`mat_out_rate`.`TYPE_NAME`,'
      #9'`mat_out_rate`.`NDS`        '
      '      '
      'FROM ('
      '/*'#1084#1072#1090#1077#1088#1080#1072#1083#1099' '#1074#1085#1077' '#1088#1072#1089#1094#1077#1085#1086#1082'('#1087#1086#1076#1088#1103#1076#1095#1080#1082')*/ '
      'SELECT'
      #9'`mtc`.`MAT_CODE`,'
      #9'UCASE(`mtc`.`MAT_NAME`) `MAT_NAME`,'
      #9'`mtc`.`MAT_UNIT`,'
      #9'`mtc`.`MAT_COUNT`,'
      #9'`mtc`.`COAST_NO_NDS`,'
      '`mtc`.`COAST_NDS`,'
      
        #9'(`mtc`.`PRICE_NO_NDS` * (`mtc`.`MAT_PROC_PODR` / 100)) `PRICE_N' +
        'O_NDS`,'
      '(`mtc`.`PRICE_NDS` * (`mtc`.`MAT_PROC_PODR` / 100)) `PRICE_NDS`,'
      #9'`mtc`.`PROC_TRANSP`,'
      
        #9'(`mtc`.`TRANSP_NO_NDS` * (`mtc`.`TRANSP_PROC_PODR` / 100)) `TRA' +
        'NSP_NO_NDS`,'
      
        '(`mtc`.`TRANSP_NDS` * (`mtc`.`TRANSP_PROC_PODR` / 100)) `TRANSP_' +
        'NDS`,'
      #9'0 `TYPE_MT`,'
      '        '#39#1052#1072#1090#1077#1088#1080#1072#1083#1099' '#1087#1086#1076#1088#1103#1076#1095#1080#1082#1072#39' `TYPE_NAME`,'
      '`mtc`.`NDS`'
      ''
      'FROM `smetasourcedata` `ssd`'
      
        'INNER JOIN `smetasourcedata` `ssd1` ON `ssd1`.`PARENT_ID` = `ssd' +
        '`.`SM_ID` '
      '                                   AND `ssd1`.`SM_TYPE` = 1'
      
        'INNER JOIN `smetasourcedata` `ssd2` ON `ssd2`.`PARENT_ID` = `ssd' +
        '1`.`SM_ID`'
      '                                   AND `ssd2`.`SM_TYPE` = 3 '
      
        'INNER JOIN `data_estimate` `de` ON `de`.`ID_ESTIMATE` = `ssd2`.`' +
        'SM_ID` '
      '                               AND `de`.`ID_TYPE_DATA` = 2'
      
        'INNER JOIN `materialcard` `mtc` ON `mtc`.`ID` = `de`.`ID_TABLES`' +
        ' '
      #9#9#9'       AND `mtc`.`ID_CARD_RATE` = 0'
      ''
      'WHERE `ssd`.`SM_ID` = :SM_ID'
      '  AND `ssd`.`SM_TYPE` = 2'
      
        '  AND (`mtc`.`MAT_PROC_PODR` > 0 OR `mtc`.`TRANSP_PROC_PODR` > 0' +
        ')  '
      ''
      'UNION ALL'
      '/*'#1084#1072#1090#1077#1088#1080#1072#1083#1099' '#1074#1085#1077' '#1088#1072#1089#1094#1077#1085#1086#1082'('#1079#1072#1082#1072#1079#1095#1080#1082')*/ '
      'SELECT'
      #9'`mtc`.`MAT_CODE`,'
      #9'UCASE(`mtc`.`MAT_NAME`) `MAT_NAME`,'
      #9'`mtc`.`MAT_UNIT`,'
      #9'`mtc`.`MAT_COUNT`,'
      #9'`mtc`.`COAST_NO_NDS`,'#9
      '`mtc`.`COAST_NDS`,'#9
      
        #9'(`mtc`.`PRICE_NO_NDS` * (`mtc`.`MAT_PROC_ZAC` / 100)) `PRICE_NO' +
        '_NDS`,'
      '(`mtc`.`PRICE_NDS` * (`mtc`.`MAT_PROC_ZAC` / 100)) `PRICE_NDS`,'
      #9'`mtc`.`PROC_TRANSP`,'
      
        #9'(`mtc`.`TRANSP_NO_NDS` * (`mtc`.`TRANSP_PROC_ZAC` / 100))`TRANS' +
        'P_NO_NDS`, '
      
        '(`mtc`.`TRANSP_NDS` * (`mtc`.`TRANSP_PROC_ZAC` / 100))`TRANSP_ND' +
        'S`,'
      #9'1 `TYPE_MT`,'
      '        '#39#1052#1072#1090#1077#1088#1080#1072#1083#1099' '#1079#1072#1082#1072#1079#1095#1080#1082#1072#39' `TYPE_NAME`,'
      '`mtc`.`NDS`'
      ''
      'FROM `smetasourcedata` `ssd`'
      
        'INNER JOIN `smetasourcedata` `ssd1` ON `ssd1`.`PARENT_ID` = `ssd' +
        '`.`SM_ID` '
      '                                   AND `ssd1`.`SM_TYPE` = 1'
      
        'INNER JOIN `smetasourcedata` `ssd2` ON `ssd2`.`PARENT_ID` = `ssd' +
        '1`.`SM_ID`'
      '                                   AND `ssd2`.`SM_TYPE` = 3 '
      
        'INNER JOIN `data_estimate` `de` ON `de`.`ID_ESTIMATE` = `ssd2`.`' +
        'SM_ID` '
      '                               AND `de`.`ID_TYPE_DATA` = 2'
      
        'INNER JOIN `materialcard` `mtc` ON `mtc`.`ID` = `de`.`ID_TABLES`' +
        ' '
      #9#9#9'       AND `mtc`.`ID_CARD_RATE` = 0'
      ''
      'WHERE `ssd`.`SM_ID` = :SM_ID'
      '  AND `ssd`.`SM_TYPE` = 2'
      '  AND (`mtc`.`MAT_PROC_ZAC` > 0 OR `mtc`.`TRANSP_PROC_ZAC` > 0)'
      ') `mat_out_rate`'
      'GROUP BY '
      #9'`mat_out_rate`.`MAT_CODE`,'
      #9'`mat_out_rate`.`MAT_NAME`,'
      #9'`mat_out_rate`.`MAT_UNIT`,'
      #9'`mat_out_rate`.`COAST_NO_NDS`,'
      #9'`mat_out_rate`.`COAST_NDS`,'
      #9'`mat_out_rate`.`PROC_TRANSP`,'
      #9'`mat_out_rate`.`TYPE_MT`,'
      #9'`mat_out_rate`.`TYPE_NAME`,'
      #9'`mat_out_rate`.`NDS`'
      
        '/* END   ================================= '#1084#1072#1090#1077#1088#1080#1072#1083#1099' '#1074#1085#1077' '#1088#1072#1089#1094#1077#1085#1086 +
        #1082' =========================================== END*/'
      'UNION ALL'
      
        '/* BEGIN ================================= '#1089#1074#1072#1083#1082#1072' ==============' +
        '=========================================== BEGIN*/'
      'SELECT'
      #9'`dc`.`DUMP_CODE_JUST` `MAT_CODE`,'
      #9'UCASE(`dc`.`DUMP_NAME`) `MAT_NAME`,'
      #9'`dc`.`DUMP_UNIT` `MAT_UNIT`,'
      #9'`dc`.`DUMP_COUNT` `MAT_COUNT`,'
      #9'`dc`.`COAST_NDS` `COAST_NO_NDS`,'
      #9'`dc`.`COAST_NDS` `COAST_NDS`,'
      #9'`dc`.`PRICE_NO_NDS` `PRICE_NO_NDS`,'
      #9'`dc`.`PRICE_NDS` `PRICE_NDS`,'
      #9'0 `PROC_TRANSP`,'
      #9'0 `TRANSP_NO_NDS`,'
      #9'0 `TRANSP_NDS`,'
      #9'999 `TYPE_MT`,'
      '        '#39#1057#1074#1072#1083#1082#1072#39' `TYPE_NAME`,'
      #9'0 `NDS`'
      'FROM `smetasourcedata` `ssd`'
      ''
      
        'INNER JOIN `smetasourcedata` `ssd1` ON `ssd1`.`PARENT_ID` = `ssd' +
        '`.`SM_ID` '
      '                                   AND `ssd1`.`SM_TYPE` = 1'
      
        'INNER JOIN `smetasourcedata` `ssd2` ON `ssd2`.`PARENT_ID` = `ssd' +
        '1`.`SM_ID`'
      '                                   AND `ssd2`.`SM_TYPE` = 3 '
      
        'INNER JOIN `data_estimate` `de` ON `de`.`ID_ESTIMATE` = `ssd2`.`' +
        'SM_ID` '
      '                               AND `de`.`ID_TYPE_DATA` = 5'
      
        'INNER JOIN `dumpcard` `dc` ON `dc`.`ID` = `de`.`ID_TABLES`      ' +
        '                        '
      ''
      'WHERE `ssd`.`SM_ID` = :SM_ID'
      '  AND `ssd`.`SM_TYPE` = 2  '
      
        '/* END ==================================== '#1089#1074#1072#1083#1082#1072' =============' +
        '============================================= END*/  '
      ') `sm`    '
      'GROUP BY `sm`.`MAT_CODE`,'
      #9' `sm`.`MAT_NAME`,'
      #9' `sm`.`MAT_UNIT`,'
      #9' `sm`.`COAST_NO_NDS`,'
      #9' `sm`.`COAST_NDS`,'
      #9' `sm`.`PROC_TRANSP`,'
      #9' `sm`.`TYPE_MT`,'
      '     `sm`.`TYPE_NAME`'
      ''
      'ORDER BY `sm`.`TYPE_MT`, '
      '         `sm`.`MAT_CODE`')
    Left = 104
    Top = 288
    ParamData = <
      item
        Name = 'SM_ID'
        ParamType = ptInput
      end>
  end
  object qRSMEH_OBJ: TFDQuery
    AutoCalcFields = False
    Connection = DM.Connect
    Transaction = trReportRead
    UpdateTransaction = trReportWrite
    SQL.Strings = (
      'SELECT '#9
      #9'`sm`.`MECH_CODE`,'
      #9'`sm`.`MECH_NAME`,'
      #9'`sm`.`MECH_UNIT`,'
      #9'SUM(`sm`.`MECH_COUNT`) `MECH_COUNT`,'
      #9'`sm`.`COAST_NO_NDS`,'
      #9'`sm`.`COAST_NDS`,'
      #9'SUM(`sm`.`PRICE_NO_NDS`) `PRICE_NO_NDS`,'
      #9'SUM(`sm`.`PRICE_NDS`) `PRICE_NDS`,'
      #9'`sm`.`TYPE_MT`,'
      #9'`sm`.`TYPE_NAME`,'
      '    0 `FROM_GROUP`,'
      #9'`sm`.`NDS`,'
      #9'`sm`.`ZP_MACH_NO_NDS`,'
      #9'`sm`.`ZP_MACH_NDS`,'
      #9'SUM(`sm`.`ZPPRICE_NO_NDS`)   `ZPPRICE_NO_NDS`,'
      #9'SUM(`sm`.`ZPPRICE_NDS`) '#9'  `ZPPRICE_NDS`   '
      'FROM ('
      
        '/* BEGIN ================================= '#1052#1077#1093#1072#1085#1080#1079#1084#1099' '#1074' '#1088#1072#1089#1094#1077#1085#1082#1072#1093 +
        ' =========================================== BEGIN*/'
      'SELECT '
      #9'`MECH_in_rate`.`MECH_CODE`,'
      #9'`MECH_in_rate`.`MECH_NAME`,'
      #9'`MECH_in_rate`.`MECH_UNIT`,'
      #9'SUM(`MECH_in_rate`.`MECH_COUNT`) `MECH_COUNT`,'
      #9'`MECH_in_rate`.`COAST_NO_NDS`,'
      #9'`MECH_in_rate`.`COAST_NDS`,'
      #9'SUM(`MECH_in_rate`.`PRICE_NO_NDS`) `PRICE_NO_NDS`,'
      #9'SUM(`MECH_in_rate`.`PRICE_NDS`) `PRICE_NDS`,'
      #9'`MECH_in_rate`.`TYPE_MT`,'
      #9'`MECH_in_rate`.`TYPE_NAME`,'
      #9'`MECH_in_rate`.`NDS`,'
      #9'`MECH_in_rate`.`ZP_MACH_NO_NDS`,'
      #9'`MECH_in_rate`.`ZP_MACH_NDS`,'
      #9'SUM(`MECH_in_rate`.`ZPPRICE_NO_NDS`)   `ZPPRICE_NO_NDS`,'
      #9'SUM(`MECH_in_rate`.`ZPPRICE_NDS`) `ZPPRICE_NDS`    '
      '      '
      'FROM ('
      '/*'#1052#1077#1093#1072#1085#1080#1079#1084#1099' '#1074' '#1088#1072#1089#1094#1077#1085#1082#1072#1093'('#1087#1086#1076#1088#1103#1076#1095#1080#1082#1072')*/'
      'SELECT'
      #9'`mtc`.`MECH_CODE`,'
      #9'UCASE(`mtc`.`MECH_NAME`) `MECH_NAME`,'
      #9'`mtc`.`MECH_UNIT`,'
      #9'`mtc`.`MECH_COUNT`,'
      #9'`mtc`.`COAST_NO_NDS`,'
      #9'`mtc`.`COAST_NDS`,'
      
        #9'(`mtc`.`PRICE_NO_NDS` * (`mtc`.`PROC_PODR` / 100)) `PRICE_NO_ND' +
        'S`,'
      #9'(`mtc`.`PRICE_NDS` * (`mtc`.`PROC_PODR` / 100)) `PRICE_NDS`,'
      #9'0 `TYPE_MT`,'
      '    '#39#1052#1077#1093#1072#1085#1080#1079#1084#1099' '#1087#1086#1076#1088#1103#1076#1095#1080#1082#1072#39' `TYPE_NAME`,'
      #9'`mtc`.`NDS`,'
      
        #9'(`mtc`.`ZP_MACH_NO_NDS` * (`mtc`.`PROC_PODR` / 100)) `ZP_MACH_N' +
        'O_NDS`,'
      
        #9'(`mtc`.`ZP_MACH_NDS` * (`mtc`.`PROC_PODR` / 100)) `ZP_MACH_NDS`' +
        ','
      
        #9'(`mtc`.`ZPPRICE_NO_NDS` * (`mtc`.`PROC_PODR` / 100)) `ZPPRICE_N' +
        'O_NDS`,'
      
        #9'(`mtc`.`ZPPRICE_NDS` * (`mtc`.`PROC_PODR` / 100)) `ZPPRICE_NDS`' +
        '  '
      ''
      'FROM `smetasourcedata` `ssd`'
      
        'INNER JOIN `smetasourcedata` `ssd1` ON `ssd1`.`PARENT_ID` = `ssd' +
        '`.`SM_ID` '
      '                                   AND `ssd1`.`SM_TYPE` = 1'
      
        'INNER JOIN `smetasourcedata` `ssd2` ON `ssd2`.`PARENT_ID` = `ssd' +
        '1`.`SM_ID`'
      '                                   AND `ssd2`.`SM_TYPE` = 3 '
      
        'INNER JOIN `data_estimate` `de` ON `de`.`ID_ESTIMATE` = `ssd2`.`' +
        'SM_ID` '
      '                               AND `de`.`ID_TYPE_DATA` = 1'
      'INNER JOIN `card_rate` `cr` ON `cr`.`ID` = `de`.`ID_TABLES`'
      
        'INNER JOIN `mechanizmcard` `mtc` ON `mtc`.`ID_CARD_RATE` = `cr`.' +
        '`ID`'
      ''
      'WHERE `ssd`.`SM_ID` = :SM_ID'
      '  AND `ssd`.`SM_TYPE` = 2'
      '  AND (`mtc`.`PROC_PODR` > 0)'
      ' '
      ' UNION ALL'
      '/*'#1052#1077#1093#1072#1085#1080#1079#1084#1099' '#1074' '#1088#1072#1089#1094#1077#1085#1082#1072#1093'('#1079#1072#1082#1072#1079#1095#1080#1082#1072')*/ '
      'SELECT'
      #9'`mtc`.`MECH_CODE`,'
      #9'UCASE(`mtc`.`MECH_NAME`) `MECH_NAME`,'
      #9'`mtc`.`MECH_UNIT`,'
      #9'`mtc`.`MECH_COUNT`,'
      #9'`mtc`.`COAST_NO_NDS`,'
      #9'`mtc`.`COAST_NDS`,'
      
        #9'(`mtc`.`PRICE_NO_NDS` * (`mtc`.`PROC_ZAC` / 100)) `PRICE_NO_NDS' +
        '`,'
      #9'(`mtc`.`PRICE_NDS` * (`mtc`.`PROC_ZAC` / 100)) `PRICE_NDS`,'
      #9'1 `TYPE_MT`,'
      '    '#39#1052#1077#1093#1072#1085#1080#1079#1084#1099' '#1079#1072#1082#1072#1079#1095#1080#1082#1072#39' `TYPE_NAME`,'
      #9'`mtc`.`NDS`,'
      
        #9'(`mtc`.`ZP_MACH_NO_NDS` * (`mtc`.`PROC_ZAC` / 100)) `ZP_MACH_NO' +
        '_NDS`,'
      #9'(`mtc`.`ZP_MACH_NDS` * (`mtc`.`PROC_ZAC` / 100)) `ZP_MACH_NDS`,'
      
        #9'(`mtc`.`ZPPRICE_NO_NDS` * (`mtc`.`PROC_ZAC` / 100)) `ZPPRICE_NO' +
        '_NDS`,'
      #9'(`mtc`.`ZPPRICE_NDS` * (`mtc`.`PROC_ZAC` / 100)) `ZPPRICE_NDS` '
      ''
      'FROM `smetasourcedata` `ssd`'
      
        'INNER JOIN `smetasourcedata` `ssd1` ON `ssd1`.`PARENT_ID` = `ssd' +
        '`.`SM_ID` '
      '                                   AND `ssd1`.`SM_TYPE` = 1'
      
        'INNER JOIN `smetasourcedata` `ssd2` ON `ssd2`.`PARENT_ID` = `ssd' +
        '1`.`SM_ID`'
      '                                   AND `ssd2`.`SM_TYPE` = 3 '
      
        'INNER JOIN `data_estimate` `de` ON `de`.`ID_ESTIMATE` = `ssd2`.`' +
        'SM_ID` '
      '                               AND `de`.`ID_TYPE_DATA` = 1'
      'INNER JOIN `card_rate` `cr` ON `cr`.`ID` = `de`.`ID_TABLES`'
      
        'INNER JOIN `mechanizmcard` `mtc` ON `mtc`.`ID_CARD_RATE` = `cr`.' +
        '`ID`'
      ''
      'WHERE `ssd`.`SM_ID` = :SM_ID'
      '  AND `ssd`.`SM_TYPE` = 2'
      '  AND (`mtc`.`PROC_ZAC` > 0 )'
      ') `MECH_in_rate`'
      'GROUP BY '
      #9'`MECH_in_rate`.`MECH_CODE`,'
      #9'`MECH_in_rate`.`MECH_NAME`,'
      #9'`MECH_in_rate`.`MECH_UNIT`,'
      #9'`MECH_in_rate`.`COAST_NO_NDS`,'
      #9'`MECH_in_rate`.`TYPE_MT`,'
      #9'`MECH_in_rate`.`TYPE_NAME`'
      
        '/* END   ================================= '#1052#1077#1093#1072#1085#1080#1079#1084#1099' '#1074' '#1088#1072#1089#1094#1077#1085#1082#1072#1093 +
        ' ============================================ END*/'
      'UNION ALL'
      
        '/* BEGIN ================================= '#1052#1077#1093#1072#1085#1080#1079#1084#1099' '#1074#1085#1077' '#1088#1072#1089#1094#1077#1085#1086 +
        #1082' =========================================== BEGIN*/'
      'SELECT '
      #9'`MECH_out_rate`.`MECH_CODE`,'
      #9'`MECH_out_rate`.`MECH_NAME`,'
      #9'`MECH_out_rate`.`MECH_UNIT`,'
      #9'SUM(`MECH_out_rate`.`MECH_COUNT`) `MECH_COUNT`,'
      #9'`MECH_out_rate`.`COAST_NO_NDS`,'
      #9'`MECH_out_rate`.`COAST_NDS`,'
      #9'SUM(`MECH_out_rate`.`PRICE_NO_NDS`) `PRICE_NO_NDS`,'
      #9'SUM(`MECH_out_rate`.`PRICE_NDS`) `PRICE_NDS`,'
      #9'`MECH_out_rate`.`TYPE_MT`,'
      #9'`MECH_out_rate`.`TYPE_NAME`,'
      #9'`MECH_out_rate`.`NDS`,'
      #9'`MECH_out_rate`.`ZP_MACH_NO_NDS`,'
      #9'`MECH_out_rate`.`ZP_MACH_NDS`,'
      #9'SUM(`MECH_out_rate`.`ZPPRICE_NO_NDS`)   `ZPPRICE_NO_NDS`,'
      #9'SUM(`MECH_out_rate`.`ZPPRICE_NDS`) `ZPPRICE_NDS`       '
      '      '
      'FROM ('
      '/*'#1052#1077#1093#1072#1085#1080#1079#1084#1099' '#1074#1085#1077' '#1088#1072#1089#1094#1077#1085#1086#1082'('#1087#1086#1076#1088#1103#1076#1095#1080#1082')*/ '
      'SELECT'
      #9'`mtc`.`MECH_CODE`,'
      #9'UCASE(`mtc`.`MECH_NAME`) `MECH_NAME`,'
      #9'`mtc`.`MECH_UNIT`,'
      #9'`mtc`.`MECH_COUNT`,'
      #9'`mtc`.`COAST_NO_NDS`,'
      #9'`mtc`.`COAST_NDS`,'
      
        #9'(`mtc`.`PRICE_NO_NDS` * (`mtc`.`PROC_PODR` / 100)) `PRICE_NO_ND' +
        'S`,'
      #9'(`mtc`.`PRICE_NDS` * (`mtc`.`PROC_PODR` / 100)) `PRICE_NDS`,'
      #9'0 `TYPE_MT`,'
      '    '#39#1052#1077#1093#1072#1085#1080#1079#1084#1099' '#1087#1086#1076#1088#1103#1076#1095#1080#1082#1072#39' `TYPE_NAME`,'
      #9'`mtc`.`NDS`,'
      
        #9'(`mtc`.`ZP_MACH_NO_NDS` * (`mtc`.`PROC_PODR` / 100)) `ZP_MACH_N' +
        'O_NDS`,'
      
        #9'(`mtc`.`ZP_MACH_NDS` * (`mtc`.`PROC_PODR` / 100)) `ZP_MACH_NDS`' +
        ','
      
        #9'(`mtc`.`ZPPRICE_NO_NDS` * (`mtc`.`PROC_PODR` / 100)) `ZPPRICE_N' +
        'O_NDS`,'
      
        #9'(`mtc`.`ZPPRICE_NDS` * (`mtc`.`PROC_PODR` / 100)) `ZPPRICE_NDS`' +
        ' '
      ''
      'FROM `smetasourcedata` `ssd`'
      
        'INNER JOIN `smetasourcedata` `ssd1` ON `ssd1`.`PARENT_ID` = `ssd' +
        '`.`SM_ID` '
      '                                   AND `ssd1`.`SM_TYPE` = 1'
      
        'INNER JOIN `smetasourcedata` `ssd2` ON `ssd2`.`PARENT_ID` = `ssd' +
        '1`.`SM_ID`'
      '                                   AND `ssd2`.`SM_TYPE` = 3 '
      
        'INNER JOIN `data_estimate` `de` ON `de`.`ID_ESTIMATE` = `ssd2`.`' +
        'SM_ID` '
      '                               AND `de`.`ID_TYPE_DATA` = 2'
      
        'INNER JOIN `mechanizmcard` `mtc` ON `mtc`.`ID` = `de`.`ID_TABLES' +
        '` '
      #9#9#9'       AND `mtc`.`ID_CARD_RATE` = 0'
      ''
      'WHERE `ssd`.`SM_ID` = :SM_ID'
      '  AND `ssd`.`SM_TYPE` = 2'
      '  AND (`mtc`.`PROC_PODR` > 0 )  '
      ''
      'UNION ALL'
      '/*'#1052#1077#1093#1072#1085#1080#1079#1084#1099' '#1074#1085#1077' '#1088#1072#1089#1094#1077#1085#1086#1082'('#1079#1072#1082#1072#1079#1095#1080#1082')*/ '
      'SELECT'
      #9'`mtc`.`MECH_CODE`,'
      #9'UCASE(`mtc`.`MECH_NAME`) `MECH_NAME`,'
      #9'`mtc`.`MECH_UNIT`,'
      #9'`mtc`.`MECH_COUNT`,'
      #9'`mtc`.`COAST_NO_NDS`,'#9
      #9'`mtc`.`COAST_NDS`,'#9
      
        #9'(`mtc`.`PRICE_NO_NDS` * (`mtc`.`PROC_ZAC` / 100)) `PRICE_NO_NDS' +
        '`,'
      #9'(`mtc`.`PRICE_NDS` * (`mtc`.`PROC_ZAC` / 100)) `PRICE_NDS`,'
      #9'1 `TYPE_MT`,'
      '    '#39#1052#1077#1093#1072#1085#1080#1079#1084#1099' '#1079#1072#1082#1072#1079#1095#1080#1082#1072#39' `TYPE_NAME`,'
      #9'`mtc`.`NDS`,'
      
        #9'(`mtc`.`ZP_MACH_NO_NDS` * (`mtc`.`PROC_ZAC` / 100)) `ZP_MACH_NO' +
        '_NDS`,'
      #9'(`mtc`.`ZP_MACH_NDS` * (`mtc`.`PROC_ZAC` / 100)) `ZP_MACH_NDS`,'
      
        #9'(`mtc`.`ZPPRICE_NO_NDS` * (`mtc`.`PROC_ZAC` / 100)) `ZPPRICE_NO' +
        '_NDS`,'
      #9'(`mtc`.`ZPPRICE_NDS` * (`mtc`.`PROC_ZAC` / 100)) `ZPPRICE_NDS` '
      ''
      'FROM `smetasourcedata` `ssd`'
      
        'INNER JOIN `smetasourcedata` `ssd1` ON `ssd1`.`PARENT_ID` = `ssd' +
        '`.`SM_ID` '
      '                                   AND `ssd1`.`SM_TYPE` = 1'
      
        'INNER JOIN `smetasourcedata` `ssd2` ON `ssd2`.`PARENT_ID` = `ssd' +
        '1`.`SM_ID`'
      '                                   AND `ssd2`.`SM_TYPE` = 3 '
      
        'INNER JOIN `data_estimate` `de` ON `de`.`ID_ESTIMATE` = `ssd2`.`' +
        'SM_ID` '
      '                               AND `de`.`ID_TYPE_DATA` = 2'
      
        'INNER JOIN `mechanizmcard` `mtc` ON `mtc`.`ID` = `de`.`ID_TABLES' +
        '` '
      #9#9#9'       AND `mtc`.`ID_CARD_RATE` = 0'
      ''
      'WHERE `ssd`.`SM_ID` = :SM_ID'
      '  AND `ssd`.`SM_TYPE` = 2'
      '  AND (`mtc`.`PROC_ZAC` > 0 )'
      ') `MECH_out_rate`'
      'GROUP BY '
      #9'`MECH_out_rate`.`MECH_CODE`,'
      #9'`MECH_out_rate`.`MECH_NAME`,'
      #9'`MECH_out_rate`.`MECH_UNIT`,'
      #9'`MECH_out_rate`.`COAST_NO_NDS`,'
      #9'`MECH_out_rate`.`COAST_NDS`,'
      #9'`MECH_out_rate`.`TYPE_MT`,'
      #9'`MECH_out_rate`.`TYPE_NAME`,'
      #9'`MECH_out_rate`.`NDS`'
      
        '/* END   ================================= '#1052#1077#1093#1072#1085#1080#1079#1084#1099' '#1074#1085#1077' '#1088#1072#1089#1094#1077#1085#1086 +
        #1082' =========================================== END*/'
      ') `sm`    '
      'GROUP BY `sm`.`MECH_CODE`,'
      #9' `sm`.`MECH_NAME`,'
      #9' `sm`.`MECH_UNIT`,'
      #9' `sm`.`COAST_NO_NDS`,'
      #9' `sm`.`COAST_NDS`,'
      #9' `sm`.`TYPE_MT`,'
      '     `sm`.`TYPE_NAME`'
      ''
      'ORDER BY `sm`.`TYPE_MT`, '
      '         `sm`.`MECH_CODE`')
    Left = 200
    Top = 288
    ParamData = <
      item
        Name = 'SM_ID'
        ParamType = ptInput
      end>
  end
  object frxRSMEH_OBJ: TfrxDBDataset
    UserName = 'frxRSMEH_OBJ'
    CloseDataSource = True
    FieldAliases.Strings = (
      'MECH_CODE=MECH_CODE'
      'MECH_NAME=MECH_NAME'
      'MECH_UNIT=MECH_UNIT'
      'MECH_COUNT=MECH_COUNT'
      'COAST_NO_NDS=COAST_NO_NDS'
      'COAST_NDS=COAST_NDS'
      'PRICE_NO_NDS=PRICE_NO_NDS'
      'PRICE_NDS=PRICE_NDS'
      'TYPE_MT=TYPE_MT'
      'TYPE_NAME=TYPE_NAME'
      'FROM_GROUP=FROM_GROUP'
      'NDS=NDS'
      'ZP_MACH_NO_NDS=ZP_MACH_NO_NDS'
      'ZP_MACH_NDS=ZP_MACH_NDS'
      'ZPPRICE_NO_NDS=ZPPRICE_NO_NDS'
      'ZPPRICE_NDS=ZPPRICE_NDS')
    DataSet = qRSMEH_OBJ
    BCDToCurrency = False
    Left = 200
    Top = 240
  end
  object qVED_OANDPWV1: TFDQuery
    AutoCalcFields = False
    Connection = DM.Connect
    Transaction = trReportRead
    UpdateTransaction = trReportWrite
    Left = 296
    Top = 288
  end
  object frxqVED_OANDPWV1: TfrxDBDataset
    UserName = 'frxqVED_OANDPWV1'
    CloseDataSource = True
    FieldAliases.Strings = (
      'sm_number=sm_number'
      'name=name'
      'name_o=name_o'
      'name_l=name_l'
      'sm_vid=sm_vid'
      's_trud=s_trud'
      's_zp=s_zp'
      's_trud_mash=s_trud_mash'
      's_emim=s_emim'
      's_zp_mash=s_zp_mash'
      's_mr=s_mr'
      's_transp=s_transp'
      's_st_ohropr=s_st_ohropr'
      's_plan_prib=s_plan_prib'
      's_stoim=s_stoim'
      'parent_id=parent_id'
      'S_OHROPR=S_OHROPR')
    DataSet = qVED_OANDPWV1
    BCDToCurrency = False
    Left = 296
    Top = 240
  end
  object qVED_OBRAB_RASHRES_SMET: TFDQuery
    AutoCalcFields = False
    Connection = DM.Connect
    Transaction = trReportRead
    UpdateTransaction = trReportWrite
    Left = 440
    Top = 288
  end
  object frxVED_OBRAB_RASHRES_SMET: TfrxDBDataset
    UserName = 'frxVED_OBRAB_RASHRES_SMET'
    CloseDataSource = True
    FieldAliases.Strings = (
      'name_s=name_s'
      'name_o=name_o'
      'name_l=name_l'
      'mat_code=mat_code'
      'mat_name=mat_name'
      'mat_unit=mat_unit'
      'mat_count=mat_count'
      'sm_number=sm_number'
      'sm_number1=sm_number1'
      'sm_number2=sm_number2')
    DataSet = qVED_OBRAB_RASHRES_SMET
    BCDToCurrency = False
    Left = 440
    Top = 240
  end
  object qrSMETA_OBJ_E: TFDQuery
    AutoCalcFields = False
    Connection = DM.Connect
    Transaction = trReportRead
    UpdateTransaction = trReportWrite
    SQL.Strings = (
      'SELECT '
      #9'`de`.`NUM_ROW`,'
      #9'CONCAT(`ssd`.`SM_NUMBER`, " ", `ssd`.`NAME`) `OBJECT_NAME`,'
      #9'CONCAT(`ssd1`.`SM_NUMBER`, " ", `ssd1`.`NAME`) `LOCAL_NAME`,'
      #9'CONCAT(`ssd2`.`SM_NUMBER`, " ", `ssd2`.`NAME`) `PTM_NAME`,'
      #9'`cr`.`RATE_CODE`,'
      #9'`cr`.`OHROPR`,'
      #9'`cr`.`PLAN_PRIB`, '
      #9'`nw`.`NORMA`,'
      #9'`c`.`COEF`,'
      '        `de`.`OHROPR` `SUM_OHROPR`,'
      #9'`de`.`PLAN_PRIB` `SUM_PLAN_PRIB`,'
      ''
      
        #9'IF(`de`.`ZP` = NULL, NULL, IF(`os`.`OBJ_REGION` = 3, `s`.`STAVK' +
        'A_M_RAB`, `s`.`STAVKA_RB_RAB`)) `TARIF`,'
      #9'UPPER(`cr`.`RATE_CAPTION`) `RATE_CAPTION`,'
      #9'`cr`.`RATE_COUNT`,'
      #9'`cr`.`RATE_UNIT`,'
      ''
      
        #9'`de`.`ZP` / IF(IFNULL(`cr`.`RATE_COUNT`, 0) = 0, 1, `cr`.`RATE_' +
        'COUNT`) `ZP_ED`,'
      #9'`de`.`ZP`,'
      #9'`de`.`K_ZP`,'
      #9
      
        #9'`de`.`TRUD_MASH` / IF(IFNULL(`cr`.`RATE_COUNT`, 0) = 0, 1, `cr`' +
        '.`RATE_COUNT`) `TRUD_MASH_ED`,'
      #9'`de`.`TRUD_MASH`,'
      #9'`de`.`K_TRUD_MASH`,'
      ''
      
        #9'`de`.`EMiM` / IF(IFNULL(`cr`.`RATE_COUNT`, 0) = 0, 1, `cr`.`RAT' +
        'E_COUNT`) `EMiM_ED`,'
      #9'`de`.`EMiM`,'
      #9'`de`.`K_EMiM`,'
      ''
      
        #9'`de`.`ZP_MASH` / IF(IFNULL(`cr`.`RATE_COUNT`, 0) = 0, 1, `cr`.`' +
        'RATE_COUNT`) `ZP_MASH_ED`,'
      #9'`de`.`ZP_MASH`,'
      #9'`de`.`K_ZP_MASH`,'
      ''
      
        #9'`de`.`MR` / IF(IFNULL(`cr`.`RATE_COUNT`, 0) = 0, 1, `cr`.`RATE_' +
        'COUNT`) `MR_ED`,'
      #9'`de`.`MR`,'
      #9'`de`.`K_MR`,'
      ''
      
        #9'`de`.`TRANSP` / IF(IFNULL(`cr`.`RATE_COUNT`, 0) = 0, 1, `cr`.`R' +
        'ATE_COUNT`) `TRANSP_ED`,'
      #9'`de`.`TRANSP`,'
      #9'`de`.`K_TRANSP`,'
      ''
      
        #9'`de`.`STOIM` / IF(IFNULL(`cr`.`RATE_COUNT`, 0) = 0, 1, `cr`.`RA' +
        'TE_COUNT`) `STOIM_ED`,'
      #9'`de`.`STOIM`, '
      #9'`de`.`K_STOIM`,'
      ''
      '        0 `FROM_GROUP`,'
      '        '
      '        IFNULL(`zn_v`.`COEF`, 0) `ZIM_COEF`, '
      #9'IFNULL(`zn_v`.`COEF_ZP`, 0) `ZIM_COEF_ZP`,'
      
        '        IF(IFNULL(`zn_v`.`COEF`, 0) = 0, 0, `de`.`ZIM_UDOR`) `ZI' +
        'M_UDOR`,'
      
        #9'IF(IFNULL(`zn_v`.`COEF_ZP`, 0) = 0, 0, `de`.`ZP_ZIM_UDOR`) `ZP_' +
        'ZIM_UDOR`,'
      '        '
      
        '        `de`.`TRUD` / IF(IFNULL(`cr`.`RATE_COUNT`, 1) = 0, 1, IF' +
        'NULL(`cr`.`RATE_COUNT`, 1)) `TRUD_ED`,'
      '        `de`.`TRUD`,'
      '        `ssd`.`SM_ID`,'
      '        `ssd2`.`SM_ID` `SM_ID2`,'
      '        `ssd1`.`SM_ID` `SM_ID1`,'
      '        `de`.`ID_TABLES`'
      ''
      'FROM `smetasourcedata` `ssd`'
      
        'INNER JOIN `smetasourcedata` `ssd1` ON `ssd1`.`PARENT_ID` = `ssd' +
        '`.`SM_ID` '
      #9#9#9#9'   AND `ssd1`.`SM_TYPE` = 1'
      
        'INNER JOIN `smetasourcedata` `ssd2` ON `ssd2`.`PARENT_ID` = `ssd' +
        '1`.`SM_ID`'
      #9#9#9#9'   AND `ssd2`.`SM_TYPE` = 3 '
      
        'INNER JOIN `data_estimate` `de` ON `de`.`ID_ESTIMATE` = `ssd2`.`' +
        'SM_ID` '
      #9#9#9'       AND `de`.`ID_TYPE_DATA` = 1 '
      'INNER JOIN `card_rate` `cr` ON `cr`.`ID` = `de`.`ID_TABLES`'
      '/*'#1076#1083#1103' '#1088#1072#1079#1088#1103#1076#1072'*/'
      
        'INNER JOIN `normativwork` `nw` ON `nw`.`NORMATIV_ID` = `cr`.`RAT' +
        'E_ID`'
      #9'               '#9'      AND `nw`.`WORK_ID` = 1'
      '/*'#1076#1083#1103' '#1090#1072#1088#1080#1092#1085#1086#1081' '#1089#1090#1072#1074#1082#1080' 4 '#1088#1072#1079#1088#1103#1076#1072'*/'
      'INNER JOIN `stavka` `s` ON `s`.`STAVKA_ID` = `ssd2`.`STAVKA_ID`'
      'INNER JOIN `objcards` `oc` ON `oc`.`OBJ_ID` = `ssd2`.`OBJ_ID`'
      'INNER JOIN `objstroj` `os` ON `os`.`STROJ_ID` = `oc`.`STROJ_ID`'
      '/*'#1076#1083#1103' '#1084#1077#1078#1088#1072#1079#1088#1103#1076#1085#1086#1075#1086' '#1082#1086#1101#1092#1092#1080#1094#1080#1077#1085#1090#1072'*/'
      'LEFT JOIN `category` `c` ON `c`.`VALUE` * 10 = `nw`.`NORMA` * 10'
      
        #9#9#9'AND `c`.`DATE_BEG` <= CONVERT(CONCAT(`s`.`YEAR`, "-",`s`.`MON' +
        'AT`, "-01"), DATE)'
      '/*'#1076#1083#1103' '#1079#1080#1084#1085#1077#1075#1086' '#1091#1076#1086#1088#1086#1078#1072#1085#1080#1103'*/'#9#9#9
      
        'left join `znormativs` `zn` on `zn`.`ZNORMATIVS_ID` = `cr`.`ZNOR' +
        'MATIVS_ID`'
      
        'left join `znormativs_value` `zn_v` on `zn_v`.`ZNORMATIVS_ID` = ' +
        '`zn`.`ZNORMATIVS_ID`'
      
        'left join `znormativs_ondate` `zn_d` on `zn_d`.`ID` = `zn_v`.`ZN' +
        'ORMATIVS_ONDATE_ID` '
      
        '                                    and `zn_d`.`onDate` <= CONVE' +
        'RT(CONCAT(`s`.`YEAR`, "-", `s`.`MONAT`, "-01"), DATE)'
      #9#9#9#9'    and `zn_d`.`DEL_FLAG` = 0'
      'WHERE `ssd`.`SM_ID` = :SM_ID'
      '  AND `ssd`.`SM_TYPE` = 2'
      'ORDER BY `OBJECT_NAME`, '
      '         `LOCAL_NAME`, '
      '         `PTM_NAME`, '
      '         `cr`.`RATE_CODE`')
    Left = 360
    Top = 112
    ParamData = <
      item
        Name = 'SM_ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = 344
      end>
  end
  object frxSMETA_OBJ_E: TfrxDBDataset
    UserName = 'frxSMETA_OBJ_E'
    CloseDataSource = True
    FieldAliases.Strings = (
      'NUM_ROW=NUM_ROW'
      'OBJECT_NAME=OBJECT_NAME'
      'LOCAL_NAME=LOCAL_NAME'
      'PTM_NAME=PTM_NAME'
      'RATE_CODE=RATE_CODE'
      'OHROPR=OHROPR'
      'PLAN_PRIB=PLAN_PRIB'
      'NORMA=NORMA'
      'COEF=COEF'
      'SUM_OHROPR=SUM_OHROPR'
      'SUM_PLAN_PRIB=SUM_PLAN_PRIB'
      'TARIF=TARIF'
      'RATE_CAPTION=RATE_CAPTION'
      'RATE_COUNT=RATE_COUNT'
      'RATE_UNIT=RATE_UNIT'
      'ZP_ED=ZP_ED'
      'ZP=ZP'
      'K_ZP=K_ZP'
      'TRUD_MASH_ED=TRUD_MASH_ED'
      'TRUD_MASH=TRUD_MASH'
      'K_TRUD_MASH=K_TRUD_MASH'
      'EMiM_ED=EMiM_ED'
      'EMiM=EMiM'
      'K_EMiM=K_EMiM'
      'ZP_MASH_ED=ZP_MASH_ED'
      'ZP_MASH=ZP_MASH'
      'K_ZP_MASH=K_ZP_MASH'
      'MR_ED=MR_ED'
      'MR=MR'
      'K_MR=K_MR'
      'TRANSP_ED=TRANSP_ED'
      'TRANSP=TRANSP'
      'K_TRANSP=K_TRANSP'
      'STOIM_ED=STOIM_ED'
      'STOIM=STOIM'
      'K_STOIM=K_STOIM'
      'FROM_GROUP=FROM_GROUP'
      'ZIM_COEF=ZIM_COEF'
      'ZIM_COEF_ZP=ZIM_COEF_ZP'
      'ZIM_UDOR=ZIM_UDOR'
      'ZP_ZIM_UDOR=ZP_ZIM_UDOR'
      'TRUD_ED=TRUD_ED'
      'TRUD=TRUD'
      'SM_ID=SM_ID'
      'SM_ID2=SM_ID2')
    DataSet = qrSMETA_OBJ_E
    BCDToCurrency = False
    Left = 360
    Top = 56
  end
  object qrSMETA_OBJ_MAT: TFDQuery
    AutoCalcFields = False
    Connection = DM.Connect
    Transaction = trReportRead
    UpdateTransaction = trReportWrite
    SQL.Strings = (
      '/*explain*/'
      'SELECT '#9
      #9'`sm`.`MAT_CODE`,'
      #9'`sm`.`MAT_NAME`,'
      #9'`sm`.`MAT_UNIT`,'
      #9'SUM(`sm`.`MAT_COUNT`) `MAT_COUNT`,'
      #9'`sm`.`COAST_NO_NDS`,'
      #9'SUM(`sm`.`PRICE_NO_NDS`) `PRICE_NO_NDS`,'
      #9'`sm`.`PROC_TRANSP`,'
      #9'SUM(`sm`.`TRANSP_NO_NDS`) `TRANSP_NO_NDS`,'
      #9'`sm`.`TYPE_MT`,'
      #9'`sm`.`TYPE_NAME`,'
      '        0 `FROM_GROUP`'
      'FROM ('
      
        '/* BEGIN ================================= '#1084#1072#1090#1077#1088#1080#1072#1083#1099' '#1074' '#1088#1072#1089#1094#1077#1085#1082#1072#1093 +
        ' =========================================== BEGIN*/'
      'SELECT '
      #9'`mat_in_rate`.`MAT_CODE`,'
      #9'`mat_in_rate`.`MAT_NAME`,'
      #9'`mat_in_rate`.`MAT_UNIT`,'
      #9'SUM(`mat_in_rate`.`MAT_COUNT`) `MAT_COUNT`,'
      #9'`mat_in_rate`.`COAST_NO_NDS`,'
      #9'SUM(`mat_in_rate`.`PRICE_NO_NDS`) `PRICE_NO_NDS`,'
      #9'`mat_in_rate`.`PROC_TRANSP`,'
      #9'SUM(`mat_in_rate`.`TRANSP_NO_NDS`) `TRANSP_NO_NDS`,'
      #9'`mat_in_rate`.`TYPE_MT`,'
      #9'`mat_in_rate`.`TYPE_NAME`        '
      '      '
      'FROM ('
      '/*'#1084#1072#1090#1077#1088#1080#1072#1083#1099' '#1074' '#1088#1072#1089#1094#1077#1085#1082#1072#1093'('#1087#1086#1076#1088#1103#1076#1095#1080#1082#1072')*/'
      'SELECT'
      #9'`mtc`.`MAT_CODE`,'
      #9'UCASE(`mtc`.`MAT_NAME`) `MAT_NAME`,'
      #9'`mtc`.`MAT_UNIT`,'
      #9'`mtc`.`MAT_COUNT`,'
      #9'`mtc`.`COAST_NO_NDS`,'
      
        #9'(`mtc`.`PRICE_NO_NDS` * (`mtc`.`MAT_PROC_PODR` / 100)) `PRICE_N' +
        'O_NDS`,'
      #9'`mtc`.`PROC_TRANSP`,'
      
        #9'(`mtc`.`TRANSP_NO_NDS` * (`mtc`.`TRANSP_PROC_PODR` / 100)) `TRA' +
        'NSP_NO_NDS`,'
      #9'0 `TYPE_MT`,'
      '        '#39#1052#1072#1090#1077#1088#1080#1072#1083#1099' '#1087#1086#1076#1088#1103#1076#1095#1080#1082#1072#39' `TYPE_NAME`'
      ''
      'FROM `smetasourcedata` `ssd`'
      
        'INNER JOIN `smetasourcedata` `ssd1` ON `ssd1`.`PARENT_ID` = `ssd' +
        '`.`SM_ID` '
      '                                   AND `ssd1`.`SM_TYPE` = 1'
      
        'INNER JOIN `smetasourcedata` `ssd2` ON `ssd2`.`PARENT_ID` = `ssd' +
        '1`.`SM_ID`'
      '                                   AND `ssd2`.`SM_TYPE` = 3 '
      
        'INNER JOIN `data_estimate` `de` ON `de`.`ID_ESTIMATE` = `ssd2`.`' +
        'SM_ID` '
      '                               AND `de`.`ID_TYPE_DATA` = 1'
      'INNER JOIN `card_rate` `cr` ON `cr`.`ID` = `de`.`ID_TABLES`'
      
        'INNER JOIN `materialcard` `mtc` ON `mtc`.`ID_CARD_RATE` = `cr`.`' +
        'ID`'
      ''
      'WHERE `ssd`.`SM_ID` = :SM_ID'
      '  AND `ssd`.`SM_TYPE` = 2'
      
        '  AND (`mtc`.`MAT_PROC_PODR` > 0 OR `mtc`.`TRANSP_PROC_PODR` > 0' +
        ')'
      ' '
      ' UNION ALL'
      '/*'#1084#1072#1090#1077#1088#1080#1072#1083#1099' '#1074' '#1088#1072#1089#1094#1077#1085#1082#1072#1093'('#1079#1072#1082#1072#1079#1095#1080#1082#1072')*/ '
      'SELECT'
      #9'`mtc`.`MAT_CODE`,'
      #9'UCASE(`mtc`.`MAT_NAME`) `MAT_NAME`,'
      #9'`mtc`.`MAT_UNIT`,'
      #9'`mtc`.`MAT_COUNT`,'
      #9'`mtc`.`COAST_NO_NDS`,'
      
        #9'(`mtc`.`PRICE_NO_NDS` * (`mtc`.`MAT_PROC_ZAC` / 100)) `PRICE_NO' +
        '_NDS`,'
      #9'`mtc`.`PROC_TRANSP`,'
      
        #9'(`mtc`.`TRANSP_NO_NDS` * (`mtc`.`TRANSP_PROC_ZAC` / 100)) `TRAN' +
        'SP_NO_NDS`,'
      #9'1 `TYPE_MT`,'
      '        '#39#1052#1072#1090#1077#1088#1080#1072#1083#1099' '#1079#1072#1082#1072#1079#1095#1080#1082#1072#39' `TYPE_NAME`'
      ''
      'FROM `smetasourcedata` `ssd`'
      
        'INNER JOIN `smetasourcedata` `ssd1` ON `ssd1`.`PARENT_ID` = `ssd' +
        '`.`SM_ID` '
      '                                   AND `ssd1`.`SM_TYPE` = 1'
      
        'INNER JOIN `smetasourcedata` `ssd2` ON `ssd2`.`PARENT_ID` = `ssd' +
        '1`.`SM_ID`'
      '                                   AND `ssd2`.`SM_TYPE` = 3 '
      
        'INNER JOIN `data_estimate` `de` ON `de`.`ID_ESTIMATE` = `ssd2`.`' +
        'SM_ID` '
      '                               AND `de`.`ID_TYPE_DATA` = 1'
      'INNER JOIN `card_rate` `cr` ON `cr`.`ID` = `de`.`ID_TABLES`'
      
        'INNER JOIN `materialcard` `mtc` ON `mtc`.`ID_CARD_RATE` = `cr`.`' +
        'ID`'
      ''
      'WHERE `ssd`.`SM_ID` = :SM_ID'
      '  AND `ssd`.`SM_TYPE` = 2'
      '  AND (`mtc`.`MAT_PROC_ZAC` > 0 OR `mtc`.`TRANSP_PROC_ZAC` > 0)'
      ') `mat_in_rate`'
      'GROUP BY '
      #9'`mat_in_rate`.`MAT_CODE`,'
      #9'`mat_in_rate`.`MAT_NAME`,'
      #9'`mat_in_rate`.`MAT_UNIT`,'
      #9'`mat_in_rate`.`COAST_NO_NDS`,'
      #9'`mat_in_rate`.`PROC_TRANSP`,'
      #9'`mat_in_rate`.`TYPE_MT`,'
      #9'`mat_in_rate`.`TYPE_NAME`'
      
        '/* END   ================================= '#1084#1072#1090#1077#1088#1080#1072#1083#1099' '#1074' '#1088#1072#1089#1094#1077#1085#1082#1072#1093 +
        ' ============================================ END*/'
      'UNION ALL'
      
        '/* BEGIN ================================= '#1084#1072#1090#1077#1088#1080#1072#1083#1099' '#1074#1085#1077' '#1088#1072#1089#1094#1077#1085#1086 +
        #1082' =========================================== BEGIN*/'
      'SELECT '
      #9'`mat_out_rate`.`MAT_CODE`,'
      #9'`mat_out_rate`.`MAT_NAME`,'
      #9'`mat_out_rate`.`MAT_UNIT`,'
      #9'SUM(`mat_out_rate`.`MAT_COUNT`) `MAT_COUNT`,'
      #9'`mat_out_rate`.`COAST_NO_NDS`,'
      #9'SUM(`mat_out_rate`.`PRICE_NO_NDS`) `PRICE_NO_NDS`,'
      #9'`mat_out_rate`.`PROC_TRANSP`,'
      #9'SUM(`mat_out_rate`.`TRANSP_NO_NDS`) `TRANSP_NO_NDS`,'
      #9'`mat_out_rate`.`TYPE_MT`,'
      #9'`mat_out_rate`.`TYPE_NAME`        '
      '      '
      'FROM ('
      '/*'#1084#1072#1090#1077#1088#1080#1072#1083#1099' '#1074#1085#1077' '#1088#1072#1089#1094#1077#1085#1086#1082'('#1087#1086#1076#1088#1103#1076#1095#1080#1082')*/ '
      'SELECT'
      #9'`mtc`.`MAT_CODE`,'
      #9'UCASE(`mtc`.`MAT_NAME`) `MAT_NAME`,'
      #9'`mtc`.`MAT_UNIT`,'
      #9'`mtc`.`MAT_COUNT`,'
      #9'`mtc`.`COAST_NO_NDS`,'
      
        #9'(`mtc`.`PRICE_NO_NDS` * (`mtc`.`MAT_PROC_PODR` / 100)) `PRICE_N' +
        'O_NDS`,'
      #9'`mtc`.`PROC_TRANSP`,'
      
        #9'(`mtc`.`TRANSP_NO_NDS` * (`mtc`.`TRANSP_PROC_PODR` / 100)) `TRA' +
        'NSP_NO_NDS`,'
      #9'0 `TYPE_MT`,'
      '        '#39#1052#1072#1090#1077#1088#1080#1072#1083#1099' '#1087#1086#1076#1088#1103#1076#1095#1080#1082#1072#39' `TYPE_NAME`'
      ''
      'FROM `smetasourcedata` `ssd`'
      
        'INNER JOIN `smetasourcedata` `ssd1` ON `ssd1`.`PARENT_ID` = `ssd' +
        '`.`SM_ID` '
      '                                   AND `ssd1`.`SM_TYPE` = 1'
      
        'INNER JOIN `smetasourcedata` `ssd2` ON `ssd2`.`PARENT_ID` = `ssd' +
        '1`.`SM_ID`'
      '                                   AND `ssd2`.`SM_TYPE` = 3 '
      
        'INNER JOIN `data_estimate` `de` ON `de`.`ID_ESTIMATE` = `ssd2`.`' +
        'SM_ID` '
      '                               AND `de`.`ID_TYPE_DATA` = 2'
      
        'INNER JOIN `materialcard` `mtc` ON `mtc`.`ID` = `de`.`ID_TABLES`' +
        ' '
      #9#9#9'       AND `mtc`.`ID_CARD_RATE` = 0'
      ''
      'WHERE `ssd`.`SM_ID` = :SM_ID'
      '  AND `ssd`.`SM_TYPE` = 2'
      
        '  AND (`mtc`.`MAT_PROC_PODR` > 0 OR `mtc`.`TRANSP_PROC_PODR` > 0' +
        ')  '
      ''
      'UNION ALL'
      '/*'#1084#1072#1090#1077#1088#1080#1072#1083#1099' '#1074#1085#1077' '#1088#1072#1089#1094#1077#1085#1086#1082'('#1079#1072#1082#1072#1079#1095#1080#1082')*/ '
      'SELECT'
      #9'`mtc`.`MAT_CODE`,'
      #9'UCASE(`mtc`.`MAT_NAME`) `MAT_NAME`,'
      #9'`mtc`.`MAT_UNIT`,'
      #9'`mtc`.`MAT_COUNT`,'
      #9'`mtc`.`COAST_NO_NDS`,'#9
      
        #9'(`mtc`.`PRICE_NO_NDS` * (`mtc`.`MAT_PROC_ZAC` / 100)) `PRICE_NO' +
        '_NDS`,'
      #9'`mtc`.`PROC_TRANSP`,'
      
        #9'(`mtc`.`TRANSP_NO_NDS` * (`mtc`.`TRANSP_PROC_ZAC` / 100)) `TRAN' +
        'SP_NO_NDS`,'
      #9'1 `TYPE_MT`,'
      '        '#39#1052#1072#1090#1077#1088#1080#1072#1083#1099' '#1079#1072#1082#1072#1079#1095#1080#1082#1072#39' `TYPE_NAME`'
      ''
      'FROM `smetasourcedata` `ssd`'
      
        'INNER JOIN `smetasourcedata` `ssd1` ON `ssd1`.`PARENT_ID` = `ssd' +
        '`.`SM_ID` '
      '                                   AND `ssd1`.`SM_TYPE` = 1'
      
        'INNER JOIN `smetasourcedata` `ssd2` ON `ssd2`.`PARENT_ID` = `ssd' +
        '1`.`SM_ID`'
      '                                   AND `ssd2`.`SM_TYPE` = 3 '
      
        'INNER JOIN `data_estimate` `de` ON `de`.`ID_ESTIMATE` = `ssd2`.`' +
        'SM_ID` '
      '                               AND `de`.`ID_TYPE_DATA` = 2'
      
        'INNER JOIN `materialcard` `mtc` ON `mtc`.`ID` = `de`.`ID_TABLES`' +
        ' '
      #9#9#9'       AND `mtc`.`ID_CARD_RATE` = 0'
      ''
      'WHERE `ssd`.`SM_ID` = :SM_ID'
      '  AND `ssd`.`SM_TYPE` = 2'
      '  AND (`mtc`.`MAT_PROC_ZAC` > 0 OR `mtc`.`TRANSP_PROC_ZAC` > 0)'
      ') `mat_out_rate`'
      'GROUP BY '
      #9'`mat_out_rate`.`MAT_CODE`,'
      #9'`mat_out_rate`.`MAT_NAME`,'
      #9'`mat_out_rate`.`MAT_UNIT`,'
      #9'`mat_out_rate`.`COAST_NO_NDS`,'
      #9'`mat_out_rate`.`PROC_TRANSP`,'
      #9'`mat_out_rate`.`TYPE_MT`,'
      #9'`mat_out_rate`.`TYPE_NAME`'
      
        '/* END   ================================= '#1084#1072#1090#1077#1088#1080#1072#1083#1099' '#1074#1085#1077' '#1088#1072#1089#1094#1077#1085#1086 +
        #1082' =========================================== END*/'
      'UNION ALL'
      
        '/* BEGIN ================================= '#1089#1074#1072#1083#1082#1072' ==============' +
        '=========================================== BEGIN*/'
      'SELECT'
      #9'`dc`.`DUMP_CODE_JUST` `MAT_CODE`,'
      #9'UCASE(`dc`.`DUMP_NAME`) `MAT_NAME`,'
      #9'`dc`.`DUMP_UNIT` `MAT_UNIT`,'
      #9'`dc`.`DUMP_COUNT` `MAT_COUNT`,'
      #9'`dc`.`COAST_NDS` `COAST_NO_NDS`,'
      #9'`dc`.`PRICE_NO_NDS` `PRICE_NO_NDS`,'
      #9'0 `PROC_TRANSP`,'
      #9'0 `TRANSP_NO_NDS`,'
      #9'999 `TYPE_MT`,'
      '        '#39#1057#1074#1072#1083#1082#1072#39' `TYPE_NAME`'
      'FROM `smetasourcedata` `ssd`'
      ''
      
        'INNER JOIN `smetasourcedata` `ssd1` ON `ssd1`.`PARENT_ID` = `ssd' +
        '`.`SM_ID` '
      '                                   AND `ssd1`.`SM_TYPE` = 1'
      
        'INNER JOIN `smetasourcedata` `ssd2` ON `ssd2`.`PARENT_ID` = `ssd' +
        '1`.`SM_ID`'
      '                                   AND `ssd2`.`SM_TYPE` = 3 '
      
        'INNER JOIN `data_estimate` `de` ON `de`.`ID_ESTIMATE` = `ssd2`.`' +
        'SM_ID` '
      '                               AND `de`.`ID_TYPE_DATA` = 5'
      
        'INNER JOIN `dumpcard` `dc` ON `dc`.`ID` = `de`.`ID_TABLES`      ' +
        '                        '
      ''
      'WHERE `ssd`.`SM_ID` = :SM_ID'
      '  AND `ssd`.`SM_TYPE` = 2  '
      
        '/* END ==================================== '#1089#1074#1072#1083#1082#1072' =============' +
        '============================================= END*/  '
      ') `sm`    '
      'GROUP BY `sm`.`MAT_CODE`,'
      #9' `sm`.`MAT_NAME`,'
      #9' `sm`.`MAT_UNIT`,'
      #9' `sm`.`COAST_NO_NDS`,'
      #9' `sm`.`PROC_TRANSP`,'
      #9' `sm`.`TYPE_MT`,'
      '         `sm`.`TYPE_NAME`'
      ''
      'ORDER BY `sm`.`TYPE_MT`, '
      '         `sm`.`MAT_CODE`')
    Left = 440
    Top = 96
    ParamData = <
      item
        Name = 'SM_ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = 344
      end>
  end
  object frxSMETA_OBJ_MAT: TfrxDBDataset
    UserName = 'frxSMETA_OBJ_MAT'
    CloseDataSource = True
    FieldAliases.Strings = (
      'MAT_CODE=MAT_CODE'
      'MAT_NAME=MAT_NAME'
      'MAT_UNIT=MAT_UNIT'
      'MAT_COUNT=MAT_COUNT'
      'COAST_NO_NDS=COAST_NO_NDS'
      'PRICE_NO_NDS=PRICE_NO_NDS'
      'PROC_TRANSP=PROC_TRANSP'
      'TRANSP_NO_NDS=TRANSP_NO_NDS'
      'TYPE_MT=TYPE_MT'
      'FROM_GROUP=FROM_GROUP'
      'TYPE_NAME=TYPE_NAME')
    DataSet = qrSMETA_OBJ_MAT
    BCDToCurrency = False
    Left = 440
    Top = 40
  end
  object qrSMETA_OBJ_MEH: TFDQuery
    AutoCalcFields = False
    Connection = DM.Connect
    Transaction = trReportRead
    UpdateTransaction = trReportWrite
    SQL.Strings = (
      '/*explain*/'
      'SELECT'
      #9'`sm`.`MECH_CODE`,'
      #9'`sm`.`MECH_NAME`,'
      #9'`sm`.`MECH_UNIT`,'
      #9'SUM(`sm`.`MECH_COUNT`) `MECH_COUNT`,'
      #9'`sm`.`COAST_NO_NDS`,'
      #9'SUM(`sm`.`PRICE_NO_NDS`) `PRICE_NO_NDS`,'
      #9'`sm`.`ZP_MACH_NO_NDS`,'
      #9'SUM(`sm`.`ZPPRICE_NO_NDS`) `ZPPRICE_NO_NDS`,'
      '        0 `FROM_GROUP`,'
      '        `sm`.`MT_TYPE`,'
      '        `sm`.`TYPE_NAME` '
      'FROM ('
      '/*'#1084#1077#1093#1072#1085#1080#1079#1084#1099' '#1074' '#1088#1072#1089#1094#1077#1085#1082#1072#1093'*/ '
      'SELECT '
      #9'`meh_in_rate`.`MECH_CODE`,'
      #9'`meh_in_rate`.`MECH_NAME`,'
      #9'`meh_in_rate`.`MECH_UNIT`,'
      #9'SUM(`meh_in_rate`.`MECH_COUNT`) `MECH_COUNT`,'
      #9'`meh_in_rate`.`COAST_NO_NDS`,'
      #9'SUM(`meh_in_rate`.`PRICE_NO_NDS`) `PRICE_NO_NDS`,'
      #9'`meh_in_rate`.`ZP_MACH_NO_NDS`,'
      #9'SUM(`meh_in_rate`.`ZPPRICE_NO_NDS`) `ZPPRICE_NO_NDS`,'
      '        `meh_in_rate`.`MT_TYPE`,'
      '        `meh_in_rate`.`TYPE_NAME` '#9
      'FROM ('
      '/*'#1087#1086#1076#1088#1103#1076#1095#1080#1082'*/'#9
      'SELECT  '
      #9'`mc`.`MECH_CODE`,'
      #9'UCASE(`mc`.`MECH_NAME`) `MECH_NAME`,'
      #9'`mc`.`MECH_UNIT`,'
      #9'`mc`.`MECH_COUNT`,'
      #9'`mc`.`COAST_NO_NDS`,'
      
        #9'(`mc`.`PRICE_NO_NDS` * (`mc`.`PROC_PODR` / 100)) `PRICE_NO_NDS`' +
        ','
      #9'`mc`.`ZP_MACH_NO_NDS`,'
      #9'`mc`.`ZPPRICE_NO_NDS`,'
      '        0 `MT_TYPE`,'
      '        '#39#1052#1077#1093#1072#1085#1080#1079#1084#1099' '#1087#1086#1076#1088#1103#1076#1095#1080#1082#1072#39' `TYPE_NAME` '
      ''
      'FROM `smetasourcedata` `ssd`'
      
        'INNER JOIN `smetasourcedata` `ssd1` ON `ssd1`.`PARENT_ID` = `ssd' +
        '`.`SM_ID` '
      '                                   AND `ssd1`.`SM_TYPE` = 1'
      
        'INNER JOIN `smetasourcedata` `ssd2` ON `ssd2`.`PARENT_ID` = `ssd' +
        '1`.`SM_ID`'
      '                                   AND `ssd2`.`SM_TYPE` = 3 '
      
        'INNER JOIN `data_estimate` `de` ON `de`.`ID_ESTIMATE` = `ssd2`.`' +
        'SM_ID` '
      '                               AND `de`.`ID_TYPE_DATA` = 1 '
      'INNER JOIN `card_rate` `cr` ON `cr`.`ID` = `de`.`ID_TABLES`'
      
        'INNER JOIN `mechanizmcard` `mc` ON `mc`.`ID_CARD_RATE` = `cr`.`I' +
        'D`'
      ''
      'WHERE `ssd`.`SM_ID` = :SM_ID'
      '  AND `ssd`.`SM_TYPE` = 2'
      '  AND `mc`.`PROC_PODR` > 0'
      ''
      'UNION ALL'
      ''
      '/*'#1079#1072#1082#1072#1079#1095#1080#1082'*/'#9
      'SELECT  '
      #9'`mc`.`MECH_CODE`,'
      #9'UCASE(`mc`.`MECH_NAME`) `MECH_NAME`,'
      #9'`mc`.`MECH_UNIT`,'
      #9'`mc`.`MECH_COUNT`,'
      #9'`mc`.`COAST_NO_NDS`,'
      #9'(`mc`.`PRICE_NO_NDS` * (`mc`.`PROC_ZAC` / 100)) `PRICE_NO_NDS`,'
      #9'`mc`.`ZP_MACH_NO_NDS`,'
      #9'`mc`.`ZPPRICE_NO_NDS`,'
      '        1 `MT_TYPE`,'
      '        '#39#1052#1077#1093#1072#1085#1080#1079#1084#1099' '#1079#1072#1082#1072#1079#1095#1080#1082#1072#39' `TYPE_NAME` '
      ''
      'FROM `smetasourcedata` `ssd`'
      
        'INNER JOIN `smetasourcedata` `ssd1` ON `ssd1`.`PARENT_ID` = `ssd' +
        '`.`SM_ID` '
      '                                   AND `ssd1`.`SM_TYPE` = 1'
      
        'INNER JOIN `smetasourcedata` `ssd2` ON `ssd2`.`PARENT_ID` = `ssd' +
        '1`.`SM_ID`'
      '                                   AND `ssd2`.`SM_TYPE` = 3 '
      
        'INNER JOIN `data_estimate` `de` ON `de`.`ID_ESTIMATE` = `ssd2`.`' +
        'SM_ID` '
      '                               AND `de`.`ID_TYPE_DATA` = 1 '
      'INNER JOIN `card_rate` `cr` ON `cr`.`ID` = `de`.`ID_TABLES`'
      
        'INNER JOIN `mechanizmcard` `mc` ON `mc`.`ID_CARD_RATE` = `cr`.`I' +
        'D`'
      ''
      'WHERE `ssd`.`SM_ID` = :SM_ID'
      '  AND `ssd`.`SM_TYPE` = 2'
      '  AND `mc`.`PROC_ZAC` > 0'
      '  '
      ') `meh_in_rate`'
      ''
      'GROUP BY `meh_in_rate`.`MECH_CODE`,'
      #9' `meh_in_rate`.`MECH_NAME`,'
      #9' `meh_in_rate`.`MECH_UNIT`,      '
      #9' `meh_in_rate`.`COAST_NO_NDS`,'#9' '
      #9' `meh_in_rate`.`ZP_MACH_NO_NDS`,'
      '         `meh_in_rate`.`MT_TYPE`,'
      '         `meh_in_rate`.`TYPE_NAME`  '
      ' '
      
        '/* END   ================================= '#1084#1077#1093#1072#1085#1080#1079#1084#1099' '#1074' '#1088#1072#1089#1094#1077#1085#1082#1072#1093 +
        ' ============================================ END*/'
      'UNION ALL'
      
        '/* BEGIN ================================= '#1084#1084#1077#1093#1072#1085#1080#1079#1084#1099' '#1074#1085#1077' '#1088#1072#1089#1094#1077#1085 +
        #1086#1082' =========================================== BEGIN*/'
      ''
      '/*'#1084#1077#1093#1072#1085#1080#1079#1084#1099' '#1074#1085#1077' '#1088#1072#1089#1094#1077#1085#1086#1082'*/ '
      'SELECT '
      #9'`meh_out_rate`.`MECH_CODE`,'
      #9'`meh_out_rate`.`MECH_NAME`,'
      #9'`meh_out_rate`.`MECH_UNIT`,'
      #9'SUM(`meh_out_rate`.`MECH_COUNT`) `MECH_COUNT`,'
      #9'`meh_out_rate`.`COAST_NO_NDS`,'
      #9'SUM(`meh_out_rate`.`PRICE_NO_NDS`) `PRICE_NO_NDS`,'
      #9'`meh_out_rate`.`ZP_MACH_NO_NDS`,'
      #9'SUM(`meh_out_rate`.`ZPPRICE_NO_NDS`) `ZPPRICE_NO_NDS`,'
      '        `meh_out_rate`.`MT_TYPE`,'
      '        `meh_out_rate`.`TYPE_NAME` '#9
      'FROM ('
      '/*'#1087#1086#1076#1088#1103#1076#1095#1080#1082'*/'
      'SELECT '
      ' '#9'`mc`.`MECH_CODE`,'
      #9'UCASE(`mc`.`MECH_NAME`) `MECH_NAME`,'
      #9'`mc`.`MECH_UNIT`,'
      #9'`mc`.`MECH_COUNT`,'
      #9'`mc`.`COAST_NO_NDS`,'
      
        #9'(`mc`.`PRICE_NO_NDS` * (`mc`.`PROC_PODR` / 100)) `PRICE_NO_NDS`' +
        ','
      #9'`mc`.`ZP_MACH_NO_NDS`,'
      #9'`mc`.`ZPPRICE_NO_NDS`,'
      '        0 `MT_TYPE`,'
      '        '#39#1052#1077#1093#1072#1085#1080#1079#1084#1099' '#1087#1086#1076#1088#1103#1076#1095#1080#1082#1072#39' `TYPE_NAME`'
      ''
      'FROM `smetasourcedata` `ssd`'
      
        'INNER JOIN `smetasourcedata` `ssd1` ON `ssd1`.`PARENT_ID` = `ssd' +
        '`.`SM_ID` '
      '                                   AND `ssd1`.`SM_TYPE` = 1'
      
        'INNER JOIN `smetasourcedata` `ssd2` ON `ssd2`.`PARENT_ID` = `ssd' +
        '1`.`SM_ID`'
      '                                   AND `ssd2`.`SM_TYPE` = 3 '
      
        'INNER JOIN `data_estimate` `de` ON `de`.`ID_ESTIMATE` = `ssd2`.`' +
        'SM_ID` '
      '                               AND `de`.`ID_TYPE_DATA` = 3 '
      'INNER JOIN `mechanizmcard` `mc` ON `mc`.`ID` = `de`.`ID_TABLES`'
      '                               AND `mc`.`ID_CARD_RATE` = 0'
      ''
      'WHERE `ssd`.`SM_ID` = :SM_ID'
      '  AND `ssd`.`SM_TYPE` = 2'
      '  AND `mc`.`PROC_PODR` > 0'
      '  '
      'UNION ALL'
      ''
      '/*'#1079#1072#1082#1072#1079#1095#1080#1082'*/'
      'SELECT '
      ' '#9'`mc`.`MECH_CODE`,'
      #9'UCASE(`mc`.`MECH_NAME`) `MECH_NAME`,'
      #9'`mc`.`MECH_UNIT`,'
      #9'`mc`.`MECH_COUNT`,'
      #9'`mc`.`COAST_NO_NDS`,'
      #9'(`mc`.`PRICE_NO_NDS` * (`mc`.`PROC_ZAC` / 100)) `PRICE_NO_NDS`,'
      #9'`mc`.`ZP_MACH_NO_NDS`,'
      #9'`mc`.`ZPPRICE_NO_NDS`,'
      '        1 `MT_TYPE`,'
      '        '#39#1052#1077#1093#1072#1085#1080#1079#1084#1099' '#1079#1072#1082#1072#1079#1095#1080#1082#1072#39' `TYPE_NAME`'
      ''
      'FROM `smetasourcedata` `ssd`'
      
        'INNER JOIN `smetasourcedata` `ssd1` ON `ssd1`.`PARENT_ID` = `ssd' +
        '`.`SM_ID` '
      '                                   AND `ssd1`.`SM_TYPE` = 1'
      
        'INNER JOIN `smetasourcedata` `ssd2` ON `ssd2`.`PARENT_ID` = `ssd' +
        '1`.`SM_ID`'
      '                                   AND `ssd2`.`SM_TYPE` = 3 '
      
        'INNER JOIN `data_estimate` `de` ON `de`.`ID_ESTIMATE` = `ssd2`.`' +
        'SM_ID` '
      '                               AND `de`.`ID_TYPE_DATA` = 3 '
      'INNER JOIN `mechanizmcard` `mc` ON `mc`.`ID` = `de`.`ID_TABLES`'
      '                               AND `mc`.`ID_CARD_RATE` = 0'
      ''
      'WHERE `ssd`.`SM_ID` = :SM_ID'
      '  AND `ssd`.`SM_TYPE` = 2'
      '  AND `mc`.`PROC_ZAC` > 0'
      ') `meh_out_rate`'
      ''
      'GROUP BY `meh_out_rate`.`MECH_CODE`,'
      #9' `meh_out_rate`.`MECH_NAME`,'
      #9' `meh_out_rate`.`MECH_UNIT`,      '
      #9' `meh_out_rate`.`COAST_NO_NDS`,'#9' '
      #9' `meh_out_rate`.`ZP_MACH_NO_NDS`,'
      '         `meh_out_rate`.`MT_TYPE`,'
      '         `meh_out_rate`.`TYPE_NAME`   '
      '  '
      ') `sm`  '
      ''
      'GROUP BY `sm`.`MECH_CODE`,'
      #9' `sm`.`MECH_NAME`,'
      #9' `sm`.`MECH_UNIT`,      '
      #9' `sm`.`COAST_NO_NDS`,'#9' '
      #9' `sm`.`ZP_MACH_NO_NDS`,'
      '         `sm`.`MT_TYPE`,'
      '         `sm`.`TYPE_NAME` '
      #9' '
      'ORDER BY `sm`.`MT_TYPE`,'
      '         `sm`.`MECH_CODE`')
    Left = 520
    Top = 112
    ParamData = <
      item
        Name = 'SM_ID'
        DataType = ftString
        ParamType = ptInput
        Value = '344'
      end>
  end
  object frxSMETA_OBJ_MEH: TfrxDBDataset
    UserName = 'frxSMETA_OBJ_MEH'
    CloseDataSource = True
    FieldAliases.Strings = (
      'MECH_CODE=MECH_CODE'
      'MECH_NAME=MECH_NAME'
      'MECH_UNIT=MECH_UNIT'
      'MECH_COUNT=MECH_COUNT'
      'COAST_NO_NDS=COAST_NO_NDS'
      'PRICE_NO_NDS=PRICE_NO_NDS'
      'ZP_MACH_NO_NDS=ZP_MACH_NO_NDS'
      'ZPPRICE_NO_NDS=ZPPRICE_NO_NDS'
      'FROM_GROUP=FROM_GROUP'
      'MT_TYPE=MT_TYPE'
      'TYPE_NAME=TYPE_NAME')
    DataSet = qrSMETA_OBJ_MEH
    BCDToCurrency = False
    Left = 520
    Top = 56
  end
  object qrSMETA_OBJ_DEV: TFDQuery
    AutoCalcFields = False
    Connection = DM.Connect
    Transaction = trReportRead
    UpdateTransaction = trReportWrite
    SQL.Strings = (
      '/*explain*/'
      'SELECT'
      #9'`sm`.`DEVICE_CODE`,'
      #9'`sm`.`DEVICE_NAME`,'
      #9'`sm`.`DEVICE_UNIT`,'
      #9'SUM(`sm`.`DEVICE_COUNT`) `DEVICE_COUNT`,'
      #9'`sm`.`FCOAST_NO_NDS`,'
      #9'SUM(`sm`.`FPRICE_NO_NDS`) `FPRICE_NO_NDS`,'
      #9'`sm`.`DEVICE_PROC_TRANSP`,'
      #9'SUM(`sm`.`DEVICE_TRANSP_NO_NDS`) `DEVICE_TRANSP_NO_NDS`,'
      '        0 `FROM_GROUP`,'
      '        `sm`.`MT_TYPE`,'
      '        `sm`.`TYPE_NAME`'
      'FROM ('
      '/*'#1086#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1077' '#1074#1085#1077' '#1088#1072#1089#1094#1077#1085#1086#1082'*/ '
      '/* '#1087#1086#1076#1088#1103#1076#1095#1080#1082' */'
      'SELECT  '
      #9'`dc`.`DEVICE_CODE`,'
      #9'UCASE(`dc`.`DEVICE_NAME`) `DEVICE_NAME`,'
      #9'`dc`.`DEVICE_UNIT`,'
      #9'`dc`.`DEVICE_COUNT`,'
      #9'`dc`.`FCOAST_NO_NDS`,'
      
        #9'(`dc`.`FPRICE_NO_NDS` * (`dc`.`PROC_PODR` / 100)) `FPRICE_NO_ND' +
        'S`,'
      #9'0 `DEVICE_PROC_TRANSP`, '
      
        #9'(`dc`.`DEVICE_TRANSP_NO_NDS` * (`dc`.`TRANSP_PROC_PODR` / 100))' +
        ' `DEVICE_TRANSP_NO_NDS`,'
      '        0 `MT_TYPE`,'
      '        '#39#1054#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1077' '#1087#1086#1076#1088#1103#1076#1095#1080#1082#1072#39' `TYPE_NAME`'
      ''
      'FROM `smetasourcedata` `ssd`'
      
        'INNER JOIN `smetasourcedata` `ssd1` ON `ssd1`.`PARENT_ID` = `ssd' +
        '`.`SM_ID` '
      '                                   AND `ssd1`.`SM_TYPE` = 1'
      
        'INNER JOIN `smetasourcedata` `ssd2` ON `ssd2`.`PARENT_ID` = `ssd' +
        '1`.`SM_ID`'
      '                                   AND `ssd2`.`SM_TYPE` = 3 '
      
        'INNER JOIN `data_estimate` `de` ON `de`.`ID_ESTIMATE` = `ssd2`.`' +
        'SM_ID` '
      '                               AND `de`.`ID_TYPE_DATA` = 4'
      'INNER JOIN `devicescard` `dc` ON `dc`.`ID` = `de`.`ID_TABLES`'
      ''
      'WHERE `ssd`.`SM_ID` = :SM_ID'
      '  AND `ssd`.`SM_TYPE` = 2'
      '  AND (`dc`.`PROC_PODR` > 0 OR `dc`.`TRANSP_PROC_PODR` > 0)'
      '  '
      'UNION ALL'
      ''
      '/* '#1079#1072#1082#1072#1079#1095#1080#1082' */'
      'SELECT  '
      #9'`dc`.`DEVICE_CODE`,'
      #9'UCASE(`dc`.`DEVICE_NAME`) `DEVICE_NAME`,'
      #9'`dc`.`DEVICE_UNIT`,'
      #9'`dc`.`DEVICE_COUNT`,'
      #9'`dc`.`FCOAST_NO_NDS`,'
      
        #9'(`dc`.`FPRICE_NO_NDS` * (`dc`.`PROC_ZAC` / 100)) `FPRICE_NO_NDS' +
        '`,'
      #9'0 `DEVICE_PROC_TRANSP`, '
      
        #9'(`dc`.`DEVICE_TRANSP_NO_NDS` * (`dc`.`TRANSP_PROC_ZAC` / 100)) ' +
        '`DEVICE_TRANSP_NO_NDS`,'
      '        1 `MT_TYPE`,'
      '        '#39#1054#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1077' '#1079#1072#1082#1072#1079#1095#1080#1082#1072#39' `TYPE_NAME`'
      ''
      'FROM `smetasourcedata` `ssd`'
      
        'INNER JOIN `smetasourcedata` `ssd1` ON `ssd1`.`PARENT_ID` = `ssd' +
        '`.`SM_ID` '
      '                                   AND `ssd1`.`SM_TYPE` = 1'
      
        'INNER JOIN `smetasourcedata` `ssd2` ON `ssd2`.`PARENT_ID` = `ssd' +
        '1`.`SM_ID`'
      '                                   AND `ssd2`.`SM_TYPE` = 3 '
      
        'INNER JOIN `data_estimate` `de` ON `de`.`ID_ESTIMATE` = `ssd2`.`' +
        'SM_ID` '
      '                               AND `de`.`ID_TYPE_DATA` = 4'
      'INNER JOIN `devicescard` `dc` ON `dc`.`ID` = `de`.`ID_TABLES`'
      ''
      'WHERE `ssd`.`SM_ID` = :SM_ID'
      '  AND `ssd`.`SM_TYPE` = 2'
      '  AND (`dc`.`PROC_ZAC` > 0 OR `dc`.`TRANSP_PROC_ZAC` > 0)'
      ''
      ') `sm`  '
      ''
      'GROUP BY `sm`.`DEVICE_CODE`,'
      #9' `sm`.`DEVICE_NAME`,'
      #9' `sm`.`DEVICE_UNIT`,'
      #9' `sm`.`FCOAST_NO_NDS`,'#9' '
      #9' `sm`.`DEVICE_PROC_TRANSP`,'
      '         `sm`.`MT_TYPE`,'
      #9' `sm`.`TYPE_NAME`'
      ''
      'ORDER BY `sm`.`MT_TYPE`,'
      '         `sm`.`DEVICE_CODE`')
    Left = 592
    Top = 96
    ParamData = <
      item
        Name = 'SM_ID'
        DataType = ftString
        ParamType = ptInput
        Value = '344'
      end>
  end
  object frxSMETA_OBJ_DEV: TfrxDBDataset
    UserName = 'frxSMETA_OBJ_DEV'
    CloseDataSource = True
    FieldAliases.Strings = (
      'DEVICE_CODE=DEVICE_CODE'
      'DEVICE_NAME=DEVICE_NAME'
      'DEVICE_UNIT=DEVICE_UNIT'
      'DEVICE_COUNT=DEVICE_COUNT'
      'FCOAST_NO_NDS=FCOAST_NO_NDS'
      'FPRICE_NO_NDS=FPRICE_NO_NDS'
      'DEVICE_PROC_TRANSP=DEVICE_PROC_TRANSP'
      'DEVICE_TRANSP_NO_NDS=DEVICE_TRANSP_NO_NDS'
      'FROM_GROUP=FROM_GROUP'
      'MT_TYPE=MT_TYPE'
      'TYPE_NAME=TYPE_NAME')
    DataSet = qrSMETA_OBJ_DEV
    BCDToCurrency = False
    Left = 592
    Top = 40
  end
  object FDGUIxWaitCursor: TFDGUIxWaitCursor
    Provider = 'Forms'
    ScreenCursor = gcrDefault
    Left = 992
    Top = 72
  end
  object frxSMETA_OBJ_GraphC: TfrxDBDataset
    UserName = 'frxSMETA_OBJ_GraphC'
    CloseDataSource = True
    FieldAliases.Strings = (
      'NPP=NPP'
      'NPP_DOC=NPP_DOC'
      'ID_PARENT=ID_PARENT'
      'ZATR_NAME=ZATR_NAME'
      'ZATR_DOP_NAME=ZATR_DOP_NAME'
      'ZATR_PERS=ZATR_PERS'
      'ZATR_COAST=ZATR_COAST'
      'GROUP_ID=GROUP_ID')
    DataSet = qrSMETA_OBJ_GraphC
    BCDToCurrency = False
    Left = 672
    Top = 56
  end
  object qrSMETA_OBJ_GraphC: TFDQuery
    AutoCalcFields = False
    Connection = DM.Connect
    Transaction = trReportRead
    UpdateTransaction = trReportWrite
    SQL.Strings = (
      
        'call Report_SMETA_OBJ_BUILD_GraphC(:SM_ID, :IN_MONTH, :IN_YEAR, ' +
        ':param4, :param5, :param6, :param7, :param8, :param9'
      
        '                                   , :param10, :param11, :param1' +
        '2, :param13, :param14, :param15, :param16, :param17, :param18'
      
        '                                   , :param19, :param20, :param2' +
        '1, :param22, :param23);')
    Left = 672
    Top = 112
    ParamData = <
      item
        Name = 'SM_ID'
        DataType = ftString
        ParamType = ptInput
        Value = '344'
      end
      item
        Name = 'IN_MONTH'
        DataType = ftString
        ParamType = ptInput
        Value = '4'
      end
      item
        Name = 'IN_YEAR'
        DataType = ftString
        ParamType = ptInput
        Value = '2014'
      end
      item
        Name = 'PARAM4'
        DataType = ftString
        ParamType = ptInput
        Value = '0'
      end
      item
        Name = 'PARAM5'
        DataType = ftString
        ParamType = ptInput
        Value = '0'
      end
      item
        Name = 'PARAM6'
        DataType = ftString
        ParamType = ptInput
        Value = '0'
      end
      item
        Name = 'PARAM7'
        DataType = ftString
        ParamType = ptInput
        Value = '0'
      end
      item
        Name = 'PARAM8'
        DataType = ftString
        ParamType = ptInput
        Value = '0'
      end
      item
        Name = 'PARAM9'
        DataType = ftString
        ParamType = ptInput
        Value = '0'
      end
      item
        Name = 'PARAM10'
        DataType = ftString
        ParamType = ptInput
        Value = '0'
      end
      item
        Name = 'PARAM11'
        DataType = ftString
        ParamType = ptInput
        Value = '0'
      end
      item
        Name = 'PARAM12'
        DataType = ftString
        ParamType = ptInput
        Value = '0'
      end
      item
        Name = 'PARAM13'
        DataType = ftString
        ParamType = ptInput
        Value = '0'
      end
      item
        Name = 'PARAM14'
        DataType = ftString
        ParamType = ptInput
        Value = '0'
      end
      item
        Name = 'PARAM15'
        DataType = ftString
        ParamType = ptInput
        Value = '0'
      end
      item
        Name = 'PARAM16'
        DataType = ftString
        ParamType = ptInput
        Value = '0'
      end
      item
        Name = 'PARAM17'
        DataType = ftString
        ParamType = ptInput
        Value = '0'
      end
      item
        Name = 'PARAM18'
        DataType = ftString
        ParamType = ptInput
        Value = '0'
      end
      item
        Name = 'PARAM19'
        DataType = ftString
        ParamType = ptInput
        Value = '0'
      end
      item
        Name = 'PARAM20'
        DataType = ftString
        ParamType = ptInput
        Value = '0'
      end
      item
        Name = 'PARAM21'
        DataType = ftString
        ParamType = ptInput
        Value = '0'
      end
      item
        Name = 'PARAM22'
        DataType = ftString
        ParamType = ptInput
        Value = '0'
      end
      item
        Name = 'PARAM23'
        DataType = ftString
        ParamType = ptInput
        Value = '0'
      end>
  end
  object frxRichObject: TfrxRichObject
    Left = 984
    Top = 440
  end
  object qrSMETA_RES_CHILD: TFDQuery
    AutoCalcFields = False
    MasterSource = dsSMETA_OBJ_E
    MasterFields = 'SM_ID;ID_TABLES'
    Connection = DM.Connect
    Transaction = trReportRead
    UpdateTransaction = trReportWrite
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    SQL.Strings = (
      'SELECT `zpr`.`ZPR_CODE`,'
      '   '#9'   UPPER(`zpr`.`ZPR_NAME`) `ZPR_NAME`, '
      #9'   `zpr`.`ZPR_UNIT`,'
      #9'   `zpr`.`ZPR_COUNT`,'
      #9'   `zpr`.`ZPR_MAT_COAST_NO_NDS`,'
      #9'   `zpr`.`ZPR_MAT_PRICE_NO_NDS`,'
      #9'   `zpr`.`ZPR_PROC_TRANSP`,'
      ' '#9'   `zpr`.`ZPR_TRANSP_NO_NDS`,'
      #9'   `zpr`.`ZPR_COAST_NO_NDS`,'
      #9'   `zpr`.`ZPR_PRICE_NO_NDS`,'#9'   '
      ' '#9'   `zpr`.`ZPR_ZP_MACH_NO_NDS`,'
      #9'   `zpr`.`ZPR_ZPPRICE_NO_NDS`,'
      ' '#9'   `zpr`.`TYPE_MT`,'
      '       0 `FROM_GROUP` '
      'FROM('
      ''
      '/*BEGIN '#1084#1072#1090#1077#1088#1080#1072#1083#1099'*/'
      'SELECT '#9
      #9'`mtc`.`MAT_CODE` `ZPR_CODE`,'
      #9'`mtc`.`MAT_NAME` `ZPR_NAME`,'
      #9'`mtc`.`MAT_UNIT` `ZPR_UNIT`,'
      #9'SUM(`mtc`.`MAT_COUNT`) `ZPR_COUNT`,'
      #9'`mtc`.`COAST_NO_NDS` `ZPR_MAT_COAST_NO_NDS`,'
      #9'SUM(`mtc`.`PRICE_NO_NDS`) `ZPR_MAT_PRICE_NO_NDS`,'
      #9'`mtc`.`PROC_TRANSP` `ZPR_PROC_TRANSP`,'
      #9'SUM(`mtc`.`TRANSP_NO_NDS`) `ZPR_TRANSP_NO_NDS`,'
      #9'Null `ZPR_COAST_NO_NDS`,'
      #9'Null `ZPR_PRICE_NO_NDS`,'#9
      #9'Null `ZPR_ZP_MACH_NO_NDS`,'
      #9'Null `ZPR_ZPPRICE_NO_NDS`,'#9
      #9'2 `TYPE_MT`'
      ''
      'FROM `smetasourcedata` `ssd`'
      
        'INNER JOIN `smetasourcedata` `ssd1` ON `ssd1`.`PARENT_ID` = `ssd' +
        '`.`SM_ID` '
      '                                   AND `ssd1`.`SM_TYPE` = 1'
      
        'INNER JOIN `smetasourcedata` `ssd2` ON `ssd2`.`PARENT_ID` = `ssd' +
        '1`.`SM_ID`'
      '                                   AND `ssd2`.`SM_TYPE` = 3 '
      
        'INNER JOIN `data_estimate` `de` ON `de`.`ID_ESTIMATE` = `ssd2`.`' +
        'SM_ID` '
      '                               AND `de`.`ID_TYPE_DATA` = 1'
      'INNER JOIN `card_rate` `cr` ON `cr`.`ID` = `de`.`ID_TABLES`'
      
        'INNER JOIN `materialcard` `mtc` ON `mtc`.`ID_CARD_RATE` = `cr`.`' +
        'ID`'
      ''
      'WHERE `ssd`.`SM_ID` = :SM_ID'
      '  AND `ssd`.`SM_TYPE` = 2'
      '  AND `de`.`ID_TABLES` = :ID_TABLES'
      ''
      'GROUP BY `mtc`.`MAT_CODE`,'
      #9' `mtc`.`MAT_NAME`,'
      #9' `mtc`.`MAT_UNIT`,'
      #9' `mtc`.`COAST_NO_NDS`,'
      #9' `mtc`.`PROC_TRANSP`'
      '/*END '#1084#1072#1090#1077#1088#1080#1072#1083#1099'*/'#9
      ''
      'UNION ALL'
      ''
      '/*BEGIN '#1084#1077#1093#1072#1085#1080#1079#1084#1099'*/'
      'SELECT'
      #9'`mc`.`MECH_CODE` `ZPR_CODE`,'
      #9'`mc`.`MECH_NAME` `ZPR_NAME`,'
      #9'`mc`.`MECH_UNIT` `ZPR_UNIT`,'
      #9'SUM(`mc`.`MECH_COUNT`) `ZPR_COUNT`,'
      '        Null `ZPR_MAT_COAST_NO_NDS`,'
      #9'Null `ZPR_MAT_PRICE_NO_NDS`,'
      '        Null `ZPR_PROC_TRANSP`,'
      #9'Null `ZPR_TRANSP_NO_NDS`,'
      #9'`mc`.`COAST_NO_NDS` `ZPR_COAST_NO_NDS`,'
      #9'SUM(`mc`.`PRICE_NO_NDS`) `ZPR_PRICE_NO_NDS`,'#9
      #9'`mc`.`ZP_MACH_NO_NDS` `ZPR_ZP_MACH_NO_NDS`,'
      #9'SUM(`mc`.`ZPPRICE_NO_NDS`) `ZPR_ZPPRICE_NO_NDS`,'
      '        1 `MT_TYPE`'
      ''
      'FROM `smetasourcedata` `ssd`'
      
        'INNER JOIN `smetasourcedata` `ssd1` ON `ssd1`.`PARENT_ID` = `ssd' +
        '`.`SM_ID` '
      '                                   AND `ssd1`.`SM_TYPE` = 1'
      
        'INNER JOIN `smetasourcedata` `ssd2` ON `ssd2`.`PARENT_ID` = `ssd' +
        '1`.`SM_ID`'
      '                                   AND `ssd2`.`SM_TYPE` = 3 '
      
        'INNER JOIN `data_estimate` `de` ON `de`.`ID_ESTIMATE` = `ssd2`.`' +
        'SM_ID` '
      '                               AND `de`.`ID_TYPE_DATA` = 1 '
      'INNER JOIN `card_rate` `cr` ON `cr`.`ID` = `de`.`ID_TABLES`'
      
        'INNER JOIN `mechanizmcard` `mc` ON `mc`.`ID_CARD_RATE` = `cr`.`I' +
        'D`'
      ''
      'WHERE `ssd`.`SM_ID` = :SM_ID'
      '  AND `ssd`.`SM_TYPE` = 2 '
      '  AND `de`.`ID_TABLES` = :ID_TABLES'
      ''
      'GROUP BY `mc`.`MECH_CODE`,'
      #9' `mc`.`MECH_NAME`,'
      #9' `mc`.`MECH_UNIT`,      '
      #9' `mc`.`COAST_NO_NDS`,'#9' '
      #9' `mc`.`ZP_MACH_NO_NDS`'
      ''
      '/*END '#1084#1077#1093#1072#1085#1080#1079#1084#1099'*/ '
      ') `zpr`'#9#9' '
      ''
      'ORDER BY `zpr`.`TYPE_MT`, '
      '         `zpr`.`ZPR_CODE`')
    Left = 792
    Top = 112
    ParamData = <
      item
        Name = 'SM_ID'
        DataType = ftAutoInc
        ParamType = ptInput
        Size = 4
        Value = 344
      end
      item
        Name = 'ID_TABLES'
        DataType = ftLongWord
        ParamType = ptInput
        Size = 4
        Value = 34
      end>
  end
  object frxSMETA_RES_CHILD: TfrxDBDataset
    UserName = 'frxSMETA_RES_CHILD'
    CloseDataSource = True
    FieldAliases.Strings = (
      'ZPR_CODE=ZPR_CODE'
      'ZPR_NAME=ZPR_NAME'
      'ZPR_UNIT=ZPR_UNIT'
      'ZPR_COUNT=ZPR_COUNT'
      'ZPR_MAT_COAST_NO_NDS=ZPR_MAT_COAST_NO_NDS'
      'ZPR_MAT_PRICE_NO_NDS=ZPR_MAT_PRICE_NO_NDS'
      'ZPR_PROC_TRANSP=ZPR_PROC_TRANSP'
      'ZPR_TRANSP_NO_NDS=ZPR_TRANSP_NO_NDS'
      'ZPR_COAST_NO_NDS=ZPR_COAST_NO_NDS'
      'ZPR_PRICE_NO_NDS=ZPR_PRICE_NO_NDS'
      'ZPR_ZP_MACH_NO_NDS=ZPR_ZP_MACH_NO_NDS'
      'ZPR_ZPPRICE_NO_NDS=ZPR_ZPPRICE_NO_NDS'
      'TYPE_MT=TYPE_MT'
      'FROM_GROUP=FROM_GROUP')
    DataSet = qrSMETA_RES_CHILD
    BCDToCurrency = False
    Left = 792
    Top = 56
  end
  object dsSMETA_OBJ_E: TDataSource
    DataSet = qrSMETA_OBJ_E
    Left = 360
    Top = 160
  end
  object vkExcel: TFDQuery
    AutoCalcFields = False
    Connection = DM.Connect
    Transaction = trReportRead
    UpdateTransaction = trReportWrite
    SQL.Strings = (
      '')
    Left = 56
    Top = 448
  end
  object spr_range: TFDQuery
    AutoCalcFields = False
    Connection = DM.Connect
    Transaction = trReportRead
    UpdateTransaction = trReportWrite
    SQL.Strings = (
      'select * from spr_range where x_range<>'#39#39)
    Left = 56
    Top = 504
  end
  object frxUniReport: TfrxDBDataset
    UserName = 'frxUniReport'
    CloseDataSource = True
    FieldAliases.Strings = (
      'C1=C1'
      'C2=C2'
      'C3=C3'
      'C4=C4'
      'C5=C5'
      'C6=C6'
      'C7=C7'
      'C8=C8'
      'C9=C9'
      'C10=C10'
      'C11=C11'
      'C12=C12'
      'C13=C13'
      'C14=C14'
      'C15=C15'
      'C16=C16'
      'C17=C17'
      'C18=C18'
      'C19=C19'
      'C20=C20'
      'C21=C21')
    DataSet = vkSQL
    BCDToCurrency = False
    Left = 144
    Top = 504
  end
  object vkSQL: TFDQuery
    AutoCalcFields = False
    Connection = DM.Connect
    Transaction = trReportRead
    UpdateTransaction = trReportWrite
    Left = 144
    Top = 448
  end
  object vkSQLtotal: TFDQuery
    AutoCalcFields = False
    Connection = DM.Connect
    Transaction = trReportRead
    UpdateTransaction = trReportWrite
    Left = 192
    Top = 448
  end
  object OpenDialog1: TOpenDialog
    Left = 776
    Top = 576
  end
  object vkRaschet: TFDQuery
    AutoCalcFields = False
    Connection = DM.Connect
    Transaction = trReportRead
    UpdateTransaction = trReportWrite
    SQL.Strings = (
      '')
    Left = 56
    Top = 568
  end
end
