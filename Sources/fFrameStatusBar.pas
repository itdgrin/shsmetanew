unit fFrameStatusBar;

interface

uses
  Forms, ComCtrls, Classes, Controls;

type
  TFrameStatusBar = class(TFrame)
    StatusBar: TStatusBar;

  private

  public
    procedure InsertText(const NumberPanel: Integer; const Text: String);

  end;

implementation

{$R *.dfm}
// ---------------------------------------------------------------------------------------------------------------------

procedure TFrameStatusBar.InsertText(const NumberPanel: Integer; const Text: String);
begin
  case NumberPanel of
    0:
      if Text = '' then
        StatusBar.Panels[NumberPanel].Text := ''
      else
        StatusBar.Panels[NumberPanel].Text := 'Записей: ' + Text;
    1:
      if Text = '' then
        StatusBar.Panels[NumberPanel].Text := ''
      else if Text = '-1' then
        StatusBar.Panels[NumberPanel].Text := 'Нет записей.'
      else
        StatusBar.Panels[NumberPanel].Text := 'Выделена ' + Text + ' запись.';
    2:
      if Text = '' then
        StatusBar.Panels[NumberPanel].Text := ''
      else if Text = '-1' then
        StatusBar.Panels[NumberPanel].Text := 'Быстрый поиск:'
      else
        StatusBar.Panels[NumberPanel].Text := 'Быстрый поиск: ' + Text;
  end;
end;

// ---------------------------------------------------------------------------------------------------------------------

end.
