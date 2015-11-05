unit CardObject;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, ComCtrls, StdCtrls,
  ExtCtrls, System.DateUtils, DB, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, Tools,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Mask, Vcl.Menus, Vcl.DBCtrls, System.UITypes, Vcl.Buttons, Vcl.Samples.Spin;

type
  TfCardObject = class(TSmForm)

    DataSourceSF: TDataSource;
    DataSourceCO: TDataSource;
    dsR: TDataSource;
    dsZP: TDataSource;
    GroupBoxObject: TGroupBox;
    GroupBoxContract: TGroupBox;
    GroupBoxShortDescription: TGroupBox;
    GroupBoxFullDescription: TGroupBox;
    GroupBoxDateBuilding: TGroupBox;
    GroupBoxSourseFinance: TGroupBox;
    GroupBoxClient: TGroupBox;
    GroupBoxContractor: TGroupBox;
    GroupBoxCategoryObject: TGroupBox;
    GroupBoxVAT: TGroupBox;
    GroupBoxRegion: TGroupBox;

    GroupBoxBasePrices: TGroupBox;
    GroupBoxTypeOXR: TGroupBox;
    GroupBoxZonePrices: TGroupBox;
    EditNumberObject: TEdit;
    EditNumberContract: TEdit;
    EditShortDescription: TEdit;
    EditCountMonth: TEdit;

    LabelNumberContract: TLabel;
    Label2: TLabel;
    LabelStartBuilding: TLabel;
    LabelCountMonth: TLabel;

    DateTimePickerDataCreateContract: TDateTimePicker;

    DBLookupComboBoxSourseFinance: TDBLookupComboBox;
    dblkcbbCategoryObject: TDBLookupComboBox;
    dblkcbbZonePrices: TDBLookupComboBox;
    dblkcbbTypeOXR: TDBLookupComboBox;
    DBLookupComboBoxBasePrices: TDBLookupComboBox;
    dblkcbbRegion: TDBLookupComboBox;

    ButtonListAgreements: TButton;
    ButtonSave: TButton;
    ButtonCancel: TButton;

    MemoFullDescription: TMemo;
    ComboBoxVAT: TComboBox;
    DataSourceBP: TDataSource;
    dsTO: TDataSource;
    DataSourceDifferent: TDataSource;
    LabelNumberObject: TLabel;
    LabelCodeObject: TLabel;
    EditCodeObject: TEdit;
    Bevel1: TBevel;
    CheckBoxCalculationEconom: TCheckBox;
    ADOQueryDifferent: TFDQuery;
    ADOQuerySF: TFDQuery;
    ADOQueryCO: TFDQuery;
    qrBP: TFDQuery;
    qrTO: TFDQuery;
    qrR: TFDQuery;
    qrZP: TFDQuery;
    qrMAIS: TFDQuery;
    dsMAIS: TDataSource;
    grp1: TGroupBox;
    lbl1: TLabel;
    lbl2: TLabel;
    dbedtPER_TEPM_BUILD: TDBEdit;
    dbedtPER_CONTRACTOR: TDBEdit;
    qrMain: TFDQuery;
    dsMain: TDataSource;
    pm1: TPopupMenu;
    N1: TMenuItem;
    grp2: TGroupBox;
    dblkcbbMAIS: TDBLookupComboBox;
    dblkcbbCUST_ID: TDBLookupComboBox;
    dblkcbbGENERAL: TDBLookupComboBox;
    dsClients: TDataSource;
    qrClients: TFDQuery;
    btn1: TBitBtn;
    btn2: TBitBtn;
    cbbFromMonth: TComboBox;
    seYear: TSpinEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

    procedure ButtonSaveClick(Sender: TObject);
    procedure ButtonCancelClick(Sender: TObject);

    procedure EditNumberObjectKeyPress(Sender: TObject; var Key: Char);

    procedure EditingRecord(const Value: Boolean);
    procedure SetIdSelectRow(const Value: Integer);
    procedure SetSourceFinance(const Value: Integer);
    procedure SetCategory(const Value: Integer);
    procedure SetRegion(const Value: Integer);
    procedure SetVAT(const Value: Integer);
    procedure SetBasePrice(const Value: Integer);
    procedure SetTypeOXR(const Value: Integer);
    procedure SetMAIS(const Value: Integer);

    procedure SetColorDefaultToFields;
    procedure ClearAllFields;

    procedure GetValueDBLookupComboBoxTypeOXR(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure dblkcbbRegionCloseUp(Sender: TObject);
    procedure DateTimePickerStartBuildingChange(Sender: TObject);
    procedure lbl2Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure ButtonListAgreementsClick(Sender: TObject);

  private
    Editing: Boolean; // Для отслеживания режима добавления или редактирования записи
    IdObject: Integer; // ID выделенной строки в таблице
    StrQuery: String;

    // ДЛЯ УСТАНОВКА ЗНАЧЕНИЙ В ВЫПАДАЮЩИХ СПИСКАХ ПРИ РЕДАКТИРОВАНИИ ЗАПИСИ

    SourceFinance: Integer;
    CategoryObject: Integer;
    Region: Integer;
    VAT: Integer;
    BasePrice: Integer;
    TypeOXR: Integer;
    MAIS: Integer;
  public
    OUT_ID_OBJECT: Variant;
  end;

const
  CaptionForm = 'Карточка объекта';

var
  fCardObject: TfCardObject;

implementation

uses Main, DataModule, CardObjectContractorServices, OrganizationsEx, SuppAgreement,
  GlobsAndConst, CalculationEstimate;

{$R *.dfm}

procedure TfCardObject.FormCreate(Sender: TObject);
begin
  inherited;
  with Constraints do
  begin
    MinHeight := Height;
    MaxHeight := Height;
    MinWidth := Width;
    MaxWidth := Width;
  end;

  Caption := CaptionForm;

  Editing := False;
end;

procedure TfCardObject.FormShow(Sender: TObject);
begin
  qrZP.Filtered := False;
  dbedtPER_TEPM_BUILD.ReadOnly := True;
  dbedtPER_CONTRACTOR.ReadOnly := True;

  Left := FormMain.Left + (FormMain.Width - Width) div 2;
  Top := FormMain.Top + (FormMain.Height - Height) div 2;

  qrMain.ParamByName('OBJ_ID').AsInteger := IdObject;
  CloseOpen(qrMain);
  CloseOpen(qrClients);
  // Устанавливаем фокус
  if EditCodeObject.Focused then
    EditCodeObject.SetFocus;

  ButtonSave.Tag := 0;

  // -----------------------------------------

  SetColorDefaultToFields; // Устанавливаем начальный цвет полям редактирования

  // Очистка полей формы
  if not Editing then
  begin
    ClearAllFields;
    // Заполнение % временных зданий и сооружений, услуги генподрядчика
    DateTimePickerStartBuildingChange(Sender);
  end;

  if not Editing then
    try
      with ADOQueryDifferent do
      begin

        Active := False;
        SQL.Clear;

        StrQuery := 'SELECT max(num) as "MaxNumber", count(*) as "CountObject" FROM objcards;';

        SQL.Add(StrQuery);
        Active := True;

        if FieldByName('CountObject').AsVariant > 0 then
          EditNumberObject.Text := IntToStr(FieldByName('MaxNumber').AsVariant + 1)
        else
          EditNumberObject.Text := '1';
      end;
    except
      on E: Exception do
        MessageBox(0, PChar('При формировании НОМЕРА ОБЪЕКТА возникла ошибка:' + sLineBreak + E.Message),
          CaptionForm, MB_ICONERROR + MB_OK + mb_TaskModal);
    end;;

  // ИСТОЧНИК ФИНАНСИРОВАНИЯ

  try
    with ADOQuerySF do
    begin
      Active := False;
      SQL.Clear;
      SQL.Add('SELECT * FROM istfin;');
      Active := True;
    end;

    with DBLookupComboBoxSourseFinance do
    begin
      ListSource := DataSourceSF;
      ListField := 'name';
      KeyField := 'fin_id';
    end;
  except
    on E: Exception do
      MessageBox(0, PChar('При запросе списка ИСТОЧНИКИ ФИНАНСИРОВАНИЯ возникла ошибка:' + sLineBreak +
        E.Message), CaptionForm, MB_ICONERROR + MB_OK + mb_TaskModal);
  end;

  // КАТЕГОРИЯ ОБЪЕКТА

  try
    with ADOQueryCO do
    begin
      Active := False;
      SQL.Clear;
      SQL.Add('SELECT * FROM objcategory;');
      Active := True;
    end;

    with dblkcbbCategoryObject do
    begin
      ListSource := DataSourceCO;
      ListField := 'cat_name';
      KeyField := 'cat_id';
    end;
  except
    on E: Exception do
      MessageBox(0, PChar('При запросе списка КАТЕГОРИИ ОБЪЕКТА возникла ошибка:' + sLineBreak + E.Message),
        CaptionForm, MB_ICONERROR + MB_OK + mb_TaskModal);
  end;

  // РЕГИОН

  try
    with qrR do
    begin
      Active := False;
      SQL.Clear;
      SQL.Add('SELECT * FROM regions;');
      Active := True;
    end;

    with dblkcbbRegion do
    begin
      ListSource := dsR;
      ListField := 'region_name';
      KeyField := 'region_id';
    end;
  except
    on E: Exception do
      MessageBox(0, PChar('При запросе списка РЕГИОНОВ возникла ошибка:' + sLineBreak + E.Message),
        CaptionForm, MB_ICONERROR + MB_OK + mb_TaskModal);
  end;

  // БАЗА РАСЦЕНОК

  try
    with qrBP do
    begin
      Active := False;
      SQL.Clear;
      SQL.Add('SELECT * FROM baseprices;');
      Active := True;
    end;

    with DBLookupComboBoxBasePrices do
    begin
      ListSource := DataSourceBP;
      ListField := 'base_name';
      KeyField := 'base_id';
      // Автоматическая подстановка Базы расценок в новую запись
      if not qrBP.IsEmpty and not Editing then
        KeyValue := qrBP.FieldByName('base_id').AsInteger;
    end;
  except
    on E: Exception do
      MessageBox(0, PChar('При запросе списка БАЗ РАСЦЕНОК возникла ошибка:' + sLineBreak + E.Message),
        CaptionForm, MB_ICONERROR + MB_OK + mb_TaskModal);
  end;

  // ЗОНА РАСЦЕНОК

  try
    with qrZP do
    begin
      Active := False;
      SQL.Clear;
      SQL.Add('SELECT * FROM objregion;');
      Active := True;
    end;

    with dblkcbbZonePrices do
    begin
      ListSource := dsZP;
      ListField := 'region';
      KeyField := 'obj_region_id';
    end;
  except
    on E: Exception do
      MessageBox(0, PChar('При запросе списка ЗОН РАСЦЕНОК возникла ошибка:' + sLineBreak + E.Message),
        CaptionForm, MB_ICONERROR + MB_OK + mb_TaskModal);
  end;

  try
    with qrMAIS do
    begin
      Active := False;
      SQL.Clear;
      SQL.Add('SELECT MAIS_ID, CONCAT(`mais`.`NAME`, " от ", DATE_FORMAT(`mais`.`onDate`, "%d.%m.%y"), " действует с ", DATE_FORMAT(`mais`.`Start_Date`, "%d.%m.%y")) AS NAME, onDate FROM mais ORDER BY onDate DESC;');
      Active := True;
    end;

    with dblkcbbMAIS do
    begin
      ListSource := dsMAIS;
      ListField := 'NAME';
      KeyField := 'MAIS_ID';
    end;

    // Автоматический выбор последнего МАИС
    if not Editing then
    begin
      while not(qrMAIS.Eof) and (seYear.Value <= YearOf(qrMAIS.FieldByName('onDate').AsDateTime)) do
        qrMAIS.Next;
      dblkcbbMAIS.KeyValue := qrMAIS.FieldByName('MAIS_ID').AsInteger;
    end;
  except
    on E: Exception do
      MessageBox(0, PChar('При запросе списка МАИСов возникла ошибка:' + sLineBreak + E.Message), CaptionForm,
        MB_ICONERROR + MB_OK + mb_TaskModal);
  end;

  if not Editing then
  begin
    DM.qrDifferent.SQL.Text := 'SELECT SUM(FN_getParamValue(code, :month, :year)) AS VALUE'#13 +
      'FROM unidictparam WHERE id_unidicttype=7';
    DM.qrDifferent.ParamByName('month').AsInteger := cbbFromMonth.ItemIndex + 1;
    DM.qrDifferent.ParamByName('year').AsInteger := seYear.Value;
    DM.qrDifferent.Active := True;
    qrMain.FieldByName('PER_CONTRACTOR').Value := DM.qrDifferent.FieldByName('VALUE').Value;
    DM.qrDifferent.Active := False;
  end;

  // Выставляем начальные значения в выпадающих списках
  if Editing then
  begin
    DBLookupComboBoxSourseFinance.KeyValue := SourceFinance;
    dblkcbbCategoryObject.KeyValue := CategoryObject;
    dblkcbbRegion.KeyValue := Region;
    ComboBoxVAT.ItemIndex := qrMain.FieldByName('state_nds').AsInteger;
    DBLookupComboBoxBasePrices.KeyValue := BasePrice;
    dblkcbbMAIS.KeyValue := MAIS;

    try
      with ADOQueryDifferent do
      begin
        Active := False;
        SQL.Clear;
        SQL.Add('SELECT obj_region FROM objstroj WHERE stroj_id = ' + IntToStr(TypeOXR) + ';');
        Active := True;
      end;

      dblkcbbZonePrices.KeyValue := DataSourceDifferent.DataSet.FieldByName('obj_region').AsVariant;
    except
      on E: Exception do
        MessageBox(0, PChar('При установке значения в ЗОНЕ РАСЦЕНОК возникла ошибка:' + sLineBreak +
          E.Message), CaptionForm, MB_ICONERROR + MB_OK + mb_TaskModal);
    end;

    GetValueDBLookupComboBoxTypeOXR(nil);

    dblkcbbTypeOXR.KeyValue := TypeOXR;
  end;
end;

procedure TfCardObject.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if ButtonSave.Tag = 0 then
    if MessageBox(0, PChar('Закрыть окно без сохранения?'), CaptionForm, MB_ICONINFORMATION + MB_YESNO +
      mb_TaskModal) = mrYes then
      CanClose := True
    else
      CanClose := False;
end;

procedure TfCardObject.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Editing := False;
end;

procedure TfCardObject.ButtonSaveClick(Sender: TObject);
var
  NumberObject, v2, v3, v4, v5, v6, v7, v8, v9, v12, v14, v15, v16, v17, v18, v19: string;
  CountField: Integer;
  NEW_ID: Variant;
begin
  NEW_ID := NULL;
  CountField := 0;
  // ПРОВЕРКА ЧТОБЫ НЕ БЫЛО ПУСТЫХ ЗНАЧЕНИЙ

  SetColorDefaultToFields;

  NumberObject := EditNumberObject.Text;

  // Шифр объекта
  if EditCodeObject.Text <> '' then
    v17 := EditCodeObject.Text
  else
  begin
    v17 := '';
    // EditCodeObject.Color := ColorWarningField;
    // Inc(CountField);
  end;

  // Номер договора
  if EditNumberContract.Text <> '' then
    v2 := EditNumberContract.Text
  else
  begin
    v2 := '';
    // EditNumberContract.Color := ColorWarningField;
    // Inc(CountField);
  end;

  // Дата заключения договора
  DateTimeToString(v3, 'yyyy-mm-dd', DateTimePickerDataCreateContract.Date);

  // Список дополнительных соглашений
  v4 := '0'; // ???????????????????????

  // Полное наименование объекта
  if MemoFullDescription.Text <> '' then
    v5 := MemoFullDescription.Text
  else
  begin
    v5 := '';
    // MemoFullDescription.Color := ColorWarningField;
    // Inc(CountField);
  end;

  // Краткое наименование объекта
  if EditShortDescription.Text <> '' then
    v6 := EditShortDescription.Text
  else
  begin
    v6 := '';
    // EditShortDescription.Color := ColorWarningField;
    // Inc(CountField);
  end;

  // Дата начала строительства
  DateTimeToString(v7, 'yyyy-mm-dd', StrToDate('01.' + IntToStr(cbbFromMonth.ItemIndex + 1) + '.' +
    IntToStr(seYear.Value)));
  DM.qrDifferent.SQL.Text := 'SELECT stavka_id FROM stavka WHERE year = :year and monat = :month';
  DM.qrDifferent.ParamByName('month').AsInteger := cbbFromMonth.ItemIndex + 1;
  DM.qrDifferent.ParamByName('year').AsInteger := seYear.Value;
  DM.qrDifferent.Active := True;
  if DM.qrDifferent.IsEmpty then
  begin
    MessageDlg('Для выбранной даты составления сметы значения ставок отсутствуют.'#13 +
      'Загрузите ставки или укажите другую дату составления сметы.', mtError, [mbOK], 0);
    cbbFromMonth.SetFocus;
    exit;
  end;

  // Срок строительства (месяцы)
  if EditCountMonth.Text <> '' then
    v8 := EditCountMonth.Text
  else
  begin
    v8 := 'Null';
    // EditCountMonth.Color := ColorWarningField;
    // Inc(CountField);
  end;

  // Источник финансирования
  if DBLookupComboBoxSourseFinance.KeyValue <> NULL then
    v9 := DBLookupComboBoxSourseFinance.KeyValue
  else
  begin
    v9 := 'Null';
    // DBLookupComboBoxSourseFinance.Color := ColorWarningField;
    // Inc(CountField);
  end;

  // Категория объекта
  if dblkcbbCategoryObject.KeyValue <> NULL then
    v12 := dblkcbbCategoryObject.KeyValue
  else
  begin
    dblkcbbCategoryObject.Color := ColorWarningField;
    Inc(CountField);
  end;

  // Регион
  if dblkcbbRegion.KeyValue <> NULL then
    v14 := dblkcbbRegion.KeyValue
  else
  begin
    dblkcbbRegion.Color := ColorWarningField;
    Inc(CountField);
  end;

  // База расценок
  with DBLookupComboBoxBasePrices do
    if KeyValue <> NULL then
      v15 := KeyValue
    else
    begin
      Color := ColorWarningField;
      Inc(CountField);
    end;

  // Зона расценок
  with dblkcbbZonePrices do
    if KeyValue = NULL then
    begin
      Color := ColorWarningField;
      Inc(CountField);
    end;

  // Тип ОХР и ОПР и план прибыли
  with dblkcbbTypeOXR do
    if KeyValue <> NULL then
      v16 := KeyValue
    else
    begin
      Color := ColorWarningField;
      Inc(CountField);
    end;

  with dblkcbbMAIS do
    if KeyValue <> NULL then
      v19 := KeyValue
    else
    begin
      Color := ColorWarningField;
      Inc(CountField);
    end;

  // Расчёт хоз. способом
  if CheckBoxCalculationEconom.Checked then
    v18 := '1'
  else
    v18 := '0';

  if CountField > 0 then
  begin
    MessageBox(0, PChar('Вы заполнили не все поля!' + sLineBreak +
      'Поля выделенные красным не заполнены или заполнены неправильно.'), CaptionForm,
      MB_ICONWARNING + MB_OK + mb_TaskModal);
    exit;
  end;

  try
    with DM.qrDifferent do
    begin
      Active := False;
      SQL.Clear;
      OUT_ID_OBJECT := IdObject;
      if Editing then
        SQL.Add('UPDATE objcards SET num = "' + NumberObject + '", num_dog = "' + v2 + '", date_dog = "' + v3
          + '", agr_list = "' + v4 + '", full_name = "' + v5 + '", name = "' + v6 + '", beg_stroj = "' + v7 +
          '", srok_stroj = ' + v8 + ', ' + ' fin_id = ' + v9 +
          ', cust_id = :cust_id, general_id = :general_id, cat_id = "' + v12 +
          '", state_nds = :snds, region_id = "' + v14 + '", base_norm_id = "' + v15 + '", stroj_id = "' + v16
          + '", encrypt = "' + v17 + '", calc_econom = "' + v18 + '", MAIS_ID = "' + v19 +
          '", PER_TEMP_BUILD=:PER_TEMP_BUILD, PER_CONTRACTOR=:PER_CONTRACTOR, '#13 +
          'PER_TEMP_BUILD_BACK=:PER_TEMP_BUILD_BACK, CONTRACTOR_SERV=:CONTRACTOR_SERV WHERE obj_id = "' +
          IntToStr(IdObject) + '";')
      else
      begin
        NEW_ID := FastSelectSQLOne('SELECT GetNewID(:IDType)', VarArrayOf([C_ID_OBJ]));
        SQL.Add('INSERT INTO objcards (obj_id, num, num_dog, date_dog, agr_list, full_name, name, beg_stroj, srok_stroj, '
          + ' fin_id, cust_id, general_id, cat_id, state_nds, region_id, base_norm_id, stroj_id, encrypt,' +
          ' calc_econom, MAIS_ID, PER_TEMP_BUILD, PER_CONTRACTOR, PER_TEMP_BUILD_BACK, CONTRACTOR_SERV, USER_ID) '
          + 'VALUE (:NEW_ID, "' + NumberObject + '", "' + v2 + '", "' + v3 + '", "' + v4 + '", "' + v5 +
          '", "' + v6 + '", "' + v7 + '", ' + v8 + ', ' + v9 + ', :cust_id, :general_id, "' + v12 +
          '", :snds, "' + v14 + '", "' + v15 + '", "' + v16 + '", "' + v17 + '", "' + v18 + '", "' + v19 +
          '", :PER_TEMP_BUILD, :PER_CONTRACTOR, :PER_TEMP_BUILD_BACK, :CONTRACTOR_SERV, :USER_ID);');
        ParamByName('NEW_ID').Value := NEW_ID;
        ParamByName('USER_ID').Value := G_USER_ID;
        OUT_ID_OBJECT := NEW_ID;
      end;
      ParamByName('PER_TEMP_BUILD').Value := qrMain.FieldByName('PER_TEMP_BUILD').Value;
      ParamByName('PER_CONTRACTOR').Value := qrMain.FieldByName('PER_CONTRACTOR').Value;
      ParamByName('PER_TEMP_BUILD_BACK').Value := qrMain.FieldByName('PER_TEMP_BUILD_BACK').Value;
      ParamByName('CONTRACTOR_SERV').Value := qrMain.FieldByName('CONTRACTOR_SERV').AsInteger;
      ParamByName('cust_id').Value := qrMain.FieldByName('cust_id').AsInteger;
      ParamByName('general_id').Value := qrMain.FieldByName('general_id').AsInteger;
      ParamByName('snds').Value := ComboBoxVAT.ItemIndex;
      ExecSQL;
    end;

    ButtonSave.Tag := 1;
    qrMain.Close;

    // Если открыта смета или акт, то вызываем перерасчет
    if Assigned(FormCalculationEstimate) then
    begin
      FormCalculationEstimate.RecalcEstimate;
      FormCalculationEstimate.FillObjectInfo;
    end;
    ModalResult := mrOk;
    // Close;
  except
    on E: Exception do
      MessageBox(0, PChar('При сохранении данных возникла ошибка:' + sLineBreak + sLineBreak + E.Message),
        CaptionForm, MB_ICONERROR + MB_OK + mb_TaskModal);
  end;
end;

procedure TfCardObject.btn1Click(Sender: TObject);
var
  res: Variant;
begin
  res := SelectOrganization(dblkcbbGENERAL.KeyValue);
  if not VarIsNull(res) then
  begin
    CloseOpen(qrClients);
    dblkcbbGENERAL.KeyValue := res;
    qrMain.Edit;
    qrMain.FieldByName('general_id').Value := res;
  end;
end;

procedure TfCardObject.btn2Click(Sender: TObject);
var
  res: Variant;
begin
  res := SelectOrganization(dblkcbbCUST_ID.KeyValue);
  if not VarIsNull(res) then
  begin
    CloseOpen(qrClients);
    dblkcbbCUST_ID.KeyValue := res;
    qrMain.Edit;
    qrMain.FieldByName('cust_id').Value := res;
  end;
end;

procedure TfCardObject.ButtonCancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
  Close;
end;

procedure TfCardObject.ButtonListAgreementsClick(Sender: TObject);
begin
  ShowSuppAgreement(IdObject);
end;

procedure TfCardObject.EditNumberObjectKeyPress(Sender: TObject; var Key: Char);
begin
  { if Key <> #8 then
    if (Key < '0') or (Key > '9') then // Запрещаем ввод символов кроме цифр
    Key := #0; }
end;

procedure TfCardObject.EditingRecord(const Value: Boolean);
begin
  Editing := Value;
end;

procedure TfCardObject.SetIdSelectRow(const Value: Integer);
begin
  IdObject := Value;
end;

procedure TfCardObject.SetSourceFinance(const Value: Integer);
begin
  SourceFinance := Value;
end;

procedure TfCardObject.SetCategory(const Value: Integer);
begin
  CategoryObject := Value;
end;

procedure TfCardObject.SetRegion(const Value: Integer);
begin
  Region := Value;
end;

procedure TfCardObject.SetVAT(const Value: Integer);
begin
  VAT := Value;
end;

procedure TfCardObject.SetBasePrice(const Value: Integer);
begin
  BasePrice := Value;
end;

procedure TfCardObject.SetTypeOXR(const Value: Integer);
begin
  TypeOXR := Value;
end;

procedure TfCardObject.SetMAIS(const Value: Integer);
begin
  MAIS := Value;
end;

procedure TfCardObject.SetColorDefaultToFields;
begin
  EditCodeObject.Color := clWindow;
  EditNumberContract.Color := clWindow;
  EditShortDescription.Color := clWindow;
  MemoFullDescription.Color := clWindow;
  EditCountMonth.Color := clWindow;
  DBLookupComboBoxSourseFinance.Color := clWindow;
  dblkcbbCategoryObject.Color := clWindow;
  dblkcbbRegion.Color := clWindow;
  dblkcbbZonePrices.Color := clWindow;
  DBLookupComboBoxBasePrices.Color := clWindow;
  dblkcbbTypeOXR.Color := clWindow;
  dblkcbbMAIS.Color := clWindow;
end;

procedure TfCardObject.ClearAllFields;
begin
  EditCodeObject.Text := '';
  EditNumberContract.Text := '';
  EditShortDescription.Text := '';
  MemoFullDescription.Text := '';
  EditCountMonth.Text := '';
  CheckBoxCalculationEconom.Checked := False;
  DateTimePickerDataCreateContract.Date := Now;
  cbbFromMonth.ItemIndex := MonthOf(Now) - 1;
  seYear.Value := YearOf(Now);
  DBLookupComboBoxSourseFinance.KeyValue := NULL;
  dblkcbbCategoryObject.KeyValue := NULL;
  dblkcbbRegion.KeyValue := NULL;
  dblkcbbZonePrices.KeyValue := NULL;
  DBLookupComboBoxBasePrices.KeyValue := NULL;
  dblkcbbTypeOXR.KeyValue := NULL;
  dblkcbbMAIS.KeyValue := NULL;
end;

procedure TfCardObject.DateTimePickerStartBuildingChange(Sender: TObject);
begin
  // Автоматическое заполнение %в расхода
  // if not Editing then // только для новых записей
  begin
    qrMain.Edit;
    qrMain.FieldByName('PER_TEMP_BUILD').Value := GetUniDictParamValue('PER_TEMP_BUILD',
      cbbFromMonth.ItemIndex + 1, seYear.Value);
    qrMain.FieldByName('PER_TEMP_BUILD_BACK').Value := GetUniDictParamValue('PER_TEMP_BUILD_BACK',
      cbbFromMonth.ItemIndex + 1, seYear.Value);
    // Автоподстановка МАИС
    if CheckQrActiveEmpty(qrMAIS) then
    begin
      qrMAIS.First;
      while not(qrMAIS.Eof) and (seYear.Value <= YearOf(qrMAIS.FieldByName('onDate').AsDateTime)) do
        qrMAIS.Next;
      dblkcbbMAIS.KeyValue := qrMAIS.FieldByName('MAIS_ID').AsInteger;
    end;
  end;
end;

procedure TfCardObject.dblkcbbRegionCloseUp(Sender: TObject);
begin
  if qrZP.IsEmpty then
    exit;
  // Автоматическая подстановка зоны расценок "Минск" при выборе региона "Минск"
  if dblkcbbRegion.KeyValue = 7 then
  begin
    qrZP.Filter := 'OBJ_REGION_ID = 3';
    qrZP.Filtered := True;
    dblkcbbZonePrices.KeyValue := 3;
    GetValueDBLookupComboBoxTypeOXR(Sender);
  end
  else if not VarIsNull(dblkcbbRegion.KeyValue) then
  begin
    qrZP.Filter := 'OBJ_REGION_ID <> 3';
    qrZP.Filtered := True;
    qrZP.First;
    dblkcbbZonePrices.KeyValue := 1;
    GetValueDBLookupComboBoxTypeOXR(Sender);
  end;
end;

procedure TfCardObject.GetValueDBLookupComboBoxTypeOXR(Sender: TObject);
var
  IdRegion: Integer;
  IdCategory: Integer;
begin
  if (dblkcbbCategoryObject.KeyValue = NULL) or (dblkcbbZonePrices.KeyValue = NULL) then
    exit;

  // Тип ОХР и ОПР и План прибыли

  IdRegion := dblkcbbZonePrices.KeyValue;
  IdCategory := dblkcbbCategoryObject.KeyValue;

  try
    with qrTO do
    begin
      Active := False;
      SQL.Clear;
      SQL.Add('SELECT * FROM objstroj WHERE obj_region = ' + IntToStr(IdRegion) + ' and obj_category_id = ' +
        IntToStr(IdCategory) + ';');
      Active := True;
    end;

    with dblkcbbTypeOXR do
    begin
      ListSource := dsTO;
      ListField := 'name';
      KeyField := 'stroj_id';
    end;
    dblkcbbTypeOXR.KeyValue := (IdRegion - 1) * 4 + IdCategory;
  except
    on E: Exception do
      MessageBox(0, PChar('При запросе списка ОХР и ОПР возникла ошибка:' + sLineBreak + E.Message),
        CaptionForm, MB_ICONERROR + MB_OK + mb_TaskModal);
  end;
end;

procedure TfCardObject.lbl2Click(Sender: TObject);
var
  res: Variant;
begin
  res := EditContractorServices(qrMain.FieldByName('CONTRACTOR_SERV').AsInteger);
  if not VarIsNull(res) then
  begin
    qrMain.FieldByName('CONTRACTOR_SERV').Value := res[0];
    qrMain.FieldByName('PER_CONTRACTOR').Value := res[1];
  end;
end;

procedure TfCardObject.N1Click(Sender: TObject);
begin
  dbedtPER_TEPM_BUILD.ReadOnly := False;
  dbedtPER_CONTRACTOR.ReadOnly := False;
end;

end.
