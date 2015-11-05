unit fFrameRates;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, Buttons,
  DBGrids, Grids, System.UITypes,
  ExtCtrls, DB, VirtualTrees, fFrameStatusBar, Menus, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client, fFrameSmeta, JvExDBGrids,
  JvDBGrid, Vcl.Mask, Vcl.DBCtrls;

type
  TSplitter = class(ExtCtrls.TSplitter)
  public
    procedure Paint(); override;
  end;

type
  TFrameRates = class(TSmetaFrame)
    PanelRates: TPanel;
    SplitterLeft: TSplitter;
    ImageSplitterLeft: TImage;
    ImageSplitterRight: TImage;
    SplitterRight: TSplitter;
    PanelLeft: TPanel;
    PanelRight: TPanel;
    PanelCenter: TPanel;
    PanelShowHideButton: TPanel;
    SpeedButtonShowHideRightPanel: TSpeedButton;
    PanelCenterClient: TPanel;
    ImageSplitterTop: TImage;
    SplitterTop: TSplitter;
    PanelCollection: TPanel;
    PanelHeaderCollection: TPanel;
    PanelSearchNormative: TPanel;
    LabelSearchNormative: TLabel;
    EditSearchNormative: TEdit;
    FrameStatusBar: TFrameStatusBar;
    EditRate: TEdit;
    EditCollection: TEdit;
    LabelSbornik: TLabel;
    Panel1: TPanel;
    PanelHorizontal1: TPanel;
    LabelJustification: TLabel;
    LabelUnit: TLabel;
    Edit5: TEdit;
    PanelHorizontal2: TPanel;
    PanelHorizontal3: TPanel;
    Label2: TLabel;
    CheckBoxNormСonsumption: TCheckBox;
    CheckBoxStructureWorks: TCheckBox;
    CheckBoxChangesAdditions: TCheckBox;
    ImageSplitter1: TImage;
    ImageSplitter2: TImage;
    Panel2: TPanel;
    LabelOXROPR: TLabel;
    LabelWinterPrice: TLabel;
    EditWinterPrice: TEdit;
    Panel3: TPanel;
    PanelChangesAdditions: TPanel;
    PanelCAHeader: TPanel;
    PanelNormСonsumption: TPanel;
    PanelNCHeader: TPanel;
    PanelStructureWorks: TPanel;
    PanelSWHeader: TPanel;
    Splitter2: TSplitter;
    Splitter1: TSplitter;
    qrNC: TFDQuery;
    ADOQuerySW: TFDQuery;
    qrTemp: TFDQuery;
    tmrFilter: TTimer;
    grHistory: TJvDBGrid;
    dsHistory: TDataSource;
    qrHistory: TFDQuery;
    dsNormativ: TDataSource;
    qrSW: TFDQuery;
    dsSW: TDataSource;
    grSostav: TJvDBGrid;
    grRates: TJvDBGrid;
    tmrScroll: TTimer;
    dbedtNumberNormative: TDBEdit;
    dbmmoCaptionNormative: TDBMemo;
    dbedtUnit: TDBEdit;
    pnlNaviator: TPanel;
    btnNext: TSpeedButton;
    btnPrev: TSpeedButton;
    qrNormativ: TFDQuery;
    rb1: TRadioButton;
    rb2: TRadioButton;
    pmRatesEx: TPopupMenu;
    mAdd: TMenuItem;
    mEdit: TMenuItem;
    mDelete: TMenuItem;
    pmNC: TPopupMenu;
    mNCAdd: TMenuItem;
    mNCDel: TMenuItem;
    cbbType: TComboBox;
    btnSelectWinterPrice: TSpeedButton;
    grNC: TJvDBGrid;
    dsNC: TDataSource;
    mNCAdd2: TMenuItem;
    mN11: TMenuItem;
    mN21: TMenuItem;
    mN31: TMenuItem;
    mN3: TMenuItem;
    mN4: TMenuItem;
    btnSelectCollection: TSpeedButton;
    qrObjWorks: TFDQuery;
    dsObjWorks: TDataSource;
    dblkcbbwork_id: TDBLookupComboBox;
    mAddToEstimate: TMenuItem;
    mCopyToOwnBase: TMenuItem;
    mN1: TMenuItem;
    pnlSaveCancel: TPanel;
    btnSave: TBitBtn;
    btnCancel: TBitBtn;

    procedure FrameResize(Sender: TObject);
    procedure ReceivingSearch(vStr: string);

    procedure VSTKeyPress(Sender: TObject; var Key: Char);
    procedure SplitterLeftMoved(Sender: TObject);
    procedure SplitterRightMoved(Sender: TObject);
    procedure Splitter1Moved(Sender: TObject);
    procedure Splitter2Moved(Sender: TObject);
    procedure SplitterTopMoved(Sender: TObject);
    procedure LabelSbornikClick(Sender: TObject);
    procedure LabelSbornikMouseEnter(Sender: TObject);
    procedure LabelSbornikMouseLeave(Sender: TObject);
    procedure EditSearchNormativeKeyPress(Sender: TObject; var Key: Char);
    procedure EditRateEnter(Sender: TObject);
    procedure EditSearchNormativeEnter(Sender: TObject);
    procedure SpeedButtonShowHideRightPanelClick(Sender: TObject);
    procedure ShowHidePanels(Sender: TObject);
    procedure Sbornik(const normativ_directory_id: Integer);
    procedure FilteredRates(const vStr: string; AFilterType: Boolean);
    procedure EditRateChange(Sender: TObject);
    procedure EditRateKeyPress(Sender: TObject; var Key: Char);
    procedure GetWinterPrice;
    procedure tmrFilterTimer(Sender: TObject);
    procedure chk1Click(Sender: TObject);
    procedure grRatesDblClick(Sender: TObject);
    procedure grRatesEnter(Sender: TObject);
    procedure grRatesExit(Sender: TObject);
    procedure qrNormativAfterScroll(DataSet: TDataSet);
    procedure tmrScrollTimer(Sender: TObject);
    procedure btnNextClick(Sender: TObject);
    procedure btnPrevClick(Sender: TObject);
    procedure qrNormativBeforeOpen(DataSet: TDataSet);
    procedure grNCDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure qrNCBeforeOpen(DataSet: TDataSet);
    procedure grNCResize(Sender: TObject);
    procedure qrNCAfterOpen(DataSet: TDataSet);
    procedure pnlNaviatorResize(Sender: TObject);
    procedure qrSWBeforeOpen(DataSet: TDataSet);
    procedure qrSWAfterOpen(DataSet: TDataSet);
    procedure qrHistoryAfterOpen(DataSet: TDataSet);
    procedure mAddClick(Sender: TObject);
    procedure qrNormativNewRecord(DataSet: TDataSet);
    procedure cbbTypeChange(Sender: TObject);
    procedure mNCAddClick(Sender: TObject);
    procedure mNCDelClick(Sender: TObject);
    procedure qrNormativBeforePost(DataSet: TDataSet);
    procedure pmNCPopup(Sender: TObject);
    procedure grNCCanEditCell(Grid: TJvDBGrid; Field: TField; var AllowEdit: Boolean);
    procedure qrNCBeforePost(DataSet: TDataSet);
    procedure mN31Click(Sender: TObject);
    procedure mN3Click(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure mEditClick(Sender: TObject);
    procedure mDeleteClick(Sender: TObject);
    procedure btnSelectCollectionClick(Sender: TObject);
    procedure dblkcbbwork_idCloseUp(Sender: TObject);
    procedure btnSelectWinterPriceClick(Sender: TObject);
    procedure mAddToEstimateClick(Sender: TObject);
    procedure mCopyToOwnBaseClick(Sender: TObject);
    procedure pmRatesExPopup(Sender: TObject);
    procedure qrNormativAfterPost(DataSet: TDataSet);
    procedure qrNormativBeforeEdit(DataSet: TDataSet);
    procedure grNCEnter(Sender: TObject);
  private
    StrQuery: String; // Для формирования строки запроса к БД
    flNewRecord: Boolean; // Признак новой записи
    { StrQuickSearch: String[20]; }
    PageNumber, PageRowCount: Integer; // номер текущей страницы / кол-во записей на странице
    DataBase: Char; // Справочные или собственные данные
    AllowAddition: Boolean; // Разрешено/запрещено добавлять записи из фрейма
    function GetNewID(ATab, AKey: string): Variant;
  public
    procedure ReceivingAll; override;
    procedure CheckCurPeriod; override;
    constructor Create(AOwner: TComponent; const vDataBase: Char;
      const vAllowAddition: Boolean; ASMSubType: Integer = 0); reintroduce;

  end;

implementation

uses Main, DataModule, DrawingTables, CalculationEstimate, Tools, NormativDirectory, SprSelection,
  WinterPrice, CopyToOwnDialog, GlobsAndConst;

{$R *.dfm}

const
  // Название этого фрейма
  CaptionFrame = 'Фрейм «Расценки»';

  { TSplitter }
procedure TSplitter.Paint();
begin
  // inherited;
end;

procedure TFrameRates.btnSelectCollectionClick(Sender: TObject);
begin
  if (not Assigned(fNormativDirectory)) then
    fNormativDirectory := fNormativDirectory.Create(nil);
  fNormativDirectory.skipReload := true;
  fNormativDirectory.Kind := kdSelect;
  if qrNormativ.FieldByName('normativ_directory_id').AsInteger <> 0 then
    fNormativDirectory.tvMain.SelectNode(qrNormativ.FieldByName('normativ_directory_id').AsInteger)
      .Expand(False);
  if fNormativDirectory.ShowModal = mrOk then
  begin
    qrNormativ.Edit;
    qrNormativ.FieldByName('normativ_directory_id').Value := fNormativDirectory.qrMain.FieldByName
      ('normativ_directory_id').Value;
    Sbornik(qrNormativ.FieldByName('normativ_directory_id').AsInteger)
  end;
end;

procedure TFrameRates.btnCancelClick(Sender: TObject);
begin
  qrNormativ.Cancel;
end;

procedure TFrameRates.btnNextClick(Sender: TObject);
var
  e: TDataSetNotifyEvent;
begin
  if qrNormativ.RecordCount < PageRowCount then
    Exit;
  e := qrNormativ.AfterScroll;
  qrNormativ.AfterScroll := nil;
  Inc(PageNumber);
  CloseOpen(qrNormativ);
  qrNormativ.AfterScroll := e;
  tmrScroll.Enabled := False;
  tmrScroll.Enabled := true;
end;

procedure TFrameRates.btnPrevClick(Sender: TObject);
var
  e: TDataSetNotifyEvent;
begin
  if PageNumber = 0 then
    Exit;
  e := qrNormativ.AfterScroll;
  qrNormativ.AfterScroll := nil;
  Dec(PageNumber);
  CloseOpen(qrNormativ);
  qrNormativ.AfterScroll := e;
  tmrScroll.Enabled := False;
  tmrScroll.Enabled := true;
end;

procedure TFrameRates.btnSaveClick(Sender: TObject);
begin
  qrNormativ.Post;
end;

procedure TFrameRates.btnSelectWinterPriceClick(Sender: TObject);
begin
  if (not Assigned(fWinterPrice)) then
    fWinterPrice := TfWinterPrice.Create(Self);
  fWinterPrice.FormKind := kdSelect;
  if not VarIsNull(qrNormativ.FieldByName('ZNORMATIVS_ID').Value) then
    fWinterPrice.LicateID := qrNormativ.FieldByName('ZNORMATIVS_ID').Value;
  if (fWinterPrice.ShowModal = mrOk) and (fWinterPrice.OutValue <> 0) then
  begin
    qrNormativ.Edit;
    qrNormativ.FieldByName('ZNORMATIVS_ID').Value := fWinterPrice.OutValue;
    // Определяем зимнее удорожание
    GetWinterPrice;
  end;
end;

procedure TFrameRates.cbbTypeChange(Sender: TObject);
begin
  qrNormativ.Edit;
  qrNormativ.FieldByName('NORM_TYPE').AsInteger := cbbType.ItemIndex;
end;

procedure TFrameRates.chk1Click(Sender: TObject);
begin
  ReceivingSearch('');
end;

constructor TFrameRates.Create(AOwner: TComponent; const vDataBase:
  Char; const vAllowAddition: Boolean; ASMSubType: Integer);
var ev: TNotifyEvent;
begin
  inherited Create(AOwner);

  flNewRecord := False;
  // Если собственная база
  if vDataBase = '1' then
  begin
    grNC.PopupMenu := pmNC;
    CheckBoxChangesAdditions.Checked := False;
    CheckBoxChangesAdditions.Visible := False;
    dbedtNumberNormative.Color := clWindow;
    dbedtUnit.Color := clWindow;
  end
  else
  // База НРР
  begin
    grNC.PopupMenu := nil;
  end;

  btnSelectWinterPrice.Visible := vDataBase = '1';
  btnSelectCollection.Visible := vDataBase = '1';
  cbbType.Visible := vDataBase = '1';
  dbedtNumberNormative.ReadOnly := not(vDataBase = '1');
  dbedtUnit.ReadOnly := not(vDataBase = '1');
  dbmmoCaptionNormative.ReadOnly := not(vDataBase = '1');
  grNC.ReadOnly := not(vDataBase = '1');

  qrNormativ.AfterScroll := qrNormativAfterScroll;
  // ----------------------------------------

  DataBase := vDataBase;
  AllowAddition := vAllowAddition;

  PanelChangesAdditions.Visible := False;

  // ----------------------------------------

  with dm do
  begin
    with ImageListHorozontalDots do
    begin
      GetIcon(0, ImageSplitterTop.Picture.Icon);
      GetIcon(0, ImageSplitter1.Picture.Icon);
      GetIcon(0, ImageSplitter2.Picture.Icon);
    end;

    with ImageListVerticalDots do
    begin
      GetIcon(0, ImageSplitterLeft.Picture.Icon);
      GetIcon(0, ImageSplitterRight.Picture.Icon);
    end;

    ImageListArrowsLeft.GetBitmap(0, SpeedButtonShowHideRightPanel.Glyph);
  end;
  // НАСТРОЙКА ПАНЕЛЕЙ B КНОПОК

  PanelRight.Constraints.MinWidth := 35;
  SpeedButtonShowHideRightPanel.Hint := 'Свернуть панель';

  PanelCollection.Constraints.MinHeight := 50;
  PanelNormСonsumption.Constraints.MinHeight := 50;
  PanelChangesAdditions.Constraints.MinHeight := 50;

  SplitterRight.Visible := False;
  PanelRight.Visible := False;
  PanelRight.Constraints.MinWidth := 100;

  if ASMSubType in [1,2] then
  begin
    ev := rb1.OnClick;
    try
      rb1.OnClick := nil;
      rb2.OnClick := nil;

      if ASMSubType = 1 then
        rb1.Checked := True;
      if ASMSubType = 2 then
        rb2.Checked := True;

      rb1.Visible := False;
      rb2.Visible := False;
    finally
      rb1.OnClick := ev;
      rb2.OnClick := ev;
    end;
  end;

  CloseOpen(qrObjWorks);

  ShowHidePanels(nil);
end;

procedure TFrameRates.dblkcbbwork_idCloseUp(Sender: TObject);
begin
  if DataBase = '1' then
  begin
    qrNormativ.Edit;
    qrNormativ.FieldByName('work_id').Value := dblkcbbwork_id.KeyValue;
  end;
end;

procedure TFrameRates.FrameResize(Sender: TObject);
{ var
  PHeight: Integer; }
begin
  {
    PHeight := PanelNormСonsumption.Height + PanelStructureWorks.Height + PanelChangesAdditions.Height;
    PHeight := PHeight div 3;
    PanelNormСonsumption.Height := PHeight;
    PanelChangesAdditions.Height := PHeight;
  }
  SplitterTopMoved(nil);
  SplitterLeftMoved(nil);
  SplitterRightMoved(nil);
  Splitter1Moved(nil);
  Splitter2Moved(nil);
  // Получаем кол-во записей, помещающееся на форму
  PageRowCount := Trunc(grRates.Height / grRates.RowsHeight);
end;

procedure TFrameRates.LabelSbornikClick(Sender: TObject);
begin
  rb1.Checked := true;

  if (not Assigned(fNormativDirectory)) then
    fNormativDirectory := fNormativDirectory.Create(nil);
  fNormativDirectory.skipReload := true;
  fNormativDirectory.Show;
  if qrNormativ.FieldByName('normativ_directory_id').AsInteger <> 0 then
    fNormativDirectory.tvMain.SelectNode(qrNormativ.FieldByName('normativ_directory_id').AsInteger)
      .Expand(False);
  fNormativDirectory.skipReload := False;
end;

procedure TFrameRates.LabelSbornikMouseEnter(Sender: TObject);
begin
  with (Sender as TLabel) do
  begin
    Cursor := crHandPoint;
    Font.Style := Font.Style + [fsUnderline];
  end;
end;

procedure TFrameRates.LabelSbornikMouseLeave(Sender: TObject);
begin
  with (Sender as TLabel) do
  begin
    Cursor := crDefault;
    Font.Style := Font.Style - [fsUnderline];
  end;
end;

procedure TFrameRates.mAddClick(Sender: TObject);
begin
  qrNormativ.Insert;
end;

procedure TFrameRates.mAddToEstimateClick(Sender: TObject);
begin
  FormCalculationEstimate.AddRate(qrNormativ.FieldByName('IdNormative').AsInteger);
end;

function TFrameRates.GetNewID(ATab, AKey: string): Variant;
begin
  Result := FastSelectSQLOne('SELECT MAX(' + AKey + ') + 1 FROM ' + ATab + ' ' +
    'WHERE ' + AKey + '>=:0', VarArrayOf([С_MANIDDELIMETER]));
  if VarIsNull(Result) then
    Result := С_MANIDDELIMETER + 1;
end;

procedure TFrameRates.mCopyToOwnBaseClick(Sender: TObject);
var
  newID, newID1, res, tID: Variant;
  AutoCommitValue, flOk: Boolean;
  OBJ_NAME: string;
begin
  if not CheckQrActiveEmpty(qrNormativ) then
    Exit;
  AutoCommitValue := dm.Read.Options.AutoCommit;
  dm.Read.Options.AutoCommit := False;
  try
    try
      // Проверяем на наличие такой же записи
      flOk := False;
      OBJ_NAME := qrNormativ.FieldByName('NumberNormative').AsString;
      while not flOk do
      begin
        tID := null;
        tID := FastSelectSQLOne('SELECT NORMATIV_ID FROM normativg WHERE NORM_BASE=1 and NORM_NUM=:0 LIMIT 1',
          VarArrayOf([OBJ_NAME]));
        if not VarIsNull(tID) then
        begin
          res := ShowCopyToOwnDialog(OBJ_NAME);

          if VarIsNull(res) then
            Exit;
          if res = 1 then
          begin
            FastExecSQL('DELETE FROM normativg WHERE NORMATIV_ID = :1', VarArrayOf([tID]));
            flOk := true;
          end;
        end
        else
          flOk := true;
      end;
      dm.Read.StartTransaction;
      // Копируем расценку
      newID := GetNewID('normativg', 'NORMATIV_ID');
      FastExecSQL
        ('INSERT INTO normativg(NORMATIV_ID, SORT_NUM, NORM_NUM, NORM_CAPTION, UNIT_ID, ' +
         'NORM_ACTIVE, normativ_directory_id, NORM_BASE, NORM_TYPE, work_id, ' +
         'ZNORMATIVS_ID, date_beginer)'#13 +
         '(SELECT :0, null,:1,NORM_CAPTION,UNIT_ID,1,normativ_directory_id,1,' +
         'NORM_TYPE,work_id,ZNORMATIVS_ID, :2 FROM normativg WHERE NORMATIV_ID = :3);',
        VarArrayOf([newID, OBJ_NAME, Now, qrNormativ.FieldByName('IdNormative').Value]));

      // Копируем материалы
      newID1 := GetNewID('materialnorm', 'ID');
      qrTemp.Active := False;
      qrTemp.SQL.Text := 'SELECT MATERIAL_ID, NORM_RAS ' +
        'FROM materialnorm WHERE NORMATIV_ID=' +
        qrNormativ.FieldByName('IdNormative').AsString;
      qrTemp.Active := True;
      while not qrTemp.Eof do
      begin
        FastExecSQL
          ('INSERT INTO materialnorm (ID, NORMATIV_ID, MATERIAL_ID, NORM_RAS, BASE) ' +
           'VALUES (:0,:1,:2,:3,1)',
        VarArrayOf([newID1, newID, qrTemp.Fields[0].Value, qrTemp.Fields[1].Value]));
        inc(newID1);
        qrTemp.Next;
      end;
      qrTemp.Active := False;

      // Копируем механизмы
      newID1 := GetNewID('mechanizmnorm', 'ID');
      qrTemp.Active := False;
      qrTemp.SQL.Text := 'SELECT MECHANIZM_ID, NORM_RAS ' +
        'FROM mechanizmnorm WHERE NORMATIV_ID=' +
        qrNormativ.FieldByName('IdNormative').AsString;
      qrTemp.Active := True;
      while not qrTemp.Eof do
      begin
        FastExecSQL
          ('INSERT INTO mechanizmnorm (ID, NORMATIV_ID, MECHANIZM_ID, NORM_RAS, BASE) ' +
           'VALUES (:0,:1,:2,:3,1)',
          VarArrayOf([newID1, newID, qrTemp.Fields[0].Value, qrTemp.Fields[1].Value]));
        inc(newID1);
        qrTemp.Next;
      end;
      qrTemp.Active := False;

      // Копируем затраты труда
      newID1 := GetNewID('normativwork', 'ID');
      qrTemp.Active := False;
      qrTemp.SQL.Text := 'SELECT WORK_ID, NORMA FROM normativwork ' +
        'WHERE NORMATIV_ID=' +
        qrNormativ.FieldByName('IdNormative').AsString;
      qrTemp.Active := True;
      while not qrTemp.Eof do
      begin
        FastExecSQL
          ('INSERT INTO normativwork (ID, NORMATIV_ID, WORK_ID, NORMA, BASE) ' +
           'VALUES (:0,:1,:2,:3,1)',
          VarArrayOf([newID1, newID, qrTemp.Fields[0].Value, qrTemp.Fields[1].Value]));
        inc(newID1);
        qrTemp.Next;
      end;
      qrTemp.Active := False;

      dm.Read.Commit;
      Application.MessageBox('Запись успешно скопирована!', 'Справочник расценок',
        MB_OK + MB_ICONINFORMATION + MB_TOPMOST);
    except
      dm.Read.Rollback;
      Application.MessageBox('Ошибка копирования записи!', 'Справочник расценок',
        MB_OK + MB_ICONSTOP + MB_TOPMOST);
    end;
  finally
    dm.Read.Options.AutoCommit := AutoCommitValue;
  end;
end;

procedure TFrameRates.mEditClick(Sender: TObject);
begin
  qrNormativ.Edit;
end;

procedure TFrameRates.mDeleteClick(Sender: TObject);
begin
  if Application.MessageBox('Удалить запись?', 'Справочник расценок', MB_YESNO + MB_ICONQUESTION + MB_TOPMOST)
    = IDYES then
  begin
    qrNormativ.Delete;
  end;
end;

procedure TFrameRates.mN31Click(Sender: TObject);
var newID1: Variant;
begin
  newID1 := GetNewID('normativwork', 'ID');
  FastExecSQL('INSERT INTO normativwork (ID, NORMATIV_ID, WORK_ID, NORMA) ' +
    'VALUE(:0,:1,:2,0)', VarArrayOf([newID1,
    qrNormativ.FieldByName('IdNormative').Value, (Sender as TComponent).Tag]));
  CloseOpen(qrNC);
end;

procedure TFrameRates.mN3Click(Sender: TObject);
var
  i: Integer;
  newID1: Variant;
begin
  for i := 1 to 3 do
  begin
    newID1 := GetNewID('normativwork', 'ID');
    FastExecSQL('INSERT INTO normativwork (ID, NORMATIV_ID, WORK_ID, NORMA) ' +
      'VALUE(:0,:1,:2,0)',
      VarArrayOf([newID1, qrNormativ.FieldByName('IdNormative').Value, i]));
  end;
  CloseOpen(qrNC);
end;

procedure TFrameRates.mNCAddClick(Sender: TObject);
var
  res: Variant;
  newID1: Variant;
begin
  case qrNC.FieldByName('OBJ_TYPE').AsInteger of
    1:
      begin
        res := SelectMechanizm;
        if not VarIsNull(res) then
        begin
          newID1 := GetNewID('mechanizmnorm', 'ID');
          FastExecSQL('INSERT INTO mechanizmnorm (ID, NORMATIV_ID, MECHANIZM_ID, NORM_RAS) ' +
            'VALUE(:0,:1,:2,"1")',
            VarArrayOf([newID1, qrNormativ.FieldByName('IdNormative').Value, res]));
          CloseOpen(qrNC);
        end;
      end;
    2:
      begin
        res := SelectMaterial;
        if not VarIsNull(res) then
        begin
          newID1 := GetNewID('materialnorm', 'ID');
          FastExecSQL('INSERT INTO materialnorm (ID, NORMATIV_ID, MATERIAL_ID, NORM_RAS) ' +
            'VALUE(:0,:1,:2,"1")',
            VarArrayOf([newID1, qrNormativ.FieldByName('IdNormative').Value, res]));
          CloseOpen(qrNC);
        end;
      end;
    3:
      begin
        res := SelectMaterial;
        if not VarIsNull(res) then
        begin
          newID1 := GetNewID('materialnorm', 'ID');
          FastExecSQL('INSERT INTO materialnorm (ID, NORMATIV_ID, MATERIAL_ID, NORM_RAS) ' +
            'VALUE(:0,:1,:2,"1")',
            VarArrayOf([newID1, qrNormativ.FieldByName('IdNormative').Value, res]));
          CloseOpen(qrNC);
        end;
      end;
  end;
end;

procedure TFrameRates.mNCDelClick(Sender: TObject);
begin
  case qrNC.FieldByName('OBJ_TYPE').AsInteger of
    1:
      begin
        FastExecSQL('DELETE FROM mechanizmnorm WHERE ID=:2', VarArrayOf([qrNC.FieldByName('ID').Value]));
      end;
    2:
      begin
        FastExecSQL('DELETE FROM materialnorm WHERE ID=:2', VarArrayOf([qrNC.FieldByName('ID').Value]));
      end;
    3:
      begin
        FastExecSQL('DELETE FROM materialnorm WHERE ID=:2', VarArrayOf([qrNC.FieldByName('ID').Value]));
      end;
    4:
      begin
        FastExecSQL('DELETE FROM normativwork WHERE ID=:2', VarArrayOf([qrNC.FieldByName('ID').Value]));
      end;
  end;
  qrNC.Delete;
end;

procedure TFrameRates.pmNCPopup(Sender: TObject);
begin
  if not CheckQrActiveEmpty(qrNormativ) then
    Abort;

  if qrNormativ.State in [dsInsert] then
    qrNormativ.Post;

  mNCDel.Visible := qrNC.FieldByName('FL_PART_NAME').AsInteger = 0;
  mNCAdd.Visible := qrNC.FieldByName('OBJ_TYPE').AsInteger <> 4;
  mNCAdd2.Visible := qrNC.FieldByName('OBJ_TYPE').AsInteger = 4;
end;

procedure TFrameRates.pmRatesExPopup(Sender: TObject);
begin
  mAdd.Visible := DataBase = '1';
  mEdit.Visible := DataBase = '1';
  mDelete.Visible := DataBase = '1';
  mAddToEstimate.Visible := Assigned(FormCalculationEstimate);
  mCopyToOwnBase.Visible := DataBase = '0';
end;

procedure TFrameRates.pnlNaviatorResize(Sender: TObject);
begin
  btnPrev.Width := (pnlNaviator.ClientWidth - pnlNaviator.ControlCount - 1) div pnlNaviator.ControlCount;
  btnNext.Width := (pnlNaviator.ClientWidth - pnlNaviator.ControlCount - 1) div pnlNaviator.ControlCount;
end;

procedure TFrameRates.qrHistoryAfterOpen(DataSet: TDataSet);
begin
  {
    PanelChangesAdditions.Height := PanelCAHeader.Height + qrHistory.RecordCount *
    (grHistory.RowsHeight + 2) + 1;
  }
  grNCResize(grHistory);
end;

procedure TFrameRates.qrNCAfterOpen(DataSet: TDataSet);
begin
  grNCResize(grNC);
end;

procedure TFrameRates.qrNCBeforeOpen(DataSet: TDataSet);
begin
  qrNC.ParamByName('IdNormativ').Value := qrNormativ.FieldByName('IdNormative').Value;
end;

procedure TFrameRates.qrNCBeforePost(DataSet: TDataSet);
begin
  case qrNC.FieldByName('OBJ_TYPE').AsInteger of
    1:
      begin
        FastExecSQL('UPDATE mechanizmnorm SET NORM_RAS=:1 WHERE ID=:2',
          VarArrayOf([qrNC.FieldByName('OBJ_VALUE').Value, qrNC.FieldByName('ID').Value]));
      end;
    2:
      begin
        FastExecSQL('UPDATE materialnorm SET NORM_RAS=:1 WHERE ID=:2',
          VarArrayOf([qrNC.FieldByName('OBJ_VALUE').Value, qrNC.FieldByName('ID').Value]));
      end;
    3:
      begin
        FastExecSQL('UPDATE materialnorm SET NORM_RAS=:1 WHERE ID=:2',
          VarArrayOf([qrNC.FieldByName('OBJ_VALUE').Value, qrNC.FieldByName('ID').Value]));
      end;
    4:
      begin
        FastExecSQL('UPDATE normativwork SET NORMA=:1 WHERE ID=:2',
          VarArrayOf([qrNC.FieldByName('OBJ_VALUE').Value, qrNC.FieldByName('ID').Value]));
      end;
  end;
end;

procedure TFrameRates.qrNormativAfterPost(DataSet: TDataSet);
begin
  pnlSaveCancel.Visible := False;
  tmrScroll.Enabled := False;
  tmrScroll.Enabled := true;
end;

procedure TFrameRates.qrNormativAfterScroll(DataSet: TDataSet);
var
  e: TDataSetNotifyEvent;
begin
  flNewRecord := False;
  if qrNormativ.Eof then
  begin
    btnNext.Click;
    Exit;
  end
  else if qrNormativ.Bof and (PageNumber <> 0) then
  begin
    btnPrev.Click;
    e := qrNormativ.AfterScroll;
    qrNormativ.AfterScroll := nil;
    qrNormativ.Last;
    qrNormativ.AfterScroll := e;
  end;

  tmrScroll.Enabled := False;
  tmrScroll.Enabled := true;
end;

procedure TFrameRates.qrNormativBeforeEdit(DataSet: TDataSet);
begin
  pnlSaveCancel.Visible := true;
  pnlSaveCancel.Top := Panel3.Height;
end;

procedure TFrameRates.qrNormativBeforeOpen(DataSet: TDataSet);
begin
  PageRowCount := Trunc(grRates.Height / grRates.RowsHeight);
  qrNormativ.ParamByName('SkipCount').AsInteger := PageNumber * PageRowCount;
  qrNormativ.ParamByName('PageRowCount').AsInteger := PageRowCount;
end;

procedure TFrameRates.qrNormativBeforePost(DataSet: TDataSet);
var
  res, newID: Variant;
begin
  if VarIsNull(qrNormativ.FieldByName('NumberNormative').Value) then
  begin
    ShowMessage('Заполните обоснование!');
    dbedtNumberNormative.SetFocus;
    Abort;
  end;
  // Находим единицу измерения
  if qrNormativ.FieldByName('Unit').Value <> qrNormativ.FieldByName('Unit').OldValue then
  begin
    res := null;
    res := FastSelectSQLOne('SELECT units.unit_id FROM units WHERE UPPER(unit_name)=TRIM(UPPER(:0))',
      VarArrayOf([qrNormativ.FieldByName('Unit').Value]));
    if VarIsNull(res) then
    begin
      newID := GetNewID('units', 'UNIT_ID');
      FastExecSQL('INSERT INTO units(UNIT_NAME, BASE, UNIT_ID) VALUE(:0, 1, :1)',
        VarArrayOf([qrNormativ.FieldByName('Unit').Value, newID]));
      res := newID;
    end;
    qrNormativ.FieldByName('UNIT_ID').Value := res;
  end;

  {
    if Application.MessageBox('Сохранить изменения?', 'Справочник расценок',
    MB_YESNO + MB_ICONQUESTION + MB_TOPMOST) = IDYES then
    begin

    end
    else
    qrNormativ.Cancel; }
end;

procedure TFrameRates.qrNormativNewRecord(DataSet: TDataSet);
begin
  // Устанавливаем признак новой записи
  flNewRecord := true;
  pnlSaveCancel.Visible := true;
  pnlSaveCancel.Top := Panel3.Height;
  // Автоматическое заполенение полей новой расценки
  qrNormativ.FieldByName('NORM_BASE').AsInteger := 1; // Собственная БД
  qrNormativ.FieldByName('NORM_ACTIVE').AsInteger := 1; // Действующая
  qrNormativ.FieldByName('date_beginer').AsDateTime := Now;
  // qrNormativ.Post;
  // qrNormativ.Edit;
end;

procedure TFrameRates.qrSWAfterOpen(DataSet: TDataSet);
begin
  // PanelStructureWorks.Height := PanelSWHeader.Height + qrSW.RecordCount * (grSostav.RowsHeight + 2) + 1;
  grNCResize(grSostav);
end;

procedure TFrameRates.qrSWBeforeOpen(DataSet: TDataSet);
begin
  qrSW.ParamByName('normativ_directory_id').AsInteger := qrNormativ.FieldByName('normativ_directory_id')
    .AsInteger;
end;

procedure TFrameRates.ReceivingAll;
begin
  EditRateChange(nil);
  fLoaded := true;
end;

procedure TFrameRates.CheckCurPeriod;
begin

end;

procedure TFrameRates.SpeedButtonShowHideRightPanelClick(Sender: TObject);
begin
  SpeedButtonShowHideRightPanel.Glyph.Assign(nil);

  with SpeedButtonShowHideRightPanel do
    if Tag = 1 then
    begin
      Tag := 0;
      SplitterRight.Visible := False;
      PanelRight.Visible := False;
      dm.ImageListArrowsLeft.GetBitmap(0, SpeedButtonShowHideRightPanel.Glyph);
      SpeedButtonShowHideRightPanel.Hint := 'Развернуть панель';
    end
    else
    begin
      Tag := 1;
      PanelRight.Visible := true;
      SplitterRight.Visible := true;
      SpeedButtonShowHideRightPanel.Hint := 'Свернуть панель';
      dm.ImageListArrowsRight.GetBitmap(0, SpeedButtonShowHideRightPanel.Glyph);
    end;
end;

procedure TFrameRates.Splitter1Moved(Sender: TObject);
begin
  ImageSplitter1.Top := Splitter1.Top;
  ImageSplitter1.Left := Splitter1.Left + (Splitter1.Width - ImageSplitter1.Width) div 2;
end;

procedure TFrameRates.Splitter2Moved(Sender: TObject);
begin
  ImageSplitter2.Top := Splitter2.Top;
  ImageSplitter2.Left := Splitter2.Left + (Splitter2.Width - ImageSplitter2.Width) div 2;
end;

procedure TFrameRates.SplitterLeftMoved(Sender: TObject);
begin
  ImageSplitterLeft.Left := SplitterLeft.Left;
  ImageSplitterLeft.Top := SplitterLeft.Top + (SplitterLeft.Height - ImageSplitterLeft.Height) div 2;
end;

procedure TFrameRates.SplitterRightMoved(Sender: TObject);
begin
  ImageSplitterRight.Left := SplitterRight.Left;
  ImageSplitterRight.Top := SplitterRight.Top + (SplitterRight.Height - ImageSplitterRight.Height) div 2;
end;

procedure TFrameRates.SplitterTopMoved(Sender: TObject);
begin
  ImageSplitterTop.Top := SplitterTop.Top;
  ImageSplitterTop.Left := SplitterTop.Left + (SplitterTop.Width - ImageSplitterTop.Width) div 2;
end;

procedure TFrameRates.tmrFilterTimer(Sender: TObject);
begin
  tmrFilter.Enabled := False;
  ReceivingSearch(FilteredString(EditRate.Text, 'norm_num'));
end;

procedure TFrameRates.tmrScrollTimer(Sender: TObject);
var
  IdNormative: String;
begin
  tmrScroll.Enabled := False;

  if qrNormativ.IsEmpty then
    Exit;

  CloseOpen(qrNC);
  IdNormative := qrNormativ.FieldByName('IdNormative').AsVariant; // Получаем Id норматива

  if not(qrNormativ.State in [dsInsert]) then
  begin
    if qrNormativ.FieldByName('NORM_TYPE').AsInteger = 1 then
    begin
      CheckBoxNormСonsumption.Checked := False;
      CheckBoxNormСonsumption.Visible := False;
    end
    else
    begin
      CheckBoxNormСonsumption.Checked := true;
      CheckBoxNormСonsumption.Visible := true;
    end;
  end;

  Sbornik(qrNormativ.FieldByName('normativ_directory_id').AsInteger);

  // ----------------------------------

  // ВЫВОДИМ ОХР И ОПР И ПЛАН ПРИБЫЛИ
  if VarIsNull(qrNormativ.FieldByName('work_id').Value) then
  begin
    with qrTemp do
    begin
      Active := False;
      SQL.Clear;
      StrQuery := 'SELECT work_id, s, po FROM onormativs where ((FN_NUM_TO_INT(s)<= FN_NUM_TO_INT("' +
        qrNormativ.FieldByName('NumberNormative').AsString + '")) and (FN_NUM_TO_INT(po) >= FN_NUM_TO_INT("' +
        qrNormativ.FieldByName('NumberNormative').AsString + '")));';
      SQL.Add(StrQuery);
      Active := true;
      // Сделано допущение, что идут work_id по порядку от еденицы
      if not Eof then
      begin
        // dblkcbbwork_id.DataSource := nil;
        dblkcbbwork_id.KeyValue := FieldByName('work_id').Value;
        {
          qrNormativ.Edit;
          qrNormativ.FieldByName('work_id').Value := FieldByName('work_id').Value;
        }
      end
      else
        dblkcbbwork_id.KeyValue := 1;
    end;
  end
  else
    dblkcbbwork_id.KeyValue := qrNormativ.FieldByName('work_id').Value;

  // ----------------------------------------
  case qrNormativ.FieldByName('NORM_ACTIVE').Value of
    0:
      begin
        Edit5.Text := 'Недействующая';
        Edit5.Color := clRed;
      end;
    1:
      begin
        Edit5.Text := 'Действующая';
        Edit5.Color := $0080FF80;
      end;
    2:
      begin
        Edit5.Text := 'Анулированная';
        Edit5.Color := clRed;
      end;
  end;

  // Заполняем историю изменений
  qrHistory.ParamByName('NORM_NUM').AsString :=
    '%' + Trim(StringReplace(qrNormativ.FieldByName('NumberNormative').AsString, '*', '',
    [rfReplaceAll])) + '%';
  CloseOpen(qrHistory);

  // Заполняем состав работ
  CloseOpen(qrSW);
  // Определяем зимнее удорожание
  GetWinterPrice;
  // Локейтимся на сборник, если открыта форма
  if Assigned(fNormativDirectory) and fNormativDirectory.Showing then
  begin
    fNormativDirectory.skipReload := true;
    fNormativDirectory.tvMain.SelectNode(qrNormativ.FieldByName('normativ_directory_id').AsInteger)
      .Expand(False);
    fNormativDirectory.skipReload := False;
  end;
end;

procedure TFrameRates.VSTKeyPress(Sender: TObject; var Key: Char);
var
  vCode: Integer;
begin
  // 1057 = С ; 1045 = Е ; 1062 = Ц ; 8 = BackSpace ; 27 = Esc

  Key := AnsiUpperCase(Key)[1];
  vCode := Ord(Key);

  // Символы разрешённые к вводу
  if not((vCode = 1057) or (vCode = 1045) or (vCode = 1062) or (vCode = 8) or (vCode = 27) or (Key = '-') or
    ((Key >= '0') and (Key <= '9'))) then
  begin
    Key := #0;
    Exit;
  end;

  if (vCode = 27) then
  begin
    EditRate.Text := '';
    Exit;
  end;

  // Ввод цифры не первым символом
  if (EditRate.Text = '') and (Key >= '0') and (Key <= '9') then
    Key := #0;

  // Ввод буквы только первым символом
  if (EditRate.Text > '') and ((vCode = 1057) or (vCode = 1045) or (vCode = 1062)) then
    Key := #0;

  // Если тире и строка пуста, выходим, иначе дальше возникнет ошибка, при обращении к символом пустой строки
  if (Key = '-') and (EditRate.Text = '') then
    Key := #0;

  // Ввод тире только после цифры
  with EditRate do
    if (Key = '-') and (Text <> '') then
      if ((Text[Length(Text)] < '0') or (Text[Length(Text)] > '9')) then
        Key := #0;

  if vCode = VK_BACK then
    EditRate.Text := Copy(EditRate.Text, 0, Length(EditRate.Text) - 1)
  else
    EditRate.Text := EditRate.Text + Key;
end;

procedure TFrameRates.EditRateEnter(Sender: TObject);
begin
  if Trim(EditSearchNormative.Text) <> '' then
    EditSearchNormative.Text := '';
end;

procedure TFrameRates.EditRateChange(Sender: TObject);
begin
  tmrFilter.Enabled := False;
  tmrFilter.Enabled := true;
end;

procedure TFrameRates.EditRateKeyPress(Sender: TObject; var Key: Char);
var
  vCode: Integer;
begin
  // 1057 = С ; 1045 = Е ; 1062 = Ц ; 8 = BackSpace ; 27 = Esc ; 1059 = У

  Key := AnsiUpperCase(Key)[1];
  vCode := Ord(Key);

  if vCode = 67 then
  begin
    vCode := 1057;
    Key := 'С';
  end;

  if vCode = 69 then
  begin
    vCode := 1059;
    Key := 'У';
  end;

  if vCode = 72 then
  begin
    vCode := 1056;
    Key := 'Р';
  end;

  if vCode = 84 then
  begin
    vCode := 1045;
    Key := 'Е';
  end;

  if vCode = 87 then
  begin
    vCode := 1062;
    Key := 'Ц';
  end;

  if vCode = 89 then
  begin
    vCode := 1053;
    Key := 'Н';
  end;

  // Символы разрешённые к вводу
  if not((vCode = 1053) or (vCode = 1056) or (vCode = 1057) or (vCode = 1059) or (vCode = 1045) or
    (vCode = 1062) or (vCode = 8) or (vCode = 27) or (Key = '-') or ((Key >= '0') and (Key <= '9'))) then
  begin
    Key := #0;
    Exit;
  end;

  if (vCode = 27) then
  begin
    (Sender as TEdit).Text := '';
    Exit;
  end;

  // Ввод цифры не первым символом
  { if ((Sender as TEdit).Text = '') and (Key >= '0') and (Key <= '9') then
    Key := #0; }

  // Ввод буквы только первым символом
  if ((Sender as TEdit).Text > '') and ((vCode = 1057) or (vCode = 1059) or (vCode = 1045) or (vCode = 1062))
  then
    Key := #0;

  // Если тире и строка пуста, выходим, иначе дальше возникнет ошибка, при обращении к символом пустой строки
  if (Key = '-') and ((Sender as TEdit).Text = '') then
    Key := #0;

  // Ввод тире только после цифры
  with (Sender as TEdit) do
    if (Key = '-') and (Text <> '') then
      if ((Text[Length(Text)] < '0') or (Text[Length(Text)] > '9')) then
        Key := #0;

  // Аптибип
  if Key = #13 then
    Key := #0;
end;

procedure TFrameRates.EditSearchNormativeEnter(Sender: TObject);
begin
  if Trim(EditRate.Text) <> '' then
    EditRate.Text := '';
end;

procedure TFrameRates.EditSearchNormativeKeyPress(Sender: TObject; var Key: Char);
var
  StringSearch: String;
  CountWords, i: Integer;
  Words: array of String;
begin
  StringSearch := (Sender as TEdit).Text;
  // Получаем исходную поисковую строку

  // Если нажата клавиша "Enter" и строка поиска не пуста
  // или нажата клавиша "Пробел" и строка поиска длинной более 1 символа
  if (Key = #13) and (StringSearch <> '') or (Key = #32) and (Length(StringSearch) > 1) then
  begin
    // Если в конце нет пробела, ставим
    if StringSearch[Length(StringSearch)] <> ' ' then
      StringSearch := StringSearch + ' ';

    // Обнуляем счётчик количества слов
    CountWords := 0;

    // Подсчитываем количество пробелов (столько же будет и слов)
    for i := 1 to Length(StringSearch) do
      if StringSearch[i] = ' ' then
        Inc(CountWords);

    // Создаём массив для слов
    SetLength(Words, CountWords);

    i := 0;

    // Заносим слова в массив
    while pos(' ', StringSearch) > 0 do
    begin
      Words[i] := Copy(StringSearch, 1, pos(' ', StringSearch) - 1);
      Delete(StringSearch, 1, pos(' ', StringSearch));
      Inc(i);
    end;

    StringSearch := '';

    for i := 0 to CountWords - 1 do
      StringSearch := StringSearch + 'norm_caption LIKE ''%' + Words[i] + '%'' and ';

    Delete(StringSearch, Length(StringSearch) - 4, 5);

    ReceivingSearch(StringSearch);
  end
  // Если нажата клавиша ESC, или если нажата клавиша Enter и строка поиска пуста
  else if (Key = #27) or ((Key = #13) and (StringSearch = '')) then
  begin
    (Sender as TEdit).Text := '';

    ReceivingSearch('');
  end;
  // Антибип
  if Key = #13 then
    Key := #0;
end;

procedure TFrameRates.ReceivingSearch(vStr: string);
var
  QueryStr, WhereStr: string;
begin
  try
    if vStr <> '' then
      WhereStr := ' WHERE ' + vStr
    else
      WhereStr := ' WHERE (1=1) ';
    PageNumber := 0;
    with qrNormativ do
    begin
      Active := False;
      SQL.Clear;
      QueryStr := 'SELECT SQL_NO_CACHE normativ_id as "IdNormative", norm_num as "NumberNormative", ' +
        'unit_name as "Unit", norm_caption as "CaptionNormativ", NORM_ACTIVE, nv.normativ_directory_id, ' +
        'tree_data, NORM_TYPE, SORT_NUM, NORM_TYPE, NORM_BASE, nv.UNIT_ID, nv.work_id, nv.ZNORMATIVS_ID, ' +
        'nv.date_beginer ' + 'FROM normativg nv FORCE INDEX(normativg_idx4)' +
        ' LEFT JOIN normativ_directory ndr ON ' + '(ndr.normativ_directory_id = nv.normativ_directory_id) ' +
        'LEFT JOIN units ON (nv.unit_id=units.unit_id) ' + WhereStr + ' AND (nv.norm_base = ' + DataBase +
        ') and ((NORM_TYPE=0 AND :x1) OR (NORM_TYPE=1 AND :x2) OR (NORM_TYPE=2 AND :x3)) ' +
        'ORDER BY SORT_NUM LIMIT :SkipCount, :PageRowCount;';
      SQL.Add(QueryStr);
      if rb1.Checked then
      begin
        ParamByName('x1').Value := true;
        ParamByName('x2').Value := true;
        ParamByName('x3').Value := true;
      end
      else
      begin
        ParamByName('x1').Value := False;
        ParamByName('x2').Value := true;
        ParamByName('x3').Value := False;
      end;
      Active := true;
    end;

    if qrNormativ.RecordCount <= 0 then
      FrameStatusBar.InsertText(1, '-1');

    FrameStatusBar.InsertText(0, IntToStr(qrNormativ.RecordCount)); // исправить

    // tmrScroll.Enabled := true;
  except
    on e: Exception do
      MessageBox(0, PChar('При запросе к БД возникла ошибка:' + sLineBreak + sLineBreak + e.Message),
        CaptionFrame, MB_ICONERROR + MB_OK + mb_TaskModal);
  end;
end;

procedure TFrameRates.ShowHidePanels(Sender: TObject);
begin
  {
    if not CheckBoxStructureWorks.Checked then
    PanelNormСonsumption.Align := alClient
    else
    PanelNormСonsumption.Align := alTop;
  }
  Splitter1.Visible := CheckBoxNormСonsumption.Checked;
  PanelNormСonsumption.Visible := CheckBoxNormСonsumption.Checked;
  PanelStructureWorks.Visible := CheckBoxStructureWorks.Checked;
  PanelChangesAdditions.Visible := CheckBoxChangesAdditions.Checked;
  Splitter2.Visible := CheckBoxChangesAdditions.Checked;
end;

procedure TFrameRates.Sbornik(const normativ_directory_id: Integer);
var
  res, parent_id: Variant;
begin
  res := FastSelectSQLOne('select type_directory FROM normativ_directory WHERE normativ_directory_id=:1',
    VarArrayOf([normativ_directory_id]));
  parent_id := normativ_directory_id;
  while not(VarIsNull(res)) and (res <> 2) and (res <> 1) do
  begin
    // Поднимаемся на уровень выше, пока не доберемся до сборника
    parent_id := FastSelectSQLOne('select parent_id FROM normativ_directory WHERE normativ_directory_id=:1',
      VarArrayOf([parent_id]));
    if VarIsNull(parent_id) then
      parent_id := 0;
    res := FastSelectSQLOne('select type_directory FROM normativ_directory WHERE normativ_directory_id=:1',
      VarArrayOf([parent_id]));
  end;

  if not(VarIsNull(res)) and ((res = 2) or (res = 1)) then
    EditCollection.Text :=
      VarToStr(FastSelectSQLOne
      ('select CONCAT(FIRST_NAME, ". " , IFNULL(SECOND_NAME, "")) FROM normativ_directory WHERE normativ_directory_id=:1',
      VarArrayOf([parent_id])))
  else
    EditCollection.Text := 'Сборник не найден';
end;

procedure TFrameRates.FilteredRates(const vStr: string; AFilterType: Boolean);
begin
  if AFilterType then
    ReceivingSearch(vStr)
  else
    ReceivingSearch(FilteredString(EditRate.Text, 'norm_num'));;
end;

procedure TFrameRates.GetWinterPrice;
var
  s: string;
begin
  try
    if VarIsNull(qrNormativ.FieldByName('ZNORMATIVS_ID').Value) then
    begin
      with qrTemp do
      begin
        Active := False;
        s := qrNormativ.FieldByName('NumberNormative').AsString;
        SQL.Clear;
        SQL.Add('SELECT num, name, s, po FROM znormativs, znormativs_detail WHERE znormativs.ZNORMATIVS_ID=znormativs_detail.ZNORMATIVS_ID AND znormativs.DEL_FLAG = 0 AND '
          + '((s <= ''' + s + ''') and (po >= ''' + s + ''')) LIMIT 1;');
        Active := true;

        if not Eof then
          EditWinterPrice.Text := FieldByName('num').AsVariant + ' ' + FieldByName('name').AsVariant
        else
          EditWinterPrice.Text := 'не найдено';
      end;
    end
    else
    begin
      with qrTemp do
      begin
        Active := False;
        s := qrNormativ.FieldByName('NumberNormative').AsString;
        SQL.Clear;
        SQL.Add('SELECT num, name FROM znormativs WHERE znormativs.ZNORMATIVS_ID=' +
          qrNormativ.FieldByName('ZNORMATIVS_ID').AsString);
        Active := true;

        if not Eof then
          EditWinterPrice.Text := FieldByName('num').AsVariant + ' ' + FieldByName('name').AsVariant
        else
          EditWinterPrice.Text := 'не найдено';
      end;
    end;
  except
    on e: Exception do
      MessageBox(0, PChar('При получении значений зимнего удорожания возникла ошибка:' + sLineBreak +
        sLineBreak + e.Message), CaptionFrame, MB_ICONERROR + MB_OK + mb_TaskModal);
  end;
end;

procedure TFrameRates.grNCCanEditCell(Grid: TJvDBGrid; Field: TField; var AllowEdit: Boolean);
begin
  AllowEdit := (Field = qrNC.FieldByName('OBJ_VALUE')) and (qrNC.FieldByName('FL_PART_NAME').AsInteger = 0);
end;

procedure TFrameRates.grNCDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer;
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

  with (Sender AS TJvDBGrid).Canvas do
  begin
    // Если заголовок
    if qrNC.FieldByName('FL_PART_NAME').Value = 1 then
    begin
      Font.Style := Font.Style + [fsBold];
      Brush.Color := RGB(106, 116, 157);
      Font.Color := PS.FontSelectRow;
      { if Column.FieldName = 'OBJ_NAME' then
        Column.Alignment := taCenter; }
    end;
    { else if Column.FieldName = 'OBJ_NAME' then
      Column.Alignment := taLeftJustify; }

  end;

  (Sender AS TJvDBGrid).DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TFrameRates.grNCEnter(Sender: TObject);
begin
  if qrNormativ.State in [dsInsert] then
    qrNormativ.Post;
end;

procedure TFrameRates.grNCResize(Sender: TObject);
begin
  if not(Sender AS TJvDBGrid).Showing then
    Exit;
  if (Sender AS TJvDBGrid).DataSource.DataSet.RecordCount > (Sender AS TJvDBGrid).VisibleRowCount then
    (Sender AS TJvDBGrid).ScrollBars := ssVertical
  else
    (Sender AS TJvDBGrid).ScrollBars := ssNone;
end;

procedure TFrameRates.grRatesDblClick(Sender: TObject);
begin
  // Если разрешено добавлять данные из фрейма
  if AllowAddition then
    FormCalculationEstimate.AddRate(qrNormativ.FieldByName('IdNormative').AsInteger);
end;

procedure TFrameRates.grRatesEnter(Sender: TObject);
begin
  FrameStatusBar.InsertText(2, '-1'); // Поиск по столбцу есть
  // R EditRate.Text := '';
  // LoadKeyboardLayout('00000419', KLF_ACTIVATE); // Русский
  // LoadKeyboardLayout('00000409', KLF_ACTIVATE); // Английский

end;

procedure TFrameRates.grRatesExit(Sender: TObject);
begin
  FrameStatusBar.InsertText(2, '');
  // R EditRate.Text := '';
end;

end.
