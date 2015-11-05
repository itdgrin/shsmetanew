unit CalcResource;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls,
  Vcl.Menus, Vcl.Samples.Spin, Vcl.Grids, Vcl.DBGrids, JvExDBGrids, JvDBGrid, Vcl.Mask, JvDBGridFooter,
  JvComponentBase, JvFormPlacement, System.UITypes, Vcl.Buttons, FireDAC.UI.Intf, FireDAC.Comp.ScriptCommands,
  FireDAC.Comp.Script, Tools;

type
  TfCalcResource = class(TSmForm)
    pnlTop: TPanel;
    lbl1: TLabel;
    pgc: TPageControl;
    ts1: TTabSheet;
    ts2: TTabSheet;
    ts3: TTabSheet;
    ts4: TTabSheet;
    ts5: TTabSheet;
    lbl2: TLabel;
    pnlMatTop: TPanel;
    edtMatCodeFilter: TEdit;
    edtMatNameFilter: TEdit;
    pm: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    mDetete: TMenuItem;
    N4: TMenuItem;
    mRestore: TMenuItem;
    pnlMatClient: TPanel;
    grMaterial: TJvDBGrid;
    pnlMatBott: TPanel;
    grMaterialBott: TJvDBGrid;
    dbmmoNAME: TDBMemo;
    spl1: TSplitter;
    spl2: TSplitter;
    qrMaterialData: TFDQuery;
    dsMaterialData: TDataSource;
    pnlMechClient: TPanel;
    grMech: TJvDBGrid;
    pnlMechBott: TPanel;
    spl3: TSplitter;
    grMechBott: TJvDBGrid;
    dbmmoNAME1: TDBMemo;
    spl4: TSplitter;
    pnlMechTop: TPanel;
    edtMechCodeFilter: TEdit;
    edtMechNameFilter: TEdit;
    qrMechData: TFDQuery;
    dsMechData: TDataSource;
    spl5: TSplitter;
    pnlDevTop: TPanel;
    edt1: TEdit;
    edt2: TEdit;
    pnlDevClient: TPanel;
    grDev: TJvDBGrid;
    pnlDevBott: TPanel;
    spl6: TSplitter;
    grDevBott: TJvDBGrid;
    dbmmoNAME2: TDBMemo;
    qrDevices: TFDQuery;
    dsDevices: TDataSource;
    pnlRatesClient: TPanel;
    grRates: TJvDBGrid;
    qrRates: TFDQuery;
    dsRates: TDataSource;
    JvDBGridFooter1: TJvDBGridFooter;
    JvDBGridFooter2: TJvDBGridFooter;
    JvDBGridFooter3: TJvDBGridFooter;
    JvDBGridFooter4: TJvDBGridFooter;
    edtEstimateName: TEdit;
    FormStorage: TJvFormStorage;
    mShowDeleted: TMenuItem;
    mN7: TMenuItem;
    qrMaterialDetail: TFDQuery;
    dsMaterialDetail: TDataSource;
    mReplace: TMenuItem;
    lbl6: TLabel;
    cbbFromMonth: TComboBox;
    seFromYear: TSpinEdit;
    cbbNDS: TComboBox;
    qrEstimate: TFDQuery;
    qrMechDetail: TFDQuery;
    dsMechDetail: TDataSource;
    qrDevicesDetail: TFDQuery;
    dsDevicesDetail: TDataSource;
    dbmmoNAME3: TDBMemo;
    strngfldMaterialDataCODE: TStringField;
    strngfldMaterialDataNAME: TStringField;
    strngfldMaterialDataUNIT: TStringField;
    qrMaterialDataCNT: TFMTBCDField;
    qrMaterialDataDOC_DATE: TDateField;
    strngfldMaterialDataDOC_NUM: TStringField;
    qrMaterialDataPROC_TRANSP: TFMTBCDField;
    qrMaterialDataCOAST: TFMTBCDField;
    qrMaterialDataPRICE: TFMTBCDField;
    qrMaterialDataTRANSP: TFMTBCDField;
    qrMaterialDataDELETED: TByteField;
    qrMaterialDataMAT_PROC_ZAC: TWordField;
    qrMaterialDataMAT_PROC_PODR: TWordField;
    qrMaterialDataTRANSP_PROC_ZAC: TWordField;
    qrMaterialDataTRANSP_PROC_PODR: TWordField;
    qrMaterialDataMAT_ID: TLongWordField;
    strngfldMechDataCODE: TStringField;
    strngfldMechDataNAME: TStringField;
    strngfldMechDataUNIT: TStringField;
    qrMechDataCNT: TFMTBCDField;
    qrMechDataDOC_DATE: TDateField;
    strngfldMechDataDOC_NUM: TStringField;
    qrMechDataCOAST: TFMTBCDField;
    qrMechDataPRICE: TFMTBCDField;
    qrMechDataZP_1: TFMTBCDField;
    qrMechDataZP_2: TFMTBCDField;
    qrMechDataDELETED: TByteField;
    qrMechDataPROC_ZAC: TWordField;
    qrMechDataPROC_PODR: TWordField;
    qrMechDataMECH_ID: TLongWordField;
    strngfldDevicesCODE: TStringField;
    strngfldDevicesNAME: TStringField;
    strngfldDevicesUNIT: TStringField;
    qrDevicesCNT: TFMTBCDField;
    qrDevicesDOC_DATE: TDateField;
    strngfldDevicesDOC_NUM: TStringField;
    qrDevicesCOAST: TFMTBCDField;
    qrDevicesPRICE: TFMTBCDField;
    qrDevicesTRANSP: TFMTBCDField;
    qrDevicesPROC_ZAC: TWordField;
    qrDevicesPROC_PODR: TWordField;
    qrDevicesTRANSP_PROC_ZAC: TWordField;
    qrDevicesTRANSP_PROC_PODR: TWordField;
    qrDevicesDELETED: TLargeintField;
    qrDevicesDEVICE_ID: TLongWordField;
    qrMaterialDataFCOAST: TIntegerField;
    qrMaterialDataREPLACED: TIntegerField;
    qrMechDataREPLACED: TIntegerField;
    qrMaterialDataFREPLACED: TIntegerField;
    qrMechDataFREPLACED: TIntegerField;
    pnlCalculationYesNo: TPanel;
    qrMaterialDataNUMPP: TIntegerField;
    mPROC_TRANSP: TMenuItem;
    mN4: TMenuItem;
    mN5: TMenuItem;
    mN6: TMenuItem;
    mN8: TMenuItem;
    mN9: TMenuItem;
    mN11: TMenuItem;
    mN3: TMenuItem;
    mN10: TMenuItem;
    mN12: TMenuItem;
    N5305335341: TMenuItem;
    mN13: TMenuItem;
    mN14: TMenuItem;
    FDScript1: TFDScript;
    qrMechDataNUMPP: TIntegerField;
    qrDevicesNUMPP: TIntegerField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure pgcChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure edtMatCodeFilterChange(Sender: TObject);
    procedure edtMatCodeFilterClick(Sender: TObject);
    procedure edtMechCodeFilterChange(Sender: TObject);
    procedure qrMaterialDataAfterOpen(DataSet: TDataSet);
    procedure JvDBGridFooter1Calculate(Sender: TJvDBGridFooter; const FieldName: string;
      var CalcValue: Variant);
    procedure qrMaterialDataBeforeOpen(DataSet: TDataSet);
    procedure pmPopup(Sender: TObject);
    procedure mReplaceClick(Sender: TObject);
    procedure grMaterialCanEditCell(Grid: TJvDBGrid; Field: TField; var AllowEdit: Boolean);
    procedure qrMaterialDataBeforePost(DataSet: TDataSet);
    procedure grMaterialTitleBtnClick(Sender: TObject; ACol: Integer; Field: TField);
    procedure mDeteteClick(Sender: TObject);
    procedure mRestoreClick(Sender: TObject);
    procedure grMaterialDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure grMechDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure qrMechDataBeforePost(DataSet: TDataSet);
    procedure grMechTitleBtnClick(Sender: TObject; ACol: Integer; Field: TField);
    procedure qrDevicesBeforePost(DataSet: TDataSet);
    procedure grDevDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure grRatesDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure qrMaterialDataMAT_PROC_ZACChange(Sender: TField);
    procedure qrMaterialDataMAT_PROC_PODRChange(Sender: TField);
    procedure qrMaterialDataTRANSP_PROC_ZACChange(Sender: TField);
    procedure qrMaterialDataTRANSP_PROC_PODRChange(Sender: TField);
    procedure grMaterialBottDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer;
      Column: TColumn; State: TGridDrawState);
    procedure grMechBottDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure qrMechDataPROC_ZACChange(Sender: TField);
    procedure qrMechDataPROC_PODRChange(Sender: TField);
    procedure qrDevicesPROC_ZACChange(Sender: TField);
    procedure qrDevicesPROC_PODRChange(Sender: TField);
    procedure qrDevicesTRANSP_PROC_ZACChange(Sender: TField);
    procedure qrDevicesTRANSP_PROC_PODRChange(Sender: TField);
    procedure qrMaterialDetailBeforePost(DataSet: TDataSet);
    procedure qrMechDetailBeforePost(DataSet: TDataSet);
    procedure qrDevicesDetailBeforePost(DataSet: TDataSet);
    procedure pnlCalculationYesNoClick(Sender: TObject);
    procedure btnShowDiffClick(Sender: TObject);
    procedure qrMaterialDataCalcFields(DataSet: TDataSet);
    procedure qrMaterialDataCOASTChange(Sender: TField);
    procedure qrMechDataCOASTChange(Sender: TField);
    procedure qrDevicesCOASTChange(Sender: TField);
    procedure grDevTitleBtnClick(Sender: TObject; ACol: Integer; Field: TField);
    procedure grRatesTitleBtnClick(Sender: TObject; ACol: Integer; Field: TField);
    procedure grMaterialExit(Sender: TObject);
    procedure grMaterialKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure grDevBottDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure PMTrPerc0Click(Sender: TObject);
    procedure mN3Click(Sender: TObject);
    procedure grDevColExit(Sender: TObject);
    procedure mN12Click(Sender: TObject);
    procedure qrMechDataCalcFields(DataSet: TDataSet);
    procedure qrDevicesCalcFields(DataSet: TDataSet);
  private
    Footer: Variant;
    IDEstimate: Integer;
    flLoaded: Boolean;

    FOldGridProc: TWndMethod;
    procedure GridProc(var Message: TMessage);

    procedure CalcFooter;
    function CanEditField(Field: TField): Boolean;
  public
  end;

var
  fCalcResource: TfCalcResource;

procedure ShowCalcResource(const ID_ESTIMATE: Variant; const APage: Integer = 0; AOwner: TWinControl = nil);

implementation

{$R *.dfm}

uses Main, ReplacementMatAndMech, CalculationEstimate, DataModule,
  GlobsAndConst, TranspPersSelect;

procedure ShowCalcResource(const ID_ESTIMATE: Variant; const APage: Integer = 0; AOwner: TWinControl = nil);
var
  pageID: Integer;
  fl: Boolean;
begin
  fl := False;
  if VarIsNull(ID_ESTIMATE) then
    Exit;
  if (not Assigned(fCalcResource)) then
  begin
    fCalcResource := TfCalcResource.Create(AOwner);
    fl := True;
  end;

  if AOwner <> nil then
  begin
    fCalcResource.Parent := AOwner;
    fCalcResource.Align := alClient;
    fCalcResource.BorderStyle := bsNone;
  end
  else
    // Создаём кнопку от этого окна (на главной форме внизу)
    FormMain.CreateButtonOpenWindow('Расчет стоимости ресурсов', 'Расчет стоимости ресурсов',
      fCalcResource, 1);

  fCalcResource.flLoaded := False;
  fCalcResource.IDEstimate := ID_ESTIMATE;
  fCalcResource.qrEstimate.ParamByName('SM_ID').Value := ID_ESTIMATE;
  fCalcResource.qrEstimate.Active := True;
  fCalcResource.cbbFromMonth.ItemIndex := fCalcResource.qrEstimate.FieldByName('MONTH').AsInteger - 1;
  fCalcResource.edtEstimateName.Text := fCalcResource.qrEstimate.FieldByName('NAME').AsString;
  fCalcResource.seFromYear.Value := fCalcResource.qrEstimate.FieldByName('YEAR').AsInteger;
  fCalcResource.cbbNDS.ItemIndex := fCalcResource.qrEstimate.FieldByName('NDS').AsInteger;

  // Если вызвали с доп параметром (на что положить) , то скрываем все вкладки
  for pageID := 0 to fCalcResource.pgc.PageCount - 1 do
    fCalcResource.pgc.Pages[pageID].TabVisible := AOwner = nil;

  fCalcResource.pnlTop.Visible := AOwner = nil;

  //fCalcResource.pgc.ActivePageIndex := 0;
  fCalcResource.pgc.ActivePageIndex := APage;

  if AOwner = nil then
    fCalcResource.WindowState := wsMaximized;

  fCalcResource.flLoaded := True;

  fCalcResource.pgcChange(nil);
  with fCalcResource do
    if fl then
      case pgc.ActivePageIndex of
        // Расчет материалов
        1:
          qrMaterialData.First;
        // Расчет механизмов
        2:
          qrMechData.First;
        // Расчет оборудования
        3:
          qrDevices.First;
        // Расчет з\п
        4:
          qrRates.First;
      end;
  if AOwner <> nil then
    fCalcResource.Width := AOwner.ClientWidth;
  fCalcResource.Show;

end;

procedure TfCalcResource.btnShowDiffClick(Sender: TObject);
begin
  case pgc.ActivePageIndex of
    // Расчет стоимости
    0:
      ;
    // Расчет материалов
    1:
      begin

      end;
    // Расчет механизмов
    2:
      begin

      end;
    // Расчет оборудования
    3:
      begin

      end;
    // Расчет з\п
    4:
      begin

      end;
  end;
end;

procedure TfCalcResource.CalcFooter;
begin
  // В зависимости от вкладки
  case pgc.ActivePageIndex of
    // Расчет стоимости
    0:
      ;
    // Расчет материалов
    1:
      Footer := CalcFooterSumm(qrMaterialData);
    // Расчет механизмов
    2:
      Footer := CalcFooterSumm(qrMechData);
    // Расчет оборудования
    3:
      Footer := CalcFooterSumm(qrDevices);
    // Расчет з\п
    4:
      Footer := CalcFooterSumm(qrRates);
  end;
end;

function TfCalcResource.CanEditField(Field: TField): Boolean;
begin
  Result := False;

  if (pnlCalculationYesNo.Tag = 0) or (not flLoaded) then
    Exit;

  case pgc.ActivePageIndex of
    // Расчет материалов
    1:
      Result := (Field = qrMaterialData.FieldByName('COAST')) or
        (Field = qrMaterialData.FieldByName('PROC_TRANSP')) or
        (Field = qrMaterialData.FieldByName('MAT_PROC_ZAC')) or
        (Field = qrMaterialData.FieldByName('MAT_PROC_PODR')) or
        (Field = qrMaterialData.FieldByName('TRANSP_PROC_ZAC')) or
        (Field = qrMaterialData.FieldByName('TRANSP_PROC_PODR')) or
        (Field = qrMaterialData.FieldByName('DOC_DATE')) or (Field = qrMaterialData.FieldByName('DOC_NUM')) or
        (Field = qrMaterialDetail.FieldByName('COAST')) or
        (Field = qrMaterialDetail.FieldByName('PROC_TRANSP')) or
        (Field = qrMaterialDetail.FieldByName('TRANSP')) or
        (Field = qrMaterialDetail.FieldByName('MAT_PROC_ZAC')) or
        (Field = qrMaterialDetail.FieldByName('MAT_PROC_PODR')) or
        (Field = qrMaterialDetail.FieldByName('TRANSP_PROC_ZAC')) or
        (Field = qrMaterialDetail.FieldByName('TRANSP_PROC_PODR'));
    // Расчет механизмов
    2:
      Result := (Field = qrMechData.FieldByName('COAST')) or (Field = qrMechData.FieldByName('ZP_1')) or
        (Field = qrMechData.FieldByName('PROC_ZAC')) or (Field = qrMechData.FieldByName('PROC_PODR')) or
        (Field = qrMechDetail.FieldByName('COAST')) or (Field = qrMechDetail.FieldByName('ZP_MASH')) or
        (Field = qrMechDetail.FieldByName('PROC_ZAC')) or (Field = qrMechDetail.FieldByName('PROC_PODR'));
    // Расчет оборудования
    3:
      Result := (Field = qrDevices.FieldByName('COAST')) or
      { (Field = qrDevices.FieldByName('PROC_TRANSP')) or }
        (Field = qrDevices.FieldByName('TRANSP')) or (Field = qrDevices.FieldByName('DOC_DATE')) or
        (Field = qrDevices.FieldByName('DOC_NUM')) or (Field = qrDevices.FieldByName('PROC_ZAC')) or
        (Field = qrDevices.FieldByName('PROC_PODR')) or (Field = qrDevices.FieldByName('TRANSP_PROC_ZAC')) or
        (Field = qrDevices.FieldByName('TRANSP_PROC_PODR')) or (Field = qrDevicesDetail.FieldByName('COAST'))
        or (Field = qrDevicesDetail.FieldByName('TRANSP')) or (Field = qrDevicesDetail.FieldByName('PROC_ZAC')
        ) or (Field = qrDevicesDetail.FieldByName('PROC_PODR')) or
        (Field = qrDevicesDetail.FieldByName('TRANSP_PROC_ZAC')) or
        (Field = qrDevicesDetail.FieldByName('TRANSP_PROC_PODR'));
  end;

end;

procedure TfCalcResource.edtMechCodeFilterChange(Sender: TObject);
begin
  qrMechData.Filtered := False;
  qrMechData.Filter := 'Upper(CODE) LIKE ''%' + AnsiUpperCase(edtMechCodeFilter.Text) +
    '%'' AND Upper(NAME) LIKE ''%' + AnsiUpperCase(edtMechNameFilter.Text) + '%''';
  // + ' AND NDS=' + IntToStr(cbbMechNDS.ItemIndex); //возможно, неверное решение с НДС
  qrMechData.Filtered := True;
  // CalcFooter;
end;

procedure TfCalcResource.edtMatCodeFilterChange(Sender: TObject);
begin
  qrMaterialData.Filtered := False;
  qrMaterialData.Filter := 'Upper(CODE) LIKE UPPER(''%' + edtMatCodeFilter.Text +
    '%'') AND Upper(NAME) LIKE UPPER(''%' + edtMatNameFilter.Text + '%'')';
  // + ' AND NDS=' + IntToStr(cbbMatNDS.ItemIndex); //возможно, неверное решение с НДС
  qrMaterialData.Filtered := True;
  // CalcFooter;
end;

procedure TfCalcResource.edtMatCodeFilterClick(Sender: TObject);
begin
  (Sender as TEdit).SelectAll;
end;

procedure TfCalcResource.FormActivate(Sender: TObject);
begin
  // Если нажата клавиша Ctrl и выбираем форму, то делаем
  // каскадирование с переносом этой формы на передний план
  FormMain.CascadeForActiveWindow;
  // Делаем нажатой кнопку активной формы (на главной форме внизу)
  FormMain.SelectButtonActiveWindow('Расчет стоимости ресурсов');
end;

procedure TfCalcResource.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfCalcResource.FormCreate(Sender: TObject);
begin
  inherited;
  FOldGridProc := grMaterial.WindowProc;
  grMaterial.WindowProc := GridProc;
end;

procedure TfCalcResource.FormDestroy(Sender: TObject);
begin
  // Удаляем кнопку от этого окна (на главной форме внизу)
  FormMain.DeleteButtonCloseWindow('Расчет стоимости ресурсов');
  fCalcResource := nil;
end;

procedure TfCalcResource.grDevBottDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer;
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

  if CanEditField(Column.Field) and (Assigned(TMyDBGrid((Sender AS TJvDBGrid)).DataLink) and
    ((Sender AS TJvDBGrid).Row = TMyDBGrid((Sender AS TJvDBGrid)).DataLink.ActiveRecord + 1)) then
  begin
    (Sender AS TJvDBGrid).Canvas.Brush.Color :=
      clMoneyGreen { MixColors(clMoneyGreen, grMaterial.Canvas.Brush.Color, 150) };
    (Sender AS TJvDBGrid).Canvas.Font.Color := PS.FontRows;
  end;
  (Sender AS TJvDBGrid).DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfCalcResource.grDevColExit(Sender: TObject);
begin
  if PS.AutoSaveCalcResourcesAfterExitCell and ((Sender as TJvDBGrid).DataSource.DataSet.State
    in [dsEdit, dsInsert]) then
    (Sender as TJvDBGrid).DataSource.DataSet.CheckBrowseMode;
end;

procedure TfCalcResource.grDevDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer;
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

  if qrDevices.FieldByName('DELETED').AsInteger = 1 then
    grDev.Canvas.Font.Style := grDev.Canvas.Font.Style + [fsStrikeOut];

  if CanEditField(Column.Field) and (Assigned(TMyDBGrid((Sender AS TJvDBGrid)).DataLink) and
    ((Sender AS TJvDBGrid).Row = TMyDBGrid((Sender AS TJvDBGrid)).DataLink.ActiveRecord + 1)) then
  begin
    (Sender AS TJvDBGrid).Canvas.Brush.Color :=
      clMoneyGreen { MixColors(clMoneyGreen, grMaterial.Canvas.Brush.Color, 150) };
    (Sender AS TJvDBGrid).Canvas.Font.Color := PS.FontRows;
  end;
  (Sender AS TJvDBGrid).DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfCalcResource.grDevTitleBtnClick(Sender: TObject; ACol: Integer; Field: TField);
begin
  DoSort(qrDevices, grDev);
end;

procedure TfCalcResource.grMaterialBottDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer;
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

  if (qrMaterialDetail.FieldByName('FCOAST').AsInteger = 1) and (Column.FieldName = 'COAST') then
    grMaterialBott.Canvas.Font.Style := grMaterialBott.Canvas.Font.Style + [fsItalic];

  if qrMaterialDetail.FieldByName('DELETED').AsInteger = 1 then
    grMaterialBott.Canvas.Font.Style := grMaterialBott.Canvas.Font.Style + [fsStrikeOut];

  if qrMaterialDetail.FieldByName('REPLACED').AsInteger <> 0 then
  begin
    grMaterialBott.Canvas.Font.Style := grMaterial.Canvas.Font.Style + [fsStrikeOut] + [fsItalic];
    grMaterialBott.Canvas.Font.Color := clNavy;
  end;

  if qrMaterialDetail.FieldByName('ID_REPLACED').AsInteger <> 0 then
  begin
    grMaterialBott.Canvas.Font.Style := grMaterial.Canvas.Font.Style + [fsItalic];
    grMaterialBott.Canvas.Font.Color := clNavy;
  end;
  if CanEditField(Column.Field) and (Assigned(TMyDBGrid((Sender AS TJvDBGrid)).DataLink) and
    ((Sender AS TJvDBGrid).Row = TMyDBGrid((Sender AS TJvDBGrid)).DataLink.ActiveRecord + 1)) then
  begin
    (Sender AS TJvDBGrid).Canvas.Brush.Color :=
      clMoneyGreen { MixColors(clMoneyGreen, grMaterial.Canvas.Brush.Color, 150) };
    (Sender AS TJvDBGrid).Canvas.Font.Color := PS.FontRows;
  end;
  grMaterialBott.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfCalcResource.grMaterialCanEditCell(Grid: TJvDBGrid; Field: TField; var AllowEdit: Boolean);
begin
  AllowEdit := CanEditField(Field);
end;

procedure TfCalcResource.grMaterialDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer;
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

  if (qrMaterialData.FieldByName('FCOAST').AsInteger = 1) and (Column.FieldName = 'COAST') then
    grMaterial.Canvas.Font.Style := grMaterial.Canvas.Font.Style + [fsItalic];

  if qrMaterialData.FieldByName('DELETED').AsInteger = 1 then
    grMaterial.Canvas.Font.Style := grMaterial.Canvas.Font.Style + [fsStrikeOut];

  if qrMaterialData.FieldByName('REPLACED').AsInteger <> 0 then
  begin
    grMaterial.Canvas.Font.Style := grMaterial.Canvas.Font.Style + [fsStrikeOut] + [fsItalic];
    grMaterial.Canvas.Font.Color := clNavy;
  end;

  if qrMaterialData.FieldByName('FREPLACED').AsInteger <> 0 then
  begin
    grMaterial.Canvas.Font.Style := grMaterial.Canvas.Font.Style + [fsItalic];
    grMaterial.Canvas.Font.Color := clNavy;
  end;

  if CanEditField(Column.Field) and (Assigned(TMyDBGrid((Sender AS TJvDBGrid)).DataLink) and
    ((Sender AS TJvDBGrid).Row = TMyDBGrid((Sender AS TJvDBGrid)).DataLink.ActiveRecord + 1)) then
  begin
    (Sender AS TJvDBGrid).Canvas.Brush.Color :=
      clMoneyGreen { MixColors(clMoneyGreen, grMaterial.Canvas.Brush.Color, 150) };
    (Sender AS TJvDBGrid).Canvas.Font.Color := PS.FontRows;
  end;
  (Sender AS TJvDBGrid).DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfCalcResource.grMaterialExit(Sender: TObject);
begin
  (Sender as TJvDBGrid).DataSource.DataSet.CheckBrowseMode;
end;

procedure TfCalcResource.grMaterialKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  case Key of
    VK_RETURN:
      begin
        if not(Sender AS TJvDBGrid).EditorMode and
          ((Sender AS TJvDBGrid).DataSource.DataSet.State in [dsEdit, dsInsert]) then
          (Sender AS TJvDBGrid).DataSource.DataSet.CheckBrowseMode;
      end;
  end;
end;

procedure TfCalcResource.GridProc(var Message: TMessage);
begin
  // // Вообще отключить реакцию
  // case Message.Msg of
  // WM_MOUSEWHEEL:
  // begin
  // Message.Result := 0;
  // Exit;
  // end;
  // end;
  // FOldGridProc(Message);

  // Для более красивого скролла в мультиселекте
  case Message.Msg of
    WM_MOUSEWHEEL:
      with TWMMouseWheel(Message) do
      begin
        grMaterial.DataSource.DataSet.DisableControls;
        try
          if grMaterial.DataSource.DataSet.Active then
            grMaterial.DataSource.DataSet.MoveBy(-WheelDelta div 120);
          with grMaterial.SelectedRows do
          begin
            if Count < 2 then
            begin
              Clear;
              CurrentRowSelected := True;
            end;
          end;
          Message.Result := 0;
          Exit;
        finally
          grMaterial.DataSource.DataSet.EnableControls;
        end;
      end;
  end;
  FOldGridProc(Message);
end;

procedure TfCalcResource.grMaterialTitleBtnClick(Sender: TObject; ACol: Integer; Field: TField);
begin
  DoSort(qrMaterialData, grMaterial);
end;

procedure TfCalcResource.grMechBottDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer;
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

  if qrMechDetail.FieldByName('DELETED').AsInteger = 1 then
    grMechBott.Canvas.Font.Style := grMechBott.Canvas.Font.Style + [fsStrikeOut];

  if qrMechDetail.FieldByName('REPLACED').AsInteger <> 0 then
  begin
    grMechBott.Canvas.Font.Style := grMaterial.Canvas.Font.Style + [fsStrikeOut] + [fsItalic];
    grMechBott.Canvas.Font.Color := clNavy;
  end;

  if qrMechDetail.FieldByName('ID_REPLACED').AsInteger <> 0 then
  begin
    grMechBott.Canvas.Font.Style := grMaterial.Canvas.Font.Style + [fsItalic];
    grMechBott.Canvas.Font.Color := clNavy;
  end;

  if CanEditField(Column.Field) and (Assigned(TMyDBGrid((Sender AS TJvDBGrid)).DataLink) and
    ((Sender AS TJvDBGrid).Row = TMyDBGrid((Sender AS TJvDBGrid)).DataLink.ActiveRecord + 1)) then
  begin
    (Sender AS TJvDBGrid).Canvas.Brush.Color :=
      clMoneyGreen { MixColors(clMoneyGreen, grMaterial.Canvas.Brush.Color, 150) };
    (Sender AS TJvDBGrid).Canvas.Font.Color := PS.FontRows;
  end;
  (Sender AS TJvDBGrid).DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfCalcResource.grMechDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer;
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

  if qrMechData.FieldByName('DELETED').AsInteger = 1 then
    grMech.Canvas.Font.Style := grMech.Canvas.Font.Style + [fsStrikeOut];

  if qrMechData.FieldByName('REPLACED').AsInteger <> 0 then
  begin
    grMech.Canvas.Font.Style := grMaterial.Canvas.Font.Style + [fsStrikeOut] + [fsItalic];
    grMech.Canvas.Font.Color := clNavy;
  end;

  if qrMechData.FieldByName('FREPLACED').AsInteger <> 0 then
  begin
    grMech.Canvas.Font.Style := grMaterial.Canvas.Font.Style + [fsItalic];
    grMech.Canvas.Font.Color := clNavy;
  end;
  if CanEditField(Column.Field) and (Assigned(TMyDBGrid((Sender AS TJvDBGrid)).DataLink) and
    ((Sender AS TJvDBGrid).Row = TMyDBGrid((Sender AS TJvDBGrid)).DataLink.ActiveRecord + 1)) then
  begin
    (Sender AS TJvDBGrid).Canvas.Brush.Color :=
      clMoneyGreen { MixColors(clMoneyGreen, grMaterial.Canvas.Brush.Color, 150) };
    (Sender AS TJvDBGrid).Canvas.Font.Color := PS.FontRows;
  end;
  (Sender AS TJvDBGrid).DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfCalcResource.grMechTitleBtnClick(Sender: TObject; ACol: Integer; Field: TField);
begin
  DoSort(qrMechData, grMech);
end;

procedure TfCalcResource.grRatesDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer;
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

  if qrRates.FieldByName('DELETED').AsInteger = 1 then
    grRates.Canvas.Font.Style := grRates.Canvas.Font.Style + [fsStrikeOut];
  (Sender AS TJvDBGrid).DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfCalcResource.grRatesTitleBtnClick(Sender: TObject; ACol: Integer; Field: TField);
begin
  DoSort(qrRates, grRates);
end;

procedure TfCalcResource.JvDBGridFooter1Calculate(Sender: TJvDBGridFooter; const FieldName: string;
  var CalcValue: Variant);
begin
  try
    if not CheckQrActiveEmpty(Sender.DataSource.DataSet) then
      Exit;
  except

  end;

  CalcValue := Footer[Sender.DataSource.DataSet.FieldByName(FieldName).Index];
end;

procedure TfCalcResource.mDeteteClick(Sender: TObject);
begin
  case pgc.ActivePageIndex of
    // Расчет стоимости
    0:
      ;
    // Расчет материалов
    1:
      begin
        // Если является заменяющим
        if (qrMaterialData.FieldByName('FREPLACED').AsInteger <> 0) and (not(qrMaterialData.State in [dsEdit]))
        then
        begin
          if MessageBox(0, PChar('Вы действительно хотите удалить ' + strngfldMaterialDataCODE.AsString +
            '?'), Pwidechar(Caption), MB_ICONINFORMATION + MB_YESNO + mb_TaskModal) <> mrYes then
            Exit;
          DM.qrDifferent.SQL.Text := 'SELECT ID FROM materialcard_temp'#13 +
            'WHERE PROC_TRANSP=:PROC_TRANSP AND DELETED=:DELETED'#13 +
            'AND MAT_PROC_ZAC=:MAT_PROC_ZAC AND MAT_PROC_PODR=:MAT_PROC_PODR'#13 +
            'AND TRANSP_PROC_ZAC=:TRANSP_PROC_ZAC AND TRANSP_PROC_PODR=:TRANSP_PROC_PODR'#13 +
            'AND IF(:NDS=1, IF(FCOAST_NDS<>0, FCOAST_NDS, COAST_NDS), IF(FCOAST_NO_NDS<>0, FCOAST_NO_NDS, COAST_NO_NDS))=:COAST AND MAT_ID=:MAT_ID';
          DM.qrDifferent.ParamByName('PROC_TRANSP').Value := qrMaterialData.FieldByName('PROC_TRANSP').Value;
          DM.qrDifferent.ParamByName('DELETED').Value := qrMaterialData.FieldByName('DELETED').Value;
          DM.qrDifferent.ParamByName('MAT_PROC_ZAC').Value :=
            qrMaterialData.FieldByName('MAT_PROC_ZAC').Value;
          DM.qrDifferent.ParamByName('MAT_PROC_PODR').Value :=
            qrMaterialData.FieldByName('MAT_PROC_PODR').Value;
          DM.qrDifferent.ParamByName('TRANSP_PROC_ZAC').Value :=
            qrMaterialData.FieldByName('TRANSP_PROC_ZAC').Value;
          DM.qrDifferent.ParamByName('TRANSP_PROC_PODR').Value :=
            qrMaterialData.FieldByName('TRANSP_PROC_PODR').Value;
          DM.qrDifferent.ParamByName('NDS').Value := cbbNDS.ItemIndex;
          DM.qrDifferent.ParamByName('COAST').Value := qrMaterialData.FieldByName('COAST').Value;
          DM.qrDifferent.ParamByName('MAT_ID').Value := qrMaterialData.FieldByName('MAT_ID').Value;
          DM.qrDifferent.Active := True;
          while not DM.qrDifferent.Eof do
          begin
            FastExecSQL('CALL DeleteMaterial(:id, :CalcMode);',
              VarArrayOf([DM.qrDifferent.FieldByName('ID').Value, G_CALCMODE]));
            DM.qrDifferent.Next;
          end;
          FormCalculationEstimate.RecalcEstimate;
          CloseOpen(qrMaterialData);
        end
        else
        begin
          if not(qrMaterialData.State in [dsEdit]) then
            qrMaterialData.Edit;
          qrMaterialData.FieldByName('DELETED').Value := 1;
        end;
      end;
    // Расчет механизмов
    2:
      begin
        // Если является заменяющим
        if (qrMechData.FieldByName('FREPLACED').AsInteger <> 0) and (not(qrMechData.State in [dsEdit])) then
        begin
          if MessageBox(0, PChar('Вы действительно хотите удалить ' + strngfldMechDataCODE.AsString + '?'),
            Pwidechar(Caption), MB_ICONINFORMATION + MB_YESNO + mb_TaskModal) <> mrYes then
            Exit;
          DM.qrDifferent.SQL.Text := 'SELECT ID FROM mechanizmcard_temp'#13 +
            'WHERE DELETED=:DELETED AND PROC_ZAC=:PROC_ZAC AND PROC_PODR=:PROC_PODR'#13 +
            'AND IF(:NDS=1, IF(FCOAST_NDS<>0, FCOAST_NDS, COAST_NDS), IF(FCOAST_NO_NDS<>0, FCOAST_NO_NDS, COAST_NO_NDS))=:COAST AND MECH_ID=:MECH_ID'#13
            + 'AND IF(:NDS=1, IF(FZP_MACH_NDS<>0, FZP_MACH_NDS, ZP_MACH_NDS), IF(FZP_MACH_NO_NDS<>0, FZP_MACH_NO_NDS, ZP_MACH_NO_NDS))=:ZP_1';
          DM.qrDifferent.ParamByName('DELETED').Value := qrMechData.FieldByName('DELETED').Value;
          DM.qrDifferent.ParamByName('PROC_ZAC').Value := qrMechData.FieldByName('PROC_ZAC').Value;
          DM.qrDifferent.ParamByName('PROC_PODR').Value := qrMechData.FieldByName('PROC_PODR').Value;
          DM.qrDifferent.ParamByName('NDS').Value := cbbNDS.ItemIndex;
          DM.qrDifferent.ParamByName('COAST').Value := qrMechData.FieldByName('COAST').Value;
          DM.qrDifferent.ParamByName('MECH_ID').Value := qrMechData.FieldByName('MECH_ID').Value;
          DM.qrDifferent.ParamByName('ZP_1').Value := qrMechData.FieldByName('ZP_1').Value;
          DM.qrDifferent.Active := True;
          while not DM.qrDifferent.Eof do
          begin
            FastExecSQL('CALL DeleteMechanism(:id, :CalcMode);',
              VarArrayOf([DM.qrDifferent.FieldByName('ID').Value, G_CALCMODE]));
            DM.qrDifferent.Next;
          end;
          FormCalculationEstimate.RecalcEstimate;
          CloseOpen(qrMechData);
        end
        else
        begin
          if not(qrMechData.State in [dsEdit]) then
            qrMechData.Edit;
          qrMechData.FieldByName('DELETED').Value := 1;
        end;
      end;
    // Расчет оборудования
    3:
      begin
        if not(qrDevices.State in [dsEdit]) then
          qrDevices.Edit;
        qrDevices.FieldByName('DELETED').Value := 1;
      end;

    // Расчет з\п
    4:
      begin
        if not(qrRates.State in [dsEdit]) then
          qrRates.Edit;
        qrRates.FieldByName('DELETED').Value := 1;
      end;
  end;
end;

procedure TfCalcResource.mN12Click(Sender: TObject);
var
  fTrPersSelect: TfTrPersSelect;
  TransPr: Double;
  MatCode: string;
  UpdateStr: string;
  SelType: byte;
  WhereStr: string;
  TempBookmark: TBookMark;
  X: Integer;
  Script: TStringList;
begin
  SelType := 0;

  if (Sender as TComponent).Tag in [1, 2, 3] then
  begin
    fTrPersSelect := TfTrPersSelect.Create(nil);
    try
      if fTrPersSelect.ShowModal = mrOk then
      begin
        SelType := fTrPersSelect.SelectType;
        TransPr := fTrPersSelect.TranspPers;
        MatCode := fTrPersSelect.MatCode;
      end
      else
        Exit;
    finally
      FreeAndNil(fTrPersSelect);
    end;
  end;

  Script := TStringList.Create;
  grMaterial.DataSource.DataSet.DisableControls;
  qrMaterialDetail.DisableControls;
  TempBookmark := grMaterial.DataSource.DataSet.GetBookmark;
  try
    if grMaterial.SelectedRows.Count = 0 then
      grMaterial.SelectedRows.CurrentRowSelected := True;

    for X := 0 to grMaterial.SelectedRows.Count - 1 do
    begin
      if grMaterial.SelectedRows.IndexOf(grMaterial.SelectedRows.Items[X]) > -1 then
      begin
        // grMaterial.DataSource.DataSet.Bookmark := grMaterial.SelectedRows.Items[X];
        grMaterial.DataSource.DataSet.GotoBookmark(Pointer(grMaterial.SelectedRows.Items[X]));
        qrMaterialDetail.Active := False;
        qrMaterialDetail.Active := True;
        qrMaterialDetail.First;
        while not qrMaterialDetail.Eof do
        begin

          if (Sender as TComponent).Tag in [1, 2, 3] then
          begin
            case SelType of
              1:
                UpdateStr := 'PROC_TRANSP = GetTranspPers(' + qrMaterialDetail.FieldByName('PTM_ID').AsString
                  + ', ''' + MatCode + ''')';
              2:
                UpdateStr := 'PROC_TRANSP = ' + TransPr.ToString;
            end;
            if (Sender as TComponent).Tag = 1 then
              WhereStr := ' and (MAT_CODE like ''С103%'')';
            if (Sender as TComponent).Tag = 2 then
              WhereStr := ' and ((MAT_CODE like ''С530%'') or ' +
                '(MAT_CODE like ''С533%'') or (MAT_CODE like ''С534%''))';
          end
          else
            UpdateStr := 'PROC_TRANSP = GetTranspPers(' + qrMaterialDetail.FieldByName('PTM_ID').AsString +
              ', MAT_CODE)';

          Script.Add('UPDATE materialcard_temp set ' + UpdateStr + ' WHERE ID=' +
            qrMaterialDetail.FieldByName('ID').AsString + WhereStr + ';');

          qrMaterialDetail.Next;
        end;

      end;
    end;
    FDScript1.ExecuteScript(TStrings(Script));
  finally
    grMaterial.DataSource.DataSet.GotoBookmark(TempBookmark);
    grMaterial.DataSource.DataSet.FreeBookmark(TempBookmark);
    grMaterial.DataSource.DataSet.EnableControls;
    qrMaterialDetail.EnableControls;
    FormCalculationEstimate.RecalcEstimate;
    pgcChange(nil);
  end;
end;

procedure TfCalcResource.mN3Click(Sender: TObject);
begin
  if Application.MessageBox('Восстановить исходные значения строки?', 'Расчет стоимости ресурсов',
    MB_YESNO + MB_ICONQUESTION + MB_TOPMOST) = IDYES then
  begin
    case pgc.ActivePageIndex of
      // Расчет материалов
      1:
        begin
          qrMaterialData.Edit;
          qrMaterialData.FieldByName('COAST').Value := 0;
          // PMTrPerc0Click(mN11);
          qrMaterialData.Post;
        end;
      // Расчет механизмов
      2:
        begin
          qrMechData.Edit;
          qrMechDataCOAST.Value := 0;
          qrMechDataZP_1.Value := 0;
          qrMechData.Post;
        end;
      // Расчет оборудования
      3:
        begin

        end;
    end;

  end;

end;

procedure TfCalcResource.mReplaceClick(Sender: TObject);
var
  frmReplace: TfrmReplacement;
begin
  { grMaterial.Options := grMaterial.Options - [dgMultiSelect];
    grMaterialBott.Options := grMaterialBott.Options - [dgMultiSelect];
    grMech.Options := grMaterial.Options - [dgMultiSelect];
    grMechBott.Options := grMechBott.Options - [dgMultiSelect]; }
  case pgc.ActivePageIndex of
    1:
      frmReplace := TfrmReplacement.Create(0, IDEstimate, 0, 0, qrMaterialData.FieldByName('MAT_ID')
        .AsInteger, 2, False, False);
    2:
      frmReplace := TfrmReplacement.Create(0, IDEstimate, 0, 0, qrMechData.FieldByName('MECH_ID').AsInteger,
        3, False, False);
    3:
      frmReplace := TfrmReplacement.Create(0, IDEstimate, 0, 0, qrDevices.FieldByName('DEVICE_ID').AsInteger,
        4, False, False);
  end;
  if Assigned(frmReplace) then
    try
      if (frmReplace.ShowModal = mrYes) then
      begin
        // пересчет после замены
        FormCalculationEstimate.RecalcEstimate;
        pgcChange(nil);
      end;
    finally
      FreeAndNil(frmReplace);
    end;
  { grMaterial.Options := grMaterial.Options + [dgMultiSelect];
    grMaterialBott.Options := grMaterialBott.Options + [dgMultiSelect];
    grMech.Options := grMaterial.Options + [dgMultiSelect];
    grMechBott.Options := grMechBott.Options + [dgMultiSelect]; }
end;

procedure TfCalcResource.mRestoreClick(Sender: TObject);
begin
  case pgc.ActivePageIndex of
    // Расчет стоимости
    0:
      ;
    // Расчет материалов
    1:
      begin
        if not(qrMaterialData.State in [dsEdit]) then
          qrMaterialData.Edit;
        qrMaterialData.FieldByName('DELETED').Value := 0;
      end;
    // Расчет механизмов
    2:
      begin
        if not(qrMechData.State in [dsEdit]) then
          qrMechData.Edit;
        qrMechData.FieldByName('DELETED').Value := 0;
      end;
    // Расчет оборудования
    3:
      begin
        if not(qrDevices.State in [dsEdit]) then
          qrDevices.Edit;
        qrDevices.FieldByName('DELETED').Value := 0;
      end;

    // Расчет з\п
    4:
      begin
        if not(qrRates.State in [dsEdit]) then
          qrRates.Edit;
        qrRates.FieldByName('DELETED').Value := 0;
      end;
  end;
end;

procedure TfCalcResource.N1Click(Sender: TObject);
begin
  case pgc.ActivePageIndex of
    // Расчет стоимости
    0:
      ;
    // Расчет материалов
    1:
      begin

      end;
    // Расчет механизмов
    2:
      begin

      end;
    // Расчет оборудования
    3:
      begin

      end;
    // Расчет з\п
    4:
      begin

      end;
  end;
end;

procedure TfCalcResource.N2Click(Sender: TObject);
begin
  case pgc.ActivePageIndex of
    // Расчет стоимости
    0:
      ;
    // Расчет материалов
    1:
      begin

      end;
    // Расчет механизмов
    2:
      begin

      end;
    // Расчет оборудования
    3:
      begin

      end;
    // Расчет з\п
    4:
      begin

      end;
  end;
end;

procedure TfCalcResource.pgcChange(Sender: TObject);
begin
  if not flLoaded then
    Exit;
  case pgc.ActivePageIndex of
    // Расчет стоимости
    0:
      ;
    // Расчет материалов
    1:
      begin
        CloseOpen(qrMaterialData);
        CloseOpen(qrMaterialDetail);
        DoSort(qrMaterialData, grMaterial);
      end;
    // Расчет механизмов
    2:
      begin
        CloseOpen(qrMechData);
        CloseOpen(qrMechDetail);
        DoSort(qrMechData, grMech);
      end;
    // Расчет оборудования
    3:
      begin
        CloseOpen(qrDevices);
        CloseOpen(qrDevicesDetail);
        DoSort(qrDevices, grDev);
      end;
    // Расчет з\п
    4:
      begin
        CloseOpen(qrRates);
        DoSort(qrRates, grRates);
      end;
  end;
end;

procedure TfCalcResource.pmPopup(Sender: TObject);
begin
  case pgc.ActivePageIndex of
    // Расчет стоимости
    0:
      ;
    // Расчет материалов
    1:
      begin
        mDetete.Visible := qrMaterialData.FieldByName('DELETED').AsInteger = 0;
        mRestore.Visible := qrMaterialData.FieldByName('DELETED').AsInteger = 1;
        mReplace.Visible := True;
        mPROC_TRANSP.Visible := True;
        //grMaterial.SelectedRows.CurrentRowSelected := True;
      end;
    // Расчет механизмов
    2:
      begin
        mDetete.Visible := qrMechData.FieldByName('DELETED').AsInteger = 0;
        mRestore.Visible := qrMechData.FieldByName('DELETED').AsInteger = 1;
        mReplace.Visible := True;
        mPROC_TRANSP.Visible := False;
      end;
    // Расчет оборудования
    3:
      begin
        mDetete.Visible := qrDevices.FieldByName('DELETED').AsInteger = 0;
        mRestore.Visible := qrDevices.FieldByName('DELETED').AsInteger = 1;
        mReplace.Visible := True;
        mPROC_TRANSP.Visible := False;
      end;
    // Расчет з\п
    4:
      begin
        mDetete.Visible := qrRates.FieldByName('DELETED').AsInteger = 0;
        mRestore.Visible := qrRates.FieldByName('DELETED').AsInteger = 1;
        mReplace.Visible := False;
        mPROC_TRANSP.Visible := False;
      end;
  end;

end;

procedure TfCalcResource.pnlCalculationYesNoClick(Sender: TObject);
begin
  with pnlCalculationYesNo do
    if Tag = 1 then
    begin
      Tag := 0;
      Color := clRed;
      Caption := 'Расчёты запрещены';
      fCalcResource.Caption := 'Расчет стоимости ресурсов [редактирование запрещено]';
    end
    else
    begin
      Tag := 1;
      Color := clLime;
      Caption := 'Расчёты разрешены';
      fCalcResource.Caption := 'Расчет стоимости ресурсов [редактирование разрешено]';
    end;

  case pgc.ActivePageIndex of
    // Расчет стоимости
    0:
      ;
    // Расчет материалов
    1:
      begin
        grMaterial.Repaint;
        grMaterialBott.Repaint;
      end;
    // Расчет механизмов
    2:
      begin
        grMech.Repaint;
        grMechBott.Repaint;
      end;
    // Расчет оборудования
    3:
      begin
        grDev.Repaint;
        grDevBott.Repaint;
      end;
    // Расчет з\п
    4:
      begin
        grRates.Repaint;
      end;
  end;
end;

procedure TfCalcResource.qrDevicesBeforePost(DataSet: TDataSet);
var
  priceQ, priceQ1: string;
begin
  if PS.CalcResourcesAutoSave or (Application.MessageBox('Сохранить изменения?', 'Смета',
    MB_YESNO + MB_ICONQUESTION + MB_TOPMOST) = IDYES)
  { and (Application.MessageBox('Вы уверены, что хотите применить изменения?'#13 +
    '(будет произведена замена во всех зависимых величинах)', 'Смета',
    MB_YESNO + MB_ICONQUESTION + MB_TOPMOST) = IDYES) } then
  begin
    with qrDevices do
    begin
      // Цена
      case cbbNDS.ItemIndex of
        // Если в режиме без НДС
        0:
          begin
            priceQ := 'FCOAST_NO_NDS=:01, FCOAST_NDS=FCOAST_NO_NDS+(FCOAST_NO_NDS*NDS/100),'#13;
            priceQ1 :=
              'DEVICE_TRANSP_NO_NDS=:02, DEVICE_TRANSP_NDS=DEVICE_TRANSP_NO_NDS+(DEVICE_TRANSP_NO_NDS*NDS/100),'#13;
          end;
        // С НДС
        1:
          begin
            priceQ := 'FCOAST_NDS=:01, FCOAST_NO_NDS=FCOAST_NDS-(FCOAST_NDS/(100+NDS)*NDS),'#13;
            priceQ1 :=
              'DEVICE_TRANSP_NDS=:02, DEVICE_TRANSP_NO_NDS=DEVICE_TRANSP_NDS-(DEVICE_TRANSP_NDS/(100+NDS)*NDS),'#13;
          end;
      end;

      FastExecSQL('UPDATE devicescard_temp SET'#13 + priceQ1 + priceQ +
        'TRANSP_PROC_PODR=:1, TRANSP_PROC_ZAC=:2,'#13 + 'PROC_PODR=:3, PROC_ZAC=:4'#13 + 'WHERE '#13 +
        'PROC_ZAC=:11 AND PROC_PODR=:12'#13 + 'AND TRANSP_PROC_ZAC=:13 AND TRANSP_PROC_PODR=:14'#13 +
        'AND IF(:NDS=1, FCOAST_NDS, FCOAST_NO_NDS)=:15 AND DEVICE_ID=:16'#13 +
        'AND IF(:NDS1=1, DEVICE_TRANSP_NDS, DEVICE_TRANSP_NO_NDS)=:17',
        VarArrayOf([FieldByName('TRANSP').AsFloat, FieldByName('COAST').AsFloat,
        FieldByName('TRANSP_PROC_PODR').Value, FieldByName('TRANSP_PROC_ZAC').Value,
        FieldByName('PROC_PODR').Value, FieldByName('PROC_ZAC').Value, FieldByName('PROC_ZAC').OldValue,
        FieldByName('PROC_PODR').OldValue, FieldByName('TRANSP_PROC_ZAC').OldValue,
        FieldByName('TRANSP_PROC_PODR').OldValue, cbbNDS.ItemIndex, FieldByName('COAST').OldValue,
        FieldByName('DEVICE_ID').Value, cbbNDS.ItemIndex, FieldByName('TRANSP').OldValue]));
    end;
    // Вызываем переасчет всей сметы
    FormCalculationEstimate.RecalcEstimate;
    pgcChange(nil);
  end
  else
  begin
    qrDevices.Cancel;
    Abort;
  end;
end;

procedure TfCalcResource.qrDevicesCalcFields(DataSet: TDataSet);
begin
  qrDevicesNUMPP.Value := qrDevices.RecNo;
  if qrDevicesNUMPP.Value = 0 then
    qrDevicesNUMPP.Value := 1;
end;

procedure TfCalcResource.qrDevicesCOASTChange(Sender: TField);
begin
  qrDevices.FieldByName('PRICE').Value :=
    ROUND(qrDevices.FieldByName('COAST').AsFloat * qrDevices.FieldByName('CNT').Value);
end;

procedure TfCalcResource.qrDevicesDetailBeforePost(DataSet: TDataSet);
var
  priceQ, priceQ1: string;
begin
  if PS.CalcResourcesAutoSave or (Application.MessageBox('Сохранить изменения?', 'Смета',
    MB_YESNO + MB_ICONQUESTION + MB_TOPMOST) = IDYES) then
  begin
    with qrDevicesDetail do
    begin
      // Цена
      case cbbNDS.ItemIndex of
        // Если в режиме без НДС
        0:
          begin
            priceQ := 'FCOAST_NO_NDS=:01, FCOAST_NDS=FCOAST_NO_NDS+(FCOAST_NO_NDS*NDS/100),'#13;
            priceQ1 :=
              'DEVICE_TRANSP_NO_NDS=:02, DEVICE_TRANSP_NDS=DEVICE_TRANSP_NO_NDS+(DEVICE_TRANSP_NO_NDS*NDS/100),'#13;
          end;
        // С НДС
        1:
          begin
            priceQ := 'FCOAST_NDS=:01, FCOAST_NO_NDS=FCOAST_NDS-(FCOAST_NDS/(100+NDS)*NDS),'#13;
            priceQ1 :=
              'DEVICE_TRANSP_NDS=:02, DEVICE_TRANSP_NO_NDS=DEVICE_TRANSP_NDS-(DEVICE_TRANSP_NDS/(100+NDS)*NDS),'#13;
          end;
      end;

      FastExecSQL('UPDATE devicescard_temp SET'#13 + priceQ1 + priceQ +
        'TRANSP_PROC_PODR=:1, TRANSP_PROC_ZAC=:2, PROC_PODR=:3, PROC_ZAC=:4 WHERE ID=:11',
        VarArrayOf([FieldByName('TRANSP').AsFloat, FieldByName('COAST').AsFloat,
        FieldByName('TRANSP_PROC_PODR').Value, FieldByName('TRANSP_PROC_ZAC').Value,
        FieldByName('PROC_PODR').Value, FieldByName('PROC_ZAC').Value, FieldByName('ID').Value]));
    end;
    // Вызываем переасчет всей сметы
    FormCalculationEstimate.RecalcEstimate;
    pgcChange(nil);
  end
  else
  begin
    qrDevicesDetail.Cancel;
    Abort;
  end;
end;

procedure TfCalcResource.qrDevicesPROC_PODRChange(Sender: TField);
var
  e: TFieldNotifyEvent;
begin
  try
    e := qrDevicesPROC_ZAC.OnChange;
    qrDevicesPROC_ZAC.OnChange := nil;
    qrDevices.FieldByName('PROC_ZAC').Value := 100 - qrDevices.FieldByName('PROC_PODR').Value;
    qrDevicesPROC_ZAC.OnChange := e;
  except
    Application.MessageBox('Установлено неверное значение!' + #13#10 +
      'Значение должно находиться в диаппазоне 0-100.', 'Смета', MB_OK + MB_ICONSTOP + MB_TOPMOST);
  end;
end;

procedure TfCalcResource.qrDevicesPROC_ZACChange(Sender: TField);
var
  e: TFieldNotifyEvent;
begin
  try
    e := qrDevicesPROC_PODR.OnChange;
    qrDevicesPROC_PODR.OnChange := nil;
    qrDevices.FieldByName('PROC_PODR').Value := 100 - qrDevices.FieldByName('PROC_ZAC').Value;
    qrDevicesPROC_PODR.OnChange := e;
  except
    Application.MessageBox('Установлено неверное значение!' + #13#10 +
      'Значение должно находиться в диаппазоне 0-100.', 'Смета', MB_OK + MB_ICONSTOP + MB_TOPMOST);
  end;
end;

procedure TfCalcResource.qrDevicesTRANSP_PROC_PODRChange(Sender: TField);
var
  e: TFieldNotifyEvent;
begin
  try
    e := qrDevicesTRANSP_PROC_ZAC.OnChange;
    qrDevicesTRANSP_PROC_ZAC.OnChange := nil;
    qrDevices.FieldByName('TRANSP_PROC_ZAC').Value := 100 - qrDevices.FieldByName('TRANSP_PROC_PODR').Value;
    qrDevicesTRANSP_PROC_ZAC.OnChange := e;
  except
    Application.MessageBox('Установлено неверное значение!' + #13#10 +
      'Значение должно находиться в диаппазоне 0-100.', 'Смета', MB_OK + MB_ICONSTOP + MB_TOPMOST);
  end;
end;

procedure TfCalcResource.qrDevicesTRANSP_PROC_ZACChange(Sender: TField);
var
  e: TFieldNotifyEvent;
begin
  try
    e := qrDevicesTRANSP_PROC_PODR.OnChange;
    qrDevicesTRANSP_PROC_PODR.OnChange := nil;
    qrDevices.FieldByName('TRANSP_PROC_PODR').Value := 100 - qrDevices.FieldByName('TRANSP_PROC_ZAC').Value;
    qrDevicesTRANSP_PROC_PODR.OnChange := e;
  except
    Application.MessageBox('Установлено неверное значение!' + #13#10 +
      'Значение должно находиться в диаппазоне 0-100.', 'Смета', MB_OK + MB_ICONSTOP + MB_TOPMOST);
  end;
end;

procedure TfCalcResource.qrMaterialDataAfterOpen(DataSet: TDataSet);
begin
  if CheckQrActiveEmpty(DataSet) then
    CalcFooter;
end;

procedure TfCalcResource.qrMaterialDataBeforeOpen(DataSet: TDataSet);
begin
  if (DataSet as TFDQuery).FindParam('SM_ID') <> nil then
    (DataSet as TFDQuery).ParamByName('SM_ID').AsInteger := IDEstimate;
  if (DataSet as TFDQuery).FindParam('NDS') <> nil then
    (DataSet as TFDQuery).ParamByName('NDS').AsInteger := cbbNDS.ItemIndex;
  if (DataSet as TFDQuery).FindParam('SHOW_DELETED') <> nil then
    (DataSet as TFDQuery).ParamByName('SHOW_DELETED').Value := mShowDeleted.Checked;
end;

procedure TfCalcResource.qrMaterialDataBeforePost(DataSet: TDataSet);
var
  priceQ: string;
begin
  if PS.CalcResourcesAutoSave or (Application.MessageBox('Сохранить изменения?', 'Смета',
    MB_YESNO + MB_ICONQUESTION + MB_TOPMOST) = IDYES)
  { and (Application.MessageBox('Вы уверены, что хотите применить изменения?'#13 +
    '(будет произведена замена во всех зависимых величинах)', 'Смета',
    MB_YESNO + MB_ICONQUESTION + MB_TOPMOST) = IDYES) } then
  begin
    with qrMaterialData do
    begin
      FastExecSQL('UPDATE materialcard_temp SET'#13 + 'TRANSP_PROC_PODR=:1, TRANSP_PROC_ZAC=:2,'#13 +
        'MAT_PROC_PODR=:3, MAT_PROC_ZAC=:4, DELETED=:5,'#13 + 'PROC_TRANSP=:7'#13 +
        'WHERE PROC_TRANSP=:9 AND DELETED=:10'#13 + 'AND MAT_PROC_ZAC=:11 AND MAT_PROC_PODR=:12'#13 +
        'AND TRANSP_PROC_ZAC=:13 AND TRANSP_PROC_PODR=:14'#13 +
        'AND IF(:NDS=1, IF(FCOAST_NDS<>0, FCOAST_NDS, COAST_NDS), IF(FCOAST_NO_NDS<>0, FCOAST_NO_NDS, COAST_NO_NDS))=:15 AND MAT_ID=:16',
        VarArrayOf([FieldByName('TRANSP_PROC_PODR').Value, FieldByName('TRANSP_PROC_ZAC').Value,
        FieldByName('MAT_PROC_PODR').Value, FieldByName('MAT_PROC_ZAC').Value, FieldByName('DELETED').Value,
        FieldByName('PROC_TRANSP').AsFloat, FieldByName('PROC_TRANSP').OldValue,
        FieldByName('DELETED').OldValue, FieldByName('MAT_PROC_ZAC').OldValue,
        FieldByName('MAT_PROC_PODR').OldValue, FieldByName('TRANSP_PROC_ZAC').OldValue,
        FieldByName('TRANSP_PROC_PODR').OldValue, cbbNDS.ItemIndex, FieldByName('COAST').OldValue,
        FieldByName('MAT_ID').Value]));

      // Цена
      case cbbNDS.ItemIndex of
        // Если в режиме без НДС
        0:
          priceQ := 'FCOAST_NO_NDS=:1, FCOAST_NDS=FCOAST_NO_NDS/*FCOAST_NO_NDS+(FCOAST_NO_NDS*NDS/100)*/,FTRANSP_NO_NDS=ROUND(FCOAST_NO_NDS*MAT_COUNT*PROC_TRANSP/100), FTRANSP_NDS=ROUND(FCOAST_NDS*MAT_COUNT*PROC_TRANSP/100)'#13;
        // С НДС
        1:
          priceQ := 'FCOAST_NDS=:1, FCOAST_NO_NDS=FCOAST_NDS/*FCOAST_NDS-(FCOAST_NDS/(100+NDS)*NDS)*/,FTRANSP_NO_NDS=ROUND(FCOAST_NO_NDS*MAT_COUNT*PROC_TRANSP/100), FTRANSP_NDS=ROUND(FCOAST_NDS*MAT_COUNT*PROC_TRANSP/100)'#13;
      end;

      if FieldByName('COAST').Value <> FieldByName('COAST').OldValue then
        FastExecSQL('UPDATE materialcard_temp SET'#13 + priceQ + ' WHERE PROC_TRANSP=:4 AND DELETED=:5'#13 +
          'AND MAT_PROC_ZAC=:6 AND MAT_PROC_PODR=:7'#13 + 'AND TRANSP_PROC_ZAC=:8 AND TRANSP_PROC_PODR=:9'#13
          + 'AND IF(:NDS=1, IF(FCOAST_NDS<>0, FCOAST_NDS, COAST_NDS), IF(FCOAST_NO_NDS<>0, FCOAST_NO_NDS, COAST_NO_NDS))=:10 AND MAT_ID=:11',
          VarArrayOf([FieldByName('COAST').AsFloat, FieldByName('PROC_TRANSP').Value,
          FieldByName('DELETED').Value, FieldByName('MAT_PROC_ZAC').Value, FieldByName('MAT_PROC_PODR').Value,
          FieldByName('TRANSP_PROC_ZAC').Value, FieldByName('TRANSP_PROC_PODR').Value, cbbNDS.ItemIndex,
          FieldByName('COAST').OldValue, FieldByName('MAT_ID').Value]));
      // Процент транспорта
      if FieldByName('PROC_TRANSP').Value <> FieldByName('PROC_TRANSP').OldValue then
        FastExecSQL
          ('UPDATE materialcard_temp SET FTRANSP_NO_NDS=ROUND(FCOAST_NO_NDS*MAT_COUNT*PROC_TRANSP/100), FTRANSP_NDS=ROUND(FCOAST_NDS*MAT_COUNT*PROC_TRANSP/100) WHERE PROC_TRANSP=:4 AND DELETED=:5'#13
          + 'AND MAT_PROC_ZAC=:6 AND MAT_PROC_PODR=:7'#13 +
          'AND TRANSP_PROC_ZAC=:8 AND TRANSP_PROC_PODR=:9'#13 +
          'AND IF(:NDS=1, IF(FCOAST_NDS<>0, FCOAST_NDS, COAST_NDS), IF(FCOAST_NO_NDS<>0, FCOAST_NO_NDS, COAST_NO_NDS))=:10 AND MAT_ID=:11',
          VarArrayOf([FieldByName('PROC_TRANSP').Value, FieldByName('DELETED').Value,
          FieldByName('MAT_PROC_ZAC').Value, FieldByName('MAT_PROC_PODR').Value,
          FieldByName('TRANSP_PROC_ZAC').Value, FieldByName('TRANSP_PROC_PODR').Value, cbbNDS.ItemIndex,
          FieldByName('COAST').Value, FieldByName('MAT_ID').Value]));
      // Стоимость транспорта
      {
        if FieldByName('TRANSP').Value <> FieldByName('TRANSP').OldValue then
        FastExecSQL('UPDATE materialcard_temp SET FTRANSP_NO_NDS = :1, FTRANSP_NDS = :2'#13 +
        'WHERE PROC_TRANSP=:4 AND DELETED=:5'#13 + 'AND MAT_PROC_ZAC=:6 AND MAT_PROC_PODR=:7'#13 +
        'AND TRANSP_PROC_ZAC=:8 AND TRANSP_PROC_PODR=:9'#13 +
        'AND IF(:NDS=1, IF(FCOAST_NDS<>0, FCOAST_NDS, COAST_NDS), IF(FCOAST_NO_NDS<>0, FCOAST_NO_NDS, COAST_NO_NDS))=:10 AND MAT_ID=:11',
        VarArrayOf([FieldByName('TRANSP').Value, FieldByName('TRANSP').Value,
        FieldByName('PROC_TRANSP').Value, FieldByName('DELETED').Value, FieldByName('MAT_PROC_ZAC').Value,
        FieldByName('MAT_PROC_PODR').Value, FieldByName('TRANSP_PROC_ZAC').Value,
        FieldByName('TRANSP_PROC_PODR').Value, cbbNDS.ItemIndex, FieldByName('COAST').Value,
        FieldByName('MAT_ID').Value]));
      }
    end;
    // Вызываем переасчет всей сметы
    FormCalculationEstimate.RecalcEstimate;
    pgcChange(nil);
  end
  else
  begin
    qrMaterialData.Cancel;
    Abort;
  end;
end;

procedure TfCalcResource.qrMaterialDataCalcFields(DataSet: TDataSet);
begin
  qrMaterialDataNUMPP.Value := qrMaterialData.RecNo;
  if qrMaterialDataNUMPP.Value = 0 then
    qrMaterialDataNUMPP.Value := 1;
end;

procedure TfCalcResource.qrMaterialDataCOASTChange(Sender: TField);
begin
  qrMaterialData.FieldByName('PRICE').Value :=
    ROUND(qrMaterialData.FieldByName('COAST').AsFloat * qrMaterialData.FieldByName('CNT').Value);
  qrMaterialData.FieldByName('TRANSP').Value :=
    ROUND(qrMaterialData.FieldByName('PRICE').Value * qrMaterialData.FieldByName('PROC_TRANSP')
    .AsFloat / 100);
end;

procedure TfCalcResource.qrMaterialDataMAT_PROC_PODRChange(Sender: TField);
var
  e: TFieldNotifyEvent;
begin
  try
    e := qrMaterialDataMAT_PROC_ZAC.OnChange;
    qrMaterialDataMAT_PROC_ZAC.OnChange := nil;
    qrMaterialData.FieldByName('MAT_PROC_ZAC').Value := 100 - qrMaterialData.FieldByName
      ('MAT_PROC_PODR').Value;
    qrMaterialDataMAT_PROC_ZAC.OnChange := e;
  except
    Application.MessageBox('Установлено неверное значение!' + #13#10 +
      'Значение должно находиться в диаппазоне 0-100.', 'Смета', MB_OK + MB_ICONSTOP + MB_TOPMOST);
  end;
end;

procedure TfCalcResource.qrMaterialDataMAT_PROC_ZACChange(Sender: TField);
var
  e: TFieldNotifyEvent;
begin
  try
    e := qrMaterialDataMAT_PROC_PODR.OnChange;
    qrMaterialDataMAT_PROC_PODR.OnChange := nil;
    qrMaterialData.FieldByName('MAT_PROC_PODR').Value :=
      100 - qrMaterialData.FieldByName('MAT_PROC_ZAC').Value;
    qrMaterialDataMAT_PROC_PODR.OnChange := e;
  except
    Application.MessageBox('Установлено неверное значение!' + #13#10 +
      'Значение должно находиться в диаппазоне 0-100.', 'Смета', MB_OK + MB_ICONSTOP + MB_TOPMOST);
  end;
end;

procedure TfCalcResource.qrMaterialDataTRANSP_PROC_PODRChange(Sender: TField);
var
  e: TFieldNotifyEvent;
begin
  try
    e := qrMaterialDataTRANSP_PROC_ZAC.OnChange;
    qrMaterialDataTRANSP_PROC_ZAC.OnChange := nil;
    qrMaterialData.FieldByName('TRANSP_PROC_ZAC').Value :=
      100 - qrMaterialData.FieldByName('TRANSP_PROC_PODR').Value;
    qrMaterialDataTRANSP_PROC_ZAC.OnChange := e;
  except
    Application.MessageBox('Установлено неверное значение!' + #13#10 +
      'Значение должно находиться в диаппазоне 0-100.', 'Смета', MB_OK + MB_ICONSTOP + MB_TOPMOST);
  end;
end;

procedure TfCalcResource.qrMaterialDataTRANSP_PROC_ZACChange(Sender: TField);
var
  e: TFieldNotifyEvent;
begin
  try
    e := qrMaterialDataTRANSP_PROC_PODR.OnChange;
    qrMaterialDataTRANSP_PROC_PODR.OnChange := nil;
    qrMaterialData.FieldByName('TRANSP_PROC_PODR').Value :=
      100 - qrMaterialData.FieldByName('TRANSP_PROC_ZAC').Value;
    qrMaterialDataTRANSP_PROC_PODR.OnChange := e;
  except
    Application.MessageBox('Установлено неверное значение!' + #13#10 +
      'Значение должно находиться в диаппазоне 0-100.', 'Смета', MB_OK + MB_ICONSTOP + MB_TOPMOST);
  end;
end;

procedure TfCalcResource.qrMaterialDetailBeforePost(DataSet: TDataSet);
var
  priceQ: string;
begin
  if PS.CalcResourcesAutoSave or (Application.MessageBox('Сохранить изменения?', 'Смета',
    MB_YESNO + MB_ICONQUESTION + MB_TOPMOST) = IDYES) then
  begin
    with qrMaterialDetail do
    begin
      FastExecSQL('UPDATE materialcard_temp SET TRANSP_PROC_PODR=:1, TRANSP_PROC_ZAC=:2,'#13 +
        'MAT_PROC_PODR=:3, MAT_PROC_ZAC=:4, DELETED=:5, PROC_TRANSP=:7 WHERE ID=:9',
        VarArrayOf([FieldByName('TRANSP_PROC_PODR').Value, FieldByName('TRANSP_PROC_ZAC').Value,
        FieldByName('MAT_PROC_PODR').Value, FieldByName('MAT_PROC_ZAC').Value, FieldByName('DELETED').Value,
        FieldByName('PROC_TRANSP').Value, FieldByName('ID').Value]));

      // Цена
      case cbbNDS.ItemIndex of
        // Если в режиме без НДС
        0:
          priceQ := 'FCOAST_NO_NDS=:1, FCOAST_NDS=FCOAST_NO_NDS/*FCOAST_NO_NDS+(FCOAST_NO_NDS*NDS/100)*/,FTRANSP_NO_NDS=ROUND(FCOAST_NO_NDS*MAT_COUNT*PROC_TRANSP/100), FTRANSP_NDS=ROUND(FCOAST_NDS*MAT_COUNT*PROC_TRANSP/100)'#13;
        // С НДС
        1:
          priceQ := 'FCOAST_NDS=:1, FCOAST_NO_NDS=FCOAST_NDS/*FCOAST_NDS-(FCOAST_NDS/(100+NDS)*NDS)*/,FTRANSP_NO_NDS=ROUND(FCOAST_NO_NDS*MAT_COUNT*PROC_TRANSP/100), FTRANSP_NDS=ROUND(FCOAST_NDS*MAT_COUNT*PROC_TRANSP/100)'#13;
      end;

      if FieldByName('COAST').Value <> FieldByName('COAST').OldValue then
        FastExecSQL('UPDATE materialcard_temp SET'#13 + priceQ + ' WHERE ID=:4',
          VarArrayOf([FieldByName('COAST').AsFloat, FieldByName('ID').Value]));

      if FieldByName('PROC_TRANSP').Value <> FieldByName('PROC_TRANSP').OldValue then
        FastExecSQL
          ('UPDATE materialcard_temp SET FTRANSP_NO_NDS=ROUND(FCOAST_NO_NDS*MAT_COUNT*PROC_TRANSP/100), FTRANSP_NDS=ROUND(FCOAST_NDS*MAT_COUNT*PROC_TRANSP/100) WHERE ID=:4',
          VarArrayOf([FieldByName('ID').Value]));

      // Стоимость транспорта
      if FieldByName('TRANSP').Value <> FieldByName('TRANSP').OldValue then
        FastExecSQL('UPDATE materialcard_temp SET FTRANSP_NO_NDS = :1, FTRANSP_NDS = :2 WHERE ID=:4',
          VarArrayOf([FieldByName('TRANSP').AsFloat, FieldByName('TRANSP').AsFloat,
          FieldByName('ID').Value]));
    end;
    // Вызываем переасчет всей сметы
    FormCalculationEstimate.RecalcEstimate;
    pgcChange(nil);
  end
  else
  begin
    qrMaterialDetail.Cancel;
    Abort;
  end;
end;

procedure TfCalcResource.qrMechDataBeforePost(DataSet: TDataSet);
var
  priceQ, priceQ1: string;
begin
  if PS.CalcResourcesAutoSave or (Application.MessageBox('Сохранить изменения?', 'Смета',
    MB_YESNO + MB_ICONQUESTION + MB_TOPMOST) = IDYES)
  { and (Application.MessageBox('Вы уверены, что хотите применить изменения?'#13 +
    '(будет произведена замена во всех зависимых величинах)', 'Смета',
    MB_YESNO + MB_ICONQUESTION + MB_TOPMOST) = IDYES) } then
  begin
    with qrMechData do
    begin
      FastExecSQL('UPDATE mechanizmcard_temp SET'#13 + 'PROC_PODR=:3, PROC_ZAC=:4, DELETED=:5'#13 +
        'WHERE DELETED=:10'#13 + 'AND PROC_ZAC=:11 AND PROC_PODR=:12'#13 +
        'AND IF(:NDS=1, IF(FCOAST_NDS<>0, FCOAST_NDS, COAST_NDS), IF(FCOAST_NO_NDS<>0, FCOAST_NO_NDS, COAST_NO_NDS))=:15 AND MECH_ID=:16'#13
        + 'AND IF(:NDS1=1, IF(FZP_MACH_NDS<>0, FZP_MACH_NDS, ZP_MACH_NDS), IF(FZP_MACH_NO_NDS<>0, FZP_MACH_NO_NDS, ZP_MACH_NO_NDS))=:17',
        VarArrayOf([FieldByName('PROC_PODR').Value, FieldByName('PROC_ZAC').Value,
        FieldByName('DELETED').Value, FieldByName('DELETED').OldValue, FieldByName('PROC_ZAC').OldValue,
        FieldByName('PROC_PODR').OldValue, cbbNDS.ItemIndex, FieldByName('COAST').OldValue,
        FieldByName('MECH_ID').Value, cbbNDS.ItemIndex, FieldByName('ZP_1').OldValue]));

      // Цена
      case cbbNDS.ItemIndex of
        // Если в режиме без НДС
        0:
          begin
            priceQ := 'FCOAST_NO_NDS=:1, FCOAST_NDS=FCOAST_NO_NDS+(FCOAST_NO_NDS*NDS/100)'#13;
            priceQ1 := 'FZP_MACH_NO_NDS=:1, FZP_MACH_NDS=FZP_MACH_NO_NDS+(FZP_MACH_NO_NDS*NDS/100)'#13;
          end;
        // С НДС
        1:
          begin
            priceQ := 'FCOAST_NDS=:1, FCOAST_NO_NDS=FCOAST_NDS-(FCOAST_NDS/(100+NDS)*NDS)'#13;
            priceQ1 := 'FZP_MACH_NDS=:1, FZP_MACH_NO_NDS=FZP_MACH_NDS-(FZP_MACH_NDS/(100+NDS)*NDS)'#13;
          end;
      end;

      if FieldByName('COAST').Value <> FieldByName('COAST').OldValue then
        FastExecSQL('UPDATE mechanizmcard_temp SET'#13 + priceQ + ' WHERE DELETED=:5'#13 +
          'AND PROC_ZAC=:6 AND PROC_PODR=:7'#13 +
          'AND IF(:NDS=1, IF(FCOAST_NDS<>0, FCOAST_NDS, COAST_NDS), IF(FCOAST_NO_NDS<>0, FCOAST_NO_NDS, COAST_NO_NDS))=:10 AND MECH_ID=:11'#13
          + 'AND IF(:NDS1=1, IF(FZP_MACH_NDS<>0, FZP_MACH_NDS, ZP_MACH_NDS), IF(FZP_MACH_NO_NDS<>0, FZP_MACH_NO_NDS, ZP_MACH_NO_NDS))=:12',
          VarArrayOf([FieldByName('COAST').AsFloat, FieldByName('DELETED').Value,
          FieldByName('PROC_ZAC').Value, FieldByName('PROC_PODR').Value, cbbNDS.ItemIndex,
          FieldByName('COAST').OldValue, FieldByName('MECH_ID').Value, cbbNDS.ItemIndex,
          FieldByName('ZP_1').OldValue]));

      if FieldByName('ZP_1').Value <> FieldByName('ZP_1').OldValue then
        FastExecSQL('UPDATE mechanizmcard_temp SET'#13 + priceQ1 + ' WHERE DELETED=:5'#13 +
          'AND PROC_ZAC=:6 AND PROC_PODR=:7'#13 +
          'AND IF(:NDS=1, IF(FCOAST_NDS<>0, FCOAST_NDS, COAST_NDS), IF(FCOAST_NO_NDS<>0, FCOAST_NO_NDS, COAST_NO_NDS))=:10 AND MECH_ID=:11'#13
          + 'AND IF(:NDS1=1, IF(FZP_MACH_NDS<>0, FZP_MACH_NDS, ZP_MACH_NDS), IF(FZP_MACH_NO_NDS<>0, FZP_MACH_NO_NDS, ZP_MACH_NO_NDS))=:12',
          VarArrayOf([FieldByName('ZP_1').AsFloat, FieldByName('DELETED').Value,
          FieldByName('PROC_ZAC').Value, FieldByName('PROC_PODR').Value, cbbNDS.ItemIndex,
          FieldByName('COAST').Value, FieldByName('MECH_ID').Value, cbbNDS.ItemIndex,
          FieldByName('ZP_1').OldValue]));
    end;
    // Вызываем переасчет всей сметы
    FormCalculationEstimate.RecalcEstimate;
    pgcChange(nil);
  end
  else
  begin
    qrMechData.Cancel;
    Abort;
  end;
end;

procedure TfCalcResource.qrMechDataCalcFields(DataSet: TDataSet);
begin
  qrMechDataNUMPP.Value := qrMechData.RecNo;
  if qrMechDataNUMPP.Value = 0 then
    qrMechDataNUMPP.Value := 1;
end;

procedure TfCalcResource.qrMechDataCOASTChange(Sender: TField);
begin
  qrMechData.FieldByName('PRICE').Value :=
    ROUND(qrMechData.FieldByName('COAST').AsFloat * qrMechData.FieldByName('CNT').Value);
  qrMechData.FieldByName('ZP_2').Value :=
    ROUND(qrMechData.FieldByName('ZP_1').AsFloat * qrMechData.FieldByName('CNT').Value);
end;

procedure TfCalcResource.qrMechDataPROC_PODRChange(Sender: TField);
var
  e: TFieldNotifyEvent;
begin
  try
    e := qrMechDataPROC_ZAC.OnChange;
    qrMechDataPROC_ZAC.OnChange := nil;
    qrMechData.FieldByName('PROC_ZAC').Value := 100 - qrMechData.FieldByName('PROC_PODR').Value;
    qrMechDataPROC_ZAC.OnChange := e;
  except
    Application.MessageBox('Установлено неверное значение!' + #13#10 +
      'Значение должно находиться в диаппазоне 0-100.', 'Смета', MB_OK + MB_ICONSTOP + MB_TOPMOST);
  end;
end;

procedure TfCalcResource.qrMechDataPROC_ZACChange(Sender: TField);
var
  e: TFieldNotifyEvent;
begin
  try
    e := qrMechDataPROC_PODR.OnChange;
    qrMechDataPROC_PODR.OnChange := nil;
    qrMechData.FieldByName('PROC_PODR').Value := 100 - qrMechData.FieldByName('PROC_ZAC').Value;
    qrMechDataPROC_PODR.OnChange := e;
  except
    Application.MessageBox('Установлено неверное значение!' + #13#10 +
      'Значение должно находиться в диаппазоне 0-100.', 'Смета', MB_OK + MB_ICONSTOP + MB_TOPMOST);
  end;
end;

procedure TfCalcResource.qrMechDetailBeforePost(DataSet: TDataSet);
var
  priceQ, priceQ1: string;
begin
  if PS.CalcResourcesAutoSave or (Application.MessageBox('Сохранить изменения?', 'Смета',
    MB_YESNO + MB_ICONQUESTION + MB_TOPMOST) = IDYES) then
  begin
    with qrMechDetail do
    begin
      FastExecSQL('UPDATE mechanizmcard_temp SET PROC_PODR=:3, PROC_ZAC=:4, DELETED=:5 WHERE ID=:10',
        VarArrayOf([FieldByName('PROC_PODR').Value, FieldByName('PROC_ZAC').Value,
        FieldByName('DELETED').Value, FieldByName('ID').Value]));

      // Цена
      case cbbNDS.ItemIndex of
        // Если в режиме без НДС
        0:
          begin
            priceQ := 'FCOAST_NO_NDS=:1, FCOAST_NDS=FCOAST_NO_NDS+(FCOAST_NO_NDS*NDS/100)'#13;
            priceQ1 := 'FZP_MACH_NO_NDS=:1, FZP_MACH_NDS=FZP_MACH_NO_NDS+(FZP_MACH_NO_NDS*NDS/100)'#13;
          end;
        // С НДС
        1:
          begin
            priceQ := 'FCOAST_NDS=:1, FCOAST_NO_NDS=FCOAST_NDS-(FCOAST_NDS/(100+NDS)*NDS)'#13;
            priceQ1 := 'FZP_MACH_NDS=:1, FZP_MACH_NO_NDS=FZP_MACH_NDS-(FZP_MACH_NDS/(100+NDS)*NDS)'#13;
          end;
      end;

      if FieldByName('COAST').Value <> FieldByName('COAST').OldValue then
        FastExecSQL('UPDATE mechanizmcard_temp SET'#13 + priceQ + ' WHERE ID=:5',
          VarArrayOf([FieldByName('COAST').AsFloat, FieldByName('ID').Value]));

      if FieldByName('ZP_MASH').Value <> FieldByName('ZP_MASH').OldValue then
        FastExecSQL('UPDATE mechanizmcard_temp SET'#13 + priceQ1 + ' WHERE ID=:5',
          VarArrayOf([FieldByName('ZP_MASH').AsFloat, FieldByName('ID').Value]));
    end;
    // Вызываем переасчет всей сметы
    FormCalculationEstimate.RecalcEstimate;
    pgcChange(nil);
  end
  else
  begin
    qrMechDetail.Cancel;
    Abort;
  end;
end;

procedure TfCalcResource.PMTrPerc0Click(Sender: TObject);
var
  TrPr: Variant;
  TmpCode: AnsiString;
begin
  case (Sender as TComponent).Tag of
    0:
      TmpCode := strngfldMaterialDataCODE.Value;
    // Просто константы, что-бы получиль нужное значение из GetTranspPers
    // GetTranspPers выдаст значение в учетом региона и даты сметы
    1:
      TmpCode := 'С101-0000';
    2:
      TmpCode := 'С201-0000';
    3:
      TmpCode := 'С300-0000';
    4:
      TmpCode := 'С501-0000';
    5:
      TmpCode := 'С000-0000';
  end;

  TrPr := FastSelectSQLOne('SELECT GetTranspPers(:IdEstimate, :MatCode);',
    VarArrayOf([FormCalculationEstimate.IDEstimate, TmpCode]));
  if VarIsNull(TrPr) then
    TrPr := 0;

  qrMaterialData.Edit;
  qrMaterialData.FieldByName('PROC_TRANSP').Value := TrPr;
end;

end.





