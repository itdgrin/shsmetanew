unit CalcTravelWork;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, Tools,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask, Vcl.DBCtrls, Vcl.Grids,
  Vcl.DBGrids, JvExDBGrids, JvDBGrid, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, JvComponentBase, JvFormPlacement, System.UITypes;

type
  TfCalcTravelWork = class(TSmForm)
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
  fCalcTravelWork: TfCalcTravelWork;

implementation

{$R *.dfm}

uses Main, TravelList, EditExpression;

procedure TfCalcTravelWork.cbbSourceChange(Sender: TObject);
begin
  fTravelList.qrTravelWork.Edit;
  fTravelList.qrTravelWork.FieldByName('SOURCE_TYPE').Value := cbbSource.ItemIndex;
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

procedure TfCalcTravelWork.chkEnableEditingClick(Sender: TObject);
begin
  if chkEnableEditing.Checked then
    grCalc.Options := grCalc.Options - [dgRowSelect] + [dgEditing]
  else
    grCalc.Options := grCalc.Options - [dgEditing] + [dgRowSelect];
end;

procedure TfCalcTravelWork.dblkcbbActClick(Sender: TObject);
begin
  if Assigned(fTravelList) and (Sender is TDBLookupComboBox) then
    fTravelList.qrTravelWork.FieldByName('NAME').AsString := (Sender as TDBLookupComboBox).Text;
  Application.ProcessMessages;
  InitParams;
end;

procedure TfCalcTravelWork.FormActivate(Sender: TObject);
begin
  // Если нажата клавиша Ctrl и выбираем форму, то делаем
  // каскадирование с переносом этой формы на передний план
  FormMain.CascadeForActiveWindow;
  // Делаем нажатой кнопку активной формы (на главной форме внизу)
  FormMain.SelectButtonActiveWindow(Caption);
end;

procedure TfCalcTravelWork.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  // FormMain.ReplaceButtonOpenWindow(Self, fTravelList);
  Action := caFree;
end;

procedure TfCalcTravelWork.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
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
        fTravelList.qrTravelWork.FieldByName('summ').AsInteger := qrCalc.FieldByName('TOTAL').AsInteger;
        if fTravelList.qrTravelWork.State in [dsEdit, dsInsert] then
          fTravelList.qrTravelWork.Post;
        CanClose := True;
      end;
    IDNO:
      begin
        fTravelList.qrTravelWork.Cancel;
        CanClose := True;
      end;
  end;
end;

procedure TfCalcTravelWork.FormCreate(Sender: TObject);
begin
  inherited;
  CloseOpen(qrActList);
  CloseOpen(qrSmetaList);
  dbchkFL_Full_month.OnClick := dblkcbbActClick;
end;

procedure TfCalcTravelWork.FormDestroy(Sender: TObject);
begin
  // fTravelList.Show;
  fCalcTravelWork := nil;
end;

procedure TfCalcTravelWork.InitParams;
begin
  if fTravelList = nil then
    Exit;

  if (fTravelList.qrTravelWork.FieldByName('SOURCE_TYPE').AsInteger = 1) then
  begin
    cbbSource.ItemIndex := 1;
    dblkcbbAct.Visible := False;
    dblkcbbSmeta.Visible := True;
    dblkcbbSmeta.KeyValue := fTravelList.qrTravelWork.FieldByName('SM_ID').Value;
  end
  else
  begin
    cbbSource.ItemIndex := 0;
    dblkcbbAct.Visible := True;
    dblkcbbSmeta.Visible := False;
    dblkcbbAct.KeyValue := fTravelList.qrTravelWork.FieldByName('SM_ID').Value;
  end;
  // Заполняем параметры расчета
  case cbbSource.ItemIndex of
    // акт
    0:
      begin
        qrCalc.ParamByName('ID_ACT').Value := fTravelList.qrTravelWork.FieldByName('ID_ACT').Value;
        qrCalc.ParamByName('ID_ESTIMATE').Value := null;
      end;
    // смета
    1:
      begin
        qrCalc.ParamByName('ID_ACT').Value := null;
        qrCalc.ParamByName('ID_ESTIMATE').Value := fTravelList.qrTravelWork.FieldByName('ID_ESTIMATE').Value;
      end;
  end;
  qrCalc.ParamByName('FLFullMonth').Value := fTravelList.qrTravelWork.FieldByName('FL_Full_month').Value;
  qrCalc.ParamByName('SUTKI_KOMANDIR').Value := fTravelList.qrTravelWork.FieldByName('SUTKI_KOMANDIR').Value;
  qrCalc.ParamByName('HOUR_IN_DAY').Value := fTravelList.qrTravelWork.FieldByName('HOUR_IN_DAY').Value;
  qrCalc.ParamByName('NORMAT').Value := fTravelList.qrTravelWork.FieldByName('NORMAT').Value;
  qrCalc.ParamByName('NORMATF').Value := fTravelList.qrTravelWork.FieldByName('NORMATF').Value;
  qrCalc.ParamByName('TOTAL').Value := fTravelList.qrTravelWork.FieldByName('TOTAL').Value;
  qrCalc.ParamByName('TOTALF').Value := fTravelList.qrTravelWork.FieldByName('TOTALF').Value;
  if not VarIsNull(qrCalc.ParamByName('ID_ACT').Value) or
    not VarIsNull(qrCalc.ParamByName('ID_ESTIMATE').Value) then
    CloseOpen(qrCalc)
  else if qrCalc.Active then
    qrCalc.Active := False;
end;

procedure TfCalcTravelWork.grCalcDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer;
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

procedure TfCalcTravelWork.grCalcKeyPress(Sender: TObject; var Key: Char);
begin
  if (Ord(Key) = VK_RETURN) and (qrCalc.State = dsEdit) then
    qrCalc.Post;
end;

procedure TfCalcTravelWork.qrCalcAfterPost(DataSet: TDataSet);
begin
  InitParams;
end;

procedure TfCalcTravelWork.qrCalcBeforePost(DataSet: TDataSet);
begin
  if (qrCalc.RecNo = 1) and (qrCalc.FieldByName('CALC').Value <> qrCalc.FieldByName('CALC').OldValue) then
  begin
    fTravelList.qrTravelWork.Edit;
    if qrCalc.FieldByName('CALC').Value = '' then
      fTravelList.qrTravelWork.FieldByName('SUTKI_KOMANDIR').Value := null
    else
      fTravelList.qrTravelWork.FieldByName('SUTKI_KOMANDIR').Value := qrCalc.FieldByName('CALC').Value;
  end;

  // Нормативная трудоемкость
  // Если изменили результат вычисления
  if (qrCalc.RecNo = 2) and (qrCalc.FieldByName('TOTAL').Value <> qrCalc.FieldByName('TOTAL').OldValue) then
  begin
    fTravelList.qrTravelWork.Edit;
    fTravelList.qrTravelWork.FieldByName('NORMAT').Value := qrCalc.FieldByName('TOTAL').Value;
  end;
  // Если изменили формулу
  if (qrCalc.RecNo = 2) and (qrCalc.FieldByName('CALC').Value <> qrCalc.FieldByName('CALC').OldValue) then
  begin
    fTravelList.qrTravelWork.Edit;
    if qrCalc.FieldByName('CALC').Value = '' then
    begin
      fTravelList.qrTravelWork.FieldByName('NORMATF').Value := null;
      fTravelList.qrTravelWork.FieldByName('NORMAT').Value := null;
    end
    else
    begin
      fTravelList.qrTravelWork.FieldByName('NORMATF').Value := qrCalc.FieldByName('CALC').Value;
      fTravelList.qrTravelWork.FieldByName('NORMAT').Value :=
        CalcExpression(qrCalc.FieldByName('CALC').AsString, False);
    end;
  end;

  // Итог
  // Если изменили результат вычисления
  if (qrCalc.RecNo = 3) and (qrCalc.FieldByName('TOTAL').Value <> qrCalc.FieldByName('TOTAL').OldValue) then
  begin
    fTravelList.qrTravelWork.Edit;
    fTravelList.qrTravelWork.FieldByName('TOTAL').Value := qrCalc.FieldByName('TOTAL').Value;
  end;
  // Если изменили формулу
  if (qrCalc.RecNo = 3) and (qrCalc.FieldByName('CALC').Value <> qrCalc.FieldByName('CALC').OldValue) then
  begin
    fTravelList.qrTravelWork.Edit;
    if qrCalc.FieldByName('CALC').Value = '' then
    begin
      fTravelList.qrTravelWork.FieldByName('TOTALF').Value := null;
      fTravelList.qrTravelWork.FieldByName('TOTAL').Value := null;
    end
    else
    begin
      fTravelList.qrTravelWork.FieldByName('TOTALF').Value := qrCalc.FieldByName('CALC').Value;
      fTravelList.qrTravelWork.FieldByName('TOTAL').Value :=
        CalcExpression(qrCalc.FieldByName('CALC').AsString, False);
    end;
  end;
end;

end.
