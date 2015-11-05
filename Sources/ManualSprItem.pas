unit ManualSprItem;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.ComCtrls,
  Generics.Collections,
  Generics.Defaults, Datasnap.Provider, Data.DB, Datasnap.DBClient, Vcl.Grids,
  Vcl.DBGrids, JvExDBGrids, JvDBGrid, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.DBCtrls, Vcl.Mask, Vcl.ExtCtrls, Tools;

type
  TManSprCardForm = class(TSmForm)
    gbMain: TGroupBox;
    lbCode: TLabel;
    edtCode: TEdit;
    lbUnit: TLabel;
    memName: TMemo;
    lbName: TLabel;
    cbUnit: TComboBox;
    gbAdditInfo: TGroupBox;
    gpPrices: TGroupBox;
    lbAdditInfo1: TLabel;
    edtAdditInfo1: TEdit;
    lbAdditInfo2: TLabel;
    edtAdditInfo2: TEdit;
    edtAdditInfo3: TEdit;
    edtAdditInfo4: TEdit;
    edtAdditInfo5: TEdit;
    edtAdditInfo6: TEdit;
    lbAdditInfo3: TLabel;
    lbAdditInfo4: TLabel;
    lbAdditInfo5: TLabel;
    lbAdditInfo6: TLabel;
    edtAdditInfo7: TEdit;
    lbAdditInfo7: TLabel;
    grPrices: TJvDBGrid;
    mtPrices: TFDMemTable;
    dsPrices: TDataSource;
    mtPricesDOC_NOM: TStringField;
    mtPricesDOC_DATE: TDateField;
    mtPricesCOASTNDS: TExtendedField;
    mtPricesCOASTNONDS: TExtendedField;
    mtPricesDESCRIPT: TStringField;
    mtPricesPROVIDER: TStringField;
    pnlButtons: TPanel;
    btnClose: TButton;
    btnSave: TButton;
    mtPricesID: TIntegerField;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure mtPricesDOC_DATESetText(Sender: TField; const Text: string);
    procedure btnCloseClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
  private
    FSprID: Integer;
    FNewItem: Boolean;
    FSprDataType: Byte;
    FMainDataType: Byte;
    FBase: Byte;
    FUnitIDList: TList<Integer>;
    procedure LoadData;
    procedure SaveData;
    function GetNewUnitID: Integer;
    function ValidateData: Boolean;
  public
    constructor Create(AOwner: TComponent;
      const ASprID, ADataType: Integer); reintroduce;
  end;

  procedure DelSprItem(ASprID, ADataType: Integer);
  procedure GetSprManualPrice(AListView: TListView; ASprID, ADataType: Integer);

implementation

uses DataModule, SprController, GlobsAndConst;

{$R *.dfm}

procedure DelSprItem(ASprID, ADataType: Integer);
var AutoCommitValue: Boolean;
    MainDataType: Integer;
begin
  if not ADataType in [0,1,2,3] then
    raise Exception.Create(Format('Неизвестный тип данных (%d)',[ADataType]));

  DM.qrDifferent.Active := False;
  AutoCommitValue := DM.Read.Options.AutoCommit;
  try
    DM.Read.Options.AutoCommit := False;
    DM.Read.StartTransaction;
    try
      case ADataType of
        0, 1: DM.qrDifferent.SQL.Text :=
            'Delete from material where (MATERIAL_ID = :ID) and (BASE = 1)';
        2: DM.qrDifferent.SQL.Text :=
            'Delete from mechanizm where (MECHANIZM_ID = :ID) and (BASE = 1)';
        3: DM.qrDifferent.SQL.Text :=
            'Delete from devices where (DEVICE_ID = :ID) and (BASE = 1)';
      end;
      DM.qrDifferent.ParamByName('ID').Value := ASprID;
      DM.qrDifferent.ExecSQL;

      case ADataType of
        0, 1: MainDataType := 2;
        2: MainDataType := 3;
        3: MainDataType := 4;
        else MainDataType := 0;
      end;

      DM.qrDifferent.SQL.Text :=
        'Delete from manual_additinfo ' +
        'where (ID_TYPE_DATA = :ID_TYPE_DATA) and (ID_SPR =  :ID_SPR)';
      DM.qrDifferent.ParamByName('ID_TYPE_DATA').Value := MainDataType;
      DM.qrDifferent.ParamByName('ID_SPR').Value := ASprID;
      DM.qrDifferent.ExecSQL;

      DM.qrDifferent.SQL.Text :=
        'Delete from manual_cost ' +
        'where (ID_TYPE_DATA = :ID_TYPE_DATA) and (ID_SPR =  :ID_SPR)';
      DM.qrDifferent.ParamByName('ID_TYPE_DATA').Value := MainDataType;
      DM.qrDifferent.ParamByName('ID_SPR').Value := ASprID;
      DM.qrDifferent.ExecSQL;

      DM.Read.Commit;
    except
      DM.Read.Rollback;
      raise;
    end;
    SprControl.DeleteItem(ADataType, ASprID);
  finally
    DM.Read.Options.AutoCommit := AutoCommitValue;
  end;
end;

procedure GetSprManualPrice(AListView: TListView; ASprID, ADataType: Integer);
var MainDataType: Integer;
    Item: TListItem;
begin
  case ADataType of
    0, 1: MainDataType := 2;
    2: MainDataType := 3;
    3: MainDataType := 4;
    else MainDataType := 0;
  end;
  AListView.Items.Clear;
  DM.qrDifferent.SQL.Text :=
      'Select * from manual_cost where (ID_TYPE_DATA = ' + IntToStr(MainDataType) +
      ') and (ID_SPR = ' + IntToStr(ASprID) +
      ') order by DOC_DATE desc, DOC_NOM desc';
  DM.qrDifferent.Active := True;
  try
    while not DM.qrDifferent.Eof do
    begin
      Item := AListView.Items.Add;
      Item.Data := Pointer(DM.qrDifferent.FieldByName('ID').AsInteger);
      Item.Caption := DM.qrDifferent.FieldByName('DOC_DATE').AsString;
      Item.SubItems.Add(DM.qrDifferent.FieldByName('DOC_NOM').AsString);
      Item.SubItems.Add(DM.qrDifferent.FieldByName('PROVIDER').AsString);
      Item.SubItems.Add(DM.qrDifferent.FieldByName('COASTNONDS').AsString);
      Item.SubItems.Add(DM.qrDifferent.FieldByName('COASTNDS').AsString);
      Item.SubItems.Add(DM.qrDifferent.FieldByName('DESCRIPT').AsString);

      DM.qrDifferent.Next;
    end;
  finally
    if AListView.Items.Count > 0 then
      AListView.ItemIndex := 0;

    DM.qrDifferent.Active := False;
  end;
end;

procedure TManSprCardForm.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TManSprCardForm.btnSaveClick(Sender: TObject);
begin
  if not ValidateData then
    Exit;
  SaveData;
  ModalResult := mrOk;
end;

constructor TManSprCardForm.Create(AOwner: TComponent;
  const ASprID, ADataType: Integer);
begin
  if not ADataType in [0,1,2,3] then
    raise Exception.Create(Format('Неизвестный тип данных (%d)',[ADataType]));

  FSprDataType := ADataType;
  FSprID := ASprID;
  inherited Create(AOwner);
end;

procedure TManSprCardForm.FormCreate(Sender: TObject);
begin
  inherited;
  FUnitIDList := TList<Integer>.Create;
  LoadData;
end;

procedure TManSprCardForm.FormDestroy(Sender: TObject);
begin
  FreeAndNil(FUnitIDList);
end;

procedure TManSprCardForm.LoadData;
var TmpUnit: Integer;
    TmpMatType: Byte;
begin
  DM.qrDifferent.Active := False;
  case FSprDataType of
    0,1:
    begin
      FMainDataType := 2;
      if FSprDataType = 0 then
      begin
        Caption := Caption + ' материала';
        TmpMatType := 1;
      end;
      if FSprDataType = 1 then
      begin
        Caption := Caption + ' ЖБИ';
        TmpMatType := 2;
      end;
      DM.qrDifferent.SQL.Text := 'Select MAT_CODE, MAT_NAME, UNIT_ID, BASE ' +
        'from material where (MATERIAL_ID = ' + IntToStr(FSprID) + ') and ' +
        '(MAT_TYPE = ' + IntToStr(TmpMatType) + ')';
    end;
    2:
    begin
      FMainDataType := 3;
      Caption := Caption + ' механизма';
      DM.qrDifferent.SQL.Text := 'Select MECH_CODE, MECH_NAME, UNIT_ID, BASE ' +
        'from mechanizm where MECHANIZM_ID = ' + IntToStr(FSprID);
    end;
    3:
    begin
      FMainDataType := 4;
      Caption := Caption + ' оборудования';
      DM.qrDifferent.SQL.Text := 'Select DEVICE_CODE1, NAME, UNIT, BASE ' +
        'from devices where DEVICE_ID = ' + IntToStr(FSprID);
    end;
  end;

  DM.qrDifferent.Active := True;
  try
    if DM.qrDifferent.IsEmpty then
      FNewItem := True
    else
    begin
      edtCode.Text := DM.qrDifferent.Fields[0].AsString;
      memName.Text := DM.qrDifferent.Fields[1].AsString;
      TmpUnit := DM.qrDifferent.Fields[2].AsInteger;
      FBase := DM.qrDifferent.Fields[3].AsInteger;
    end;
  finally
    DM.qrDifferent.Active := False;
  end;

  if FNewItem then
    Caption := Caption + ' (Добавление)'
  else
    Caption := Caption + ' (Редактирование)';

  if (FBase = 0) and not FNewItem then
    btnSave.Caption := 'Сохнанить в собственные';

  cbUnit.Items.Clear;
  FUnitIDList.Clear;

  DM.qrDifferent.SQL.Text :=
    'Select UNIT_ID, UNIT_NAME from units order by lower(UNIT_NAME)';
  DM.qrDifferent.Active := True;
  try
    while not DM.qrDifferent.Eof do
    begin
      FUnitIDList.Add(DM.qrDifferent.Fields[0].AsInteger);
      cbUnit.Items.Add(Trim(DM.qrDifferent.Fields[1].AsString));

      if TmpUnit = DM.qrDifferent.Fields[0].AsInteger then
        cbUnit.Text := Trim(DM.qrDifferent.Fields[1].AsString);

      DM.qrDifferent.Next;
    end;
  finally
    DM.qrDifferent.Active := False;
  end;

  if not mtPrices.Active then
    mtPrices.Active := True;

  if (not FNewItem) then
  begin
    DM.qrDifferent.SQL.Text :=
      'Select * from manual_cost where (ID_TYPE_DATA = ' + IntToStr(FMainDataType) +
      ') and (ID_SPR = ' + IntToStr(FSprID) +
      ') order by DOC_DATE desc, DOC_NOM desc';
    DM.qrDifferent.Active := True;
    try
      while not DM.qrDifferent.Eof do
      begin
        mtPrices.Append;
        mtPrices.FieldByName('ID').Value := DM.qrDifferent.FieldByName('ID').Value;
        mtPrices.FieldByName('DOC_NOM').Value := DM.qrDifferent.FieldByName('DOC_NOM').Value;
        mtPrices.FieldByName('DOC_DATE').Value := DM.qrDifferent.FieldByName('DOC_DATE').Value;
        mtPrices.FieldByName('PROVIDER').Value := DM.qrDifferent.FieldByName('PROVIDER').Value;
        mtPrices.FieldByName('COASTNDS').Value := DM.qrDifferent.FieldByName('COASTNDS').Value;
        mtPrices.FieldByName('COASTNONDS').Value := DM.qrDifferent.FieldByName('COASTNONDS').Value;
        mtPrices.FieldByName('DESCRIPT').Value := DM.qrDifferent.FieldByName('DESCRIPT').Value;
        mtPrices.Post;
        DM.qrDifferent.Next;
      end;
    finally
      DM.qrDifferent.Active := False;
    end;
    mtPrices.First;

    DM.qrDifferent.SQL.Text :=
      'Select * from manual_additinfo where (ID_TYPE_DATA = ' + IntToStr(FMainDataType) +
      ') and (ID_SPR = ' + IntToStr(FSprID) + ')';
    DM.qrDifferent.Active := True;
    try
      if not DM.qrDifferent.Eof then
      begin
        edtAdditInfo1.Text := DM.qrDifferent.FieldByName('MASSA').AsString;
        edtAdditInfo2.Text := DM.qrDifferent.FieldByName('MARKA').AsString;
        edtAdditInfo3.Text := DM.qrDifferent.FieldByName('M2M3').AsString;
        edtAdditInfo4.Text := DM.qrDifferent.FieldByName('GOST').AsString;
        edtAdditInfo5.Text := DM.qrDifferent.FieldByName('SHIRINA').AsString;
        edtAdditInfo6.Text := DM.qrDifferent.FieldByName('DLINA').AsString;
        edtAdditInfo7.Text := DM.qrDifferent.FieldByName('VISOTA').AsString;
      end;
    finally
      DM.qrDifferent.Active := False;
    end;
  end;
end;

function TManSprCardForm.GetNewUnitID: Integer;
var i, j: Integer;
    TmpID: Integer;
begin
  i := -1;
  cbUnit.Text := Trim(cbUnit.Text);
  for j := 0 to cbUnit.Items.Count - 1 do
    if LowerCase(cbUnit.Items[j]) = LowerCase(cbUnit.Text) then
    begin
      i := j;
      Break;
    end;

  if i > -1 then
    Result := FUnitIDList[i]
  else
  begin
    DM.qrDifferent.SQL.Text := 'Select MAX(UNIT_ID) from units where (UNIT_ID > ' +
      IntToStr(С_MANIDDELIMETER) + ')';
    DM.qrDifferent.Active := True;
    try
      if (not DM.qrDifferent.Eof) and
         (DM.qrDifferent.Fields[0].AsInteger > С_MANIDDELIMETER) then
        TmpID := DM.qrDifferent.Fields[0].AsInteger + 1
      else
        TmpID := С_MANIDDELIMETER + 1;
    finally
      DM.qrDifferent.Active := False;
    end;

    DM.qrDifferent.SQL.Text :=
      'Insert into units (UNIT_ID, UNIT_NAME, BASE) values (:ID, :NAME, 1)';
    DM.qrDifferent.ParamByName('ID').Value := TmpID;
    DM.qrDifferent.ParamByName('NAME').Value := cbUnit.Text;
    DM.qrDifferent.ExecSQL;

    Result := TmpID;
  end;
end;

function TManSprCardForm.ValidateData: Boolean;
begin
  Result := False;
  if Trim(edtCode.Text) = '' then
  begin
    ShowMessage('Не задан код.');
    edtCode.SetFocus;
    Exit;
  end;

  if Trim(memName.Text) = '' then
  begin
    ShowMessage('Не задано наименование.');
    memName.SetFocus;
    Exit;
  end;

  if Trim(cbUnit.Text) = '' then
  begin
    ShowMessage('Не задана единица измерения.');
    cbUnit.SetFocus;
    Exit;
  end;
  Result := True;
end;

procedure TManSprCardForm.SaveData;
var NewUnitID: Integer;
    NewName: string;
    AutoCommitValue: Boolean;
    TmpRec: TSprRecord;
begin
  DM.qrDifferent.Active := False;

  AutoCommitValue := DM.Read.Options.AutoCommit;
  try
    DM.Read.Options.AutoCommit := False;
    DM.Read.StartTransaction;
    try
      NewUnitID := GetNewUnitID;
      NewName := Trim(memName.Text);
      NewName := StringReplace(NewName, sLineBreak, ' ', [rfReplaceAll]);
      NewName := StringReplace(NewName, #13, ' ', [rfReplaceAll]);
      NewName := StringReplace(NewName, #10, ' ', [rfReplaceAll]);

      if FNewItem or (not FNewItem and (FBase = 0)) then
      begin
        case FSprDataType of
        0,1:
          DM.qrDifferent.SQL.Text := 'Select MAX(MATERIAL_ID) from material ' +
            'where (MATERIAL_ID > ' + IntToStr(С_MANIDDELIMETER) + ')';
        2:
          DM.qrDifferent.SQL.Text := 'Select MAX(MECHANIZM_ID) from mechanizm ' +
            'where (MECHANIZM_ID > ' + IntToStr(С_MANIDDELIMETER) + ')';
        3:
          DM.qrDifferent.SQL.Text := 'Select MAX(DEVICE_ID) from devices ' +
            'where (DEVICE_ID > ' + IntToStr(С_MANIDDELIMETER) + ')';
        end;
        DM.qrDifferent.Active := True;
        try
          if (not DM.qrDifferent.Eof) and
             (DM.qrDifferent.Fields[0].AsInteger > С_MANIDDELIMETER) then
            FSprID := DM.qrDifferent.Fields[0].AsInteger + 1
          else
            FSprID := С_MANIDDELIMETER + 1;
        finally
          DM.qrDifferent.Active := False;
        end;

        DM.qrDifferent.Params.Clear;
        case FSprDataType of
          0: DM.qrDifferent.SQL.Text :=
              'Insert into material (MATERIAL_ID, MAT_CODE, MAT_NAME, UNIT_ID, BASE, MAT_TYPE) values ' +
              '(:ID, :CODE, :NAME, :UNITID, 1, 1)';
          1: DM.qrDifferent.SQL.Text :=
              'Insert into material (MATERIAL_ID, MAT_CODE, MAT_NAME, UNIT_ID, BASE, MAT_TYPE) values ' +
              '(:ID, :CODE, :NAME, :UNITID, 1, 2)';
          2: DM.qrDifferent.SQL.Text :=
              'Insert into mechanizm (MECHANIZM_ID, MECH_CODE, MECH_NAME, UNIT_ID, BASE) values ' +
              '(:ID, :CODE, :NAME, :UNITID, 1)';
          3: DM.qrDifferent.SQL.Text :=
              'Insert into devices (DEVICE_ID, DEVICE_CODE1, DEVICE_CODE2, NAME, UNIT, BASE) values ' +
              '(:ID, :CODE, '''', :NAME, :UNITID, 1)';
        end;
        DM.qrDifferent.ParamByName('ID').Value := FSprID;
        DM.qrDifferent.ParamByName('CODE').Value := Trim(edtCode.Text);
        DM.qrDifferent.ParamByName('NAME').Value := NewName;
        DM.qrDifferent.ParamByName('UNITID').Value := NewUnitID;
        DM.qrDifferent.ExecSQL;
      end
      else
      begin
        case FSprDataType of
          0, 1: DM.qrDifferent.SQL.Text :=
              'Update material set ' +
              'MAT_CODE = :CODE, MAT_NAME = :NAME, UNIT_ID = :UNITID ' +
              'where MATERIAL_ID = :ID';
          2: DM.qrDifferent.SQL.Text :=
              'Update mechanizm set ' +
              'MECH_CODE = :CODE, MECH_NAME = :NAME, UNIT_ID = :UNITID ' +
              'where MECHANIZM_ID = :ID';
          3: DM.qrDifferent.SQL.Text :=
              'Update devices set ' +
              'DEVICE_CODE1 = :CODE, NAME = :NAME, UNIT = :UNITID ' +
              'where DEVICE_ID = :ID';
        end;
        DM.qrDifferent.ParamByName('ID').Value := FSprID;
        DM.qrDifferent.ParamByName('CODE').Value := Trim(edtCode.Text);
        DM.qrDifferent.ParamByName('NAME').Value := NewName;
        DM.qrDifferent.ParamByName('UNITID').Value := NewUnitID;
        DM.qrDifferent.ExecSQL;
      end;

      DM.qrDifferent.SQL.Text :=
        'Delete from manual_additinfo ' +
        'where (ID_TYPE_DATA = :ID_TYPE_DATA) and (ID_SPR =  :ID_SPR)';
      DM.qrDifferent.ParamByName('ID_TYPE_DATA').Value := FMainDataType;
      DM.qrDifferent.ParamByName('ID_SPR').Value := FSprID;
      DM.qrDifferent.ExecSQL;

      DM.qrDifferent.SQL.Text :=
        'Insert into manual_additinfo ' +
        '(ID_TYPE_DATA,ID_SPR,MASSA,MARKA,M2M3,GOST,SHIRINA,DLINA,VISOTA) values ' +
        '(:ID_TYPE_DATA,:ID_SPR,:MASSA,:MARKA,:M2M3,:GOST,:SHIRINA,:DLINA,:VISOTA)';
      DM.qrDifferent.ParamByName('ID_TYPE_DATA').Value := FMainDataType;
      DM.qrDifferent.ParamByName('ID_SPR').Value := FSprID;
      DM.qrDifferent.ParamByName('MASSA').Value := Trim(edtAdditInfo1.Text);
      DM.qrDifferent.ParamByName('MARKA').Value := Trim(edtAdditInfo2.Text);
      DM.qrDifferent.ParamByName('M2M3').Value := Trim(edtAdditInfo3.Text);
      DM.qrDifferent.ParamByName('GOST').Value := Trim(edtAdditInfo4.Text);
      DM.qrDifferent.ParamByName('SHIRINA').Value := Trim(edtAdditInfo5.Text);
      DM.qrDifferent.ParamByName('DLINA').Value := Trim(edtAdditInfo6.Text);
      DM.qrDifferent.ParamByName('VISOTA').Value := Trim(edtAdditInfo7.Text);
      DM.qrDifferent.ExecSQL;

      DM.qrDifferent.SQL.Text :=
        'Delete from manual_cost ' +
        'where (ID_TYPE_DATA = :ID_TYPE_DATA) and (ID_SPR =  :ID_SPR)';
      DM.qrDifferent.ParamByName('ID_TYPE_DATA').Value := FMainDataType;
      DM.qrDifferent.ParamByName('ID_SPR').Value := FSprID;
      DM.qrDifferent.ExecSQL;

      mtPrices.DisableControls;
      try
        mtPrices.First;
        while not mtPrices.Eof do
        begin
          DM.qrDifferent.Params.Clear;

          if mtPrices.FieldByName('ID').AsInteger > 0 then
          begin
             DM.qrDifferent.SQL.Text :=
              'Insert into manual_cost (ID,ID_TYPE_DATA,ID_SPR,DOC_NOM,DOC_DATE,' +
              'PROVIDER,COASTNDS,COASTNONDS,DESCRIPT) values ' +
              '(:ID,:ID_TYPE_DATA,:ID_SPR,:DOC_NOM,:DOC_DATE,:PROVIDER,:COASTNDS,' +
              ':COASTNONDS,:DESCRIPT)';
             DM.qrDifferent.ParamByName('ID').Value := mtPrices.FieldByName('ID').AsInteger;
          end
          else
          begin
            DM.qrDifferent.SQL.Text :=
              'Insert into manual_cost (ID_TYPE_DATA,ID_SPR,DOC_NOM,DOC_DATE,' +
              'PROVIDER,COASTNDS,COASTNONDS,DESCRIPT) values ' +
              '(:ID_TYPE_DATA,:ID_SPR,:DOC_NOM,:DOC_DATE,:PROVIDER,:COASTNDS,' +
              ':COASTNONDS,:DESCRIPT)';
          end;

          DM.qrDifferent.ParamByName('ID_TYPE_DATA').Value := FMainDataType;
          DM.qrDifferent.ParamByName('ID_SPR').Value := FSprID;
          DM.qrDifferent.ParamByName('DOC_NOM').Value := mtPrices.FieldByName('DOC_NOM').Value;
          DM.qrDifferent.ParamByName('DOC_DATE').Value := mtPrices.FieldByName('DOC_DATE').Value;
          DM.qrDifferent.ParamByName('PROVIDER').Value := mtPrices.FieldByName('PROVIDER').Value;
          DM.qrDifferent.ParamByName('COASTNDS').Value := mtPrices.FieldByName('COASTNDS').Value;
          DM.qrDifferent.ParamByName('COASTNONDS').Value := mtPrices.FieldByName('COASTNONDS').Value;
          DM.qrDifferent.ParamByName('DESCRIPT').Value := mtPrices.FieldByName('DESCRIPT').Value;
          DM.qrDifferent.ExecSQL;
          mtPrices.Next;
        end;
      finally
        mtPrices.EnableControls;
      end;

      DM.Read.Commit;
    except
      DM.Read.Rollback;
      raise;
    end;
    TmpRec.ID := FSprID;
    TmpRec.Code := Trim(edtCode.Text);
    TmpRec.Name := NewName;
    TmpRec.Unt := Trim(cbUnit.Text);
    TmpRec.Manual := True;

    if FNewItem or (not FNewItem and (FBase = 0)) then
      SprControl.AddItem(FSprDataType, TmpRec)
    else
      SprControl.UpdateItem(FSprDataType, TmpRec);
  finally
    DM.Read.Options.AutoCommit := AutoCommitValue;
  end;
end;

procedure TManSprCardForm.mtPricesDOC_DATESetText(Sender: TField;
  const Text: string);
var TmpDate: TDateTime;
    TmpStr: string;
begin
  if TryStrToDate(Text, TmpDate) then
    Sender.Value := TmpDate
  else
  begin
    TmpStr := Trim(StringReplace(Text, '.', '', [rfReplaceAll]));
    if TmpStr = '' then
      Sender.Value := Null
    else
      raise Exception.Create('''' + Text + ''' некорректная дата.');
  end;
end;

end.
