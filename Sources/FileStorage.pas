unit FileStorage;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Vcl.ComCtrls, JvExComCtrls, JvDBTreeView, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  JvComponentBase, JvFormPlacement, Vcl.Grids, Vcl.DBGrids, JvExDBGrids, JvDBGrid, Vcl.ImgList, Vcl.DBCtrls,
  JvDBControls, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Mask, Vcl.Buttons, Tools;

type
  TfFileStorage = class(TSmForm)
    qrTreeData: TFDQuery;
    dsTreeData: TDataSource;
    tvDocuments: TJvDBTreeView;
    FormStorage: TJvFormStorage;
    il1: TImageList;
    pnl1: TPanel;
    spl1: TSplitter;
    pnl2: TPanel;
    dbedtdoc_name: TDBEdit;
    dbedtdoc_path: TDBEdit;
    lbl1: TLabel;
    lbl2: TLabel;
    btn1: TBitBtn;
    btnSelect: TBitBtn;
    btn3: TBitBtn;
    btn4: TSpeedButton;
    dbchkdoc_use_owner_path: TDBCheckBox;
    btnAdd: TSpeedButton;
    btnDelete: TSpeedButton;
    btn2: TSpeedButton;
    dlgOpen1: TOpenDialog;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure qrTreeDataAfterScroll(DataSet: TDataSet);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnSelectClick(Sender: TObject);
    procedure qrTreeDataNewRecord(DataSet: TDataSet);
    procedure btn2Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  // открывает токумент, если в AData заполнено поле doc_id, иначе - предлогает заполнить это поле
procedure RunDocument(const AData: TDataSet; const AShowLinkDialogIfEmpty: Boolean = True;
  const AField: string = 'doc_id');

var
  fFileStorage: TfFileStorage;
  SelectedDocument: Variant;

implementation

{$R *.dfm}

uses Main, DataModule, GlobsAndConst;

procedure RunDocument(const AData: TDataSet; const AShowLinkDialogIfEmpty: Boolean = True;
  const AField: string = 'doc_id');
var
  filePath: string;
begin
  // Если передали пусто, то выходим
  if not CheckQrActiveEmpty(AData) then
    Exit;
  // Если нету такого поля
  if AData.FindField(AField) = nil then
  begin
    Application.MessageBox('Выбранный документ не может иметь связи с документом в хранилище!',
      'Просмотр документа', MB_OK + MB_ICONINFORMATION + MB_TOPMOST);
    Exit;
  end;
  // Если связанный документ не определен
  if (AData.FieldByName(AField).AsInteger = 0) and AShowLinkDialogIfEmpty then
  begin
    case Application.MessageBox('Выбранная запись не связана с документом из ханилища.' + #13#10 +
      'Произвести привязку нового или существующего документа?', 'Просмотр документа',
      MB_YESNO + MB_ICONQUESTION + MB_TOPMOST) of
      IDYES:
        begin
          SelectedDocument := null;
          // Создаем форму выбора документа
          if (not Assigned(fFileStorage)) then
            fFileStorage := TfFileStorage.Create(nil);
          fFileStorage.btnSelect.Visible := True;
          if fFileStorage.ShowModal = mrOk then
          begin
            try
              AData.Edit;
              AData.FieldByName(AField).Value := SelectedDocument;
              AData.Post;
            except
              on e: Exception do
                if Application.MessageBox('При попытке привязать документ возникла ошибка!' + #13#10 +
                  'Показать оригинальное сообщение?', 'Просмотр документа',
                  MB_YESNO + MB_ICONSTOP + MB_TOPMOST) = IDYES then
                begin
                  ShowMessage(e.Message);
                end;
            end;
          end;
          Exit;
        end;
      IDNO:
        begin
          Exit;
        end;
    end;
  end
  else if AData.FieldByName(AField).AsInteger <> 0 then
  begin
    filePath := FastSelectSQLOne('CALL GetDocumentPath(:0, NULL);',
      VarArrayOf([AData.FieldByName(AField).Value]));
    if filePath <> '' then
      Exec(filePath);
  end;

end;

procedure TfFileStorage.btn1Click(Sender: TObject);
begin
  Close;
end;

procedure TfFileStorage.btnSelectClick(Sender: TObject);
begin
  qrTreeData.CheckBrowseMode;
  SelectedDocument := qrTreeData.FieldByName('doc_id').Value;
end;

procedure TfFileStorage.btn2Click(Sender: TObject);
var
  parent_id: Integer;
begin
  parent_id := qrTreeData.FieldByName('doc_id').AsInteger;
  qrTreeData.Insert;
  qrTreeData.FieldByName('doc_name').AsString := 'Новый файл';
  qrTreeData.FieldByName('parent_id').AsInteger := parent_id;
  qrTreeData.FieldByName('doc_type').AsInteger := 1;
  qrTreeData.Post;
  qrTreeData.Locate('doc_id', parent_id, []);
end;

procedure TfFileStorage.btn3Click(Sender: TObject);
begin
  RunDocument(qrTreeData, False);
end;

procedure TfFileStorage.btn4Click(Sender: TObject);
begin
  if dlgOpen1.Execute then
  begin
    qrTreeData.Edit;
    qrTreeData.FieldByName('doc_path').AsString := dlgOpen1.FileName;
    qrTreeData.FieldByName('doc_name').AsString := ExtractFileName(dlgOpen1.FileName);
    qrTreeData.FieldByName('doc_use_owner_path').AsInteger := 0;
    qrTreeData.Post;
  end;
end;

procedure TfFileStorage.btnAddClick(Sender: TObject);
var
  parent_id: Integer;
begin
  parent_id := qrTreeData.FieldByName('doc_id').AsInteger;
  qrTreeData.Insert;
  qrTreeData.FieldByName('doc_name').AsString := 'Новый каталог';
  qrTreeData.FieldByName('parent_id').AsInteger := parent_id;
  qrTreeData.Post;
  qrTreeData.Locate('doc_id', parent_id, []);
end;

procedure TfFileStorage.btnDeleteClick(Sender: TObject);
begin
  if Application.MessageBox('Удалить запись?', 'Хранилище файлов', MB_YESNO + MB_ICONQUESTION + MB_TOPMOST) = IDYES
  then
  begin
    qrTreeData.Delete;
  end;
end;

procedure TfFileStorage.FormActivate(Sender: TObject);
begin
  // Если нажата клавиша Ctrl и выбираем форму, то делаем
  // каскадирование с переносом этой формы на передний план
  FormMain.CascadeForActiveWindow;
  // Делаем нажатой кнопку активной формы (на главной форме внизу)
  FormMain.SelectButtonActiveWindow(Caption);
end;

procedure TfFileStorage.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfFileStorage.FormCreate(Sender: TObject);
begin
  inherited;
  // Создаём кнопку от этого окна (на главной форме внизу)
  FormMain.CreateButtonOpenWindow(Caption, Caption, Self, 1);
  CloseOpen(qrTreeData);
end;

procedure TfFileStorage.FormDestroy(Sender: TObject);
begin
  // Удаляем кнопку от этого окна (на главной форме внизу)
  FormMain.DeleteButtonCloseWindow(Caption);
  fFileStorage := nil;
end;

procedure TfFileStorage.qrTreeDataAfterScroll(DataSet: TDataSet);
begin
  btnDelete.Enabled := qrTreeData.FieldByName('parent_id').AsInteger <> 0;
  btn2.Enabled := qrTreeData.FieldByName('doc_type').AsInteger = 0;
end;

procedure TfFileStorage.qrTreeDataNewRecord(DataSet: TDataSet);
begin
  qrTreeData.FieldByName('doc_id').Value := FastSelectSQLOne('SELECT GetNewID(:IDType)',
    VarArrayOf([C_ID_DOC]));
  if qrTreeData.FieldByName('doc_id').AsInteger = 0 then
    raise Exception.Create('Не удалось получить ID документа');
end;

end.
