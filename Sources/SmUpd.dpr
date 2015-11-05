program SmUpd;

{$SETPEFlAGS $0001}

uses
  System.SysUtils,
  Winapi.Windows,
  Winapi.ShellAPI,
  VCL.Forms,
  GlobsAndConst in 'GlobsAndConst.pas',
  SmUpdWait in 'SmUpdWait.pas' {fWait},
  uSmUpdThread in 'uSmUpdThread.pas';

begin
    MHandle := OpenMutex(MUTEX_ALL_ACCESS, False, '5q7b3g1p0b5n3x6v9e6s');
    if MHandle <> 0 then
      if WaitForSingleObject(MHandle, 20000) = WAIT_TIMEOUT then
      begin
        CloseHandle(MHandle);
        Exit;
      end;

    try
      Application.Initialize;
      Application.MainFormOnTaskbar := True;
      Application.Title := 'SMR - HPP 2012';
      Application.CreateForm(TfWait, fWait);
      Application.Run;
    finally
      ReleaseMutex(MHandle);
      CloseHandle(MHandle);
      if StartApp then
        ShellExecute(0,'open', PChar(DestPath + AppName),
          nil, nil ,SW_SHOWNORMAL);
    end;
end.


