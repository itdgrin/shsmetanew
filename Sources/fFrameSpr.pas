unit fFrameSpr;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  System.IniFiles,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.Samples.Spin,
  Vcl.ExtCtrls,
  Vcl.Menus,
  Vcl.ComCtrls,
  Vcl.Buttons,
  JvExControls,
  JvAnimatedImage,
  JvGIFCtrl,
  Data.DB,
  Generics.Collections,
  Generics.Defaults,
  System.IOUtils,
  GlobsAndConst,
  SprController;

type
  TSortRec = TPair<Integer, Pointer>;

  TSprItemSelectEvent = procedure(ASprRecord: PSprRecord) of object;

  //Базовый класс для построения справочников
  TSprFrame = class(TFrame)
    PanelSettings: TPanel;
    PanelFind: TPanel;
    lbFindCode: TLabel;
    edtFindName: TEdit;
    btnFind: TButton;
    btnShow: TButton;
    ListSpr: TListView;
    LoadAnimator: TJvGIFAnimator;
    LoadLabel: TLabel;
    StatusBar: TStatusBar;
    edtFindCode: TEdit;
    lbFindName: TLabel;
    PanelManual: TPanel;
    rbNarmBase: TRadioButton;
    rbUserBase: TRadioButton;
    Bevel1: TBevel;
    PanelDetails: TPanel;
    SpeedButtonShowHide: TSpeedButton;
    gbDetails: TGroupBox;
    gbDetPrice: TGroupBox;
    lvDetPrice: TListView;
    lbDetCode: TLabel;
    edtDetCode: TEdit;
    lbDetEdIzm: TLabel;
    edtDetEdIzm: TEdit;
    lbDetName: TLabel;
    memDetName: TMemo;
    pmListSpr: TPopupMenu;
    PMAddManual: TMenuItem;
    PMEditManual: TMenuItem;
    PMDelManual: TMenuItem;
    tmPrice: TTimer;
    sbtFindSettings: TSpeedButton;
    pmFindSettings: TPopupMenu;
    PMStrictEqual: TMenuItem;
    PMEqualCode: TMenuItem;
    PanelPeriod: TPanel;
    lbYear: TLabel;
    edtYear: TSpinEdit;
    lbMonth: TLabel;
    cmbMonth: TComboBox;
    procedure SpeedButtonShowHideClick(Sender: TObject);
    procedure ListSprCustomDrawItem(Sender: TCustomListView; Item: TListItem;
      State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure ListSprSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure btnShowClick(Sender: TObject);
    procedure edtYearChange(Sender: TObject);
    procedure edtFindNameKeyPress(Sender: TObject; var Key: Char);
    procedure btnFindClick(Sender: TObject);
    procedure ListSprResize(Sender: TObject);
    procedure PanelDetailsResize(Sender: TObject);
    procedure rbNarmBaseClick(Sender: TObject);
    procedure FrameResize(Sender: TObject);
    procedure pmListSprPopup(Sender: TObject);
    procedure PMAddManualClick(Sender: TObject);
    procedure PMDelManualClick(Sender: TObject);
    procedure tmPriceTimer(Sender: TObject);
    procedure sbtFindSettingsClick(Sender: TObject);
    procedure lvDetPriceResize(Sender: TObject);
    procedure PMStrictEqualClick(Sender: TObject);

  private const
    FAdjecEnding2 = 'ее.яя.ая.ое.ие.ые.ой.ей.им.ым.юю.ую.ей.ой.ем.ом.их.ых.ый.ий';
    FAdjecEnding3 = 'ого.его.ему.ому.ими.ыми';
  private
    //Фаг того, что справочник загружен
    FLoaded: Boolean;
    FSprArray: TSprArray;
    FOnAfterLoad: TNotifyEvent;

    procedure WMSprLoad(var Mes: TMessage); message WM_SPRLOAD;
    procedure WMPriceLoad(var Mes: TMessage); message WM_PRICELOAD;
    procedure CopySprArray;
    procedure DetailsPanelStyle;
    procedure ClearDetailsPanel;
    procedure FillingDetailsPanel(ASprRecord: PSprRecord);

  protected
    //Тип справочника
    FSprType: Integer;
    FPriceColumn: Boolean;
    //Не показывать колонку едениц измерения
    FNoEdCol: Boolean;
    FOnSprItemSelect: TSprItemSelectEvent;
    FBaseType: Byte; //0 - оба типа, 1 - норматичная, 2 - собственная
    
    function GetSprType: Integer; virtual; abstract;
    function GetRegion: Integer; virtual;
    //Заполняет таблицу исходя из поискового запроса
    procedure FillSprList(AFindCode, AFindName: string); virtual;
    function CheckFindCode(AFindCode: string): string; virtual;
    //Особые условия при заполнении таблицы
    function SpecialFillList(const AInd: Integer): Boolean; virtual;

    //Устанавливает внешний вид формы перед началом загрузки
    procedure OnLoadStart; virtual;
    //Устанавливает внешний вид формы после загрузки
    procedure OnLoadDone; virtual;
    //Изменяет внешний вид справочника исходя из заданных параметров
    procedure SprStyle; virtual;
    //Сохранение и восстановление настроек поиска
    procedure SaveFindSettings;
    procedure LoadFindSettings;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent; const APriceColumn: Boolean;
      const AStarDate: TDateTime; ABaseType: Byte); reintroduce;
    procedure LoadSpr;
    procedure CheckCurPeriod;
    procedure ChangeDetailsPanel(AStyle: Byte);

    function FindCode(const ACode: string): PSprRecord;

    property OnSprItemSelect: TSprItemSelectEvent
      read FOnSprItemSelect write FOnSprItemSelect;
    property OnAfterLoad: TNotifyEvent read FOnAfterLoad write FOnAfterLoad;
    property SprLoaded: Boolean read FLoaded;
    property BaseType: Byte read FBaseType;
  end;

implementation

{$R *.dfm}

uses DataModule, Tools, ManualSprItem;

{ TSprFrame }

constructor TSprFrame.Create(AOwner: TComponent; const APriceColumn: Boolean;
      const AStarDate: TDateTime; ABaseType: Byte);
var y,m,d: Word;
    ev: TNotifyEvent;
    i: Integer;
begin
  if not ABaseType in [0,1,2] then
    raise Exception.Create('Неизвестный тип данных.');

  inherited Create(AOwner);

  FBaseType := ABaseType;
  FPriceColumn := APriceColumn;

  ev := rbNarmBase.OnClick;
  try
    rbNarmBase.OnClick := nil;
    rbUserBase.OnClick := nil;
    case FBaseType of
      0:
      begin
        rbNarmBase.Checked := True;
        FBaseType := 1;
      end;
      1:
      begin
        rbNarmBase.Checked := True;
        PanelManual.Visible := False;
        if not FPriceColumn then
          PanelSettings.Visible := False;
      end;
      2:
      begin
        rbUserBase.Checked := True;
        PanelManual.Visible := False;
        if not FPriceColumn then
          PanelSettings.Visible := False;
      end;
    end;
  finally
    rbNarmBase.OnClick := ev;
    rbUserBase.OnClick := ev;
  end;

  ListSpr.Align := alClient;
  LoadAnimator.Align := alClient;
  LoadLabel.Align := alClient;

  btnShow.Visible := False;

  FLoaded := False;

  cmbMonth.Items.Clear;
  for i := Low(arraymes) to High(arraymes) do
    cmbMonth.Items.Add(arraymes[i][1]);

  DecodeDate(AStarDate,y,m,d);
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

  SprStyle;
  LoadFindSettings;
  Update;
end;

procedure TSprFrame.SprStyle;
var lc: TListColumn;
    TmpFlag: Boolean;
begin  
  ListSpr.Visible := False;
  ListSpr.Columns.BeginUpdate;
  try 
    ListSpr.Columns.Clear;
    lc := ListSpr.Columns.Add;
    lc.Caption := 'Код';
    lc := ListSpr.Columns.Add;
    lc.Caption := 'Наименование';
    lc := ListSpr.Columns.Add;
    lc.Caption := 'Ед. изм.';
    lc := ListSpr.Columns.Add;
    lc.Caption := 'Цена без НДС, руб';
    lc := ListSpr.Columns.Add;
    lc.Caption := 'Цена с НДС, руб';
  
    TmpFlag := FPriceColumn and (FBaseType = 1) and (GetSprType <> CDevIndex);
    if not TmpFlag then
    begin
      ListSpr.Columns.Delete(4);
      ListSpr.Columns.Delete(3);
    end;

    if FNoEdCol then
    begin
      if TmpFlag then
      begin
        ListSpr.Columns.Delete(4);
        ListSpr.Columns.Delete(3);
      end;
      ListSpr.Columns.Delete(2);
      if TmpFlag then
      begin
        lc := ListSpr.Columns.Add;
        lc.Caption := 'Цена без НДС, руб';
        lc := ListSpr.Columns.Add;
        lc.Caption := 'Цена с НДС, руб';
      end;
    end;
  finally
    ListSpr.Columns.EndUpdate;
  end;

  lbYear.Visible := TmpFlag;
  edtYear.Visible := TmpFlag;
  lbMonth.Visible := TmpFlag;
  cmbMonth.Visible := TmpFlag;

  edtYear.Enabled := TmpFlag;
  cmbMonth.Enabled := TmpFlag;
  
  if (SpeedButtonShowHide.Tag = 1) or 
     ((FBaseType = 2) and FPriceColumn) then
    ChangeDetailsPanel(0);

  PanelSettings.Update;
end;

procedure TSprFrame.tmPriceTimer(Sender: TObject);
var TmpRec: PSprRecord;
begin
  tmPrice.Enabled := False;
  if Assigned(ListSpr.Selected) and Assigned(ListSpr.Selected.Data) then
  begin
    TmpRec := PSprRecord(ListSpr.Selected.Data);
    GetSprManualPrice(lvDetPrice, TmpRec.ID, GetSprType);
  end;
end;

function TSprFrame.GetRegion;
begin
  Result := 0;
end;

procedure TSprFrame.LoadSpr;
var FRegion: Integer;
begin
  FSprType := GetSprType;
  //(FSprType <> CDevIndex) - заглушка для справочника оборудования
  if FPriceColumn and (FBaseType = 1) and (FSprType <> CDevIndex) then
  begin
    FRegion := GetRegion;
    SprControl.SetPriceNotify(edtYear.Value, cmbMonth.ItemIndex + 1, FRegion,
      Handle, FSprType);
  end
  else
    SprControl.SetSprNotify(Handle, FSprType);

  OnLoadStart;
end;

procedure TSprFrame.lvDetPriceResize(Sender: TObject);
begin
  lvDetPrice.Columns[lvDetPrice.Columns.Count - 1].Width :=
    lvDetPrice.Width - 530 - 25;  //530 сумма колонок, если суммировать автоматом как-то глючит
end;

procedure TSprFrame.OnLoadStart;
begin
  btnShow.Enabled := False;
  edtYear.Enabled := False;
  cmbMonth.Enabled := False;
  edtFindCode.Enabled := False;
  edtFindName.Enabled := False;
  btnFind.Enabled := False;

  rbNarmBase.Enabled := False;
  rbUserBase.Enabled := False;

  ListSpr.Items.Clear;
  ListSpr.Visible := False;
  StatusBar.Panels[0].Text := '';

  LoadLabel.Visible := True;
  LoadAnimator.Visible := True;
  LoadAnimator.Animate := True;

  FLoaded := False;
end;

procedure TSprFrame.PanelDetailsResize(Sender: TObject);
begin
  memDetName.Width := PanelDetails.Width - memDetName.Left - 10;
end;

procedure TSprFrame.PMAddManualClick(Sender: TObject);
var SprCard: TManSprCardForm;
    SprID: Integer;
begin
  SprID := 0;
  if Assigned(ListSpr.Selected) then
    SprID := TSprRecord(ListSpr.Selected.Data^).ID;

  SprCard := TManSprCardForm.Create(Self, SprID, GetSprType);
  try
    if SprCard.ShowModal = mrOk then
      btnShow.Click;
  finally
    FreeAndNil(SprCard);
  end;
end;

procedure TSprFrame.PMDelManualClick(Sender: TObject);
begin
  if Assigned(ListSpr.Selected) then
  begin
    DelSprItem(TSprRecord(ListSpr.Selected.Data^).ID, GetSprType);
    btnShow.Click;
  end;
end;

procedure TSprFrame.pmListSprPopup(Sender: TObject);
begin
  PMAddManual.Enabled := (FBaseType = 2);
  PMEditManual.Enabled := Assigned(ListSpr.Selected);
  PMDelManual.Enabled := (FBaseType = 2) and Assigned(ListSpr.Selected);
end;

procedure TSprFrame.PMStrictEqualClick(Sender: TObject);
begin
  (Sender as TMenuItem).Checked := not (Sender as TMenuItem).Checked;
  SaveFindSettings;
  btnFind.Click;
end;

procedure TSprFrame.rbNarmBaseClick(Sender: TObject);
begin
  if rbNarmBase.Checked then FBaseType := 1;
  if rbUserBase.Checked then FBaseType := 2;

  SprStyle;
  
  btnFindClick(nil);
end;

procedure TSprFrame.CopySprArray;
var I: Integer;
begin
  SetLength(FSprArray, SprControl.SprCount[FSprType]);
  for I := Low(FSprArray) to High(FSprArray) do
  begin
    FSprArray[I].ID := SprControl.SprList[FSprType][I].ID;
    FSprArray[I].Code := SprControl.SprList[FSprType][I].Code;
    FSprArray[I].Name := SprControl.SprList[FSprType][I].Name;
    FSprArray[I].Unt := SprControl.SprList[FSprType][I].Unt;
    FSprArray[I].CoastNDS := SprControl.SprList[FSprType][I].CoastNDS;
    FSprArray[I].CoastNoNDS := SprControl.SprList[FSprType][I].CoastNoNDS;
    FSprArray[I].ZpMach := SprControl.SprList[FSprType][I].ZpMach;
    FSprArray[I].TrZatr := SprControl.SprList[FSprType][I].TrZatr;
    FSprArray[I].Manual := SprControl.SprList[FSprType][I].Manual;
  end;
end;

procedure TSprFrame.WMSprLoad(var Mes: TMessage);
begin
  try
    //FSprArray := SprControl.SprList[FSprType];
    CopySprArray;
    FillSprList(edtFindCode.Text, edtFindName.Text);
  finally
    OnLoadDone;
  end;
end;

procedure TSprFrame.WMPriceLoad(var Mes: TMessage);
begin
  try
    //FSprArray := SprControl.SprList[FSprType];
    CopySprArray;
    FillSprList(edtFindCode.Text, edtFindName.Text);
  finally
    OnLoadDone;
  end;
end;

procedure TSprFrame.OnLoadDone;
begin
  if FPriceColumn and (FBaseType = 1) and (GetSprType <> CDevIndex) then
  begin
    edtYear.Enabled := True;
    cmbMonth.Enabled := True;
  end;

  edtFindCode.Enabled := True;
  edtFindName.Enabled := True;
  btnFind.Enabled := True;
  ListSpr.Visible := True;

  rbNarmBase.Enabled := True;
  rbUserBase.Enabled := True;

  LoadLabel.Visible := False;
  LoadAnimator.Visible := False;
  LoadAnimator.Animate := False;

  FLoaded := True;

  if Assigned(FOnAfterLoad) then
    FOnAfterLoad(Self);
end;

function TSprFrame.FindCode(const ACode: string): PSprRecord;
var i: Integer;
begin
  Result := nil;
  for i := Low(FSprArray) to High(FSprArray) do
    if SameText(ACode, FSprArray[i].Code) and not FSprArray[i].Manual then
    begin
      Result := @FSprArray[i];
      Exit;
    end;
end;

procedure TSprFrame.FrameResize(Sender: TObject);
begin
  if SpeedButtonShowHide.Tag = 1 then
    ChangeDetailsPanel(0);
end;

procedure TSprFrame.btnFindClick(Sender: TObject);
begin
  FillSprList(edtFindCode.Text, edtFindName.Text);
end;

procedure TSprFrame.btnShowClick(Sender: TObject);
begin
  LoadSpr;
end;

function TSprFrame.CheckFindCode(AFindCode: string): string;
begin
  Result := AFindCode;
end;

function CompareRel(const Left, Right: TSortRec): Integer;
begin
  Result := Right.Key - Left.Key;
  if Result = 0 then
    Result := CompareText(TSprRecord(Left.Value^).Code,
      TSprRecord(Right.Value^).Code);
end;

 //заполняет справочник
procedure TSprFrame.FillSprList(AFindCode, AFindName: string);
var i, j, n,
    TmpInd,
    TmpRel1,
    TmpRel2,
    SummRel1,
    TmpCount: Integer;
    TmpCode: string;
    Item: TListItem;
    WordList: TStringList;
    TmpStr: string;
    LastSpase : Boolean;
    FSortArray: TArray<TSortRec>;
begin
  if Length(FSprArray) = 0 then
    Exit;

  WordList := TStringList.Create;
  try
    AFindCode := CheckFindCode(Trim(AFindCode.ToLower));
    AFindName := Trim(AFindName.ToLower);

    //разбивка поисковой строки на слова (не самым быстрым пособом)
    if (Length(AFindName) > 0) then
    begin
       TmpStr := '';
       LastSpase := False;
       for i := Low(AFindName) to High(AFindName) do
       begin
          if (AFindName[i] = ' ') then
          begin
            if LastSpase then
              Continue
            else
              LastSpase := True;
          end
          else
            LastSpase := False;

          TmpStr := TmpStr + AFindName[i];
       end;
       TmpStr := StringReplace(TmpStr, ' ', sLineBreak,[rfReplaceAll]);
       WordList.Text := TmpStr;
    end;
    //добавляет доп слова с обрубленными окончаниями
    if WordList.Count > 0 then
    begin
      for i := 0 to WordList.Count - 1 do
      begin
        if WordList[i].Length < 7 then
          Continue;
        TmpStr := Copy(WordList[i], WordList[i].Length - 1, 2);
        if pos(TmpStr, FAdjecEnding2) > 0 then
          WordList.Add(Copy(WordList[i], 1, WordList[i].Length - 2))
        else
        begin
          TmpStr := Copy(WordList[i], WordList[i].Length - 2, 3);
          if pos(TmpStr, FAdjecEnding3) > 0 then
            WordList.Add(Copy(WordList[i], 1, WordList[i].Length - 3))
        end;
      end;
    end;

    if PMStrictEqual.Checked then
      n := 5
    else
      n := 3;

    //Видимый список обновляется намного дольше
    ListSpr.Visible :=  False;
    ListSpr.Items.Clear;
    SetLength(FSortArray, Length(FSprArray));
    TmpCount := -1;
    SummRel1 := 0;
    for i := Low(FSprArray) to High(FSprArray) do
    begin
      if (FBaseType = 1) and (FSprArray[i].Manual) then Continue;
      if (FBaseType = 2) and (not FSprArray[i].Manual) then Continue;

      if SpecialFillList(i) then
        Continue;

      TmpRel1 := 0;
      TmpRel2 := 0;

      if (AFindCode <> '') then
      begin
        if (CompareText(AFindCode, FSprArray[i].Code.ToLower) = 0) then
          TmpRel1 := 20
        else if Pos(AFindCode, FSprArray[i].Code.ToLower) = 1 then
          TmpRel1 := 15
        else
        begin
          if not PMEqualCode.Checked then
          begin
            TmpCode := copy(AFindCode, 1, Length(AFindCode) - 1);
            if ((Length(TmpCode) > 0) and
                (Pos(TmpCode, FSprArray[i].Code.ToLower) = 1)) then
              TmpRel1 := 5
            else
              if (Pos(AFindCode, FSprArray[i].Code.ToLower) <> 0) then
                TmpRel1 := 3;
          end;
        end;

        SummRel1 := SummRel1 + TmpRel1;

        if TmpRel1 = 0 then
          Continue;
      end;

      TmpStr := Trim(FSprArray[i].Name.ToLower);

      for j := 0 to WordList.Count - 1 do
      begin
        TmpInd := Pos(WordList[j], TmpStr);
        if TmpInd = 0 then
        begin
          Continue;
        end;

        if CompareText(WordList[j], TmpStr) = 0 then
          TmpRel2 := TmpRel2 + n
        else if (TmpInd = 1) or
                (TmpStr[TmpInd - 1] = ' ') or
                (Length(TmpStr) = (TmpInd + Length(WordList[j]) - 1)) or
                (TmpStr[TmpInd + Length(WordList[j])] = ' ') then
          TmpRel2 := TmpRel2 + 3
        else TmpRel2 := TmpRel2 + 1;
      end;

      if (TmpRel2 = 0) and (WordList.Count > 0) then
        Continue;

      if (i mod 1000) = 0 then
          Application.ProcessMessages;

      inc(TmpCount);

      FSortArray[TmpCount].Key := TmpRel1 + TmpRel2;
      FSortArray[TmpCount].Value := @FSprArray[i];
    end;

    SetLength(FSortArray, TmpCount + 1);

    TArray.Sort<TSortRec>(FSortArray,
      TComparer<TSortRec>.Construct(CompareRel));

    ListSpr.Items.BeginUpdate;
    try
      for i := 0 to Length(FSortArray) - 1 do
      begin
        //Создаем пустые итемы, заполним их при отображении
        Item := ListSpr.Items.Add;
        Item.Data := FSortArray[i].Value;
      end;
    finally
      ListSpr.Items.EndUpdate;
    end;

    ListSpr.Visible :=  True;
    if (ListSpr.Items.Count > 0) then
      ListSpr.ItemIndex := 0
    else
    begin
      if (AFindCode <> '') then
      begin
        if (SummRel1 = 0) then
          StatusBar.Panels[0].Text := '''' + AFindCode + ''' не существует'
        else
          StatusBar.Panels[0].Text :=
            'По ''' + AFindCode + ''' + ''' + AFindName + ''' ничего не найдено';
      end
      else
        StatusBar.Panels[0].Text := '   0/0';
      ClearDetailsPanel;
    end;
  finally
    WordList.Free;
  end;
end;

function TSprFrame.SpecialFillList(const AInd: Integer): Boolean;
begin
  Result := False;
end;

procedure TSprFrame.edtFindNameKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    btnFindClick(nil);
    Key := #0;
  end;
end;

procedure TSprFrame.edtYearChange(Sender: TObject);
begin
  if edtYear.Value < 2012 then //что-бы не лазили дальше 2012 года
  begin
    edtYear.Value := 2012;
    Exit;
  end;

  btnShow.Enabled := True;
  ListSpr.Visible := False;

  G_CURYEAR := edtYear.Value;
  G_CURMONTH := cmbMonth.ItemIndex;

  btnShow.Click;
end;

procedure TSprFrame.CheckCurPeriod;
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

procedure TSprFrame.ListSprCustomDrawItem(Sender: TCustomListView;
  Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  //лист справочника заполняется при отрисовки, для ускорения работы
  if Assigned(Item) and
    (Item.Caption.IsEmpty) and
    Assigned(Item.Data) then
  begin
    Item.Caption := TSprRecord(Item.Data^).Code;
    Item.SubItems.Add(TSprRecord(Item.Data^).Name);

    if not FNoEdCol then
      Item.SubItems.Add(TSprRecord(Item.Data^).Unt);

    if FPriceColumn and (FBaseType = 1) and (GetSprType <> CDevIndex) then
    begin
      if TSprRecord(Item.Data^).CoastNoNDS > 0 then
        Item.SubItems.Add(FloatToStr(TSprRecord(Item.Data^).CoastNoNDS))
      else
        Item.SubItems.Add('');

      if TSprRecord(Item.Data^).CoastNDS > 0 then
        Item.SubItems.Add(FloatToStr(TSprRecord(Item.Data^).CoastNDS))
      else
        Item.SubItems.Add('');
    end;
  end;
  DefaultDraw := True;
end;

procedure TSprFrame.ListSprResize(Sender: TObject);
var i, j: Integer;
begin
  j := ListSpr.Width;

  ListSpr.Columns[0].Width := 100;

  if FNoEdCol then
    i := 2
  else
  begin
    ListSpr.Columns[2].Width := 60;
    i := 3;
  end;

  if FPriceColumn and (FBaseType = 1) and (GetSprType <> CDevIndex) then
  begin
    ListSpr.Columns[i].Width := 110;
    ListSpr.Columns[i + 1].Width := 100;
  end;
  for i := 0 to ListSpr.Columns.Count - 1 do
    if i <> 1 then
      j := j - ListSpr.Columns[i].Width;
  ListSpr.Columns[1].Width := j - 25;
end;

procedure TSprFrame.ListSprSelectItem(Sender: TObject; Item: TListItem;
  Selected: Boolean);
begin
  if Assigned(Item) then
  begin
    if Assigned(FOnSprItemSelect) then
      FOnSprItemSelect(Item.Data);

    if Assigned(Item.Data) then
    begin
      FillingDetailsPanel(Item.Data);
      StatusBar.Panels[0].Text := '   ' +
        (Item.Index + 1).ToString + '/' + ListSpr.Items.Count.ToString;
      lvDetPrice.Items.Clear;
    end;
  end;
end;

procedure TSprFrame.ChangeDetailsPanel(AStyle: Byte);
begin
  SpeedButtonShowHide.Glyph.Assign(nil);
  if AStyle = 1 then
  begin
    SpeedButtonShowHide.Tag := 0;
    PanelDetails.Height := SpeedButtonShowHide.Height + 3;
    DM.ImageListArrowsTop.GetBitmap(0, SpeedButtonShowHide.Glyph);
    SpeedButtonShowHide.Hint := 'Развернуть панель';
    StatusBar.Top := Width;
    StatusBar.Align := alBottom;
  end
  else
  begin
    SpeedButtonShowHide.Tag := 1;
    DetailsPanelStyle;
    SpeedButtonShowHide.Hint := 'Свернуть панель';
    DM.ImageListArrowsBottom.GetBitmap(0, SpeedButtonShowHide.Glyph);
    StatusBar.Top := Width;
    StatusBar.Align := alBottom;
  end;
end;

procedure TSprFrame.sbtFindSettingsClick(Sender: TObject);
var Point: TPoint;
begin
  Point.X := sbtFindSettings.Left;
  Point.Y := sbtFindSettings.Top + sbtFindSettings.Height + 1;
  pmFindSettings.Popup(PanelFind.ClientToScreen(Point).X,
    PanelFind.ClientToScreen(Point).Y);
end;

procedure TSprFrame.SpeedButtonShowHideClick(Sender: TObject);
begin
  ChangeDetailsPanel(SpeedButtonShowHide.Tag);
end;

procedure TSprFrame.DetailsPanelStyle;
begin
  if (FBaseType = 1) or not FPriceColumn then
  begin
    lbDetCode.Visible := True;
    lbDetEdIzm.Visible := True;
    lbDetName.Visible := True;
    edtDetCode.Visible := True;
    edtDetEdIzm.Visible := True;
    memDetName.Visible := True;
    gbDetPrice.Visible := False;
    PanelDetails.Height := 96;
  end;

  if (FBaseType = 2) and FPriceColumn then
  begin
    if (Self.Height - PanelSettings.Height -
        PanelFind.Height - StatusBar.Height) < 340  then
    begin
      lbDetCode.Visible := False;
      lbDetEdIzm.Visible := False;
      lbDetName.Visible := False;
      edtDetCode.Visible := False;
      edtDetEdIzm.Visible := False;
      memDetName.Visible := False;
      gbDetPrice.Top := 10;
      gbDetPrice.Visible := True;
      PanelDetails.Height := 110;
    end
    else
    begin
      lbDetCode.Visible := True;
      lbDetEdIzm.Visible := True;
      lbDetName.Visible := True;
      edtDetCode.Visible := True;
      edtDetEdIzm.Visible := True;
      memDetName.Visible := True;
      gbDetPrice.Top := 71;
      gbDetPrice.Visible := True;
      PanelDetails.Height := 180;
    end;
  end;
end;

procedure TSprFrame.ClearDetailsPanel;
begin
  edtDetCode.Text := '';
  edtDetEdIzm.Text := '';
  memDetName.Lines.Text := '';
  lvDetPrice.Items.Clear;
end;

procedure TSprFrame.FillingDetailsPanel(ASprRecord: PSprRecord);
begin
  ClearDetailsPanel;

  if Assigned(ASprRecord) then
  begin
    edtDetCode.Text := ASprRecord.Code;
    edtDetEdIzm.Text := ASprRecord.Unt;
    memDetName.Lines.Text := ASprRecord.Name;
    if (FBaseType = 2) and FPriceColumn then
    begin
      tmPrice.Enabled := False;
      tmPrice.Enabled := True;
    end;
  end;
end;

procedure TSprFrame.SaveFindSettings;
var IniFile: TIniFile;
    MainDataType: Byte;
begin
  case GetSprType of
    0, 1: MainDataType := 2;
    2: MainDataType := 3;
    3: MainDataType := 4;
    else MainDataType := 0;
  end;

  IniFile := TIniFile.Create(ChangeFileExt(Application.ExeName, '.ini'));
  try
    IniFile.WriteBool('FindSettings' + MainDataType.ToString, 'StrictEqual',
      PMStrictEqual.Checked);
    IniFile.WriteBool('FindSettings' + MainDataType.ToString, 'EqualCode',
      PMEqualCode.Checked);
  finally
    FreeAndNil(IniFile);
  end;
end;

procedure TSprFrame.LoadFindSettings;
var IniFile: TIniFile;
    MainDataType: Byte;
begin
  case GetSprType of
    0, 1: MainDataType := 2;
    2: MainDataType := 3;
    3: MainDataType := 4;
    else MainDataType := 0;
  end;

  IniFile := TIniFile.Create(ChangeFileExt(Application.ExeName, '.ini'));
  try
    if not IniFile.SectionExists('FindSettings' + MainDataType.ToString) then
    begin
      IniFile.WriteBool('FindSettings' + MainDataType.ToString, 'StrictEqual',
        PMStrictEqual.Checked);
      IniFile.WriteBool('FindSettings' + MainDataType.ToString, 'EqualCode',
        PMEqualCode.Checked);
    end
    else
    begin
      PMStrictEqual.Checked :=
        IniFile.ReadBool('FindSettings' + MainDataType.ToString, 'StrictEqual', False);
      PMEqualCode.Checked :=
        IniFile.ReadBool('FindSettings' + MainDataType.ToString, 'EqualCode', True);
    end;
  finally
    FreeAndNil(IniFile);
  end;
end;

end.
