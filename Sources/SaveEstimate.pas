unit SaveEstimate;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, ExtCtrls, DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Tools;

type
  TFormSaveEstimate = class(TSmForm)
    Bevel1: TBevel;
    ButtonSave: TButton;
    ButtonCancel: TButton;
    Panel1: TPanel;
    LabelNumberEstimate: TLabel;
    EditNumberEstimate: TEdit;
    Panel2: TPanel;
    LabelNameEstimate: TLabel;
    EditNameEstimate: TEdit;
    ADOQueryTemp: TFDQuery;
    procedure ButtonCancelClick(Sender: TObject);
    procedure ButtonSaveClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  private
    StrQuery: String;

  public
    iIdEstimate: Integer;
    bSaveEstimate: Boolean;
  end;

var
  FormSaveEstimate: TFormSaveEstimate;

implementation

uses DataModule, Main;

{$R *.dfm}
// ---------------------------------------------------------------------------------------------------------------------

procedure TFormSaveEstimate.ButtonCancelClick(Sender: TObject);
begin
  close;
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFormSaveEstimate.ButtonSaveClick(Sender: TObject);
begin
  bSaveEstimate := True;
  close;
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFormSaveEstimate.FormCreate(Sender: TObject);
begin
  inherited;
  //
end;

procedure TFormSaveEstimate.FormShow(Sender: TObject);
var
  str, sm_number: string;
  Num: Integer;
begin
  Left := FormMain.Left + (FormMain.Width - Width) div 2;
  Top := FormMain.Top + (FormMain.Height - Height) div 2;

  with ADOQueryTemp do
  begin
    Active := False;
    StrQuery := 'SELECT * FROM smetasourcedata WHERE sm_id = ' + IntToStr(iIdEstimate) + ';';
    SQL.Clear;
    SQL.Add(StrQuery);
    Active := True;

    sm_number := FieldByName('sm_number').AsString;
  end;

  while sm_number[Length(sm_number)] <> '.' do
    Delete(sm_number, Length(sm_number), 1);

  with ADOQueryTemp do
  begin
    Active := False;
    StrQuery := 'SELECT max(sm_number) as NumberEstimate FROM smetasourcedata WHERE sm_id LIKE "' +
      str + '%";';
    SQL.Clear;
    SQL.Add(StrQuery);
    Active := True;

    str := FieldByName('NumberEstimate').AsString;
  end;

  while Pos('.', str) > 0 do
    Delete(str, 1, Pos('.', str));

  Num := StrToInt(str);

  inc(Num);

  EditNumberEstimate.Text := sm_number + IntToStr(Num);

  bSaveEstimate := False;
  EditNameEstimate.Text := '';
  EditNameEstimate.SetFocus;
end;

// ---------------------------------------------------------------------------------------------------------------------

end.
