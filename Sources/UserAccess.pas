unit UserAccess;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Tools, DataModule, Main,
  Vcl.Grids, Vcl.DBGrids, JvExDBGrids, JvDBGrid, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, GlobsAndConst, Vcl.DBCtrls;

type
  TfUserAccess = class(TSmForm)
    pnl1: TPanel;
    btnCancel: TBitBtn;
    btnSave: TBitBtn;
    rbAll: TRadioButton;
    rbOnlyMe: TRadioButton;
    grMain: TJvDBGrid;
    qrMain: TFDQuery;
    dsMain: TDataSource;
    qrMainUSER_ID: TFDAutoIncField;
    qrMainUSER_NAME: TStringField;
    qrMainSELECTED: TBooleanField;
    blnfldMainCHECKED: TBooleanField;
    chkAllowWrite: TCheckBox;
    blnfldMainCHECKED_WRITE: TBooleanField;
    qrMainSELECTED_WRITE: TBooleanField;
    dblkcbb1: TDBLookupComboBox;
    qrUser: TFDQuery;
    dsUser: TDataSource;
    bvl2: TBevel;
    rbFromList: TRadioButton;
    bvl1: TBevel;
    procedure btnCancelClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure qrMainBeforeOpen(DataSet: TDataSet);
    procedure blnfldMainCHECKEDChange(Sender: TField);
    procedure qrMainCalcFields(DataSet: TDataSet);
    procedure rbFromListClick(Sender: TObject);
    procedure grMainCellClick(Column: TColumn);
    procedure blnfldMainCHECKED_WRITEChange(Sender: TField);
  private
    /// Тип документа:
    /// 1 - смета/акт
    /// 2 - объект
    DOC_TYPE_ID: Integer;
    // ID документа
    MASTER_ID: Integer;
  public
  end;

var
  fUserAccess: TfUserAccess;

implementation

{$R *.dfm}

procedure TfUserAccess.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfUserAccess.btnSaveClick(Sender: TObject);
begin
  if Application.MessageBox('Применить изменения?', 'Настройка прав доступа',
    MB_OKCANCEL + MB_ICONQUESTION + MB_TOPMOST) = IDCANCEL then
  begin
    Exit;
  end;

  // Меняем владельца документа
  if not VarIsNull(dblkcbb1.KeyValue) then
    case DOC_TYPE_ID of
      1:
        FastExecSQL('UPDATE smetasourcedata SET USER_ID=:0 WHERE SM_ID=:1',
          VarArrayOf([dblkcbb1.KeyValue, MASTER_ID]));
      2:
        FastExecSQL('UPDATE objcards SET USER_ID=:0 WHERE OBJ_ID=:1',
          VarArrayOf([dblkcbb1.KeyValue, MASTER_ID]));
    end;

  // Удаляем старые записи
  FastExecSQL('DELETE FROM user_access WHERE DOC_TYPE_ID=:0 AND MASTER_ID=:1',
    VarArrayOf([DOC_TYPE_ID, MASTER_ID]));
  // Каскадно на все зависящие документы
  case DOC_TYPE_ID of
    // Смета/акт
    1:
      begin
        // Удаляем записи доступа всех нижестоящих смет/актов смыт акта
        FastExecSQL
          ('DELETE FROM user_access WHERE DOC_TYPE_ID=1 AND MASTER_ID IN (SELECT SM_ID FROM smetasourcedata'#13
          + 'WHERE PARENT_ID=:0 OR PARENT_ID IN (SELECT SM_ID FROM smetasourcedata WHERE PARENT_ID=:1))',
          VarArrayOf([MASTER_ID, MASTER_ID]));
      end;
    // Объект
    2:
      begin
        // Удаляем записи доступа со всех смет и актов объекта
        FastExecSQL
          ('DELETE FROM user_access WHERE DOC_TYPE_ID=1 AND MASTER_ID IN (SELECT SM_ID FROM smetasourcedata WHERE OBJ_ID=:0)',
          VarArrayOf([MASTER_ID]));
      end;
  end;

  // Для всех
  if rbAll.Checked then
  begin
    FastExecSQL
      ('INSERT INTO user_access(DOC_TYPE_ID, MASTER_ID, USER_ID, ACCESS_TYPE) VALUE(:0, :1, 0, 1+:2)',
      VarArrayOf([DOC_TYPE_ID, MASTER_ID, chkAllowWrite.Checked]));
    // Каскадно на все зависящие документы
    case DOC_TYPE_ID of
      // Смета/акт
      1:
        begin
          FastExecSQL('INSERT INTO user_access(DOC_TYPE_ID, MASTER_ID, USER_ID, ACCESS_TYPE)'#13 +
            '(SELECT 1, SM_ID, 0, 1+:0 FROM smetasourcedata WHERE PARENT_ID=:1 OR PARENT_ID IN (SELECT SM_ID FROM smetasourcedata WHERE PARENT_ID=:2))',
            VarArrayOf([chkAllowWrite.Checked, MASTER_ID, MASTER_ID]));
        end;
      // Объект
      2:
        begin
          FastExecSQL('INSERT INTO user_access(DOC_TYPE_ID, MASTER_ID, USER_ID, ACCESS_TYPE)'#13 +
            '(SELECT 1, SM_ID, 0, 1+:0 FROM smetasourcedata WHERE OBJ_ID=:1)',
            VarArrayOf([chkAllowWrite.Checked, MASTER_ID]));
        end;
    end;
  end
  // Для избранных
  else if rbFromList.Checked then
  begin
    qrMain.DisableControls;
    qrMain.First;
    while not qrMain.Eof do
    begin
      if qrMain.FieldByName('SELECTED').Value then
      begin
        FastExecSQL
          ('INSERT INTO user_access(DOC_TYPE_ID, MASTER_ID, USER_ID, ACCESS_TYPE) VALUE(:0, :1, :2, 1+:3)',
          VarArrayOf([DOC_TYPE_ID, MASTER_ID, qrMain.FieldByName('USER_ID').Value,
          qrMain.FieldByName('SELECTED_WRITE').Value]));
        // Каскадно на все зависящие документы
        case DOC_TYPE_ID of
          // Смета/акт
          1:
            begin
              FastExecSQL('INSERT INTO user_access(DOC_TYPE_ID, MASTER_ID, USER_ID, ACCESS_TYPE)'#13 +
                '(SELECT 1, SM_ID, :0, 1+:1 FROM smetasourcedata WHERE PARENT_ID=:2 OR PARENT_ID IN (SELECT SM_ID FROM smetasourcedata WHERE PARENT_ID=:3))',
                VarArrayOf([qrMain.FieldByName('USER_ID').Value, qrMain.FieldByName('SELECTED_WRITE').Value,
                MASTER_ID, MASTER_ID]));
            end;
          // Объект
          2:
            begin
              FastExecSQL('INSERT INTO user_access(DOC_TYPE_ID, MASTER_ID, USER_ID, ACCESS_TYPE)'#13 +
                '(SELECT 1, SM_ID, :0, 1+:1 FROM smetasourcedata WHERE OBJ_ID=:2)',
                VarArrayOf([qrMain.FieldByName('USER_ID').Value, qrMain.FieldByName('SELECTED_WRITE').Value,
                MASTER_ID]));
            end;
        end;
      end;
      qrMain.Next;
    end;
  end;
  Close;
end;

procedure TfUserAccess.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfUserAccess.FormCreate(Sender: TObject);
var
  res: Variant;
begin
  DOC_TYPE_ID := InitParams[0];
  MASTER_ID := InitParams[1];
  qrMain.Active := True;
  res := Null;
  res := FastSelectSQLOne
    ('SELECT USER_ID FROM user_access WHERE DOC_TYPE_ID=:0 AND MASTER_ID=:1 ORDER BY USER_ID LIMIT 1',
    VarArrayOf([DOC_TYPE_ID, MASTER_ID]));
  if VarIsNull(res) then
    rbOnlyMe.Checked := True
  else if res = 0 then
  begin
    rbAll.Checked := True;
    chkAllowWrite.Checked := FastSelectSQLOne
      ('SELECT ACCESS_TYPE FROM user_access WHERE DOC_TYPE_ID=:0 AND MASTER_ID=:1 ORDER BY USER_ID LIMIT 1',
      VarArrayOf([DOC_TYPE_ID, MASTER_ID])) = 2;
  end
  else
    rbFromList.Checked := True;
  // Получаем владельца документа
  qrUser.Active := True;
  case DOC_TYPE_ID of
    1:
      res := FastSelectSQLOne('SELECT USER_ID FROM smetasourcedata WHERE SM_ID=:0', VarArrayOf([MASTER_ID]));
    2:
      res := FastSelectSQLOne('SELECT USER_ID FROM objcards WHERE OBJ_ID=:0', VarArrayOf([MASTER_ID]));
  end;
  dblkcbb1.KeyValue := res;
end;

procedure TfUserAccess.FormDestroy(Sender: TObject);
begin
  fUserAccess := nil;
end;

procedure TfUserAccess.grMainCellClick(Column: TColumn);
begin
  if Column.Field = blnfldMainCHECKED then
  begin
    qrMain.Edit;
    qrMainSELECTED.Value := not qrMainSELECTED.Value;
    if not qrMainSELECTED.Value then
      qrMainSELECTED_WRITE.Value := qrMainSELECTED.Value;
    qrMain.CheckBrowseMode;
  end
  else if Column.Field = blnfldMainCHECKED_WRITE then
  begin
    qrMain.Edit;
    qrMainSELECTED_WRITE.Value := not qrMainSELECTED_WRITE.Value;
    if qrMainSELECTED_WRITE.Value then
      qrMainSELECTED.Value := qrMainSELECTED_WRITE.Value;
    qrMain.CheckBrowseMode;
  end
end;

procedure TfUserAccess.qrMainCalcFields(DataSet: TDataSet);
begin
  blnfldMainCHECKED.OnChange := nil;
  blnfldMainCHECKED.Value := qrMainSELECTED.Value;
  blnfldMainCHECKED.OnChange := blnfldMainCHECKEDChange;

  blnfldMainCHECKED_WRITE.OnChange := nil;
  blnfldMainCHECKED_WRITE.Value := qrMainSELECTED_WRITE.Value;
  blnfldMainCHECKED.OnChange := blnfldMainCHECKED_WRITEChange;
end;

procedure TfUserAccess.blnfldMainCHECKEDChange(Sender: TField);
begin
  qrMainSELECTED.Value := blnfldMainCHECKED.Value;
end;

procedure TfUserAccess.blnfldMainCHECKED_WRITEChange(Sender: TField);
begin
  qrMainSELECTED_WRITE.Value := blnfldMainCHECKED_WRITE.Value;
end;

procedure TfUserAccess.qrMainBeforeOpen(DataSet: TDataSet);
begin
  if (DataSet as TFDQuery).FindParam('USER_ID') <> nil then
    (DataSet as TFDQuery).ParamByName('USER_ID').Value := G_USER_ID;
  if (DataSet as TFDQuery).FindParam('DOC_TYPE_ID') <> nil then
    (DataSet as TFDQuery).ParamByName('DOC_TYPE_ID').Value := DOC_TYPE_ID;
  if (DataSet as TFDQuery).FindParam('MASTER_ID') <> nil then
    (DataSet as TFDQuery).ParamByName('MASTER_ID').Value := MASTER_ID;
end;

procedure TfUserAccess.rbFromListClick(Sender: TObject);
begin
  grMain.Enabled := rbFromList.Checked;
  chkAllowWrite.Enabled := rbAll.Checked;
end;

end.
