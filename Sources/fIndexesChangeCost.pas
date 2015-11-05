unit fIndexesChangeCost;

interface

uses
  Windows, SysUtils, Classes, Graphics, Controls, Forms, DB, VirtualTrees, Menus, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrameIndexesChangeCost = class(TFrame)
    VST: TVirtualStringTree;
    PopupMenu: TPopupMenu;
    PMAdd: TMenuItem;
    PMEdit: TMenuItem;
    PMDelete: TMenuItem;
    ADOQuery: TFDQuery;
    ADOQueryTemp: TFDQuery;

    constructor Create(AOwner: TComponent); Override;

    procedure TableFilling;

    procedure VSTAfterCellPaint(Sender: TBaseVirtualTree; TargetCanvas: TCanvas; Node: PVirtualNode;
      Column: TColumnIndex; CellRect: TRect);
    procedure VSTBeforeCellPaint(Sender: TBaseVirtualTree; TargetCanvas: TCanvas; Node: PVirtualNode;
      Column: TColumnIndex; CellPaintMode: TVTCellPaintMode; CellRect: TRect; var ContentRect: TRect);
    procedure VSTFocusChanged(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex);
    procedure VSTGetText(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex;
      TextType: TVSTTextType; var CellText: string);
    procedure VSTResize(Sender: TObject);
    procedure PMAddClick(Sender: TObject);
    procedure PMEditClick(Sender: TObject);
    procedure PMDeleteClick(Sender: TObject);
  end;

implementation

uses Main, DataModule, DrawingTables, CardIndexesChangeCost;

const
  CaptionFrame = FormNameIndexesChangeCost;

{$R *.dfm}

  // ---------------------------------------------------------------------------------------------------------------------

constructor TFrameIndexesChangeCost.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFrameIndexesChangeCost.TableFilling;
begin
  try
    // if ADOQuery.Active then
    // Exit;

    with ADOQuery do
    begin
      Active := False;
      SQL.Clear;
      SQL.Add('SELECT * FROM indexes_change_cost ORDER BY code;');
      Active := True;
    end;

    VST.RootNodeCount := ADOQuery.RecordCount;
    VST.Selected[VST.GetFirst] := True;
    VST.FocusedNode := VST.GetFirst;
  except
    on E: Exception do
      MessageBox(0, PChar('При запросе к БД возникла ошибка:' + sLineBreak + sLineBreak + E.Message),
        CaptionFrame, MB_ICONERROR + MB_OK + mb_TaskModal);
  end;
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFrameIndexesChangeCost.VSTAfterCellPaint(Sender: TBaseVirtualTree; TargetCanvas: TCanvas;
  Node: PVirtualNode; Column: TColumnIndex; CellRect: TRect);
var
  CellText: string;
begin
  if not ADOQuery.Active or (ADOQuery.RecordCount <= 0) then
    Exit;

  ADOQuery.RecNo := Node.Index + 1;

  case Column of
    1:
      CellText := ADOQuery.FieldByName('code').AsVariant;
    2:
      CellText := ADOQuery.FieldByName('name').AsVariant;
  end;

  VSTAfterCellPaintDefault(Sender, TargetCanvas, Node, Column, CellRect, CellText);
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFrameIndexesChangeCost.VSTBeforeCellPaint(Sender: TBaseVirtualTree; TargetCanvas: TCanvas;
  Node: PVirtualNode; Column: TColumnIndex; CellPaintMode: TVTCellPaintMode; CellRect: TRect;
  var ContentRect: TRect);
begin
  VSTBeforeCellPaintDefault(Sender, TargetCanvas, Node, Column, CellPaintMode, CellRect, ContentRect);
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFrameIndexesChangeCost.VSTFocusChanged(Sender: TBaseVirtualTree; Node: PVirtualNode;
  Column: TColumnIndex);
begin
  VSTFocusChangedDefault(Sender, Node, Column);

  if not ADOQuery.Active or (ADOQuery.RecordCount <= 0) or (VST.RootNodeCount <> Cardinal(ADOQuery.RecordCount)) then
    Exit;

  ADOQuery.RecNo := Node.Index + 1;

  PMEdit.Enabled := True;
  PMDelete.Enabled := True;

  if ADOQuery.FieldByName('constant').AsInteger = 1 then
  begin
    PMEdit.Enabled := False;
    PMDelete.Enabled := False;
  end;
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFrameIndexesChangeCost.VSTGetText(Sender: TBaseVirtualTree; Node: PVirtualNode;
  Column: TColumnIndex; TextType: TVSTTextType; var CellText: string);
begin
  if not ADOQuery.Active then
    Exit;

  if (ADOQuery.RecordCount <= 0) then
  begin
    VST.RootNodeCount := 1;

    case Column of
      0:
        CellText := '';
      1:
        CellText := '';
      2:
        CellText := 'Записей не найдено!';
    end;

    Exit;
  end;

  if Column > 0 then
    ADOQuery.RecNo := Node.Index + 1;

  case Column of
    0:
      CellText := IntToStr(Node.Index + 1);
    1:
      CellText := ADOQuery.FieldByName('code').AsVariant;
    2:
      CellText := ADOQuery.FieldByName('name').AsVariant;
  end;
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFrameIndexesChangeCost.VSTResize(Sender: TObject);
begin
  AutoWidthColumn(VST, 2);
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFrameIndexesChangeCost.PMAddClick(Sender: TObject);
begin
  FormCardIndexesChangeCost.ShowForm(-1, ADOQueryTemp);
  TableFilling;
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFrameIndexesChangeCost.PMEditClick(Sender: TObject);
begin
  FormCardIndexesChangeCost.ShowForm(ADOQuery.FieldByName('id').AsInteger, ADOQueryTemp);
  TableFilling;
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFrameIndexesChangeCost.PMDeleteClick(Sender: TObject);
begin
  if not ADOQuery.Active or (ADOQuery.RecordCount <= 0) then
  begin
    MessageBox(0, PChar('В таблице нет записей для удаления!'), CaptionFrame,
      MB_ICONINFORMATION + MB_OK + mb_TaskModal);
    Exit;
  end;

  if MessageBox(0, PChar('Удалить выделенную строку?'), CaptionFrame, MB_ICONINFORMATION + MB_YESNO +
    mb_TaskModal) = mrYes then
    try
      ADOQuery.RecNo := VST.FocusedNode.Index + 1;

      with ADOQueryTemp do
      begin
        Active := False;
        SQL.Clear;
        SQL.Add('DELETE FROM indexes_change_cost WHERE id = :id;');
        ParamByName('id').Value := ADOQuery.FieldByName('id').AsInteger;
        ExecSQL;
        Active := False;
      end;

      TableFilling;
    except
      on E: Exception do
        MessageBox(0, PChar('При удалении записи из БД возникла ошибка:' + sLineBreak + sLineBreak +
          E.Message), CaptionFrame, MB_ICONERROR + MB_OK + mb_TaskModal);
    end;
end;

// ---------------------------------------------------------------------------------------------------------------------

end.
