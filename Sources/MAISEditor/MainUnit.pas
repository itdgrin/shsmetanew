unit MainUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Vcl.StdCtrls, Vcl.Mask,
  Vcl.DBCtrls, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids,
  Vcl.DBGrids, Vcl.ImgList, Vcl.ExtCtrls, ComObj, ActiveX;

type
  TfrmMAIS = class(TForm)
    Label1: TLabel;
    DBGrid1: TDBGrid;
    dsMAIS: TDataSource;
    qrMAIS: TFDQuery;
    DBEdit1: TDBEdit;
    OpenDialog1: TOpenDialog;
    ButtonedEdit1: TButtonedEdit;
    Label2: TLabel;
    ImageList1: TImageList;
    Button1: TButton;
    Button2: TButton;
    procedure FormShow(Sender: TObject);
    procedure ButtonedEdit1RightButtonClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMAIS: TfrmMAIS;

implementation

{$R *.dfm}

uses DataModule, GlobsAndConst;

procedure TfrmMAIS.Button1Click(Sender: TObject);
var ExlApp, WorkSheet: OleVariant;
    FData: OleVariant;
    i, j: Integer;
begin
  ExlApp := Unassigned;
  try
    ExlApp := CreateOleObject('Excel.Application');
    ExlApp.Visible:=false;
    ExlApp.DisplayAlerts := False;
  except
    on e: exception do
    begin
      if not VarIsEmpty(ExlApp) then
      begin
        ExlApp.Quit;
        ExlApp := Unassigned;
      end;
      raise Exception.Create('Ошибка инициализации Excel:' + e.Message);
    end;
  end;

  try
    ExlApp.WorkBooks.Open(ButtonedEdit1.Text);
    WorkSheet := ExlApp.ActiveWorkbook.ActiveSheet;
  except
    on e: exception do
    begin
      ExlApp.Quit;
      ExlApp := Unassigned;
      raise Exception.Create('Ошибка открытия Excel документа:' + e.Message);
    end;
  end;

  DM.qrDifferent.SQL.Text := 'Delete from objdetailex where MAIS_ID = ' +
    qrMAIS.FieldByName('ID').AsString;
  DM.qrDifferent.ExecSQL;

  DM.qrDifferent.SQL.Text := 'Insert into objdetailex (MAIS_ID,NUMBER,P1,' +
    'P2,P3,P4,P5,P6,P7,P8,P9,P10,P11,P12,P13,P14,P15,P16,P17,P18,P19,P20,' +
    'P21,P22,P23,P24) values (:MAIS_ID,:NUMBER,:P1,:P2,:P3,:P4,:P5,:P6,' +
    ':P7,:P8,:P9,:P10,:P11,:P12,:P13,:P14,:P15,:P16,:P17,:P18,:P19,:P20,' +
    ':P21,:P22,:P23,:P24)';

  try
    FData := null;
    FData := WorkSheet.Range[WorkSheet.Cells[8, 3].Address,
      WorkSheet.Cells[28, 26].Address].Value;

    for j := 1 to 21 do
    begin
      DM.qrDifferent.ParamByName('MAIS_ID').Value :=
        qrMAIS.FieldByName('ID').AsString;
      DM.qrDifferent.ParamByName('NUMBER').Value := j;
      for i := 1 to 24 do
      begin
        DM.qrDifferent.ParamByName('P' + IntToStr(i)).Value := FData[j,i];
      end;
      DM.qrDifferent.ExecSQL;
    end;
    ShowMessage('Обновлено успешно!');
  finally
    FData := null;
    ExlApp.ActiveWorkbook.Close;
    ExlApp.Quit;
    ExlApp := Unassigned;
  end;
end;

procedure TfrmMAIS.Button2Click(Sender: TObject);
begin
  DM.qrDifferent.SQL.Text := 'Delete from objdetailex where MAIS_ID = ' +
    qrMAIS.FieldByName('ID').AsString;
  DM.qrDifferent.ExecSQL;
  qrMAIS.Delete;
end;

procedure TfrmMAIS.ButtonedEdit1RightButtonClick(Sender: TObject);
begin
  if OpenDialog1.Execute(Application.Handle) then
    ButtonedEdit1.Text := OpenDialog1.FileName;
end;

procedure TfrmMAIS.FormShow(Sender: TObject);
begin
  try
    if not DM.Connect.Connected then
    begin
      DM.Connect.Params.Text := G_CONNECTSTR;
      DM.Connect.Connected := true;
    end;
  except
    on e: exception do
    begin
      e.Message := 'Ошибка подключения к базе:' + sLineBreak + e.Message;
      Application.ShowException(e);
      Application.Terminate;
      Exit;
    end;
  end;
  qrMAIS.Active := True;
end;

end.
