unit CardOrganization;

interface

uses
  Windows, SysUtils, Classes, Controls, Forms, StdCtrls, ExtCtrls, DB, Grids, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  System.Variants, Vcl.Mask, Vcl.DBCtrls, Tools;

type
  TfCardOrganization = class(TSmForm)
    Bevel: TBevel;
    btnSave: TButton;
    btnClose: TButton;
    lbl1: TLabel;
    dbedtNAME: TDBEdit;
    dbedtUNN: TDBEdit;
    dbedtACCOUNT: TDBEdit;
    dbedtOKPO: TDBEdit;
    dbedtADDRESS: TDBEdit;
    dbedtEMAIL: TDBEdit;
    dbedtPHONE: TDBEdit;
    dbedtRUK_PROF: TDBEdit;
    dbedtRUK_FIO: TDBEdit;
    dbedtCONTACT_FIO: TDBEdit;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    lbl9: TLabel;
    lbl10: TLabel;
    lbl11: TLabel;
    dbedtFAX: TDBEdit;
    lbl12: TLabel;
    dbedtACCOUNT1: TDBEdit;
    lbl13: TLabel;
    lbl14: TLabel;
    dbedtBANK: TDBEdit;
    lbl15: TLabel;
    dbedtOKPO1: TDBEdit;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btnCloseClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    SkeepAskBeforeClose: Boolean;
  end;

var
  fCardOrganization: TfCardOrganization;

implementation

uses OrganizationsEx;

{$R *.dfm}

procedure TfCardOrganization.btnSaveClick(Sender: TObject);
begin
  if fOrganizationsEx.qrMain.State in [dsEdit, dsInsert] then
    fOrganizationsEx.qrMain.Post;
  SkeepAskBeforeClose := True;
  ModalResult := mrOk;
  Close;
end;

procedure TfCardOrganization.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfCardOrganization.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := SkeepAskBeforeClose;
  if not SkeepAskBeforeClose and (MessageBox(0, PChar('«акрыть без сохранени€ сделанных изменений?'),
    PWideChar(fCardOrganization.Caption), MB_ICONINFORMATION + MB_YESNO + mb_TaskModal) = mrYes) then
  begin
    fOrganizationsEx.qrMain.Cancel;
    CanClose := True;
  end;
end;

procedure TfCardOrganization.FormCreate(Sender: TObject);
begin
  inherited;
  //
end;

procedure TfCardOrganization.FormDestroy(Sender: TObject);
begin
  fCardOrganization := nil;
end;

procedure TfCardOrganization.btnCloseClick(Sender: TObject);
begin
  SkeepAskBeforeClose := False;
  ModalResult := mrCancel;
  Close;
end;

end.
