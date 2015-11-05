// модуль создания отчетов (Вадим)
unit dmReportU;

interface

uses
  Forms ,System.Variants,System.SysUtils, System.Classes, frxClass, frxDBSet, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Dialogs, Tools, DateUtils,
  frxExportRTF, frxExportHTML, frxExportPDF, frxExportText, FireDAC.UI.Intf,
  FireDAC.VCLUI.Wait, FireDAC.Comp.UI, frxRich ,ComObj, ActiveX,StrUtils,Windows;

type
  TdmReportF = class(TDataModule)
    frxZP_OBJ: TfrxDBDataset;
    frxReport: TfrxReport;
    qrZP_OBJ: TFDQuery;
    trReportRead: TFDTransaction;
    trReportWrite: TFDTransaction;
    qrTMP: TFDQuery;
    frxZP_OBJ_ACT: TfrxDBDataset;
    qrZP_OBJ_ACT: TFDQuery;
    qrRASX_MAT: TFDQuery;
    frxRASX_MAT: TfrxDBDataset;
    qrRASX_MAT2: TFDQuery;
    frxRASX_MAT2: TfrxDBDataset;
    frxHTMLExport: TfrxHTMLExport;
    frxRTFExport: TfrxRTFExport;
    frxSimpleTextExport: TfrxSimpleTextExport;
    frxWRS_OBJ: TfrxDBDataset;
    qWRS_OBJ: TFDQuery;
    frxRSMO_OBJ: TfrxDBDataset;
    qRSMO_OBJ: TFDQuery;
    qRSMEH_OBJ: TFDQuery;
    frxRSMEH_OBJ: TfrxDBDataset;
    qVED_OANDPWV1: TFDQuery;
    frxqVED_OANDPWV1: TfrxDBDataset;

    qVED_OBRAB_RASHRES_SMET: TFDQuery;
    frxVED_OBRAB_RASHRES_SMET: TfrxDBDataset;    
    qrSMETA_OBJ_E: TFDQuery;
    frxSMETA_OBJ_E: TfrxDBDataset;
    qrSMETA_OBJ_MAT: TFDQuery;
    frxSMETA_OBJ_MAT: TfrxDBDataset;
    qrSMETA_OBJ_MEH: TFDQuery;
    frxSMETA_OBJ_MEH: TfrxDBDataset;
    qrSMETA_OBJ_DEV: TFDQuery;
    frxSMETA_OBJ_DEV: TfrxDBDataset;
    FDGUIxWaitCursor: TFDGUIxWaitCursor;
    frxSMETA_OBJ_GraphC: TfrxDBDataset;
    qrSMETA_OBJ_GraphC: TFDQuery;
    frxRichObject: TfrxRichObject;
    qrSMETA_RES_CHILD: TFDQuery;
    frxSMETA_RES_CHILD: TfrxDBDataset;
    dsSMETA_OBJ_E: TDataSource;
    vkExcel: TFDQuery;
    spr_range: TFDQuery;
    frxUniReport: TfrxDBDataset;
    vkSQL: TFDQuery;
    vkSQLtotal: TFDQuery;
    OpenDialog1: TOpenDialog;
    vkRaschet: TFDQuery;
   { Private decla
    FDQuery1: TFDQuery;rations }
  public
    { Public declarations }
    procedure Report_ZP_OBJ(SM_ID: integer; FileReportPath: string);
    procedure Report_ZP_OBJ_ACT(ID_ACT: integer; FileReportPath: string);
    procedure Report_RASX_MAT(ID_ACT: integer; FileReportPath: string);
    procedure Report_WINTER_RS_OBJ(SM_ID: integer; FileReportPath: string);
    procedure Report_RSMO_OBJ(  with_nds,SM_ID: integer;OBJ_ID: integer; FileReportPath: string);
    procedure Report_RSMEH_OBJ( with_nds,SM_ID: integer;OBJ_ID: integer; FileReportPath: string);
    procedure Report_RSDEV_OBJ( with_nds,SM_ID: integer;OBJ_ID: integer; FileReportPath: string);
    procedure Report_EXCEL(SM_ID,XLS: integer);
    procedure JSReport (xReport,SM_ID: integer;FileReportPath: string);
    procedure VK2N13(OBJ_ID: integer;FileReportPath: string); // Объектная смета (Объектный сметный расчет) № 1

    //ВЕДОМОСТЬ ОБЪЁМОВ И СТОИМОСТИ РАБОТ
    procedure Report_VED_OANDPWV1_OBJ(xvar,with_nds,OBJ_ID: integer; FileReportPath: string);
    //Ведомость объемов работ и расхода ресурсов по смете v1.02
    procedure Report_VED_OBRAB_RASHRES_SMET_OBJ( SM_ID: integer;FileReportPath: string);
    // "СМЕТА по объекту строительства" v1.03
    procedure Report_SMETA_OBJ_BUILD(SM_ID: integer; FileReportPath: string;
                                     param4: Double;
                                     param5: Double;
                                     param6: Double;
                                     param7: Double;
                                     param8: Double;
                                     param9: Double;
                                     param10: Double;
                                     param11: Double;
                                     param12: Double;
                                     param13: Double;
                                     param14: Double;
                                     param15: Double;
                                     param16: Double;
                                     param17: Double;
                                     param18: Double;
                                     param19: Double;
                                     param20: Double;
                                     param21: Double;
                                     param22: Double;
                                     param23: Double
                                     );
    // Смета (Локальный сметный расчет) по объекту v1.00 (Вадим)
    procedure Report_SMETA_LSR_FROM_OBJ(SM_ID: integer;FileReportPath: string);
    // Смета (Локальный сметный расчет) с зимними v1.00 (Вадим)
    procedure Report_SMETA_LSR_ZIM(SM_ID: integer;FileReportPath: string);
    // Смета (Локальный сметный расчет) с трудозатратами по объекту v1.00 (Вадим)
    procedure Report_SMETA_LSR_TRUD(SM_ID: integer;FileReportPath: string);
    // Расчет стоимости работ по объекту (графа С) v1.00 (Вадим)
    procedure Report_CALC_SMETA_OBJ_GRAPH_C(SM_ID: integer;FileReportPath: string);
    // Смета (Ресурсно-сметный расчет) по объекту v1.00 (Вадим)
    procedure Report_SMETA_RES_FROM_OBJ(SM_ID: integer;FileReportPath: string);
  end;

var
  dmReportF: TdmReportF;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

Uses DataModule, GlobsAndConst, Waiting;


procedure TdmReportF.JSReport(xReport,SM_ID: integer; FileReportPath: string);
begin

  ///**************************************************************************************************************************
  ///  Ведомость объемов работ и расхода ресурсов
  ///**************************************************************************************************************************
  if xReport = 1 then
      begin
      qrTMP.Close;
      qrTMP.SQL.Text := 'select PARENT_ID,SM_TYPE from smetasourcedata where SM_ID = '+inttostr(SM_ID);
      CloseOpen(qrTMP);
      if qrTMP.FieldByName('SM_TYPE').AsInteger = 2 then
      begin
      vkSQL.Close;
      vkSQL.SQL.LoadFromFile(GetCurrentDir+'\SQL\SQL3\JS1.SQL');
      vkSQL.ParamByName('SM_ID').AsInteger := SM_ID;
      end;
      if qrTMP.FieldByName('SM_TYPE').AsInteger = 3 then
      begin
      qrTMP.SQL.Text := 'select SM_ID,SM_TYPE from smetasourcedata where SM_ID = '+qrTMP.FieldByName('PARENT_ID').AsString ;
      CloseOpen(qrTMP);
      SM_ID:=  qrTMP.FieldByName('SM_ID').AsInteger ;
      end;
      if qrTMP.FieldByName('SM_TYPE').AsInteger = 1 then
      begin
      vkSQL.Close;
      vkSQL.SQL.LoadFromFile(GetCurrentDir+'\SQL\SQL3\JS2.SQL');
      vkSQL.ParamByName('SM_ID').AsInteger := SM_ID;
      end;

      CloseOpen(vkSQL);
      frxReport.LoadFromFile(FileReportPath + 'Ведомость объемов работ и расхода ресурсов.fr3');
  end;
  ///**************************************************************************************************************************

  ///**************************************************************************************************************************
  ///  Ведомость объемов работ и расхода ресурсов (по локальным сметам)
  ///**************************************************************************************************************************
  if xReport = 2 then
  begin
  qrTMP.Close;
  qrTMP.SQL.Text := 'select PARENT_ID,SM_TYPE from smetasourcedata where SM_ID = '+inttostr(SM_ID);
  CloseOpen(qrTMP);
  if qrTMP.FieldByName('SM_TYPE').AsInteger = 2 then
  begin
  vkSQL.Close;
  vkSQL.SQL.LoadFromFile(GetCurrentDir+'\SQL\SQL3\JS3.SQL');
  vkSQL.ParamByName('SM_ID').AsInteger := SM_ID;
  end;
  if qrTMP.FieldByName('SM_TYPE').AsInteger = 3 then
  begin
  qrTMP.SQL.Text := 'select SM_ID,SM_TYPE from smetasourcedata where SM_ID = '+qrTMP.FieldByName('PARENT_ID').AsString ;
  CloseOpen(qrTMP);
  SM_ID:=  qrTMP.FieldByName('SM_ID').AsInteger ;
  end;
  if qrTMP.FieldByName('SM_TYPE').AsInteger = 1 then
  begin
  vkSQL.Close;
  vkSQL.SQL.LoadFromFile(GetCurrentDir+'\SQL\SQL3\JS4.SQL');
  vkSQL.ParamByName('SM_ID').AsInteger := SM_ID;
  end;
  CloseOpen(vkSQL);
  frxReport.LoadFromFile(FileReportPath + 'Ведомость объемов работ и расхода ресурсов (по локальным сметам).fr3');
  end;
  ///**************************************************************************************************************************

  ///**************************************************************************************************************************
  ///  Ведомость объемов работ и расхода ресурсов (по объектным сметам)
  ///**************************************************************************************************************************
  if xReport = 3 then
  begin
  qrTMP.Close;
  qrTMP.SQL.Text := 'select PARENT_ID,SM_TYPE from smetasourcedata where SM_ID = '+inttostr(SM_ID);
  CloseOpen(qrTMP);
  if qrTMP.FieldByName('SM_TYPE').AsInteger = 2 then
  begin
  vkSQL.Close;
  vkSQL.SQL.LoadFromFile(GetCurrentDir+'\SQL\SQL3\JS5.SQL');
  vkSQL.ParamByName('SM_ID').AsInteger := SM_ID;
  end;
  if qrTMP.FieldByName('SM_TYPE').AsInteger = 3 then
  begin
  qrTMP.SQL.Text := 'select SM_ID,SM_TYPE from smetasourcedata where SM_ID = '+qrTMP.FieldByName('PARENT_ID').AsString ;
  CloseOpen(qrTMP);
  SM_ID:=  qrTMP.FieldByName('SM_ID').AsInteger ;
  end;
  if qrTMP.FieldByName('SM_TYPE').AsInteger = 1 then
  begin
  vkSQL.Close;
  vkSQL.SQL.LoadFromFile(GetCurrentDir+'\SQL\SQL3\JS6.SQL');
  vkSQL.ParamByName('SM_ID').AsInteger := SM_ID;
  end;

  CloseOpen(vkSQL);
  frxReport.LoadFromFile(FileReportPath + 'Ведомость объемов работ и расхода ресурсов (по локальным сметам).fr3');
  end;
  ///**************************************************************************************************************************


  ///**************************************************************************************************************************
  ///  !!! Ведомость объемов работ и расхода ресурсов (в стоимостном выражении)
  ///**************************************************************************************************************************
  if xReport = 4 then
  begin
    qrTMP.Close;
    qrTMP.SQL.Text := 'select PARENT_ID,SM_TYPE from smetasourcedata where SM_ID = '+inttostr(SM_ID);
    CloseOpen(qrTMP);
    if qrTMP.FieldByName('SM_TYPE').AsInteger = 2 then
    begin
    vkSQL.Close;
    vkSQL.SQL.LoadFromFile(GetCurrentDir+'\SQL\SQL3\JS7.SQL');
    vkSQL.ParamByName('SM_ID').AsInteger := SM_ID;
    end;
    if qrTMP.FieldByName('SM_TYPE').AsInteger = 3 then
    begin
    qrTMP.SQL.Text := 'select SM_ID,SM_TYPE from smetasourcedata where SM_ID = '+qrTMP.FieldByName('PARENT_ID').AsString ;
    CloseOpen(qrTMP);
    SM_ID:=  qrTMP.FieldByName('SM_ID').AsInteger ;
    end;
    if qrTMP.FieldByName('SM_TYPE').AsInteger = 1 then
    begin
    vkSQL.Close;
    vkSQL.SQL.LoadFromFile(GetCurrentDir+'\SQL\SQL3\JS8.SQL');
    vkSQL.ParamByName('SM_ID').AsInteger := SM_ID;
    end;
    CloseOpen(vkSQL);
    frxReport.LoadFromFile(FileReportPath + 'Ведомость объемов работ и расхода ресурсов (в стоимостном выражении).fr3');
  end;
  ///**************************************************************************************************************************
  ///**************************************************************************************************************************
  ///  !!! Ведомость объемов работ и расхода ресурсов (в стоимостном выражении)
  ///**************************************************************************************************************************
  if xReport = 5 then
  begin
    qrTMP.Close;
    qrTMP.SQL.Text := 'select PARENT_ID,SM_TYPE from smetasourcedata where SM_ID = '+inttostr(SM_ID);
    CloseOpen(qrTMP);
    if qrTMP.FieldByName('SM_TYPE').AsInteger = 2 then
    begin
    vkSQL.Close;
    vkSQL.SQL.LoadFromFile(GetCurrentDir+'\SQL\SQL3\JS9.SQL');
    vkSQL.ParamByName('SM_ID').AsInteger := SM_ID;
    end;
    if qrTMP.FieldByName('SM_TYPE').AsInteger = 3 then
    begin
    qrTMP.SQL.Text := 'select SM_ID,SM_TYPE from smetasourcedata where SM_ID = '+qrTMP.FieldByName('PARENT_ID').AsString ;
    CloseOpen(qrTMP);
    SM_ID:=  qrTMP.FieldByName('SM_ID').AsInteger ;
    end;
    if qrTMP.FieldByName('SM_TYPE').AsInteger = 1 then
    begin
    vkSQL.Close;
    vkSQL.SQL.LoadFromFile(GetCurrentDir+'\SQL\SQL3\JS10.SQL');
    vkSQL.ParamByName('SM_ID').AsInteger := SM_ID;
    end;
    CloseOpen(vkSQL);
    frxReport.LoadFromFile(FileReportPath + 'Ведомость ресурсов.fr3');
  end;
  ///**************************************************************************************************************************
  /// **************************************************************************************************************************
  ///  !!! Сводный сметный расчет
  ///**************************************************************************************************************************

  if xReport = 6 then
  begin
    qrTMP.Close;
    qrTMP.SQL.Text := 'select PARENT_ID,SM_TYPE from smetasourcedata where SM_ID = '+inttostr(SM_ID);
    CloseOpen(qrTMP);
    if qrTMP.FieldByName('SM_TYPE').AsInteger = 2 then
    begin
    vkSQL.Close;
    vkSQL.SQL.LoadFromFile(GetCurrentDir+'\SQL\SQL3\JS11.SQL');
    vkSQL.ParamByName('SM_ID').AsInteger := SM_ID;
    end;
    if qrTMP.FieldByName('SM_TYPE').AsInteger = 3 then
    begin
    qrTMP.SQL.Text := 'select SM_ID,SM_TYPE from smetasourcedata where SM_ID = '+qrTMP.FieldByName('PARENT_ID').AsString ;
    CloseOpen(qrTMP);
    SM_ID:=  qrTMP.FieldByName('SM_ID').AsInteger ;
    end;
    if qrTMP.FieldByName('SM_TYPE').AsInteger = 1 then
    begin
    vkSQL.Close;
    vkSQL.SQL.LoadFromFile(GetCurrentDir+'\SQL\SQL3\JS12.SQL');
    vkSQL.ParamByName('SM_ID').AsInteger := SM_ID;
    end;
    CloseOpen(vkSQL);
    frxReport.LoadFromFile(FileReportPath + 'Сводный сметный расчет.fr3');
  end;
  ///**************************************************************************************************************************


  /// **************************************************************************************************************************
  ///  Сводный сметный расчет в тыс руб
  ///**************************************************************************************************************************

  if xReport = 7 then
  begin
    qrTMP.Close;
    qrTMP.SQL.Text := 'select PARENT_ID,SM_TYPE from smetasourcedata where SM_ID = '+inttostr(SM_ID);
    CloseOpen(qrTMP);
    if qrTMP.FieldByName('SM_TYPE').AsInteger = 2 then
    begin
    vkSQL.Close;
    vkSQL.SQL.LoadFromFile(GetCurrentDir+'\SQL\SQL3\JS13.SQL');
    vkSQL.ParamByName('SM_ID').AsInteger := SM_ID;
    end;
    if qrTMP.FieldByName('SM_TYPE').AsInteger = 3 then
    begin
    qrTMP.SQL.Text := 'select SM_ID,SM_TYPE from smetasourcedata where SM_ID = '+qrTMP.FieldByName('PARENT_ID').AsString ;
    CloseOpen(qrTMP);
    SM_ID:=  qrTMP.FieldByName('SM_ID').AsInteger ;
    end;
    if qrTMP.FieldByName('SM_TYPE').AsInteger = 1 then
    begin
    vkSQL.Close;
    vkSQL.SQL.LoadFromFile(GetCurrentDir+'\SQL\SQL3\JS14.SQL');
    vkSQL.ParamByName('SM_ID').AsInteger := SM_ID;
    end;
    CloseOpen(vkSQL);
    frxReport.LoadFromFile(FileReportPath + 'Сводный сметный расчет.fr3');
  end;
  ///**************************************************************************************************************************

  /// **************************************************************************************************************************
  ///  Сводный сметный расчет (все строки)
  ///**************************************************************************************************************************
  if xReport = 8 then
  begin
    qrTMP.Close;
    qrTMP.SQL.Text := 'select PARENT_ID,SM_TYPE from smetasourcedata where SM_ID = '+inttostr(SM_ID);
    CloseOpen(qrTMP);
    if qrTMP.FieldByName('SM_TYPE').AsInteger = 2 then
    begin
    vkSQL.Close;
    vkSQL.SQL.LoadFromFile(GetCurrentDir+'\SQL\SQL3\JS15.SQL');
    vkSQL.ParamByName('SM_ID').AsInteger := SM_ID;
    end;
    if qrTMP.FieldByName('SM_TYPE').AsInteger = 3 then
    begin
    qrTMP.SQL.Text := 'select SM_ID,SM_TYPE from smetasourcedata where SM_ID = '+qrTMP.FieldByName('PARENT_ID').AsString ;
    CloseOpen(qrTMP);
    SM_ID:=  qrTMP.FieldByName('SM_ID').AsInteger ;
    end;
    if qrTMP.FieldByName('SM_TYPE').AsInteger = 1 then
    begin
    vkSQL.Close;
    vkSQL.SQL.LoadFromFile(GetCurrentDir+'\SQL\SQL3\JS16.SQL');
    vkSQL.ParamByName('SM_ID').AsInteger := SM_ID;
    end;
    CloseOpen(vkSQL);
    frxReport.LoadFromFile(FileReportPath + 'Сводный сметный расчет (все строки).fr3');
  end;
  ///**************************************************************************************************************************

  /// **************************************************************************************************************************
  ///  Cводный сметный расчет (по локальным сметам)
  ///**************************************************************************************************************************

  if xReport = 9 then
  begin
    qrTMP.Close;
    qrTMP.SQL.Text := 'select PARENT_ID,SM_TYPE from smetasourcedata where SM_ID = '+inttostr(SM_ID);
    CloseOpen(qrTMP);
    if qrTMP.FieldByName('SM_TYPE').AsInteger = 2 then
    begin
    vkSQL.Close;
    vkSQL.SQL.LoadFromFile(GetCurrentDir+'\SQL\SQL3\JS17.SQL');
    vkSQL.ParamByName('SM_ID').AsInteger := SM_ID;
    end;
    if qrTMP.FieldByName('SM_TYPE').AsInteger = 3 then
    begin
    qrTMP.SQL.Text := 'select SM_ID,SM_TYPE from smetasourcedata where SM_ID = '+qrTMP.FieldByName('PARENT_ID').AsString ;
    CloseOpen(qrTMP);
    SM_ID:=  qrTMP.FieldByName('SM_ID').AsInteger ;
    end;
    if qrTMP.FieldByName('SM_TYPE').AsInteger = 1 then
    begin
    vkSQL.Close;
    vkSQL.SQL.LoadFromFile(GetCurrentDir+'\SQL\SQL3\JS18.SQL');
    vkSQL.ParamByName('SM_ID').AsInteger := SM_ID;
    end;
    CloseOpen(vkSQL);
    frxReport.LoadFromFile(FileReportPath + 'Cводный сметный расчет (по локальным сметам).fr3');
  end;
  ///**************************************************************************************************************************

  /// **************************************************************************************************************************
  ///  Cводный сметный расчет (по локальным сметам)
  ///**************************************************************************************************************************

  if xReport = 10 then
  begin
    qrTMP.Close;
    qrTMP.SQL.Text := 'select PARENT_ID,SM_TYPE from smetasourcedata where SM_ID = '+inttostr(SM_ID);
    CloseOpen(qrTMP);
    if qrTMP.FieldByName('SM_TYPE').AsInteger = 2 then
    begin
    vkSQL.Close;
    vkSQL.SQL.LoadFromFile(GetCurrentDir+'\SQL\SQL3\JS19.SQL');
    vkSQL.ParamByName('SM_ID').AsInteger := SM_ID;
    end;
    if qrTMP.FieldByName('SM_TYPE').AsInteger = 3 then
    begin
    qrTMP.SQL.Text := 'select SM_ID,SM_TYPE from smetasourcedata where SM_ID = '+qrTMP.FieldByName('PARENT_ID').AsString ;
    CloseOpen(qrTMP);
    SM_ID:=  qrTMP.FieldByName('SM_ID').AsInteger ;
    end;
    if qrTMP.FieldByName('SM_TYPE').AsInteger = 1 then
    begin
    vkSQL.Close;
    vkSQL.SQL.LoadFromFile(GetCurrentDir+'\SQL\SQL3\JS20.SQL');
    vkSQL.ParamByName('SM_ID').AsInteger := SM_ID;
    end;
    CloseOpen(vkSQL);
    frxReport.LoadFromFile(FileReportPath + 'Cводный сметный расчет (по локальным сметам) в тыс руб.fr3');
  end;
  ///**************************************************************************************************************************

  try
        frxReport.PrepareReport;
        frxReport.ShowPreparedReport;
  except
      ShowMessage('Ошибка при формировании отчета');
  end;

  qrTMP.Close;
  vkSQL.Close;
end;





procedure TdmReportF.VK2N13(OBJ_ID: integer; FileReportPath: string);
begin
   qrTMP.Close;
   qrTMP.SQL.Text :=  'select 	CONCAT(`oc`.`NUM`, " ", `oc`.`NAME`) `NAME`,'#13#10 +
                    '		IFNULL(`s`.`MONAT`, 0) `MONTH`,'#13#10 +
                    '		IFNULL(`s`.`YEAR`, 0)  `YEAR`'#13#10 +
                    'from `smetasourcedata` as `ssd`'#13#10 +
                    'inner join`objcards`  `oc` on `oc`.`OBJ_ID` = `ssd`.`OBJ_ID`'#13#10 +
                    'inner join `objstroj` `os` on `os`.`STROJ_ID` = `oc`.`STROJ_ID`'#13#10 +
                    'inner join `stavka`    `s` on `s`.`STAVKA_ID` = `ssd`.`STAVKA_ID`'#13#10 +
                    'where `ssd`.`OBJ_ID` = :OBJ_ID'#13#10 ;

 qrTMP.ParamByName('OBJ_ID').AsInteger := OBJ_ID;
 CloseOpen(qrTMP);


  vkSQL.SQL.Text :=
  'SELECT  sm1.parent_id,concat("Смета №",trim(sm2.SM_NUMBER))as c1,'+
	'	      concat(trim(sm2.SM_NUMBER)," ",trim(sm2.name))      as c2,'+
	'	      round(sum(sm1.s_zp)/1000) 		      as c3,  ' +
	'	      round(sum(sm1.s_emim)/1000)   	    as c4,  ' +
	'	      round(sum(sm1.S_MR)/1000)   		    as c5,  ' +
	'	      round(sum(sm1.S_OHROPR)/1000)   	  as c6,  '+
	'	      0									                  as c7,  '+
	'	      0									                  as c8,  '+
	'	      0									                  as c9,  '+
	'	      round(sum(sm1.S_ZP_MASH)/1000)	    as c10, '+
	'	      round(sum(sm1.S_TRANSP)/1000)       as c11, '+
	'	      round(sum(sm1.S_PLAN_PRIB)/1000) 	  as c12, '+
	'	      0								                    as c13, '+
	'	      sum(sm1.S_TRUD) 					          as c14, '+
  '       0                                   as c15  ' +
'FROM smetasourcedata sm1 ' +
'left join  smetasourcedata sm2 on sm1.parent_id = sm2.sm_id and sm2.sm_type=1 ' +
'where sm1.obj_id=:OBJ_ID and sm1.sm_type = 3 group by sm1.parent_id ;';
vkSQL.ParamByName('OBJ_ID').AsInteger := OBJ_ID;

  CloseOpen(vkSQL);

  vkSQLTotal.SQL.Text :=
  'SELECT round(sum(sm1.s_zp)/1000) 		      +  ' +
	'	      round(sum(sm1.s_emim)/1000)   	    +  ' +
	'	      round(sum(sm1.S_MR)/1000)   		    +  ' +
	'	      round(sum(sm1.S_OHROPR)/1000)   	  +  '+
	'	      0									                  +  '+
	'	      0									                  +  '+
	'	      0									                  +  '+
	'	      round(sum(sm1.S_ZP_MASH)/1000)	    + '+
	'	      round(sum(sm1.S_TRANSP)/1000)       + '+
	'	      round(sum(sm1.S_PLAN_PRIB)/1000) 	  + '+
	'	      0								                    as c1 '+
'FROM smetasourcedata sm1 ' +
'left join  smetasourcedata sm2 on sm1.parent_id = sm2.sm_id and sm2.sm_type=1 ' +
'where sm1.obj_id=:OBJ_ID and sm1.sm_type = 3 ;';
vkSQLTotal.ParamByName('OBJ_ID').AsInteger := OBJ_ID;

  CloseOpen(vkSQLTotal);

  frxReport.LoadFromFile(FileReportPath + 'Объектная смета.fr3');

  try
  frxReport.Script.Variables['H1'] := vkSQLTotal.FieldByName('c1').AsString ;
  frxReport.Script.Variables['sm_obj_name'] := AnsiUpperCase(qrTMP.FieldByName('NAME').AsString);
  frxReport.Script.Variables['sm_date_dog'] := '1 ' + AnsiUpperCase(arraymes[qrTMP.FieldByName('MONTH').AsInteger, 2]) +
  ' ' + IntToStr(qrTMP.FieldByName('YEAR').AsInteger) + ' г.';
    frxReport.PrepareReport;

    frxReport.ShowPreparedReport;
  except
    ShowMessage('Ошибка при формировании отчета');
  end;
end;

procedure TdmReportF.Report_EXCEL(SM_ID,XLS: integer);
var
  wf,i,j{,SM_ID_ROOT} : integer;
  Excel             : Variant;
  oworkbook         : OleVariant;
  fnam{,xformula }         :string;
begin

  FormWaiting.Show;
  Application.ProcessMessages;

  fnam   :=GetCurrentDir +'\xls\report.xls';
  if XLS=1 then
  if fileexists(fnam)
  then
  begin
  CopyFile(PChar(fnam),PChar(GetCurrentDir +'\xls\report1.xls'),False);
  fnam := GetCurrentDir +'\xls\report1.xls';
  end;

   OpenDialog1.Filter:='Excel|*.xls';
   if XLS=2 then
   begin
   if opendialog1.Execute then fnam:=openDialog1.FileName else exit;
   end;

  qrTMP.SQL.Text := 'SELECT * FROM `smetasourcedata` WHERE sm_id='+inttostr(SM_ID)+';';
  CloseOpen(qrTMP);


  try
  Excel               := CreateOleObject('Excel.Application');
  except
  showmessage('Невозможно запустить EXCEL!!!');
  end;
  Excel.displayalerts :=False;
  oworkbook := Excel.workbooks.Open(fnam) ;



  vkExcel.Close;

   if qrTMP.FieldByName('sm_type').AsInteger = 3 then
   begin
   showmessage('Не рассчитывается для данного типа сметы');
   FormWaiting.Close;
   exit;
   end;


  if qrTMP.FieldByName('sm_type').AsInteger = 2 then
    vkExcel.SQL.Text :=
   ' select 	* '+
   ' FROM `smetasourcedata` `ssd` '+
   ' INNER JOIN `smetasourcedata` `ssd1` 	ON `ssd1`.`PARENT_ID` = `ssd`.`SM_ID` 	AND `ssd1`.`SM_TYPE` 	  = 1  '+
   ' INNER JOIN `smetasourcedata` `ssd2`	ON `ssd2`.`PARENT_ID` = `ssd1`.`SM_ID`	AND `ssd2`.`SM_TYPE` 	  = 3 '+
   ' INNER JOIN `data_row`   `de` 		ON  `de`.`ID_ESTIMATE` = `ssd2`.`SM_ID` AND `de`.`ID_TYPE_DATA`	= 1 '+
   ' WHERE (`ssd`.`SM_ID` ='+inttostr(SM_ID)+') AND (`de`.`ID_ACT` is NULL);';

  if qrTMP.FieldByName('sm_type').AsInteger = 1 then
    vkExcel.SQL.Text :=
   ' select * '+
   ' FROM `smetasourcedata` `ssd` '+
   ' INNER JOIN `smetasourcedata` `ssd2`	ON `ssd2`.`PARENT_ID` = `ssd`.`SM_ID`	  AND `ssd2`.`SM_TYPE` 	= 3 '+
   ' INNER JOIN `data_row`   `de` 	  ON  `de`.`ID_ESTIMATE` = `ssd2`.`SM_ID` AND `de`.`ID_TYPE_DATA` = 1 '+
   ' WHERE (`ssd`.`SM_ID` = '+inttostr(SM_ID)+') AND (`de`.`ID_ACT` is NULL);';

   CloseOpen(vkExcel);



    try
    oworkbook.WorkSheets[3].cells[1,3].value       :=  TRIM(vkExcel.FieldByName('K_ZP').AsString);
    oworkbook.WorkSheets[3].cells[2,3].value       :=  TRIM(vkExcel.FieldByName('K_EMiM').AsString);
    oworkbook.WorkSheets[3].cells[3,3].value       :=  TRIM(vkExcel.FieldByName('K_MR').AsString);
    oworkbook.WorkSheets[3].cells[4,3].value       :=  TRIM(vkExcel.FieldByName('K_TRUD').AsString);
    oworkbook.WorkSheets[3].cells[5,3].value       :=  TRIM(vkExcel.FieldByName('K_TRUD_MASH').AsString);
    oworkbook.WorkSheets[3].cells[6,3].value       :=  TRIM(vkExcel.FieldByName('K_ZP_MASH').AsString);
    oworkbook.WorkSheets[3].cells[7,3].value       :=  TRIM(vkExcel.FieldByName('K_TRANSP').AsString);
    oworkbook.WorkSheets[3].cells[8,3].value       :=  TRIM(vkExcel.FieldByName('K_STOIM').AsString);
    oworkbook.WorkSheets[3].cells[9,3].value       :=  TRIM(vkExcel.FieldByName('K_OHROPR').AsString);
    oworkbook.WorkSheets[3].cells[10,3].value      :=  TRIM(vkExcel.FieldByName('K_PLAN_PRIB').AsString);
    oworkbook.WorkSheets[3].cells[11,3].value      :=  TRIM(vkExcel.FieldByName('K_ST_OHROPR').AsString);
    oworkbook.WorkSheets[3].cells[12,3].value      :=  TRIM(vkExcel.FieldByName('K_ZIM_UDOR').AsString);
    oworkbook.WorkSheets[3].cells[13,3].value      :=  TRIM(vkExcel.FieldByName('K_ZP_ZIM_UDOR').AsString);
    oworkbook.WorkSheets[3].cells[14,3].value      :=  '1';
    oworkbook.WorkSheets[3].cells[15,3].value      :=  '2';

    oworkbook.worksheets[3].Cells[1,2].value       :=  'ZK_ZP';
    oworkbook.worksheets[3].Cells[1,3].name        :=  'ZK_ZP';
    oworkbook.worksheets[3].Cells[2,2].value       :=  'ZK_EMiM';
    oworkbook.worksheets[3].Cells[2,3].name        :=  'ZK_EMiM';
    oworkbook.worksheets[3].Cells[3,2].value       :=  'ZK_MR';
    oworkbook.worksheets[3].Cells[3,3].name        :=  'ZK_MR';
    oworkbook.worksheets[3].Cells[4,2].value       :=  'ZK_TRUD';
    oworkbook.worksheets[3].Cells[4,3].name        :=  'ZK_TRUD';
    oworkbook.worksheets[3].Cells[5,2].value       :=  'ZK_TRUD_MASH';
    oworkbook.worksheets[3].Cells[5,3].name        :=  'ZK_TRUD_MASH';
    oworkbook.worksheets[3].Cells[6,2].value       :=  'ZK_ZP_MASH';
    oworkbook.worksheets[3].Cells[6,3].name        :=  'ZK_ZP_MASH';
    oworkbook.worksheets[3].Cells[7,2].value       :=  'ZK_TRANSP';
    oworkbook.worksheets[3].Cells[7,3].name        :=  'ZK_TRANSP';
    oworkbook.worksheets[3].Cells[8,2].value       :=  'ZK_STOIM';
    oworkbook.worksheets[3].Cells[8,3].name        :=  'ZK_STOIM';
    oworkbook.worksheets[3].Cells[9,2].value       :=  'ZK_OHROPR';
    oworkbook.worksheets[3].Cells[9,3].name        :=  'ZK_OHROPR';
    oworkbook.worksheets[3].Cells[10,2].value      :=  'ZK_PLAN_PRIB';
    oworkbook.worksheets[3].Cells[10,3].name       :=  'ZK_PLAN_PRIB';
    oworkbook.worksheets[3].Cells[11,2].value      :=  'ZK_ST_OHROPR';
    oworkbook.worksheets[3].Cells[11,3].name       :=  'ZK_ST_OHROPR';
    oworkbook.worksheets[3].Cells[12,2].value      :=  'ZK_ZIM_UDOR';
    oworkbook.worksheets[3].Cells[12,3].name       :=  'ZK_ZIM_UDOR';
    oworkbook.worksheets[3].Cells[13,2].value      :=  'ZK_ZP_ZIM_UDOR';
    oworkbook.worksheets[3].Cells[13,3].name       :=  'ZK_ZP_ZIM_UDOR';
    oworkbook.worksheets[3].Cells[14,2].value      :=  'ZKI';
    oworkbook.worksheets[3].Cells[14,3].name       :=  'ZKI';
    oworkbook.worksheets[3].Cells[15,2].value      :=  'ZIS';
    oworkbook.worksheets[3].Cells[15,3].name       :=  'ZIS';
    oworkbook.worksheets[3].Cells[16,2].value      :=  'Z_NDS';
    oworkbook.worksheets[3].Cells[16,3].name       :=  'Z_NDS';
    oworkbook.worksheets[3].Cells[17,2].value      :=  'Z_GENPODR';
    oworkbook.worksheets[3].Cells[17,3].name       :=  'Z_GENPODR';
    oworkbook.worksheets[3].Cells[18,2].value      :=  'Z_VOZVR_TIT';
    oworkbook.worksheets[3].Cells[18,3].name       :=  'Z_VOZVR_TIT';
    oworkbook.worksheets[3].Cells[19,2].value      :=  'Z_VOZVR_MAT';
    oworkbook.worksheets[3].Cells[19,3].name       :=  'Z_VOZVR_MAT';
    oworkbook.worksheets[3].Cells[20,2].value      :=  'Z_SOC';
    oworkbook.worksheets[3].Cells[20,3].name       :=  'Z_SOC';




    except
    end;
  vkExcel.Close;

  j := 1;
  for wf := 0 to 30 do
  begin
  if FileExists(GetCurrentDir+'\SQL\SQL'+qrTMP.FieldByName('sm_type').AsString+'\Z'+inttostr(wf)+'.SQL') then
  begin
    vkExcel.SQL.LoadFromFile(GetCurrentDir+'\SQL\SQL'+qrTMP.FieldByName('sm_type').AsString+'\Z'+inttostr(wf)+'.SQL');
    vkExcel.ParamByName('SM_ID').AsInteger := SM_ID;

    CloseOpen(vkExcel);

    if WF<>13 then
    BEGIN
    for   I := 1  to round(vkExcel.FieldCount/2)  do
    begin
       try
       oworkbook.worksheets[2].Cells[j,1].Value             :=  vkExcel.FieldList.FieldByName('O'+inttostr(i)).AsString;
       oworkbook.worksheets[2].Cells[j,2].Value             :=  'Z'+inttostr(wf)+ 'C'+inttostr(i);
       oworkbook.worksheets[2].Cells[j,3].name              :=  'Z'+inttostr(wf)+ 'C'+inttostr(i);
       oworkbook.worksheets[2].Cells[j,3].Value             :=   vkExcel.FieldByName('C'+inttostr(i)).AsString;
       oworkbook.worksheets[2].Hyperlinks.Add(oworkbook.worksheets[2].Cells[j,1],  GetCurrentDir+'\SQL\SQL'+qrTMP.FieldByName('sm_type').AsString+'\Z'+inttostr(wf)+'.SQL') ;
        j:=j+1;
      except
      end;

    end;
    END
    ELSE
    BEGIN
    for   I := 1  to vkExcel.FieldCount do
    begin
       try
       oworkbook.worksheets[2].Cells[j,2].Value             :=  'Z'+inttostr(wf)+ 'C'+inttostr(i);
       oworkbook.worksheets[2].Cells[j,3].name              :=  'Z'+inttostr(wf)+ 'C'+inttostr(i);
       oworkbook.worksheets[2].Cells[j,3].Value             :=   vkExcel.FieldByName('C'+inttostr(i)).AsString;
       oworkbook.worksheets[2].Cells[j,1].Value             :=  'Z'+inttostr(wf)+ 'C'+inttostr(i);
       oworkbook.worksheets[2].Hyperlinks.Add(oworkbook.worksheets[2].Cells[j,1],  GetCurrentDir+'\SQL\SQL'+qrTMP.FieldByName('sm_type').AsString+'\Z'+inttostr(wf)+'.SQL') ;
       j:=j+1;
      except
      end;
    END;
     j:=j+1;


  end;
  end;
  end;

  DeleteFile(PChar(GetCurrentDir +'\reports\report\xl8\report.xls'));
  Excel.visible       :=  false;
  Excel.displayalerts :=  false;
  Excel.ActiveWorkBook.saveAs(GetCurrentDir +'\reports\report\xl8\report.xls');

  Excel.Quit;
  Excel:= 0;
  oworkbook:=0;

  spr_range.Close;
  vkExcel.Close;
  qrTMP.Close;
  FormWaiting.Close;

end;



 // vk зимнее удорожание
procedure TdmReportF.Report_WINTER_RS_OBJ(SM_ID: integer; FileReportPath: string);
begin
frxReport.LoadFromFile(FileReportPath + 'frWinter_RS_OBJ.fr3');

   qWRS_OBJ.SQL.Text:=
  ' SELECT 	DE.id_estimate,'+
  ' DE.ZP           as zp,'+
  ' round(DE.ZP_MASH,0)      as ZP_MASH,'+
  ' DE.Zim_udor     as Zim_udor,'+
  ' DE.ZP_ZIM_UDOR  as ZP_ZIM_UDOR,'+
  ' SSx.KZP         as KZP,'+
  ' CR.RATE_CODE    as RATE_CODE,'+
  ' CR.RATE_CAPTION as RATE_CAPTION,'+
  ' CR.RATE_COUNT   as RATE_COUNT,'+
  ' CR.RATE_UNIT    as RATE_UNIT,'+
  ' ssx.NAME1       as NAME1 ,'+
  ' round(if(SSx.KZP>0,DE.zp/SSx.KZP,0),0)     as zp_rab,'+
  ' round(if(SSx.KZP>0,ZP_MASH/RATE_COUNT,0),0) as v_mash,'+
  ' round(if(SSx.KZP*RATE_COUNT>0,DE.zp/(SSx.KZP*RATE_COUNT),0),0) as v_rab'+
  ' FROM data_row AS DE'+
  ' LEFT JOIN card_rate as CR ON DE.id_tables = CR.id'+
  ' left join'+
  ' (SELECT  ssd.SM_ID,0 as SM_VID,ssd.KZP, "" as NAME1'+
  ' FROM smetasourcedata ssd'+
  ' WHERE ssd.SM_ID = '+inttostr(SM_ID)+
  ' AND ssd.SM_TYPE = 2 AND (DE.ID_ACT is NULL)'+
  ' UNION '+
  ' SELECT ssd_local.SM_ID, 1 as SM_VID,ssd_local.KZP, CONCAT(ssd_local.SM_NUMBER, " ",  ssd_local.NAME) as NAME1'+
  ' FROM smetasourcedata ssd_local'+
  ' JOIN smetasourcedata ssd ON ssd.SM_ID = ssd_local.PARENT_ID'+
  ' AND ssd.SM_TYPE = 2'+
  ' WHERE ssd_local.PARENT_ID = '+inttostr(SM_ID)+
  ' AND ssd_local.SM_TYPE = 1'+
  ' UNION'+
  ' SELECT ssd_ptm.SM_ID,2 as SM_VID,ssd_ptm.KZP, CONCAT(ssd_local.SM_NUMBER, " ",  ssd_local.NAME) as NAME1'+
  ' FROM smetasourcedata ssd_ptm'+
  ' JOIN smetasourcedata ssd_local ON ssd_local.SM_ID = ssd_ptm.PARENT_ID'+
  ' AND ssd_local.SM_TYPE = 1'+
  ' AND ssd_local.PARENT_ID = '+inttostr(SM_ID)+
  ' JOIN smetasourcedata ssd ON ssd.SM_ID = ssd_local.PARENT_ID '+
  ' AND ssd.SM_TYPE = 2'+
  ' WHERE ssd_ptm.SM_TYPE = 3'+
  ' ORDER BY SM_VID) as ssx on ssx.sm_id = DE.ID_ESTIMATE'+
  ' where zim_udor+ZP_ZIM_UDOR>0' ;


   CloseOpen(qWRS_OBJ);

  try
    frxReport.PrepareReport;
    frxReport.ShowPreparedReport;
  except
    ShowMessage('Ошибка при формировании отчета');
  end;

  qrTMP.Close;
end;

// vk Расчет стоимости материалов по объекту
procedure TdmReportF.Report_RSMO_OBJ(with_nds,SM_ID: integer;OBJ_ID: integer; FileReportPath: string);
var
SM_ID_ROOT:integer;
begin
  // поиск корня по ветке
  qrTMP.SQL.Text := 'select IF(`ssd`.`PARENT_ID` = 0, `ssd`.`SM_ID`,'#13#10 +
                    '          (select IF(`ssd1`.`PARENT_ID` = 0, `ssd1`.`SM_ID`,'#13#10 +
                  	'                     (select IF(`ssd2`.`PARENT_ID` = 0, `ssd2`.`SM_ID`, NULL)'#13#10 +
                    '                      from `smetasourcedata` `ssd2`'#13#10 +
                    '               	  	 where `ssd2`.`SM_ID` = `ssd1`.`PARENT_ID`))'#13#10 +
                    '     		  from `smetasourcedata` `ssd1`'#13#10 +
		                '           where `ssd1`.`SM_ID` = `ssd`.`PARENT_ID`)) `SM_ID_ROOT`'#13#10 +
                    'from `smetasourcedata` `ssd`'#13#10 +
                    'where `ssd`.`SM_ID` = :SM_ID';

  qrTMP.ParamByName('SM_ID').AsInteger := SM_ID;
  CloseOpen(qrTMP);
  SM_ID_ROOT := qrTMP.FieldByName('SM_ID_ROOT').AsInteger;

  qrTMP.Close;

if with_nds = 0 then frxReport.LoadFromFile(FileReportPath + 'frRSMO_OBJ.fr3');
if with_nds = 1 then frxReport.LoadFromFile(FileReportPath + 'frRSMO_NDS_OBJ.fr3');

  qrTMP.SQL.Text :=  'select 	CONCAT(`oc`.`NUM`, " ", `oc`.`NAME`) `NAME`,'#13#10 +
                    '		IFNULL(`s`.`MONAT`, 0) `MONTH`,'#13#10 +
                    '		IFNULL(`s`.`YEAR`, 0) `YEAR`'#13#10 +
                    'from `smetasourcedata` as `ssd`'#13#10 +
                    'inner join`objcards` `oc` on `oc`.`OBJ_ID` = `ssd`.`OBJ_ID`'#13#10 +
                    'inner join `objstroj` `os` on `os`.`STROJ_ID` = `oc`.`STROJ_ID`'#13#10 +
                    'inner join `stavka` `s` on `s`.`STAVKA_ID` = `ssd`.`STAVKA_ID`'#13#10 +
                    'where (:SM_ID is null or `ssd`.`SM_ID` = :SM_ID) and (:OBJ_ID is null or `ssd`.`OBJ_ID` = :OBJ_ID)'#13#10 ;

  with qrTMP.ParamByName('SM_ID') do begin
  DataType := ftInteger;
  Clear;
  end;
  with qrTMP.ParamByName('OBJ_ID') do begin
  DataType := ftInteger;
  Clear;
  end;

  CloseOpen(qrTMP);


  qRSMO_OBJ.ParamByName('SM_ID').AsInteger  := SM_ID_ROOT;
  CloseOpen(qRSMO_OBJ);

  frxReport.Script.Variables['sm_obj_name'] := AnsiUpperCase(qrTMP.FieldByName('NAME').AsString);
  frxReport.Script.Variables['sm_date_dog'] := '1 ' + AnsiUpperCase(arraymes[qrTMP.FieldByName('MONTH').AsInteger, 2]) +
  ' ' + IntToStr(qrTMP.FieldByName('YEAR').AsInteger) + ' г.';
  try
    frxReport.PrepareReport;
    frxReport.ShowPreparedReport;
  except
    ShowMessage('Ошибка при формировании отчета');
  end;
end;

// vk Расчет стоимости механизмов по объекту
 procedure TdmReportF.Report_RSMEH_OBJ(with_nds,SM_ID: integer;OBJ_ID: integer; FileReportPath: string);
var
SM_ID_ROOT:integer;
begin
  // поиск корня по ветке
  qrTMP.SQL.Text := 'select IF(`ssd`.`PARENT_ID` = 0, `ssd`.`SM_ID`,'#13#10 +
                    '          (select IF(`ssd1`.`PARENT_ID` = 0, `ssd1`.`SM_ID`,'#13#10 +
                  	'                     (select IF(`ssd2`.`PARENT_ID` = 0, `ssd2`.`SM_ID`, NULL)'#13#10 +
                    '                      from `smetasourcedata` `ssd2`'#13#10 +
                    '               	  	 where `ssd2`.`SM_ID` = `ssd1`.`PARENT_ID`))'#13#10 +
                    '     		  from `smetasourcedata` `ssd1`'#13#10 +
		                '           where `ssd1`.`SM_ID` = `ssd`.`PARENT_ID`)) `SM_ID_ROOT`'#13#10 +
                    'from `smetasourcedata` `ssd`'#13#10 +
                    'where `ssd`.`SM_ID` = :SM_ID';

  qrTMP.ParamByName('SM_ID').AsInteger := SM_ID;
  CloseOpen(qrTMP);
  SM_ID_ROOT := qrTMP.FieldByName('SM_ID_ROOT').AsInteger;

  qrTMP.Close;

if with_nds = 0 then frxReport.LoadFromFile(FileReportPath + 'frRSMEH_OBJ.fr3');
if with_nds = 1 then frxReport.LoadFromFile(FileReportPath + 'frRSMEH_NDS_OBJ.fr3');

qrTMP.SQL.Text :=  'select 	CONCAT(`oc`.`NUM`, " ", `oc`.`NAME`) `NAME`,'#13#10 +
                  '		IFNULL(`s`.`MONAT`, 0) `MONTH`,'#13#10 +
                  '		IFNULL(`s`.`YEAR`, 0) `YEAR`'#13#10 +
                  'from `smetasourcedata` as `ssd`'#13#10 +
                  'inner join`objcards` `oc` on `oc`.`OBJ_ID` = `ssd`.`OBJ_ID`'#13#10 +
                  'inner join `objstroj` `os` on `os`.`STROJ_ID` = `oc`.`STROJ_ID`'#13#10 +
                  'inner join `stavka` `s` on `s`.`STAVKA_ID` = `ssd`.`STAVKA_ID`'#13#10 +
                  'where (:SM_ID is null or `ssd`.`SM_ID` = :SM_ID) and (:OBJ_ID is null or `ssd`.`OBJ_ID` = :OBJ_ID)'#13#10 ;

with qrTMP.ParamByName('SM_ID') do begin
DataType := ftInteger;
Clear;
end;
with qrTMP.ParamByName('OBJ_ID') do begin
DataType := ftInteger;
Clear;
end;
//qrTMP.ParamByName('ID_ACT').AsInteger := ID_ACT;
CloseOpen(qrTMP);


  qRSMEH_OBJ.ParamByName('SM_ID').AsInteger  := SM_ID_ROOT;
  CloseOpen(qRSMEH_OBJ);

  frxReport.Script.Variables['sm_obj_name'] := AnsiUpperCase(qrTMP.FieldByName('NAME').AsString);
  frxReport.Script.Variables['sm_date_dog'] := '1 ' + AnsiUpperCase(arraymes[qrTMP.FieldByName('MONTH').AsInteger, 2]) +
   ' ' + IntToStr(qrTMP.FieldByName('YEAR').AsInteger) + ' г.';
  try
    frxReport.PrepareReport;
    frxReport.ShowPreparedReport;
  except
    ShowMessage('Ошибка при формировании отчета');
  end;
end;

// vk Расчет стоимости оборудования по объекту
procedure TdmReportF.Report_RSDEV_OBJ(with_nds,SM_ID: integer;OBJ_ID: integer; FileReportPath: string);
begin

if with_nds = 0 then frxReport.LoadFromFile(FileReportPath + 'frRSMEH_OBJ.fr3');
if with_nds = 1 then frxReport.LoadFromFile(FileReportPath + 'frRSMEH_NDS_OBJ.fr3');

qrTMP.SQL.Text :=  'select 	CONCAT(`oc`.`NUM`, " ", `oc`.`NAME`) `NAME`,'#13#10 +
                  '		IFNULL(`s`.`MONAT`, 0) `MONTH`,'#13#10 +
                  '		IFNULL(`s`.`YEAR`, 0) `YEAR`'#13#10 +
                  'from `smetasourcedata` as `ssd`'#13#10 +
                  'inner join`objcards` `oc` on `oc`.`OBJ_ID` = `ssd`.`OBJ_ID`'#13#10 +
                  'inner join `objstroj` `os` on `os`.`STROJ_ID` = `oc`.`STROJ_ID`'#13#10 +
                  'inner join `stavka` `s` on `s`.`STAVKA_ID` = `ssd`.`STAVKA_ID`'#13#10 +
                  'where (:SM_ID is null or `ssd`.`SM_ID` = :SM_ID) and (:OBJ_ID is null or `ssd`.`OBJ_ID` = :OBJ_ID)'#13#10 ;

with qrTMP.ParamByName('SM_ID') do begin
DataType := ftInteger;
Clear;
end;
with qrTMP.ParamByName('OBJ_ID') do begin
DataType := ftInteger;
Clear;
end;
//qrTMP.ParamByName('ID_ACT').AsInteger := ID_ACT;
CloseOpen(qrTMP);

qRSMEH_OBJ.SQL.Text:=
' select '#13#10 +
'     `mech_code`,'#13#10 +
'     `mech_name`,'#13#10 +
'     `mech_unit`,'#13#10 +
'     sum(`mech_count`) as `mech_count`,'#13#10 +
'     `coast_no_nds` 	 as `coast_no_nds` ,'#13#10 +
'     sum(`mech_SUM_NO_NDS`) as `SUM_NO_NDS`,'#13#10 +
'     sum(`mech_ZPSUM_NO_NDS`) as `ZP_SUM_NO_NDS`,'#13#10 +
'     `mechanizmcard`.`NDS`,'#13#10 +
'     `mechanizmcard`.`ZP_MACH_NO_NDS`,'#13#10 +
'     sum(`mech_SUM_NO_NDS`*(1+`mechanizmcard`.`NDS`/100)) as `NDS_RUB`,'#13#10 +
'     sum(`mech_SUM_NDS`) as `SUM_NDS`'#13#10 +
' from mechanizmcard '#13#10 +
' left join  card_rate on card_rate.id = mechanizmcard.ID_CARD_RATE'#13#10 +
' left join  data_row on ID_TABLES = card_rate.id'#13#10 +
' left join  smetasourcedata on  smetasourcedata.sm_id = data_row.ID_ESTIMATE '#13#10 +
' where (:SM_ID is null or `smetasourcedata`.`SM_ID` = :SM_ID) and' +
' (:OBJ_ID is null or `smetasourcedata`.`OBJ_ID` = :OBJ_ID) AND (`data_row`.`ID_ACT` is NULL)'#13#10 +
' group by  `mech_code`,`mech_name`,`mech_unit`,`NDS`,`ZP_MACH_NO_NDS`'#13#10 +
' order by `mech_code`' ;



  with qRSMEH_OBJ.ParamByName('SM_ID') do begin
  DataType := ftInteger;
  Clear;
  end;
  with qRSMEH_OBJ.ParamByName('OBJ_ID') do begin
  DataType := ftInteger;
  Clear;
  end;

  if SM_ID>0  then  qRSMEH_OBJ.ParamByName('SM_ID').AsInteger  := SM_ID;
  if OBJ_ID>0 then  qRSMEH_OBJ.ParamByName('OBJ_ID').AsInteger := OBJ_ID;
  CloseOpen(qRSMEH_OBJ);

  frxReport.Script.Variables['sm_obj_name'] := AnsiUpperCase(qrTMP.FieldByName('NAME').AsString);
  frxReport.Script.Variables['sm_date_dog'] := '1 ' + AnsiUpperCase(arraymes[qrTMP.FieldByName('MONTH').AsInteger, 2]) +
   ' ' + IntToStr(qrTMP.FieldByName('YEAR').AsInteger) + ' г.';
  try
    frxReport.PrepareReport;
    frxReport.ShowPreparedReport;
  except
    ShowMessage('Ошибка при формировании отчета');
  end;


end;

// vk ВЕДОМОСТЬ ОБЪЁМОВ И СТОИМОСТИ РАБОТ вариант-1
 procedure TdmReportF.Report_VED_OANDPWV1_OBJ(xvar,with_nds,OBJ_ID: integer; FileReportPath: string);
begin

//if with_nds = 0 then frxReport.LoadFromFile(FileReportPath + 'frRSMEH_OBJ.fr3');
//if with_nds = 1 then frxReport.LoadFromFile(FileReportPath + 'frRSMEH_NDS_OBJ.fr3');

if xvar = 1 then frxReport.LoadFromFile(FileReportPath + 'frOANDPWV1_OBJ.fr3');
if xvar = 2 then frxReport.LoadFromFile(FileReportPath + 'frVOSR_OBJ.fr3');

qrTMP.SQL.Text :=  'select 		`ssd`.`sm_id`,CONCAT(`oc`.`NUM`, " ", `oc`.`NAME`) `NAME`,'#13#10 +
                  '		IFNULL(`s`.`MONAT`, 0) `MONTH`,'#13#10 +
                  '		IFNULL(`s`.`YEAR`, 0) `YEAR`'#13#10 +
                  'from `smetasourcedata` as `ssd`'#13#10 +
                  'inner join`objcards` `oc` on `oc`.`OBJ_ID` = `ssd`.`OBJ_ID`'#13#10 +
                  'inner join `objstroj` `os` on `os`.`STROJ_ID` = `oc`.`STROJ_ID`'#13#10 +
                  'inner join `stavka` `s` on `s`.`STAVKA_ID` = `ssd`.`STAVKA_ID`'#13#10 +
                  'where  (:OBJ_ID is null or `ssd`.`OBJ_ID` = :OBJ_ID)  and sm_type=2 '#13#10 ;

qrTMP.ParamByName('OBJ_ID').AsInteger := OBJ_ID;
CloseOpen(qrTMP);

qVED_OANDPWV1.SQL.Text:=
' SELECT'#13#10 +
' smetasourcedata.sm_id,'#13#10 +
' smetasourcedata.SM_NUMBER,'#13#10 +
' NAME,'#13#10 +
' NAME_O,'#13#10 +
' NAME_L,'#13#10 +
' SM_VID,'#13#10 +
' S_TRUD,'#13#10 +
' ROUND(S_ZP/100) as S_ZP,'#13#10 +
' S_TRUD_MASH,'#13#10 +
' ROUND(S_EMiM/1000) as S_EMiM,'#13#10 +
' ROUND(S_ZP_MASH/1000) as S_ZP_MASH,'#13#10 +
' ROUND(S_MR/1000) as S_MR,'#13#10 +
' ROUND(S_TRANSP/1000) as S_TRANSP,'#13#10 +
' ROUND(S_OHROPR/1000) as S_OHROPR,'#13#10 +
' ROUND(S_ST_OHROPR/1000) as S_ST_OHROPR,'#13#10 +
' ROUND(S_PLAN_PRIB/1000) as S_PLAN_PRIB,'#13#10 +
' ROUND(S_STOIM/1000) as S_STOIM,'#13#10 +
' PARENT_ID '#13#10 +
' FROM smeta.smetasourcedata'#13#10 +
' left join (SELECT  ssd.SM_ID, ssd.OBJ_ID, 0 as SM_VID,'#13#10 +
' CONCAT(ssd.SM_NUMBER, " ",  ssd.NAME) as NAME_O, "" AS NAME_L '#13#10 +
' FROM smetasourcedata ssd'#13#10 +
' WHERE ssd.SM_ID = :SM_ID '#13#10 +
' AND ssd.SM_TYPE = 2'#13#10 +
' UNION'#13#10 +
''#13#10 +
'SELECT ssd_local.SM_ID, ssd_local.OBJ_ID, 1 as SM_VID,'#13#10 +
'CONCAT(ssd.SM_NUMBER, " ",  ssd.NAME) as NAME_O, CONCAT(ssd_local.SM_NUMBER, " ",  ssd_local.NAME) as NAME_L'#13#10 +
'FROM smetasourcedata ssd_local'#13#10 +
'JOIN smetasourcedata ssd ON ssd.SM_ID = ssd_local.PARENT_ID'#13#10 +
'				AND ssd.SM_TYPE = 2'#13#10 +
'WHERE ssd_local.PARENT_ID = :SM_ID'#13#10 +
'AND ssd_local.SM_TYPE = 1'#13#10 +
'UNION'#13#10 +
''#13#10 +
'SELECT ssd_ptm.SM_ID, ssd_ptm.OBJ_ID,  2 as SM_VID, '#13#10 +
'CONCAT(ssd.SM_NUMBER, " ",  ssd.NAME) as NAME_O, CONCAT(ssd_local.SM_NUMBER, " ",  ssd_local.NAME) as NAME_L'#13#10 +
'FROM smetasourcedata ssd_ptm'#13#10 +
'JOIN smetasourcedata ssd_local ON ssd_local.SM_ID = ssd_ptm.PARENT_ID '#13#10 +
'					  AND ssd_local.SM_TYPE = 1'#13#10 +
'					  AND ssd_local.PARENT_ID = :SM_ID'#13#10 +
'JOIN smetasourcedata ssd ON ssd.SM_ID = ssd_local.PARENT_ID'#13#10 +
'				AND ssd.SM_TYPE = 2'#13#10 +
'WHERE ssd_ptm.SM_TYPE = 3'#13#10 +
'ORDER BY SM_VID) as  cr_nam on cr_nam.sm_id = smetasourcedata.sm_id'#13#10 +
'where sm_vid>1'#13#10 +
'order by SM_ID,PARENT_ID' ;


qVED_OANDPWV1.ParamByName('SM_ID').AsInteger := qrTMP.FieldByName('SM_ID').AsInteger ;
CloseOpen(qVED_OANDPWV1);

  frxReport.Script.Variables['sm_obj_name'] := AnsiUpperCase(qrTMP.FieldByName('NAME').AsString);
  frxReport.Script.Variables['sm_date_dog'] := '1 ' + AnsiUpperCase(arraymes[qrTMP.FieldByName('MONTH').AsInteger, 2]) +
   ' ' + IntToStr(qrTMP.FieldByName('YEAR').AsInteger) + ' г.';
  try
    frxReport.PrepareReport;
    frxReport.ShowPreparedReport;
  except
    ShowMessage('Ошибка при формировании отчета');
  end;


end;

//vk Ведомость объемов работ и расхода ресурсов по смете
procedure TdmReportF.Report_VED_OBRAB_RASHRES_SMET_OBJ( SM_ID: integer;FileReportPath: string);
begin
 frxReport.LoadFromFile(FileReportPath + 'frVED_OBRAB_RASHRES_SMET_OBJ.fr3');

 qrTMP.SQL.Text :=  'select `SM_TYPE`'#13#10 +
                    'from `smetasourcedata` ssd'#13#10 +
                    'where (`ssd`.`SM_ID` = :SM_ID)'#13#10 ;

 qrTMP.ParamByName('SM_ID').AsInteger := SM_ID ;
 CloseOpen(qrTMP);

if qRTMP.FieldByName('SM_TYPE').AsInteger =2 then
qVED_OBRAB_RASHRES_SMET.SQL.Text:=
' SELECT * FROM '#13#10 +
' ('#13#10 +
' SELECT'#13#10 +
' `ssd`.`sm_id`  as `sm_id1`,'#13#10 +
' `ssd1`.`sm_id` as `sm_id2`,'#13#10 +
' `ssd2`.`sm_id` as `sm_id3`,'#13#10 +
' `ssd`.`name`  as `name`,'#13#10 +
' `ssd1`.`name` as `name_o`,'#13#10 +
' `ssd2`.`name` as `name_l`,'#13#10 +
' `ssd`.`sm_number` as `sm_number`,'#13#10 +
' `ssd1`.`sm_number` as `sm_number1`,'#13#10 +
' `ssd2`.`sm_number` as `sm_number2`,'#13#10 +
' `mtc`.`MAT_CODE`,   '#13#10 +
' UCASE(`mtc`.`MAT_NAME`) as `MAT_NAME`,'#13#10 +
' `mtc`.`MAT_UNIT`,'#13#10 +
' sum(`mtc`.`MAT_COUNT`) as MAT_COUNT'#13#10 +
' FROM `smetasourcedata` `ssd`'#13#10 +
' INNER JOIN `smetasourcedata` `ssd1` ON `ssd1`.`PARENT_ID` = `ssd`.`SM_ID`  AND `ssd1`.`SM_TYPE` = 1'#13#10 +
' INNER JOIN `smetasourcedata` `ssd2` ON `ssd2`.`PARENT_ID` = `ssd1`.`SM_ID` AND `ssd2`.`SM_TYPE` = 3'#13#10 +
' INNER JOIN `data_row` `de` ON `de`.`ID_ESTIMATE` = `ssd2`.`SM_ID`     AND `de`.`ID_TYPE_DATA` IN (1, 2, 5) '#13#10 +
' INNER JOIN `card_rate` `cr` ON `cr`.`ID` = `de`.`ID_TABLES`'#13#10 +
' INNER JOIN `materialcard` `mtc` ON `mtc`.`ID_CARD_RATE` = `cr`.`ID`'#13#10 +
' WHERE (`ssd`.`SM_ID` = :SM_ID)  AND (`ssd`.`SM_TYPE` = 2) AND (`de`.`ID_ACT` is NULL) '#13#10 +
' group by `sm_id3`,`MAT_CODE` '#13#10 +
' union'#13#10 +
' SELECT'#13#10 +
' `ssd`.`sm_id`  as `sm_id1`, '#13#10 +
' `ssd1`.`sm_id` as `sm_id2`,'#13#10 +
' `ssd2`.`sm_id` as `sm_id3`, '#13#10 +
' `ssd`.`name`  as `name`,'#13#10 +
' `ssd1`.`name` as `name_o`, '#13#10 +
' `ssd2`.`name` as `name_l`,'#13#10 +
' `ssd`.`sm_number` as `sm_number`,'#13#10 +
' `ssd1`.`sm_number` as `sm_number1`,  '#13#10 +
' `ssd2`.`sm_number` as `sm_number2`,'#13#10 +
' "1-1" as `MAT_CODE`,  '#13#10 +
' "ЗАТРАТЫ ТРУДА РАБОЧИХ-СТРОИТЕЛЕЙ" as MAT_NAME, '#13#10 +
' "чел/ч" as `MAT_UNIT`,  '#13#10 +
' `ssd2`.`s_trud` as `MAT_COUNT`'#13#10 +
' FROM `smetasourcedata` `ssd` '#13#10 +
' inner JOIN `smetasourcedata` `ssd1` ON `ssd1`.`PARENT_ID` = `ssd`.`SM_ID`'#13#10 +
' inner JOIN `smetasourcedata` `ssd2` ON `ssd2`.`PARENT_ID` = `ssd1`.`SM_ID`'#13#10 +
' where `ssd`.`sm_id`= :SM_ID '#13#10 +
' union  '#13#10 +
' SELECT '#13#10 +
' `ssd`.`sm_id`  as `sm_id1`,'#13#10 +
' `ssd1`.`sm_id` as `sm_id2`, '#13#10 +
' `ssd2`.`sm_id` as `sm_id3`,'#13#10 +
' `ssd`.`name`  as `name`, '#13#10 +
' `ssd1`.`name` as `name_o`, '#13#10 +
' `ssd2`.`name` as `name_l`, '#13#10 +
' `ssd`.`sm_number` as `sm_number`, '#13#10 +
' `ssd1`.`sm_number` as `sm_number1`,'#13#10 +
' `ssd2`.`sm_number` as `sm_number2`, '#13#10 +
' "1-3" as MAT_CODE, '#13#10 +
' "ЗАТРАТЫ ТРУДА МАШИНИСТОВ" as `MAT_NAME`, '#13#10 +
' "чел/ч" as `MAT_UNIT`,'#13#10 +
' ssd2.s_trud_mash as `MAT_COUNT` '#13#10 +
' FROM `smetasourcedata` `ssd`'#13#10 +
' inner JOIN `smetasourcedata` `ssd1` ON `ssd1`.`PARENT_ID` = `ssd`.`SM_ID`'#13#10 +
' inner JOIN `smetasourcedata` `ssd2` ON `ssd2`.`PARENT_ID` = `ssd1`.`SM_ID`'#13#10 +
' where `ssd`.`sm_id`= :SM_ID '#13#10 +
' union  '#13#10 +
' SELECT '#13#10 +
' `ssd`.`sm_id`  as `sm_id1`, '#13#10 +
' `ssd1`.`sm_id` as `sm_id2`,'#13#10 +
' `ssd2`.`sm_id` as `sm_id3`,'#13#10 +
' `ssd`.`name`  as `name`, '#13#10 +
' `ssd1`.`name` as `name_o`,'#13#10 +
' `ssd2`.`name` as `name_l`,'#13#10 +
' `ssd`.`sm_number` as `sm_number`,'#13#10 +
' `ssd1`.`sm_number` as `sm_number1`,'#13#10 +
' `ssd2`.`sm_number` as `sm_number2`, '#13#10 +
' `mch`.`MECH_CODE` as `MAT_CODE`, '#13#10 +
' UCASE(`mch`.`MECH_NAME`) as `MAT_NAME`, '#13#10 +
' `mch`.`MECH_UNIT`,   '#13#10 +
' sum(`mch`.`MECH_COUNT`) as `MAT_COUNT` '#13#10 +
' FROM `smetasourcedata` `ssd`'#13#10 +
' INNER JOIN `smetasourcedata` `ssd1` ON `ssd1`.`PARENT_ID` = `ssd`.`SM_ID`  AND `ssd1`.`SM_TYPE` = 1 '#13#10 +
' INNER JOIN `smetasourcedata` `ssd2` ON `ssd2`.`PARENT_ID` = `ssd1`.`SM_ID` AND `ssd2`.`SM_TYPE` = 3  '#13#10 +
' INNER JOIN `data_row` `de` ON `de`.`ID_ESTIMATE` = `ssd2`.`SM_ID`     AND `de`.`ID_TYPE_DATA` IN (1, 2, 5) '#13#10 +
' INNER JOIN `card_rate` `cr` ON `cr`.`ID` = `de`.`ID_TABLES` '#13#10 +
' INNER JOIN `mechanizmcard` `mch` ON `mch`.`ID_CARD_RATE` = `cr`.`ID` '#13#10 +
' WHERE (`ssd`.`SM_ID` =  :SM_ID) AND (`ssd`.`SM_TYPE` = 2) AND (`de`.`ID_ACT` is NULL) '#13#10 +
' group by `sm_id3`,`MECH_CODE` ) sm  order by `sm_id2`,`sm_id3`,`MAT_CODE`;';



if qRTMP.FieldByName('SM_TYPE').AsInteger =1 then
qVED_OBRAB_RASHRES_SMET.SQL.Text:=
' SELECT * FROM '#13#10 +
' ('#13#10 +
' SELECT'#13#10 +
' 0  as `sm_id1`,'#13#10 +
' `ssd1`.`sm_id` as `sm_id2`,'#13#10 +
' `ssd2`.`sm_id` as `sm_id3`,'#13#10 +
' ""  as `name`,'#13#10 +
' `ssd1`.`name` as `name_o`,'#13#10 +
' `ssd2`.`name` as `name_l`,'#13#10 +
' "" as `sm_number`,'#13#10 +
' `ssd1`.`sm_number` as `sm_number1`,'#13#10 +
' `ssd2`.`sm_number` as `sm_number2`,'#13#10 +
' `mtc`.`MAT_CODE`,   '#13#10 +
' UCASE(`mtc`.`MAT_NAME`) as `MAT_NAME`,'#13#10 +
' `mtc`.`MAT_UNIT`,'#13#10 +
' sum(`mtc`.`MAT_COUNT`) as MAT_COUNT'#13#10 +
' FROM `smetasourcedata` `ssd1`'#13#10 +
' INNER JOIN `smetasourcedata` `ssd2` ON `ssd2`.`PARENT_ID` = `ssd1`.`SM_ID` AND `ssd2`.`SM_TYPE` = 3'#13#10 +
' INNER JOIN `data_row` `de` ON `de`.`ID_ESTIMATE` = `ssd2`.`SM_ID`     AND `de`.`ID_TYPE_DATA` IN (1, 2, 5) '#13#10 +
' INNER JOIN `card_rate` `cr` ON `cr`.`ID` = `de`.`ID_TABLES`'#13#10 +
' INNER JOIN `materialcard` `mtc` ON `mtc`.`ID_CARD_RATE` = `cr`.`ID`'#13#10 +
' WHERE (`ssd1`.`SM_ID` = :SM_ID) AND (`ssd1`.`SM_TYPE` = 1) AND (`de`.`ID_ACT` is NULL) '#13#10 +
' group by `sm_id3`,`MAT_CODE` '#13#10 +
' union'#13#10 +
' SELECT'#13#10 +
' 0  as `sm_id1`, '#13#10 +
' `ssd1`.`sm_id` as `sm_id2`,'#13#10 +
' `ssd2`.`sm_id` as `sm_id3`, '#13#10 +
' "" as `name`,'#13#10 +
' `ssd1`.`name` as `name_o`, '#13#10 +
' `ssd2`.`name` as `name_l`,'#13#10 +
' "" as `sm_number`,'#13#10 +
' `ssd1`.`sm_number` as `sm_number1`,  '#13#10 +
' `ssd2`.`sm_number` as `sm_number2`,'#13#10 +
' "1-1" as `MAT_CODE`,  '#13#10 +
' "ЗАТРАТЫ ТРУДА РАБОЧИХ-СТРОИТЕЛЕЙ" as MAT_NAME, '#13#10 +
' "чел/ч" as `MAT_UNIT`,  '#13#10 +
' `ssd2`.`s_trud` as `MAT_COUNT`'#13#10 +
' FROM `smetasourcedata` `ssd1` '#13#10 +
' inner JOIN `smetasourcedata` `ssd2` ON `ssd2`.`PARENT_ID` = `ssd1`.`SM_ID`'#13#10 +
' where `ssd1`.`sm_id`= :SM_ID '#13#10 +
' union  '#13#10 +
' SELECT '#13#10 +
' 0  as `sm_id1`,'#13#10 +
' `ssd1`.`sm_id` as `sm_id2`, '#13#10 +
' `ssd2`.`sm_id` as `sm_id3`,'#13#10 +
' ""  as `name`, '#13#10 +
' `ssd1`.`name` as `name_o`, '#13#10 +
' `ssd2`.`name` as `name_l`, '#13#10 +
' "" as `sm_number`, '#13#10 +
' `ssd1`.`sm_number` as `sm_number1`,'#13#10 +
' `ssd2`.`sm_number` as `sm_number2`, '#13#10 +
' "1-3" as MAT_CODE, '#13#10 +
' "ЗАТРАТЫ ТРУДА МАШИНИСТОВ" as `MAT_NAME`, '#13#10 +
' "чел/ч" as `MAT_UNIT`,'#13#10 +
' ssd2.s_trud_mash as `MAT_COUNT` '#13#10 +
' FROM `smetasourcedata` `ssd1`'#13#10 +
' inner JOIN `smetasourcedata` `ssd2` ON `ssd2`.`PARENT_ID` = `ssd1`.`SM_ID`'#13#10 +
' where `ssd1`.`sm_id`= :SM_ID '#13#10 +
' union  '#13#10 +
' SELECT '#13#10 +
' 0 as `sm_id1`, '#13#10 +
' `ssd1`.`sm_id` as `sm_id2`,'#13#10 +
' `ssd2`.`sm_id` as `sm_id3`,'#13#10 +
' ""  as `name`, '#13#10 +
' `ssd1`.`name` as `name_o`,'#13#10 +
' `ssd2`.`name` as `name_l`,'#13#10 +
' "" as `sm_number`,'#13#10 +
' `ssd1`.`sm_number` as `sm_number1`,'#13#10 +
' `ssd2`.`sm_number` as `sm_number2`, '#13#10 +
' `mch`.`MECH_CODE` as `MAT_CODE`, '#13#10 +
' UCASE(`mch`.`MECH_NAME`) as `MAT_NAME`, '#13#10 +
' `mch`.`MECH_UNIT`,   '#13#10 +
' sum(`mch`.`MECH_COUNT`) as `MAT_COUNT` '#13#10 +
' FROM `smetasourcedata` `ssd1`'#13#10 +
' INNER JOIN `smetasourcedata` `ssd2` ON `ssd2`.`PARENT_ID` = `ssd1`.`SM_ID` AND `ssd2`.`SM_TYPE` = 3  '#13#10 +
' INNER JOIN `data_row` `de` ON `de`.`ID_ESTIMATE` = `ssd2`.`SM_ID`     AND `de`.`ID_TYPE_DATA` IN (1, 2, 5) '#13#10 +
' INNER JOIN `card_rate` `cr` ON `cr`.`ID` = `de`.`ID_TABLES` '#13#10 +
' INNER JOIN `mechanizmcard` `mch` ON `mch`.`ID_CARD_RATE` = `cr`.`ID` '#13#10 +
' WHERE (`ssd1`.`SM_ID` =  :SM_ID) AND (`ssd1`.`SM_TYPE` = 1) AND (`de`.`ID_ACT` is NULL) '#13#10 +
' group by `sm_id3`,`MECH_CODE` ) sm  order by `sm_id2`,`sm_id3`,`MAT_CODE`;';



if qRTMP.FieldByName('SM_TYPE').AsInteger =3 then
qVED_OBRAB_RASHRES_SMET.SQL.Text:=
' SELECT * FROM '#13#10 +
' ('#13#10 +
' SELECT'#13#10 +
' 0  as `sm_id1`,'#13#10 +
' 0 as `sm_id2`,'#13#10 +
' `ssd2`.`sm_id` as `sm_id3`,'#13#10 +
' ""  as `name`,'#13#10 +
' "" as `name_o`,'#13#10 +
' `ssd2`.`name` as `name_l`,'#13#10 +
' "" as `sm_number`,'#13#10 +
' "" as `sm_number1`,'#13#10 +
' `ssd2`.`sm_number` as `sm_number2`,'#13#10 +
' `mtc`.`MAT_CODE`,   '#13#10 +
' UCASE(`mtc`.`MAT_NAME`) as `MAT_NAME`,'#13#10 +
' `mtc`.`MAT_UNIT`,'#13#10 +
' sum(`mtc`.`MAT_COUNT`) as MAT_COUNT'#13#10 +
' FROM `smetasourcedata` `ssd2`'#13#10 +
' INNER JOIN `data_row` `de` ON `de`.`ID_ESTIMATE` = `ssd2`.`SM_ID`     AND `de`.`ID_TYPE_DATA` IN (1, 2, 5) '#13#10 +
' INNER JOIN `card_rate` `cr` ON `cr`.`ID` = `de`.`ID_TABLES`'#13#10 +
' INNER JOIN `materialcard` `mtc` ON `mtc`.`ID_CARD_RATE` = `cr`.`ID`'#13#10 +
' WHERE (`ssd2`.`SM_ID` = :SM_ID) AND (`ssd2`.`SM_TYPE` = 3) AND (`de`.`ID_ACT` is NULL) '#13#10 +
' group by `sm_id3`,`MAT_CODE` '#13#10 +

' union'#13#10 +

' SELECT'#13#10 +
' 0  as `sm_id1`, '#13#10 +
' 0 as `sm_id2`,'#13#10 +
' `ssd2`.`sm_id` as `sm_id3`, '#13#10 +
' "" as `name`,'#13#10 +
' "" as `name_o`, '#13#10 +
' `ssd2`.`name` as `name_l`,'#13#10 +
' "" as `sm_number`,'#13#10 +
' "" as `sm_number1`,  '#13#10 +
' `ssd2`.`sm_number` as `sm_number2`,'#13#10 +
' "1-1" as `MAT_CODE`,  '#13#10 +
' "ЗАТРАТЫ ТРУДА РАБОЧИХ-СТРОИТЕЛЕЙ" as MAT_NAME, '#13#10 +
' "чел/ч" as `MAT_UNIT`,  '#13#10 +
' `ssd2`.`s_trud` as `MAT_COUNT`'#13#10 +
' FROM `smetasourcedata` `ssd2` '#13#10 +
' where `ssd2`.`sm_id`= :SM_ID '#13#10 +

' union  '#13#10 +

' SELECT '#13#10 +
' 0  as `sm_id1`,'#13#10 +
' 0 as `sm_id2`, '#13#10 +
' `ssd2`.`sm_id` as `sm_id3`,'#13#10 +
' ""  as `name`, '#13#10 +
' ""  as `name_o`, '#13#10 +
' `ssd2`.`name` as `name_l`, '#13#10 +
' "" as `sm_number`, '#13#10 +
' "" as `sm_number1`,'#13#10 +
' `ssd2`.`sm_number` as `sm_number2`, '#13#10 +
' "1-3" as MAT_CODE, '#13#10 +
' "ЗАТРАТЫ ТРУДА МАШИНИСТОВ" as `MAT_NAME`, '#13#10 +
' "чел/ч" as `MAT_UNIT`,'#13#10 +
' ssd2.s_trud_mash as `MAT_COUNT` '#13#10 +
' FROM `smetasourcedata` `ssd2`'#13#10 +
' where `ssd2`.`sm_id`= :SM_ID '#13#10 +

' union  '#13#10 +

' SELECT '#13#10 +
' 0 as `sm_id1`, '#13#10 +
' 0 as `sm_id2`,'#13#10 +
' `ssd2`.`sm_id` as `sm_id3`,'#13#10 +
' ""  as `name`, '#13#10 +
' "" as `name_o`,'#13#10 +
' `ssd2`.`name` as `name_l`,'#13#10 +
' "" as `sm_number`,'#13#10 +
' "" as `sm_number1`,'#13#10 +
' `ssd2`.`sm_number` as `sm_number2`, '#13#10 +
' `mch`.`MECH_CODE` as `MAT_CODE`, '#13#10 +
' UCASE(`mch`.`MECH_NAME`) as `MAT_NAME`, '#13#10 +
' `mch`.`MECH_UNIT`,   '#13#10 +
' sum(`mch`.`MECH_COUNT`) as `MAT_COUNT` '#13#10 +
' FROM `smetasourcedata` `ssd2`'#13#10 +
' INNER JOIN `data_row` `de` ON `de`.`ID_ESTIMATE` = `ssd2`.`SM_ID`     AND `de`.`ID_TYPE_DATA` IN (1, 2, 5) '#13#10 +
' INNER JOIN `card_rate` `cr` ON `cr`.`ID` = `de`.`ID_TABLES` '#13#10 +
' INNER JOIN `mechanizmcard` `mch` ON `mch`.`ID_CARD_RATE` = `cr`.`ID` '#13#10 +
' WHERE (`ssd2`.`SM_ID` =  :SM_ID) AND (`ssd2`.`SM_TYPE` = 3) AND (`de`.`ID_ACT` is NULL) '#13#10 +
' group by `sm_id3`,`MECH_CODE` ) sm  order by `sm_id2`,`sm_id3`,`MAT_CODE`;';
qVED_OBRAB_RASHRES_SMET.ParamByName('SM_ID').AsInteger := SM_ID ;
 CloseOpen(qVED_OBRAB_RASHRES_SMET);

  try
    frxReport.PrepareReport;
    frxReport.ShowPreparedReport;
  except
    ShowMessage('Ошибка при формировании отчета');
  end;
end;

// отчет Расчет заработной платы рабочих по объекту (Вадим)
procedure TdmReportF.Report_ZP_OBJ(SM_ID: integer; FileReportPath: string);
var
  SM_ID_ROOT: integer;
begin
  // поиск корня по ветке
  qrTMP.SQL.Text := 'select IF(`ssd`.`PARENT_ID` = 0, `ssd`.`SM_ID`,'#13#10 +
                    '          (select IF(`ssd1`.`PARENT_ID` = 0, `ssd1`.`SM_ID`,'#13#10 +
                  	'                     (select IF(`ssd2`.`PARENT_ID` = 0, `ssd2`.`SM_ID`, NULL)'#13#10 +
                    '                      from `smetasourcedata` `ssd2`'#13#10 +
                    '               	  	 where `ssd2`.`SM_ID` = `ssd1`.`PARENT_ID`))'#13#10 +
                    '     		  from `smetasourcedata` `ssd1`'#13#10 +
		                '           where `ssd1`.`SM_ID` = `ssd`.`PARENT_ID`)) `SM_ID_ROOT`'#13#10 +
                    'from `smetasourcedata` `ssd`'#13#10 +
                    'where `ssd`.`SM_ID` = :SM_ID';

  qrTMP.ParamByName('SM_ID').AsInteger := SM_ID;
  CloseOpen(qrTMP);
  SM_ID_ROOT := qrTMP.FieldByName('SM_ID_ROOT').AsInteger;

  qrTMP.Close;
  qrTMP.SQL.Text := 'select CONCAT(`oc`.`NUM`, '' '', `oc`.`NAME`) `NAME`,'#13#10 +
                    '       IFNULL(`s`.`MONAT`, 0) `MONTH`,'#13#10 +
                    '       IFNULL(`s`.`YEAR`, 0) `YEAR`,'#13#10 +
                    '       IF(`os`.`OBJ_REGION` = 3, `s`.`STAVKA_M_RAB`, `s`.`STAVKA_RB_RAB`) `TARIF`,'#13#10 +
                    '       `ssd`.`PREPARER`,'#13#10 +
                    '       `ssd`.`POST_PREPARER`,'#13#10 +
                    '       `ssd`.`EXAMINER`,'#13#10 +
                    '       `ssd`.`POST_EXAMINER`'#13#10 +
                    'from `smetasourcedata` `ssd`'#13#10 +
                    'inner join `stavka` `s` on `s`.`STAVKA_ID` = `ssd`.`STAVKA_ID`'#13#10 +
                    'inner join `objcards` `oc` on `oc`.`OBJ_ID` = `ssd`.`OBJ_ID`'#13#10 +
                    'inner join `objstroj` `os` on `os`.`STROJ_ID` = `oc`.`STROJ_ID`'#13#10 +
                    'where `ssd`.`SM_ID` = :SM_ID';
  qrTMP.ParamByName('SM_ID').AsInteger := SM_ID_ROOT;
  CloseOpen(qrTMP);

  qrZP_OBJ.ParamByName('SM_ID').AsInteger := SM_ID_ROOT;
  qrZP_OBJ.ParamByName('MONTH').AsInteger := qrTMP.FieldByName('MONTH').AsInteger;
  qrZP_OBJ.ParamByName('YEAR').AsInteger := qrTMP.FieldByName('YEAR').AsInteger;
  CloseOpen(qrZP_OBJ);

  frxReport.LoadFromFile(FileReportPath + 'Расчет заработной платы рабочих по объекту.fr3');

  frxReport.Script.Variables['sm_obj_name'] := AnsiUpperCase(qrTMP.FieldByName('NAME').AsString);
  frxReport.Script.Variables['sm_date_dog'] := '1 ' + AnsiUpperCase(arraymes[qrTMP.FieldByName('MONTH').AsInteger, 2]) +
                                               ' ' + IntToStr(qrTMP.FieldByName('YEAR').AsInteger) + ' г.';
  frxReport.Script.Variables['sm_tarif'] := FormatFloat('#,##0', qrTMP.FieldByName('TARIF').AsFloat);

  frxReport.Script.Variables['preparer'] := qrTMP.FieldByName('PREPARER').AsString;
  frxReport.Script.Variables['post_preparer'] := qrTMP.FieldByName('POST_PREPARER').AsString;
  frxReport.Script.Variables['examiner'] := qrTMP.FieldByName('EXAMINER').AsString;
  frxReport.Script.Variables['post_examiner'] := qrTMP.FieldByName('POST_EXAMINER').AsString;

  try
    frxReport.PrepareReport;
    frxReport.ShowPreparedReport;
  except
    ShowMessage('Ошибка при формировании отчета');
  end;

  qrTMP.Close;
end;

// отчет Расчет заработной платы рабочих по акту (Вадим)  v1.01
procedure TdmReportF.Report_ZP_OBJ_ACT(ID_ACT: integer; FileReportPath: string);
begin
  qrTMP.SQL.Text := 'select CONCAT(`oc`.`NUM`, " ", `oc`.`NAME`) `NAME`,'#13#10 +
                    '       IFNULL(`s`.`MONAT`, 0) `MONTH`,'#13#10 +
                    '       IFNULL(`s`.`YEAR`, 0) `YEAR`,'#13#10 +
                    '       IF(`os`.`OBJ_REGION` = 3, `s`.`STAVKA_M_RAB`, `s`.`STAVKA_RB_RAB`) `TARIF`,'#13#10 +
                    '       `ca`.`NAME` `ACT_NAME`'#13#10 +
                    'from `smetasourcedata` as `ssd`'#13#10 +
                    'inner join `objcards` `oc` on `oc`.`OBJ_ID` = `ssd`.`OBJ_ID`'#13#10 +
                    'inner join `objstroj` `os` on `os`.`STROJ_ID` = `oc`.`STROJ_ID`'#13#10 +
                    'inner join `stavka` `s` on `s`.`STAVKA_ID` = `ssd`.`STAVKA_ID`'#13#10 +
	          				'inner join `card_acts` `ca` on `ca`.`ID_ESTIMATE_OBJECT` = `ssd`.`SM_ID`'#13#10 +
                    'WHERE `ca`.`ID` = :ID_ACT';
  qrTMP.ParamByName('ID_ACT').AsInteger := ID_ACT;
  CloseOpen(qrTMP);

  qrZP_OBJ_ACT.ParamByName('ID_ACT').AsInteger := ID_ACT;
  qrZP_OBJ_ACT.ParamByName('MONTH').AsInteger := qrTMP.FieldByName('MONTH').AsInteger;
  qrZP_OBJ_ACT.ParamByName('YEAR').AsInteger := qrTMP.FieldByName('YEAR').AsInteger;
  CloseOpen(qrZP_OBJ_ACT);

  frxReport.LoadFromFile(FileReportPath + 'Расчет заработной платы рабочих по акту.fr3');

  frxReport.Script.Variables['act_obj_name'] := AnsiUpperCase(qrTMP.FieldByName('NAME').AsString);
  frxReport.Script.Variables['act_date_dog'] := '1 ' + AnsiUpperCase(arraymes[qrTMP.FieldByName('MONTH').AsInteger, 2]) +
                                               ' ' + IntToStr(qrTMP.FieldByName('YEAR').AsInteger) + ' г.';
  frxReport.Script.Variables['act_tarif'] := FormatFloat('#,##0', qrTMP.FieldByName('TARIF').AsFloat);
  frxReport.Script.Variables['act_number'] := qrTMP.FieldByName('ACT_NAME').AsString;
  frxReport.Script.Variables['contractor_dolg'] := '';
  frxReport.Script.Variables['contractor_fio'] := '';
  frxReport.Script.Variables['customer_dolg'] := '';
  frxReport.Script.Variables['customer_fio'] := '';
  try
    frxReport.PrepareReport;
    frxReport.ShowPreparedReport;
  except
    ShowMessage('Ошибка при формировании отчета');
  end;

  qrTMP.Close;
end;

// отчет по Акт списания материалов С-29 (Вадим) v1.02
procedure TdmReportF.Report_RASX_MAT(ID_ACT: integer; FileReportPath: string);
begin
  qrTMP.SQL.Text := 'SELECT CONCAT(`oc`.`NUM`, " ", `oc`.`NAME`) `NAME`,'#13#10 +
                    '       IFNULL(`s`.`MONAT`, 0) `MONTH`,'#13#10 +
                    '       IFNULL(`s`.`YEAR`, 0) `YEAR`,'#13#10 +
                    '       IF(`os`.`OBJ_REGION` = 3, `s`.`STAVKA_M_RAB`, `s`.`STAVKA_RB_RAB`) `TARIF`,'#13#10 +
                    '       `ca`.`NAME` `ACT_NAME`,'#13#10 +
                    '       `d`.`DUMP_NAME`'#13#10 +
                    'FROM `smetasourcedata` `ssd`'#13#10 +
                    'inner join `objcards` `oc` on `oc`.`OBJ_ID` = `ssd`.`OBJ_ID`'#13#10 +
                    'inner join `objstroj` `os` on `os`.`STROJ_ID` = `oc`.`STROJ_ID`'#13#10 +
                    'inner join `stavka` `s` on `s`.`STAVKA_ID` = `ssd`.`STAVKA_ID`'#13#10 +
	          				'inner join `card_acts` `ca` on `ca`.`ID_ESTIMATE_OBJECT` = `ssd`.`SM_ID`'#13#10 +
                    'left join `dump` `d` on `d`.`DUMP_ID` = `ssd`.`DUMP_ID`'#13#10 +
                    'WHERE `ca`.`ID` = :ID_ACT';
  qrTMP.ParamByName('ID_ACT').AsInteger := ID_ACT;
  CloseOpen(qrTMP);

  qrRASX_MAT.ParamByName('ID_ACT').AsInteger := ID_ACT;
  qrRASX_MAT2.ParamByName('ID_ACT').AsInteger := ID_ACT;

  frxReport.LoadFromFile(FileReportPath + 'Акт списания материалов С-29.fr3');

  frxReport.Script.Variables['name_org'] := qrTMP.FieldByName('DUMP_NAME').AsString;
  frxReport.Script.Variables['name_obj'] := AnsiUpperCase(qrTMP.FieldByName('NAME').AsString);
  frxReport.Script.Variables['data_act'] := AnsiUpperCase(arraymes[qrTMP.FieldByName('MONTH').AsInteger, 1]) +
                                    ' ' + IntToStr(qrTMP.FieldByName('YEAR').AsInteger) + ' г.';

  frxReport.Script.Variables['num_act'] := qrTMP.FieldByName('ACT_NAME').AsString;
  try
    frxReport.PrepareReport;
    frxReport.ShowPreparedReport;
  except
    ShowMessage('Ошибка при формировании отчета');
  end;

  qrTMP.Close;
end;

// --> "СМЕТА по объекту строительства" v.1.03
procedure TdmReportF.Report_SMETA_OBJ_BUILD(SM_ID: Integer; FileReportPath: string;
                                             param4: Double;
                                             param5: Double;
                                             param6: Double;
                                             param7: Double;
                                             param8: Double;
                                             param9: Double;
                                             param10: Double;
                                             param11: Double;
                                             param12: Double;
                                             param13: Double;
                                             param14: Double;
                                             param15: Double;
                                             param16: Double;
                                             param17: Double;
                                             param18: Double;
                                             param19: Double;
                                             param20: Double;
                                             param21: Double;
                                             param22: Double;
                                             param23: Double
                                           );

  // как временное решение для неизвестных строк в графе С
  {
   param4 - в т.ч. Дополнительная зарплата по Постановлению №5
   param5 - Сметная стоимость материалов с учетом прогнозного индекса
   param6 - в т.ч.  сметные материалы подрядчика c учетом прогнозного индекса
   param7 - .         сметные материалы заказчика с учетом прогнозного индекса
   param8 - Отклонение в стоимости материалов (факт-смета)
   param9 - в т.ч.  отклонение в стоимости материалов подрядчика
   param10 - .         отклонение в стоимости материалов заказчика
   param11 - Hепредвиденные затраты
   param12 - Pазъездной характер работ
   param13 - Перевозка рабочих
   param14 - Командировочные расходы
   param15 - Hалоги и отчисления, уплачиваемые подрядчиком и относимые на расходы по текущей деятельности
   param16 - Коэффициент, учитывающий применение прогнозного индекса цен в строительстве
   param17 - Отклонение в стоимости, в том числе:
   param18 - -  Отклонение в стоимости эксплуатации машин и механизмов
   param19 - -  Отклонение в стоимости материалов
   param20 - -  Отклонение в стоимости транспорта
   param21 - -  Отклонение в стоимости прочих затрат
   param22 - -  Отклонение в стоимости налогов и отчислений, уплачиваемых подрядчиком
   param23 - Mатериалы заказчика  (Mат+Tрансп+ЗCP) (-)
  }

var
  SM_ID_ROOT: integer;
begin
  // поиск корня по ветке
  qrTMP.SQL.Text := 'select IF(`ssd`.`PARENT_ID` = 0, `ssd`.`SM_ID`,'#13#10 +
                    '          (select IF(`ssd1`.`PARENT_ID` = 0, `ssd1`.`SM_ID`,'#13#10 +
                  	'                     (select IF(`ssd2`.`PARENT_ID` = 0, `ssd2`.`SM_ID`, NULL)'#13#10 +
                    '                      from `smetasourcedata` `ssd2`'#13#10 +
                    '               	  	 where `ssd2`.`SM_ID` = `ssd1`.`PARENT_ID`))'#13#10 +
                    '     		  from `smetasourcedata` `ssd1`'#13#10 +
		                '           where `ssd1`.`SM_ID` = `ssd`.`PARENT_ID`)) `SM_ID_ROOT`'#13#10 +
                    'from `smetasourcedata` `ssd`'#13#10 +
                    'where `ssd`.`SM_ID` = :SM_ID';

  qrTMP.ParamByName('SM_ID').AsInteger := SM_ID;
  CloseOpen(qrTMP);
  SM_ID_ROOT := qrTMP.FieldByName('SM_ID_ROOT').AsInteger;
  // берем инфу для шапки
  qrTMP.Close;
  qrTMP.SQL.Text := 'select CONCAT(`oc`.`NUM`, '' '', `oc`.`NAME`) `NAME`,'#13#10 +
                    '       IFNULL(`s`.`MONAT`, 0) `MONTH`,'#13#10 +
                    '       IFNULL(`s`.`YEAR`, 0) `YEAR`,'#13#10 +
                    '       IF(`os`.`OBJ_REGION` = 3, `s`.`STAVKA_M_RAB`, `s`.`STAVKA_RB_RAB`) `TARIF`,'#13#10 +
                    '       `or`.`REGION`,'#13#10 +
                    '       `ssd`.`PREPARER`,'#13#10 +
                    '       `ssd`.`POST_PREPARER`,'#13#10 +
                    '       `ssd`.`EXAMINER`,'#13#10 +
                    '       `ssd`.`POST_EXAMINER`,'#13#10 +
                    '      	(SELECT `FULL_NAME` FROM `clients` WHERE `CLIENT_ID` = `oc`.`CUST_ID`) `CUSTOMER`,'#13#10 +
                    '      	(SELECT `FULL_NAME` FROM `clients` WHERE `CLIENT_ID` = `oc`.`GENERAL_ID`) `GENERAL`'#13#10 +
                    'from `smetasourcedata` `ssd`'#13#10 +
                    'inner join `stavka` `s` on `s`.`STAVKA_ID` = `ssd`.`STAVKA_ID`'#13#10 +
                    'inner join `objcards` `oc` on `oc`.`OBJ_ID` = `ssd`.`OBJ_ID`'#13#10 +
                    'inner join `objstroj` `os` on `os`.`STROJ_ID` = `oc`.`STROJ_ID`'#13#10 +
                    'inner join `objregion` `or` on `or`.`OBJ_REGION_ID` = `os`.`OBJ_REGION`'#13#10 +
                    'where `ssd`.`SM_ID` = :SM_ID';
  qrTMP.ParamByName('SM_ID').AsInteger := SM_ID_ROOT;
  CloseOpen(qrTMP);

  qrSMETA_OBJ_E.ParamByName('SM_ID').AsInteger := SM_ID_ROOT;
  qrSMETA_OBJ_MAT.ParamByName('SM_ID').AsInteger := SM_ID_ROOT;
  qrSMETA_OBJ_MEH.ParamByName('SM_ID').AsInteger := SM_ID_ROOT;
  qrSMETA_OBJ_DEV.ParamByName('SM_ID').AsInteger := SM_ID_ROOT;

//  qrSMETA_OBJ_GraphC.ParamByName('param4').AsFloat := param4;
//  qrSMETA_OBJ_GraphC.ParamByName('param5').AsFloat := param5;
//  qrSMETA_OBJ_GraphC.ParamByName('param6').AsFloat := param6;
//  qrSMETA_OBJ_GraphC.ParamByName('param7').AsFloat := param7;
//  qrSMETA_OBJ_GraphC.ParamByName('param8').AsFloat := param8;
//  qrSMETA_OBJ_GraphC.ParamByName('param9').AsFloat := param9;
//  qrSMETA_OBJ_GraphC.ParamByName('param10').AsFloat := param10;
//  qrSMETA_OBJ_GraphC.ParamByName('param11').AsFloat := param11;
//  qrSMETA_OBJ_GraphC.ParamByName('param12').AsFloat := param12;
//  qrSMETA_OBJ_GraphC.ParamByName('param13').AsFloat := param13;
//  qrSMETA_OBJ_GraphC.ParamByName('param14').AsFloat := param14;
//  qrSMETA_OBJ_GraphC.ParamByName('param15').AsFloat := param15;
//  qrSMETA_OBJ_GraphC.ParamByName('param16').AsFloat := param16;
//  qrSMETA_OBJ_GraphC.ParamByName('param17').AsFloat := param17;
//  qrSMETA_OBJ_GraphC.ParamByName('param18').AsFloat := param18;
//  qrSMETA_OBJ_GraphC.ParamByName('param19').AsFloat := param19;
//  qrSMETA_OBJ_GraphC.ParamByName('param20').AsFloat := param20;
//  qrSMETA_OBJ_GraphC.ParamByName('param21').AsFloat := param21;
//  qrSMETA_OBJ_GraphC.ParamByName('param22').AsFloat := param22;
//  qrSMETA_OBJ_GraphC.ParamByName('param23').AsFloat := param23;

  qrSMETA_OBJ_GraphC.ParamByName('SM_ID').AsInteger := SM_ID_ROOT;

  frxReport.LoadFromFile(FileReportPath + 'СМЕТА по объекту строительства.fr3');

  frxReport.Script.Variables['sm_obj_name'] := AnsiUpperCase(qrTMP.FieldByName('NAME').AsString);
  frxReport.Script.Variables['date_sost'] := '1 ' + AnsiUpperCase(arraymes[qrTMP.FieldByName('MONTH').AsInteger, 2]) +
                                               ' ' + qrTMP.FieldByName('YEAR').AsString + ' г.';
  frxReport.Script.Variables['cust_name'] := qrTMP.FieldByName('CUSTOMER').AsString;
  frxReport.Script.Variables['podr_name'] := qrTMP.FieldByName('GENERAL').AsString;

  frxReport.Script.Variables['reg_build'] := qrTMP.FieldByName('REGION').AsString;
  frxReport.Script.Variables['sm_tarif'] := FormatFloat('#,##0', qrTMP.FieldByName('TARIF').AsFloat);

  frxReport.Script.Variables['preparer'] := qrTMP.FieldByName('PREPARER').AsString;
  frxReport.Script.Variables['post_preparer'] := qrTMP.FieldByName('POST_PREPARER').AsString;
  frxReport.Script.Variables['examiner'] := qrTMP.FieldByName('EXAMINER').AsString;
  frxReport.Script.Variables['post_examiner'] := qrTMP.FieldByName('POST_EXAMINER').AsString;

  try
    frxReport.PrepareReport;
    frxReport.ShowPreparedReport;
  except
    ShowMessage('Ошибка при формировании отчета');
  end;

  qrTMP.Close;
end;
// <-- "СМЕТА по объекту строительства" v.1.03

// Смета (Локальный сметный расчет) по объекту v1.00 (Вадим)
procedure TdmReportF.Report_SMETA_LSR_FROM_OBJ(SM_ID: integer; FileReportPath: string);
var
  SM_ID_ROOT: integer;
begin
  // поиск корня по ветке
  qrTMP.SQL.Text := 'select IF(`ssd`.`PARENT_ID` = 0, `ssd`.`SM_ID`,'#13#10 +
                    '          (select IF(`ssd1`.`PARENT_ID` = 0, `ssd1`.`SM_ID`,'#13#10 +
                  	'                     (select IF(`ssd2`.`PARENT_ID` = 0, `ssd2`.`SM_ID`, NULL)'#13#10 +
                    '                      from `smetasourcedata` `ssd2`'#13#10 +
                    '               	  	 where `ssd2`.`SM_ID` = `ssd1`.`PARENT_ID`))'#13#10 +
                    '     		  from `smetasourcedata` `ssd1`'#13#10 +
		                '           where `ssd1`.`SM_ID` = `ssd`.`PARENT_ID`)) `SM_ID_ROOT`'#13#10 +
                    'from `smetasourcedata` `ssd`'#13#10 +
                    'where `ssd`.`SM_ID` = :SM_ID';

  qrTMP.ParamByName('SM_ID').AsInteger := SM_ID;
  CloseOpen(qrTMP);
  SM_ID_ROOT := qrTMP.FieldByName('SM_ID_ROOT').AsInteger;
  // берем инфу для шапки
  qrTMP.Close;
  qrTMP.SQL.Text := 'select CONCAT(`oc`.`NUM`, '' '', `oc`.`NAME`) `NAME`,'#13#10 +
                    '       IFNULL(`s`.`MONAT`, 0) `MONTH`,'#13#10 +
                    '       IFNULL(`s`.`YEAR`, 0) `YEAR`,'#13#10 +
                    '       IF(`os`.`OBJ_REGION` = 3, `s`.`STAVKA_M_RAB`, `s`.`STAVKA_RB_RAB`) `TARIF`,'#13#10 +
                    '       `or`.`REGION`,'#13#10 +
                    '       `ssd`.`PREPARER`,'#13#10 +
                    '       `ssd`.`POST_PREPARER`,'#13#10 +
                    '       `ssd`.`EXAMINER`,'#13#10 +
                    '       `ssd`.`POST_EXAMINER`,'#13#10 +
                    '      	(SELECT `FULL_NAME` FROM `clients` WHERE `CLIENT_ID` = `oc`.`CUST_ID`) `CUSTOMER`,'#13#10 +
                    '      	(SELECT `FULL_NAME` FROM `clients` WHERE `CLIENT_ID` = `oc`.`GENERAL_ID`) `GENERAL`'#13#10 +
                    'from `smetasourcedata` `ssd`'#13#10 +
                    'inner join `stavka` `s` on `s`.`STAVKA_ID` = `ssd`.`STAVKA_ID`'#13#10 +
                    'inner join `objcards` `oc` on `oc`.`OBJ_ID` = `ssd`.`OBJ_ID`'#13#10 +
                    'inner join `objstroj` `os` on `os`.`STROJ_ID` = `oc`.`STROJ_ID`'#13#10 +
                    'inner join `objregion` `or` on `or`.`OBJ_REGION_ID` = `os`.`OBJ_REGION`'#13#10 +
                    'where `ssd`.`SM_ID` = :SM_ID';
  qrTMP.ParamByName('SM_ID').AsInteger := SM_ID_ROOT;
  CloseOpen(qrTMP);

  qrSMETA_OBJ_E.ParamByName('SM_ID').AsInteger := SM_ID_ROOT;

  frxReport.LoadFromFile(FileReportPath + 'Смета (Локальный сметный расчет) по объекту.fr3');

  frxReport.Script.Variables['sm_obj_name'] := AnsiUpperCase(qrTMP.FieldByName('NAME').AsString);
  frxReport.Script.Variables['date_sost'] := '1 ' + AnsiUpperCase(arraymes[qrTMP.FieldByName('MONTH').AsInteger, 2]) +
                                               ' ' + qrTMP.FieldByName('YEAR').AsString + ' г.';
  frxReport.Script.Variables['cust_name'] := qrTMP.FieldByName('CUSTOMER').AsString;
  frxReport.Script.Variables['podr_name'] := qrTMP.FieldByName('GENERAL').AsString;

  frxReport.Script.Variables['reg_build'] := qrTMP.FieldByName('REGION').AsString;
  frxReport.Script.Variables['sm_tarif'] := FormatFloat('#,##0', qrTMP.FieldByName('TARIF').AsFloat);

  frxReport.Script.Variables['preparer'] := qrTMP.FieldByName('PREPARER').AsString;
  frxReport.Script.Variables['post_preparer'] := qrTMP.FieldByName('POST_PREPARER').AsString;
  frxReport.Script.Variables['examiner'] := qrTMP.FieldByName('EXAMINER').AsString;
  frxReport.Script.Variables['post_examiner'] := qrTMP.FieldByName('POST_EXAMINER').AsString;

  try
    frxReport.PrepareReport;
    frxReport.ShowPreparedReport;
  except
    ShowMessage('Ошибка при формировании отчета');
  end;

  qrTMP.Close;
end;

// Смета (Локальный сметный расчет) с зимними v1.00 (Вадим)
procedure TdmReportF.Report_SMETA_LSR_ZIM(SM_ID: integer;FileReportPath: string);
var
  SM_ID_ROOT: integer;
begin
  // поиск корня по ветке
  qrTMP.SQL.Text := 'select IF(`ssd`.`PARENT_ID` = 0, `ssd`.`SM_ID`,'#13#10 +
                    '          (select IF(`ssd1`.`PARENT_ID` = 0, `ssd1`.`SM_ID`,'#13#10 +
                  	'                     (select IF(`ssd2`.`PARENT_ID` = 0, `ssd2`.`SM_ID`, NULL)'#13#10 +
                    '                      from `smetasourcedata` `ssd2`'#13#10 +
                    '               	  	 where `ssd2`.`SM_ID` = `ssd1`.`PARENT_ID`))'#13#10 +
                    '     		  from `smetasourcedata` `ssd1`'#13#10 +
		                '           where `ssd1`.`SM_ID` = `ssd`.`PARENT_ID`)) `SM_ID_ROOT`'#13#10 +
                    'from `smetasourcedata` `ssd`'#13#10 +
                    'where `ssd`.`SM_ID` = :SM_ID';

  qrTMP.ParamByName('SM_ID').AsInteger := SM_ID;
  CloseOpen(qrTMP);
  SM_ID_ROOT := qrTMP.FieldByName('SM_ID_ROOT').AsInteger;
  // берем инфу для шапки
  qrTMP.Close;
  qrTMP.SQL.Text := 'select CONCAT(`oc`.`NUM`, '' '', `oc`.`NAME`) `NAME`,'#13#10 +
                    '       IFNULL(`s`.`MONAT`, 0) `MONTH`,'#13#10 +
                    '       IFNULL(`s`.`YEAR`, 0) `YEAR`,'#13#10 +
                    '       IF(`os`.`OBJ_REGION` = 3, `s`.`STAVKA_M_RAB`, `s`.`STAVKA_RB_RAB`) `TARIF`,'#13#10 +
                    '       `or`.`REGION`,'#13#10 +
                    '       `ssd`.`PREPARER`,'#13#10 +
                    '       `ssd`.`POST_PREPARER`,'#13#10 +
                    '       `ssd`.`EXAMINER`,'#13#10 +
                    '       `ssd`.`POST_EXAMINER`,'#13#10 +
                    '      	(SELECT `FULL_NAME` FROM `clients` WHERE `CLIENT_ID` = `oc`.`CUST_ID`) `CUSTOMER`,'#13#10 +
                    '      	(SELECT `FULL_NAME` FROM `clients` WHERE `CLIENT_ID` = `oc`.`GENERAL_ID`) `GENERAL`'#13#10 +
                    'from `smetasourcedata` `ssd`'#13#10 +
                    'inner join `stavka` `s` on `s`.`STAVKA_ID` = `ssd`.`STAVKA_ID`'#13#10 +
                    'inner join `objcards` `oc` on `oc`.`OBJ_ID` = `ssd`.`OBJ_ID`'#13#10 +
                    'inner join `objstroj` `os` on `os`.`STROJ_ID` = `oc`.`STROJ_ID`'#13#10 +
                    'inner join `objregion` `or` on `or`.`OBJ_REGION_ID` = `os`.`OBJ_REGION`'#13#10 +
                    'where `ssd`.`SM_ID` = :SM_ID';
  qrTMP.ParamByName('SM_ID').AsInteger := SM_ID_ROOT;
  CloseOpen(qrTMP);

  qrSMETA_OBJ_E.ParamByName('SM_ID').AsInteger := SM_ID_ROOT;

  frxReport.LoadFromFile(FileReportPath + 'Смета (Локальный сметный расчет) с зимними.fr3');

  frxReport.Script.Variables['sm_obj_name'] := AnsiUpperCase(qrTMP.FieldByName('NAME').AsString);
  frxReport.Script.Variables['date_sost'] := '1 ' + AnsiUpperCase(arraymes[qrTMP.FieldByName('MONTH').AsInteger, 2]) +
                                               ' ' + qrTMP.FieldByName('YEAR').AsString + ' г.';
  frxReport.Script.Variables['cust_name'] := qrTMP.FieldByName('CUSTOMER').AsString;
  frxReport.Script.Variables['podr_name'] := qrTMP.FieldByName('GENERAL').AsString;

  frxReport.Script.Variables['reg_build'] := qrTMP.FieldByName('REGION').AsString;
  frxReport.Script.Variables['sm_tarif'] := FormatFloat('#,##0', qrTMP.FieldByName('TARIF').AsFloat);

  frxReport.Script.Variables['preparer'] := qrTMP.FieldByName('PREPARER').AsString;
  frxReport.Script.Variables['post_preparer'] := qrTMP.FieldByName('POST_PREPARER').AsString;
  frxReport.Script.Variables['examiner'] := qrTMP.FieldByName('EXAMINER').AsString;
  frxReport.Script.Variables['post_examiner'] := qrTMP.FieldByName('POST_EXAMINER').AsString;

  try
    frxReport.PrepareReport;
    frxReport.ShowPreparedReport;
  except
    ShowMessage('Ошибка при формировании отчета');
  end;

  qrTMP.Close;
end;

// Смета (Локальный сметный расчет) с трудозатратами по объекту v1.00 (Вадим)
procedure TdmReportF.Report_SMETA_LSR_TRUD(SM_ID: integer;FileReportPath: string);
var
  SM_ID_ROOT: integer;
begin
  // поиск корня по ветке
  qrTMP.SQL.Text := 'select IF(`ssd`.`PARENT_ID` = 0, `ssd`.`SM_ID`,'#13#10 +
                    '          (select IF(`ssd1`.`PARENT_ID` = 0, `ssd1`.`SM_ID`,'#13#10 +
                  	'                     (select IF(`ssd2`.`PARENT_ID` = 0, `ssd2`.`SM_ID`, NULL)'#13#10 +
                    '                      from `smetasourcedata` `ssd2`'#13#10 +
                    '               	  	 where `ssd2`.`SM_ID` = `ssd1`.`PARENT_ID`))'#13#10 +
                    '     		  from `smetasourcedata` `ssd1`'#13#10 +
		                '           where `ssd1`.`SM_ID` = `ssd`.`PARENT_ID`)) `SM_ID_ROOT`'#13#10 +
                    'from `smetasourcedata` `ssd`'#13#10 +
                    'where `ssd`.`SM_ID` = :SM_ID';

  qrTMP.ParamByName('SM_ID').AsInteger := SM_ID;
  CloseOpen(qrTMP);
  SM_ID_ROOT := qrTMP.FieldByName('SM_ID_ROOT').AsInteger;
  // берем инфу для шапки
  qrTMP.Close;
  qrTMP.SQL.Text := 'select CONCAT(`oc`.`NUM`, '' '', `oc`.`NAME`) `NAME`,'#13#10 +
                    '       IFNULL(`s`.`MONAT`, 0) `MONTH`,'#13#10 +
                    '       IFNULL(`s`.`YEAR`, 0) `YEAR`,'#13#10 +
                    '       IF(`os`.`OBJ_REGION` = 3, `s`.`STAVKA_M_RAB`, `s`.`STAVKA_RB_RAB`) `TARIF`,'#13#10 +
                    '       `or`.`REGION`,'#13#10 +
                    '       `ssd`.`PREPARER`,'#13#10 +
                    '       `ssd`.`POST_PREPARER`,'#13#10 +
                    '       `ssd`.`EXAMINER`,'#13#10 +
                    '       `ssd`.`POST_EXAMINER`,'#13#10 +
                    '      	(SELECT `FULL_NAME` FROM `clients` WHERE `CLIENT_ID` = `oc`.`CUST_ID`) `CUSTOMER`,'#13#10 +
                    '      	(SELECT `FULL_NAME` FROM `clients` WHERE `CLIENT_ID` = `oc`.`GENERAL_ID`) `GENERAL`'#13#10 +
                    'from `smetasourcedata` `ssd`'#13#10 +
                    'inner join `stavka` `s` on `s`.`STAVKA_ID` = `ssd`.`STAVKA_ID`'#13#10 +
                    'inner join `objcards` `oc` on `oc`.`OBJ_ID` = `ssd`.`OBJ_ID`'#13#10 +
                    'inner join `objstroj` `os` on `os`.`STROJ_ID` = `oc`.`STROJ_ID`'#13#10 +
                    'inner join `objregion` `or` on `or`.`OBJ_REGION_ID` = `os`.`OBJ_REGION`'#13#10 +
                    'where `ssd`.`SM_ID` = :SM_ID';
  qrTMP.ParamByName('SM_ID').AsInteger := SM_ID_ROOT;
  CloseOpen(qrTMP);

  qrSMETA_OBJ_E.ParamByName('SM_ID').AsInteger := SM_ID_ROOT;

  frxReport.LoadFromFile(FileReportPath + 'Смета (Локальный сметный расчет) с трудозатратами по объекту.fr3');

  frxReport.Script.Variables['sm_obj_name'] := AnsiUpperCase(qrTMP.FieldByName('NAME').AsString);
  frxReport.Script.Variables['date_sost'] := '1 ' + AnsiUpperCase(arraymes[qrTMP.FieldByName('MONTH').AsInteger, 2]) +
                                               ' ' + qrTMP.FieldByName('YEAR').AsString + ' г.';
  frxReport.Script.Variables['cust_name'] := qrTMP.FieldByName('CUSTOMER').AsString;
  frxReport.Script.Variables['podr_name'] := qrTMP.FieldByName('GENERAL').AsString;

  frxReport.Script.Variables['reg_build'] := qrTMP.FieldByName('REGION').AsString;
  frxReport.Script.Variables['sm_tarif'] := FormatFloat('#,##0', qrTMP.FieldByName('TARIF').AsFloat);

  frxReport.Script.Variables['preparer'] := qrTMP.FieldByName('PREPARER').AsString;
  frxReport.Script.Variables['post_preparer'] := qrTMP.FieldByName('POST_PREPARER').AsString;
  frxReport.Script.Variables['examiner'] := qrTMP.FieldByName('EXAMINER').AsString;
  frxReport.Script.Variables['post_examiner'] := qrTMP.FieldByName('POST_EXAMINER').AsString;

  try
    frxReport.PrepareReport;
    frxReport.ShowPreparedReport;
  except
    ShowMessage('Ошибка при формировании отчета');
  end;

  qrTMP.Close;
end;

// Расчет стоимости работ по объекту (графа С) v1.00 (Вадим)
procedure TdmReportF.Report_CALC_SMETA_OBJ_GRAPH_C(SM_ID: integer;FileReportPath: string);
var
  SM_ID_ROOT: integer;
begin
  // поиск корня по ветке
  qrTMP.SQL.Text := 'select IF(`ssd`.`PARENT_ID` = 0, `ssd`.`SM_ID`,'#13#10 +
                    '          (select IF(`ssd1`.`PARENT_ID` = 0, `ssd1`.`SM_ID`,'#13#10 +
                  	'                     (select IF(`ssd2`.`PARENT_ID` = 0, `ssd2`.`SM_ID`, NULL)'#13#10 +
                    '                      from `smetasourcedata` `ssd2`'#13#10 +
                    '               	  	 where `ssd2`.`SM_ID` = `ssd1`.`PARENT_ID`))'#13#10 +
                    '     		  from `smetasourcedata` `ssd1`'#13#10 +
		                '           where `ssd1`.`SM_ID` = `ssd`.`PARENT_ID`)) `SM_ID_ROOT`'#13#10 +
                    'from `smetasourcedata` `ssd`'#13#10 +
                    'where `ssd`.`SM_ID` = :SM_ID';

  qrTMP.ParamByName('SM_ID').AsInteger := SM_ID;
  CloseOpen(qrTMP);
  SM_ID_ROOT := qrTMP.FieldByName('SM_ID_ROOT').AsInteger;
  // берем инфу для шапки
  qrTMP.Close;
  qrTMP.SQL.Text := 'select CONCAT(`oc`.`NUM`, '' '', `oc`.`NAME`) `NAME`,'#13#10 +
                    '       IFNULL(`s`.`MONAT`, 0) `MONTH`,'#13#10 +
                    '       IFNULL(`s`.`YEAR`, 0) `YEAR`,'#13#10 +
                    '       IF(`os`.`OBJ_REGION` = 3, `s`.`STAVKA_M_RAB`, `s`.`STAVKA_RB_RAB`) `TARIF`,'#13#10 +
                    '       `or`.`REGION`,'#13#10 +
                    '       `ssd`.`PREPARER`,'#13#10 +
                    '       `ssd`.`POST_PREPARER`,'#13#10 +
                    '       `ssd`.`EXAMINER`,'#13#10 +
                    '       `ssd`.`POST_EXAMINER`,'#13#10 +
                    '      	(SELECT `FULL_NAME` FROM `clients` WHERE `CLIENT_ID` = `oc`.`CUST_ID`) `CUSTOMER`,'#13#10 +
                    '      	(SELECT `FULL_NAME` FROM `clients` WHERE `CLIENT_ID` = `oc`.`GENERAL_ID`) `GENERAL`'#13#10 +
                    'from `smetasourcedata` `ssd`'#13#10 +
                    'inner join `stavka` `s` on `s`.`STAVKA_ID` = `ssd`.`STAVKA_ID`'#13#10 +
                    'inner join `objcards` `oc` on `oc`.`OBJ_ID` = `ssd`.`OBJ_ID`'#13#10 +
                    'inner join `objstroj` `os` on `os`.`STROJ_ID` = `oc`.`STROJ_ID`'#13#10 +
                    'inner join `objregion` `or` on `or`.`OBJ_REGION_ID` = `os`.`OBJ_REGION`'#13#10 +
                    'where `ssd`.`SM_ID` = :SM_ID';
  qrTMP.ParamByName('SM_ID').AsInteger := SM_ID_ROOT;
  CloseOpen(qrTMP);

  qrSMETA_OBJ_GraphC.ParamByName('SM_ID').AsInteger := SM_ID_ROOT;

  frxReport.LoadFromFile(FileReportPath + 'Расчет стоимости работ по объекту (графа С).fr3');

  frxReport.Script.Variables['sm_obj_name'] := AnsiUpperCase(qrTMP.FieldByName('NAME').AsString);
  frxReport.Script.Variables['date_sost'] := '1 ' + AnsiUpperCase(arraymes[qrTMP.FieldByName('MONTH').AsInteger, 2]) +
                                               ' ' + qrTMP.FieldByName('YEAR').AsString + ' г.';

  frxReport.Script.Variables['preparer'] := qrTMP.FieldByName('PREPARER').AsString;
  frxReport.Script.Variables['post_preparer'] := qrTMP.FieldByName('POST_PREPARER').AsString;
  frxReport.Script.Variables['examiner'] := qrTMP.FieldByName('EXAMINER').AsString;
  frxReport.Script.Variables['post_examiner'] := qrTMP.FieldByName('POST_EXAMINER').AsString;

  try
    frxReport.PrepareReport;
    frxReport.ShowPreparedReport;
  except
    ShowMessage('Ошибка при формировании отчета');
  end;

  qrTMP.Close;
end;

// Смета (Ресурсно-сметный расчет) по объекту v1.00 (Вадим)
procedure TdmReportF.Report_SMETA_RES_FROM_OBJ(SM_ID: integer;FileReportPath: string);
var
  SM_ID_ROOT: integer;
begin
  // поиск корня по ветке
  qrTMP.SQL.Text := 'select IF(`ssd`.`PARENT_ID` = 0, `ssd`.`SM_ID`,'#13#10 +
                    '          (select IF(`ssd1`.`PARENT_ID` = 0, `ssd1`.`SM_ID`,'#13#10 +
                  	'                     (select IF(`ssd2`.`PARENT_ID` = 0, `ssd2`.`SM_ID`, NULL)'#13#10 +
                    '                      from `smetasourcedata` `ssd2`'#13#10 +
                    '               	  	 where `ssd2`.`SM_ID` = `ssd1`.`PARENT_ID`))'#13#10 +
                    '     		  from `smetasourcedata` `ssd1`'#13#10 +
		                '           where `ssd1`.`SM_ID` = `ssd`.`PARENT_ID`)) `SM_ID_ROOT`'#13#10 +
                    'from `smetasourcedata` `ssd`'#13#10 +
                    'where `ssd`.`SM_ID` = :SM_ID';

  qrTMP.ParamByName('SM_ID').AsInteger := SM_ID;
  CloseOpen(qrTMP);
  SM_ID_ROOT := qrTMP.FieldByName('SM_ID_ROOT').AsInteger;
  // берем инфу для шапки
  qrTMP.Close;
  qrTMP.SQL.Text := 'select CONCAT(`oc`.`NUM`, '' '', `oc`.`NAME`) `NAME`,'#13#10 +
                    '       IFNULL(`s`.`MONAT`, 0) `MONTH`,'#13#10 +
                    '       IFNULL(`s`.`YEAR`, 0) `YEAR`,'#13#10 +
                    '       IF(`os`.`OBJ_REGION` = 3, `s`.`STAVKA_M_RAB`, `s`.`STAVKA_RB_RAB`) `TARIF`,'#13#10 +
                    '       `or`.`REGION`,'#13#10 +
                    '       `ssd`.`PREPARER`,'#13#10 +
                    '       `ssd`.`POST_PREPARER`,'#13#10 +
                    '       `ssd`.`EXAMINER`,'#13#10 +
                    '       `ssd`.`POST_EXAMINER`,'#13#10 +
                    '      	(SELECT `FULL_NAME` FROM `clients` WHERE `CLIENT_ID` = `oc`.`CUST_ID`) `CUSTOMER`,'#13#10 +
                    '      	(SELECT `FULL_NAME` FROM `clients` WHERE `CLIENT_ID` = `oc`.`GENERAL_ID`) `GENERAL`'#13#10 +
                    'from `smetasourcedata` `ssd`'#13#10 +
                    'inner join `stavka` `s` on `s`.`STAVKA_ID` = `ssd`.`STAVKA_ID`'#13#10 +
                    'inner join `objcards` `oc` on `oc`.`OBJ_ID` = `ssd`.`OBJ_ID`'#13#10 +
                    'inner join `objstroj` `os` on `os`.`STROJ_ID` = `oc`.`STROJ_ID`'#13#10 +
                    'inner join `objregion` `or` on `or`.`OBJ_REGION_ID` = `os`.`OBJ_REGION`'#13#10 +
                    'where `ssd`.`SM_ID` = :SM_ID';
  qrTMP.ParamByName('SM_ID').AsInteger := SM_ID_ROOT;
  CloseOpen(qrTMP);

  qrSMETA_OBJ_E.ParamByName('SM_ID').AsInteger := SM_ID_ROOT;

  frxReport.LoadFromFile(FileReportPath + 'Смета (Ресурсно-сметный расчет) по объекту.fr3');

  frxReport.Script.Variables['sm_obj_name'] := AnsiUpperCase(qrTMP.FieldByName('NAME').AsString);
  frxReport.Script.Variables['date_sost'] := '1 ' + AnsiUpperCase(arraymes[qrTMP.FieldByName('MONTH').AsInteger, 2]) +
                                               ' ' + qrTMP.FieldByName('YEAR').AsString + ' г.';
  frxReport.Script.Variables['cust_name'] := qrTMP.FieldByName('CUSTOMER').AsString;
  frxReport.Script.Variables['podr_name'] := qrTMP.FieldByName('GENERAL').AsString;

  frxReport.Script.Variables['reg_build'] := qrTMP.FieldByName('REGION').AsString;
  frxReport.Script.Variables['sm_tarif'] := FormatFloat('#,##0', qrTMP.FieldByName('TARIF').AsFloat);

  frxReport.Script.Variables['preparer'] := qrTMP.FieldByName('PREPARER').AsString;
  frxReport.Script.Variables['post_preparer'] := qrTMP.FieldByName('POST_PREPARER').AsString;
  frxReport.Script.Variables['examiner'] := qrTMP.FieldByName('EXAMINER').AsString;
  frxReport.Script.Variables['post_examiner'] := qrTMP.FieldByName('POST_EXAMINER').AsString;

  try
    frxReport.PrepareReport;
    frxReport.ShowPreparedReport;
  except
    ShowMessage('Ошибка при формировании отчета');
  end;

  qrTMP.Close;
end;

end.
