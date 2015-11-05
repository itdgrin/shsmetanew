unit ObjectsAndEstimates;

interface

uses
  Windows, Messages, SysUtils, System.Types, System.IOUtils, Variants,
  Classes, Graphics, Controls, Forms, Dialogs, ExtCtrls, Grids, Menus,
  Vcl.StdActns, DB, DBGrids, StdCtrls, ComCtrls, VirtualTrees, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, tools, System.UITypes,
  JvExDBGrids, JvDBGrid, JvExComCtrls, JvDBTreeView, Vcl.Buttons, JvHint,
  JvComponentBase, Vcl.DBCtrls, JvAppStorage, JvAppIniStorage, Vcl.Mask, JvExMask, JvToolEdit, JvMaskEdit,
  JvExStdCtrls, JvCombobox, JvDBSearchComboBox, JvFormPlacement, System.DateUtils;

type
  TSplitter = class(ExtCtrls.TSplitter)
  public
    procedure Paint(); override;
  end;

type
  TfObjectsAndEstimates = class(TSmForm)
    dsObjects: TDataSource;
    PanelMain: TPanel;
    PanelObjects: TPanel;
    PanelBottom: TPanel;
    pmObjects: TPopupMenu;
    PopupMenuObjectsAdd: TMenuItem;
    PopupMenuObjectsEdit: TMenuItem;
    mDelete: TMenuItem;
    PopupMenuObjectsSeparator1: TMenuItem;
    pmEstimates: TPopupMenu;
    PopupMenuEstimatesAdd: TMenuItem;
    PMEstimatesAddLocal: TMenuItem;
    PMEstimatesAddObject: TMenuItem;
    PMEstimatesAddPTM: TMenuItem;
    PMEstimatesEdit: TMenuItem;
    PMEstimatesDelete: TMenuItem;
    PopupMenuEstimatesSeparator1: TMenuItem;
    PMEstimatesBasicData: TMenuItem;
    dbgrdObjects: TJvDBGrid;
    ImageSplitterCenter: TImage;
    SplitterCenter: TSplitter;
    ImageSplitterBottomCenter: TImage;
    SplitterBottomCenter: TSplitter;
    PanelEstimates: TPanel;
    PanelActs: TPanel;
    pmActs: TPopupMenu;
    PMActsAdd: TMenuItem;
    PMActsEdit: TMenuItem;
    PMActsDelete: TMenuItem;
    N1: TMenuItem;
    PMEstimateExpand: TMenuItem;
    PMEstimateCollapse: TMenuItem;
    PMEstimateExpandSelected: TMenuItem;
    PMActsOpen: TMenuItem;
    qrActsEx: TFDQuery;
    qrObjects: TFDQuery;
    pmActProperty: TMenuItem;
    dsActs: TDataSource;
    dsTreeData: TDataSource;
    qrTreeData: TFDQuery;
    tvEstimates: TJvDBTreeView;
    N2: TMenuItem;
    PMImportObject: TMenuItem;
    PMExportObject: TMenuItem;
    PMImportDir: TMenuItem;
    SaveDialog: TSaveDialog;
    OpenDialog: TOpenDialog;
    dbmmoFullName: TDBMemo;
    lblActs: TLabel;
    lblEstimates: TLabel;
    tvActs: TJvDBTreeView;
    pnl1: TPanel;
    mN3: TMenuItem;
    mCopyObject: TMenuItem;
    mShowDeleted: TMenuItem;
    mRepair: TMenuItem;
    mN5: TMenuItem;
    mREM6KC: TMenuItem;
    mADD6KC: TMenuItem;
    mRepAct: TMenuItem;
    mCopy: TMenuItem;
    mN8: TMenuItem;
    lbl3: TLabel;
    edtSearch: TEdit;
    btnSearch: TSpeedButton;
    cbbSearch: TComboBox;
    mN4: TMenuItem;
    mN6: TMenuItem;
    FormStorage: TJvFormStorage;
    mReapirEstimate: TMenuItem;
    mN9: TMenuItem;
    PMCopySmeta: TMenuItem;
    mDeleteEstimate: TMenuItem;
    mDeleteAct: TMenuItem;
    mShowDeletedEstimates: TMenuItem;
    mN15: TMenuItem;
    mN16: TMenuItem;
    mShowDeletedActs: TMenuItem;
    mDeleteObject: TMenuItem;
    mN7: TMenuItem;
    mN10: TMenuItem;
    mN11: TMenuItem;
    mObjectAccess: TMenuItem;
    mEstimateAccess: TMenuItem;
    mActAccess: TMenuItem;
    procedure ResizeImagesForSplitters;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure PopupMenuObjectsAddClick(Sender: TObject);
    procedure PopupMenuObjectsEditClick(Sender: TObject);
    procedure mDeleteClick(Sender: TObject);
    procedure qrObjectsAfterScroll(DataSet: TDataSet);
    procedure PanelBottomResize(Sender: TObject);
    procedure FillingTableObjects;
    procedure PopupMenuEstimatesAddClick(Sender: TObject);
    procedure PMEstimatesEditClick(Sender: TObject);
    procedure PMEstimatesDeleteClick(Sender: TObject);
    procedure PMEstimatesBasicDataClick(Sender: TObject);
    procedure PMEstimateExpandClick(Sender: TObject);
    procedure PMEstimateCollapseClick(Sender: TObject);
    function GetNumberEstimate(): string;
    procedure pmEstimatesPopup(Sender: TObject);
    procedure PMEstimateExpandSelectedClick(Sender: TObject);
    procedure PMActsAddClick(Sender: TObject);
    procedure pmActsPopup(Sender: TObject);
    procedure PMActsDeleteClick(Sender: TObject);
    procedure PMActsEditClick(Sender: TObject);
    procedure PMActsOpenClick(Sender: TObject);
    procedure pmActPropertyClick(Sender: TObject);
    procedure qrActsExAfterOpen(DataSet: TDataSet);
    procedure qrTreeDataAfterOpen(DataSet: TDataSet);
    procedure qrObjectsAfterOpen(DataSet: TDataSet);
    procedure tvEstimatesDblClick(Sender: TObject);
    procedure PMExportObjectClick(Sender: TObject);
    procedure PMImportObjectClick(Sender: TObject);
    procedure PMImportDirClick(Sender: TObject);
    procedure pmObjectsPopup(Sender: TObject);
    procedure mRepairClick(Sender: TObject);
    procedure dbgrdObjectsDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer;
      Column: TColumn; State: TGridDrawState);
    procedure mShowDeletedClick(Sender: TObject);
    procedure mREM6KCClick(Sender: TObject);
    procedure mADD6KCClick(Sender: TObject);
    procedure mRepActClick(Sender: TObject);
    procedure edtSearchKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnSearchClick(Sender: TObject);
    procedure edtSearchChange(Sender: TObject);
    procedure dbgrdObjectsTitleBtnClick(Sender: TObject; ACol: Integer; Field: TField);
    procedure mCopyClick(Sender: TObject);
    procedure mCopyObjectClick(Sender: TObject);
    procedure tvActsCustomDrawItem(Sender: TCustomTreeView; Node: TTreeNode; State: TCustomDrawState;
      var DefaultDraw: Boolean);
    procedure mN6Click(Sender: TObject);
    procedure tvEstimatesCustomDrawItem(Sender: TCustomTreeView; Node: TTreeNode; State: TCustomDrawState;
      var DefaultDraw: Boolean);
    procedure mDeleteEstimateClick(Sender: TObject);
    procedure mReapirEstimateClick(Sender: TObject);
    procedure mShowDeletedEstimatesClick(Sender: TObject);
    procedure mShowDeletedActsClick(Sender: TObject);
    procedure mDeleteActClick(Sender: TObject);
    procedure mDeleteObjectClick(Sender: TObject);
    procedure PMCopySmetaClick(Sender: TObject);
    procedure qrObjectsBeforeOpen(DataSet: TDataSet);
    procedure mObjectAccessClick(Sender: TObject);
    procedure mEstimateAccessClick(Sender: TObject);
    procedure mActAccessClick(Sender: TObject);
  private const
    CaptionButton = 'Объекты и сметы';

  const
    HintButton = 'Окно объектов и смет';
  private
    IdObject: Integer;
    flLoaded: Boolean;
    // TypeEstimate: Integer;
  public
    ActReadOnly: Boolean;
    IdEstimate: Integer;
    function getCurObject: Integer;
  protected
    procedure WMSysCommand(var Msg: TMessage); message WM_SYSCOMMAND;
  end;

var
  fObjectsAndEstimates: TfObjectsAndEstimates;

implementation

uses Main, DataModule, CardObject, CardEstimate, CalculationEstimate, Waiting,
  BasicData, DrawingTables, KC6, CardAct, ImportExportModule, GlobsAndConst, UserAccess;

{$R *.dfm}

{ TSplitter }
procedure TSplitter.Paint();
begin
  // inherited;
  fObjectsAndEstimates.ResizeImagesForSplitters;
end;

procedure TfObjectsAndEstimates.WMSysCommand(var Msg: TMessage);
begin
  // SC_MAXIMIZE - Разворачивание формы во весь экран
  // SC_RESTORE - Сворачивание формы в окно
  // SC_MINIMIZE - Сворачивание формы в маленькую панель

  if (Msg.WParam = SC_MAXIMIZE) or (Msg.WParam = SC_RESTORE) then
  begin
    FormMain.PanelCover.Visible := True;
    inherited;
    FormMain.PanelCover.Visible := False;
  end
  else if Msg.WParam = SC_MINIMIZE then
  begin
    FormMain.PanelCover.Visible := True;
    inherited;
    ShowWindow(fObjectsAndEstimates.Handle, SW_HIDE);
    // Скрываем панель свёрнутой формы
    FormMain.PanelCover.Visible := False;
  end
  else
    inherited;
end;

procedure TfObjectsAndEstimates.ResizeImagesForSplitters;
begin
  ImageSplitterCenter.Top := SplitterCenter.Top;
  ImageSplitterCenter.Left := SplitterCenter.Left + (SplitterCenter.Width - ImageSplitterCenter.Width) div 2;

  ImageSplitterBottomCenter.Left := SplitterBottomCenter.Left;
  ImageSplitterBottomCenter.Top := SplitterBottomCenter.Top +
    (SplitterBottomCenter.Height - ImageSplitterBottomCenter.Height) div 2;
end;

procedure TfObjectsAndEstimates.FormCreate(Sender: TObject);
begin
  inherited;
  FormMain.PanelCover.Visible := True;
  // Настройка размеров и положения формы
  ClientWidth := FormMain.ClientWidth div 2;
  ClientHeight := FormMain.ClientHeight div 2;
  Top := 10;
  // (GetSystemMetrics(SM_CYFRAME) + GetSystemMetrics(SM_CYCAPTION)) * -1;
  Left := 10; // GetSystemMetrics(SM_CXFRAME) * -1;
  WindowState := wsMaximized;
  // -----------------------------------------
  // ЗАГРУЖАЕМ ИЗОБРАЖЕНИЯ ДЛЯ СПЛИТТЕРОВ
  with DM.ImageListHorozontalDots do
  begin
    GetIcon(0, ImageSplitterCenter.Picture.Icon);
  end;

  with DM.ImageListVerticalDots do
  begin
    GetIcon(0, ImageSplitterBottomCenter.Picture.Icon);
  end;

  // Делим экран на 2 равные части для таблиц объектов и смет
  PanelObjects.Height := (FormMain.ClientHeight - FormMain.PanelOpenWindows.Height -
    SplitterCenter.Height) div 2;

  // Выводим данные в таблицу объектов
  FillingTableObjects;
  IdEstimate := 0;

  // Создаём кнопку от этого окна (на главной форме внизу)
  FormMain.CreateButtonOpenWindow(CaptionButton, HintButton, Self, 1);
end;

procedure TfObjectsAndEstimates.FormShow(Sender: TObject);
begin
  FormMain.TimerCover.Enabled := True;
  // Запускаем таймер который скроет панель после отображения формы
  flLoaded := True;
  // Переходим на последний активный объект
  qrObjects.Locate('IdObject', dbgrdObjects.Tag, []);
end;

function TfObjectsAndEstimates.getCurObject: Integer;
begin
  Result := IdObject;
end;

procedure TfObjectsAndEstimates.FormResize(Sender: TObject);
begin
  PanelObjects.Height := (ClientHeight - SplitterCenter.Height) div 2;
end;

procedure TfObjectsAndEstimates.FormActivate(Sender: TObject);
begin
  // Если нажата клавиша Ctrl и выбираем форму, то делаем
  // каскадирование с переносом этой формы на передний план
  FormMain.CascadeForActiveWindow;

  // Делаем нажатой кнопку активной формы (на главной форме внизу)
  FormMain.SelectButtonActiveWindow(CaptionButton);
end;

procedure TfObjectsAndEstimates.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfObjectsAndEstimates.FormDestroy(Sender: TObject);
begin
  fObjectsAndEstimates := nil;
  // Удаляем кнопку от этого окна (на главной форме внизу)
  FormMain.DeleteButtonCloseWindow(CaptionButton);
end;

procedure TfObjectsAndEstimates.PopupMenuObjectsAddClick(Sender: TObject);
var
  res: TModalResult;
begin
  fCardObject.SetIdSelectRow(0);
  res := fCardObject.ShowModal;

  // Выводим данные в таблицу объектов
  FillingTableObjects;

  // Устанавливаем фокус
  dbgrdObjects.SetFocus;
  qrObjects.Locate('IdObject', fCardObject.OUT_ID_OBJECT, []);
  // Если установлена настройка, то добавляем автоматом связку смет
  if (res = mrOk) and PS.AutoCreateEstimates and (fCardObject.OUT_ID_OBJECT <> 0) then
  begin
    fCardEstimate.EditingRecord(False);
    fCardEstimate.ShowForm(fCardObject.OUT_ID_OBJECT, 0, 2, False);
    CloseOpen(qrTreeData);
  end;
end;

procedure TfObjectsAndEstimates.PopupMenuObjectsEditClick(Sender: TObject);
var
  e: TNotifyEvent;
begin
  if qrObjects.RecordCount <= 0 then
  begin
    MessageBox(0, PChar('Нет объектов для редактирования!'), CaptionForm,
      MB_ICONINFORMATION + mb_OK + mb_TaskModal);
    Exit;
  end;

  with fCardObject, qrObjects do
  begin
    // Заносим значения в поля редактирования
    EditNumberObject.Text := FieldByName('NumberObject').AsVariant;
    EditCodeObject.Text := FieldByName('CodeObject').AsVariant;
    EditNumberContract.Text := FieldByName('NumberContract').AsString;
    DateTimePickerDataCreateContract.Date := FieldByName('DateContract').AsVariant;
    EditShortDescription.Text := FieldByName('Name').AsVariant;
    MemoFullDescription.Text := FieldByName('FullName').AsVariant;
    e := cbbFromMonth.OnChange;
    cbbFromMonth.OnChange := nil;
    seYear.OnChange := nil;
    cbbFromMonth.ItemIndex := MonthOf(FieldByName('BeginConstruction').AsDateTime) - 1;
    seYear.Value := YearOf(FieldByName('BeginConstruction').AsDateTime);
    cbbFromMonth.OnChange := e;
    seYear.OnChange := e;
    CheckBoxCalculationEconom.Checked := FieldByName('CalculationEconom').AsVariant;

    if FieldByName('TermConstruction').AsVariant <> Null then
      EditCountMonth.Text := FieldByName('TermConstruction').AsVariant;

    // Для выпадающих списков
    if FieldByName('IdIstFin').AsVariant <> Null then
      SetSourceFinance(FieldByName('IdIstFin').AsVariant);

    SetCategory(FieldByName('IdCategory').AsVariant);
    SetRegion(FieldByName('IdRegion').AsVariant);
    SetVAT(FieldByName('VAT').AsVariant);
    SetBasePrice(FieldByName('IdBasePrice').AsVariant);
    SetTypeOXR(FieldByName('IdOXROPR').AsVariant);
    SetMAIS(FieldByName('IdMAIS').AsVariant);

    // ID выделенной записи
    SetIdSelectRow(Fields[0].AsVariant);

    // Даём знать форме, что будет операция редактирования и чтобы не очищались поля
    EditingRecord(True);

    ShowModal;
  end;

  FillingTableObjects;

  // Устанавливаем фокус
  dbgrdObjects.SetFocus;
end;

procedure TfObjectsAndEstimates.pmObjectsPopup(Sender: TObject);
begin
  mRepair.Visible := qrObjects.FieldByName('DEL_FLAG').AsInteger = 1;
  mDelete.Visible := qrObjects.FieldByName('DEL_FLAG').AsInteger = 0;
  mDeleteObject.Visible := qrObjects.FieldByName('DEL_FLAG').AsInteger = 1;
  mObjectAccess.Visible := not qrObjects.IsEmpty and
    ((G_USER_ID = 1) OR (qrObjects.FieldByName('USER_ID').AsInteger = G_USER_ID) OR
    VarIsNull(qrObjects.FieldByName('USER_ID').Value));
end;

procedure TfObjectsAndEstimates.mActAccessClick(Sender: TObject);
begin
  if (not Assigned(fUserAccess)) then
    fUserAccess := TfUserAccess.Create(Self, VarArrayOf([1, qrActsEx.FieldByName('SM_ID').Value]));
  fUserAccess.ShowModal;
end;

procedure TfObjectsAndEstimates.mADD6KCClick(Sender: TObject);
begin
  DM.qrDifferent.SQL.Text := 'UPDATE smetasourcedata SET FL_USE=1 WHERE SM_ID=:ID';
  DM.qrDifferent.ParamByName('ID').AsInteger := qrActsEx.FieldByName('MASTER_ID').AsInteger;
  DM.qrDifferent.ExecSQL;
  CloseOpen(qrActsEx, False);
end;

procedure TfObjectsAndEstimates.mCopyClick(Sender: TObject);
begin
  if Application.MessageBox('Копировать выбранный акт?', 'Смета', MB_YESNO + MB_ICONQUESTION + MB_TOPMOST) <> IDYES
  then
    Exit;

  DM.qrDifferent.SQL.Text := 'CALL CopyAct(:ID);';
  DM.qrDifferent.ParamByName('ID').AsInteger := qrActsEx.FieldByName('ID').AsInteger;
  DM.qrDifferent.ExecSQL;
  CloseOpen(qrActsEx, False);
end;

procedure TfObjectsAndEstimates.mCopyObjectClick(Sender: TObject);
var
  tmpFileName: string;
  old_name: string;
begin
  FormMain.PanelCover.Visible := True;
  FormWaiting.Height := 110;
  FormWaiting.Show;
  old_name := qrObjects.FieldByName('Name').AsString;
  Application.ProcessMessages;
  try
    tmpFileName := GetEnvironmentVariable('temp') + '\' + 'tmpobj.xml';
    if TFile.Exists(tmpFileName) then
      TFile.Delete(tmpFileName);
    FormWaiting.lbProcess.caption := 'Копирование объекта: ' + qrObjects.FieldByName('Name').AsString;

    qrObjects.Edit;
    qrObjects.FieldByName('Name').AsString := old_name + '*';
    qrObjects.Post;

    Application.ProcessMessages;
    ExportObject(qrObjects.Fields[0].AsInteger, tmpFileName);
    Application.ProcessMessages;
    ImportObject(tmpFileName);
    Application.ProcessMessages;
  finally
    qrObjects.Edit;
    qrObjects.FieldByName('Name').AsString := old_name;
    qrObjects.Post;

    if TFile.Exists(tmpFileName) then
      TFile.Delete(tmpFileName);
    FormWaiting.Close;
    FormWaiting.Height := 88;
    FormWaiting.lbProcess.caption := '';
    FormMain.PanelCover.Visible := False;
  end;
  FillingTableObjects;
end;

procedure TfObjectsAndEstimates.mDeleteActClick(Sender: TObject);
begin
  if MessageDlg('Вы действительно хотите удалить выбранный акт?'#13 +
    '(дальнейшее восстановнелие будет невозможным)', mtWarning, mbYesNo, 0) <> mrYes then
    Exit;
  try
    with DM.qrDifferent do
    begin
      Active := False;
      SQL.Clear;
      SQL.Add('CALL DeleteEstimate(:IdEstimate);');
      ParamByName('IdEstimate').Value := qrActsEx.FieldByName('MASTER_ID').Value;
      ExecSQL;
      Active := False;
      CloseOpen(qrTreeData);
    end;
    CloseOpen(qrActsEx);
  except
    on e: Exception do
      MessageBox(0, PChar('При удалении акта возникла ошибка:' + sLineBreak + sLineBreak + e.message),
        PWideChar(caption), MB_ICONERROR + mb_OK + mb_TaskModal);
  end;
end;

procedure TfObjectsAndEstimates.mDeleteClick(Sender: TObject);
var
  NumberObject: string;
  ResultDialog: Integer;
begin
  if qrObjects.RecordCount <= 0 then
  begin
    MessageBox(0, PChar('Нет объектов для удаления!'), CaptionForm, MB_ICONINFORMATION + mb_OK +
      mb_TaskModal);
    Exit;
  end;

  NumberObject := IntToStr(qrObjects.FieldByName('NumberObject').AsVariant);

  ResultDialog := MessageBox(0, PChar('Вы действительно хотите удалить объект с номером: ' + NumberObject +
    sLineBreak + 'Внимание! Все сметы связанные с объектом будут удалены!' + sLineBreak + sLineBreak +
    'Подтверждаете удаление?'), CaptionForm, MB_ICONINFORMATION + MB_YESNO + mb_TaskModal);

  if ResultDialog = mrNo then
    Exit;

  qrObjects.Edit;
  qrObjects.FieldByName('DEL_FLAG').AsInteger := 1;
  qrObjects.Post;
  qrObjects.Prior;
  CloseOpen(qrObjects);
end;

procedure TfObjectsAndEstimates.mDeleteEstimateClick(Sender: TObject);
begin
  if MessageDlg('Удалить запись?', mtWarning, mbYesNo, 0) <> mrYes then
    Exit;
  DM.qrDifferent.SQL.Text := 'UPDATE smetasourcedata SET DELETED=1 WHERE SM_ID=:SM_ID';
  DM.qrDifferent.ParamByName('SM_ID').AsInteger := qrTreeData.FieldByName('SM_ID').AsInteger;
  DM.qrDifferent.ExecSQL;
  CloseOpen(qrTreeData, False);
end;

procedure TfObjectsAndEstimates.mShowDeletedEstimatesClick(Sender: TObject);
begin
  if mShowDeletedEstimates.Checked then
    qrTreeData.ParamByName('SHOW_DELETED').AsInteger := 1
  else
    qrTreeData.ParamByName('SHOW_DELETED').AsInteger := 0;
  CloseOpen(qrTreeData);
end;

procedure TfObjectsAndEstimates.PMCopySmetaClick(Sender: TObject);
begin
  FormMain.PanelCover.Visible := True;
  FormWaiting.Show;
  Application.ProcessMessages;
  try
    if GetCopySmeta(qrTreeData.FieldByName('SM_ID').AsInteger) then
      CloseOpen(qrTreeData, False);
  finally
    FormWaiting.Close;
    FormMain.PanelCover.Visible := False;
  end;
end;

procedure TfObjectsAndEstimates.mN6Click(Sender: TObject);
begin
  dbgrdObjects.ShowColumnsDialog;
end;

procedure TfObjectsAndEstimates.mObjectAccessClick(Sender: TObject);
begin
  if (not Assigned(fUserAccess)) then
    fUserAccess := TfUserAccess.Create(Self, VarArrayOf([2, qrObjects.FieldByName('IdObject').Value]));
  fUserAccess.ShowModal;
end;

procedure TfObjectsAndEstimates.mDeleteObjectClick(Sender: TObject);
var
  NumberObject: string;
  ResultDialog: Integer;
begin
  if qrObjects.RecordCount <= 0 then
  begin
    MessageBox(0, PChar('Нет объектов для удаления!'), CaptionForm, MB_ICONINFORMATION + mb_OK +
      mb_TaskModal);
    Exit;
  end;

  NumberObject := IntToStr(qrObjects.FieldByName('NumberObject').AsVariant);

  ResultDialog := MessageBox(0, PChar('Вы действительно хотите удалить объект с номером: ' + NumberObject +
    sLineBreak + 'Внимание! Все сметы связанные с объектом будут удалены!' + sLineBreak + sLineBreak +
    'Подтверждаете удаление?'), CaptionForm, MB_ICONINFORMATION + MB_YESNO + mb_TaskModal);

  if ResultDialog = mrNo then
    Exit;

  // Устанавливаем фокус
  dbgrdObjects.SetFocus;

  try
    FastExecSQL('DELETE FROM objcards WHERE obj_id = :0;', VarArrayOf([IdObject]));

  except
    on e: Exception do
      MessageBox(0, PChar('При удалении объекта возникла ошибка.' + sLineBreak +
        'Подробнее об ошибке смотрите ниже:' + sLineBreak + sLineBreak + e.message), CaptionForm,
        MB_ICONERROR + mb_OK + mb_TaskModal);
  end;

  FillingTableObjects;
end;

procedure TfObjectsAndEstimates.mEstimateAccessClick(Sender: TObject);
begin
  if (not Assigned(fUserAccess)) then
    fUserAccess := TfUserAccess.Create(Self, VarArrayOf([1, qrTreeData.FieldByName('SM_ID').Value]));
  fUserAccess.ShowModal;
end;

procedure TfObjectsAndEstimates.mReapirEstimateClick(Sender: TObject);
begin
  DM.qrDifferent.SQL.Text := 'UPDATE smetasourcedata SET DELETED=0 WHERE SM_ID=:SM_ID';
  DM.qrDifferent.ParamByName('SM_ID').AsInteger := qrTreeData.FieldByName('SM_ID').AsInteger;
  DM.qrDifferent.ExecSQL;
  CloseOpen(qrTreeData);
  tvEstimates.Selected.Text := qrTreeData.FieldByName('NAME').AsString;
end;

procedure TfObjectsAndEstimates.mShowDeletedActsClick(Sender: TObject);
begin
  if mShowDeletedActs.Checked then
    qrActsEx.ParamByName('SHOW_DELETED').AsInteger := 1
  else
    qrActsEx.ParamByName('SHOW_DELETED').AsInteger := 0;
  CloseOpen(qrActsEx);
end;

procedure TfObjectsAndEstimates.mShowDeletedClick(Sender: TObject);
begin
  if mShowDeleted.Checked then
    qrObjects.ParamByName('SHOW_DELETED').AsInteger := 1
  else
    qrObjects.ParamByName('SHOW_DELETED').AsInteger := 0;
  qrObjects.AfterScroll := nil;
  CloseOpen(qrObjects);
  qrObjects.AfterScroll := qrObjectsAfterScroll;
end;

procedure TfObjectsAndEstimates.qrActsExAfterOpen(DataSet: TDataSet);
begin
  if PS.AutoExpandTreeEstimates then
    tvActs.FullExpand;
end;

procedure TfObjectsAndEstimates.qrObjectsAfterOpen(DataSet: TDataSet);
begin
  CloseOpen(qrTreeData);
  CloseOpen(qrActsEx);
end;

procedure TfObjectsAndEstimates.qrObjectsAfterScroll(DataSet: TDataSet);
begin
  IdObject := DataSet.FieldByName('IdObject').AsVariant;
  if flLoaded then
    dbgrdObjects.Tag := IdObject;
  CloseOpen(qrTreeData, False);
  CloseOpen(qrActsEx, False);
end;

procedure TfObjectsAndEstimates.qrObjectsBeforeOpen(DataSet: TDataSet);
begin
  if (DataSet as TFDQuery).FindParam('USER_ID') <> nil then
    (DataSet as TFDQuery).ParamByName('USER_ID').Value := G_USER_ID;
end;

procedure TfObjectsAndEstimates.qrTreeDataAfterOpen(DataSet: TDataSet);
begin
  if not CheckQrActiveEmpty(qrTreeData) then
    Exit;
  IdEstimate := Integer(qrTreeData.FieldByName('SM_ID').AsInteger);
  if PS.AutoExpandTreeEstimates then
    tvEstimates.FullExpand
end;

procedure TfObjectsAndEstimates.PanelBottomResize(Sender: TObject);
begin
  PanelEstimates.Width := ((Sender as TPanel).Width - SplitterBottomCenter.Width) div 2;
end;

procedure TfObjectsAndEstimates.btnSearchClick(Sender: TObject);
var
  FN: string;
begin
  case cbbSearch.ItemIndex of
    // По наименованию
    0:
      FN := 'FullName';
    // По заказчику
    1:
      FN := 'NameClient';
    // По генподрядчику
    2:
      FN := 'NameContractor';
  end;
  qrObjects.Filter := 'UPPER(' + FN + ') LIKE UPPER(''%' + Trim(edtSearch.Text) + '%'')';
  if (btnSearch.Tag = 0) and qrObjects.FindFirst then
    btnSearch.Tag := 1
  else if not qrObjects.FindNext then
    btnSearch.Tag := 0;
end;

procedure TfObjectsAndEstimates.dbgrdObjectsDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
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
  if (Sender AS TJvDBGrid).DataSource.DataSet.FieldByName('DEL_FLAG').AsInteger = 1 then
    (Sender AS TJvDBGrid).Canvas.Font.Style := dbgrdObjects.Canvas.Font.Style + [fsStrikeOut];
  (Sender AS TJvDBGrid).DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfObjectsAndEstimates.dbgrdObjectsTitleBtnClick(Sender: TObject; ACol: Integer; Field: TField);
var
  s: string;
begin
  if not CheckQrActiveEmpty(qrObjects) then
    Exit;
  s := '';
  if dbgrdObjects.SortMarker = smDown then
    s := ' DESC';
  qrObjects.SQL[qrObjects.SQL.Count - 1] := 'ORDER BY ' + dbgrdObjects.SortedField + s;
  CloseOpen(qrObjects);
end;

procedure TfObjectsAndEstimates.edtSearchChange(Sender: TObject);
begin
  btnSearch.Tag := 0;
end;

procedure TfObjectsAndEstimates.edtSearchKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
    btnSearch.Click;
end;

procedure TfObjectsAndEstimates.pmActPropertyClick(Sender: TObject);
var
  f: TfCardAct;
begin
  f := TfCardAct.Create(nil);
  f.FormKind := kdEdit;
  f.id := qrActsEx.FieldByName('MASTER_ID').AsInteger;
  f.ShowModal;
  CloseOpen(qrActsEx, False);
end;

procedure TfObjectsAndEstimates.PMActsOpenClick(Sender: TObject);
begin
  // Если тип акта "итоговыми суммами", то игнорируем
  if qrActsEx.FieldByName('TYPE_ACT').AsInteger = 2 then
    Exit;

  ActReadOnly := True;
  // Открываем форму ожидания
  // FormWaiting.Show;
  Application.ProcessMessages;
  if (Assigned(FormCalculationEstimate)) then
  begin
    FormCalculationEstimate.flChangeEstimate := True;
    FormCalculationEstimate.Close;
  end;

  if (not Assigned(FormCalculationEstimate)) then
    FormCalculationEstimate := TFormCalculationEstimate.Create(qrActsEx.FieldByName('MASTER_ID').AsInteger);

  FormCalculationEstimate.lblForemanFIO.caption :=
    VarToStr(FastSelectSQLOne
    ('select CONCAT(IFNULL(foreman_first_name, ""), " ", IFNULL(foreman_name, ""), " ", IFNULL(foreman_second_name, ""))'#13
    + 'from smetasourcedata LEFT JOIN foreman ON smetasourcedata.foreman_id=foreman.foreman_id where SM_ID=:0',
    VarArrayOf([qrActsEx.FieldByName('MASTER_ID').Value])));
  with qrObjects do
  begin
    FormCalculationEstimate.EditNameObject.Text := IntToStr(FieldByName('NumberObject').AsVariant) + ' ' +
      FieldByName('FullName').AsVariant;
    FormCalculationEstimate.EditNumberContract.Text := FieldByName('NumberContract').AsString;
    FormCalculationEstimate.EditDateContract.Text := FieldByName('DateContract').AsString;
    FormCalculationEstimate.Region := FieldByName('IdRegion').AsVariant;

    FormCalculationEstimate.EditNameEstimate.Text := qrActsEx.FieldByName('NAME').AsString;

    FormCalculationEstimate.IdObject := IdObject;
    FormCalculationEstimate.IdEstimate := qrActsEx.FieldByName('MASTER_ID').AsInteger;
    FormCalculationEstimate.SetActReadOnly(ActReadOnly);
    // Создание временных таблиц
    FormCalculationEstimate.CreateTempTables;
    // Заполненя временных таблиц, заполнение формы
    FormCalculationEstimate.OpenAllData;
  end;
  FormCalculationEstimate.flChangeEstimate := False;
  FormCalculationEstimate.WindowState := wsMaximized;

  if not ActReadOnly then
  begin
    fKC6.caption := 'Выборка данных';
    if MessageBox(0, PChar('Произвести выборку данных из сметы?'), 'Расчёт акта',
      MB_ICONINFORMATION + MB_YESNO + mb_TaskModal) = mrYes then
      fKC6.MyShow(IdObject);
  end;
  // FormCalculationEstimate.Show;

  // Закрываем форму ожидания
  // FormWaiting.Close;
  ActReadOnly := False;
  Close;
end;

procedure TfObjectsAndEstimates.PMActsAddClick(Sender: TObject);
var
  FormCardAct: TfCardAct;
begin
  FormCardAct := TfCardAct.Create(Self);
  FormCardAct.FormKind := kdInsert;
  FormCardAct.cbbType.ItemIndex := (Sender as TMenuItem).Tag;
  FormCardAct.ShowModal;
  // OpenAct(0);
end;

procedure TfObjectsAndEstimates.PMActsDeleteClick(Sender: TObject);
begin
  if MessageDlg('Удалить запись?', mtWarning, mbYesNo, 0) <> mrYes then
    Exit;
  DM.qrDifferent.SQL.Text := 'UPDATE smetasourcedata SET DELETED=1 WHERE SM_ID=:ID';
  DM.qrDifferent.ParamByName('ID').AsInteger := qrActsEx.FieldByName('MASTER_ID').AsInteger;
  DM.qrDifferent.ExecSQL;
  CloseOpen(qrActsEx, False);
end;

procedure TfObjectsAndEstimates.PMActsEditClick(Sender: TObject);
begin
  // Если тип акта "итоговыми суммами", то игнорируем
  if (qrActsEx.FieldByName('TYPE_ACT').AsInteger = 2) OR VarIsNull(qrActsEx.FieldByName('MASTER_ID').Value) or
    (qrActsEx.FieldByName('PARENT_ID').Value = 0) then
    Exit;

  if (Assigned(FormCalculationEstimate)) then
  begin
    FormCalculationEstimate.flChangeEstimate := True;
    FormCalculationEstimate.Close;
  end;

  if (not Assigned(FormCalculationEstimate)) then
    FormCalculationEstimate := TFormCalculationEstimate.Create(qrActsEx.FieldByName('MASTER_ID').AsInteger);

  FormCalculationEstimate.lblForemanFIO.caption :=
    VarToStr(FastSelectSQLOne
    ('select CONCAT(IFNULL(foreman_first_name, ""), " ", IFNULL(foreman_name, ""), " ", IFNULL(foreman_second_name, ""))'#13
    + 'from smetasourcedata LEFT JOIN foreman ON smetasourcedata.foreman_id=foreman.foreman_id where SM_ID=:0',
    VarArrayOf([qrActsEx.FieldByName('MASTER_ID').Value])));
  with qrObjects do
  begin
    FormCalculationEstimate.EditNameObject.Text := IntToStr(FieldByName('NumberObject').AsVariant) + ' ' +
      FieldByName('FullName').AsVariant;
    FormCalculationEstimate.EditNumberContract.Text := FieldByName('NumberContract').AsString;
    FormCalculationEstimate.EditDateContract.Text := FieldByName('DateContract').AsString;
    FormCalculationEstimate.Region := FieldByName('IdRegion').AsVariant;

    FormCalculationEstimate.EditNameEstimate.Text := qrActsEx.FieldByName('NAME').AsString;

    FormCalculationEstimate.IdObject := IdObject;
    FormCalculationEstimate.IdEstimate := qrActsEx.FieldByName('MASTER_ID').AsInteger;
    FormCalculationEstimate.SetActReadOnly(ActReadOnly);
    // Создание временных таблиц
    FormCalculationEstimate.CreateTempTables;
    // Заполненя временных таблиц, заполнение формы
    FormCalculationEstimate.OpenAllData;
  end;
  FormCalculationEstimate.flChangeEstimate := False;
  FormCalculationEstimate.WindowState := wsMaximized;

  if not ActReadOnly and (qrActsEx.FieldByName('TYPE_ACT').AsInteger = 0) then
  begin
    fKC6.caption := 'Выборка данных';
    if MessageBox(0, PChar('Произвести выборку данных из сметы?'), 'Расчёт акта',
      MB_ICONINFORMATION + MB_YESNO + mb_TaskModal) = mrYes then
      fKC6.MyShow(IdObject);
  end;
  Close;
end;

procedure TfObjectsAndEstimates.pmActsPopup(Sender: TObject);
begin
  // Если не выделена смета или выделена, но не объектная
  PMActsOpen.Visible := not(VarIsNull(qrActsEx.FieldByName('MASTER_ID').Value)) and
    (qrActsEx.FieldByName('PARENT_ID').Value <> 0);
  PMActsAdd.Visible := not(qrObjects.IsEmpty);
  PMActsEdit.Visible := PMActsOpen.Visible;
  PMActsDelete.Visible := PMActsOpen.Visible and (qrActsEx.FieldByName('DELETED').AsInteger = 0);
  pmActProperty.Visible := PMActsOpen.Visible;
  mRepAct.Visible := PMActsOpen.Visible and (qrActsEx.FieldByName('DELETED').AsInteger = 1);
  mADD6KC.Visible := PMActsOpen.Visible and (qrActsEx.FieldByName('DELETED').AsInteger = 0) and
    (qrActsEx.FieldByName('FL_USE').AsInteger = 0);
  mREM6KC.Visible := PMActsOpen.Visible and (qrActsEx.FieldByName('DELETED').AsInteger = 0) and
    (qrActsEx.FieldByName('FL_USE').AsInteger = 1);
  mCopy.Visible := PMActsOpen.Visible;
  mDeleteAct.Visible := PMActsOpen.Visible and (qrActsEx.FieldByName('DELETED').AsInteger = 1);
  mActAccess.Visible := PMActsOpen.Visible and
    ((G_USER_ID = 1) OR (qrActsEx.FieldByName('USER_ID').AsInteger = G_USER_ID) OR
    VarIsNull(qrActsEx.FieldByName('USER_ID').Value));
end;

function TfObjectsAndEstimates.GetNumberEstimate(): string;
begin
  try
    with DM.qrDifferent do
    begin
      Active := False;
      SQL.Clear;
      SQL.Add('SELECT sm_number FROM smetasourcedata WHERE sm_id = :sm_id;');
      ParamByName('sm_id').Value := IdEstimate;
      Active := True;

      Result := FieldByName('sm_number').AsString;
    end;
  except
    on e: Exception do
      MessageBox(0, PChar('При получении номера сметы возникла ошибка:' + sLineBreak + sLineBreak +
        e.message), PWideChar(caption), MB_ICONERROR + mb_OK + mb_TaskModal);
  end;
end;

procedure TfObjectsAndEstimates.tvActsCustomDrawItem(Sender: TCustomTreeView; Node: TTreeNode;
  State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  DefaultDraw := True;
  if Node.Text[1] = 'Б' then
    Sender.Canvas.Font.Color := clRed;

  if Node.Text[Length(Node.Text)] = '-' then
    Sender.Canvas.Font.Style := Sender.Canvas.Font.Style + [fsStrikeOut];
end;

procedure TfObjectsAndEstimates.mREM6KCClick(Sender: TObject);
begin
  DM.qrDifferent.SQL.Text := 'UPDATE smetasourcedata SET FL_USE=0 WHERE SM_ID=:ID';
  DM.qrDifferent.ParamByName('ID').AsInteger := qrActsEx.FieldByName('MASTER_ID').AsInteger;
  DM.qrDifferent.ExecSQL;
  CloseOpen(qrActsEx, False);
end;

procedure TfObjectsAndEstimates.mRepActClick(Sender: TObject);
begin
  DM.qrDifferent.SQL.Text := 'UPDATE smetasourcedata SET DELETED=0 WHERE SM_ID=:ID';
  DM.qrDifferent.ParamByName('ID').AsInteger := qrActsEx.FieldByName('MASTER_ID').AsInteger;
  DM.qrDifferent.ExecSQL;
  CloseOpen(qrActsEx, False);
end;

procedure TfObjectsAndEstimates.mRepairClick(Sender: TObject);
begin
  qrObjects.Edit;
  qrObjects.FieldByName('DEL_FLAG').AsInteger := 0;
  qrObjects.Post;
  CloseOpen(qrObjects);
end;

procedure TfObjectsAndEstimates.PMExportObjectClick(Sender: TObject);
var
  TmpStr, XMLName: string;
begin
  if SaveDialog.Execute(FormMain.Handle) then
  begin
    XMLName := ChangeFileExt(SaveDialog.FileName, '.xml');
    if TFile.Exists(XMLName) then
      if Application.MessageBox(PChar('Файл ' + XMLName + ' уже существует. Перезаписать его?'),
        'Экспорт объекта', MB_ICONQUESTION + MB_OKCANCEL + mb_TaskModal) = mrCancel then
        Exit;

    FormMain.PanelCover.Visible := True;
    FormWaiting.Height := 110;
    FormWaiting.Show;
    Application.ProcessMessages;
    try
      TmpStr := 'Экспорт объекта: ' + qrObjects.FieldByName('Name').AsString;
      FormWaiting.lbProcess.caption := TmpStr;
      Application.ProcessMessages;
      ExportObject(qrObjects.Fields[0].AsInteger, XMLName);
      ShowMessage('Экспорт завершен.');
    finally
      FormWaiting.Close;
      FormWaiting.Height := 88;
      FormWaiting.lbProcess.caption := '';
      FormMain.PanelCover.Visible := False;
    end;
  end;
end;

procedure TfObjectsAndEstimates.PMImportObjectClick(Sender: TObject);
var
  TmpStr: string;
begin
  if OpenDialog.Execute(FormMain.Handle) then
  begin
    FormMain.PanelCover.Visible := True;
    FormWaiting.Height := 110;
    FormWaiting.Show;
    Application.ProcessMessages;
    try
      TmpStr := 'Импорт из файла: ' + ExtractFileName(OpenDialog.FileName);
      FormWaiting.lbProcess.caption := TmpStr;
      ImportObject(OpenDialog.FileName);
      ShowMessage('Импорт завершен успешно.');
    finally
      FormWaiting.Close;
      FormWaiting.Height := 88;
      FormWaiting.lbProcess.caption := '';
      FormMain.PanelCover.Visible := False;
    end;
    FillingTableObjects;
  end;
end;

procedure TfObjectsAndEstimates.PMImportDirClick(Sender: TObject);
var
  TmpFiles: TStringDynArray;
  I: Integer;
  TmpStr: string;
begin
  with TBrowseForFolder.Create(nil) do
    try
      if Execute then
      begin
        TmpFiles := TDirectory.GetFiles(Folder, '*.xml', TSearchOption.soTopDirectoryOnly);
        if Length(TmpFiles) = 0 then
          Exit;
        try
          FormMain.PanelCover.Visible := True;
          FormWaiting.Height := 110;
          FormWaiting.Show;
          Application.ProcessMessages;
          try
            for I := Low(TmpFiles) to High(TmpFiles) do
            begin
              TmpStr := 'Импорт из файла: ' + ExtractFileName(TmpFiles[I]);
              FormWaiting.lbProcess.caption := TmpStr;
              ImportObject(TmpFiles[I]);
            end;
            ShowMessage('Импорт завершен успешно.');
          finally
            FormWaiting.Close;
            FormWaiting.Height := 88;
            FormWaiting.lbProcess.caption := '';
            FormMain.PanelCover.Visible := False;
          end;
          FillingTableObjects;
        finally
          SetLength(TmpFiles, 0);
        end;
      end;
    finally
      Free;
    end;
end;

procedure TfObjectsAndEstimates.PMEstimateExpandClick(Sender: TObject);
begin
  tvEstimates.FullExpand;
end;

procedure TfObjectsAndEstimates.PMEstimateExpandSelectedClick(Sender: TObject);
begin
  tvEstimates.Selected.Expand(True);
end;

procedure TfObjectsAndEstimates.PMEstimateCollapseClick(Sender: TObject);
begin
  tvEstimates.FullCollapse;
end;

procedure TfObjectsAndEstimates.FillingTableObjects;
begin
  try
    CloseOpen(qrObjects);
  except
    on e: Exception do
      MessageBox(0, PChar('Запрос на получение данных об объектах не был выполнен.' + sLineBreak +
        'Подробнее об ошибке смотрите ниже:' + sLineBreak + sLineBreak + e.message), PWideChar(caption),
        MB_ICONERROR + mb_OK + mb_TaskModal);
  end;
end;

procedure TfObjectsAndEstimates.PopupMenuEstimatesAddClick(Sender: TObject);
begin
  // (Sender as TMenuItem).Tag - Устанавливаем тип сметы (1-локальная, 2-объектная, 3-ПТМ)
  fCardEstimate.EditingRecord(False);
  fCardEstimate.ShowForm(IdObject, IdEstimate, (Sender as TMenuItem).Tag);
  CloseOpen(qrTreeData);
end;

procedure TfObjectsAndEstimates.PMEstimatesBasicDataClick(Sender: TObject);
begin
  if (IdEstimate > 0) and (IdObject > 0) then
    FormBasicData.ShowForm(IdObject, IdEstimate);
end;

procedure TfObjectsAndEstimates.PMEstimatesDeleteClick(Sender: TObject);
var
  NumberEstimate, { StrIdEstimate, StrIdRates, } TextWarning: String;
begin
  NumberEstimate := GetNumberEstimate;

  case qrTreeData.FieldByName('SM_TYPE').AsInteger of
    1:
      TextWarning := 'Вы пытаетесь удалить ЛОКАЛЬНУЮ смету с номером: ' + NumberEstimate + sLineBreak +
        'Вместе с ней будут удалены все разделы ПТМ которые с ней связаны!' + sLineBreak + sLineBreak +
        'Подтверждаете удаление?';
    2:
      TextWarning := 'Вы пытаетесь удалить ОБЪЕКТНУЮ смету с номером: ' + NumberEstimate + sLineBreak +
        'Вместе с ней будут удалены все локальные и разделы ПТМ которые с ней связаны!' + sLineBreak +
        sLineBreak + 'Подтверждаете удаление?';
    3:
      TextWarning := 'Вы действительно хотите удалить раздел ПТМ с номером: ' + NumberEstimate;
  end;

  if MessageBox(0, PChar(TextWarning), PWideChar(caption), MB_ICONINFORMATION + MB_YESNO + mb_TaskModal) = mrNo
  then
    Exit;

  try
    with DM.qrDifferent do
    begin
      Active := False;
      SQL.Clear;
      SQL.Add('CALL DeleteEstimate(:IdEstimate);');
      ParamByName('IdEstimate').Value := IdEstimate;
      ExecSQL;
      Active := False;
      CloseOpen(qrTreeData);
    end;
  except
    on e: Exception do
      MessageBox(0, PChar('При удалении сметы возникла ошибка:' + sLineBreak + e.message), PWideChar(caption),
        MB_ICONERROR + mb_OK + mb_TaskModal);
  end;
end;

procedure TfObjectsAndEstimates.PMEstimatesEditClick(Sender: TObject);
begin
  with fCardEstimate do
  begin
    EditingRecord(True);

    fCardEstimate.ShowForm(IdObject, IdEstimate, qrTreeData.FieldByName('SM_TYPE').AsInteger);
    CloseOpen(qrTreeData);
    tvEstimates.Selected.Text := qrTreeData.FieldByName('NAME').AsString;
  end;
end;

procedure TfObjectsAndEstimates.pmEstimatesPopup(Sender: TObject);
begin
  PMEstimatesEdit.Enabled := False;
  PMEstimatesDelete.Enabled := False;
  PMEstimatesBasicData.Enabled := False;
  PMEstimateExpand.Enabled := False;
  PMEstimateCollapse.Enabled := False;

  PMEstimatesAddObject.Enabled := False;
  PMEstimatesAddLocal.Enabled := False;
  PMEstimatesAddPTM.Enabled := False;

  mEstimateAccess.Visible := not qrTreeData.IsEmpty and
    ((G_USER_ID = 1) OR (qrTreeData.FieldByName('USER_ID').AsInteger = G_USER_ID) OR
    VarIsNull(qrTreeData.FieldByName('USER_ID').Value));

  if qrTreeData.IsEmpty then
  begin
    PMEstimatesAddObject.Enabled := True;
    Exit;
  end;

  PMEstimatesEdit.Enabled := True;
  PMEstimatesDelete.Enabled := True;
  PMEstimatesBasicData.Enabled := True;
  PMEstimateExpand.Enabled := True;
  PMEstimateCollapse.Enabled := True;

  if qrTreeData.FieldByName('SM_TYPE').AsInteger = 3 then
    PMEstimatesEdit.caption := 'Карточка ПТМ'
  else
    PMEstimatesEdit.caption := 'Карточка сметы';

  if qrTreeData.FieldByName('SM_TYPE').AsInteger = 2 then
  begin
    PMEstimatesAddObject.Enabled := True;
    PMEstimatesAddLocal.Enabled := True;
  end
  else if qrTreeData.FieldByName('SM_TYPE').AsInteger = 1 then
    PMEstimatesAddPTM.Enabled := True;
  mDeleteEstimate.Visible := qrTreeData.FieldByName('DELETED').AsInteger = 0;
  mReapirEstimate.Visible := qrTreeData.FieldByName('DELETED').AsInteger = 1;
  PMEstimatesDelete.Visible := qrTreeData.FieldByName('DELETED').AsInteger = 1;
end;

procedure TfObjectsAndEstimates.tvEstimatesCustomDrawItem(Sender: TCustomTreeView; Node: TTreeNode;
  State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  if (Length(Node.Text) > 0) and (Node.Text[Length(Node.Text)] = '-') then
    Sender.Canvas.Font.Style := Sender.Canvas.Font.Style + [fsStrikeOut];
end;

procedure TfObjectsAndEstimates.tvEstimatesDblClick(Sender: TObject);
begin
  // Открываем форму ожидания
  // FormWaiting.Show;
  Application.ProcessMessages;
  if (Assigned(FormCalculationEstimate)) then
  begin
    FormCalculationEstimate.flChangeEstimate := True;
    FormCalculationEstimate.Close;
  end;

  if (not Assigned(FormCalculationEstimate)) then
    FormCalculationEstimate := TFormCalculationEstimate.Create(IdEstimate);

  with qrObjects do
  begin
    FormCalculationEstimate.EditNameObject.Text := IntToStr(FieldByName('NumberObject').AsVariant) + ' ' +
      FieldByName('FullName').AsVariant;
    FormCalculationEstimate.EditNumberContract.Text := FieldByName('NumberContract').AsString;
    FormCalculationEstimate.EditDateContract.Text := FieldByName('DateContract').AsString;
    FormCalculationEstimate.Region := FieldByName('IdRegion').AsVariant;

    FormCalculationEstimate.EditNameEstimate.Text := qrTreeData.FieldByName('NAME').AsString;

    FormCalculationEstimate.IdObject := IdObject;
    FormCalculationEstimate.IdEstimate := IdEstimate;
    // Создание временных таблиц
    FormCalculationEstimate.CreateTempTables;
    // Заполненя временных таблиц, заполнение формы
    FormCalculationEstimate.OpenAllData;
  end;
  FormCalculationEstimate.flChangeEstimate := False;
  FormCalculationEstimate.WindowState := wsMaximized;
  // FormCalculationEstimate.Show;

  // Закрываем форму ожидания
  // FormWaiting.Close;

  Close;
end;

end.
