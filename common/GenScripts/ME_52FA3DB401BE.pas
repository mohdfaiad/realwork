unit alcuTaskList;

// ������: "w:\archi\source\projects\PipeInAuto\Tasks\alcuTaskList.pas"
// ���������: "SimpleClass"

{$Include alcuDefine.inc}

interface

{$If Defined(ServerTasks) AND Defined(AppServerSide)}
uses
 l3IntfUses
 , alcuSortedTaskList
 , k2DocumentGenerator
 {$If NOT Defined(Nemesis)}
 , csProcessTask
 {$IfEnd} // NOT Defined(Nemesis)
 , evdNativeWriter
 {$If NOT Defined(Nemesis)}
 , csTaskTypes
 {$IfEnd} // NOT Defined(Nemesis)
;

type
 TalcuTaskList = class(TalcuSortedTaskList)
  private
   f_TaskFolder: AnsiString;
   f_FileName: AnsiString;
    {* ���� ��� �������� FileName }
  private
   function DoFinishAtom(G: Tk2DocumentGenerator;
    var Atom: Tk2StackAtom): Boolean;
   procedure SaveTask(theTask: TddProcessTask);
  protected
   procedure pm_SetFileName(const aValue: AnsiString);
   function TaskFileName(const theTaskID: AnsiString): AnsiString;
  public
   procedure AddTask(aTask: TddProcessTask);
   procedure Load;
   procedure RemoveTask(aTask: TddProcessTask);
   procedure Save;
   procedure ActiveTaskCount;
   function FindTask(aTaskType: TcsTaskType): TddProcessTask;
   procedure Sort;
  public
   property FileName: AnsiString
    read f_FileName
    write pm_SetFileName;
 end;//TalcuTaskList
{$IfEnd} // Defined(ServerTasks) AND Defined(AppServerSide)

implementation

{$If Defined(ServerTasks) AND Defined(AppServerSide)}
uses
 l3ImplUses
 , l3FileUtils
 , Task_Const
 , k2Tags
 , evdNativeReader
 , l3Filer
 , l3Types
 , Classes
 , l3Base
 {$If NOT Defined(Nemesis)}
 , ddServerTask
 {$IfEnd} // NOT Defined(Nemesis)
 , SysUtils
 , DateUtils
 , alcuTaskListBase
 , l3Stream
;

type
 TalcuTaskGenerator = class(Tk2DocumentGenerator)
 end;//TalcuTaskGenerator

procedure TalcuTaskList.pm_SetFileName(const aValue: AnsiString);
//#UC START# *53A1803801A2_52FA3DB401BEset_var*
//#UC END# *53A1803801A2_52FA3DB401BEset_var*
begin
//#UC START# *53A1803801A2_52FA3DB401BEset_impl*
 f_FileName := aValue;
 f_TaskFolder:= ExtractDirName(f_FileName);
//#UC END# *53A1803801A2_52FA3DB401BEset_impl*
end;//TalcuTaskList.pm_SetFileName

function TalcuTaskList.DoFinishAtom(G: Tk2DocumentGenerator;
 var Atom: Tk2StackAtom): Boolean;
//#UC START# *53A180B502CB_52FA3DB401BE_var*
var  
 l_TaskMade : TddTaskItem;
 l_Task : TddProcessTask;
//#UC END# *53A180B502CB_52FA3DB401BE_var*
begin
//#UC START# *53A180B502CB_52FA3DB401BE_impl*
 Result := true;
 if Atom.Box.IsKindOf(k2_typTask) then
 begin
  l_TaskMade := nil;
  try
   l_TaskMade := TddTaskItem.MakeFromTaggedData(Atom.Box, f_TaskFolder, False, true);
   if not (l_TaskMade Is TddProcessTask) then
   begin
    FreeAndNil(l_TaskMade);
    l3System.Msg2Log('�� ������� ��������� ������ �� EVD ���������. ������ ���������������');
   end;//not l_TaskMade Is TddProcessTask
   l_Task := l_TaskMade As TddProcessTask;
   if (l_Task <> nil) then
   begin
    l_Task.CorrectStatus;        
    Self.Add(l_Task);
   end;//l_Task <> nil
  finally
   FreeAndNil(l_TaskMade);
  end;//try..finally
 end;//Atom.Box.IsKindOf(k2_typTask)
//#UC END# *53A180B502CB_52FA3DB401BE_impl*
end;//TalcuTaskList.DoFinishAtom

procedure TalcuTaskList.AddTask(aTask: TddProcessTask);
//#UC START# *53A180E50119_52FA3DB401BE_var*
//#UC END# *53A180E50119_52FA3DB401BE_var*
begin
//#UC START# *53A180E50119_52FA3DB401BE_impl*
 Lock;
 try
  Self.Add(aTask);
  Save;
 finally
  Unlock;
 end;//try..finally
//#UC END# *53A180E50119_52FA3DB401BE_impl*
end;//TalcuTaskList.AddTask

procedure TalcuTaskList.Load;
//#UC START# *53A181000062_52FA3DB401BE_var*
var
  l_Reader : TevdNativeReader;
  l_Filer  : Tl3DOSFiler;
  l_FileName : String;
  l_Gen : TalcuTaskGenerator;
  l_OldDuplicates: Tl3Duplicates;

//#UC END# *53A181000062_52FA3DB401BE_var*
begin
//#UC START# *53A181000062_52FA3DB401BE_impl*
 LockNotification;
 try
  Changing;
  try
   Lock;
   try
    l_OldDuplicates := Items.Duplicates;
    Items.Duplicates := l3_dupIgnore;
    try
     l_FileName := FileName + '.evd';
     if FileExists(l_FileName) then
     begin
      l_Reader := TevdNativeReader.Create;
      try
       l_Filer := Tl3DOSFiler.Make(l_FileName, l3_fmRead, false);
       try
        l_Filer.Open;
        try
         l_Reader.Filer := l_Filer;
         l_Gen := TalcuTaskGenerator.Create;
         try
          l_Gen.OnFinishAtom := DoFinishAtom;
          l_Reader.Generator := l_Gen;
         finally
          FreeAndNil(l_Gen);
         end;//try..finally
         try
          l_Reader.Execute;
         except
          on EParserError do
          // - ����� ������ ������ ������� ��� ������ �����
           ;
         end;//try..except
        finally
         l_Filer.Close;
        end;//try..finally
       finally
        FreeAndNil(l_Filer);
       end;//try..finally
      finally
       FreeAndNil(l_Reader);
      end;//try..finally
     end;//FileExists(l_FileName)
    finally
     Items.Duplicates := l_OldDuplicates;
    end;
   finally
    Unlock;
   end;//try..finally
  finally
   Changed;
  end;
 finally
  UnlockNotification;
 end;
//#UC END# *53A181000062_52FA3DB401BE_impl*
end;//TalcuTaskList.Load

procedure TalcuTaskList.RemoveTask(aTask: TddProcessTask);
//#UC START# *53A18113014B_52FA3DB401BE_var*
//#UC END# *53A18113014B_52FA3DB401BE_var*
begin
//#UC START# *53A18113014B_52FA3DB401BE_impl*
 Lock;
 try
  Remove(aTask);
  Save;
 finally
  Unlock;
 end;//try..finally
//#UC END# *53A18113014B_52FA3DB401BE_impl*
end;//TalcuTaskList.RemoveTask

procedure TalcuTaskList.Save;
//#UC START# *53A049ED0084_52FA3DB401BE_var*
var
 l_FileName : String;
 l_Filer  : Tl3DOSFiler;
//#UC END# *53A049ED0084_52FA3DB401BE_var*
begin
//#UC START# *53A049ED0084_52FA3DB401BE_impl*
 Lock;
 try
(*  if (Count <= 0) then
   Exit;*)
  l_FileName := ConcatDirName(f_TaskFolder, 'UserTasks.dat');
  l_Writer := TevdNativeWriter.Create;
  try
   l_Writer.Binary := false;
   l_Writer.NeedOutHeader := false;
   l_Filer := Tl3DOSFiler.Make(l_FileName + '.evd', l3_fmExclusiveWrite{l3_fmWrite}, false);
   try
    l_Filer.Open;
    try
     l_Writer.Filer := l_Filer;
     l_Writer.Start;
     try
      DoSave;
     finally
      l_Writer.Finish;
     end;//try..finally
    finally
     l_Filer.Close;
    end;//try..finally
   finally
    FreeAndNil(l_Filer);
   end;//try..finally
  finally
   FreeAndNil(l_Writer);
  end;//try..finally
 finally
  Unlock;
 end;//try..finally
//#UC END# *53A049ED0084_52FA3DB401BE_impl*
end;//TalcuTaskList.Save

procedure TalcuTaskList.SaveTask(theTask: TddProcessTask);
//#UC START# *53A04A4D01E1_52FA3DB401BE_var*
var
 l_Stream: Tl3FileStream;
//#UC END# *53A04A4D01E1_52FA3DB401BE_var*
begin
//#UC START# *53A04A4D01E1_52FA3DB401BE_impl*
 l_Stream := Tl3FileStream.Create(TaskFileName(theTask.TaskID), l3_fmExclusiveWrite{l3_fmWrite});
 try
  theTask.SaveTo(l_Stream, False);
 finally
  FreeAndNil(l_Stream);
 end; // try..finally
//#UC END# *53A04A4D01E1_52FA3DB401BE_impl*
end;//TalcuTaskList.SaveTask

function TalcuTaskList.TaskFileName(const theTaskID: AnsiString): AnsiString;
//#UC START# *53A04D8B00D3_52FA3DB401BE_var*
//#UC END# *53A04D8B00D3_52FA3DB401BE_var*
begin
//#UC START# *53A04D8B00D3_52FA3DB401BE_impl*
 Result := ConcatDirName(f_TaskFolder, theTaskID + '.query');
//#UC END# *53A04D8B00D3_52FA3DB401BE_impl*
end;//TalcuTaskList.TaskFileName

procedure TalcuTaskList.ActiveTaskCount;
//#UC START# *53A049770398_52FA3DB401BE_var*
//#UC END# *53A049770398_52FA3DB401BE_var*
begin
//#UC START# *53A049770398_52FA3DB401BE_impl*
 !!! Needs to be implemented !!!
//#UC END# *53A049770398_52FA3DB401BE_impl*
end;//TalcuTaskList.ActiveTaskCount

function TalcuTaskList.FindTask(aTaskType: TcsTaskType): TddProcessTask;
//#UC START# *53A049B30045_52FA3DB401BE_var*
//#UC END# *53A049B30045_52FA3DB401BE_var*
begin
//#UC START# *53A049B30045_52FA3DB401BE_impl*
 !!! Needs to be implemented !!!
//#UC END# *53A049B30045_52FA3DB401BE_impl*
end;//TalcuTaskList.FindTask

procedure TalcuTaskList.Sort;
//#UC START# *53A063B303E4_52FA3DB401BE_var*
//#UC END# *53A063B303E4_52FA3DB401BE_var*
begin
//#UC START# *53A063B303E4_52FA3DB401BE_impl*
 Lock;
 try
  Items.Sort;
 finally
  Unlock;
 end;//try..finally
//#UC END# *53A063B303E4_52FA3DB401BE_impl*
end;//TalcuTaskList.Sort
{$IfEnd} // Defined(ServerTasks) AND Defined(AppServerSide)

end.
