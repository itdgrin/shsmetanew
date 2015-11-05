unit CardIndexesChangeCost;

interface

uses
  Windows, SysUtils, Classes, Controls, Forms, StdCtrls, ExtCtrls, FireDAC.Stan.Intf, Tools,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFormCardIndexesChangeCost = class(TSmForm)
    PanelCode: TPanel;
    LabelCode: TLabel;
    EditCode: TEdit;

    PanelName: TPanel;
    LabelName: TLabel;
    EditName: TEdit;

    Bevel: TBevel;
    ButtonSave: TButton;
    ButtonClose: TButton;

    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);

    procedure ShowForm(const vIdEdit: Integer; const vADOQuery: TFDQuery);

    procedure ButtonSaveClick(Sender: TObject);
    procedure ButtonCloseClick(Sender: TObject);

  private
    ADOQuery: TFDQuery;
    ConfirmationClose: Boolean;
    IdEdit: Integer; // Id редактируемой записи, если Id = -1, то идЄт добавление записи.
  end;

var
  FormCardIndexesChangeCost: TFormCardIndexesChangeCost;

implementation

uses Main;

const
  FormCaption = FormNameCardIndexesChangeCost;

{$R *.dfm}
  // ---------------------------------------------------------------------------------------------------------------------

procedure TFormCardIndexesChangeCost.FormCreate(Sender: TObject);
begin
  inherited;
  Caption := FormCaption;
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFormCardIndexesChangeCost.FormShow(Sender: TObject);
begin
  Left := FormMain.Left + (FormMain.Width - Width) div 2;
  Top := FormMain.Top + (FormMain.Height - Height) div 2;

  ConfirmationClose := True;

  // ----------------------------------------

  EditCode.Text := '';
  EditName.Text := '';

  EditCode.SetFocus;

  if IdEdit = -1 then
    Exit;

  try
    with ADOQuery do
    begin
      Active := False;
      SQL.Clear;
      SQL.Add('SELECT * FROM indexes_change_cost WHERE id = :id;');
      ParamByName('id').Value := IdEdit;
      Active := True;

      EditCode.Text := IntToStr(FieldByName('code').AsInteger);
      EditName.Text := FieldByName('name').AsString;

      Active := False;
    end;
  except
    on E: Exception do
      MessageBox(0, PChar('ѕри получении данных редактируемой записи возникла ошибка:' + sLineBreak +
        sLineBreak + E.Message), FormCaption, MB_ICONERROR + MB_OK + mb_TaskModal);
  end
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFormCardIndexesChangeCost.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if ConfirmationClose then
    if MessageBox(0, PChar('«акрыть без сохранени€ сделанных изменений?'), FormCaption,
      MB_ICONINFORMATION + MB_YESNO + mb_TaskModal) = mrNo then
      CanClose := False;
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFormCardIndexesChangeCost.ShowForm(const vIdEdit: Integer; const vADOQuery: TFDQuery);
begin
  IdEdit := vIdEdit;
  ADOQuery := vADOQuery;

  ShowModal;
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFormCardIndexesChangeCost.ButtonSaveClick(Sender: TObject);
var
  Count: Integer;
begin
  Count := 0;

  if EditCode.Text = '' then
    Inc(Count);

  if EditName.Text = '' then
    Inc(Count);

  if Count > 0 then
  begin
    MessageBox(0, PChar('ќдно или более полей не были заполнены!'), FormCaption,
      MB_ICONWARNING + MB_OK + mb_TaskModal);
    Exit;
  end;

  with ADOQuery do
  begin
    Active := False;
    SQL.Clear;

    if IdEdit = -1 then
      SQL.Add('INSERT INTO indexes_change_cost (code, name) VALUE (:code, :name);')
    else
      SQL.Add('UPDATE indexes_change_cost SET code = :code, name = :name WHERE id = :id;');

    ParamByName('code').Value := EditCode.Text;
    ParamByName('name').Value := EditName.Text;

    if IdEdit > -1 then
      ParamByName('id').Value := IdEdit;

    ExecSQL;
    Active := False;
  end;

  ConfirmationClose := False;
  Close;
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFormCardIndexesChangeCost.ButtonCloseClick(Sender: TObject);
begin
  Close;
end;

// ---------------------------------------------------------------------------------------------------------------------

end.
