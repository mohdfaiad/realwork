unit callMSSRunner;

// ������: "w:\common\components\callMSS\callMSSRunner.pas"
// ���������: "SimpleClass"

{$Include callMSS.inc}

interface

uses
 l3IntfUses
;

type
 TcallMSSRunner = class
  public
   class procedure Run;
 end;//TcallMSSRunner

implementation

uses
 l3ImplUses
 {$If NOT Defined(NoScripts)}
 , kwMain
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , tfwDefaultScriptCaller
 {$IfEnd} // NOT Defined(NoScripts)
 , l3String
 {$If NOT Defined(NoScripts)}
 , tfwConsoleScriptCaller
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , tfwScriptEngine
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , tfwScriptEngineEX
 {$IfEnd} // NOT Defined(NoScripts)
 , SysUtils
 , l3FileUtils
 , l3Base
 , Windows
 , StrUtils
 , l3StringList
 {$If NOT Defined(NoScripts)}
 , tfwOutToFileScriptCaller
 {$IfEnd} // NOT Defined(NoScripts)
;

class procedure TcallMSSRunner.Run;
//#UC START# *55C483850136_55C482EC023E_var*

 procedure RunScript(const aFileName: AnsiString);
 begin//RunScript
  try
   TtfwScriptEngine.ScriptFromFile(aFileName, TtfwConsoleScriptCaller.Make);
  except
   on E: Exception do
    System.WriteLn(E.Message);
  end;//try..except
 end;//RunScript

 procedure RunScriptWithOutput(const aFileName: AnsiString);
 var
  l_OutName : AnsiString;
 begin//RunScriptWithOutput
  try
   CloseFile(Output);
  except
  end;//try..except
  l_OutName := aFileName + '.out';
  AssignFile(Output, l_OutName);
  Rewrite(Output);
  try
   RunScript(aFileName);
  finally
   try
    CloseFile(Output);
   except
   end;//try..except 
  end;//try..finally
  if (l3FileUtils.GetFileSize(l_OutName) = 0) then
   SysUtils.DeleteFile(l_OutName);
 end;//RunScriptWithOutput

 procedure RunScriptsListPrim(const aFileName: AnsiString);
 var
  l_F : Text;
  l_S : AnsiString;
  l_Now : Cardinal;
  l_L : Tl3StringList;
  l_Index : Integer;
 begin
  AssignFile(l_F, aFileName);
  Reset(l_F);
  try
   l_L := Tl3StringList.Create;
   try
    l_L.Sorted := true;
    l_Now := GetTickCount;
    l3System.Msg2Log('start ' + aFileName);
    try
     while not EOF(l_F) do
     begin
      ReadLn(l_F, l_S);
      if not l_L.FindData(l_S, l_Index) then
      begin
       l_L.Add(l_S);
       RunScriptWithOutput(l_S);
      end;//not l_L.FindData(l_S, l_Index)
     end;//while not EOF(l_F)
    finally
     l3System.Msg2Log('finish ' + aFileName + ' ' + IntToStr((GetTickCount - l_Now) div 1000) );
    end;//try..finally
   finally
    FreeAndNil(l_L);
   end;//try..finally
  finally
   CloseFile(l_F);
  end;//try..finally
 end;

 const
  cList = '-list:';

 procedure RunScriptsList(const aFileName: AnsiString);
 var
  l_N : AnsiString;
 begin
  l_N := aFileName;
  Delete(l_N, 1, Length(cList));
  RunScriptsListPrim(l_N);
 end;

 procedure RunScriptsByMask(const aFileName: AnsiString);
 var
  l_SearchRec  : TSearchRec;
  l_FindResult : Integer;
  l_DirName : AnsiString;
  l_FileName : AnsiString;
  l_Now : Cardinal;
 begin
  l_DirName := ExtractFilePath(aFileName);
  if (l_DirName = '') then
   l_DirName := SysUtils.GetCurrentDir;
  l_FileName := ExtractFileName(aFileName);
  l_FindResult := FindFirst(ConcatDirName(l_DirName, l_FileName),
                            faAnyFile,
                            l_SearchRec);
  try
   l_Now := GetTickCount;
   l3System.Msg2Log('start ' + aFileName);
   try
    while (l_FindResult = 0) do
    begin
     if ((l_SearchRec.Attr and (faDirectory or faVolumeID or faSymLink)) = 0) then
      RunScriptWithOutput(ConcatDirName(l_DirName, l_SearchRec.Name));
     l_FindResult := FindNext(l_SearchRec);
    end; // while l_FindResult = 0 do
   finally
    l3System.Msg2Log('finish ' + aFileName + ' ' + IntToStr((GetTickCount - l_Now) div 1000) );
   end;//try..finally
  finally
   SysUtils.FindClose(l_SearchRec);
  end;//try..finally
 end;

 procedure RunScripts(const aFileName: AnsiString);
 begin//RunScripts
  if AnsiStartsStr('-list:', aFilename) then
   RunScriptsList(aFilename)
  else
  if (Pos('*', aFileName) <= 0) then
   RunScript(aFileName)
  else
   RunScriptsByMask(aFileName);
 end;//RunScripts

//#UC END# *55C483850136_55C482EC023E_var*
begin
//#UC START# *55C483850136_55C482EC023E_impl*
 RunScripts(ParamStr(1));
//#UC END# *55C483850136_55C482EC023E_impl*
end;//TcallMSSRunner.Run

end.
