unit BasicData;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, ComCtrls,
  ExtCtrls, DB, DateUtils, DBCtrls, Menus, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Samples.Spin, System.UITypes, Vcl.Mask, Vcl.Grids,
  Vcl.DBGrids, JvExDBGrids, JvDBGrid, Vcl.DBCGrids, Tools;

type
  TFormBasicData = class(TSmForm)
    LabelPercentTransportEquipment: TLabel;
    LabelK31: TLabel;
    LabelK32: TLabel;
    LabelK33: TLabel;
    LabelEstimateForDate: TLabel;
    LabelRateWorker: TLabel;
    LabelRegion: TLabel;
    EditRegion: TEdit;
    LabelVAT: TLabel;
    ComboBoxVAT: TComboBox;
    Bevel1: TBevel;
    ComboBoxMonth: TComboBox;
    Bevel3: TBevel;
    Bevel4: TBevel;
    Bevel5: TBevel;
    LabelDump: TLabel;
    dblkcbbDump: TDBLookupComboBox;
    DBLookupComboBoxRegionDump: TDBLookupComboBox;
    dsDump: TDataSource;
    pmTransport: TPopupMenu;
    PopupMenuPercentTransportCity: TMenuItem;
    PopupMenuPercentTransportVillage: TMenuItem;
    PopupMenuPercentTransportMinsk: TMenuItem;
    DataSourceRegionDump: TDataSource;
    qrDump: TFDQuery;
    ADOQueryRegionDump: TFDQuery;
    qrTMP: TFDQuery;
    lbl1: TLabel;
    edtYear: TSpinEdit;
    pnl1: TPanel;
    lblRateMachinist: TLabel;
    edtRateMachinist: TEdit;
    edtPercentTransport: TEdit;
    lblPercentTransport: TLabel;
    lblK: TLabel;
    edtK40: TEdit;
    lbl3: TLabel;
    qrMAIS: TFDQuery;
    dsMAIS: TDataSource;
    dblkcbbMAIS: TDBLookupComboBox;
    lbl5: TLabel;
    bvl1: TBevel;
    qrSmeta: TFDQuery;
    dsSmeta: TDataSource;
    lbl2: TLabel;
    dbedtK35: TDBEdit;
    dbedtEditRateWorker: TDBEdit;
    dbchkAPPLY_LOW_COEF_OHROPR_FLAG: TDBCheckBox;
    pnlLowCoef: TPanel;
    lbl6: TLabel;
    dbedtK_LOW_OHROPR: TDBEdit;
    lbl7: TLabel;
    dbedtK_LOW_PLAN_PRIB: TDBEdit;
    dbchkcoef_orders: TDBCheckBox;
    dbchkAPPLY_WINTERPRISE_FLAG: TDBCheckBox;
    dsCoef: TDataSource;
    qrCoef: TFDQuery;
    pmCoef: TPopupMenu;
    mN1: TMenuItem;
    mN2: TMenuItem;
    edtK: TEdit;
    lblK1: TLabel;
    dbrgrpCOEF_ORDERS: TDBRadioGroup;
    pnl2: TPanel;
    lbl8: TLabel;
    grCoef: TJvDBGrid;
    pnl3: TPanel;
    btnSave: TButton;
    btnCancel: TButton;
    dbedtcoef_tr_obor: TDBEdit;
    dbedtKZP: TDBEdit;
    dbedtK31: TDBEdit;
    dbedtK32: TDBEdit;
    dbedtK33: TDBEdit;
    dbedtK34: TDBEdit;

    procedure FormShow(Sender: TObject);

    procedure ShowForm(const vIdObject, vIdEstimate: Integer);
    procedure btnSaveClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure ComboBoxMonthORYearChange(Sender: TObject);
    procedure DBLookupComboBoxRegionDumpClick(Sender: TObject);
    procedure PopupMenuPercentTransportMinskClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure dbchkAPPLY_LOW_COEF_OHROPR_FLAGClick(Sender: TObject);
    procedure qrSmetaAfterOpen(DataSet: TDataSet);
    procedure dbedtEditRateWorkerEnter(Sender: TObject);
    procedure qrCoefNewRecord(DataSet: TDataSet);
    procedure mN1Click(Sender: TObject);
    procedure mN2Click(Sender: TObject);
    procedure pmCoefPopup(Sender: TObject);
    procedure qrCoefBeforeOpen(DataSet: TDataSet);
    procedure dbchkcoef_ordersClick(Sender: TObject);
    procedure grCoefDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    // Устанавливаем флаг состояния (применять/ не применять) коэффициента по приказам

  private
    IdObject: Integer;
    IdEstimate: Integer;
    IdDump: Variant;
    flLoaded: Boolean; // Признак завершения загрузки формы

    PercentTransportCity: Double;
    PercentTransportVillage: Double;
    PercentTransportMinsk: Double;
  end;

var
  FormBasicData: TFormBasicData;

implementation

uses Main, DataModule, CalculationEstimate, Coef, GlobsAndConst;

{$R *.dfm}

procedure TFormBasicData.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var
  IdStavka: Integer;
begin
  CanClose := False;
  IdStavka := -1;

  with qrTMP do
  begin
    Active := False;
    SQL.Clear;
    SQL.Add('SELECT stavka_id FROM smetasourcedata WHERE sm_id = :sm_id;');
    ParamByName('sm_id').Value := IdEstimate;
    Active := True;
    if not Eof then
      IdStavka := FieldByName('stavka_id').AsInteger;
    Active := False;
  end;

  if IdStavka <= 0 then
  begin
    MessageDlg('Для выбраных значений масяца и года расценки отсутствуют!'#13 +
      'Укажите месяц и год расценок.', mtError, [mbOK], 0);
    CanClose := False;
    exit;
  end;
  CanClose := True;
end;

procedure TFormBasicData.FormCreate(Sender: TObject);
begin
  inherited;
  flLoaded := False;
  Left := FormMain.Left + (FormMain.Width - Width) div 2;
  Top := FormMain.Top + (FormMain.Height - Height) div 2;
end;

procedure TFormBasicData.FormShow(Sender: TObject);
var
  IdStavka: String;
  REGION_ID: Variant;
begin
  flLoaded := False;
  qrSmeta.Active := False;
  qrSmeta.ParamByName('IdEstimate').AsInteger := IdEstimate;
  qrSmeta.Active := True;
  CloseOpen(qrCoef);
  CloseOpen(qrMAIS);

  with qrTMP do
  begin
    Active := False;
    SQL.Clear;
    SQL.Add('SELECT * FROM objregion ORDER BY obj_region_id;');
    Active := True;

    First;
    PercentTransportCity := FieldByName('percent_transport').AsVariant;
    PopupMenuPercentTransportCity.Caption := FieldByName('region').AsVariant + ' - ' +
      MyFloatToStr(PercentTransportCity) + '%';

    Next;
    PercentTransportVillage := FieldByName('percent_transport').AsVariant;
    PopupMenuPercentTransportVillage.Caption := FieldByName('region').AsVariant + ' - ' +
      MyFloatToStr(PercentTransportVillage) + '%';

    Next;
    PercentTransportMinsk := FieldByName('percent_transport').AsVariant;
    PopupMenuPercentTransportMinsk.Caption := FieldByName('region').AsVariant + ' - ' +
      MyFloatToStr(PercentTransportMinsk) + '%';
  end;

  // ----------------------------------------

  with qrTMP do
  begin
    Active := False;
    SQL.Clear;
    SQL.Add('SELECT coef_tr_zatr, k40, k41, IFNULL(nds, 0) AS NDS, stavka_id, date, dump_id, coef_orders ' +
      'FROM smetasourcedata WHERE sm_id = :sm_id;');
    ParamByName('sm_id').Value := IdEstimate;
    Active := True;

    edtPercentTransport.Text := MyFloatToStr(FieldByName('coef_tr_zatr').AsFloat);
    edtK40.Text := MyFloatToStr(FieldByName('K40').AsFloat);
    // EditK41.Text := MyFloatToStr(FieldByName('K41').AsFloat);

    ComboBoxVAT.ItemIndex := FieldByName('nds').AsVariant;

    IdStavka := FieldByName('stavka_id').AsVariant;
    IdDump := FieldByName('dump_id').AsVariant;

    { vDate := Now;
      ComboBoxMonth.ItemIndex := MonthOf(vDate) - 1;
      edtYear.Value := YearOf(vDate); }

    // ----------------------------------------

    Active := False;
    SQL.Clear;
    SQL.Add('SELECT monat, year, stavka_m_rab, stavka_m_mach FROM stavka WHERE stavka_id = :stavka_id;');
    ParamByName('stavka_id').Value := IdStavka;
    Active := True;

    if not Eof then
    begin
      edtYear.OnChange := nil;
      ComboBoxMonth.OnChange := nil;
      ComboBoxMonth.ItemIndex := FieldByName('monat').AsInteger - 1;
      edtYear.Value := FieldByName('year').AsInteger;
      if VarIsNull(qrSmeta.FieldByName('STAVKA_RAB').Value) then
        qrSmeta.FieldByName('STAVKA_RAB').Value := FieldByName('stavka_m_rab').AsVariant;
      edtRateMachinist.Text := FieldByName('stavka_m_mach').AsVariant;
      edtYear.OnChange := ComboBoxMonthORYearChange;
      ComboBoxMonth.OnChange := ComboBoxMonthORYearChange;
    end;
    // ----------------------------------------

    Active := False;
    SQL.Clear;
    SQL.Add('SELECT objcards.REGION_ID, objstroj.obj_region as "IdRegion", objregion.region as "NameRegion" '
      + 'FROM objcards, objstroj, objregion WHERE objcards.stroj_id = objstroj.stroj_id and ' +
      'objstroj.obj_region = objregion.obj_region_id and objcards.obj_id = :obj_id;');
    ParamByName('obj_id').Value := IdObject;
    Active := True;

    EditRegion.Tag := FieldByName('IdRegion').AsVariant;
    EditRegion.Text := FieldByName('NameRegion').AsVariant;
    REGION_ID := FieldByName('REGION_ID').Value;

    // ----------------------------------------

    with ADOQueryRegionDump, DBLookupComboBoxRegionDump do
    begin
      Active := False;
      SQL.Clear;
      SQL.Add('SELECT region_id, region_name FROM regions ORDER BY 2');
      Active := True;

      First;
      ListSource := DataSourceRegionDump;
      ListField := 'region_name';
      KeyField := 'region_id';
    end;

    // Если в смете свалка не указана берём из объекта, если указан из сметы
    if IdDump <> NULL then
    begin
      Active := False;
      SQL.Clear;
      SQL.Add('SELECT region_id FROM dump WHERE dump_id = :dump_id;');
      ParamByName('dump_id').Value := IdDump;
      Active := True;

      DBLookupComboBoxRegionDump.KeyValue := FieldByName('region_id').AsVariant;
    end
    else
      DBLookupComboBoxRegionDump.KeyValue := REGION_ID;

    DBLookupComboBoxRegionDumpClick(DBLookupComboBoxRegionDump);
  end;
  flLoaded := True;
end;

procedure TFormBasicData.grCoefDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer;
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

procedure TFormBasicData.mN1Click(Sender: TObject);
begin
  qrCoef.CheckBrowseMode;
  qrCoef.Append;
end;

procedure TFormBasicData.mN2Click(Sender: TObject);
var
  tableName: string;
begin
  if Application.MessageBox('Удалить запись?', 'Вопрос', MB_YESNO + MB_ICONQUESTION + MB_TOPMOST) = IDYES then
  begin
    qrCoef.CheckBrowseMode;

    if Assigned(FormCalculationEstimate) then
      tableName := 'calculation_coef_temp'
    else
      tableName := 'calculation_coef';

    // Каскадное удаление наборав из связанных смет и всего что в смете находится
    DM.qrDifferent.SQL.Text := 'DELETE FROM ' + tableName + ' WHERE SM_ID IN '#13 +
      '(SELECT SM_ID FROM smetasourcedata WHERE (PARENT_ID=:ID_ESTIMATE)'#13 +
      ' OR (SM_ID=:ID_ESTIMATE) OR (PARENT_ID IN (SELECT SM_ID FROM smetasourcedata WHERE PARENT_ID = :ID_ESTIMATE)))'#13
      + ' /*AND id_type_data=:id_type_data AND id_owner=0*/ AND id_coef=:id_coef';

    DM.qrDifferent.ParamByName('id_estimate').Value := qrCoef.FieldByName('SM_ID').Value;
    { DM.qrDifferent.ParamByName('id_type_data').Value := qrCoef.FieldByName('id_type_data').Value; }
    DM.qrDifferent.ParamByName('id_coef').Value := qrCoef.FieldByName('id_coef').Value;
    DM.qrDifferent.ExecSQL;

    CloseOpen(qrCoef);
    // qrCoef.Delete;
  end;
end;

procedure TFormBasicData.pmCoefPopup(Sender: TObject);
begin
  mN2.Enabled := CheckQrActiveEmpty(qrCoef);
end;

procedure TFormBasicData.ShowForm(const vIdObject, vIdEstimate: Integer);
begin
  IdObject := vIdObject;
  IdEstimate := vIdEstimate;

  ShowModal;
end;

procedure TFormBasicData.PopupMenuPercentTransportMinskClick(Sender: TObject);
begin
  with edtPercentTransport do
    case (Sender as TMenuItem).Tag of
      1:
        Text := MyFloatToStr(PercentTransportCity);
      2:
        Text := MyFloatToStr(PercentTransportVillage);
      3:
        Text := MyFloatToStr(PercentTransportMinsk);
    end;
end;

procedure TFormBasicData.qrCoefBeforeOpen(DataSet: TDataSet);
begin
  qrCoef.SQL.Text := StringReplace(qrCoef.SQL.Text, '`calculation_coef_temp`', '`calculation_coef`',
    [rfReplaceAll, rfIgnoreCase]);
  if Assigned(FormCalculationEstimate) then
    qrCoef.SQL.Text := StringReplace(qrCoef.SQL.Text, '`calculation_coef`', '`calculation_coef_temp`',
      [rfReplaceAll, rfIgnoreCase]);
end;

procedure TFormBasicData.qrCoefNewRecord(DataSet: TDataSet);
var
  tableName: string;
  AutoCommitValue: Boolean;
begin
  // Показываем справочник наборов коэф.
  if fCoefficients.ShowModal = mrOk then
  begin
    AutoCommitValue := DM.Read.Options.AutoCommit;
    try
      DM.Read.Options.AutoCommit := False;
      DM.Read.StartTransaction;
      try
        qrCoef.FieldByName('calculation_coef_id').Value := FastSelectSQLOne('SELECT GetNewID(:IDType)',
          VarArrayOf([C_ID_SMCOEF]));
        qrCoef.FieldByName('SM_ID').Value := qrSmeta.FieldByName('SM_ID').Value;
        qrCoef.FieldByName('id_type_data').Value := qrSmeta.FieldByName('SM_TYPE').Value * -1;
        qrCoef.FieldByName('id_owner').Value := 0;
        qrCoef.FieldByName('id_coef').Value := fCoefficients.qrCoef.FieldByName('coef_id').Value;
        qrCoef.FieldByName('COEF_NAME').Value := fCoefficients.qrCoef.FieldByName('COEF_NAME').Value;
        qrCoef.FieldByName('OSN_ZP').Value := fCoefficients.qrCoef.FieldByName('OSN_ZP').Value;
        qrCoef.FieldByName('EKSP_MACH').Value := fCoefficients.qrCoef.FieldByName('EKSP_MACH').Value;
        qrCoef.FieldByName('MAT_RES').Value := fCoefficients.qrCoef.FieldByName('MAT_RES').Value;
        qrCoef.FieldByName('WORK_PERS').Value := fCoefficients.qrCoef.FieldByName('WORK_PERS').Value;
        qrCoef.FieldByName('WORK_MACH').Value := fCoefficients.qrCoef.FieldByName('WORK_MACH').Value;
        qrCoef.FieldByName('OXROPR').Value := fCoefficients.qrCoef.FieldByName('OXROPR').Value;
        qrCoef.FieldByName('PLANPRIB').Value := fCoefficients.qrCoef.FieldByName('PLANPRIB').Value;
        qrCoef.FieldByName('ZP_MASH').Value := fCoefficients.qrCoef.FieldByName('ZP_MASH').Value;
        qrCoef.Post;

        if Assigned(FormCalculationEstimate) then
          tableName := '_temp'
        else
          tableName := '';

        // Добавление во все содерожимое сметы, кроме пусконаладки
        FastExecSQL('INSERT INTO `calculation_coef' + tableName + '`(`calculation_coef_id`, ' +
          '`SM_ID`, `id_type_data`, `id_owner`,'#13 +
          ' `id_coef`, `COEF_NAME`, `OSN_ZP`, `EKSP_MACH`, `MAT_RES`, `WORK_PERS`,'#13 +
          '  `WORK_MACH`, `OXROPR`, `PLANPRIB`, `ZP_MASH`)'#13 +
          '(SELECT GetNewID(:IDType),SM_ID,ID_TYPE_DATA,ID_TABLES,'#13 +
          ':id_coef,:COEF_NAME,:OSN_ZP,:EKSP_MACH,:MAT_RES,:WORK_PERS,:WORK_MACH,:OXROPR,:PLANPRIB,:ZP_MASH'#13
          + 'FROM data_row' + tableName + ' WHERE SM_ID=:id_estimate AND ID_TYPE_DATA<10)',
          VarArrayOf([C_ID_SMCOEF, fCoefficients.qrCoef.FieldByName('coef_id').Value,
          fCoefficients.qrCoef.FieldByName('COEF_NAME').Value, fCoefficients.qrCoef.FieldByName('OSN_ZP')
          .Value, fCoefficients.qrCoef.FieldByName('EKSP_MACH').Value,
          fCoefficients.qrCoef.FieldByName('MAT_RES').Value, fCoefficients.qrCoef.FieldByName('WORK_PERS')
          .Value, fCoefficients.qrCoef.FieldByName('WORK_MACH').Value,
          fCoefficients.qrCoef.FieldByName('OXROPR').Value, fCoefficients.qrCoef.FieldByName('PLANPRIB')
          .Value, fCoefficients.qrCoef.FieldByName('ZP_MASH').Value, qrSmeta.FieldByName('SM_ID').Value]));

        // Каскадно добавляем выбранный кф. на все зависимые сметы
        DM.qrDifferent.SQL.Text := 'INSERT INTO `calculation_coef' + tableName + '`(`calculation_coef_id`, ' +
          '`SM_ID`, `id_type_data`, `id_owner`,'#13 +
          ' `id_coef`, `COEF_NAME`, `OSN_ZP`, `EKSP_MACH`, `MAT_RES`, `WORK_PERS`,'#13 +
          '  `WORK_MACH`, `OXROPR`, `PLANPRIB`, `ZP_MASH`)'#13 +
          'VALUE(GetNewID(:IDType), :id_estimate,:id_type_data,:id_owner,'#13 +
          ':id_coef,:COEF_NAME,:OSN_ZP,:EKSP_MACH,:MAT_RES,:WORK_PERS,:WORK_MACH,:OXROPR,:PLANPRIB,:ZP_MASH)';
        DM.qrDifferent.ParamByName('IDType').Value := C_ID_SMCOEF;
        DM.qrDifferent.ParamByName('id_type_data').Value := qrSmeta.FieldByName('SM_TYPE').Value * -1;
        DM.qrDifferent.ParamByName('id_owner').Value := 0;
        DM.qrDifferent.ParamByName('id_coef').Value := fCoefficients.qrCoef.FieldByName('coef_id').Value;
        DM.qrDifferent.ParamByName('COEF_NAME').Value := fCoefficients.qrCoef.FieldByName('COEF_NAME').Value;
        DM.qrDifferent.ParamByName('OSN_ZP').Value := fCoefficients.qrCoef.FieldByName('OSN_ZP').Value;
        DM.qrDifferent.ParamByName('EKSP_MACH').Value := fCoefficients.qrCoef.FieldByName('EKSP_MACH').Value;
        DM.qrDifferent.ParamByName('MAT_RES').Value := fCoefficients.qrCoef.FieldByName('MAT_RES').Value;
        DM.qrDifferent.ParamByName('WORK_PERS').Value := fCoefficients.qrCoef.FieldByName('WORK_PERS').Value;
        DM.qrDifferent.ParamByName('WORK_MACH').Value := fCoefficients.qrCoef.FieldByName('WORK_MACH').Value;
        DM.qrDifferent.ParamByName('OXROPR').Value := fCoefficients.qrCoef.FieldByName('OXROPR').Value;
        DM.qrDifferent.ParamByName('PLANPRIB').Value := fCoefficients.qrCoef.FieldByName('PLANPRIB').Value;
        DM.qrDifferent.ParamByName('ZP_MASH').Value := fCoefficients.qrCoef.FieldByName('ZP_MASH').Value;

        DM.qrDifferent1.Active := False;
        DM.qrDifferent1.SQL.Text := 'SELECT SM_ID FROM smetasourcedata WHERE (PARENT_ID=:ID_ESTIMATE)'#13 +
          ' OR (PARENT_ID IN (SELECT SM_ID FROM smetasourcedata WHERE PARENT_ID = :ID_ESTIMATE))';
        DM.qrDifferent1.ParamByName('ID_ESTIMATE').Value := qrSmeta.FieldByName('SM_ID').Value;
        DM.qrDifferent1.Active := True;
        DM.qrDifferent1.First;
        while not DM.qrDifferent1.Eof do
        begin
          DM.qrDifferent.ParamByName('id_estimate').Value := DM.qrDifferent1.FieldByName('SM_ID').Value;
          DM.qrDifferent.ExecSQL;

          // Добавление во все содерожимое сметы, кроме пусконаладки
          FastExecSQL('INSERT INTO `calculation_coef' + tableName + '`(`calculation_coef_id`, ' +
            '`SM_ID`, `id_type_data`, `id_owner`,'#13 +
            ' `id_coef`, `COEF_NAME`, `OSN_ZP`, `EKSP_MACH`, `MAT_RES`, `WORK_PERS`,'#13 +
            '  `WORK_MACH`, `OXROPR`, `PLANPRIB`, `ZP_MASH`)'#13 +
            '(SELECT GetNewID(:IDType),SM_ID,ID_TYPE_DATA,ID_TABLES,'#13 +
            ':id_coef,:COEF_NAME,:OSN_ZP,:EKSP_MACH,:MAT_RES,:WORK_PERS,:WORK_MACH,:OXROPR,:PLANPRIB,:ZP_MASH'#13
            + 'FROM data_row' + tableName + ' WHERE SM_ID=:id_estimate AND ID_TYPE_DATA<10)',
            VarArrayOf([C_ID_SMCOEF, fCoefficients.qrCoef.FieldByName('coef_id').Value,
            fCoefficients.qrCoef.FieldByName('COEF_NAME').Value, fCoefficients.qrCoef.FieldByName('OSN_ZP')
            .Value, fCoefficients.qrCoef.FieldByName('EKSP_MACH').Value,
            fCoefficients.qrCoef.FieldByName('MAT_RES').Value, fCoefficients.qrCoef.FieldByName('WORK_PERS')
            .Value, fCoefficients.qrCoef.FieldByName('WORK_MACH').Value,
            fCoefficients.qrCoef.FieldByName('OXROPR').Value, fCoefficients.qrCoef.FieldByName('PLANPRIB')
            .Value, fCoefficients.qrCoef.FieldByName('ZP_MASH').Value,
            DM.qrDifferent1.FieldByName('SM_ID').Value]));

          DM.qrDifferent1.Next;
        end;
        DM.qrDifferent1.Active := False;

        if Assigned(FormCalculationEstimate) then
          FormCalculationEstimate.RecalcEstimate;
        DM.Read.Commit;
      except
        DM.Read.Rollback;
        raise;
      end;
    finally
      DM.Read.Options.AutoCommit := AutoCommitValue;
    end;
  end
  else
    qrCoef.Cancel;
end;

procedure TFormBasicData.qrSmetaAfterOpen(DataSet: TDataSet);
var
  pnlLowCoef_Visible, dbrgrpCOEF_ORDERS_Visible: Integer;
begin
  pnlLowCoef.Visible := dbchkAPPLY_LOW_COEF_OHROPR_FLAG.Checked;
  dbrgrpCOEF_ORDERS.Visible := dbchkAPPLY_WINTERPRISE_FLAG.Checked;

  if pnlLowCoef.Visible then
    pnlLowCoef_Visible := 0
  else
    pnlLowCoef_Visible := 1;

  if dbrgrpCOEF_ORDERS.Visible then
    dbrgrpCOEF_ORDERS_Visible := 0
  else
    dbrgrpCOEF_ORDERS_Visible := 1;

  Height := 640 - pnlLowCoef.Height * pnlLowCoef_Visible - dbrgrpCOEF_ORDERS.Height *
    dbrgrpCOEF_ORDERS_Visible;
end;

procedure TFormBasicData.btnSaveClick(Sender: TObject);
var
  IdStavka: Integer;
begin
  try
    { if qrSmeta.State in [dsEdit, dsInsert] then
      qrSmeta.Post; }
    if qrCoef.State in [dsEdit, dsInsert] then
      qrCoef.Post;

    IdStavka := -1;
    with qrTMP do
    begin
      Active := False;
      SQL.Clear;
      SQL.Add('SELECT stavka_id FROM stavka WHERE year = :year and monat = :monat;');
      ParamByName('year').Value := edtYear.Value;
      ParamByName('monat').Value := ComboBoxMonth.ItemIndex + 1;
      Active := True;
      if not Eof then
        IdStavka := FieldByName('stavka_id').AsInteger;
    end;

    if IdStavka <= 0 then
    begin
      MessageDlg('Для выбраных значений масяца и года расценки отсутствуют!'#13 +
        'Укажите месяц и год расценок.', mtError, [mbOK], 0);
      exit;
    end;

    with qrTMP do
    begin
      Active := False;
      SQL.Clear;
      SQL.Add('UPDATE smetasourcedata SET stavka_id = :stavka_id, coef_tr_zatr = :coef_tr_zatr, coef_orders=:coef_orders, '
        + 'coef_tr_obor=:coef_tr_obor, k40=:k40, k41=:k41, k31=:k31, k32=:k32, k33=:k33, k34=:k34, growth_index=:growth_index, '
        + 'K_LOW_OHROPR=:K_LOW_OHROPR, K_LOW_PLAN_PRIB=:K_LOW_PLAN_PRIB, APPLY_LOW_COEF_OHROPR_FLAG=:APPLY_LOW_COEF_OHROPR_FLAG, '
        + 'nds=:nds, dump_id=:dump_id, kzp=:kzp, STAVKA_RAB=:STAVKA_RAB, MAIS_ID=:MAIS_ID, K35=:K35, APPLY_WINTERPRISE_FLAG=:APPLY_WINTERPRISE_FLAG, '
        + 'WINTERPRICE_TYPE=:WINTERPRICE_TYPE ' + 'WHERE sm_id = :sm_id;');

      ParamByName('stavka_id').Value := IdStavka;
      ParamByName('coef_tr_zatr').Value := edtPercentTransport.Text;
      ParamByName('coef_tr_obor').Value := qrSmeta.FieldByName('coef_tr_obor').Value;
      ParamByName('k40').Value := edtK40.Text;
      // ParamByName('k41').Value := EditK41.Text;
      ParamByName('k31').Value := qrSmeta.FieldByName('k31').Value;
      ParamByName('k32').Value := qrSmeta.FieldByName('K32').Value;
      ParamByName('k33').Value := qrSmeta.FieldByName('K33').Value;
      ParamByName('k34').Value := qrSmeta.FieldByName('K34').Value;
      ParamByName('K35').Value := dbedtK35.Text;
      ParamByName('kzp').Value := qrSmeta.FieldByName('kzp').Value;
      ParamByName('nds').Value := ComboBoxVAT.ItemIndex;
      ParamByName('dump_id').Value := dblkcbbDump.KeyValue;
      ParamByName('STAVKA_RAB').Value := qrSmeta.FieldByName('STAVKA_RAB').Value;
      ParamByName('K_LOW_OHROPR').Value := qrSmeta.FieldByName('K_LOW_OHROPR').Value;
      ParamByName('K_LOW_PLAN_PRIB').Value := qrSmeta.FieldByName('K_LOW_PLAN_PRIB').Value;
      ParamByName('APPLY_LOW_COEF_OHROPR_FLAG').AsInteger := qrSmeta.FieldByName('APPLY_LOW_COEF_OHROPR_FLAG')
        .AsInteger;
      ParamByName('APPLY_WINTERPRISE_FLAG').AsInteger := qrSmeta.FieldByName('APPLY_WINTERPRISE_FLAG')
        .AsInteger;
      ParamByName('MAIS_ID').Value := dblkcbbMAIS.KeyValue;
      ParamByName('growth_index').Value := 1; // yне актуально
      ParamByName('coef_orders').Value := qrSmeta.FieldByName('coef_orders').AsInteger;
      ParamByName('WINTERPRICE_TYPE').Value := qrSmeta.FieldByName('WINTERPRICE_TYPE').AsInteger;
      ParamByName('sm_id').Value := IdEstimate;
      ExecSQL;
      // Обновляем все зависимые сметы до самого низкого уровня
      if Application.MessageBox('Применить текущие настройки к зависимым данным?'#13#13 +
        'Примечание: текущие настройки будут перенесены на все нижестоящие уровни локальных смет и ПТМ.',
        'Вопрос', MB_YESNO + MB_ICONQUESTION + MB_TOPMOST) = IDYES then
      begin
        SQL.Text := 'CALL `UPDATE_SMETASOURCEDATA_CHILD`(:sm_id);';
        ParamByName('sm_id').Value := IdEstimate;
        ExecSQL;
      end;
    end;
    if Assigned(FormCalculationEstimate) then
      FormCalculationEstimate.RecalcEstimate;
    Close;
  except
    on E: Exception do
      MessageBox(0, PChar('При сохранении данных возникла ошибка:' + sLineBreak + sLineBreak + E.Message),
        'Исходные данные', MB_ICONERROR + MB_OK + mb_TaskModal);
  end;
end;

procedure TFormBasicData.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TFormBasicData.ComboBoxMonthORYearChange(Sender: TObject);
var
  vYear, vMonth: String;
  res: Variant;
begin
  if not CheckQrActiveEmpty(qrSmeta) or (not flLoaded) then
    exit;

  edtRateMachinist.Text := '';

  vMonth := IntToStr(ComboBoxMonth.ItemIndex + 1);
  vYear := IntToStr(edtYear.Value);

  with qrTMP do
  begin
    Active := False;
    SQL.Clear;
    SQL.Add('SELECT stavka_m_rab as "RateWorker", stavka_m_mach as "RateMachinist" FROM stavka WHERE year = '
      + vYear + ' and monat = ' + vMonth + ';');
    Active := True;
    if not Eof then
    begin
      qrSmeta.FieldByName('STAVKA_RAB').AsVariant := FieldByName('RateWorker').AsVariant;
      edtRateMachinist.Text := FieldByName('RateMachinist').AsVariant;
    end;
  end;

  if dbchkcoef_orders.Checked then
  begin
    res := GetUniDictParamValue('K_KORR_ZP', (ComboBoxMonth.ItemIndex + 1), edtYear.Value);
    if VarIsNull(res) then
      qrSmeta.FieldByName('kzp').Value := 1
    else
      qrSmeta.FieldByName('kzp').Value := res;

    res := GetUniDictParamValue('K_OXR_OPR_270', (ComboBoxMonth.ItemIndex + 1), edtYear.Value);
    if VarIsNull(res) then
      qrSmeta.FieldByName('k31').Value := 1
    else
      qrSmeta.FieldByName('k31').Value := res;

    res := GetUniDictParamValue('K_PLAN_PRIB_270', (ComboBoxMonth.ItemIndex + 1), edtYear.Value);
    if VarIsNull(res) then
      qrSmeta.FieldByName('K32').Value := 1
    else
      qrSmeta.FieldByName('K32').Value := res;

    res := GetUniDictParamValue('K_VREM_ZDAN_SOOR', (ComboBoxMonth.ItemIndex + 1), edtYear.Value);
    if VarIsNull(res) then
      qrSmeta.FieldByName('K33').Value := 1
    else
      qrSmeta.FieldByName('K33').Value := res;

    res := GetUniDictParamValue('K_ZIM_UDOR_1', (ComboBoxMonth.ItemIndex + 1), edtYear.Value);
    if VarIsNull(res) then
      qrSmeta.FieldByName('K34').Value := 1
    else
      qrSmeta.FieldByName('K34').Value := res;

    res := GetUniDictParamValue('K_ZIM_UDOR_2', (ComboBoxMonth.ItemIndex + 1), edtYear.Value);
    if VarIsNull(res) then
    begin
      qrSmeta.Edit;
      qrSmeta.FieldByName('K35').Value := 1;
    end
    else
    begin
      qrSmeta.Edit;
      qrSmeta.FieldByName('K35').Value := res;
    end;
  end;
  // Автоподстановка МАИС
  if CheckQrActiveEmpty(qrMAIS) then
  begin
    qrMAIS.First;
    while not(qrMAIS.Eof) and (edtYear.Value <= YearOf(qrMAIS.FieldByName('onDate').AsDateTime)) do
      qrMAIS.Next;
    dblkcbbMAIS.KeyValue := qrMAIS.FieldByName('MAIS_ID').AsInteger;
  end;

  {
    if Application.MessageBox('Произвести замену индекса роста цен из справочника?', 'Смета',
    MB_YESNO + MB_ICONQUESTION + MB_TOPMOST) = IDYES then
    begin
    qrSmeta.FieldByName('growth_index').Value := GetUniDictParamValue('GROWTH_INDEX',
    (ComboBoxMonth.ItemIndex + 1), edtYear.Value);
    end;
  }
end;

procedure TFormBasicData.dbchkAPPLY_LOW_COEF_OHROPR_FLAGClick(Sender: TObject);
var
  pnlLowCoef_Visible, dbrgrpCOEF_ORDERS_Visible: Integer;
begin
  pnlLowCoef.Visible := dbchkAPPLY_LOW_COEF_OHROPR_FLAG.Checked;
  dbrgrpCOEF_ORDERS.Visible := dbchkAPPLY_WINTERPRISE_FLAG.Checked;

  if pnlLowCoef.Visible then
    pnlLowCoef_Visible := 0
  else
    pnlLowCoef_Visible := 1;

  if dbrgrpCOEF_ORDERS.Visible then
    dbrgrpCOEF_ORDERS_Visible := 0
  else
    dbrgrpCOEF_ORDERS_Visible := 1;

  Height := 640 - pnlLowCoef.Height * pnlLowCoef_Visible - dbrgrpCOEF_ORDERS.Height *
    dbrgrpCOEF_ORDERS_Visible;
end;

procedure TFormBasicData.dbchkcoef_ordersClick(Sender: TObject);
{ var
  tableName: String; }
begin
  if not CheckQrActiveEmpty(qrSmeta) or (not flLoaded) then
    exit;
  if dbchkcoef_orders.Checked then
  begin
    qrSmeta.FieldByName('kzp').Value := GetUniDictParamValue('K_KORR_ZP', (ComboBoxMonth.ItemIndex + 1),
      edtYear.Value);
    {
      if Assigned(FormCalculationEstimate) then
      tableName := 'calculation_coef_temp'
      else
      tableName := 'calculation_coef';

      // Каскадно добавляем выбранный кф. на все зависимые сметы
      DM.qrDifferent.SQL.Text := 'INSERT INTO `' + tableName + '`(`calculation_coef_id`, ' +
      '`id_estimate`, `id_type_data`, `id_owner`,'#13 +
      ' `id_coef`, `COEF_NAME`, `OSN_ZP`, `EKSP_MACH`, `MAT_RES`, `WORK_PERS`,'#13 +
      '  `WORK_MACH`, `OXROPR`, `PLANPRIB`)'#13 +
      'VALUE(GetNewID(:IDType), :id_estimate,:id_type_data,:id_owner,'#13 +
      ':id_coef,:COEF_NAME,:OSN_ZP,:EKSP_MACH,:MAT_RES,:WORK_PERS,:WORK_MACH,:OXROPR,:PLANPRIB)';
      DM.qrDifferent.ParamByName('IDType').Value := C_ID_SMCOEF;
      DM.qrDifferent.ParamByName('id_type_data').Value := qrSmeta.FieldByName('SM_TYPE').Value * -1;
      DM.qrDifferent.ParamByName('id_owner').Value := 0;
      DM.qrDifferent.ParamByName('id_coef').Value := 20;
      DM.qrDifferent.ParamByName('COEF_NAME').Value := 'Кф по прик.';
      DM.qrDifferent.ParamByName('OSN_ZP').Value := StrToFloatDef(edtKZP.Text, 1);
      DM.qrDifferent.ParamByName('EKSP_MACH').Value := 1;
      DM.qrDifferent.ParamByName('MAT_RES').Value := 1;
      DM.qrDifferent.ParamByName('WORK_PERS').Value := 1;
      DM.qrDifferent.ParamByName('WORK_MACH').Value := 1;
      DM.qrDifferent.ParamByName('OXROPR').Value := 1;
      DM.qrDifferent.ParamByName('PLANPRIB').Value := 1;

      DM.qrDifferent1.Active := False;
      DM.qrDifferent1.SQL.Text := 'SELECT SM_ID FROM smetasourcedata WHERE (PARENT_ID=:ID_ESTIMATE)'#13 +
      ' OR (PARENT_ID IN (SELECT SM_ID FROM smetasourcedata WHERE PARENT_ID = :ID_ESTIMATE))';
      DM.qrDifferent1.ParamByName('ID_ESTIMATE').Value := qrSmeta.FieldByName('SM_ID').Value;
      DM.qrDifferent1.Active := True;
      DM.qrDifferent1.First;

      DM.qrDifferent.ParamByName('id_estimate').Value := qrSmeta.FieldByName('SM_ID').Value;
      DM.qrDifferent.ExecSQL;
      while not DM.qrDifferent1.Eof do
      begin
      DM.qrDifferent.ParamByName('id_estimate').Value := DM.qrDifferent1.FieldByName('SM_ID').Value;
      DM.qrDifferent.ExecSQL;
      DM.qrDifferent1.Next;
      end;
      DM.qrDifferent1.Active := False;
    }
  end
  else
  begin
    qrSmeta.FieldByName('kzp').Value := 1;
    {
      qrCoef.CheckBrowseMode;

      if Assigned(FormCalculationEstimate) then
      tableName := 'calculation_coef_temp'
      else
      tableName := 'calculation_coef';

      // Каскадное удаление наборав из связанных смет
      DM.qrDifferent.SQL.Text := 'DELETE FROM ' + tableName + ' WHERE id_estimate IN '#13 +
      '(SELECT SM_ID FROM smetasourcedata WHERE (PARENT_ID=:ID_ESTIMATE)'#13 +
      ' OR (SM_ID=:id_estimate) OR (PARENT_ID IN (SELECT SM_ID FROM smetasourcedata WHERE PARENT_ID = :ID_ESTIMATE)))'#13
      + ' AND id_type_data<0 AND id_owner=0 AND id_coef=:id_coef';

      DM.qrDifferent.ParamByName('id_estimate').Value := qrSmeta.FieldByName('SM_ID').Value;
      // DM.qrDifferent.ParamByName('id_type_data').Value := qrSmeta.FieldByName('SM_TYPE').Value * -1;
      DM.qrDifferent.ParamByName('id_coef').Value := 20;

      DM.qrDifferent.ExecSQL;
    }
  end;
  {
    if Assigned(FormCalculationEstimate) then
    FormCalculationEstimate.RecalcEstimate;
    CloseOpen(qrCoef);
  }
end;

procedure TFormBasicData.dbedtEditRateWorkerEnter(Sender: TObject);
begin
  qrSmeta.FieldByName('STAVKA_RAB').Value := dbedtEditRateWorker.Text;
end;

procedure TFormBasicData.DBLookupComboBoxRegionDumpClick(Sender: TObject);
begin
  with qrDump, dblkcbbDump do
  begin
    Active := False;
    SQL.Clear;
    SQL.Add('SELECT dump_id, dump_name FROM dump WHERE region_id = :region_id ORDER BY 2;');
    ParamByName('region_id').Value := DBLookupComboBoxRegionDump.KeyValue;
    Active := True;

    ListSource := dsDump;
    ListField := 'dump_name';
    KeyField := 'dump_id';

    if IdDump = NULL then
      KeyValue := FieldByName('dump_id').AsVariant
    else
      KeyValue := IdDump;
  end;
end;

end.
