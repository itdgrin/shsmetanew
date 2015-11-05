unit fFrameOXROPR;

interface

uses
  Windows, SysUtils, Classes, Graphics, Controls, Forms, StdCtrls, Buttons, ExtCtrls, Menus, Clipbrd, DB,
  DBCtrls, VirtualTrees, fFrameStatusBar, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, fFrameSmeta, Vcl.Grids, Vcl.DBGrids, JvExDBGrids, JvDBGrid,
  System.UITypes, System.Variants;

type
  TSplitter = class(ExtCtrls.TSplitter)
  public
    procedure Paint(); override;
  end;

type
  TFrameOXROPR = class(TSmetaFrame)
    DataSourceTypeWork: TDataSource;

    PopupMenu: TPopupMenu;
    CopyCell: TMenuItem;
    OXROPRSearch: TMenuItem;
    OXROPRSearchFast: TMenuItem;
    OXROPRSearchAccurate: TMenuItem;

    Panel: TPanel;
    PanelTop: TPanel;
    PanelMemo: TPanel;
    PanelTable: TPanel;

    RadioButtonCity: TRadioButton;
    RadioButtonVillage: TRadioButton;
    RadioButtonMinsk: TRadioButton;
    BevelLine: TBevel;

    Splitter: TSplitter;
    ImageSplitter: TImage;
    LabelTypeWork: TLabel;
    LabelResolution: TLabel;
    ComboBoxResolution: TComboBox;
    FrameStatusBar: TFrameStatusBar;
    SpeedButtonShowHide: TSpeedButton;
    DBLookupComboBoxTypeWork: TDBLookupComboBox;
    ADOQueryTemp: TFDQuery;
    ADOQueryTypeWork: TFDQuery;
    qrMain: TFDQuery;
    JvDBGrid1: TJvDBGrid;
    dsMain: TDataSource;
    dbmmoNameWork: TDBMemo;

    procedure FillingTypeWork;
    procedure FillingResolution;
    procedure ReceivingSearch;
    procedure DBLookupComboBoxTypeWorkClick(Sender: TObject);

    procedure PanelTableResize(Sender: TObject);
    procedure PanelTopResize(Sender: TObject);
    procedure RadioButtonClick(Sender: TObject);
    procedure SpeedButtonShowHideClick(Sender: TObject);
    procedure ComboBoxResolutionChange(Sender: TObject);
    procedure qrMainAfterScroll(DataSet: TDataSet);
    procedure JvDBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure qrMainBeforePost(DataSet: TDataSet);
  public
    MaisCodeList: TStringList;
    procedure ReceivingAll; override;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

implementation

uses DrawingTables, DataModule, Tools, Main, OXROPR;

{$R *.dfm}

const
  // Название этого фрейма
  CaptionFrame = 'Фрейм «ОХР и ОПР»';

  { TSplitter }
procedure TSplitter.Paint();
begin
  // inherited;
end;

destructor TFrameOXROPR.Destroy;
begin
  MaisCodeList.Free;
  inherited;
end;

constructor TFrameOXROPR.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  // ----------------------------------------
  LoadDBGridSettings(JvDBGrid1);

  PanelMemo.Constraints.MinHeight := 35;
  SpeedButtonShowHide.Hint := 'Свернуть панель';

  with DM do
  begin
    ImageListHorozontalDots.GetIcon(0, ImageSplitter.Picture.Icon);
    ImageListArrowsBottom.GetBitmap(0, SpeedButtonShowHide.Glyph);
  end;

  // ----------------------------------------
  MaisCodeList := TStringList.Create;

  FillingTypeWork;
  FillingResolution;
end;

procedure TFrameOXROPR.FillingTypeWork;
var
  StrQuery: string;
  IdRegion: Integer;
begin
  try
    qrMain.FormatOptions.FmtDisplayNumeric := '0.000';
    if RadioButtonMinsk.Checked then
    begin
      IdRegion := 3;
      qrMain.FormatOptions.FmtDisplayNumeric := '0.0000';
    end
    else if RadioButtonCity.Checked then
      IdRegion := 1
    else
      IdRegion := 2;

    StrQuery := 'SELECT * FROM objstroj WHERE obj_region = ' + IntToStr(IdRegion) + ' order by stroj_id';

    with ADOQueryTypeWork do
    begin
      Active := False;
      SQL.Clear;
      SQL.Add(StrQuery);
      Active := True;
    end;

    with DBLookupComboBoxTypeWork do
    begin
      ListSource := DataSourceTypeWork;
      ListField := 'name';
      KeyField := 'stroj_id';
      KeyValue := ADOQueryTypeWork.FieldByName('stroj_id').AsInteger;
    end;
  except
    on E: Exception do
      MessageBox(0, PChar('При заполнении выпадающего списка ' + sLineBreak + '«Вид работ» возникла ошибка:' +
        sLineBreak + sLineBreak + E.Message), CaptionFrame, MB_ICONERROR + MB_OK + mb_TaskModal);
  end;
end;

procedure TFrameOXROPR.JvDBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer;
  Column: TColumn; State: TGridDrawState);
begin
  with (Sender AS TJvDBGrid).Canvas do
  begin
    Brush.Color := PS.BackgroundRows;
    Font.Color := PS.FontRows;

    // Строка в фокусе
    if (Assigned(TMyDBGrid((Sender AS TJvDBGrid)).DataLink) and
      ((Sender AS TJvDBGrid).Row = TMyDBGrid((Sender AS TJvDBGrid)).DataLink.ActiveRecord + 1)) then
    begin
      Brush.Color := PS.BackgroundSelectRow;
      Font.Color := PS.FontSelectRow;
    end;
    // Ячейка в фокусе
    if (gdSelected in State) then
    begin
      Brush.Color := PS.BackgroundSelectCell;
      Font.Color := PS.FontSelectCell;
      Font.Style := Font.Style + [fsBold];
    end;
  end;

  (Sender AS TJvDBGrid).DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TFrameOXROPR.FillingResolution;
var
  StrQuery: string;
begin
  try
    StrQuery := 'SELECT * FROM mais ORDER BY onDate DESC;';

    with ADOQueryTemp do
    begin
      Active := False;
      SQL.Clear;
      SQL.Add(StrQuery);
      Active := True;

      First;
      ComboBoxResolution.Items.Clear;

      while not Eof do
      begin
        ComboBoxResolution.Items.Add(FieldByName('comment').AsString);
        MaisCodeList.Add(FieldByName('mais_id').AsString);
        Next;
      end;
    end;

    ComboBoxResolution.ItemIndex := 0;
  except
    on E: Exception do
      MessageBox(0, PChar('При заполнении выпадающего списка ' + sLineBreak +
        '«Постановления» возникла ошибка:' + sLineBreak + sLineBreak + E.Message), CaptionFrame,
        MB_ICONERROR + MB_OK + mb_TaskModal);
  end;
end;

procedure TFrameOXROPR.ReceivingAll;
begin
  ReceivingSearch;
  fLoaded := True;
end;

procedure TFrameOXROPR.ReceivingSearch;
var
  StrQuery: string;
  WhereStr: string;
  colP1, colP2: string;
begin
  qrMain.Active := False;
  WhereStr := ' where MAIS_ID = ' + MaisCodeList[ComboBoxResolution.ItemIndex];

  colP1 := ADOQueryTypeWork.FieldByName('COL1NAME').AsString;
  colP2 := ADOQueryTypeWork.FieldByName('COL2NAME').AsString;
  JvDBGrid1.Columns[2].FieldName := colP1;
  JvDBGrid1.Columns[3].FieldName := colP2;

  StrQuery := 'SELECT CONCAT(objdetailex.number, "") as number,' + 'objworks.WORK_NAME as NameWork,' + colP1 +
    ',' + colP2 + ',objdetailex.ID FROM objdetailex' +
    ' LEFT JOIN objworks ON objworks.WORK_ID=objdetailex.number ' + WhereStr +
    ' ORDER BY objdetailex.number ASC';

  qrMain.SQL.Text := StrQuery;
  qrMain.Active := True;
end;

procedure TFrameOXROPR.DBLookupComboBoxTypeWorkClick(Sender: TObject);
begin
  ReceivingSearch;
end;

procedure TFrameOXROPR.PanelTableResize(Sender: TObject);
begin
  ImageSplitter.Top := Splitter.Top;
  ImageSplitter.Left := Splitter.Left + (Splitter.Width - ImageSplitter.Width) div 2;
end;

procedure TFrameOXROPR.PanelTopResize(Sender: TObject);
begin
  DBLookupComboBoxTypeWork.Left := LabelTypeWork.Left + LabelTypeWork.Width + 6;
  DBLookupComboBoxTypeWork.Width := 200;

  LabelResolution.Left := DBLookupComboBoxTypeWork.Left + DBLookupComboBoxTypeWork.Width + 6;

  ComboBoxResolution.Left := LabelResolution.Left + LabelResolution.Width + 6;
  ComboBoxResolution.Width := PanelTop.Width - ComboBoxResolution.Left - 3;
end;

procedure TFrameOXROPR.RadioButtonClick(Sender: TObject);
begin
  FillingTypeWork;
  ReceivingSearch;
end;

procedure TFrameOXROPR.qrMainAfterScroll(DataSet: TDataSet);
begin
  inherited;
  FrameStatusBar.InsertText(0, IntToStr(qrMain.RecordCount)); // Количество записей

  if qrMain.RecordCount > 0 then
    FrameStatusBar.InsertText(1, IntToStr(qrMain.RecNo)) // Номер выделенной записи
  else
    FrameStatusBar.InsertText(1, '-1'); // Нет записей
end;

procedure TFrameOXROPR.qrMainBeforePost(DataSet: TDataSet);
begin
  FastExecSQL('UPDATE objdetailex SET ' + JvDBGrid1.Columns[2].FieldName + '=:0, ' + JvDBGrid1.Columns[3]
    .FieldName + '=:1 WHERE ID=:2', VarArrayOf([qrMain.FieldByName(JvDBGrid1.Columns[2].FieldName).Value,
    qrMain.FieldByName(JvDBGrid1.Columns[3].FieldName).Value, qrMain.FieldByName('ID').Value]));
end;

procedure TFrameOXROPR.ComboBoxResolutionChange(Sender: TObject);
begin
  inherited;
  ReceivingSearch;
end;

procedure TFrameOXROPR.SpeedButtonShowHideClick(Sender: TObject);
begin
  MemoShowHide(Sender, Splitter, PanelMemo);
end;

end.
