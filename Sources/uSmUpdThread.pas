unit uSmUpdThread;

interface

uses
  System.Classes,
  System.SysUtils,
  System.IOUtils,
  Winapi.ShellAPI,
  Winapi.Windows,
  System.Types;

type
  TSmUpdThread = class(TThread)
  private
    procedure ParsPeramStr;
  protected
    procedure Execute; override;
  end;

implementation
uses SmUpdWait, GlobsAndConst, IniFiles;

//Удаление директории с содержимым
procedure KillDir(const ADirName: string);
var
  FileFolderOperation: TSHFileOpStruct;
begin
  FillChar(FileFolderOperation, SizeOf(FileFolderOperation), 0);
  FileFolderOperation.wFunc := FO_DELETE;
  FileFolderOperation.pFrom := PChar(ExcludeTrailingPathDelimiter(ADirName) + #0);
  FileFolderOperation.fFlags := FOF_SILENT or FOF_NOERRORUI or FOF_NOCONFIRMATION;
  SHFileOperation(FileFolderOperation);
end;

function FullCopy(ASource, ATarget: string): Boolean;
var SHFileOpStruct : TSHFileOpStruct;
begin
  FillChar(SHFileOpStruct, SizeOf(TSHFileOpStruct), 0);
  SHFileOpStruct.wFunc := FO_COPY;
  SHFileOpStruct.pFrom := PChar(ExcludeTrailingPathDelimiter(ASource) + #0);
  SHFileOpStruct.pTo := PChar(ExcludeTrailingPathDelimiter(ATarget) + #0);
  SHFileOpStruct.fFlags := FOF_SILENT or FOF_NOCONFIRMATION or FOF_NOERRORUI;
  Result := SHFileOperation(SHFileOpStruct) = 0;
end;

{ TSmUpdThread }

procedure TSmUpdThread.Execute;
var i, j: integer;
    TxFile: TextFile;
    ini: TIniFile;
    TmpFiles: TStringDynArray;
begin
  Synchronize(ParsPeramStr);

  if (UpdType = 0) or (UpdPath = '') then
    Exit;

  if (UpdType = 1) and (NewAppVers = 0) then
    Exit;

  if (UpdType = 1) then
  begin
    //Проерка на всякий случай, так как папка UpdPath будет в конце удалена
    if (Pos(AnsiLowerCase(DestPath), AnsiLowerCase(UpdPath)) <> 1) or
      (Pos(AnsiLowerCase(C_UPDATEDIR), AnsiLowerCase(UpdPath)) = 0) then
      Exit;
  end;

  if (UpdType = 2) then
  begin
    //Проерка на всякий случай, так как папка UpdPath будет в конце удалена
    if (Pos(AnsiLowerCase(DestPath), AnsiLowerCase(UpdPath)) <> 1) or
      (Pos(AnsiLowerCase(C_ARHDIR), AnsiLowerCase(UpdPath)) = 0) then
      Exit;
  end;

  try
    Sleep(2000);
    TmpFiles := TDirectory.GetFiles(UpdPath, '*', TSearchOption.soAllDirectories);
    for i := Low(TmpFiles) to High(TmpFiles) do
    begin
      try
        FileName := StringReplace(TmpFiles[i], UpdPath, '', [rfReplaceAll, rfIgnoreCase]);
        ForceDirectories(ExtractFileDir(DestPath + FileName));
        j := 0;
        while not FullCopy(TmpFiles[i], DestPath + FileName) do
        begin
          if j > 3 then
            Break;
          Sleep(1000);
          inc(j)
        end;
      except
        on e: Exception do
        begin
          AssignFile(TxFile, DestPath + C_LOGDIR + C_UPDATELOG);
          try
            if FileExists(DestPath + C_LOGDIR + C_UPDATELOG) then
              Append(TxFile)
            else
              Rewrite(TxFile);

            writeln(TxFile, '[' + DateToStr(Date) + ' : SmUpd] ' +
              e.ClassName + ': ' + e.Message +
                '(' + TmpFiles[i] + ',' + DestPath + FileName + ')');
          finally
            CloseFile(TxFile);
          end;
        end;
      end;
    end;

    //Всеравно оставляет мусорную пустию папку которая удалится в след раз
    KillDir(UpdPath);

    if (UpdType = 1) then
    begin
      ini := TIniFile.Create(DestPath +  С_UPD_INI);
      try
        ini.WriteInteger('System', 'Version', NewAppVers);
      finally
        FreeAndNil(ini);
      end;
    end;
  except
    on e: Exception do
    begin
      AssignFile(TxFile, DestPath + C_LOGDIR + C_UPDATELOG);
      try
        if FileExists(DestPath + C_LOGDIR + C_UPDATELOG) then
          Append(TxFile)
        else
          Rewrite(TxFile);

        writeln(TxFile, '[' + DateToStr(Date) + ' : SmUpd)] ' +
          e.ClassName + ': ' + e.Message);
      finally
        CloseFile(TxFile);
      end;
    end;
  end;
end;

procedure TSmUpdThread.ParsPeramStr;
var i: integer;
begin
  DestPath := ExtractFilePath(ParamStr(0));
  UpdType := 0;
  UpdPath := '';
  StartApp := False;
  NewAppVers := 0;

  for i := 1 to ParamCount do
  begin
    if (ParamStr(i) = C_UPD_UPDATE) then
      UpdType := 1;

    if (ParamStr(i) = C_UPD_RESTOR) then
      UpdType := 2;

    if (Pos(C_UPD_PATH, ParamStr(i)) = 1) then
      UpdPath :=
        IncludeTrailingPathDelimiter(Copy(ParamStr(i),
          Length(C_UPD_PATH) + 2, MAX_PATH));

    if (Pos(C_UPD_VERS, ParamStr(i)) = 1) then
      NewAppVers := StrToInt(Copy(ParamStr(i),
        Length(C_UPD_VERS) + 2, 10));

    if (ParamStr(i) = C_UPD_START) then
      StartApp := True;

    if (Pos(C_UPD_APP, ParamStr(i)) = 1) then
      AppName := Copy(ParamStr(i), Length(C_UPD_APP) + 2, MAX_PATH);
  end;

  UpdPath := StringReplace(UpdPath, '"', '', [rfReplaceAll]);
  AppName := StringReplace(AppName, '"', '', [rfReplaceAll]);
end;

end.
