unit CardMaterial;

interface

uses
  Windows, SysUtils, Classes, Controls, Forms, StdCtrls, ExtCtrls, Grids, DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, Tools,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFormCardMaterial = class(TSmForm)
    StringGrid: TStringGrid;
    Memo: TMemo;
    PanelTop: TPanel;
    LabelCode: TLabel;
    EditCode: TEdit;
    Panel2: TPanel;
    ButtonSave: TButton;
    ButtonClose: TButton;
    Panel1: TPanel;
    ADOQueryTemp: TFDQuery;

    procedure ButtonCloseClick(Sender: TObject);
    procedure ButtonSaveClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure StringGridDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
    procedure ShowForm(const vIdInMat: Integer);

  private
    IdInMat: Integer;

  end;

var
  FormCardMaterial: TFormCardMaterial;

implementation

uses Main, DataModule;

const
  FormCaption = 'Карточка материала';

{$R *.dfm}

  // ---------------------------------------------------------------------------------------------------------------------

procedure TFormCardMaterial.ButtonCloseClick(Sender: TObject);
begin
  Close;
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFormCardMaterial.ButtonSaveClick(Sender: TObject);
begin
  try
    with ADOQueryTemp, StringGrid do
    begin
      Active := False;
      SQL.Clear;
      SQL.Add('UPDATE materialcard_temp SET mat_norma = :mat_norma, mat_unit = :mat_unit, nds = :nds, ' +
        'coast_no_nds = :coast_no_nds, coast_nds = :coast_nds, coef_tr_zatr = :coef_tr_zatr, mat_name = :mat_name ' +
        'WHERE id = :id;');

      with StringGrid do
      begin
        ParamByName('mat_norma').Value := Cells[0, 1];
        ParamByName('mat_unit').Value := Cells[1, 1];
        ParamByName('coast_no_nds').Value := StrToInt(Cells[2, 1]);
        ParamByName('nds').Value := Cells[3, 1];
        ParamByName('coast_nds').Value := StrToInt(Cells[4, 1]);
        ParamByName('coef_tr_zatr').Value := Cells[5, 1];
        ParamByName('mat_name').Value := Memo.Text;
        ParamByName('id').Value := IdInMat;
      end;

      ExecSQL;
    end;
  except
    on E: Exception do
      MessageBox(0, PChar('При сохранении возникла ошибка:' + sLineBreak + E.Message), FormCaption,
        MB_ICONERROR + MB_OK + mb_TaskModal);
  end;

  Close;
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFormCardMaterial.FormCreate(Sender: TObject);
begin
  inherited;
  Caption := FormCaption;

  with StringGrid do
  begin
    ColCount := 6;
    RowCount := 2;

    FixedCols := 0;
    FixedRows := 1;

    Cells[0, 0] := 'Кол-во';
    Cells[1, 0] := 'Ед. изм.';
    Cells[2, 0] := 'Цена без НДС, руб';
    Cells[3, 0] := 'НДС, %';
    Cells[4, 0] := 'Цена с НДС, руб';
    Cells[5, 0] := '% трансп. и ЗСР';

    ColWidths[0] := 50;
    ColWidths[1] := 80;
    ColWidths[2] := 105;
    ColWidths[3] := 50;
    ColWidths[4] := 115;
    ColWidths[5] := 100;
  end;
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFormCardMaterial.FormShow(Sender: TObject);
var
  i: Integer;
  f: Double;
begin
  Left := FormMain.Left + (FormMain.Width - Width) div 2;
  Top := FormMain.Top + (FormMain.Height - Height) div 2;

  try
    with ADOQueryTemp, StringGrid do
    begin
      Active := False;
      SQL.Clear;
      SQL.Add('SELECT * FROM materialcard_temp WHERE id = :id;');
      ParamByName('id').Value := IdInMat;
      Active := True;

      for i := 0 to 5 do
        Cells[i, 1] := '';

      EditCode.Text := FieldByName('mat_code').AsString;
      Memo.Text := FieldByName('mat_name').AsString;

      f := FieldByName('mat_norma').AsFloat;

      Cells[0, 1] := MyFloatToStr(f);

      Cells[1, 1] := FieldByName('mat_unit').AsString;
      Cells[2, 1] := IntToStr(FieldByName('coast_no_nds').AsInteger);

      f := FieldByName('nds').AsFloat;
      Cells[3, 1] := MyFloatToStr(f);

      Cells[4, 1] := IntToStr(FieldByName('coast_nds').AsInteger);

      f := FieldByName('coef_tr_zatr').AsFloat;
      Cells[5, 1] := MyFloatToStr(f);
    end;
  except
    on E: Exception do
      MessageBox(0, PChar('При получении данных возникла ошибка:' + sLineBreak + E.Message), FormCaption,
        MB_ICONERROR + MB_OK + mb_TaskModal);
  end;

  StringGrid.SetFocus;
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFormCardMaterial.StringGridDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect;
  State: TGridDrawState);
var
  TW: Integer;
begin
  // Так как свойство таблицы DefaultDrawing отключено (иначе ячейка таблицы будет обведена пунктирной линией)
  // необходимо самому прорисовывать шапку и все строки таблицы
  with (Sender as TStringGrid) do
  begin
    if (ARow = 0) then // Прорисовка шапки таблицы
    begin
      Canvas.Brush.Color := PS.BackgroundHead;
      Canvas.Font.Color := PS.FontHead;
    end
    else // Прорисовка всех остальных строк
    begin
      Canvas.Brush.Color := PS.BackgroundRows;
      Canvas.Font.Color := PS.FontRows;
    end;

    if Focused and (ARow = Row) and (ACol = Col) then
    // Если таблица в фокусе и строка не равна первой строке
    begin
      Canvas.Brush.Color := PS.BackgroundSelectRow;
      Canvas.Font.Color := PS.FontSelectRow;
    end;

    Canvas.FillRect(Rect);
    TW := Canvas.TextWidth(Cells[ACol, ARow]);
    Canvas.TextOut(Rect.Left + (Rect.Right - Rect.Left - TW) div 2, Rect.Top + 3, Cells[ACol, ARow]);
  end;
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFormCardMaterial.ShowForm(const vIdInMat: Integer);
begin
  IdInMat := vIdInMat;
  ShowModal;
end;

// ---------------------------------------------------------------------------------------------------------------------

end.
