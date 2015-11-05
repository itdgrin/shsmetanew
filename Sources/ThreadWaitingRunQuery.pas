unit ThreadWaitingRunQuery;

interface

uses
  Classes {$IFDEF MSWINDOWS} , Windows {$ENDIF}, SysUtils;

type
  WaitingRunQuery = class(TThread)
  private
    i: Integer;
  protected
    procedure Execute; override;
    procedure Repaint;
  end;

implementation

uses Waiting, Main;

{
  Important: Methods and properties of objects in visual components can only be
  used in a method called using Synchronize, for example,

  Synchronize(UpdateCaption);

  and UpdateCaption could look like,

  procedure WaitingRunQuery.UpdateCaption;
  begin
  Form1.Caption := 'Updated in a thread';
  end;

  or

  Synchronize(
  procedure
  begin
  Form1.Caption := 'Updated in thread via an anonymous method'
  end
  )
  );

  where an anonymous method is passed.

  Similarly, the developer can call the Queue method with similar parameters as
  above, instead passing another TThread class as the first parameter, putting
  the calling thread in a queue with the other thread.

}

{ WaitingRunQuery }

procedure WaitingRunQuery.Execute;
begin
  i := 0;
  while not Terminated do
  begin
    // sleep(55);
    Inc(i);
    Synchronize(Repaint);
  end;
end;

procedure WaitingRunQuery.Repaint;
begin
  // FormWaiting.Image.Repaint;
  // FormWaiting.Repaint;
  FormMain.Caption := IntToStr(i);
end;

end.
