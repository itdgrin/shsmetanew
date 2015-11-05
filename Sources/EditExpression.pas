unit EditExpression;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ImgList, Vcl.Buttons,
  {System.Win.ComObj,} System.UITypes, Tools;

type
  TfEditExpression = class(TSmForm)
    edtFormula: TEdit;
    btnCancel: TSpeedButton;
    btnOk: TSpeedButton;
    lbl1: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function CalcExpression(const AFormula: string = ''; const AShowDialog: Boolean = True): Variant;

var
  fEditExpression: TfEditExpression;

exports CalcExpression;

implementation

{$R *.dfm}

function CalcExpression(const AFormula: string = ''; const AShowDialog: Boolean = True): Variant;
begin
  Result := Null;
  if AShowDialog then
  begin
    try
      fEditExpression := TfEditExpression.Create(nil, NULL);
      if Trim(AFormula) <> '' then
        fEditExpression.edtFormula.Text := Trim(AFormula);
      if (fEditExpression.ShowModal = mrOk) and (Trim(fEditExpression.edtFormula.Text) <> '') then
      begin
        try
          Result := FastSelectSQLOne('SELECT (' + StringReplace(Trim(fEditExpression.edtFormula.Text), ',',
            '.', [rfReplaceAll]) + ') AS res', VarArrayOf([]));
        except
          Result := Null;
        end;
      end;
    finally
      fEditExpression.Free;
    end;
  end
  else
  begin
    try
      Result := FastSelectSQLOne('SELECT (' + StringReplace(Trim(AFormula), ',', '.', [rfReplaceAll]) +
        ') AS res', VarArrayOf([]));
    except
      Result := Null;
    end;
  end;
end;

procedure TfEditExpression.btnCancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfEditExpression.btnOkClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfEditExpression.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfEditExpression.FormCreate(Sender: TObject);
begin
  inherited;
  //
end;

procedure TfEditExpression.FormDestroy(Sender: TObject);
begin
  fEditExpression := nil;
end;

procedure TfEditExpression.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  case Key of
    VK_RETURN:
      btnOk.Click;
    VK_ESCAPE:
      btnCancel.Click;
  end;
end;

end.
