unit DataTransfer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, ComCtrls, ExtCtrls,
  StdCtrls, Tools;

type
  TSplitter = class(ExtCtrls.TSplitter)
  public
    procedure Paint(); override;
  end;

type
  TFormDataTransfer = class(TSmForm)
    PanelBottomButtons: TPanel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    PanelLeft: TPanel;
    ImageSplitterCenter: TImage;
    PanelRight: TPanel;
    TreeView1: TTreeView;
    TreeView2: TTreeView;
    SplitterCenter: TSplitter;

    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);

    procedure RepaintImagesForSplitters();

  private
    const CaptionButton = 'Перенос данных';
    const HintButton = 'Окно переноса данных';
  public

  end;

var
  FormDataTransfer: TFormDataTransfer;

implementation

uses Main, DataModule;

{$R *.dfm}
// ---------------------------------------------------------------------------------------------------------------------

{ TSplitter }
procedure TSplitter.Paint();
begin
  // inherited;
  FormDataTransfer.RepaintImagesForSplitters();
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFormDataTransfer.FormCreate(Sender: TObject);
begin
  inherited;
  // Настройка размеров и положения формы
  ClientWidth := FormMain.ClientWidth div 2;
  ClientHeight := FormMain.ClientHeight div 2;
  Top := 20;
  Left := 20;

  WindowState := wsMaximized;

  // -----------------------------------------

  // ЗАГРУЖАЕМ ИЗОБРАЖЕНИЯ ДЛЯ СПЛИТТЕРОВ

  with DM.ImageListVerticalDots do
  begin
    GetIcon(0, ImageSplitterCenter.Picture.Icon);
  end;

  // Создаём кнопку от этого окна (на главной форме внизу)
  FormMain.CreateButtonOpenWindow(CaptionButton, HintButton, Self);
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFormDataTransfer.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFormDataTransfer.FormDestroy(Sender: TObject);
begin
  FormDataTransfer := nil;

  // Удаляем кнопку от этого окна (на главной форме внизу)
  FormMain.DeleteButtonCloseWindow(CaptionButton);
end;

// ---------------------------------------------------------------------------------------------------------------------

procedure TFormDataTransfer.RepaintImagesForSplitters();
begin
  ImageSplitterCenter.Left := SplitterCenter.Left;
  ImageSplitterCenter.Top := SplitterCenter.Top + (SplitterCenter.Height - ImageSplitterCenter.Height) div 2;
end;

// ---------------------------------------------------------------------------------------------------------------------

end.
