unit CopyToOwnDialog;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Tools;

type
  TfCopyToOwnDialog = class(TSmForm)
    lbl1: TLabel;
    btn1: TBitBtn;
    btn2: TBitBtn;
    btn3: TBitBtn;
    lbl2: TLabel;
    procedure btn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    OBJ_NAME: string;
  public

  end;

function ShowCopyToOwnDialog(var AOBJ_NAME: string): Variant;

implementation

{$R *.dfm}

function ShowCopyToOwnDialog(var AOBJ_NAME: string): Variant;
var
  f: TfCopyToOwnDialog;
begin
  Result := Null;
  f := TfCopyToOwnDialog.Create(nil);
  try
    f.OBJ_NAME := AOBJ_NAME;
    f.lbl2.Caption := 'Запись с названием: ' + AOBJ_NAME;
    case f.ShowModal of
      // Заменить
      mrOk:
        Result := 1;
      // Попытаться переименовать
      mrRetry:
        begin
          AOBJ_NAME := f.OBJ_NAME;
          Result := 2;
        end;
    end;
  finally
    FreeAndNil(f);
  end;
end;

procedure TfCopyToOwnDialog.btn2Click(Sender: TObject);
var
  s: string;
begin
  s := InputBox('Копирование', 'Укажите новое наименование:', OBJ_NAME);

  if TRIM(s) <> '' then
  begin
    OBJ_NAME := s;
    ModalResult := mrRetry;
  end;
end;

procedure TfCopyToOwnDialog.FormCreate(Sender: TObject);
begin
  inherited;
  //
end;

end.
