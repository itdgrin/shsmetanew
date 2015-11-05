unit CalcWorkerDepartment;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, Tools,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask, Vcl.DBCtrls, Vcl.Grids,
  Vcl.DBGrids, JvExDBGrids, JvDBGrid, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, JvComponentBase, JvFormPlacement, System.UITypes;

type
  TfCalcWorkerDepartment = class(TSmForm)
    lbl1: TLabel;
    dbedtPREPARER: TDBEdit;
    lbl4: TLabel;
    grCalc: TJvDBGrid;
    dsCalc: TDataSource;
    qrCalc: TFDQuery;
    dblkcbbAct: TDBLookupComboBox;
    cbbSource: TComboBox;
    dbchkFL_Full_month: TDBCheckBox;
    qrActList: TFDQuery;
    dsActList: TDataSource;
    qrSmetaList: TFDQuery;
    dsSmetaList: TDataSource;
    dblkcbbSmeta: TDBLookupComboBox;
    FormStorage: TJvFormStorage;
    chkEnableEditing: TCheckBox;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure qrCalcAfterPost(DataSet: TDataSet);
    procedure grCalcKeyPress(Sender: TObject; var Key: Char);
    procedure dblkcbbActClick(Sender: TObject);
    procedure cbbSourceChange(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure qrCalcBeforePost(DataSet: TDataSet);
    procedure chkEnableEditingClick(Sender: TObject);
    procedure grCalcDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
  private
    { Private declarations }

  public
    procedure InitParams;
  end;

var
  fCalcWorkerDepartment: TfCalcWorkerDepartment;

implementation

{$R *.dfm}

uses Main, TravelList, EditExpression;

procedure TfCalcWorkerDepartment.cbbSourceChange(Sender: TObject);
begin
  fTravelList.qrWorkerDepartment.Edit;
  fTravelList.qrWorkerDepartment.FieldByName('SOURCE_TYPE').Value := cbbSource.ItemIndex;
  case cbbSource.ItemIndex of
    0:
      begin
        dblkcbbAct.Visible := True;
        dblkcbbSmeta.Visible := False;
      end;
    1:
      begin
        dblkcbbAct.Visible := False;
        dblkcbbSmeta.Visible := True;
      end;
  end;
end;

procedure TfCalcWorkerDepartment.chkEnableEditingClick(Sender: TObject);
begin
  if chkEnableEditing.Checked then
    grCalc.Options := grCalc.Options - [dgRowSelect] + [dgEditing]
  else
    grCalc.Options := grCalc.Options - [dgEditing] + [dgRowSelect];
end;

procedure TfCalcWorkerDepartment.dblkcbbActClick(Sender: TObject);
begin
  if Assigned(fTravelList) and (Sender is TDBLookupComboBox)  then
    fTravelList.qrWorkerDepartment.FieldByName('NAME').AsString := (Sender as TDBLookupComboBox).Text;
  Application.ProcessMessages;
  InitParams;
end;

procedure TfCalcWorkerDepartment.FormActivate(Sender: TObject);
begin
  // Если нажата клавиша Ctrl и выбираем форму, то делаем
  // каскадирование с переносом этой формы на передний план
  FormMain.CascadeForActiveWindow;
  // Делаем нажатой кнопку активной формы (на главной форме внизу)
  FormMain.SelectButtonActiveWindow(Caption);
end;

procedure TfCalcWorkerDepartment.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  // FormMain.ReplaceButtonOpenWindow(Self, fTravelList);
  Action := caFree;
end;

procedure TfCalcWorkerDepartment.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  case Application.MessageBox('Сохранить изменения в документе?', 'Расчет', MB_YESNOCANCEL + MB_ICONQUESTION +
    MB_TOPMOST) of
    IDCANCEL:
      begin
        CanClose := False;
      end;
    IDYES:
      begin
        if qrCalc.IsEmpty then
        begin
          if cbbSource.ItemIndex = 0 then
            Application.MessageBox('Не указан акт!', 'Расчет командировочных',
              MB_OK + MB_ICONSTOP + MB_TOPMOST)
          else
            Application.MessageBox('Не указана смета!', 'Расчет командировочных',
              MB_OK + MB_ICONSTOP + MB_TOPMOST);
          Abort;
        end;
        qrCalc.Last;
        fTravelList.qrWorkerDepartment.FieldByName('summ').AsInteger := qrCalc.FieldByName('TOTAL').AsInteger;
        if fTravelList.qrWorkerDepartment.State in [dsEdit, dsInsert] then
          fTravelList.qrWorkerDepartment.Post;
        CanClose := True;
      end;
    IDNO:
      begin
        fTravelList.qrWorkerDepartment.Cancel;
        CanClose := True;
      end;
  end;
end;

procedure TfCalcWorkerDepartment.FormCreate(Sender: TObject);
begin
  inherited;
  CloseOpen(qrActList);
  CloseOpen(qrSmetaList);
  dbchkFL_Full_month.OnClick := dblkcbbActClick;
end;

procedure TfCalcWorkerDepartment.FormDestroy(Sender: TObject);
begin
  // fTravelList.Show;
  fCalcWorkerDepartment := nil;
end;

procedure TfCalcWorkerDepartment.InitParams;
begin
  if fTravelList = nil then
    Exit;

  if (fTravelList.qrWorkerDepartment.FieldByName('SOURCE_TYPE').AsInteger = 1) then
  begin
    cbbSource.ItemIndex := 1;
    dblkcbbAct.Visible := False;
    dblkcbbSmeta.Visible := True;
    dblkcbbSmeta.KeyValue := fTravelList.qrWorkerDepartment.FieldByName('ID_ESTIMATE').Value;
  end
  else
  begin
    cbbSource.ItemIndex := 0;
    dblkcbbAct.Visible := True;
    dblkcbbSmeta.Visible := False;
    dblkcbbAct.KeyValue := fTravelList.qrWorkerDepartment.FieldByName('ID_ACT').Value;
  end;
  // Заполняем параметры расчета
  case cbbSource.ItemIndex of
    // акт
    0:
      begin
        qrCalc.ParamByName('ID_ACT').Value := fTravelList.qrWorkerDepartment.FieldByName('ID_ACT').Value;
        qrCalc.ParamByName('ID_ESTIMATE').Value := null;
      end;
    // смета
    1:
      begin
        qrCalc.ParamByName('ID_ACT').Value := null;
        qrCalc.ParamByName('ID_ESTIMATE').Value := fTravelList.qrWorkerDepartment.FieldByName
          ('ID_ESTIMATE').Value;
      end;
  end;
  qrCalc.ParamByName('FLFullMonth').Value := fTravelList.qrWorkerDepartment.FieldByName
    ('FL_Full_month').Value;
  qrCalc.ParamByName('PLACE_COUNT').Value := fTravelList.qrWorkerDepartment.FieldByName('PLACE_COUNT').Value;
  qrCalc.ParamByName('EMbyHVR').Value := fTravelList.qrWorkerDepartment.FieldByName('EMbyHVR').Value;
  qrCalc.ParamByName('EMbyKM').Value := fTravelList.qrWorkerDepartment.FieldByName('EMbyKM').Value;
  qrCalc.ParamByName('RoadALength').Value := fTravelList.qrWorkerDepartment.FieldByName('RoadALength').Value;
  qrCalc.ParamByName('RoadGLength').Value := fTravelList.qrWorkerDepartment.FieldByName('RoadGLength').Value;
  qrCalc.ParamByName('RoadGrLength').Value := fTravelList.qrWorkerDepartment.FieldByName
    ('RoadGrLength').Value;
  qrCalc.ParamByName('RoadASpeed').Value := fTravelList.qrWorkerDepartment.FieldByName('RoadASpeed').Value;
  qrCalc.ParamByName('RoadGSpeed').Value := fTravelList.qrWorkerDepartment.FieldByName('RoadGSpeed').Value;
  qrCalc.ParamByName('RoadGrSpeed').Value := fTravelList.qrWorkerDepartment.FieldByName('RoadGrSpeed').Value;
  qrCalc.ParamByName('FactDay').Value := fTravelList.qrWorkerDepartment.FieldByName
    ('COUNT_WORK_DAY_IN_MONTH').Value;
  qrCalc.ParamByName('TravelCount').Value := fTravelList.qrWorkerDepartment.FieldByName('TravelCount').Value;
  qrCalc.ParamByName('InOut').Value := fTravelList.qrWorkerDepartment.FieldByName('InOut').Value;
  qrCalc.ParamByName('TimeIN').Value := fTravelList.qrWorkerDepartment.FieldByName('TimeIN').Value;
  qrCalc.ParamByName('TimeOUT').Value := fTravelList.qrWorkerDepartment.FieldByName('TimeOUT').Value;
  qrCalc.ParamByName('auto_mark').Value := fTravelList.qrWorkerDepartment.FieldByName('auto_mark').Value;
  qrCalc.ParamByName('HOUR_IN_DAY').Value := fTravelList.qrWorkerDepartment.FieldByName('HOUR_IN_DAY').Value;
  qrCalc.ParamByName('NORMAT').Value := fTravelList.qrWorkerDepartment.FieldByName('NORMAT').Value;
  qrCalc.ParamByName('NORMATF').Value := fTravelList.qrWorkerDepartment.FieldByName('NORMATF').Value;

  qrCalc.ParamByName('NORM_WORKER_COUNT').Value := fTravelList.qrWorkerDepartment.FieldByName('NORM_WORKER_COUNT').Value;
  qrCalc.ParamByName('NORM_WORKER_COUNTF').Value := fTravelList.qrWorkerDepartment.FieldByName('NORM_WORKER_COUNTF').Value;
  qrCalc.ParamByName('NORM_AUTO_COUNT').Value := fTravelList.qrWorkerDepartment.FieldByName('NORM_AUTO_COUNT').Value;
  qrCalc.ParamByName('NORM_AUTO_COUNTF').Value := fTravelList.qrWorkerDepartment.FieldByName('NORM_AUTO_COUNTF').Value;
  qrCalc.ParamByName('FULL_AUTO_TIME').Value := fTravelList.qrWorkerDepartment.FieldByName('FULL_AUTO_TIME').Value;
  qrCalc.ParamByName('FULL_AUTO_TIMEF').Value := fTravelList.qrWorkerDepartment.FieldByName('FULL_AUTO_TIMEF').Value;
  qrCalc.ParamByName('AUTO_HVR').Value := fTravelList.qrWorkerDepartment.FieldByName('AUTO_HVR').Value;
  qrCalc.ParamByName('AUTO_HVRF').Value := fTravelList.qrWorkerDepartment.FieldByName('AUTO_HVRF').Value;
  qrCalc.ParamByName('AUTOKM').Value := fTravelList.qrWorkerDepartment.FieldByName('AUTOKM').Value;
  qrCalc.ParamByName('AUTOKMF').Value := fTravelList.qrWorkerDepartment.FieldByName('AUTOKMF').Value;
  qrCalc.ParamByName('TOTAL').Value := fTravelList.qrWorkerDepartment.FieldByName('TOTAL').Value;
  qrCalc.ParamByName('TOTALF').Value := fTravelList.qrWorkerDepartment.FieldByName('TOTALF').Value;

  if not VarIsNull(qrCalc.ParamByName('ID_ACT').Value) or
    not VarIsNull(qrCalc.ParamByName('ID_ESTIMATE').Value) then
    CloseOpen(qrCalc)
  else if qrCalc.Active then
    qrCalc.Active := False;
end;

procedure TfCalcWorkerDepartment.grCalcDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer;
  Column: TColumn; State: TGridDrawState);
begin
  with grCalc.Canvas do
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
  grCalc.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfCalcWorkerDepartment.grCalcKeyPress(Sender: TObject; var Key: Char);
begin
  if (Ord(Key) = VK_RETURN) and (qrCalc.State = dsEdit) then
    qrCalc.Post;
end;

procedure TfCalcWorkerDepartment.qrCalcAfterPost(DataSet: TDataSet);
begin
  fTravelList.qrWorkerDepartment.Edit;
  if qrCalc.RecNo = 1 then
    fTravelList.qrWorkerDepartment.FieldByName('auto_mark').AsString := qrCalc.FieldByName('CALC').AsString;
  if qrCalc.RecNo = 2 then
    fTravelList.qrWorkerDepartment.FieldByName('PLACE_COUNT').AsInteger := qrCalc.FieldByName('CALC')
      .AsInteger;
  if qrCalc.RecNo = 3 then
    fTravelList.qrWorkerDepartment.FieldByName('EMbyHVR').AsInteger := qrCalc.FieldByName('CALC').AsInteger;
  if qrCalc.RecNo = 4 then
    fTravelList.qrWorkerDepartment.FieldByName('EMbyKM').AsInteger := qrCalc.FieldByName('CALC').AsInteger;
  if qrCalc.RecNo = 6 then
    fTravelList.qrWorkerDepartment.FieldByName('RoadALength').AsInteger := qrCalc.FieldByName('CALC')
      .AsInteger;

  if qrCalc.RecNo = 7 then
    fTravelList.qrWorkerDepartment.FieldByName('RoadGLength').AsInteger := qrCalc.FieldByName('CALC')
      .AsInteger;
  if qrCalc.RecNo = 8 then
    fTravelList.qrWorkerDepartment.FieldByName('RoadGrLength').AsInteger := qrCalc.FieldByName('CALC')
      .AsInteger;
  if qrCalc.RecNo = 10 then
    fTravelList.qrWorkerDepartment.FieldByName('RoadASpeed').AsInteger := qrCalc.FieldByName('CALC')
      .AsInteger;
  if qrCalc.RecNo = 11 then
    fTravelList.qrWorkerDepartment.FieldByName('RoadGSpeed').AsInteger := qrCalc.FieldByName('CALC')
      .AsInteger;
  if qrCalc.RecNo = 12 then
    fTravelList.qrWorkerDepartment.FieldByName('RoadGrSpeed').AsInteger := qrCalc.FieldByName('CALC')
      .AsInteger;
  if qrCalc.RecNo = 13 then
    fTravelList.qrWorkerDepartment.FieldByName('HOUR_IN_DAY').AsFloat := qrCalc.FieldByName('CALC').AsFloat;
  if qrCalc.RecNo = 14 then
    fTravelList.qrWorkerDepartment.FieldByName('COUNT_WORK_DAY_IN_MONTH').AsInteger :=
      qrCalc.FieldByName('CALC').AsInteger;
  if qrCalc.RecNo = 15 then
    fTravelList.qrWorkerDepartment.FieldByName('TravelCount').AsInteger := qrCalc.FieldByName('CALC')
      .AsInteger;
  if qrCalc.RecNo = 16 then
    fTravelList.qrWorkerDepartment.FieldByName('InOut').AsInteger := qrCalc.FieldByName('CALC').AsInteger;
  if qrCalc.RecNo = 17 then
    fTravelList.qrWorkerDepartment.FieldByName('TimeIN').AsInteger := qrCalc.FieldByName('CALC').AsInteger;
  if qrCalc.RecNo = 18 then
    fTravelList.qrWorkerDepartment.FieldByName('TimeOUT').AsInteger := qrCalc.FieldByName('CALC').AsInteger;
  InitParams;
end;

procedure TfCalcWorkerDepartment.qrCalcBeforePost(DataSet: TDataSet);
begin
  // Нормативная трудоемкость
  // Если изменили результат вычисления
  if (qrCalc.RecNo = 19) and (qrCalc.FieldByName('TOTAL').Value <> qrCalc.FieldByName('TOTAL').OldValue) then
  begin
    fTravelList.qrWorkerDepartment.Edit;
    fTravelList.qrWorkerDepartment.FieldByName('NORMAT').Value := qrCalc.FieldByName('TOTAL').Value;
  end;
  // Если изменили формулу
  if (qrCalc.RecNo = 19) and (qrCalc.FieldByName('CALC').Value <> qrCalc.FieldByName('CALC').OldValue) then
  begin
    fTravelList.qrWorkerDepartment.Edit;
    if qrCalc.FieldByName('CALC').Value = '' then
    begin
      fTravelList.qrWorkerDepartment.FieldByName('NORMATF').Value := null;
      fTravelList.qrWorkerDepartment.FieldByName('NORMAT').Value := null;
    end
    else
    begin
      fTravelList.qrWorkerDepartment.FieldByName('NORMATF').Value := qrCalc.FieldByName('CALC').Value;
      fTravelList.qrWorkerDepartment.FieldByName('NORMAT').Value :=
        CalcExpression(qrCalc.FieldByName('CALC').AsString, False);
    end;
  end;

  //
  // Если изменили результат вычисления
  if (qrCalc.RecNo = 20) and (qrCalc.FieldByName('TOTAL').Value <> qrCalc.FieldByName('TOTAL').OldValue) then
  begin
    fTravelList.qrWorkerDepartment.Edit;
    fTravelList.qrWorkerDepartment.FieldByName('NORM_WORKER_COUNT').Value := qrCalc.FieldByName('TOTAL').Value;
  end;
  // Если изменили формулу
  if (qrCalc.RecNo = 20) and (qrCalc.FieldByName('CALC').Value <> qrCalc.FieldByName('CALC').OldValue) then
  begin
    fTravelList.qrWorkerDepartment.Edit;
    if qrCalc.FieldByName('CALC').Value = '' then
    begin
      fTravelList.qrWorkerDepartment.FieldByName('NORM_WORKER_COUNTF').Value := null;
      fTravelList.qrWorkerDepartment.FieldByName('NORM_WORKER_COUNT').Value := null;
    end
    else
    begin
      fTravelList.qrWorkerDepartment.FieldByName('NORM_WORKER_COUNTF').Value := qrCalc.FieldByName('CALC').Value;
      fTravelList.qrWorkerDepartment.FieldByName('NORM_WORKER_COUNT').Value :=
        CalcExpression(qrCalc.FieldByName('CALC').AsString, False);
    end;
  end;

  //
  // Если изменили результат вычисления
  if (qrCalc.RecNo = 21) and (qrCalc.FieldByName('TOTAL').Value <> qrCalc.FieldByName('TOTAL').OldValue) then
  begin
    fTravelList.qrWorkerDepartment.Edit;
    fTravelList.qrWorkerDepartment.FieldByName('NORM_AUTO_COUNT').Value := qrCalc.FieldByName('TOTAL').Value;
  end;
  // Если изменили формулу
  if (qrCalc.RecNo = 21) and (qrCalc.FieldByName('CALC').Value <> qrCalc.FieldByName('CALC').OldValue) then
  begin
    fTravelList.qrWorkerDepartment.Edit;
    if qrCalc.FieldByName('CALC').Value = '' then
    begin
      fTravelList.qrWorkerDepartment.FieldByName('NORM_AUTO_COUNTF').Value := null;
      fTravelList.qrWorkerDepartment.FieldByName('NORM_AUTO_COUNT').Value := null;
    end
    else
    begin
      fTravelList.qrWorkerDepartment.FieldByName('NORM_AUTO_COUNTF').Value := qrCalc.FieldByName('CALC').Value;
      fTravelList.qrWorkerDepartment.FieldByName('NORM_AUTO_COUNT').Value :=
        CalcExpression(qrCalc.FieldByName('CALC').AsString, False);
    end;
  end;

  //
  // Если изменили результат вычисления
  if (qrCalc.RecNo = 22) and (qrCalc.FieldByName('TOTAL').Value <> qrCalc.FieldByName('TOTAL').OldValue) then
  begin
    fTravelList.qrWorkerDepartment.Edit;
    fTravelList.qrWorkerDepartment.FieldByName('FULL_AUTO_TIME').Value := qrCalc.FieldByName('TOTAL').Value;
  end;
  // Если изменили формулу
  if (qrCalc.RecNo = 22) and (qrCalc.FieldByName('CALC').Value <> qrCalc.FieldByName('CALC').OldValue) then
  begin
    fTravelList.qrWorkerDepartment.Edit;
    if qrCalc.FieldByName('CALC').Value = '' then
    begin
      fTravelList.qrWorkerDepartment.FieldByName('FULL_AUTO_TIMEF').Value := null;
      fTravelList.qrWorkerDepartment.FieldByName('FULL_AUTO_TIME').Value := null;
    end
    else
    begin
      fTravelList.qrWorkerDepartment.FieldByName('FULL_AUTO_TIMEF').Value := qrCalc.FieldByName('CALC').Value;
      fTravelList.qrWorkerDepartment.FieldByName('FULL_AUTO_TIME').Value :=
        CalcExpression(qrCalc.FieldByName('CALC').AsString, False);
    end;
  end;

  //
  // Если изменили результат вычисления
  if (qrCalc.RecNo = 23) and (qrCalc.FieldByName('TOTAL').Value <> qrCalc.FieldByName('TOTAL').OldValue) then
  begin
    fTravelList.qrWorkerDepartment.Edit;
    fTravelList.qrWorkerDepartment.FieldByName('AUTO_HVR').Value := qrCalc.FieldByName('TOTAL').Value;
  end;
  // Если изменили формулу
  if (qrCalc.RecNo = 23) and (qrCalc.FieldByName('CALC').Value <> qrCalc.FieldByName('CALC').OldValue) then
  begin
    fTravelList.qrWorkerDepartment.Edit;
    if qrCalc.FieldByName('CALC').Value = '' then
    begin
      fTravelList.qrWorkerDepartment.FieldByName('AUTO_HVRF').Value := null;
      fTravelList.qrWorkerDepartment.FieldByName('AUTO_HVR').Value := null;
    end
    else
    begin
      fTravelList.qrWorkerDepartment.FieldByName('AUTO_HVRF').Value := qrCalc.FieldByName('CALC').Value;
      fTravelList.qrWorkerDepartment.FieldByName('AUTO_HVR').Value :=
        CalcExpression(qrCalc.FieldByName('CALC').AsString, False);
    end;
  end;

  //
  // Если изменили результат вычисления
  if (qrCalc.RecNo = 24) and (qrCalc.FieldByName('TOTAL').Value <> qrCalc.FieldByName('TOTAL').OldValue) then
  begin
    fTravelList.qrWorkerDepartment.Edit;
    fTravelList.qrWorkerDepartment.FieldByName('AUTOKM').Value := qrCalc.FieldByName('TOTAL').Value;
  end;
  // Если изменили формулу
  if (qrCalc.RecNo = 24) and (qrCalc.FieldByName('CALC').Value <> qrCalc.FieldByName('CALC').OldValue) then
  begin
    fTravelList.qrWorkerDepartment.Edit;
    if qrCalc.FieldByName('CALC').Value = '' then
    begin
      fTravelList.qrWorkerDepartment.FieldByName('AUTOKMF').Value := null;
      fTravelList.qrWorkerDepartment.FieldByName('AUTOKM').Value := null;
    end
    else
    begin
      fTravelList.qrWorkerDepartment.FieldByName('AUTOKMF').Value := qrCalc.FieldByName('CALC').Value;
      fTravelList.qrWorkerDepartment.FieldByName('AUTOKM').Value :=
        CalcExpression(qrCalc.FieldByName('CALC').AsString, False);
    end;
  end;

  //
  // Если изменили результат вычисления
  if (qrCalc.RecNo = 25) and (qrCalc.FieldByName('TOTAL').Value <> qrCalc.FieldByName('TOTAL').OldValue) then
  begin
    fTravelList.qrWorkerDepartment.Edit;
    fTravelList.qrWorkerDepartment.FieldByName('TOTAL').Value := qrCalc.FieldByName('TOTAL').Value;
  end;
  // Если изменили формулу
  if (qrCalc.RecNo = 25) and (qrCalc.FieldByName('CALC').Value <> qrCalc.FieldByName('CALC').OldValue) then
  begin
    fTravelList.qrWorkerDepartment.Edit;
    if qrCalc.FieldByName('CALC').Value = '' then
    begin
      fTravelList.qrWorkerDepartment.FieldByName('TOTALF').Value := null;
      fTravelList.qrWorkerDepartment.FieldByName('TOTAL').Value := null;
    end
    else
    begin
      fTravelList.qrWorkerDepartment.FieldByName('TOTALF').Value := qrCalc.FieldByName('CALC').Value;
      fTravelList.qrWorkerDepartment.FieldByName('TOTAL').Value :=
        CalcExpression(qrCalc.FieldByName('CALC').AsString, False);
    end;
  end;
end;

end.
