unit TravelList;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Vcl.DBCtrls, Vcl.StdCtrls, Vcl.ExtCtrls, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids,
  Vcl.DBGrids, JvExDBGrids, JvDBGrid, Tools, Main, Vcl.ComCtrls, JvComponentBase, JvFormPlacement,
  System.UITypes, Vcl.Imaging.pngimage;

type
  TfTravelList = class(TSmForm)
    qrObject: TFDQuery;
    dsObject: TDataSource;
    pnlTop: TPanel;
    lbl1: TLabel;
    dblkcbbNAME: TDBLookupComboBox;
    pnl1: TPanel;
    qrTravel: TFDQuery;
    dsTravel: TDataSource;
    dbnvgr1: TDBNavigator;
    pgc1: TPageControl;
    ts1: TTabSheet;
    ts2: TTabSheet;
    ts3: TTabSheet;
    grTravel: TJvDBGrid;
    grTravelWork: TJvDBGrid;
    grWorkerDepartment: TJvDBGrid;
    qrTravelWork: TFDQuery;
    dsTravelWork: TDataSource;
    qrWorkerDepartment: TFDQuery;
    dsWorkerDepartment: TDataSource;
    spl1: TSplitter;
    pnlTravel: TPanel;
    FormStorage: TJvFormStorage;
    spl2: TSplitter;
    pnlTravelWork: TPanel;
    spl3: TSplitter;
    pnlWorkerDepartment: TPanel;
    imgNoData: TImage;
    img1: TImage;
    img2: TImage;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure qrTravelNewRecord(DataSet: TDataSet);
    procedure pgc1Change(Sender: TObject);
    procedure qrTravelAfterScroll(DataSet: TDataSet);
    procedure qrTravelBeforePost(DataSet: TDataSet);
    procedure qrTravelAfterPost(DataSet: TDataSet);
    procedure qrTravelWorkAfterScroll(DataSet: TDataSet);
    procedure qrTravelWorkAfterPost(DataSet: TDataSet);
    procedure qrTravelWorkBeforePost(DataSet: TDataSet);
    procedure qrWorkerDepartmentAfterScroll(DataSet: TDataSet);
    procedure qrWorkerDepartmentAfterPost(DataSet: TDataSet);
    procedure qrWorkerDepartmentBeforePost(DataSet: TDataSet);
    procedure grTravelDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure grTravelWorkDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer;
      Column: TColumn; State: TGridDrawState);
    procedure grWorkerDepartmentDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer;
      Column: TColumn; State: TGridDrawState);
    procedure qrTravelAfterOpen(DataSet: TDataSet);
    procedure qrTravelWorkAfterOpen(DataSet: TDataSet);
    procedure qrWorkerDepartmentAfterOpen(DataSet: TDataSet);
  private
  public
    defIdEstimate: Integer; // ид сметы и акта по умолчанию
  end;

var
  fTravelList: TfTravelList;

implementation

{$R *.dfm}

uses CalcTravel, CalcTravelWork, CalcWorkerDepartment, DataModule,
  GlobsAndConst, ObjectsAndEstimates, CalculationEstimate;

procedure TfTravelList.FormActivate(Sender: TObject);
begin
  // Если нажата клавиша Ctrl и выбираем форму, то делаем
  // каскадирование с переносом этой формы на передний план
  FormMain.CascadeForActiveWindow;
  // Делаем нажатой кнопку активной формы (на главной форме внизу)
  FormMain.SelectButtonActiveWindow(Caption);
end;

procedure TfTravelList.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  // Закрываем формы
  if Assigned(fCalcTravel) then
    fCalcTravel.Release;
  if Assigned(fCalcTravelWork) then
    fCalcTravelWork.Release;
  if Assigned(fCalcWorkerDepartment) then
    fCalcWorkerDepartment.Release;

  Action := caFree;
end;

procedure TfTravelList.FormCreate(Sender: TObject);
  procedure LocateObject(Object_ID: Integer);
  begin
    dblkcbbNAME.KeyValue := Object_ID;
  end;

begin
  inherited;
  // Создаём кнопку от этого окна (на главной форме внизу)
  FormMain.CreateButtonOpenWindow(Caption, Caption, Self, 1);

  qrObject.Active := True;

  if Assigned(fObjectsAndEstimates) then
  begin
    LocateObject(fObjectsAndEstimates.getCurObject);
    defIdEstimate := fObjectsAndEstimates.qrTreeData.FieldByName('SM_ID').AsInteger;
  end;
  if Assigned(FormCalculationEstimate) then
  begin
    LocateObject(FormCalculationEstimate.IdObject);
    defIdEstimate := FormCalculationEstimate.IdEstimate;
  end;

  pgc1.ActivePageIndex := 0;

  // Создаем форму расчета командировочных
  if (not Assigned(fCalcTravel)) then
    fCalcTravel := TfCalcTravel.Create(pnlTravel);
  // FormMain.ReplaceButtonOpenWindow(Self, fCalcTravel);
  fCalcTravel.BorderStyle := bsNone;
  fCalcTravel.Parent := pnlTravel;
  fCalcTravel.Align := alClient;
  fCalcTravel.Show;

  // Создаем форму разъездного характера работ
  if (not Assigned(fCalcTravelWork)) then
    fCalcTravelWork := TfCalcTravelWork.Create(pnlTravelWork);
  // FormMain.ReplaceButtonOpenWindow(Self, fCalcTravelWork);
  fCalcTravelWork.BorderStyle := bsNone;
  fCalcTravelWork.Parent := pnlTravelWork;
  fCalcTravelWork.Align := alClient;
  // fCalcTravelWork.InitParams;
  fCalcTravelWork.Show;

  // Создаем форму перевозки рабочих
  if (not Assigned(fCalcWorkerDepartment)) then
    fCalcWorkerDepartment := TfCalcWorkerDepartment.Create(pnlWorkerDepartment);
  // FormMain.ReplaceButtonOpenWindow(Self, fCalcWorkerDepartment);
  fCalcWorkerDepartment.BorderStyle := bsNone;
  fCalcWorkerDepartment.Parent := pnlWorkerDepartment;
  fCalcWorkerDepartment.Align := alClient;
  // fCalcWorkerDepartment.InitParams;
  fCalcWorkerDepartment.Show;

  pgc1Change(Self);
end;

procedure TfTravelList.FormDestroy(Sender: TObject);
begin
  fTravelList := nil;
  // Удаляем кнопку от этого окна (на главной форме внизу)
  FormMain.DeleteButtonCloseWindow(Caption);
end;

procedure TfTravelList.grTravelDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer;
  Column: TColumn; State: TGridDrawState);
begin
  with grTravel.Canvas do
  begin
    Brush.Color := PS.BackgroundRows;
    Font.Color := PS.FontRows;

    if (gdSelected in State) then // Ячейка в фокусе
    begin
      Brush.Color := PS.BackgroundSelectCell;
      Font.Color := PS.FontSelectCell;
      Font.Style := Font.Style + [fsBold];
    end;
  end;
  grTravel.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfTravelList.grTravelWorkDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer;
  Column: TColumn; State: TGridDrawState);
begin
  with grTravelWork.Canvas do
  begin
    Brush.Color := PS.BackgroundRows;
    Font.Color := PS.FontRows;

    if (gdSelected in State) then // Ячейка в фокусе
    begin
      Brush.Color := PS.BackgroundSelectCell;
      Font.Color := PS.FontSelectCell;
      Font.Style := Font.Style + [fsBold];
    end;
  end;
  grTravelWork.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfTravelList.grWorkerDepartmentDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer;
  Column: TColumn; State: TGridDrawState);
begin
  with grWorkerDepartment.Canvas do
  begin
    Brush.Color := PS.BackgroundRows;
    Font.Color := PS.FontRows;

    if (gdSelected in State) then // Ячейка в фокусе
    begin
      Brush.Color := PS.BackgroundSelectCell;
      Font.Color := PS.FontSelectCell;
      Font.Style := Font.Style + [fsBold];
    end;
  end;
  grWorkerDepartment.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfTravelList.pgc1Change(Sender: TObject);
begin
  case pgc1.ActivePageIndex of
    0:
      begin
        dbnvgr1.DataSource := dsTravel;
        if not(qrTravel.State in [dsInsert, dsEdit]) then
          CloseOpen(qrTravel);
      end;
    1:
      begin
        dbnvgr1.DataSource := dsTravelWork;
        if not(qrTravelWork.State in [dsInsert, dsEdit]) then
          CloseOpen(qrTravelWork);
      end;
    2:
      begin
        dbnvgr1.DataSource := dsWorkerDepartment;
        if not(qrWorkerDepartment.State in [dsInsert, dsEdit]) then
          CloseOpen(qrWorkerDepartment);
      end;
  end;
end;

procedure TfTravelList.qrTravelAfterOpen(DataSet: TDataSet);
begin
  if qrTravel.IsEmpty then
    qrTravel.Insert
  else
  begin
    if defIdEstimate <> 0 then
    begin
      if not qrTravel.Locate('id_estimate', defIdEstimate, []) then
        qrTravel.Insert;
    end;
  end;

  qrTravelAfterScroll(DataSet);
end;

procedure TfTravelList.qrTravelAfterPost(DataSet: TDataSet);
begin
  CloseOpen(qrTravel);
end;

procedure TfTravelList.qrTravelAfterScroll(DataSet: TDataSet);
begin
  if Assigned(fCalcTravel) then
  begin
    fCalcTravel.Visible := CheckQrActiveEmpty(qrTravel);
    if fCalcTravel.Visible then
      fCalcTravel.InitParams;
  end;
end;

procedure TfTravelList.qrTravelBeforePost(DataSet: TDataSet);
begin
  case Application.MessageBox('Сохранить изменения в документе?', 'Расчет', MB_YESNOCANCEL + MB_ICONQUESTION +
    MB_TOPMOST) of
    IDCANCEL:
      Abort;
    IDNO:
      DataSet.Cancel;
    IDYES:
      begin
        if fCalcTravel.qrCalc.IsEmpty then
        begin
          if fCalcTravel.cbbSource.ItemIndex = 0 then
            Application.MessageBox('Не указан акт!', 'Расчет командировочных',
              MB_OK + MB_ICONSTOP + MB_TOPMOST)
          else
            Application.MessageBox('Не указана смета!', 'Расчет командировочных',
              MB_OK + MB_ICONSTOP + MB_TOPMOST);
          Abort;
        end;
        fCalcTravel.qrCalc.Last;
        qrTravel.FieldByName('summ').Value := fCalcTravel.qrCalc.FieldByName('TOTAL').Value;
      end;
  end;
end;

procedure TfTravelList.qrTravelNewRecord(DataSet: TDataSet);
var
  NewId: Integer;
begin
  DM.qrDifferent.Active := False;
  DM.qrDifferent.SQL.Text := 'SELECT GetNewID(:IDType)';
  if DataSet = qrTravel then
    DM.qrDifferent.ParamByName('IDType').Value := C_ID_TRAVEL
  else if DataSet = qrTravelWork then
    DM.qrDifferent.ParamByName('IDType').Value := C_ID_TRWORK
  else if DataSet = qrWorkerDepartment then
    DM.qrDifferent.ParamByName('IDType').Value := C_ID_WORKDEP
  else
    raise Exception.Create('Неизвестный DataSet.');
  DM.qrDifferent.Active := True;
  NewId := 0;
  if not DM.qrDifferent.Eof then
    NewId := DM.qrDifferent.Fields[0].AsInteger;
  DM.qrDifferent.Active := False;

  if DataSet = qrTravel then
    DataSet.FieldByName('travel_id').AsInteger := NewId
  else if DataSet = qrTravelWork then
    DataSet.FieldByName('travel_work_id').AsInteger := NewId
  else if DataSet = qrWorkerDepartment then
    DataSet.FieldByName('worker_department_id').AsInteger := NewId;

  DataSet.FieldByName('OnDate').AsDateTime := Now;
  if defIdEstimate <> 0 then
  begin
    DataSet.FieldByName('SM_ID').Value := defIdEstimate;
    DataSet.FieldByName('SOURCE_TYPE').Value := 1;
    DataSet.FieldByName('NAME').Value := FastSelectSQLOne('SELECT NAME FROM smetasourcedata WHERE SM_ID=:0',
      VarArrayOf([defIdEstimate]));
  end;
end;

procedure TfTravelList.qrTravelWorkAfterOpen(DataSet: TDataSet);
begin
  if qrTravelWork.IsEmpty then
    qrTravelWork.Insert
  else
  begin
    if defIdEstimate <> 0 then
    begin
      if not qrTravelWork.Locate('id_estimate', defIdEstimate, []) then
        qrTravelWork.Insert;
    end;
  end;

  qrTravelWorkAfterScroll(DataSet);
end;

procedure TfTravelList.qrTravelWorkAfterPost(DataSet: TDataSet);
begin
  CloseOpen(qrTravelWork);
end;

procedure TfTravelList.qrTravelWorkAfterScroll(DataSet: TDataSet);
begin
  if Assigned(fCalcTravelWork) then
  begin
    fCalcTravelWork.Visible := CheckQrActiveEmpty(qrTravelWork);
    if fCalcTravelWork.Visible then
      fCalcTravelWork.InitParams;
  end;
end;

procedure TfTravelList.qrTravelWorkBeforePost(DataSet: TDataSet);
begin
  case Application.MessageBox('Сохранить изменения в документе?', 'Расчет', MB_YESNOCANCEL + MB_ICONQUESTION +
    MB_TOPMOST) of
    IDCANCEL:
      Abort;
    IDNO:
      DataSet.Cancel;
    IDYES:
      begin
        if fCalcTravelWork.qrCalc.IsEmpty then
        begin
          if fCalcTravelWork.cbbSource.ItemIndex = 0 then
            Application.MessageBox('Не указан акт!', 'Расчет командировочных',
              MB_OK + MB_ICONSTOP + MB_TOPMOST)
          else
            Application.MessageBox('Не указана смета!', 'Расчет командировочных',
              MB_OK + MB_ICONSTOP + MB_TOPMOST);
          Abort;
        end;
        fCalcTravelWork.qrCalc.Last;
        qrTravelWork.FieldByName('summ').Value := fCalcTravelWork.qrCalc.FieldByName('TOTAL').Value;
      end;
  end;
end;

procedure TfTravelList.qrWorkerDepartmentAfterOpen(DataSet: TDataSet);
begin
  if qrWorkerDepartment.IsEmpty then
    qrWorkerDepartment.Insert
  else
  begin
    if defIdEstimate <> 0 then
    begin
      if not qrWorkerDepartment.Locate('id_estimate', defIdEstimate, []) then
        qrWorkerDepartment.Insert;
    end;
  end;

  qrWorkerDepartmentAfterScroll(DataSet);
end;

procedure TfTravelList.qrWorkerDepartmentAfterPost(DataSet: TDataSet);
begin
  CloseOpen(qrWorkerDepartment);
end;

procedure TfTravelList.qrWorkerDepartmentAfterScroll(DataSet: TDataSet);
begin
  if Assigned(fCalcWorkerDepartment) then
  begin
    fCalcWorkerDepartment.Visible := CheckQrActiveEmpty(qrWorkerDepartment);
    if fCalcWorkerDepartment.Visible then
      fCalcWorkerDepartment.InitParams;
  end;
end;

procedure TfTravelList.qrWorkerDepartmentBeforePost(DataSet: TDataSet);
begin
  case Application.MessageBox('Сохранить изменения в документе?', 'Расчет', MB_YESNOCANCEL + MB_ICONQUESTION +
    MB_TOPMOST) of
    IDCANCEL:
      Abort;
    IDNO:
      DataSet.Cancel;
    IDYES:
      begin
        if fCalcWorkerDepartment.qrCalc.IsEmpty then
        begin
          if fCalcWorkerDepartment.cbbSource.ItemIndex = 0 then
            Application.MessageBox('Не указан акт!', 'Расчет командировочных',
              MB_OK + MB_ICONSTOP + MB_TOPMOST)
          else
            Application.MessageBox('Не указана смета!', 'Расчет командировочных',
              MB_OK + MB_ICONSTOP + MB_TOPMOST);
          Abort;
        end;
        fCalcWorkerDepartment.qrCalc.Last;
        qrWorkerDepartment.FieldByName('summ').Value := fCalcWorkerDepartment.qrCalc.FieldByName
          ('TOTAL').Value;
      end;
  end;
end;

end.
