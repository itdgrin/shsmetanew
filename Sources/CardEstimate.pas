unit CardEstimate;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, ExtCtrls, DB,
  ComCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, DateUtils, Vcl.Mask, Vcl.DBCtrls, Tools;

type
  TfCardEstimate = class(TSmForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;

    LabelNumberEstimate: TLabel;
    LabelNumberChapter: TLabel;
    LabelNumberRow: TLabel;
    LabelNameEstimate: TLabel;
    LabelCompose: TLabel;
    LabelPostCompose: TLabel;
    LabelChecked: TLabel;
    LabelPostChecked: TLabel;
    LabelSetDrawing: TLabel;

    Bevel: TBevel;
    btnSave: TButton;
    btnClose: TButton;
    PanelPart: TPanel;
    LabelPart: TLabel;
    PanelSection: TPanel;
    LabelSection: TLabel;
    PanelTypeWork: TPanel;
    LabelTypeWork: TLabel;
    qrTemp: TFDQuery;
    qrParts: TFDQuery;
    dsParts: TDataSource;
    qrSections: TFDQuery;
    dsSections: TDataSource;
    qrTypesWorks: TFDQuery;
    dsTypesWorks: TDataSource;
    dblkcbbParts: TDBLookupComboBox;
    dblkcbbSections: TDBLookupComboBox;
    dblkcbbTypesWorks: TDBLookupComboBox;
    qrMain: TFDQuery;
    dsMain: TDataSource;
    dbedtSM_NUMBER: TDBEdit;
    dbedtNAME: TDBEdit;
    dbedtCHAPTER: TDBEdit;
    dbedtROW_NUMBER: TDBEdit;
    dbedtPREPARER: TDBEdit;
    dbedtPOST_PREPARER: TDBEdit;
    dbedtEXAMINER: TDBEdit;
    dbedtPOST_EXAMINER: TDBEdit;
    dbedtSET_DRAWINGS: TDBEdit;
    lblType: TLabel;
    cbbType: TComboBox;

    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);

    procedure ShowForm(const vIdObject, vIdEstimate, vTypeEstimate: Integer;
      const ShowBasicData: Boolean = True);
    procedure CreateNumberEstimate;
    procedure btnCloseClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure EditingRecord(const Value: Boolean);
    procedure ComboBoxChange(Sender: TObject);
    procedure qrPartsAfterScroll(DataSet: TDataSet);
    procedure cbbTypeCloseUp(Sender: TObject);

  private
    StrQuery, NewLocalNumberEstimate: String;
    Editing: Boolean; // Для отслеживания режима добавления или редактирования записи
    SkeepEvent: Boolean;

    IdObject: Integer;
    IdEstimate, BaseIdEstimate: Integer;
    TypeEstimate: Integer;
  public

  end;

var
  fCardEstimate: TfCardEstimate;

implementation

uses Main, DataModule, ObjectsAndEstimates, BasicData, GlobsAndConst;

{$R *.dfm}

function ReplaceDecimal(var vString: String; const vChar1: Char; const vChar2: Char): String;
var
  p: Integer;
begin
  p := Pos(vChar1, vString);
  if p > 0 then
    vString[p] := vChar2;
  Result := vString;
end;

procedure TfCardEstimate.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Editing := False;
end;

procedure TfCardEstimate.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if btnSave.Tag = 0 then
    if MessageBox(0, PChar('Закрыть окно без сохранения?'), PWideChar(Caption),
      MB_ICONINFORMATION + MB_YESNO + mb_TaskModal) = mrYes then
      CanClose := True
    else
      CanClose := False;
end;

procedure TfCardEstimate.FormCreate(Sender: TObject);
begin
  inherited;
  with Constraints do
  begin
    MinHeight := Height;
    MaxHeight := Height;
    MinWidth := Width;
    MaxWidth := Width;
  end;

  Caption := PWideChar(Caption);

  btnSave.Tag := 0;

  Left := FormMain.Left + (FormMain.Width - Width) div 2;
  Top := FormMain.Top + (FormMain.Height - Height) div 2;

  Editing := False;
end;

procedure TfCardEstimate.FormShow(Sender: TObject);
begin
  dbedtCHAPTER.Enabled := True;
  dbedtCHAPTER.Color := clWindow;
  dbedtROW_NUMBER.Enabled := True;
  dbedtROW_NUMBER.Color := clWindow;

  qrMain.Active := False;
  qrMain.ParamByName('SM_ID').AsInteger := IdEstimate;
  qrMain.Active := True;

  dbedtCHAPTER.SetFocus; // Устанавливаем фокус

  btnSave.Tag := 0;

  if not Editing then
    qrMain.Append
  else
    qrMain.Edit;
  // ----------------------------------------
  lblType.Visible := TypeEstimate = 1;
  cbbType.Visible := TypeEstimate = 1;
  case TypeEstimate of
    1, 2:
      begin
        Caption := 'Карточка сметы';

        PanelPart.Enabled := False;
        PanelSection.Enabled := False;
        PanelTypeWork.Enabled := False;

        LabelPart.Enabled := False;
        LabelSection.Enabled := False;
        LabelTypeWork.Enabled := False;

        dblkcbbParts.Enabled := False;
        dblkcbbSections.Enabled := False;
        dblkcbbTypesWorks.Enabled := False;

        if TypeEstimate = 1 then
        begin
          if VarIsNull(qrMain.FieldByName('SM_SUBTYPE').Value) then
            cbbType.ItemIndex := 0
          else
            cbbType.ItemIndex := qrMain.FieldByName('SM_SUBTYPE').AsInteger - 1;
        end;

        qrParts.Close;
        qrSections.Close;
        qrTypesWorks.Close;
      end;
    3:
      begin
        Caption := 'Карточка ПТМ';

        PanelPart.Enabled := True;
        PanelSection.Enabled := True;
        PanelTypeWork.Enabled := True;

        LabelPart.Enabled := True;
        LabelSection.Enabled := True;
        LabelTypeWork.Enabled := True;

        dblkcbbParts.Enabled := True;
        dblkcbbSections.Enabled := True;
        dblkcbbTypesWorks.Enabled := True;

        dbedtCHAPTER.Enabled := False;
        dbedtCHAPTER.Color := $00E1DFE0;
        dbedtROW_NUMBER.Enabled := False;
        dbedtROW_NUMBER.Color := $00E1DFE0;

        if not qrParts.Active then
          CloseOpen(qrParts);
        if not qrSections.Active then
          CloseOpen(qrSections);
        if not qrTypesWorks.Active then
          CloseOpen(qrTypesWorks);
        if not Editing then
        begin
          dblkcbbParts.KeyValue := 0;
          dblkcbbSections.KeyValue := 0;
          dblkcbbTypesWorks.KeyValue := 0;
          qrMain.FieldByName('TYPE_WORK_ID').Value := 0;
          qrMain.FieldByName('PART_ID').Value := 0;
          qrMain.FieldByName('SECTION_ID').Value := 0;
        end;
        ComboBoxChange(Self);
        qrParts.AfterScroll := qrPartsAfterScroll;
        qrSections.AfterScroll := qrPartsAfterScroll;
        qrTypesWorks.AfterScroll := qrPartsAfterScroll;
      end;
  end;

  if not Editing then
    CreateNumberEstimate;

  SkeepEvent := False;
end;

procedure TfCardEstimate.ShowForm(const vIdObject, vIdEstimate, vTypeEstimate: Integer;
  const ShowBasicData: Boolean = True);
begin
  IdObject := vIdObject;
  IdEstimate := vIdEstimate;
  TypeEstimate := vTypeEstimate;

  SkeepEvent := True;
  if vTypeEstimate = 3 then
    LabelNumberEstimate.Caption := '№ ПТМ:'
  else
    LabelNumberEstimate.Caption := '№ сметы:';
  if ShowBasicData then
  begin
    if (ShowModal = mrOk) then
      FormBasicData.ShowForm(IdObject, BaseIdEstimate);
  end
  else
  begin
    Show;
    btnSave.Click;
    Close;
  end;
end;

procedure TfCardEstimate.EditingRecord(const Value: Boolean);
begin
  Editing := Value;
end;

procedure TfCardEstimate.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfCardEstimate.btnSaveClick(Sender: TObject);
  procedure CopyCoef(FromID, ToID: Integer);
  begin
    // Копируем все наборы КФ. родетельской сметы
    if FromID = 0 then
      Exit;
    qrTemp.SQL.Text := 'INSERT INTO calculation_coef (calculation_coef_id, ' + 'SM_ID, id_type_data, ' +
      'id_owner, id_coef, COEF_NAME, OSN_ZP, EKSP_MACH, MAT_RES, WORK_PERS, ' +
      'WORK_MACH, OXROPR, PLANPRIB) SELECT GetNewID(:IDType), :new_id_estimate, ' +
      'id_type_data, id_owner, id_coef, COEF_NAME, OSN_ZP, EKSP_MACH, MAT_RES, ' +
      'WORK_PERS, WORK_MACH, OXROPR, PLANPRIB FROM calculation_coef WHERE ' + 'SM_ID = :id_estimate;';
    qrTemp.ParamByName('IDType').AsInteger := C_ID_SMCOEF;
    qrTemp.ParamByName('id_estimate').AsInteger := FromID;
    qrTemp.ParamByName('new_id_estimate').AsInteger := ToID;
    qrTemp.ExecSQL;
  end;
  function addParentEstimate(aParentID, aType: Integer): Integer;
  var
    NewID: Integer;
  begin
    NewID := FastSelectSQLOne('SELECT GetNewID(:IDType)', VarArrayOf([C_ID_SM]));

    if VarIsNull(NewID) then
      raise Exception.Create('Не удалось получить новый ID.');

    qrTemp.SQL.Text := 'SELECT * FROM smetasourcedata WHERE SM_ID=:SM_ID';
    qrTemp.ParamByName('SM_ID').AsInteger := aParentID;
    qrTemp.Active := True;

    qrMain.Append;
    qrMain.FieldByName('SM_ID').AsInteger := NewID;
    qrMain.FieldByName('sm_type').AsInteger := aType;
    qrMain.FieldByName('obj_id').AsInteger := IdObject;
    qrMain.FieldByName('parent_id').AsInteger := aParentID;
    qrMain.FieldByName('SM_SUBTYPE').Value := qrTemp.FieldByName('SM_SUBTYPE').Value;
    qrMain.FieldByName('USER_ID').Value := qrTemp.FieldByName('USER_ID').Value;
    qrMain.FieldByName('ACT').Value := qrTemp.FieldByName('ACT').Value;
    qrMain.FieldByName('TYPE_ACT').Value := qrTemp.FieldByName('TYPE_ACT').Value;
    qrMain.FieldByName('FL_USE').Value := qrTemp.FieldByName('FL_USE').Value;
    qrMain.FieldByName('DESCRIPTION').Value := qrTemp.FieldByName('DESCRIPTION').Value;
    qrMain.FieldByName('FOREMAN_ID').Value := qrTemp.FieldByName('FOREMAN_ID').Value;
    qrMain.FieldByName('k40').Value := qrTemp.FieldByName('k40').Value;
    qrMain.FieldByName('k41').Value := qrTemp.FieldByName('k41').Value;
    qrMain.FieldByName('k31').Value := qrTemp.FieldByName('k31').Value;
    qrMain.FieldByName('k32').Value := qrTemp.FieldByName('k32').Value;
    qrMain.FieldByName('k33').Value := qrTemp.FieldByName('k33').Value;
    qrMain.FieldByName('k34').Value := qrTemp.FieldByName('k34').Value;
    qrMain.FieldByName('k35').Value := qrTemp.FieldByName('k35').Value;
    qrMain.FieldByName('kzp').Value := qrTemp.FieldByName('kzp').Value;
    qrMain.FieldByName('coef_tr_zatr').Value := qrTemp.FieldByName('coef_tr_zatr').Value;
    qrMain.FieldByName('coef_tr_obor').Value := qrTemp.FieldByName('coef_tr_obor').Value;
    qrMain.FieldByName('stavka_id').Value := qrTemp.FieldByName('stavka_id').Value;
    qrMain.FieldByName('dump_id').Value := qrTemp.FieldByName('dump_id').Value;
    qrMain.FieldByName('MAIS_ID').Value := qrTemp.FieldByName('MAIS_ID').Value;
    qrMain.FieldByName('NDS').Value := qrTemp.FieldByName('NDS').Value;
    qrMain.FieldByName('APPLY_LOW_COEF_OHROPR_FLAG').Value :=
      qrTemp.FieldByName('APPLY_LOW_COEF_OHROPR_FLAG').Value;
    qrMain.FieldByName('growth_index').Value := qrTemp.FieldByName('growth_index').Value;
    qrMain.FieldByName('STAVKA_RAB').Value := qrTemp.FieldByName('STAVKA_RAB').Value;
    qrMain.FieldByName('K_LOW_OHROPR').Value := qrTemp.FieldByName('K_LOW_OHROPR').Value;
    qrMain.FieldByName('K_LOW_PLAN_PRIB').Value := qrTemp.FieldByName('K_LOW_PLAN_PRIB').Value;
    qrMain.FieldByName('APPLY_WINTERPRISE_FLAG').Value := qrTemp.FieldByName('APPLY_WINTERPRISE_FLAG').Value;
    case aType of
      1:
        begin
          qrMain.FieldByName('SM_NUMBER').Value := qrTemp.FieldByName('SM_NUMBER').Value + '.1';
          qrMain.FieldByName('NAME').Value := 'Локальная №1';
        end;
      3:
        begin
          qrMain.FieldByName('SM_NUMBER').Value := 'Ж000';
          qrMain.FieldByName('NAME').Value := '';
          qrMain.FieldByName('TYPE_WORK_ID').Value := 0;
          qrMain.FieldByName('PART_ID').Value := 0;
          qrMain.FieldByName('SECTION_ID').Value := 0;
        end;
    end;
    qrMain.Post;

    CopyCoef(aParentID, NewID);
    Result := NewID;
  end;

var
  CountWarning: Integer;

  DateCompose: TDate;
  vYear, vMonth: Integer;

  VAT: Integer;
  IdStavka, MAIS_ID: Variant;
  PercentTransport, PercentTransportEquipment: String;
  K40, K41, K31, K32, K33, K34, K35: String;

  NameEstimate: String;
  NewID: Integer;
begin
  CountWarning := 0;
  vMonth := MonthOf(Now);
  vYear := YearOf(Now);
  DateCompose := Now;
  VAT := 0;
  with qrTemp do
  begin
    try
      Active := False;
      SQL.Clear;
      SQL.Add('SELECT objcards.MAIS_ID, state_nds, BEG_STROJ, objregion.percent_transport as "PercentTransport" FROM objcards, objstroj, objregion '
        + 'WHERE objcards.stroj_id = objstroj.stroj_id and objstroj.obj_region = objregion.obj_region_id and '
        + 'objcards.obj_id = ' + IntToStr(IdObject) + ';');
      Active := True;

      PercentTransport := FieldByName('PercentTransport').AsString;
      ReplaceDecimal(PercentTransport, ',', '.');
      PercentTransportEquipment := '1';

      VAT := FieldByName('state_nds').AsInteger;
      // При создании сметы дата для расценок проставляетсся как у объекта
      DateCompose := FieldByName('BEG_STROJ').AsDateTime;
      vMonth := MonthOf(FieldByName('BEG_STROJ').AsDateTime);
      vYear := YearOf(FieldByName('BEG_STROJ').AsDateTime);
      MAIS_ID := FieldByName('MAIS_ID').Value;
    except
      on E: Exception do
        MessageBox(0, PChar('При запросе НДС возникла ошибка:' + sLineBreak + E.Message), PWideChar(Caption),
          MB_ICONERROR + MB_OK + mb_TaskModal);
    end;

    try
      Active := False;
      SQL.Clear;
      StrQuery := 'SELECT stavka_id as "IdStavka" FROM stavka WHERE year = ' + IntToStr(vYear) +
        ' and monat = ' + IntToStr(vMonth) + ';';
      SQL.Add(StrQuery);
      Active := True;

      if IsEmpty then
        Abort;

      IdStavka := FieldByName('IdStavka').Value;
    except
      on E: Exception do
      begin
        MessageBox(0, PChar('При запросе ID СТАВКИ возникла ошибка:' + sLineBreak + E.Message),
          PWideChar(Caption), MB_ICONERROR + MB_OK + mb_TaskModal);
        Exit;
      end;
    end;
  end;

  K40 := '1';
  K41 := '1';
  K31 := '1';
  K32 := '1';
  K33 := '1';
  K34 := '1';
  K35 := '1';

  with dbedtNAME do
    if Text = '' then
      Text := ' ';
  { begin
    Color := ColorWarningField;
    Inc(CountWarning);
    end
    else }
  NameEstimate := '"' + Text + '"';

  if CountWarning > 0 then
  begin
    MessageBox(0, PChar('Вы заполнили не все поля!' + #13#10 +
      'Поля выделенные красным не заполнены или заполнены неправильно.'), PWideChar(Caption),
      MB_ICONWARNING + MB_OK + mb_TaskModal);
    Exit;
  end;
  // -----------------------------------------
  try
    btnSave.Tag := 1;
    if Editing then
    begin
      if qrMain.State in [dsEdit] then
        qrMain.Post;

      ModalResult := mrCancel;
    end
    else
    begin
      qrTemp.Active := False;
      qrTemp.SQL.Clear;
      qrTemp.SQL.Add('SELECT GetNewID(:IDType)');
      qrTemp.ParamByName('IDType').Value := C_ID_SM;
      qrTemp.Active := True;
      NewID := 0;
      if not qrTemp.Eof then
        NewID := qrTemp.Fields[0].AsInteger;
      qrTemp.Active := False;

      if NewID = 0 then
        raise Exception.Create('Не удалось получить новый ID.');

      qrMain.FieldByName('SM_ID').AsInteger := NewID;
      qrMain.FieldByName('sm_type').AsInteger := TypeEstimate;
      qrMain.FieldByName('obj_id').AsInteger := IdObject;
      qrMain.FieldByName('date').AsDateTime := DateCompose;
      qrMain.FieldByName('nds').AsInteger := VAT;
      qrMain.FieldByName('USER_ID').AsInteger := G_USER_ID;
      if TypeEstimate = 1 then
        qrMain.FieldByName('SM_SUBTYPE').Value := cbbType.ItemIndex + 1;

      if TypeEstimate = 2 then
      begin
        // Новая объектная смета
        qrMain.FieldByName('parent_id').AsInteger := 0;
        qrMain.FieldByName('stavka_id').Value := IdStavka;
        qrMain.FieldByName('KZP').Value := GetUniDictParamValue('K_KORR_ZP', vMonth, vYear);
        // qrMain.FieldByName('k40').Value := GetUniDictParamValue('', vMonth, vYear);
        // qrMain.FieldByName('k41').Value := GetUniDictParamValue('', vMonth, vYear);
        qrMain.FieldByName('k31').Value := GetUniDictParamValue('K_OXR_OPR_270', vMonth, vYear);
        qrMain.FieldByName('k32').Value := GetUniDictParamValue('K_PLAN_PRIB_270', vMonth, vYear);
        qrMain.FieldByName('k33').Value := GetUniDictParamValue('K_VREM_ZDAN_SOOR', vMonth, vYear);
        qrMain.FieldByName('k34').Value := GetUniDictParamValue('K_ZIM_UDOR_1', vMonth, vYear);
        qrMain.FieldByName('k35').Value := GetUniDictParamValue('K_ZIM_UDOR_2', vMonth, vYear);
        qrMain.FieldByName('MAIS_ID').Value := MAIS_ID;
        // qrMain.FieldByName('coef_tr_zatr').Value := GetUniDictParamValue('', vMonth, vYear);
        qrMain.FieldByName('coef_tr_obor').Value := 2;
        // индекс роста цен
        // qrMain.FieldByName('growth_index').Value := GetUniDictParamValue('GROWTH_INDEX', vMonth, vYear);
      end
      else
      begin
        // Копируем данные из родительской сметы
        qrMain.FieldByName('parent_id').AsInteger := IdEstimate;
        qrTemp.SQL.Text := 'SELECT * FROM smetasourcedata WHERE SM_ID=:SM_ID';
        qrTemp.ParamByName('SM_ID').AsInteger := IdEstimate;
        qrTemp.Active := True;
        qrMain.FieldByName('KZP').Value := qrTemp.FieldByName('KZP').Value;
        qrMain.FieldByName('k40').Value := qrTemp.FieldByName('k40').Value;
        qrMain.FieldByName('k41').Value := qrTemp.FieldByName('k41').Value;
        qrMain.FieldByName('k31').Value := qrTemp.FieldByName('k31').Value;
        qrMain.FieldByName('k32').Value := qrTemp.FieldByName('k32').Value;
        qrMain.FieldByName('k33').Value := qrTemp.FieldByName('k33').Value;
        qrMain.FieldByName('k34').Value := qrTemp.FieldByName('k34').Value;
        qrMain.FieldByName('k35').Value := qrTemp.FieldByName('k35').Value;
        qrMain.FieldByName('coef_tr_zatr').Value := qrTemp.FieldByName('coef_tr_zatr').Value;
        qrMain.FieldByName('coef_tr_obor').Value := qrTemp.FieldByName('coef_tr_obor').Value;
        qrMain.FieldByName('stavka_id').Value := qrTemp.FieldByName('stavka_id').Value;
        qrMain.FieldByName('dump_id').Value := qrTemp.FieldByName('dump_id').Value;
        qrMain.FieldByName('MAIS_ID').Value := qrTemp.FieldByName('MAIS_ID').Value;
        qrMain.FieldByName('growth_index').Value := qrTemp.FieldByName('growth_index').Value;
        qrMain.FieldByName('APPLY_LOW_COEF_OHROPR_FLAG').Value :=
          qrTemp.FieldByName('APPLY_LOW_COEF_OHROPR_FLAG').Value;
        qrMain.FieldByName('NDS').Value := qrTemp.FieldByName('NDS').Value;
        qrMain.FieldByName('growth_index').Value := qrTemp.FieldByName('growth_index').Value;
        qrMain.FieldByName('STAVKA_RAB').Value := qrTemp.FieldByName('STAVKA_RAB').Value;
        qrMain.FieldByName('K_LOW_OHROPR').Value := qrTemp.FieldByName('K_LOW_OHROPR').Value;
        qrMain.FieldByName('K_LOW_PLAN_PRIB').Value := qrTemp.FieldByName('K_LOW_PLAN_PRIB').Value;
        qrMain.FieldByName('APPLY_WINTERPRISE_FLAG').Value :=
          qrTemp.FieldByName('APPLY_WINTERPRISE_FLAG').Value;
        qrMain.FieldByName('ACT').Value := qrTemp.FieldByName('ACT').Value;
        qrMain.FieldByName('TYPE_ACT').Value := qrTemp.FieldByName('TYPE_ACT').Value;
        if TypeEstimate = 3 then
          qrMain.FieldByName('SM_SUBTYPE').Value := qrTemp.FieldByName('SM_SUBTYPE').Value;
      end;

      if qrMain.State in [dsInsert] then
        qrMain.Post;

      IdEstimate := NewID;
      BaseIdEstimate := IdEstimate;
      // Копируем все наборы КФ. родетельской сметы
      CopyCoef(qrMain.FieldByName('parent_id').AsInteger, IdEstimate);
      case TypeEstimate of
        // Если локальная
        1:
          // Добавляем автоматически пустой
          addParentEstimate(IdEstimate, 3);
        // Если объектная
        2:
          begin
            // добавляем Локальную
            IdEstimate := addParentEstimate(IdEstimate, 1);;
            // и раздел ПТМ
            addParentEstimate(IdEstimate, 3);
          end;
      end;
      ModalResult := mrOk;
    end;
  except
    on E: Exception do
    begin
      MessageBox(0, PChar('При сохранении данных возникла ошибка:' + #13#10 + E.Message), PWideChar(Caption),
        MB_ICONERROR + MB_OK + mb_TaskModal);
    end;
  end;
end;

procedure TfCardEstimate.cbbTypeCloseUp(Sender: TObject);
begin
  if TypeEstimate = 1 then
  begin
    qrMain.Edit;
    qrMain.FieldByName('SM_SUBTYPE').Value := cbbType.ItemIndex + 1;

    NewLocalNumberEstimate := qrMain.FieldByName('SM_NUMBER').AsString;
    while Pos('.', NewLocalNumberEstimate) > 0 do
      Delete(NewLocalNumberEstimate, 1, 1);

    case cbbType.ItemIndex of
      // Локальная
      0:
        qrMain.FieldByName('NAME').AsString := 'Локальная смета №' + NewLocalNumberEstimate;
      // ПНР
      1:
        qrMain.FieldByName('NAME').AsString := 'Смета №' + NewLocalNumberEstimate + ' Пусконаладочные работы';
      // доп. работы
      2:
        qrMain.FieldByName('NAME').AsString := 'Локальная смета №' + NewLocalNumberEstimate + ' Доп. работы';
      // Реконструкция
      3:
        qrMain.FieldByName('NAME').AsString := 'Локальная смета №' + NewLocalNumberEstimate +
          ' Реконструкция';
    end;
  end;
end;

procedure TfCardEstimate.ComboBoxChange(Sender: TObject);
begin
  if SkeepEvent or not CheckQrActiveEmpty(qrMain) or not CheckQrActiveEmpty(qrParts) or
    not CheckQrActiveEmpty(qrSections) or not CheckQrActiveEmpty(qrTypesWorks) then
    Exit;
  qrMain.Edit;
  qrMain.FieldByName('SM_NUMBER').AsString := 'Ж' + qrParts.FieldByName('CODE1').AsString +
    qrSections.FieldByName('CODE1').AsString + qrTypesWorks.FieldByName('CODE1').AsString;
  qrMain.FieldByName('NAME').AsString := qrParts.FieldByName('NAME').AsString + qrSections.FieldByName('NAME')
    .AsString + qrTypesWorks.FieldByName('NAME').AsString;
  // qrMain.CheckBrowseMode;
end;

procedure TfCardEstimate.CreateNumberEstimate;
var
  NumberEstimate, str: String;
begin
  if (TypeEstimate = 1) or (TypeEstimate = 3) then
    try
      with qrTemp do
      begin
        Active := False;
        SQL.Clear;
        SQL.Add('SELECT sm_number FROM smetasourcedata WHERE sm_id = :sm_id;');
        ParamByName('sm_id').Value := IdEstimate;
        Active := True;

        NumberEstimate := FieldByName('sm_number').AsVariant;
      end;
    except
      on E: Exception do
        MessageBox(0, PChar('При получении номера сметы возникла ошибка:' + sLineBreak + E.Message),
          PWideChar(Caption), MB_ICONERROR + MB_OK + mb_TaskModal);
    end;

  // ----------------------------------------

  case TypeEstimate of
    1:
      begin
        try
          with qrTemp do
          begin
            Active := False;
            SQL.Clear;
            SQL.Add('SELECT max(sm_number) as "MaxNumber" FROM smetasourcedata WHERE ACT=0 and sm_type = 1 and sm_number LIKE "'
              + NumberEstimate + '%" and obj_id = ' + IntToStr(IdObject) + ';');
            Active := True;

            if FieldByName('MaxNumber').AsVariant <> NULL then
              str := FieldByName('MaxNumber').AsVariant
            else
              str := '0';
          end;
        except
          on E: Exception do
            MessageBox(0, PChar('При запросе номера последней ЛОКАЛЬНОЙ сметы возникла ошибка:' + sLineBreak +
              E.Message), PWideChar(Caption), MB_ICONERROR + MB_OK + mb_TaskModal);
        end;

        // Удаляем в строке всё что стоит до последней точки, включая точку
        while Pos('.', str) > 0 do
          Delete(str, 1, 1);

        NewLocalNumberEstimate := str;

        qrMain.FieldByName('SM_NUMBER').AsString := NumberEstimate + '.' + IntToStr(StrToInt(str) + 1);
        qrMain.FieldByName('NAME').AsString := 'Локальная смета №' + IntToStr(StrToInt(str) + 1);
      end;
    2: // ОБЪЕКТНАЯ смета
      begin
        try
          with qrTemp do
          begin
            Active := False;
            SQL.Clear;
            SQL.Add('SELECT max(sm_number) as "MaxNumber" FROM smetasourcedata WHERE ACT=0 and sm_type = 2 and sm_number LIKE "'
              + NumberEstimate + '%" and obj_id = ' + IntToStr(IdObject) + ';');
            Active := True;

            if FieldByName('MaxNumber').AsVariant <> NULL then
              str := FieldByName('MaxNumber').AsVariant
            else
              str := '0';
          end;
        except
          on E: Exception do
            MessageBox(0, PChar('При получении номера последней ОБЪЕКТНОЙ сметы возникла ошибка:' + sLineBreak
              + E.Message), PWideChar(Caption), MB_ICONERROR + MB_OK + mb_TaskModal);
        end;

        // Удаляем в строке всё что стоит до последней точки, включая точку
        while Pos('.', str) > 0 do
          Delete(str, 1, 1);

        qrMain.FieldByName('SM_NUMBER').AsString := IntToStr(StrToInt(str) + 1);
        qrMain.FieldByName('NAME').AsString := 'Объектная смета №' + IntToStr(StrToInt(str) + 1);
      end;
    3: // ПТМ смета
      begin
        qrMain.FieldByName('SM_NUMBER').AsString := 'Ж000';
      end;
  end;
end;

procedure TfCardEstimate.qrPartsAfterScroll(DataSet: TDataSet);
begin
  ComboBoxChange(nil);
end;

end.
