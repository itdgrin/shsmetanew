unit CardAct;

interface

uses Windows, SysUtils, Classes, Controls, Forms, StdCtrls, ExtCtrls, DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Mask,
  JvExMask, JvToolEdit, JvDBControls, Vcl.DBCtrls, Tools, Vcl.Buttons, System.Variants, System.DateUtils,
  Vcl.Dialogs, System.UITypes;

type
  TfCardAct = class(TSmForm)
    PanelDate: TPanel;
    PanelName: TPanel;
    PanelDescription: TPanel;
    LabelDate: TLabel;
    LabelName: TLabel;
    LabelDescription: TLabel;
    ButtonSave: TButton;
    ButtonClose: TButton;
    Bevel: TBevel;
    qrTemp: TFDQuery;
    edDate: TJvDBDateEdit;
    qrAct: TFDQuery;
    dsAct: TDataSource;
    dbmmoDESCRIPTION: TDBMemo;
    dbedtNAME: TDBEdit;
    pnl1: TPanel;
    lbl1: TLabel;
    dbedtNAME1: TDBEdit;
    btn1: TSpeedButton;
    lbl2: TLabel;
    cbbType: TComboBox;
    qrMain: TFDQuery;
    procedure FormShow(Sender: TObject);
    procedure ButtonCloseClick(Sender: TObject);
    procedure ButtonSaveClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure edDateChange(Sender: TObject);
    procedure dbedtNAMEChange(Sender: TObject);
    procedure btn1Click(Sender: TObject);
  private
    cnt: Integer;
  public
    id: Integer;
  end;

implementation

uses Main, DataModule, CalculationEstimate, GlobsAndConst, ForemanList, ObjectsAndEstimates;

{$R *.dfm}

procedure TfCardAct.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfCardAct.FormCreate(Sender: TObject);
begin
  inherited;
  Left := FormMain.Left + (FormMain.Width - Width) div 2;
  Top := FormMain.Top + (FormMain.Height - Height) div 2;
end;

procedure TfCardAct.FormShow(Sender: TObject);
begin
  qrMain.ParamByName('SM_ID').AsInteger := 0;
  qrMain.Active := True;
  case FormKind of
    kdInsert:
      begin
        qrAct.ParamByName('id').AsInteger := 0;
        CloseOpen(qrAct);
        qrTemp.Active := False;
        qrTemp.SQL.Text := 'SELECT COUNT(*) AS CNT from smetasourcedata WHERE ACT=1 AND OBJ_ID=:OBJ_ID;';
        qrTemp.ParamByName('OBJ_ID').Value := fObjectsAndEstimates.qrObjects.FieldByName('IdObject').Value;
        qrTemp.Active := True;
        cnt := qrTemp.FieldByName('CNT').AsInteger + 1;
        qrTemp.Active := False;

        qrAct.Insert;
        qrAct.FieldByName('DATE').AsDateTime := Now();
        qrAct.FieldByName('NAME').AsString := 'Акт№' + IntToStr(cnt) + 'от' + qrAct.FieldByName('DATE')
          .AsString + 'для' + fObjectsAndEstimates.qrObjects.FieldByName('NumberObject').AsString + ' ' +
          fObjectsAndEstimates.qrObjects.FieldByName('FullName').AsString;
        qrAct.FieldByName('DESCRIPTION').AsString := dbedtNAME.Text;
        qrAct.FieldByName('OBJ_ID').Value := fObjectsAndEstimates.qrObjects.FieldByName('IdObject').Value;
        dbedtNAME.SetFocus;
      end;
    kdEdit:
      begin
        qrAct.ParamByName('id').AsInteger := id;
        CloseOpen(qrAct);
        cbbType.ItemIndex := qrAct.FieldByName('TYPE_ACT').AsInteger;
      end;
  end;
end;

procedure TfCardAct.btn1Click(Sender: TObject);
begin
  if (not Assigned(fForemanList)) then
    fForemanList := TfForemanList.Create(FormMain);
  fForemanList.FormKind := kdSelect;
  if (fForemanList.ShowModal = mrOk) and (fForemanList.OutValue <> 0) then
  begin
    qrAct.Edit;
    qrAct.FieldByName('foreman_id').Value := fForemanList.OutValue;
    qrAct.FieldByName('foreman_').Value :=
      FastSelectSQLOne
      ('SELECT CONCAT(IFNULL(foreman_first_name, ""), " ", IFNULL(foreman_name, ""), " ", IFNULL(foreman_second_name, "")) FROM foreman WHERE foreman_id=:0',
      VarArrayOf([fForemanList.OutValue]));
  end;
end;

procedure TfCardAct.ButtonCloseClick(Sender: TObject);
begin
  case FormKind of
    kdInsert:
      begin
        if MessageBox(0, PChar('Если сейчас выйти, акт не будет сохранён.' + sLineBreak +
          'Выйти без сохранения акта?'), PWideChar(Caption), MB_ICONWARNING + MB_YESNO + mb_TaskModal) = mryes
        then
        begin
          if qrAct.State in [dsEdit, dsInsert] then
            qrAct.Cancel;
          Close;
        end;
      end;
    kdEdit:
      begin
        if qrAct.State in [dsEdit, dsInsert] then
          qrAct.Cancel;
        Close;
      end;
  end;
end;

procedure TfCardAct.ButtonSaveClick(Sender: TObject);

  function addParentEstimate(aParentID, aType: Integer): Integer;
  var
    NewID: Variant;
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
    qrMain.FieldByName('obj_id').AsInteger := qrTemp.FieldByName('obj_id').Value;
    qrMain.FieldByName('parent_id').AsInteger := aParentID;
    qrMain.FieldByName('ACT').Value := qrTemp.FieldByName('ACT').Value;
    qrMain.FieldByName('USER_ID').Value := qrTemp.FieldByName('USER_ID').Value;
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

    Result := NewID;
  end;

var
  NewID, MAIS_ID, IdStavka, VAT, vMonth, vYear, SM_NUMBER: Variant;
begin
  case FormKind of
    kdInsert:
      begin
        try
          with qrTemp do
          begin
            try
              Active := False;
              SQL.Clear;
              SQL.Add('SELECT objcards.MAIS_ID, state_nds, BEG_STROJ, objregion.percent_transport as "PercentTransport" FROM objcards, objstroj, objregion '
                + 'WHERE objcards.stroj_id = objstroj.stroj_id and objstroj.obj_region = objregion.obj_region_id and '
                + 'objcards.obj_id = ' + qrAct.FieldByName('OBJ_ID').AsString + ';');
              Active := True;

              VAT := FieldByName('state_nds').AsInteger;
              // FieldByName('BEG_STROJ').AsDateTime
              vMonth := MonthOf(edDate.Date);
              vYear := YearOf(edDate.Date);
              MAIS_ID := FieldByName('MAIS_ID').Value;
            except
              on E: Exception do
                MessageBox(0, PChar('При запросе НДС возникла ошибка:' + sLineBreak + E.Message),
                  PWideChar(Caption), MB_ICONERROR + MB_OK + mb_TaskModal);
            end;

            if cbbType.ItemIndex = 1 then
            begin
              try
                Active := False;
                SQL.Clear;
                SQL.Add('SELECT stavka_id FROM stavka WHERE year = ' + IntToStr(vYear) + ' and monat = ' +
                  IntToStr(vMonth) + ';');
                Active := True;

                if IsEmpty then
                  Abort;

                IdStavka := FieldByName('stavka_id').Value;
              except
                on E: Exception do
                begin
                  MessageDlg('Для выбранной даты составления значения ставок отсутствуют.'#13 +
                    'Загрузите ставки или укажите другую дату составления акта.', mtError, [mbOK], 0);
                  Exit;
                end;
              end;
            end;
            /// /-----

            NewID := FastSelectSQLOne('SELECT GetNewID(:IDType)', VarArrayOf([C_ID_SM]));

            if VarIsNull(NewID) then
              raise Exception.Create('Не удалось получить новый ID.');

            SM_NUMBER := FastSelectSQLOne
              ('SELECT max(sm_number) FROM smetasourcedata WHERE ACT=1 and sm_type=2 and obj_id =:0',
              VarArrayOf([qrAct.FieldByName('OBJ_ID').Value]));
            if VarIsNull(SM_NUMBER) then
              SM_NUMBER := 0;
            SM_NUMBER := SM_NUMBER + 1;

            SQL.Clear;
            SQL.Add('INSERT INTO smetasourcedata (SM_ID,OBJ_ID,name,description,date,foreman_id,ACT,'#13 +
              'TYPE_ACT,SM_TYPE,PARENT_ID,MAIS_ID,nds,stavka_id,KZP,k31,k32,k33,k34,k35,coef_tr_obor,SM_NUMBER,USER_ID) '
              + 'VALUE (:ID, :OBJ_ID, :name, :description, :date, :foreman_id, 1, :TYPE_ACT, 2, 0,'#13 +
              ':MAIS_ID,:nds,:stavka_id,:KZP,:k31,:k32,:k33,:k34,:k35,:coef_tr_obor,:SM_NUMBER,:USER_ID);');
            ParamByName('ID').Value := NewID;
            ParamByName('name').Value := dbedtNAME.Text;
            ParamByName('description').Value := dbmmoDESCRIPTION.Text;
            ParamByName('date').AsDate := edDate.Date;
            ParamByName('foreman_id').Value := qrAct.FieldByName('foreman_id').Value;
            ParamByName('OBJ_ID').Value := qrAct.FieldByName('OBJ_ID').Value;
            ParamByName('TYPE_ACT').Value := cbbType.ItemIndex;
            ParamByName('MAIS_ID').Value := MAIS_ID;
            ParamByName('nds').Value := VAT;
            ParamByName('stavka_id').Value := IdStavka;
            ParamByName('USER_ID').Value := G_USER_ID;
            ParamByName('KZP').Value := GetUniDictParamValue('K_KORR_ZP', vMonth, vYear);
            ParamByName('k31').Value := GetUniDictParamValue('K_OXR_OPR_270', vMonth, vYear);
            ParamByName('k32').Value := GetUniDictParamValue('K_PLAN_PRIB_270', vMonth, vYear);
            ParamByName('k33').Value := GetUniDictParamValue('K_VREM_ZDAN_SOOR', vMonth, vYear);
            ParamByName('k34').Value := GetUniDictParamValue('K_ZIM_UDOR_1', vMonth, vYear);
            ParamByName('k35').Value := GetUniDictParamValue('K_ZIM_UDOR_2', vMonth, vYear);
            ParamByName('coef_tr_obor').Value := 2;
            ParamByName('SM_NUMBER').Value := SM_NUMBER;

            ExecSQL;
            if qrAct.State in [dsInsert] then
              qrAct.Cancel;
          end;
          CloseOpen(fObjectsAndEstimates.qrActsEx, False);
          fObjectsAndEstimates.qrActsEx.Locate('MASTER_ID', NewID, []);
          // Если акт на допработы
          if cbbType.ItemIndex = 1 then
          begin
            // Создаем разделы по умолчанию
            // добавляем Локальную
            NewID := addParentEstimate(NewID, 1);;
            // и раздел ПТМ
            addParentEstimate(NewID, 3);
          end;
          Close;
        except
          on E: Exception do
            MessageBox(0, PChar('При создании нового акта возникла ошибка:' + sLineBreak + sLineBreak +
              E.Message), PWideChar(Caption), MB_ICONERROR + MB_OK + mb_TaskModal);
        end;
      end;
    kdEdit:
      begin
        if qrAct.State in [dsEdit] then
          qrAct.Post;
        Close;
      end;
  end;
end;

procedure TfCardAct.dbedtNAMEChange(Sender: TObject);
begin
  if not CheckQrActiveEmpty(qrAct) or (FormKind <> kdInsert) then
    Exit;
  qrAct.FieldByName('DESCRIPTION').AsString := dbedtNAME.Text;
end;

procedure TfCardAct.edDateChange(Sender: TObject);
begin
  if not CheckQrActiveEmpty(qrAct) or (FormKind <> kdInsert) then
    Exit;
  qrAct.FieldByName('NAME').AsString := 'Акт№' + IntToStr(cnt) + 'от' + qrAct.FieldByName('DATE').AsString +
    'для' + fObjectsAndEstimates.qrObjects.FieldByName('NumberObject').AsString + ' ' +
    fObjectsAndEstimates.qrObjects.FieldByName('FullName').AsString;
end;

end.
