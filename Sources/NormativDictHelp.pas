unit NormativDictHelp;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.Grids, Vcl.DBGrids, JvExDBGrids, JvDBGrid,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, JvComponentBase, JvFormPlacement,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, System.UITypes, Tools, Vcl.Menus, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls;

type
  TfNormativDictHelp = class(TSmForm)
    pgc1: TPageControl;
    ts1: TTabSheet;
    ts2: TTabSheet;
    ts3: TTabSheet;
    ts4: TTabSheet;
    grMain1: TJvDBGrid;
    qrMainData: TFDQuery;
    dsMainData: TDataSource;
    FormStorage: TJvFormStorage;
    grMain2: TJvDBGrid;
    grMain3: TJvDBGrid;
    grMain4: TJvDBGrid;
    ts5: TTabSheet;
    grMain5: TJvDBGrid;
    pm1: TPopupMenu;
    mN1: TMenuItem;
    pnlSelDir: TPanel;
    lstSelDict: TListBox;
    btnSelDirOk: TBitBtn;
    btnSelDirCancel: TBitBtn;
    lbl1: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure pgc1Change(Sender: TObject);
    procedure grMain1DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure mN1Click(Sender: TObject);
    procedure btnSelDirCancelClick(Sender: TObject);
    procedure btnSelDirOkClick(Sender: TObject);
    procedure qrMainDataAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fNormativDictHelp: TfNormativDictHelp;

implementation

{$R *.dfm}

uses Main, DataModule;

procedure TfNormativDictHelp.btnSelDirOkClick(Sender: TObject);
var
  Path: string;
begin
  Path := ExtractFilePath(Application.ExeName) + 'Normative documents\' + lstSelDict.Items
    [lstSelDict.ItemIndex] + '\data.doc';
  pnlSelDir.Visible := False;
  if not FileExists(Path) then
  begin
    MessageBox(0, PChar('Вы пытаетесь открыть файл:' + sLineBreak + sLineBreak + Path + sLineBreak +
      sLineBreak + 'которого не существует!'), '', MB_ICONWARNING + MB_OK + mb_TaskModal);

    Exit;
  end;
  Exec(Path);
end;

procedure TfNormativDictHelp.btnSelDirCancelClick(Sender: TObject);
begin
  pnlSelDir.Visible := False;
end;

procedure TfNormativDictHelp.FormActivate(Sender: TObject);
begin
  // Если нажата клавиша Ctrl и выбираем форму, то делаем
  // каскадирование с переносом этой формы на передний план
  FormMain.CascadeForActiveWindow;
  // Делаем нажатой кнопку активной формы (на главной форме внизу)
  FormMain.SelectButtonActiveWindow(Caption);
end;

procedure TfNormativDictHelp.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfNormativDictHelp.FormCreate(Sender: TObject);
begin
  inherited;
  CaptionButton := InitParams[0];
  HintButton := InitParams[1];
  Caption := 'Перечень сборников нормативов расхода ресурсов в натуральном выражении - ' + CaptionButton;
  // Создаём кнопку от этого окна (на главной форме внизу)
  FormMain.CreateButtonOpenWindow(CaptionButton, HintButton, Self, 1);
  CloseOpen(qrMainData);
  pgc1Change(Sender);
end;

procedure TfNormativDictHelp.FormDestroy(Sender: TObject);
begin
  // Удаляем кнопку от этого окна (на главной форме внизу)
  FormMain.DeleteButtonCloseWindow(CaptionButton);
  fNormativDictHelp := nil;
end;

procedure TfNormativDictHelp.grMain1DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer;
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

procedure TfNormativDictHelp.mN1Click(Sender: TObject);
var
  Path, NumberNormativ: string;
begin
  NumberNormativ := qrMainData.FieldByName('dict_dir').AsString;

  if Pos(',', NumberNormativ) <> 0 then
  begin
    pnlSelDir.Left := pm1.PopupPoint.x;
    pnlSelDir.Top := pm1.PopupPoint.y - 40;
    pnlSelDir.Visible := True;
    lstSelDict.Items.Text := StringReplace(NumberNormativ, ',', ''#13, [rfReplaceAll]);
    lstSelDict.ItemIndex := 0;
  end
  else
  begin
    Path := ExtractFilePath(Application.ExeName) + 'Normative documents\' + NumberNormativ + '\data.doc';

    if not FileExists(Path) then
    begin
      MessageBox(0, PChar('Вы пытаетесь открыть файл:' + sLineBreak + sLineBreak + Path + sLineBreak +
        sLineBreak + 'которого не существует!'), '', MB_ICONWARNING + MB_OK + mb_TaskModal);
      Exit;
    end;
    Exec(Path);
  end;
end;

procedure TfNormativDictHelp.pgc1Change(Sender: TObject);
begin
  qrMainData.Filter := 'id_type=' + IntToStr(pgc1.ActivePageIndex + 1);
  qrMainData.Filtered := True;
end;

procedure TfNormativDictHelp.qrMainDataAfterScroll(DataSet: TDataSet);
begin
  pnlSelDir.Visible := False;
end;

end.
