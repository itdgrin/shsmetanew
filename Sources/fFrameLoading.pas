unit fFrameLoading;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  fFrameSmeta,
  DataModule,
  Vcl.StdCtrls,
  Vcl.Samples.Spin,
  Vcl.ExtCtrls, fFrameStatusBar, Vcl.Grids, Vcl.DBGrids, JvExDBGrids, JvDBGrid,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.ComCtrls;

type
  TFrameLoading = class(TSmetaFrame)
    PanelSearch: TPanel;
    LabelYear: TLabel;
    LabelMonth: TLabel;
    cmbMonth: TComboBox;
    edtYear: TSpinEdit;
    cmbTranspType: TComboBox;
    grLoading: TJvDBGrid;
    qrLoading: TFDQuery;
    dsLoading: TDataSource;
    qrLoadingWORK_ID: TFDAutoIncField;
    qrLoadingnam1: TStringField;
    qrLoadingLoadNoNDS: TBCDField;
    qrLoadingUnloadNoNDS: TBCDField;
    qrLoadingLoadNDS: TBCDField;
    qrLoadingUnloadNDS: TBCDField;
    qrLoadingNum: TLargeintField;
    StatusBar: TStatusBar;
    procedure edtYearChange(Sender: TObject);
    procedure qrLoadingCalcFields(DataSet: TDataSet);
    procedure FrameResize(Sender: TObject);
    procedure qrLoadingAfterScroll(DataSet: TDataSet);
  private
    FRecCount: Integer;
  public
    procedure ReceivingAll; override;
    procedure CheckCurPeriod; override;
    constructor Create(AOwner: TComponent; ADate: TDateTime); reintroduce;
  end;

implementation

{$R *.dfm}

uses GlobsAndConst;

constructor TFrameLoading.Create(AOwner: TComponent; ADate: TDateTime);
var ev: TNotifyEvent;
    y,m,d: Word;
begin
  inherited Create(AOwner);

  DecodeDate(ADate,y,m,d);
  ev := edtYear.OnChange;
  try
    edtYear.OnChange := nil;
    cmbMonth.OnChange := nil;
    edtYear.Value := y;
    cmbMonth.ItemIndex := m - 1;
  finally
    edtYear.OnChange := ev;
    cmbMonth.OnChange := ev;
  end;

  G_CURYEAR := edtYear.Value;
  G_CURMONTH := cmbMonth.ItemIndex;
end;

procedure TFrameLoading.edtYearChange(Sender: TObject);
begin
  if edtYear.Value < 2012 then //что-бы не лазили дальше 2012 года
  begin
    edtYear.Value := 2012;
    Exit;
  end;

  G_CURYEAR := edtYear.Value;
  G_CURMONTH := cmbMonth.ItemIndex;

  ReceivingAll;
end;

procedure TFrameLoading.FrameResize(Sender: TObject);
begin
  grLoading.Columns[0].Width := 30;
  grLoading.Columns[2].Width := 130;
  grLoading.Columns[3].Width := 130;
  grLoading.Columns[4].Width := 130;
  grLoading.Columns[5].Width := 130;

  grLoading.Columns[1].Width := grLoading.Width -
    grLoading.Columns[0].Width - grLoading.Columns[2].Width -
    grLoading.Columns[3].Width - grLoading.Columns[4].Width -
    grLoading.Columns[5].Width - 50;
end;

procedure TFrameLoading.qrLoadingAfterScroll(DataSet: TDataSet);
begin
  StatusBar.Panels[0].Text := IntToStr(qrLoading.RecNo) + '/' + IntToStr(FRecCount);
end;

procedure TFrameLoading.qrLoadingCalcFields(DataSet: TDataSet);
begin
 qrLoadingLoadNDS.Value := (1 + 0.01 * G_NDS) * qrLoadingLoadNoNDS.Value;
 qrLoadingUnloadNDS.Value := (1 + 0.01 * G_NDS) * qrLoadingUnloadNoNDS.Value;
end;

procedure TFrameLoading.ReceivingAll;
begin
  qrLoading.Active := False;
  qrLoading.ParamByName('TrType').Value := cmbTranspType.ItemIndex;
  qrLoading.ParamByName('YEAR').Value := edtYear.Value;
  qrLoading.ParamByName('MONAT').Value := cmbMonth.ItemIndex;
  qrLoading.Active := True;

  FRecCount := 0;
  qrLoading.DisableControls;
  try
    while not qrLoading.Eof do
    begin
      inc(FRecCount);
      qrLoading.Edit;
      qrLoadingNum.Value := FRecCount;
      qrLoading.Post;
      qrLoading.Next;
    end;
  finally
    qrLoading.First;
    qrLoading.EnableControls;
    if FRecCount = 0 then
      StatusBar.Panels[0].Text := 'Ќет данных'
    else
      StatusBar.Panels[0].Text := IntToStr(qrLoading.RecNo) + '/' + IntToStr(FRecCount);
  end;
  fLoaded := true;
end;

procedure TFrameLoading.CheckCurPeriod;
var ev: TNotifyEvent;
begin
  if (G_CURYEAR <> edtYear.Value) or
     (G_CURMONTH <> cmbMonth.ItemIndex) then
  begin
    ev := edtYear.OnChange;
    try
      edtYear.OnChange := nil;
      cmbMonth.OnChange := nil;
      edtYear.Value := G_CURYEAR;
      cmbMonth.ItemIndex := G_CURMONTH;
      ev(nil);
    finally
      edtYear.OnChange := ev;
      cmbMonth.OnChange := ev;
    end;
  end;
end;


end.
