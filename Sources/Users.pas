unit Users;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.DBCtrls, JvComponentBase,
  JvFormPlacement, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Buttons, Vcl.ToolWin, Vcl.Mask, JvExComCtrls,
  JvDBTreeView, Tools;

type
  TfUsers = class(TSmForm)
    pgc1: TPageControl;
    ts1: TTabSheet;
    ts2: TTabSheet;
    spl1: TSplitter;
    FormStorage: TJvFormStorage;
    qrUserGroup: TFDQuery;
    dsUserGroup: TDataSource;
    pnl1: TPanel;
    dblklst1: TDBLookupListBox;
    lbl1: TLabel;
    pnl2: TPanel;
    lbl2: TLabel;
    tlb3: TToolBar;
    btn2: TToolButton;
    btn1: TToolButton;
    btn3: TToolButton;
    btn4: TToolButton;
    tlb1: TToolBar;
    btn5: TToolButton;
    btn6: TToolButton;
    btn7: TToolButton;
    btn8: TToolButton;
    pnl3: TPanel;
    lbl3: TLabel;
    dblklst2: TDBLookupListBox;
    spl2: TSplitter;
    pnl4: TPanel;
    lbl4: TLabel;
    qrUser: TFDQuery;
    dsUser: TDataSource;
    pnl5: TPanel;
    lbl5: TLabel;
    dbedtUSER_GROUP_NAME: TDBEdit;
    pnl6: TPanel;
    lbl6: TLabel;
    dbedtUSER_NAME: TDBEdit;
    lbl7: TLabel;
    lbl8: TLabel;
    lbl9: TLabel;
    dblkcbbUSER_GROUP_ID: TDBLookupComboBox;
    dbedtUSER_PASS: TDBEdit;
    edt1: TEdit;
    qrTreeData: TFDQuery;
    dsTreeData: TDataSource;
    tvDocuments: TJvDBTreeView;
    JvDBTreeView1: TJvDBTreeView;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn7Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure qrUserAfterScroll(DataSet: TDataSet);
    procedure qrUserBeforePost(DataSet: TDataSet);
    procedure pgc1Changing(Sender: TObject; var AllowChange: Boolean);
    procedure qrUserAfterEdit(DataSet: TDataSet);
    procedure qrUserAfterPost(DataSet: TDataSet);
    procedure btn5Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fUsers: TfUsers;

implementation

{$R *.dfm}

uses Main, DataModule, GlobsAndConst;

procedure TfUsers.btn2Click(Sender: TObject);
begin
  qrUserGroup.Insert;
end;

procedure TfUsers.btn3Click(Sender: TObject);
begin
  pnl2.Enabled := not pnl2.Enabled;
end;

procedure TfUsers.btn5Click(Sender: TObject);
begin
  qrUser.Insert;
end;

procedure TfUsers.btn7Click(Sender: TObject);
begin
  pnl4.Enabled := not pnl4.Enabled;
end;

procedure TfUsers.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfUsers.FormCreate(Sender: TObject);
begin
  inherited;
  pgc1.ActivePageIndex := 0;
  CloseOpen(qrUserGroup);
  CloseOpen(qrUser);
end;

procedure TfUsers.FormDestroy(Sender: TObject);
begin
  fUsers := nil;
end;

procedure TfUsers.pgc1Changing(Sender: TObject; var AllowChange: Boolean);
begin
  { AllowChange := False;
    qrUser.CheckBrowseMode;
    qrUserGroup.CheckBrowseMode;
    AllowChange := True; }
  AllowChange := (qrUser.State in [dsBrowse]) and (qrUserGroup.State in [dsBrowse]);
end;

procedure TfUsers.qrUserAfterEdit(DataSet: TDataSet);
begin
  btn7.Caption := 'Сохранить';
  btn7.ImageIndex := 56;
end;

procedure TfUsers.qrUserAfterPost(DataSet: TDataSet);
begin
  btn7.Caption := 'Редактировать';
  btn7.ImageIndex := 44;
end;

procedure TfUsers.qrUserAfterScroll(DataSet: TDataSet);
begin
  edt1.Text := '';
end;

procedure TfUsers.qrUserBeforePost(DataSet: TDataSet);
begin
  if edt1.Text <> dbedtUSER_PASS.Text then
  begin
    Application.MessageBox('Ошибка повторного набора пароля!', 'Учетные записи пользователей',
      MB_OK + MB_ICONSTOP + MB_TOPMOST);
    edt1.SetFocus;
    Abort;
  end;
end;

end.
