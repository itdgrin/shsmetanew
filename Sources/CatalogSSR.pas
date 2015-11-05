unit CatalogSSR;

interface

uses
  Forms, Classes, Controls, ExtCtrls, fFrameSSR, Tools;

type
  TFormCatalogSSR = class(TSmForm)

    Timer: TTimer;

    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure HideAllFrames;
    procedure TimerTimer(Sender: TObject);
  private
    const ButtonCaption = 'Справочники ССР';
    const ButtonHint = 'Окно справочников ССР';
  private
    FrameSSR: TFrameSSR;
    InitialFrames: Integer;

  public

  end;

var
  FormCatalogSSR: TFormCatalogSSR;

implementation

uses Main;

{$R *.dfm}

procedure TFormCatalogSSR.FormCreate(Sender: TObject);
begin
  // Настройка размеров и положения формы
  ClientWidth := FormMain.ClientWidth div 2;
  ClientHeight := FormMain.ClientHeight div 2;
  Top := 20;
  Left := 20;

  WindowState := wsMaximized;

  // -----------------------------------------

  FrameSSR := TFrameSSR.Create(FormCatalogSSR);

  InitialFrames := 1;

  HideAllFrames;

  // Создаём кнопку от этого окна (на главной форме внизу)
  FormMain.CreateButtonOpenWindow(ButtonCaption, ButtonHint, Self);
  inherited;
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFormCatalogSSR.FormActivate(Sender: TObject);
begin
  // Если нажата клавиша Ctrl и выбираем форму, то делаем
  // каскадирование с переносом этой формы на передний план
  FormMain.CascadeForActiveWindow;

  // Делаем нажатой кнопку активной формы (на главной форме внизу)
  FormMain.SelectButtonActiveWindow(ButtonCaption);

  if Timer.Tag = 0 then
    Timer.Enabled := True;
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFormCatalogSSR.FormPaint(Sender: TObject);
begin
  if InitialFrames = 1 then
  begin
    FrameSSR.Parent := FormCatalogSSR;
    FrameSSR.Visible := False;

    InitialFrames := 0;
  end;
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFormCatalogSSR.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFormCatalogSSR.FormDestroy(Sender: TObject);
begin
  FormCatalogSSR := nil;

  // Удаляем кнопку от этого окна (на главной форме внизу)
  FormMain.DeleteButtonCloseWindow(ButtonCaption);
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFormCatalogSSR.HideAllFrames;
begin
  with FrameSSR do
  begin
    Visible := False;
    Align := alnone;
  end;
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFormCatalogSSR.TimerTimer(Sender: TObject);
begin
  if Timer.Tag = 10 then
  begin
    Timer.Enabled := False;

    with FrameSSR do
    begin
      Align := alClient;
      ReceivingAll;
      Visible := True;
      SetFocus;
    end;
  end
  else
    Timer.Tag := Timer.Tag + 1;
end;

// ---------------------------------------------------------------------------------------------------------------------

end.
