unit KC6Journal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Mask, Vcl.DBCtrls,
  Vcl.ButtonGroup, JvExComCtrls, JvDBTreeView, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, DataModule, Vcl.Grids, Vcl.DBGrids, Tools, JvExControls,
  JvTFManager, JvTFGlance, JvTFMonths, JvCalendar, JvMonthCalendar, Vcl.Samples.Spin, DateUtils, JvDBGrid,
  JvExDBGrids, System.UITypes;

type
  TfKC6Journal = class(TSmForm)
    pgcPage: TPageControl;
    tsEstimate: TTabSheet;
    tsPTM: TTabSheet;
    pnl1: TPanel;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    cbbMode: TComboBox;
    rbRates: TRadioButton;
    rbPTM: TRadioButton;
    tvEstimates: TJvDBTreeView;
    qrTreeData: TFDQuery;
    dsTreeData: TDataSource;
    spl1: TSplitter;
    dbgrd2: TJvDBGrid;
    spl2: TSplitter;
    dbgrdData: TJvDBGrid;
    cbbFromMonth: TComboBox;
    cbbToMonth: TComboBox;
    seFromYear: TSpinEdit;
    seToYear: TSpinEdit;
    qrData: TFDQuery;
    dsData: TDataSource;
    qrDetail: TFDQuery;
    dsDetail: TDataSource;
    qrObject: TFDQuery;
    dsObject: TDataSource;
    dblkcbbNAME: TDBLookupComboBox;
    dbgrdPTM: TJvDBGrid;
    qrPTM: TFDQuery;
    dsPTM: TDataSource;
    qrDetaildocname: TStringField;
    qrDetailosnov: TStringField;
    qrDetailcnt: TFMTBCDField;
    qrDetailNumber: TIntegerField;
    chkOHROPRPP: TCheckBox;
    chkZimUdor: TCheckBox;
    qrDetailMONTHYEAR: TDateField;
    tsSM: TTabSheet;
    dbgrdEstimate: TJvDBGrid;
    rbSM: TRadioButton;
    qrEstimate: TFDQuery;
    dsEstimate: TDataSource;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure rbRatesClick(Sender: TObject);
    procedure pgcPageChange(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cbbFromMonthChange(Sender: TObject);
    procedure tvEstimatesClick(Sender: TObject);
    procedure qrDetailCalcFields(DataSet: TDataSet);
    procedure FormActivate(Sender: TObject);
    procedure qrObjectAfterScroll(DataSet: TDataSet);
    procedure dbgrdDataDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
  private
    SkipReload: Boolean;
    procedure UpdateNumPP;
  public
    procedure LocateObject(Object_ID: Integer);
    procedure LocateEstimate(Estimate_ID: Integer);
  end;

const
  BY_COUNT = 0;
  BY_COST = 1;

var
  fKC6Journal: TfKC6Journal;

implementation

{$R *.dfm}

uses Waiting, Main;

procedure TfKC6Journal.cbbFromMonthChange(Sender: TObject);
var
  year, month, i: Integer;
  col: TColumn;
  PTMFields, PTMFieldsEmpty, DATAFields, allCondition, DATAFieldsEmpty: string;

  procedure addCol(const Grid: TJvDBGrid; fieldName, titleCaption: String; const Width: Integer);
  begin
    col := Grid.Columns.Add;
    col.Title.Caption := titleCaption;
    col.Title.Alignment := taCenter;
    col.Width := Width;
    col.fieldName := fieldName;
  end;

begin
  //FormWaiting.Show;
  if SkipReload or (not CheckQrActiveEmpty(qrTreeData)) then
    Exit;
  try
    qrData.DisableControls;
    qrPTM.DisableControls;

    // Добавляем основные колонки в таблицу
    case pgcPage.ActivePageIndex of
    0:
      begin
        dbgrdData.Columns.Clear;
        addCol(dbgrdData, 'ITERATOR', '№пп', 30);
        addCol(dbgrdData, 'OBJ_CODE', 'Обоснование', 80);
        addCol(dbgrdData, 'OBJ_NAME', 'Наименование', 250);
        addCol(dbgrdData, 'OBJ_COUNT', 'Кол-во', 80);
        addCol(dbgrdData, 'OBJ_UNIT', 'Ед. изм.', 50);
        addCol(dbgrdData, 'OBJ_COUNT_DONE', 'Выполнено', 80);
        addCol(dbgrdData, 'OBJ_COUNT_OUT', 'Остаток', 80);
      end;
     1:
       begin
        dbgrdPTM.Columns.Clear;
        addCol(dbgrdPTM, '', '№пп', 30);
        addCol(dbgrdPTM, 'SM_NUMBER', 'Обоснование', 80);
        addCol(dbgrdPTM, 'NAME', 'Наименование', 250);
        addCol(dbgrdPTM, '', 'Кол-во', 80);
        addCol(dbgrdPTM, '', 'Ед. изм.', 50);
        addCol(dbgrdPTM, 'PTM_COST', 'Стоимость', 80);
        addCol(dbgrdPTM, 'PTM_COST_DONE', 'Выполнено', 80);
        addCol(dbgrdPTM, 'PTM_COST_OUT', 'Остаток', 80);
      end;
    2:
      begin
        dbgrdEstimate.Columns.Clear;
        addCol(dbgrdEstimate, '', '№пп', 30);
        addCol(dbgrdEstimate, 'SM_NUMBER', 'Обоснование', 80);
        addCol(dbgrdEstimate, 'NAME', 'Наименование', 250);
        addCol(dbgrdEstimate, '', 'Кол-во', 80);
        addCol(dbgrdEstimate, '', 'Ед. изм.', 50);
        addCol(dbgrdEstimate, 'PTM_COST', 'Стоимость', 80);
        addCol(dbgrdEstimate, 'PTM_COST_DONE', 'Выполнено', 80);
        addCol(dbgrdEstimate, 'PTM_COST_OUT', 'Остаток', 80);
      end;
    end;

    month := cbbFromMonth.ItemIndex + 1;
    year := seFromYear.Value;

    PTMFields := '';
    PTMFieldsEmpty := '';
    DATAFields := '';
    DATAFieldsEmpty := '';

    // изменение периода
    for i := seFromYear.Value * 12 + cbbFromMonth.ItemIndex + 1 to seToYear.Value * 12 +
      cbbToMonth.ItemIndex + 1 do
    begin
      // Создаем новую колонки для месяцев в таблице
      addCol(dbgrdData, 'M' + IntToStr(month) + 'Y' + IntToStr(year),
        AnsiUpperCase(FormatDateTime('mmmm yyyy', StrToDate('01.' + IntToStr(month) + '.' +
        IntToStr(year)))), 80);
      addCol(dbgrdPTM, 'M' + IntToStr(month) + 'Y' + IntToStr(year),
        AnsiUpperCase(FormatDateTime('mmmm yyyy', StrToDate('01.' + IntToStr(month) + '.' +
        IntToStr(year)))), 80);
      addCol(dbgrdEstimate, 'M' + IntToStr(month) + 'Y' + IntToStr(year),
        AnsiUpperCase(FormatDateTime('mmmm yyyy', StrToDate('01.' + IntToStr(month) + '.' +
        IntToStr(year)))), 80);

      PTMFieldsEmpty := PTMFieldsEmpty +
        ', ROUND((SELECT SUM(IF(:FL_INCL_OHROPR_PLPR=1, data_row.`STOIM` + IFNULL(data_row.`OHROPR`, 0) + IFNULL(data_row.`PLAN_PRIB`, 0), data_row.`STOIM`)+' +
        'IF(:FL_INCL_WINTER=1, (IFNULL(data_row.`ZIM_UDOR`, 0) + IFNULL(data_row.`ZP_ZIM_UDOR`, 0)) * s.`APPLY_WINTERPRISE_FLAG`, 0.0)) FROM data_row, smetasourcedata' +
        ' where smetasourcedata.DELETED=0 AND smetasourcedata.FL_USE=1 AND data_row.SM_ID=smetasourcedata.SM_ID AND EXTRACT(MONTH FROM FG_getSMOBJDate(smetasourcedata.SM_ID))='
        + IntToStr(month) + ' AND EXTRACT(YEAR FROM FG_getSMOBJDate(smetasourcedata.SM_ID))=' + IntToStr(year) + ' AND smetasourcedata.SOURCE_ID IN ('+
        'SELECT `smetasourcedata`.`SM_ID` '#13 +
        'FROM `smetasourcedata` '#13 +
        'WHERE (`smetasourcedata`.`SM_ID` = s.SM_ID) OR '#13 +
        '      (`smetasourcedata`.`PARENT_ID` = s.SM_ID) OR '#13 +
        '      (`smetasourcedata`.`PARENT_ID` IN ('#13 +
        '        SELECT `smetasourcedata`.`SM_ID`'#13 +
        '        FROM `smetasourcedata`'#13 +
        '        WHERE `smetasourcedata`.`PARENT_ID` = s.SM_ID))'#13 +
        '))' +
        ') AS M' + IntToStr(month) + 'Y' + IntToStr(year) + ''#13;

      PTMFields := PTMFields +
        ', ROUND((SELECT SUM(IF(:FL_INCL_OHROPR_PLPR=1, data_row.`STOIM` + IFNULL(data_row.`OHROPR`, 0) + IFNULL(data_row.`PLAN_PRIB`, 0), data_row.`STOIM`)+' +
        'IF(:FL_INCL_WINTER=1, (IFNULL(data_row.`ZIM_UDOR`, 0) + IFNULL(data_row.`ZP_ZIM_UDOR`, 0)) * s2.`APPLY_WINTERPRISE_FLAG`, 0.0)) FROM data_row, smetasourcedata' +
        ' where smetasourcedata.DELETED=0 AND smetasourcedata.FL_USE=1 AND data_row.SM_ID=smetasourcedata.SM_ID AND EXTRACT(MONTH FROM FG_getSMOBJDate(smetasourcedata.SM_ID))='
        + IntToStr(month) + ' AND EXTRACT(YEAR FROM FG_getSMOBJDate(smetasourcedata.SM_ID))=' + IntToStr(year) + ' AND smetasourcedata.ACT=1 AND smetasourcedata.SOURCE_ID = s2.SM_ID)' +
        ') AS M' + IntToStr(month) + 'Y' + IntToStr(year) + ''#13;

      allCondition := ' smetasourcedata.DELETED=0 AND smetasourcedata.FL_USE=1 AND smetasourcedata.ACT=1 AND ' +
        'da.`ID_TYPE_DATA`=d.`ID_TYPE_DATA` AND da.`ID_TABLES`=d.`ID_TABLES` AND smetasourcedata.`SOURCE_ID`=d.`SM_ID`' +
        ' AND smetasourcedata.`SM_ID`=da.`SM_ID` AND EXTRACT(MONTH FROM FG_getSMOBJDate(smetasourcedata.SM_ID))='
        + IntToStr(month) + ' AND EXTRACT(YEAR FROM FG_getSMOBJDate(smetasourcedata.SM_ID))=' + IntToStr(year);
      DATAFields := DATAFields +
        ', IF(:BY_COUNT=1,'#13 +
        'CASE d.`ID_TYPE_DATA`'#13 +
        '  WHEN 1 THEN (SELECT SUM(ca.`RATE_COUNT`) FROM `card_rate` ca, `data_row` da, smetasourcedata WHERE ca.DATA_ROW_ID=da.ID AND ca.`ID`=da.`ID_TABLES` AND' + allCondition + ')'#13 +
        '  WHEN 2 THEN (SELECT SUM(ma.`MAT_COUNT`) FROM `materialcard` ma, `data_row` da, smetasourcedata WHERE ma.DATA_ROW_ID=da.ID AND ma.DELETED=0 AND ma.`ID`=da.`ID_TABLES` AND' + allCondition + ')'#13 +
        '  WHEN 3 THEN (SELECT SUM(ma.`MECH_COUNT`) FROM `mechanizmcard` ma, `data_row` da, smetasourcedata WHERE ma.DATA_ROW_ID=da.ID AND ma.DELETED=0 AND ma.`ID`=da.`ID_TABLES` AND' + allCondition + ')'#13 +
        '  WHEN 4 THEN (SELECT SUM(dca.`DEVICE_COUNT`) FROM `devicescard` dca, `data_row` da, smetasourcedata WHERE dca.DATA_ROW_ID=da.ID AND dca.`ID`=da.`ID_TABLES` AND' + allCondition + ')'#13 +
        '  WHEN 5 THEN (SELECT SUM(dma.`DUMP_COUNT`) FROM `dumpcard` dma, `data_row` da, smetasourcedata WHERE dma.DATA_ROW_ID=da.ID AND dma.`ID`=da.`ID_TABLES` AND' + allCondition + ')'#13 +
        '  WHEN 6 THEN (SELECT SUM(ta.`TRANSP_COUNT`) FROM `transpcard` ta, `data_row` da, smetasourcedata WHERE ta.DATA_ROW_ID=da.ID AND ta.`ID`=da.`ID_TABLES` AND' + allCondition + ')'#13 +
        '  WHEN 7 THEN (SELECT SUM(ta.`TRANSP_COUNT`) FROM `transpcard` ta, `data_row` da, smetasourcedata WHERE ta.DATA_ROW_ID=da.ID AND ta.`ID`=da.`ID_TABLES` AND' + allCondition + ')'#13 +
        '  WHEN 8 THEN (SELECT SUM(ta.`TRANSP_COUNT`) FROM `transpcard` ta, `data_row` da, smetasourcedata WHERE ta.DATA_ROW_ID=da.ID AND ta.`ID`=da.`ID_TABLES` AND' + allCondition + ')'#13 +
        '  WHEN 9 THEN (SELECT SUM(ta.`TRANSP_COUNT`) FROM `transpcard` ta, `data_row` da, smetasourcedata WHERE ta.DATA_ROW_ID=da.ID AND ta.`ID`=da.`ID_TABLES` AND' + allCondition + ')'#13 +
        '  WHEN 10 THEN (SELECT SUM(da.`E1820_COUNT`) FROM `data_row` da, smetasourcedata WHERE' + allCondition + ')'#13 +
        '  WHEN 11 THEN (SELECT SUM(da.`E1820_COUNT`) FROM `data_row` da, smetasourcedata WHERE' + allCondition + ')'#13 +
        'END, '+
        'ROUND((SELECT SUM(IF(:FL_INCL_OHROPR_PLPR=1, da.`STOIM` + IFNULL(da.`OHROPR`, 0) + IFNULL(da.`PLAN_PRIB`, 0), da.`STOIM`)+IF(:FL_INCL_WINTER=1, (IFNULL(da.`ZIM_UDOR`, 0) + IFNULL(da.`ZP_ZIM_UDOR`, 0)) * sm.`APPLY_WINTERPRISE_FLAG`, 0.0)) ' +
        'FROM `data_row` da, smetasourcedata WHERE' + allCondition + '))) AS M' + IntToStr(month) + 'Y' + IntToStr(year) + ''#13;
      DATAFieldsEmpty := DATAFieldsEmpty + ', (NULL) AS M' + IntToStr(month) + 'Y' + IntToStr(year) + ''#13;

      // Переход на следующий месяц
      if month = 12 then
      begin
        month := 1;
        Inc(year);
      end
      else
        Inc(month);
    end;

    // Собираем общий запрос по расценкам
    if pgcPage.ActivePageIndex = 0 then
    try
      qrData.Active := False;
      qrData.SQL.Text :=
      'SELECT'#13 +
      'CONCAT(IF(((sm.`SM_ID` = :SM_ID) OR (sm.`PARENT_ID` = :SM_ID)), "", :SM_ID), sm.`PARENT_ID`, sm.`SM_ID`, d.`ID`) as SORT_ID,'#13 +
      '1 AS INCITERATOR,'#13 +
      '0 AS ITERATOR,'#13 +
      'CASE d.`ID_TYPE_DATA`'#13 +
      '  WHEN 1 THEN cr.`RATE_CODE`'#13 +
      '  WHEN 2 THEN mat.`MAT_CODE`'#13 +
      '  WHEN 3 THEN mech.`MECH_CODE`'#13 +
      '  WHEN 4 THEN dev.`DEVICE_CODE`'#13 +
      '  WHEN 5 THEN dmp.`DUMP_CODE_JUST`'#13 +
      '  WHEN 6 THEN tr.`TRANSP_CODE_JUST`'#13 +
      '  WHEN 7 THEN tr.`TRANSP_CODE_JUST`'#13 +
      '  WHEN 8 THEN tr.`TRANSP_CODE_JUST`'#13 +
      '  WHEN 9 THEN tr.`TRANSP_CODE_JUST`'#13 +
      '  WHEN 10 THEN ("ЕТ18")'#13 +
      '  WHEN 11 THEN ("ЕТ20")'#13 +
      'END AS OBJ_CODE,'#13 +
      'CASE d.`ID_TYPE_DATA`'#13 +
      '  WHEN 1 THEN cr.`RATE_CAPTION`'#13 +
      '  WHEN 2 THEN mat.`MAT_NAME`'#13 +
      '  WHEN 3 THEN mech.`MECH_NAME`'#13 +
      '  WHEN 4 THEN dev.`DEVICE_NAME`'#13 +
      '  WHEN 5 THEN dmp.`DUMP_NAME`'#13 +
      '  WHEN 6 THEN tr.`TRANSP_JUST`'#13 +
      '  WHEN 7 THEN tr.`TRANSP_JUST`'#13 +
      '  WHEN 8 THEN tr.`TRANSP_JUST`'#13 +
      '  WHEN 9 THEN tr.`TRANSP_JUST`'#13 +
      '  WHEN 10 THEN ("")'#13 +
      '  WHEN 11 THEN ("")'#13 +
      'END AS OBJ_NAME,'#13 +
      // Необходимо-->
      'IF(:BY_COUNT=1,'#13 +
      'CASE d.`ID_TYPE_DATA`'#13 +
      '  WHEN 1 THEN cr.`RATE_COUNT`'#13 +
      '  WHEN 2 THEN mat.`MAT_COUNT`'#13 +
      '  WHEN 3 THEN mech.`MECH_COUNT`'#13 +
      '  WHEN 4 THEN dev.`DEVICE_COUNT`'#13 +
      '  WHEN 5 THEN dmp.`DUMP_COUNT`'#13 +
      '  WHEN 6 THEN tr.`TRANSP_COUNT`'#13 +
      '  WHEN 7 THEN tr.`TRANSP_COUNT`'#13 +
      '  WHEN 8 THEN tr.`TRANSP_COUNT`'#13 +
      '  WHEN 9 THEN tr.`TRANSP_COUNT`'#13 +
      '  WHEN 10 THEN d.`E1820_COUNT`'#13 +
      '  WHEN 11 THEN d.`E1820_COUNT`'#13 +
      'END, ROUND(IF(:FL_INCL_OHROPR_PLPR=1, d.`STOIM` + IFNULL(d.`OHROPR`, 0) + IFNULL(d.`PLAN_PRIB`, 0), d.`STOIM`)+IF(:FL_INCL_WINTER=1, (IFNULL(d.`ZIM_UDOR`, 0) + IFNULL(d.`ZP_ZIM_UDOR`, 0)) * sm.`APPLY_WINTERPRISE_FLAG`, 0.0))) AS OBJ_COUNT,'#13 +
      // <--Необходимо
      // Выполнено-->
      'IF(:BY_COUNT=1,'#13 +
      'CASE d.`ID_TYPE_DATA`'#13 +
      '  WHEN 1 THEN (SELECT SUM(ca.`RATE_COUNT`) FROM `card_rate` ca, `data_row`, smetasourcedata WHERE'#13 +
      ' `data_row`.SM_ID=smetasourcedata.SM_ID AND smetasourcedata.DELETED=0 AND smetasourcedata.FL_USE=1'#13 +
      '  AND ca.`DATA_ROW_ID`=data_row.`ID` AND ca.`ID`=`data_row`.`ID_TABLES` AND `data_row`.`ID_TYPE_DATA`=d.`ID_TYPE_DATA` AND `data_row`.`ID_TABLES`=d.`ID_TABLES` AND smetasourcedata.SOURCE_ID=d.SM_ID)'#13 +
      '  WHEN 2 THEN (SELECT SUM(ma.`MAT_COUNT`) FROM `materialcard` ma, `data_row`, smetasourcedata WHERE'#13 +
      '  ma.DELETED=0 AND `data_row`.SM_ID=smetasourcedata.SM_ID AND smetasourcedata.DELETED=0 AND smetasourcedata.FL_USE=1'#13+
      '  AND ma.`DATA_ROW_ID`=data_row.`ID` AND ma.`ID`=`data_row`.`ID_TABLES` AND `data_row`.`ID_TYPE_DATA`=d.`ID_TYPE_DATA` AND `data_row`.`ID_TABLES`=d.`ID_TABLES` AND smetasourcedata.SOURCE_ID=d.SM_ID)'#13 +
      '  WHEN 3 THEN (SELECT SUM(ma.`MECH_COUNT`) FROM `mechanizmcard` ma, `data_row`, smetasourcedata WHERE'#13+
      '  ma.DELETED=0 AND `data_row`.SM_ID=smetasourcedata.SM_ID AND smetasourcedata.DELETED=0 AND smetasourcedata.FL_USE=1'#13+
      '  AND ma.`DATA_ROW_ID`=data_row.`ID` AND ma.`ID`=`data_row`.`ID_TABLES` AND `data_row`.`ID_TYPE_DATA`=d.`ID_TYPE_DATA` AND `data_row`.`ID_TABLES`=d.`ID_TABLES` AND smetasourcedata.SOURCE_ID=d.SM_ID)'#13 +
      '  WHEN 4 THEN (SELECT SUM(da.`DEVICE_COUNT`) FROM `devicescard` da, `data_row`, smetasourcedata WHERE'#13 +
      ' `data_row`.SM_ID=smetasourcedata.SM_ID AND smetasourcedata.DELETED=0 AND smetasourcedata.FL_USE=1'#13 +
      '  AND da.`DATA_ROW_ID`=data_row.`ID` AND da.`ID`=`data_row`.`ID_TABLES` AND `data_row`.`ID_TYPE_DATA`=d.`ID_TYPE_DATA` AND `data_row`.`ID_TABLES`=d.`ID_TABLES` AND smetasourcedata.SOURCE_ID=d.SM_ID)'#13 +
      '  WHEN 5 THEN (SELECT SUM(da.`DUMP_COUNT`) FROM `dumpcard` da, `data_row`, smetasourcedata WHERE'#13 +
      ' `data_row`.SM_ID=smetasourcedata.SM_ID AND smetasourcedata.DELETED=0 AND smetasourcedata.FL_USE=1'#13 +
      '  AND da.`DATA_ROW_ID`=data_row.`ID` AND da.`ID`=`data_row`.`ID_TABLES` AND `data_row`.`ID_TYPE_DATA`=d.`ID_TYPE_DATA` AND `data_row`.`ID_TABLES`=d.`ID_TABLES` AND smetasourcedata.SOURCE_ID=d.SM_ID)'#13 +
      '  WHEN 6 THEN (SELECT SUM(ta.`TRANSP_COUNT`) FROM `transpcard` ta, `data_row`, smetasourcedata WHERE '+
      ' `data_row`.SM_ID=smetasourcedata.SM_ID AND smetasourcedata.DELETED=0 AND smetasourcedata.FL_USE=1'#13 +
      '  AND ta.`DATA_ROW_ID`=data_row.`ID` AND ta.`ID`=`data_row`.`ID_TABLES` AND `data_row`.`ID_TYPE_DATA`=d.`ID_TYPE_DATA` AND `data_row`.`ID_TABLES`=d.`ID_TABLES` AND smetasourcedata.SOURCE_ID=d.SM_ID)'#13 +
      '  WHEN 7 THEN (SELECT SUM(ta.`TRANSP_COUNT`) FROM `transpcard` ta, `data_row`, smetasourcedata WHERE '+
      ' `data_row`.SM_ID=smetasourcedata.SM_ID AND smetasourcedata.DELETED=0 AND smetasourcedata.FL_USE=1'#13 +
      '  AND ta.`DATA_ROW_ID`=data_row.`ID` AND ta.`ID`=`data_row`.`ID_TABLES` AND `data_row`.`ID_TYPE_DATA`=d.`ID_TYPE_DATA` AND `data_row`.`ID_TABLES`=d.`ID_TABLES` AND smetasourcedata.SOURCE_ID=d.SM_ID)'#13 +
      '  WHEN 8 THEN (SELECT SUM(ta.`TRANSP_COUNT`) FROM `transpcard` ta, `data_row`, smetasourcedata WHERE '+
      ' `data_row`.SM_ID=smetasourcedata.SM_ID AND smetasourcedata.DELETED=0 AND smetasourcedata.FL_USE=1'#13 +
      '  AND ta.`DATA_ROW_ID`=data_row.`ID` AND ta.`ID`=`data_row`.`ID_TABLES` AND `data_row`.`ID_TYPE_DATA`=d.`ID_TYPE_DATA` AND `data_row`.`ID_TABLES`=d.`ID_TABLES` AND smetasourcedata.SOURCE_ID=d.SM_ID)'#13 +
      '  WHEN 9 THEN (SELECT SUM(ta.`TRANSP_COUNT`) FROM `transpcard` ta, `data_row`, smetasourcedata WHERE '+
      ' `data_row`.SM_ID=smetasourcedata.SM_ID AND smetasourcedata.DELETED=0 AND smetasourcedata.FL_USE=1'#13 +
      '  AND ta.`DATA_ROW_ID`=data_row.`ID` AND ta.`ID`=`data_row`.`ID_TABLES` AND `data_row`.`ID_TYPE_DATA`=d.`ID_TYPE_DATA` AND `data_row`.`ID_TABLES`=d.`ID_TABLES` AND smetasourcedata.SOURCE_ID=d.SM_ID)'#13 +
      '  WHEN 10 THEN (SELECT SUM(da.`E1820_COUNT`) FROM `data_row` da, smetasourcedata WHERE'#13 +
      '  da.SM_ID=smetasourcedata.SM_ID AND smetasourcedata.DELETED=0 AND smetasourcedata.FL_USE=1'#13 +
      '  AND da.`ID_TYPE_DATA`=d.`ID_TYPE_DATA` AND da.`ID_TABLES`=d.`ID_TABLES` AND smetasourcedata.SOURCE_ID=d.SM_ID)'#13 +
      '  WHEN 11 THEN (SELECT SUM(da.`E1820_COUNT`) FROM `data_row` da, smetasourcedata WHERE '+
      '  da.SM_ID=smetasourcedata.SM_ID AND smetasourcedata.DELETED=0 AND smetasourcedata.FL_USE=1'#13 +
      '  AND da.`ID_TYPE_DATA`=d.`ID_TYPE_DATA` AND da.`ID_TABLES`=d.`ID_TABLES` AND smetasourcedata.SOURCE_ID=d.SM_ID)'#13 +
      'END, '+
      'ROUND((SELECT SUM(IF(:FL_INCL_OHROPR_PLPR=1, da.`STOIM` + IFNULL(da.`OHROPR`, 0) + IFNULL(da.`PLAN_PRIB`, 0), da.`STOIM`)+IF(:FL_INCL_WINTER=1, (IFNULL(da.`ZIM_UDOR`, 0) + IFNULL(da.`ZP_ZIM_UDOR`, 0)) * sm.`APPLY_WINTERPRISE_FLAG`, 0.0)) ' +
      'FROM `data_row` da, smetasourcedata WHERE da.SM_ID=smetasourcedata.SM_ID AND smetasourcedata.DELETED=0 AND smetasourcedata.FL_USE=1'#13+
      'AND d.`ID_TABLES`=da.`ID_TABLES` AND d.`ID_TYPE_DATA`=da.`ID_TYPE_DATA` AND smetasourcedata.SOURCE_ID=d.SM_ID))) AS OBJ_COUNT_DONE,'#13 +
      // <--Выполнено
      // Осталось-->
      'IF(:BY_COUNT=1,'#13 +
      'CASE d.`ID_TYPE_DATA`'#13 +
      '  WHEN 1 THEN cr.`RATE_COUNT`'#13 +
      '  WHEN 2 THEN mat.`MAT_COUNT`'#13 +
      '  WHEN 3 THEN mech.`MECH_COUNT`'#13 +
      '  WHEN 4 THEN dev.`DEVICE_COUNT`'#13 +
      '  WHEN 5 THEN dmp.`DUMP_COUNT`'#13 +
      '  WHEN 6 THEN tr.`TRANSP_COUNT`'#13 +
      '  WHEN 7 THEN tr.`TRANSP_COUNT`'#13 +
      '  WHEN 8 THEN tr.`TRANSP_COUNT`'#13 +
      '  WHEN 9 THEN tr.`TRANSP_COUNT`'#13 +
      '  WHEN 10 THEN d.`E1820_COUNT`'#13 +
      '  WHEN 11 THEN d.`E1820_COUNT`'#13 +
      'END, ROUND(IF(:FL_INCL_OHROPR_PLPR=1, d.`STOIM` + IFNULL(d.`OHROPR`, 0) + IFNULL(d.`PLAN_PRIB`, 0), d.`STOIM`)+IF(:FL_INCL_WINTER=1, (IFNULL(d.`ZIM_UDOR`, 0) + IFNULL(d.`ZP_ZIM_UDOR`, 0)) * sm.`APPLY_WINTERPRISE_FLAG`, 0.0)))-'#13 +
      'IFNULL(IF(:BY_COUNT=1,'#13 +
      'CASE d.`ID_TYPE_DATA`'#13 +
      '  WHEN 1 THEN (SELECT SUM(ca.`RATE_COUNT`) FROM `card_rate` ca, `data_row`, smetasourcedata WHERE'#13 +
      ' `data_row`.SM_ID=smetasourcedata.SM_ID AND smetasourcedata.DELETED=0 AND smetasourcedata.FL_USE=1'#13 +
      '  AND ca.`DATA_ROW_ID`=data_row.`ID` AND ca.`ID`=`data_row`.`ID_TABLES` AND `data_row`.`ID_TYPE_DATA`=d.`ID_TYPE_DATA` AND `data_row`.`ID_TABLES`=d.`ID_TABLES` AND smetasourcedata.SOURCE_ID=d.SM_ID)'#13 +
      '  WHEN 2 THEN (SELECT SUM(ma.`MAT_COUNT`) FROM `materialcard` ma, `data_row`, smetasourcedata WHERE'#13 +
      '  ma.DELETED=0 AND `data_row`.SM_ID=smetasourcedata.SM_ID AND smetasourcedata.DELETED=0 AND smetasourcedata.FL_USE=1'#13+
      '  AND ma.`DATA_ROW_ID`=data_row.`ID` AND ma.`ID`=`data_row`.`ID_TABLES` AND `data_row`.`ID_TYPE_DATA`=d.`ID_TYPE_DATA` AND `data_row`.`ID_TABLES`=d.`ID_TABLES` AND smetasourcedata.SOURCE_ID=d.SM_ID)'#13 +
      '  WHEN 3 THEN (SELECT SUM(ma.`MECH_COUNT`) FROM `mechanizmcard` ma, `data_row`, smetasourcedata WHERE'#13+
      '  ma.DELETED=0 AND `data_row`.SM_ID=smetasourcedata.SM_ID AND smetasourcedata.DELETED=0 AND smetasourcedata.FL_USE=1'#13+
      '  AND ma.`DATA_ROW_ID`=data_row.`ID` AND ma.`ID`=`data_row`.`ID_TABLES` AND `data_row`.`ID_TYPE_DATA`=d.`ID_TYPE_DATA` AND `data_row`.`ID_TABLES`=d.`ID_TABLES` AND smetasourcedata.SOURCE_ID=d.SM_ID)'#13 +
      '  WHEN 4 THEN (SELECT SUM(da.`DEVICE_COUNT`) FROM `devicescard` da, `data_row`, smetasourcedata WHERE'#13 +
      ' `data_row`.SM_ID=smetasourcedata.SM_ID AND smetasourcedata.DELETED=0 AND smetasourcedata.FL_USE=1'#13 +
      '  AND da.`DATA_ROW_ID`=data_row.`ID` AND da.`ID`=`data_row`.`ID_TABLES` AND `data_row`.`ID_TYPE_DATA`=d.`ID_TYPE_DATA` AND `data_row`.`ID_TABLES`=d.`ID_TABLES` AND smetasourcedata.SOURCE_ID=d.SM_ID)'#13 +
      '  WHEN 5 THEN (SELECT SUM(da.`DUMP_COUNT`) FROM `dumpcard` da, `data_row`, smetasourcedata WHERE'#13 +
      ' `data_row`.SM_ID=smetasourcedata.SM_ID AND smetasourcedata.DELETED=0 AND smetasourcedata.FL_USE=1'#13 +
      '  AND da.`DATA_ROW_ID`=data_row.`ID` AND da.`ID`=`data_row`.`ID_TABLES` AND `data_row`.`ID_TYPE_DATA`=d.`ID_TYPE_DATA` AND `data_row`.`ID_TABLES`=d.`ID_TABLES` AND smetasourcedata.SOURCE_ID=d.SM_ID)'#13 +
      '  WHEN 6 THEN (SELECT SUM(ta.`TRANSP_COUNT`) FROM `transpcard` ta, `data_row`, smetasourcedata WHERE '+
      ' `data_row`.SM_ID=smetasourcedata.SM_ID AND smetasourcedata.DELETED=0 AND smetasourcedata.FL_USE=1'#13 +
      '  AND ta.`DATA_ROW_ID`=data_row.`ID` AND ta.`ID`=`data_row`.`ID_TABLES` AND `data_row`.`ID_TYPE_DATA`=d.`ID_TYPE_DATA` AND `data_row`.`ID_TABLES`=d.`ID_TABLES` AND smetasourcedata.SOURCE_ID=d.SM_ID)'#13 +
      '  WHEN 7 THEN (SELECT SUM(ta.`TRANSP_COUNT`) FROM `transpcard` ta, `data_row`, smetasourcedata WHERE '+
      ' `data_row`.SM_ID=smetasourcedata.SM_ID AND smetasourcedata.DELETED=0 AND smetasourcedata.FL_USE=1'#13 +
      '  AND ta.`DATA_ROW_ID`=data_row.`ID` AND ta.`ID`=`data_row`.`ID_TABLES` AND `data_row`.`ID_TYPE_DATA`=d.`ID_TYPE_DATA` AND `data_row`.`ID_TABLES`=d.`ID_TABLES` AND smetasourcedata.SOURCE_ID=d.SM_ID)'#13 +
      '  WHEN 8 THEN (SELECT SUM(ta.`TRANSP_COUNT`) FROM `transpcard` ta, `data_row`, smetasourcedata WHERE '+
      ' `data_row`.SM_ID=smetasourcedata.SM_ID AND smetasourcedata.DELETED=0 AND smetasourcedata.FL_USE=1'#13 +
      '  AND ta.`DATA_ROW_ID`=data_row.`ID` AND ta.`ID`=`data_row`.`ID_TABLES` AND `data_row`.`ID_TYPE_DATA`=d.`ID_TYPE_DATA` AND `data_row`.`ID_TABLES`=d.`ID_TABLES` AND smetasourcedata.SOURCE_ID=d.SM_ID)'#13 +
      '  WHEN 9 THEN (SELECT SUM(ta.`TRANSP_COUNT`) FROM `transpcard` ta, `data_row`, smetasourcedata WHERE '+
      ' `data_row`.SM_ID=smetasourcedata.SM_ID AND smetasourcedata.DELETED=0 AND smetasourcedata.FL_USE=1'#13 +
      '  AND ta.`DATA_ROW_ID`=data_row.`ID` AND ta.`ID`=`data_row`.`ID_TABLES` AND `data_row`.`ID_TYPE_DATA`=d.`ID_TYPE_DATA` AND `data_row`.`ID_TABLES`=d.`ID_TABLES` AND smetasourcedata.SOURCE_ID=d.SM_ID)'#13 +
      '  WHEN 10 THEN (SELECT SUM(da.`E1820_COUNT`) FROM `data_row` da, smetasourcedata WHERE'#13 +
      '  da.SM_ID=smetasourcedata.SM_ID AND smetasourcedata.DELETED=0 AND smetasourcedata.FL_USE=1'#13 +
      '  AND da.`ID_TYPE_DATA`=d.`ID_TYPE_DATA` AND da.`ID_TABLES`=d.`ID_TABLES` AND smetasourcedata.SOURCE_ID=d.SM_ID)'#13 +
      '  WHEN 11 THEN (SELECT SUM(da.`E1820_COUNT`) FROM `data_row` da, smetasourcedata WHERE '+
      '  da.SM_ID=smetasourcedata.SM_ID AND smetasourcedata.DELETED=0 AND smetasourcedata.FL_USE=1'#13 +
      '  AND da.`ID_TYPE_DATA`=d.`ID_TYPE_DATA` AND da.`ID_TABLES`=d.`ID_TABLES` AND smetasourcedata.SOURCE_ID=d.SM_ID)'#13 +
      'END, '+
      'ROUND((SELECT SUM(IF(:FL_INCL_OHROPR_PLPR=1, da.`STOIM` + IFNULL(da.`OHROPR`, 0) + IFNULL(da.`PLAN_PRIB`, 0), da.`STOIM`)+IF(:FL_INCL_WINTER=1, (IFNULL(da.`ZIM_UDOR`, 0) + IFNULL(da.`ZP_ZIM_UDOR`, 0)) * sm.`APPLY_WINTERPRISE_FLAG`, 0.0)) ' +
      'FROM `data_row` da, smetasourcedata WHERE da.SM_ID=smetasourcedata.SM_ID AND smetasourcedata.DELETED=0 AND smetasourcedata.FL_USE=1'#13+
      'AND d.`ID_TABLES`=da.`ID_TABLES` AND d.`ID_TYPE_DATA`=da.`ID_TYPE_DATA` AND smetasourcedata.SOURCE_ID=d.SM_ID))), 0) AS OBJ_COUNT_OUT,'#13 +
      // <--Осталось
      'CASE d.`ID_TYPE_DATA`'#13 +
      '  WHEN 1 THEN cr.`RATE_UNIT`'#13 +
      '  WHEN 2 THEN mat.`MAT_UNIT`'#13 +
      '  WHEN 3 THEN mech.`MECH_UNIT`'#13 +
      '  WHEN 4 THEN dev.`DEVICE_UNIT`'#13 +
      '  WHEN 5 THEN dmp.`DUMP_UNIT`'#13 +
      '  WHEN 6 THEN tr.`CARG_UNIT`'#13 +
      '  WHEN 7 THEN tr.`CARG_UNIT`'#13 +
      '  WHEN 8 THEN tr.`CARG_UNIT`'#13 +
      '  WHEN 9 THEN tr.`CARG_UNIT`'#13 +
      '  WHEN 10 THEN ("шт.")'#13 +
      '  WHEN 11 THEN ("шт.")'#13 +
      'END AS OBJ_UNIT,'#13 +
      'd.`ID_TYPE_DATA` as ID_TYPE_DATA,'#13 +
      'd.`ID` as DATA_ESTIMATE_OR_ACT_ID,'#13 +
      'd.`ID_TABLES` AS ID_TABLES,'#13 +
      'sm.`SM_ID`'#13 +
      DATAFields +
      'FROM `smetasourcedata` sm, `data_row` d'#13 +
      'LEFT JOIN `card_rate` cr ON d.`ID_TYPE_DATA` = 1 AND cr.`ID` = d.`ID_TABLES` and cr.`DATA_ROW_ID`=d.`ID`'#13 +
      'LEFT JOIN `materialcard` mat ON mat.DELETED=0 AND d.`ID_TYPE_DATA` = 2 AND mat.`ID` = d.`ID_TABLES` and mat.`DATA_ROW_ID`=d.`ID`'#13 +
      'LEFT JOIN `mechanizmcard` mech ON mech.DELETED=0 AND d.`ID_TYPE_DATA` = 3 AND mech.`ID` = d.`ID_TABLES` and mech.`DATA_ROW_ID`=d.`ID`'#13 +
      'LEFT JOIN `devicescard` dev ON d.`ID_TYPE_DATA` = 4 AND dev.`ID` = d.`ID_TABLES` and dev.`DATA_ROW_ID`=d.`ID`'#13 +
      'LEFT JOIN `dumpcard` dmp ON d.`ID_TYPE_DATA` = 5 AND dmp.`ID` = d.`ID_TABLES` and dmp.`DATA_ROW_ID`=d.`ID`'#13 +
      'LEFT JOIN `transpcard` tr ON d.`ID_TYPE_DATA` IN (6,7,8,9) AND tr.`ID` = d.`ID_TABLES` and tr.`DATA_ROW_ID`=d.`ID`'#13 +
      'WHERE d.SM_ID=sm.`SM_ID` AND'#13 +
      '      ((sm.`SM_ID` = :SM_ID) OR'#13 +
      '       (sm.`PARENT_ID` = :SM_ID) OR'#13 +
      '       (sm.`PARENT_ID` IN'#13 +
      '        (SELECT `smetasourcedata`.`SM_ID`'#13 +
      '         FROM `smetasourcedata`'#13 +
      '         WHERE `smetasourcedata`.`PARENT_ID` = :SM_ID)))'#13 +
      'UNION ALL'#13 +
      '/* Выводим заменяющие материалы */'#13 +
      'SELECT'#13 +
      'CONCAT(IF(((sm.`SM_ID` = :SM_ID) OR (sm.`PARENT_ID` = :SM_ID)), "", :SM_ID), sm.`PARENT_ID`, sm.`SM_ID`, d.`ID`, mat.`ID`) as SORT_ID,'#13 +
      '0 AS INCITERATOR,'#13 +
      '0 AS ITERATOR,'#13 +
      'CONCAT("   ", mat.`MAT_CODE`) AS OBJ_CODE,'#13 +
      'mat.`MAT_NAME` AS OBJ_NAME,'#13 +
      '/*Стоимость для заменяющих материалов достается пока неверно*/'#13 +
      'IF(:BY_COUNT=1, mat.`MAT_COUNT`, ' +
      'ROUND(IF(:FL_INCL_OHROPR_PLPR=1, d.`STOIM` + IFNULL(d.`OHROPR`, 0) + IFNULL(d.`PLAN_PRIB`, 0), d.`STOIM`)+IF(:FL_INCL_WINTER=1, (IFNULL(d.`ZIM_UDOR`, 0) + IFNULL(d.`ZP_ZIM_UDOR`, 0)) * sm.`APPLY_WINTERPRISE_FLAG`, 0.0))) AS OBJ_COUNT,'#13 +
      'NULL AS OBJ_COUNT_DONE,'#13 +
      'NULL AS OBJ_COUNT_OUT,'#13 +
      'mat.`MAT_UNIT` AS OBJ_UNIT,'#13 +
      'd.`ID_TYPE_DATA` as ID_TYPE_DATA,'#13 +
      'd.`ID` as DATA_ESTIMATE_OR_ACT_ID,'#13 +
      'd.`ID_TABLES` AS ID_TABLES,'#13 +
      'sm.`SM_ID`'#13 +
      DATAFieldsEmpty +
      'FROM `smetasourcedata` sm, `data_row` d'#13 +
      'JOIN `card_rate` cr ON cr.`ID` = d.`ID_TABLES` and cr.`DATA_ROW_ID`=d.`ID`'#13 +
      'JOIN `materialcard` mat ON mat.DELETED=0 AND cr.`ID` = d.`ID_TABLES` AND mat.`ID_CARD_RATE` = d.`ID_TABLES` AND mat.`ID_REPLACED` > 0 and mat.`DATA_ROW_ID`=d.`ID`'#13 +
      'WHERE sm.`SM_ID`=d.`SM_ID` AND'#13 +
      '      d.`ID_TYPE_DATA` = 1 AND'#13 +
      '      ((sm.`SM_ID` = :SM_ID) OR'#13 +
      '       (sm.`PARENT_ID` = :SM_ID) OR'#13 +
      '       (sm.`PARENT_ID` IN'#13 +
      '        (SELECT `smetasourcedata`.`SM_ID`'#13 +
      '         FROM `smetasourcedata`'#13 +
      '         WHERE `smetasourcedata`.`PARENT_ID` = :SM_ID)))'#13 +
      'UNION ALL'#13 +
      '/* Заголовки разделов */'#13 +
      'select CONCAT('#13 +
      'IF(((sm.`SM_ID` = :SM_ID) OR (sm.`PARENT_ID` = :SM_ID)), "", :SM_ID), sm.`PARENT_ID`, sm.`SM_ID`) as SORT_ID,'#13 +
      '0 AS INCITERATOR,'#13 +
      '0 AS ITERATOR,'#13 +
      'CONCAT(sm.`SM_NUMBER`, " ", sm.`NAME`) AS OBJ_CODE, NULL AS OBJ_NAME,'#13 +
      'IF(:BY_COUNT=1, NULL, ' +
      'ROUND(IF(:FL_INCL_OHROPR_PLPR=1, sm.`S_STOIM` + IFNULL(sm.`S_OHROPR`, 0) + IFNULL(sm.`S_PLAN_PRIB`, 0), sm.`S_STOIM`)+IF(:FL_INCL_WINTER=1, (IFNULL(sm.`S_ZIM_UDOR`, 0) + IFNULL(sm.`S_ZP_ZIM_UDOR`, 0)) * sm.`APPLY_WINTERPRISE_FLAG`, 0.0))) AS OBJ_COUNT,'#13 +
      'NULL AS OBJ_COUNT_DONE,'#13 +
      'NULL AS OBJ_COUNT_OUT,'#13 +
      'NULL AS OBJ_UNIT,(sm.`SM_TYPE` * -1) as ID_TYPE_DATA,'#13 +
      'NULL AS DATA_ESTIMATE_OR_ACT_ID, NULL AS ID_TABLES, sm.`SM_ID`'#13 +
      DATAFieldsEmpty +
      'FROM `smetasourcedata` sm'#13 +
      'WHERE ((sm.`PARENT_ID` = :SM_ID) OR'#13 +
      '       (sm.`PARENT_ID` IN'#13 +
      '        (SELECT `smetasourcedata`.`SM_ID`'#13 +
      '         FROM `smetasourcedata`'#13 +
      '         WHERE `smetasourcedata`.`PARENT_ID` = :SM_ID)))'#13 +
      'ORDER BY SORT_ID';

      qrData.ParamByName('SM_ID').AsInteger := qrTreeData.FieldByName('SM_ID').AsInteger;
      case cbbMode.ItemIndex of
        BY_COUNT: // по кол-ву
        begin
          qrData.ParamByName('BY_COUNT').AsInteger := 1;
        end;
        BY_COST: // по стоимости
        begin
          qrData.ParamByName('BY_COUNT').AsInteger := 0;

          //Включать или нет стоимость зименого удорожания
          if chkZimUdor.Checked then
            qrData.ParamByName('FL_INCL_WINTER').AsInteger := 1
          else
            qrData.ParamByName('FL_INCL_WINTER').AsInteger := 0;

          //Включать или нет стоимость ОХРиОПР и плановой прибыли
          if chkOHROPRPP.Checked then
            qrData.ParamByName('FL_INCL_OHROPR_PLPR').AsInteger := 1
          else
            qrData.ParamByName('FL_INCL_OHROPR_PLPR').AsInteger := 0;
        end;
      end;
      qrData.Active := True;
    except
      ShowMessage('Ошибка получения данных по расценкам!');
    end;

    //Собираем запрос по ПТМ
    if pgcPage.ActivePageIndex = 1 then
    try
      qrPTM.Active := False;
      qrPTM.SQL.Text :=
      '/* Объектные */'#13 +
      'SELECT SM_ID, SM_TYPE, NAME as NAME, SM_NUMBER, SM_ID as ID,'#13 +
      'ROUND((SELECT SUM(IF(:FL_INCL_OHROPR_PLPR=1, s1.`S_STOIM` + IFNULL(s1.`S_OHROPR`, 0) + IFNULL(s1.`S_PLAN_PRIB`, 0), s1.`S_STOIM`)+' +
      'IF(:FL_INCL_WINTER=1, (s1.`S_ZIM_UDOR` + s1.`S_ZP_ZIM_UDOR`) * s1.`APPLY_WINTERPRISE_FLAG`, 0.0)) FROM smetasourcedata s1 WHERE s1.SM_ID IN('+
      'SELECT `smetasourcedata`.`SM_ID` '#13 +
      'FROM `smetasourcedata` '#13 +
      'WHERE (`smetasourcedata`.`SM_ID` = s.SM_ID) OR '#13 +
      '      (`smetasourcedata`.`PARENT_ID` = s.SM_ID) OR '#13 +
      '      (`smetasourcedata`.`PARENT_ID` IN ('#13 +
      '        SELECT `smetasourcedata`.`SM_ID`'#13 +
      '        FROM `smetasourcedata`'#13 +
      '        WHERE `smetasourcedata`.`PARENT_ID` = s.SM_ID))'#13 +
      '))) AS PTM_COST,'#13 +
      '/*Выполнено*/ ROUND((SELECT SUM(IF(:FL_INCL_OHROPR_PLPR=1, data_row.`STOIM` + IFNULL(data_row.`OHROPR`, 0) + IFNULL(data_row.`PLAN_PRIB`, 0), data_row.`STOIM`)+' +
      'IF(:FL_INCL_WINTER=1, (IFNULL(data_row.`ZIM_UDOR`, 0) + IFNULL(data_row.`ZP_ZIM_UDOR`, 0)) * s.`APPLY_WINTERPRISE_FLAG`, 0.0)) FROM data_row, smetasourcedata' +
      ' where smetasourcedata.DELETED=0 AND smetasourcedata.FL_USE=1 AND data_row.SM_ID=smetasourcedata.SM_ID AND smetasourcedata.SOURCE_ID IN ('+
      'SELECT `smetasourcedata`.`SM_ID` '#13 +
      'FROM `smetasourcedata` '#13 +
      'WHERE (`smetasourcedata`.`SM_ID` = s.SM_ID) OR '#13 +
      '      (`smetasourcedata`.`PARENT_ID` = s.SM_ID) OR '#13 +
      '      (`smetasourcedata`.`PARENT_ID` IN ('#13 +
      '        SELECT `smetasourcedata`.`SM_ID`'#13 +
      '        FROM `smetasourcedata`'#13 +
      '        WHERE `smetasourcedata`.`PARENT_ID` = s.SM_ID))'#13 +
      '))) AS PTM_COST_DONE,'#13 +
      'ROUND((SELECT SUM(IF(:FL_INCL_OHROPR_PLPR=1, s1.`S_STOIM` + IFNULL(s1.`S_OHROPR`, 0) + IFNULL(s1.`S_PLAN_PRIB`, 0), s1.`S_STOIM`)+' +
      'IF(:FL_INCL_WINTER=1, (s1.`S_ZIM_UDOR` + s1.`S_ZP_ZIM_UDOR`) * s1.`APPLY_WINTERPRISE_FLAG`, 0.0)) FROM smetasourcedata s1 WHERE s1.SM_ID IN ('+
      'SELECT `smetasourcedata`.`SM_ID` '#13 +
      'FROM `smetasourcedata` '#13 +
      'WHERE (`smetasourcedata`.`SM_ID` = s.SM_ID) OR '#13 +
      '      (`smetasourcedata`.`PARENT_ID` = s.SM_ID) OR '#13 +
      '      (`smetasourcedata`.`PARENT_ID` IN ('#13 +
      '        SELECT `smetasourcedata`.`SM_ID`'#13 +
      '        FROM `smetasourcedata`'#13 +
      '        WHERE `smetasourcedata`.`PARENT_ID` = s.SM_ID))'#13 +
      '))' +
      '-IFNULL((SELECT SUM(IF(:FL_INCL_OHROPR_PLPR=1, data_row.`STOIM` + IFNULL(data_row.`OHROPR`, 0) + IFNULL(data_row.`PLAN_PRIB`, 0), data_row.`STOIM`)+' +
      'IF(:FL_INCL_WINTER=1, (IFNULL(data_row.`ZIM_UDOR`, 0) + IFNULL(data_row.`ZP_ZIM_UDOR`, 0)) * s.`APPLY_WINTERPRISE_FLAG`, 0.0)) FROM data_row, smetasourcedata' +
      ' where smetasourcedata.DELETED=0 AND smetasourcedata.FL_USE=1 AND data_row.SM_ID=smetasourcedata.SM_ID AND smetasourcedata.SOURCE_ID IN ('+
      'SELECT `smetasourcedata`.`SM_ID` '#13 +
      'FROM `smetasourcedata` '#13 +
      'WHERE (`smetasourcedata`.`SM_ID` = s.SM_ID) OR '#13 +
      '      (`smetasourcedata`.`PARENT_ID` = s.SM_ID) OR '#13 +
      '      (`smetasourcedata`.`PARENT_ID` IN ('#13 +
      '        SELECT `smetasourcedata`.`SM_ID`'#13 +
      '        FROM `smetasourcedata`'#13 +
      '        WHERE `smetasourcedata`.`PARENT_ID` = s.SM_ID))'#13 +
      ')), 0)) AS PTM_COST_OUT'#13 +
      PTMFieldsEmpty +
      'FROM smetasourcedata s'#13 +
      'WHERE SM_TYPE=2 AND ACT=0 AND'#13 +
      '      OBJ_ID=:OBJ_ID'#13 +
      'UNION ALL'#13 +
      '/* Локальные */'#13 +
      'SELECT CONCAT((s.PARENT_ID), s.SM_ID) AS SM_ID, s.SM_TYPE, s.NAME as NAME, s.SM_NUMBER, s.SM_ID as ID,'#13 +
      'ROUND((SELECT SUM(IF(:FL_INCL_OHROPR_PLPR=1, s1.`S_STOIM` + IFNULL(s1.`S_OHROPR`, 0) + IFNULL(s1.`S_PLAN_PRIB`, 0), s1.`S_STOIM`)+' +
      'IF(:FL_INCL_WINTER=1, (s1.`S_ZIM_UDOR` + s1.`S_ZP_ZIM_UDOR`) * s1.`APPLY_WINTERPRISE_FLAG`, 0.0)) FROM smetasourcedata s1 WHERE s1.PARENT_ID = s.SM_ID)) AS PTM_COST,'#13 +
      '/*Выполнено*/ ROUND((SELECT SUM(IF(:FL_INCL_OHROPR_PLPR=1, data_row.`STOIM` + IFNULL(data_row.`OHROPR`, 0) + IFNULL(data_row.`PLAN_PRIB`, 0), data_row.`STOIM`)+' +
      'IF(:FL_INCL_WINTER=1, (IFNULL(data_row.`ZIM_UDOR`, 0) + IFNULL(data_row.`ZP_ZIM_UDOR`, 0)) * s.`APPLY_WINTERPRISE_FLAG`, 0.0)) FROM data_row, smetasourcedata' +
      ' where smetasourcedata.DELETED=0 AND smetasourcedata.FL_USE=1 AND data_row.SM_ID=smetasourcedata.SM_ID AND smetasourcedata.SOURCE_ID IN ('+
      'SELECT `smetasourcedata`.`SM_ID` '#13 +
      'FROM `smetasourcedata` '#13 +
      'WHERE (`smetasourcedata`.`SM_ID` = s.SM_ID) OR '#13 +
      '      (`smetasourcedata`.`PARENT_ID` = s.SM_ID) OR '#13 +
      '      (`smetasourcedata`.`PARENT_ID` IN ('#13 +
      '        SELECT `smetasourcedata`.`SM_ID`'#13 +
      '        FROM `smetasourcedata`'#13 +
      '        WHERE `smetasourcedata`.`PARENT_ID` = s.SM_ID))'#13 +
      '))) AS PTM_COST_DONE,'#13 +
      'ROUND((SELECT SUM(IF(:FL_INCL_OHROPR_PLPR=1, s1.`S_STOIM` + IFNULL(s1.`S_OHROPR`, 0) + IFNULL(s1.`S_PLAN_PRIB`, 0), s1.`S_STOIM`)+' +
      'IF(:FL_INCL_WINTER=1, (s1.`S_ZIM_UDOR` + s1.`S_ZP_ZIM_UDOR`) * s1.`APPLY_WINTERPRISE_FLAG`, 0.0)) FROM smetasourcedata s1 WHERE s1.PARENT_ID = s.SM_ID)' +
      '-IFNULL((SELECT SUM(IF(:FL_INCL_OHROPR_PLPR=1, data_row.`STOIM` + IFNULL(data_row.`OHROPR`, 0) + IFNULL(data_row.`PLAN_PRIB`, 0), data_row.`STOIM`)+' +
      'IF(:FL_INCL_WINTER=1, (IFNULL(data_row.`ZIM_UDOR`, 0) + IFNULL(data_row.`ZP_ZIM_UDOR`, 0)) * s.`APPLY_WINTERPRISE_FLAG`, 0.0)) FROM data_row, smetasourcedata' +
      ' where smetasourcedata.DELETED=0 AND smetasourcedata.FL_USE=1 AND data_row.SM_ID=smetasourcedata.SM_ID AND smetasourcedata.SOURCE_ID IN ('+
      'SELECT `smetasourcedata`.`SM_ID` '#13 +
      'FROM `smetasourcedata` '#13 +
      'WHERE (`smetasourcedata`.`SM_ID` = s.SM_ID) OR '#13 +
      '      (`smetasourcedata`.`PARENT_ID` = s.SM_ID) OR '#13 +
      '      (`smetasourcedata`.`PARENT_ID` IN ('#13 +
      '        SELECT `smetasourcedata`.`SM_ID`'#13 +
      '        FROM `smetasourcedata`'#13 +
      '        WHERE `smetasourcedata`.`PARENT_ID` = s.SM_ID))'#13 +
      ')), 0)) AS PTM_COST_OUT'#13 +
      PTMFieldsEmpty +
      'FROM smetasourcedata s'#13 +
      'WHERE s.SM_TYPE=1 AND s.ACT=0 AND'#13 +
      '      s.OBJ_ID=:OBJ_ID'#13 +
      'UNION ALL'#13 +
      '/* ПТМ */'#13 +
      'SELECT CONCAT('#13 +
      '(SELECT (s1.PARENT_ID) FROM smetasourcedata s1 WHERE s1.SM_ID=(s2.PARENT_ID)),'#13 +
      '(s2.PARENT_ID), s2.SM_ID) AS SM_ID, s2.SM_TYPE, s2.NAME as NAME, CONCAT('' - '', s2.SM_NUMBER) as SM_NUMBER, SM_ID as ID,'#13 +
      '/* Стоимость */'#13 +
      'ROUND(IF(:FL_INCL_OHROPR_PLPR=1, s2.`S_STOIM` + IFNULL(s2.`S_OHROPR`, 0) + IFNULL(s2.`S_PLAN_PRIB`, 0), s2.`S_STOIM`)+IF(:FL_INCL_WINTER=1, (s2.`S_ZIM_UDOR` + s2.`S_ZP_ZIM_UDOR`) * s2.`APPLY_WINTERPRISE_FLAG`, 0.0)) AS PTM_COST,'#13 +
      '/* ВЫПОЛНЕНО */'#13 +
      'IFNULL(ROUND((SELECT SUM(IF(:FL_INCL_OHROPR_PLPR=1, data_row.`STOIM`+IFNULL(data_row.`OHROPR`, 0)+IFNULL(data_row.`PLAN_PRIB`, 0), data_row.`STOIM`)+IF(:FL_INCL_WINTER=1, (data_row.`ZIM_UDOR` + data_row.`ZP_ZIM_UDOR`) * s2.`APPLY_WINTERPRISE_FLAG`, 0.0))'+
        ' FROM data_row, smetasourcedata WHERE smetasourcedata.SM_ID=data_row.SM_ID AND smetasourcedata.SOURCE_ID = s2.SM_ID AND smetasourcedata.DELETED=0 AND smetasourcedata.FL_USE=1)), 0) AS PTM_COST_DONE,'#13 +
      '/* ОСТАТОК */'#13 +
      'ROUND((IF(:FL_INCL_OHROPR_PLPR=1, s2.`S_STOIM` + IFNULL(s2.`S_OHROPR`, 0) + IFNULL(s2.`S_PLAN_PRIB`, 0), s2.`S_STOIM`)+IF(:FL_INCL_WINTER=1, (s2.`S_ZIM_UDOR` + s2.`S_ZP_ZIM_UDOR`) * s2.`APPLY_WINTERPRISE_FLAG`, 0.0))'+
        '-IFNULL((SELECT SUM(IF(:FL_INCL_OHROPR_PLPR=1, data_row.`STOIM` + IFNULL(data_row.`OHROPR`, 0) + IFNULL(data_row.`PLAN_PRIB`, 0), data_row.`STOIM`)+IF(:FL_INCL_WINTER=1, (data_row.`ZIM_UDOR` + data_row.`ZP_ZIM_UDOR`) * s2.`APPLY_WINTERPRISE_FLAG`, 0.0))'+
        ' FROM data_row, smetasourcedata WHERE smetasourcedata.SM_ID=data_row.SM_ID AND smetasourcedata.SOURCE_ID = s2.SM_ID AND smetasourcedata.DELETED=0 AND smetasourcedata.FL_USE=1), 0)) AS PTM_COST_OUT'#13 +
      PTMFields +
      'FROM smetasourcedata s2'#13 +
      'WHERE s2.SM_TYPE=3 AND s2.ACT=0 AND'#13 +
      '      s2.OBJ_ID=:OBJ_ID'#13 +
      'ORDER BY 1,4,5';

      qrPTM.ParamByName('OBJ_ID').AsInteger := qrObject.FieldByName('OBJ_ID').AsInteger;
      //Включать или нет стоимость зименого удорожания
      if chkZimUdor.Checked then
        qrPTM.ParamByName('FL_INCL_WINTER').AsInteger := 1
      else
        qrPTM.ParamByName('FL_INCL_WINTER').AsInteger := 0;

      //Включать или нет стоимость ОХРиОПР и плановой прибыли
      if chkOHROPRPP.Checked then
        qrPTM.ParamByName('FL_INCL_OHROPR_PLPR').AsInteger := 1
      else
        qrPTM.ParamByName('FL_INCL_OHROPR_PLPR').AsInteger := 0;

      qrPTM.Active := True;
    except
      ShowMessage('Ошибка получения данных по ПТМ!');
    end;

    // По сметам
    if pgcPage.ActivePageIndex = 2 then
    try
      qrEstimate.Active := False;
      qrEstimate.SQL.Text :=
        '/* Объектные */'#13 +
        'SELECT SM_ID, SM_TYPE, NAME as NAME, SM_NUMBER, SM_ID as ID,'#13 +
        'ROUND((SELECT SUM(IF(:FL_INCL_OHROPR_PLPR=1, s1.`S_STOIM` + IFNULL(s1.`S_OHROPR`, 0) + IFNULL(s1.`S_PLAN_PRIB`, 0), s1.`S_STOIM`)+' +
        'IF(:FL_INCL_WINTER=1, (s1.`S_ZIM_UDOR` + s1.`S_ZP_ZIM_UDOR`) * s1.`APPLY_WINTERPRISE_FLAG`, 0.0)) FROM smetasourcedata s1 WHERE s1.SM_ID IN('+
        'SELECT `smetasourcedata`.`SM_ID` '#13 +
        'FROM `smetasourcedata` '#13 +
        'WHERE (`smetasourcedata`.`SM_ID` = s.SM_ID) OR '#13 +
        '      (`smetasourcedata`.`PARENT_ID` = s.SM_ID) OR '#13 +
        '      (`smetasourcedata`.`PARENT_ID` IN ('#13 +
        '        SELECT `smetasourcedata`.`SM_ID`'#13 +
        '        FROM `smetasourcedata`'#13 +
        '        WHERE `smetasourcedata`.`PARENT_ID` = s.SM_ID))'#13 +
        '))) AS PTM_COST,'#13 +
        '/*Выполнено*/ ROUND((SELECT SUM(IF(:FL_INCL_OHROPR_PLPR=1, data_row.`STOIM` + IFNULL(data_row.`OHROPR`, 0) + IFNULL(data_row.`PLAN_PRIB`, 0), data_row.`STOIM`)+' +
        'IF(:FL_INCL_WINTER=1, (IFNULL(data_row.`ZIM_UDOR`, 0) + IFNULL(data_row.`ZP_ZIM_UDOR`, 0)) * s.`APPLY_WINTERPRISE_FLAG`, 0.0)) FROM data_row, smetasourcedata' +
        ' where smetasourcedata.DELETED=0 AND smetasourcedata.FL_USE=1 AND data_row.SM_ID=smetasourcedata.SM_ID AND smetasourcedata.SOURCE_ID IN ('+
        'SELECT `smetasourcedata`.`SM_ID` '#13 +
        'FROM `smetasourcedata` '#13 +
        'WHERE (`smetasourcedata`.`SM_ID` = s.SM_ID) OR '#13 +
        '      (`smetasourcedata`.`PARENT_ID` = s.SM_ID) OR '#13 +
        '      (`smetasourcedata`.`PARENT_ID` IN ('#13 +
        '        SELECT `smetasourcedata`.`SM_ID`'#13 +
        '        FROM `smetasourcedata`'#13 +
        '        WHERE `smetasourcedata`.`PARENT_ID` = s.SM_ID))'#13 +
        '))) AS PTM_COST_DONE,'#13 +
        'ROUND((SELECT SUM(IF(:FL_INCL_OHROPR_PLPR=1, s1.`S_STOIM` + IFNULL(s1.`S_OHROPR`, 0) + IFNULL(s1.`S_PLAN_PRIB`, 0), s1.`S_STOIM`)+' +
        'IF(:FL_INCL_WINTER=1, (s1.`S_ZIM_UDOR` + s1.`S_ZP_ZIM_UDOR`) * s1.`APPLY_WINTERPRISE_FLAG`, 0.0)) FROM smetasourcedata s1 WHERE s1.SM_ID IN ('+
        'SELECT `smetasourcedata`.`SM_ID` '#13 +
        'FROM `smetasourcedata` '#13 +
        'WHERE (`smetasourcedata`.`SM_ID` = s.SM_ID) OR '#13 +
        '      (`smetasourcedata`.`PARENT_ID` = s.SM_ID) OR '#13 +
        '      (`smetasourcedata`.`PARENT_ID` IN ('#13 +
        '        SELECT `smetasourcedata`.`SM_ID`'#13 +
        '        FROM `smetasourcedata`'#13 +
        '        WHERE `smetasourcedata`.`PARENT_ID` = s.SM_ID))'#13 +
        '))' +
        '-IFNULL((SELECT SUM(IF(:FL_INCL_OHROPR_PLPR=1, data_row.`STOIM` + IFNULL(data_row.`OHROPR`, 0) + IFNULL(data_row.`PLAN_PRIB`, 0), data_row.`STOIM`)+' +
        'IF(:FL_INCL_WINTER=1, (IFNULL(data_row.`ZIM_UDOR`, 0) + IFNULL(data_row.`ZP_ZIM_UDOR`, 0)) * s.`APPLY_WINTERPRISE_FLAG`, 0.0)) FROM data_row, smetasourcedata' +
        ' where smetasourcedata.DELETED=0 AND smetasourcedata.FL_USE=1 AND data_row.SM_ID=smetasourcedata.SM_ID AND smetasourcedata.SOURCE_ID IN ('+
        'SELECT `smetasourcedata`.`SM_ID` '#13 +
        'FROM `smetasourcedata` '#13 +
        'WHERE (`smetasourcedata`.`SM_ID` = s.SM_ID) OR '#13 +
        '      (`smetasourcedata`.`PARENT_ID` = s.SM_ID) OR '#13 +
        '      (`smetasourcedata`.`PARENT_ID` IN ('#13 +
        '        SELECT `smetasourcedata`.`SM_ID`'#13 +
        '        FROM `smetasourcedata`'#13 +
        '        WHERE `smetasourcedata`.`PARENT_ID` = s.SM_ID))'#13 +
        ')), 0)) AS PTM_COST_OUT'#13 +
        PTMFieldsEmpty +
        'FROM smetasourcedata s'#13 +
        'WHERE SM_TYPE=2 AND ACT=0 AND'#13 +
        '      OBJ_ID=:OBJ_ID'#13 +
        'UNION ALL'#13 +
        '/* Локальные */'#13 +
        'SELECT CONCAT((s.PARENT_ID), s.SM_ID) AS SM_ID, s.SM_TYPE, s.NAME as NAME, s.SM_NUMBER, s.SM_ID as ID,'#13 +
        'ROUND((SELECT SUM(IF(:FL_INCL_OHROPR_PLPR=1, s1.`S_STOIM` + IFNULL(s1.`S_OHROPR`, 0) + IFNULL(s1.`S_PLAN_PRIB`, 0), s1.`S_STOIM`)+' +
        'IF(:FL_INCL_WINTER=1, (s1.`S_ZIM_UDOR` + s1.`S_ZP_ZIM_UDOR`) * s1.`APPLY_WINTERPRISE_FLAG`, 0.0)) FROM smetasourcedata s1 WHERE s1.PARENT_ID = s.SM_ID)) AS PTM_COST,'#13 +
        '/*Выполнено*/ ROUND((SELECT SUM(IF(:FL_INCL_OHROPR_PLPR=1, data_row.`STOIM` + IFNULL(data_row.`OHROPR`, 0) + IFNULL(data_row.`PLAN_PRIB`, 0), data_row.`STOIM`)+' +
        'IF(:FL_INCL_WINTER=1, (IFNULL(data_row.`ZIM_UDOR`, 0) + IFNULL(data_row.`ZP_ZIM_UDOR`, 0)) * s.`APPLY_WINTERPRISE_FLAG`, 0.0)) FROM data_row, smetasourcedata' +
        ' where smetasourcedata.DELETED=0 AND smetasourcedata.FL_USE=1 AND data_row.SM_ID=smetasourcedata.SM_ID AND smetasourcedata.SOURCE_ID IN ('+
        'SELECT `smetasourcedata`.`SM_ID` '#13 +
        'FROM `smetasourcedata` '#13 +
        'WHERE (`smetasourcedata`.`SM_ID` = s.SM_ID) OR '#13 +
        '      (`smetasourcedata`.`PARENT_ID` = s.SM_ID) OR '#13 +
        '      (`smetasourcedata`.`PARENT_ID` IN ('#13 +
        '        SELECT `smetasourcedata`.`SM_ID`'#13 +
        '        FROM `smetasourcedata`'#13 +
        '        WHERE `smetasourcedata`.`PARENT_ID` = s.SM_ID))'#13 +
        '))) AS PTM_COST_DONE,'#13 +
        'ROUND((SELECT SUM(IF(:FL_INCL_OHROPR_PLPR=1, s1.`S_STOIM` + IFNULL(s1.`S_OHROPR`, 0) + IFNULL(s1.`S_PLAN_PRIB`, 0), s1.`S_STOIM`)+' +
        'IF(:FL_INCL_WINTER=1, (s1.`S_ZIM_UDOR` + s1.`S_ZP_ZIM_UDOR`) * s1.`APPLY_WINTERPRISE_FLAG`, 0.0)) FROM smetasourcedata s1 WHERE s1.PARENT_ID = s.SM_ID)' +
        '-IFNULL((SELECT SUM(IF(:FL_INCL_OHROPR_PLPR=1, data_row.`STOIM` + IFNULL(data_row.`OHROPR`, 0) + IFNULL(data_row.`PLAN_PRIB`, 0), data_row.`STOIM`)+' +
        'IF(:FL_INCL_WINTER=1, (IFNULL(data_row.`ZIM_UDOR`, 0) + IFNULL(data_row.`ZP_ZIM_UDOR`, 0)) * s.`APPLY_WINTERPRISE_FLAG`, 0.0)) FROM data_row, smetasourcedata' +
        ' where smetasourcedata.DELETED=0 AND smetasourcedata.FL_USE=1 AND data_row.SM_ID=smetasourcedata.SM_ID AND smetasourcedata.SOURCE_ID IN ('+
        'SELECT `smetasourcedata`.`SM_ID` '#13 +
        'FROM `smetasourcedata` '#13 +
        'WHERE (`smetasourcedata`.`SM_ID` = s.SM_ID) OR '#13 +
        '      (`smetasourcedata`.`PARENT_ID` = s.SM_ID) OR '#13 +
        '      (`smetasourcedata`.`PARENT_ID` IN ('#13 +
        '        SELECT `smetasourcedata`.`SM_ID`'#13 +
        '        FROM `smetasourcedata`'#13 +
        '        WHERE `smetasourcedata`.`PARENT_ID` = s.SM_ID))'#13 +
        ')), 0)) AS PTM_COST_OUT'#13 +
        PTMFieldsEmpty +
        'FROM smetasourcedata s'#13 +
        'WHERE s.SM_TYPE=1 AND s.ACT=0 AND'#13 +
        '      s.OBJ_ID=:OBJ_ID'#13 +
        'ORDER BY 1,4,5';

      qrEstimate.ParamByName('OBJ_ID').AsInteger := qrObject.FieldByName('OBJ_ID').AsInteger;
      //Включать или нет стоимость зименого удорожания
      if chkZimUdor.Checked then
        qrEstimate.ParamByName('FL_INCL_WINTER').AsInteger := 1
      else
        qrEstimate.ParamByName('FL_INCL_WINTER').AsInteger := 0;

      //Включать или нет стоимость ОХРиОПР и плановой прибыли
      if chkOHROPRPP.Checked then
        qrEstimate.ParamByName('FL_INCL_OHROPR_PLPR').AsInteger := 1
      else
        qrEstimate.ParamByName('FL_INCL_OHROPR_PLPR').AsInteger := 0;
      qrEstimate.Active := True;
    except
      ShowMessage('Ошибка получения данных по сметам!');
    end;
  finally
    UpdateNumPP;
    qrData.EnableControls;
    qrPTM.EnableControls;
    //FormWaiting.Close;
  end;
end;

procedure TfKC6Journal.dbgrdDataDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer;
  Column: TColumn; State: TGridDrawState);
begin
  with (Sender AS TJvDBGrid).Canvas do
  begin
    Brush.Color := PS.BackgroundRows;
    Font.Color := PS.FontRows;

    // Строка в фокусе
    if (Assigned(TMyDBGrid((Sender AS TJvDBGrid)).DataLink) and
      ((Sender AS TJvDBGrid).Row = TMyDBGrid((Sender AS TJvDBGrid)).DataLink.ActiveRecord + 1)) then
    begin
      Brush.Color := PS.BackgroundSelectRow;
      Font.Color := PS.FontSelectRow;
    end;
    // Ячейка в фокусе
    if (gdSelected in State) then
    begin
      Brush.Color := PS.BackgroundSelectCell;
      Font.Color := PS.FontSelectCell;
      Font.Style := Font.Style + [fsBold];
    end;
  end;

  (Sender AS TJvDBGrid).DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfKC6Journal.FormActivate(Sender: TObject);
begin
  // Если нажата клавиша Ctrl и выбираем форму, то делаем
  // каскадирование с переносом этой формы на передний план
  FormMain.CascadeForActiveWindow;
  // Делаем нажатой кнопку активной формы (на главной форме внизу)
  FormMain.SelectButtonActiveWindow(Caption);
end;

procedure TfKC6Journal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfKC6Journal.FormCreate(Sender: TObject);
begin
  inherited;
  // Создаём кнопку от этого окна (на главной форме внизу)
  FormMain.CreateButtonOpenWindow(Caption, Caption, Self, 1);
  qrObject.Active := True;
  qrTreeData.Active := True;
  qrDetail.Active := True;
  
  SkipReload := True;
  cbbToMonth.ItemIndex := MonthOf(Now) - 1;
  seToYear.Value := YearOf(Now);
  SkipReload := False;

  pgcPage.ActivePageIndex := 0;
end;

procedure TfKC6Journal.FormDestroy(Sender: TObject);
begin
  fKC6Journal := nil;
  // Удаляем кнопку от этого окна (на главной форме внизу)
  FormMain.DeleteButtonCloseWindow(Caption);
end;

procedure TfKC6Journal.FormResize(Sender: TObject);
begin
  FixDBGridColumnsWidth(dbgrd2);
end;

procedure TfKC6Journal.tvEstimatesClick(Sender: TObject);
begin
  cbbFromMonthChange(Self);
  UpdateNumPP;
end;

procedure TfKC6Journal.LocateEstimate(Estimate_ID: Integer);
begin
  if not qrTreeData.Active then
    Exit;
  qrTreeData.Locate('SM_ID', Estimate_ID, []);
end;

procedure TfKC6Journal.LocateObject(Object_ID: Integer);
begin
  qrObject.Locate('OBJ_ID', Object_ID, []);
  dblkcbbNAME.KeyValue := Object_ID;
  CloseOpen(qrTreeData, False);
end;

procedure TfKC6Journal.pgcPageChange(Sender: TObject);
begin
  rbRates.Checked := pgcPage.ActivePageIndex = 0;
  rbPTM.Checked := pgcPage.ActivePageIndex = 1;
  cbbMode.Visible := pgcPage.ActivePageIndex = 0;
  cbbFromMonthChange(Sender);
end;

procedure TfKC6Journal.qrDetailCalcFields(DataSet: TDataSet);
begin
  qrDetailNumber.Value := DataSet.RecNo + 1;
end;

procedure TfKC6Journal.qrObjectAfterScroll(DataSet: TDataSet);
begin
  if not qrTreeData.Active then
    Exit;
  SkipReload := True;
  cbbFromMonth.ItemIndex := MonthOf(qrObject.FieldByName('date').AsDateTime) - 1;
  seFromYear.Value := YearOf(qrObject.FieldByName('date').AsDateTime);
  SkipReload := False;
  cbbFromMonthChange(Self);
end;

procedure TfKC6Journal.rbRatesClick(Sender: TObject);
begin
  if rbRates.Checked then
    pgcPage.ActivePageIndex := 0
  else
    if rbPTM.Checked then
      pgcPage.ActivePageIndex := 1
    else
     pgcPage.ActivePageIndex := 2;
  cbbFromMonthChange(Self);
end;

procedure TfKC6Journal.UpdateNumPP;
var
  NumPP: Integer;
begin
  if not CheckQrActiveEmpty(qrData) then
    Exit;
  // Устанавливаем №пп
  qrData.DisableControls;
  NumPP := 0;
  try
    qrData.First;
    while not qrData.Eof do
    begin
      NumPP := NumPP + qrData.FieldByName('INCITERATOR').AsInteger;
      qrData.Edit;
      if qrData.FieldByName('ID_TYPE_DATA').AsInteger < 0 then
        qrData.FieldByName('ITERATOR').Value := null
      else qrData.FieldByName('ITERATOR').AsInteger := NumPP;
      qrData.Next;
    end;
  finally
    qrData.First;
    qrData.EnableControls;
  end;
end;

end.
