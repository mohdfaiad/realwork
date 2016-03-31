unit CsDataPipe;

// ������: "w:\common\components\rtl\Garant\cs\CsDataPipe.pas"
// ���������: "SimpleClass"
// ������� ������: "TCsDataPipe" MUID: (537F62DD009F)

{$Include w:\common\components\rtl\Garant\cs\CsDefine.inc}

interface

{$If NOT Defined(Nemesis)}
uses
 l3IntfUses
 , CsDataPipePrim
;

type
 TCsDataPipe = class(TCsDataPipePrim)
  public
   function ReadFolder(const aToPath: AnsiString): Boolean;
   procedure WriteFolder(const aFolderName: AnsiString);
 end;//TCsDataPipe
{$IfEnd} // NOT Defined(Nemesis)

implementation

{$If NOT Defined(Nemesis)}
uses
 l3ImplUses
 , l3Stream
 , l3Memory
 , l3FileUtils
 , l3BaseStream
 , SysUtils
 , l3Base
 , l3TempMemoryStream
 , l3Types
 , IdIOHandler
 , Classes
;

function TCsDataPipe.ReadFolder(const aToPath: AnsiString): Boolean;
//#UC START# *538DE0DC02BD_537F62DD009F_var*
var
 l_FileName: string;
 l_FileSize: Int64;
 l_FileStream: Tl3Stream;
 l_FullFileName: string;
 l_Dir: string;
 l_ZeroSize: Boolean;
 l_MismatchSize: Boolean;
//#UC END# *538DE0DC02BD_537F62DD009F_var*
begin
//#UC START# *538DE0DC02BD_537F62DD009F_impl*
 l_ZeroSize := False;
 l_MismatchSize :=False;

 if aToPath <> '' then
  Result:= ForceDirectories(aToPath);

 WriteBufferFlush;
  while True{IOHandler.Connected} do
  begin
   l_FileName := IOHandler.ReadLn;
   if l_FileName = c_NoMoreFiles then
    Break;
   l_FullFileName := ConcatDirName(aToPath, l_FileName);
   l_Dir := ExtractFilePath(l_FullFileName);
   if Result and not DirExists(l_Dir) then
    try
     MakeDir(l_Dir);
    except
     // ����� ��������� ������ �� �����, ����� ��� ���������
     on E: Exception do
     begin
      l3System.Msg2Log('��-�� %s ���������� ����� %s ��������', [E.Message, l_FullFileName]);
      Result:= False;
     end;
    end;

   if not Result then
   begin
    l3System.Msg2Log('���������� ����� %s ��������', [l_FullFileName]);
    l_FileSize := IOHandler.ReadInt64;

    if l_FileSize = 0 then
     begin
       l3System.Msg2Log('!!! ������� ����� ����� %s', [l_FullFileName]);
       l_MismatchSize := True;
     end;

    l_FileStream := Tl3TempMemoryStream.Create;
    try
     IOHandler.ReadStream(l_FileStream, l_FileSize);

     l_FileStream.Seek(0, soEnd);
     if l_FileStream.Position <> l_FileSize then
     begin
       l3System.Msg2Log('!!! ��� ����� %s ������� %d ������ %d', [l_FullFileName, l_FileStream.Position, l_FileSize]);
       l_MismatchSize := True;
     end;

    finally
     l3Free(l_FileStream);
    end;
   end
   else
   begin
    if FileExists(l_FullFileName) then
     RenametoBack(l_FullFileName);
    l_FileSize := IOHandler.ReadInt64;

    if l_FileSize = 0 then
     begin
       l3System.Msg2Log('!!! ������� ����� ����� %s', [l_FullFileName]);
       l_MismatchSize := True;
     end;

    l_FileStream := Tl3FileStream.Create(l_FullFileName, l3_fmCreateReadWrite);
    try
     IOHandler.ReadStream(l_FileStream, l_FileSize);

     l_FileStream.Seek(0, soEnd);
     if l_FileStream.Position <> l_FileSize then
     begin
       l3System.Msg2Log('!!! ��� ����� %s ������� %d ������ %d', [l_FullFileName, l_FileStream.Position, l_FileSize]);
       l_MismatchSize := True;
     end;

    finally
     l3Free(l_FileStream);
    end;
   end;
  end; // while
  Result := Result and not l_MismatchSize and not l_ZeroSize;
//#UC END# *538DE0DC02BD_537F62DD009F_impl*
end;//TCsDataPipe.ReadFolder

procedure TCsDataPipe.WriteFolder(const aFolderName: AnsiString);
//#UC START# *538DE100010F_537F62DD009F_var*

 function SendFile(const aFileName: string): Boolean;
 var
  l_FileSize: Int64;
  l_RelPath: string;
  l_DelimPos: Integer;
 begin
  Result := IOHandler.Connected;
  if Result and FileExists(aFileName) then
  begin
   l_RelPath := ExtractRelativePath(aFolderName, aFileName);
   // �������� ������ ����� (��� ������)
   l_DelimPos := Pos(PathDelim, l_RelPath);
   IOHandler.WriteLn(Copy(l_RelPath, l_DelimPos + 1, Length(l_RelPath)));
   l_FileSize := SizeOfFile(aFileName);
   IOHandler.WriteInt64(l_FileSize); // ������ �����
   IOHandler.WriteFile(aFileName{, False}); // ��� ����
  end;
 end;

 procedure SendAllFiles(const aDir: TFileName);
 var
  l_SearchRec: TSearchRec;
  l_FileFound: Boolean;
  l_Name: TFileName;
 begin
  l_FileFound := FindFirst(ConcatDirName(aDir, '*.*'), faAnyFile, l_SearchRec) = 0;
  try
   while l_FileFound do
   begin
    if l_SearchRec.Name[1] <> '.' then
    begin
     l_Name := ConcatDirName(aDir, l_SearchRec.Name);
     if (l_SearchRec.Attr and faDirectory) <> 0 then // ���������� ==> ������ ��������
      SendAllFiles(l_Name)
     else if (l_SearchRec.Attr and (faReadOnly or faHidden or faSysFile or faArchive)) <> 0 then // ����
      if not SendFile(l_Name) then
       Break;
    end;
    l_FileFound := FindNext(l_SearchRec) = 0;
   end; // while
  finally
   FindClose(l_SearchRec);
  end;
 end;

//#UC END# *538DE100010F_537F62DD009F_var*
begin
//#UC START# *538DE100010F_537F62DD009F_impl*
 if DirExists(aFolderName) then
 begin
  IOHandler.WriteBufferOpen(GSendBufferSizeDefault);
  try
   SendAllFiles(aFolderName);
   IOHandler.WriteLn(c_NoMoreFiles); // ������ �����
   IOHandler.WriteBufferClose;
  except
   IOHandler.WriteBufferClear;
   raise;
  end;
 end
 else
  IOHandler.WriteLn(c_NoMoreFiles); // ������ �����
//#UC END# *538DE100010F_537F62DD009F_impl*
end;//TCsDataPipe.WriteFolder
{$IfEnd} // NOT Defined(Nemesis)

end.
