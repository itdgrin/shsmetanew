unit CalcTravel;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask, Vcl.DBCtrls, Vcl.Grids,
  Vcl.DBGrids, JvExDBGrids, JvDBGrid, Tools, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, JvComponentBase, JvFormPlacement, System.UITypes;

type
  TfCalcTravel = class(TSmForm)
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
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure qrCalcAfterPost(DataSet: TDataSet);
    procedure grCalcKeyPress(Sender: TObject; var Key: Char);
    procedure dblkcbbActClick(Sender: TObject);
    procedure cbbSourceChange(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormActivate(Sender: TObject);
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
  fCalcTravel: TfCalcTravel;

implementation

{$R *.dfm}

uses Main, TravelList, EditExpression;

procedure TfCalcTravel.cbbSourceChange(Sender: TObject);
begin
  fTravelList.qrTravel.Edit;
  fTravelList.qrTravel.FieldByName('SOURCE_TYPE').Value := cbbSource.ItemIndex;
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

procedure TfCalcTravel.chkEnableEditingClick(Sender: TObject);
begin
  if chkEnableEditing.Checked then
    grCalc.Options := grCalc.Options - [dgRowSelect] + [dgEditing]
  else
    grCalc.Options := grCalc.Options - [dgEditing] + [dgRowSelect];
end;

procedure TfCalcTravel.dblkcbbActClick(Sender: TObject);
begin
  if Assigned(fTravelList) and (Sender is TDBLookupComboBox) then
    fTravelList.qrTravel.FieldByName('NAME').AsString := (Sender as TDBLookupComboBox).Text;
  Application.ProcessMessages;
  InitParams;
end;

procedure TfCalcTravel.FormActivate(Sender: TObject);
begin
  // Если нажата клавиша Ctrl и выбираем форму, то делаем
  // каскадирование с переносом этой формы на передний план
  FormMain.CascadeForActiveWindow;
  // Делаем нажатой кнопку активной формы (на главной форме внизу)
  FormMain.SelectButtonActiveWindow(Caption);
end;

procedure TfCalcTravel.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  // FormMain.ReplaceButtonOpenWindow(Self, fTravelList);
  Action := caFree;
end;

procedure TfCalcTravel.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
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
        fTravelList.qrTravel.FieldByName('summ').AsInteger := qrCalc.FieldByName('TOTAL').AsInteger;
        if fTravelList.qrTravel.State in [dsEdit, dsInsert] then
          fTravelList.qrTravel.Post;
        CloseOpen(fTravelList.qrTravel);
        CanClose := True;
      end;
    IDNO:
      begin
        fTravelList.qrTravel.Cancel;
        CanClose := True;
      end;
  end;
end;

procedure TfCalcTravel.FormCreate(Sender: TObject);
begin
  inherited;
  CloseOpen(qrActList);
  CloseOpen(qrSmetaList);
  dbchkFL_Full_month.OnClick := dblkcbbActClick;
end;

procedure TfCalcTravel.FormDestroy(Sender: TObject);
begin
  // fTravelList.Show;
  fCalcTravel := nil;
end;

procedure TfCalcTravel.InitParams;
begin
  if fTravelList = nil then
    Exit;

  if (fTravelList.qrTravel.FieldByName('SOURCE_TYPE').AsInteger = 1) then
  begin
    cbbSource.ItemIndex := 1;
    dblkcbbAct.Visible := False;
    dblkcbbSmeta.Visible := True;
    dblkcbbSmeta.KeyValue := fTravelList.qrTravel.FieldByName('SM_ID').Value;
  end
  else
  begin
    cbbSource.ItemIndex := 0;
    dblkcbbAct.Visible := True;
    dblkcbbSmeta.Visible := False;
    dblkcbbAct.KeyValue := fTravelList.qrTravel.FieldByName('SM_ID').Value;
  end;
  // Заполняем параметры расчета
  case cbbSource.ItemIndex of
    // акт
    0:
      begin
        qrCalc.ParamByName('ID_ESTIMATE').Value := fTravelList.qrTravel.FieldByName('SM_ID').Value;
      end;
    // смета
    1:
      begin;
        qrCalc.ParamByName('ID_ESTIMATE').Value := fTravelList.qrTravel.FieldByName('SM_ID').Value;
      end;
  end;
  qrCalc.ParamByName('FLFullMonth').Value := fTravelList.qrTravel.FieldByName('FL_Full_month').Value;
  qrCalc.ParamByName('SUTKI_KOMANDIR').Value := fTravelList.qrTravel.FieldByName('SUTKI_KOMANDIR').Value;
  qrCalc.ParamByName('HOUSING_KOMANDIR').Value := fTravelList.qrTravel.FieldByName('HOUSING_KOMANDIR').Value;
  qrCalc.ParamByName('STOIM_KM').Value := fTravelList.qrTravel.FieldByName('STOIM_KM').Value;
  qrCalc.ParamByName('KM').Value := fTravelList.qrTravel.FieldByName('KM').Value;
  qrCalc.ParamByName('HOUR_IN_DAY').Value := fTravelList.qrTravel.FieldByName('HOUR_IN_DAY').Value;
  qrCalc.ParamByName('COUNT_WORK_DAY_IN_MONTH').Value :=
    fTravelList.qrTravel.FieldByName('COUNT_WORK_DAY_IN_MONTH').Value;
  qrCalc.ParamByName('CUNT_DAY_IN_MONTH').Value := fTravelList.qrTravel.FieldByName
    ('CUNT_DAY_IN_MONTH').Value;
  qrCalc.ParamByName('NORMAT').Value := fTravelList.qrTravel.FieldByName('NORMAT').Value;
  qrCalc.ParamByName('NORMATF').Value := fTravelList.qrTravel.FieldByName('NORMATF').Value;
  qrCalc.ParamByName('SUTKI').Value := fTravelList.qrTravel.FieldByName('SUTKI').Value;
  qrCalc.ParamByName('SUTKIF').Value := fTravelList.qrTravel.FieldByName('SUTKIF').Value;
  qrCalc.ParamByName('KVARTIR').Value := fTravelList.qrTravel.FieldByName('KVARTIR').Value;
  qrCalc.ParamByName('KVARTIRF').Value := fTravelList.qrTravel.FieldByName('KVARTIRF').Value;
  qrCalc.ParamByName('PROEZD').Value := fTravelList.qrTravel.FieldByName('PROEZD').Value;
  qrCalc.ParamByName('PROEZDF').Value := fTravelList.qrTravel.FieldByName('PROEZDF').Value;
  qrCalc.ParamByName('TOTAL').Value := fTravelList.qrTravel.FieldByName('TOTAL').Value;
  qrCalc.ParamByName('TOTALF').Value := fTravelList.qrTravel.FieldByName('TOTALF').Value;

  if not VarIsNull(qrCalc.ParamByName('ID_ESTIMATE').Value) then
    CloseOpen(qrCalc)
  else if qrCalc.Active then
    qrCalc.Active := False;
end;

procedure TfCalcTravel.grCalcDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer;
  Column: TColumn; State: TGridDrawState);
begin
  with grCalc.Canvas do
  begin
    Brush.Color := PS.BackgroundRows;
    Font.Color := PS.FontRows;

    if (gdSelected in State) { or (gdSelected is State) } then // Ячейка в фокусе
    begin
      Brush.Color := PS.BackgroundSelectCell;
      Font.Color := PS.FontSelectCell;
      Font.Style := Font.Style + [fsBold];
    end;
  end;
  grCalc.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfCalcTravel.grCalcKeyPress(Sender: TObject; var Key: Char);
begin
  if (Ord(Key) = VK_RETURN) and (qrCalc.State = dsEdit) then
    qrCalc.Post;
end;

procedure TfCalcTravel.qrCalcAfterPost(DataSet: TDataSet);
begin
  fTravelList.qrTravel.Edit;
  if qrCalc.FieldByName('NUMPP').AsString = '06' then
    fTravelList.qrTravel.FieldByName('SUTKI_KOMANDIR').AsInteger := qrCalc.FieldByName('CALC').AsInteger;
  if qrCalc.FieldByName('NUMPP').AsString = '07' then
    fTravelList.qrTravel.FieldByName('HOUSING_KOMANDIR').AsInteger := qrCalc.FieldByName('CALC').AsInteger;
  if qrCalc.FieldByName('NUMPP').AsString = '08' then
    fTravelList.qrTravel.FieldByName('STOIM_KM').AsInteger := qrCalc.FieldByName('CALC').AsInteger;
  if qrCalc.FieldByName('NUMPP').AsString = '09' then
    fTravelList.qrTravel.FieldByName('KM').AsFloat := qrCalc.FieldByName('CALC').AsInteger;

  if qrCalc.FieldByName('NUMPP').AsString = '10' then
    if qrCalc.FieldByName('CALC').Value = '' then
      fTravelList.qrTravel.FieldByName('HOUR_IN_DAY').Value := null
    else
      fTravelList.qrTravel.FieldByName('HOUR_IN_DAY').Value := qrCalc.FieldByName('CALC').Value;

  if qrCalc.FieldByName('NUMPP').AsString = '11' then
    if qrCalc.FieldByName('CALC').Value = '' then
      fTravelList.qrTravel.FieldByName('COUNT_WORK_DAY_IN_MONTH').Value := null
    else
      fTravelList.qrTravel.FieldByName('COUNT_WORK_DAY_IN_MONTH').Value := qrCalc.FieldByName('CALC').Value;

  if qrCalc.FieldByName('NUMPP').AsString = '12' then
    if qrCalc.FieldByName('CALC').Value = '' then
      fTravelList.qrTravel.FieldByName('CUNT_DAY_IN_MONTH').Value := null
    else
      fTravelList.qrTravel.FieldByName('CUNT_DAY_IN_MONTH').Value := qrCalc.FieldByName('CALC').Value;

  if qrCalc.FieldByName('NUMPP').AsString = '26' then
    fTravelList.qrTravel.FieldByName('summ').AsFloat := qrCalc.FieldByName('TOTAL').AsInteger;
  InitParams;
end;

procedure TfCalcTravel.qrCalcBeforePost(DataSet: TDataSet);
begin
  // Нормативная трудоемкость
  // Если изменили результат вычисления
  if (qrCalc.FieldByName('NUMPP').AsString = '14') and
    (qrCalc.FieldByName('TOTAL').Value <> qrCalc.FieldByName('TOTAL').OldValue) then
  begin
    fTravelList.qrTravel.Edit;
    fTravelList.qrTravel.FieldByName('NORMAT').Value := qrCalc.FieldByName('TOTAL').Value;
  end;
  // Если изменили формулу
  if (qrCalc.FieldByName('NUMPP').AsString = '14') and
    (qrCalc.FieldByName('CALC').Value <> qrCalc.FieldByName('CALC').OldValue) then
  begin
    fTravelList.qrTravel.Edit;
    if qrCalc.FieldByName('CALC').Value = '' then
    begin
      fTravelList.qrTravel.FieldByName('NORMATF').Value := null;
      fTravelList.qrTravel.FieldByName('NORMAT').Value := null;
    end
    else
    begin
      fTravelList.qrTravel.FieldByName('NORMATF').Value := qrCalc.FieldByName('CALC').Value;
      fTravelList.qrTravel.FieldByName('NORMAT').Value :=
        CalcExpression(qrCalc.FieldByName('CALC').AsString, False);
    end;
  end;

  // Суточные
  // Если изменили результат вычисления
  if (qrCalc.FieldByName('NUMPP').AsString = '23') and
    (qrCalc.FieldByName('TOTAL').Value <> qrCalc.FieldByName('TOTAL').OldValue) then
  begin
    fTravelList.qrTravel.Edit;
    fTravelList.qrTravel.FieldByName('SUTKI').Value := qrCalc.FieldByName('TOTAL').Value;
  end;
  // Если изменили формулу
  if (qrCalc.FieldByName('NUMPP').AsString = '23') and
    (qrCalc.FieldByName('CALC').Value <> qrCalc.FieldByName('CALC').OldValue) then
  begin
    fTravelList.qrTravel.Edit;
    if qrCalc.FieldByName('CALC').Value = '' then
    begin
      fTravelList.qrTravel.FieldByName('SUTKIF').Value := null;
      fTravelList.qrTravel.FieldByName('SUTKI').Value := null;
    end
    else
    begin
      fTravelList.qrTravel.FieldByName('SUTKIF').Value := qrCalc.FieldByName('CALC').Value;
      fTravelList.qrTravel.FieldByName('SUTKI').Value :=
        CalcExpression(qrCalc.FieldByName('CALC').AsString, False);
    end;
  end;

  // Квартирные
  // Если изменили результат вычисления
  if (qrCalc.FieldByName('NUMPP').AsString = '24') and
    (qrCalc.FieldByName('TOTAL').Value <> qrCalc.FieldByName('TOTAL').OldValue) then
  begin
    fTravelList.qrTravel.Edit;
    fTravelList.qrTravel.FieldByName('KVARTIR').Value := qrCalc.FieldByName('TOTAL').Value;
  end;
  // Если изменили формулу
  if (qrCalc.FieldByName('NUMPP').AsString = '24') and
    (qrCalc.FieldByName('CALC').Value <> qrCalc.FieldByName('CALC').OldValue) then
  begin
    fTravelList.qrTravel.Edit;
    if qrCalc.FieldByName('CALC').Value = '' then
    begin
      fTravelList.qrTravel.FieldByName('KVARTIRF').Value := null;
      fTravelList.qrTravel.FieldByName('KVARTIR').Value := null;
    end
    else
    begin
      fTravelList.qrTravel.FieldByName('KVARTIRF').Value := qrCalc.FieldByName('CALC').Value;
      fTravelList.qrTravel.FieldByName('KVARTIR').Value :=
        CalcExpression(qrCalc.FieldByName('CALC').AsString, False);
    end;
  end;

  // Проездные
  // Если изменили результат вычисления
  if (qrCalc.FieldByName('NUMPP').AsString = '25') and
    (qrCalc.FieldByName('TOTAL').Value <> qrCalc.FieldByName('TOTAL').OldValue) then
  begin
    fTravelList.qrTravel.Edit;
    fTravelList.qrTravel.FieldByName('PROEZD').Value := qrCalc.FieldByName('TOTAL').Value;
  end;
  // Если изменили формулу
  if (qrCalc.FieldByName('NUMPP').AsString = '25') and
    (qrCalc.FieldByName('CALC').Value <> qrCalc.FieldByName('CALC').OldValue) then
  begin
    fTravelList.qrTravel.Edit;
    if qrCalc.FieldByName('CALC').Value = '' then
    begin
      fTravelList.qrTravel.FieldByName('PROEZDF').Value := null;
      fTravelList.qrTravel.FieldByName('PROEZD').Value := null;
    end
    else
    begin
      fTravelList.qrTravel.FieldByName('PROEZDF').Value := qrCalc.FieldByName('CALC').Value;
      fTravelList.qrTravel.FieldByName('PROEZD').Value :=
        CalcExpression(qrCalc.FieldByName('CALC').AsString, False);
    end;
  end;

  // Итог
  // Если изменили результат вычисления
  if (qrCalc.FieldByName('NUMPP').AsString = '26') and
    (qrCalc.FieldByName('TOTAL').Value <> qrCalc.FieldByName('TOTAL').OldValue) then
  begin
    fTravelList.qrTravel.Edit;
    fTravelList.qrTravel.FieldByName('TOTAL').Value := qrCalc.FieldByName('TOTAL').Value;
  end;
  // Если изменили формулу
  if (qrCalc.FieldByName('NUMPP').AsString = '26') and
    (qrCalc.FieldByName('CALC').Value <> qrCalc.FieldByName('CALC').OldValue) then
  begin
    fTravelList.qrTravel.Edit;
    if qrCalc.FieldByName('CALC').Value = '' then
    begin
      fTravelList.qrTravel.FieldByName('TOTALF').Value := null;
      fTravelList.qrTravel.FieldByName('TOTAL').Value := null;
    end
    else
    begin
      fTravelList.qrTravel.FieldByName('TOTALF').Value := qrCalc.FieldByName('CALC').Value;
      fTravelList.qrTravel.FieldByName('TOTAL').Value :=
        CalcExpression(qrCalc.FieldByName('CALC').AsString, False);
    end;
  end;
end;

end.
