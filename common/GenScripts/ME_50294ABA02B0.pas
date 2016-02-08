unit atStringsFromFile;

// ������: "w:\quality\test\garant6x\AdapterTest\CoreObjects\atStringsFromFile.pas"
// ���������: "SimpleClass"

interface

uses
 l3IntfUses
 , Windows
;

type
 PSFFHeader = ^SFFHeader;

 SFFHeader = record
  StringsCount: Integer;
  IndexOffset: Integer;
  DataOffset: Integer;
  DataLength: Integer;
 end;//SFFHeader

 TatStringsFromFile = class(TObject)
  private
   f_PIndex: PInteger;
   f_DataFileName: AnsiString;
   f_PData: PAnsiChar;
   f_PFileHeader: PSFFHeader;
   f_StringFile: THandle;
   f_DataFile: THandle;
   f_DataFileMapping: THandle;
  private
   procedure SetPointers; virtual;
   procedure CloseDataFile; virtual;
   procedure InitDataFile; virtual;
  protected
   function pm_GetCount: Integer;
   function pm_GetStrings(anIndex: Integer): AnsiString; virtual;
  public
   constructor Create(const aStringFileName: AnsiString); reintroduce;
   destructor Destroy; override;
  public
   property Count: Integer
    read pm_GetCount;
   property Strings[anIndex: Integer]: AnsiString
    read pm_GetStrings;
 end;//TatStringsFromFile

implementation

uses
 l3ImplUses
 , atFileInitializer
 , SysUtils
 , Classes
;

function TatStringsFromFile.pm_GetCount: Integer;
//#UC START# *502956AB00B3_50294ABA02B0get_var*
//#UC END# *502956AB00B3_50294ABA02B0get_var*
begin
//#UC START# *502956AB00B3_50294ABA02B0get_impl*
  Result := f_PFileHeader.StringsCount;
//#UC END# *502956AB00B3_50294ABA02B0get_impl*
end;//TatStringsFromFile.pm_GetCount

function TatStringsFromFile.pm_GetStrings(anIndex: Integer): AnsiString;
//#UC START# *5029567D01C0_50294ABA02B0get_var*
//#UC END# *5029567D01C0_50294ABA02B0get_var*
begin
//#UC START# *5029567D01C0_50294ABA02B0get_impl*
  if anIndex >= f_PFileHeader.StringsCount then
    Raise Exception.Create(ClassName + ': Out of bounds!');

  SetString(
    Result,
    PAnsiChar(Integer(f_PData) + PInteger(Integer(f_PIndex) + anIndex*SizeOf(Integer))^),
    PInteger(Integer(f_PIndex) + (anIndex+1)*SizeOf(Integer) )^-PInteger(Integer(f_PIndex) + anIndex*SizeOf(Integer))^
  );
//#UC END# *5029567D01C0_50294ABA02B0get_impl*
end;//TatStringsFromFile.pm_GetStrings

procedure TatStringsFromFile.SetPointers;
//#UC START# *502956CE01E4_50294ABA02B0_var*
//#UC END# *502956CE01E4_50294ABA02B0_var*
begin
//#UC START# *502956CE01E4_50294ABA02B0_impl*
  f_PIndex := PInteger(Integer(f_PFileHeader) + f_PFileHeader.IndexOffset);
  f_PData := PAnsiChar(Integer(f_PFileHeader) + f_PFileHeader.DataOffset);
//#UC END# *502956CE01E4_50294ABA02B0_impl*
end;//TatStringsFromFile.SetPointers

procedure TatStringsFromFile.CloseDataFile;
//#UC START# *502956D8009C_50294ABA02B0_var*
//#UC END# *502956D8009C_50294ABA02B0_var*
begin
//#UC START# *502956D8009C_50294ABA02B0_impl*
  f_PIndex := nil;
  f_PData := nil;
  if Assigned(f_PFileHeader) then
  begin
    UnmapViewOfFile(f_PFileHeader);
    f_PFileHeader := nil;
  end;
  if f_DataFileMapping <> 0 then
  begin
    CloseHandle(f_DataFileMapping);
    f_DataFileMapping := 0;
  end;
  if f_DataFile <> INVALID_HANDLE_VALUE then
  begin
    CloseHandle(f_DataFile);
    f_DataFile := INVALID_HANDLE_VALUE;
  end;
//#UC END# *502956D8009C_50294ABA02B0_impl*
end;//TatStringsFromFile.CloseDataFile

procedure TatStringsFromFile.InitDataFile;
//#UC START# *502956E703BF_50294ABA02B0_var*
  var
    l_FH : SFFHeader;
    i, l_StrLength, l_FileSize : Integer;
    l_PCurrStr : PAnsiChar;
    l_PCurrOffset : PInteger;
    l_Str : String;
    l_StringList : TStringList;
    l_Stream : TStream;
//#UC END# *502956E703BF_50294ABA02B0_var*
begin
//#UC START# *502956E703BF_50294ABA02B0_impl*
  l_StringList := TStringList.Create;
  try
    l_Stream := THandleStream.Create(f_StringFile);
    try
      l_Stream.Seek(0, soFromBeginning);
      l_StringList.LoadFromStream(l_Stream);
    finally
      FreeAndNil(l_Stream);
    end;

    // ��������� ������ �������
    l_FH.StringsCount := l_StringList.Count;
    l_FH.IndexOffset := SizeOf(l_FH); // ������ ��������� ����� ����� ���������
    l_FH.DataOffset := l_FH.IndexOffset + (l_FH.StringsCount+1)*SizeOf(Integer); // ������ ��������� ����� ����� �������, ������� �������� Count+1 Integer'��
    l_FH.DataLength := 0;
    for i := 0 to l_StringList.Count-1 do
      Inc(l_FH.DataLength, Length(l_StringList.Strings[i]));

    // ������ �������� ������ �����
    l_FileSize := l_FH.DataOffset + l_FH.DataLength;

    // ���������� ��������� �� ����
    FileSeek(f_DataFile, l_FileSize, 0);
    SetEndOfFile(f_DataFile);
    f_DataFileMapping := CreateFileMapping(f_DataFile, nil, PAGE_READWRITE, 0, 0, nil);
    f_PFileHeader := MapViewOfFile(f_DataFileMapping, FILE_MAP_WRITE, 0, 0, 0);
    FillChar(f_PFileHeader^, l_FileSize, 0);
    f_PFileHeader^ := l_FH;
    SetPointers;

    // ����� � ���� ������ � �� ������ ������������ ������
    l_PCurrStr := f_PData; // ��� ��������� �� ������ ������ � ������
    l_PCurrOffset := f_PIndex; // ��� ��������� �� �������� ������ ������������ ������ ������
    for i := 0 to l_StringList.Count-1 do
    begin
      l_Str := l_StringList.Strings[i];
      l_StrLength := Length(l_Str);
      //
      l_PCurrOffset^ := Integer(l_PCurrStr) - Integer(f_PData);
      Move(PAnsiChar(l_Str)^, l_PCurrStr^, l_StrLength);
      Inc(l_PCurrOffset);
      Inc(l_PCurrStr, l_StrLength);
    end;
    l_PCurrOffset^ := l_FH.DataLength; // ��� ��� ���������� ����� ��������� ������

    // ������ ���� ��������� ���������������
    //Move(SIGNATURE, f_PFileHeader.Signature, SizeOf(f_PFileHeader.Signature));
    FlushViewOfFile(f_PFileHeader, 0);
  finally
    FreeAndNil(l_StringList);
  end;
//#UC END# *502956E703BF_50294ABA02B0_impl*
end;//TatStringsFromFile.InitDataFile

constructor TatStringsFromFile.Create(const aStringFileName: AnsiString);
//#UC START# *502957040259_50294ABA02B0_var*
  var
    l_StringFileName : String;
//#UC END# *502957040259_50294ABA02B0_var*
begin
//#UC START# *502957040259_50294ABA02B0_impl*
  l_StringFileName := aStringFileName;
  f_DataFileName := l_StringFileName + '.at_indexed_strings';
  f_DataFile := INVALID_HANDLE_VALUE;
  f_StringFile := INVALID_HANDLE_VALUE;
  f_DataFileMapping := 0;

  f_StringFile := CreateFile(PAnsiChar(l_StringFileName), GENERIC_READ, FILE_SHARE_READ, nil, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, 0);
  if f_StringFile = INVALID_HANDLE_VALUE then
    Raise Exception.Create( SysErrorMessage(GetLastError) );

  with TatFileInitializer.Create(f_DataFileName) do
  try
    if TryInit then
    try
      f_DataFile := DupHandle;
      InitDataFile;
      CloseDataFile;
    finally
      FinishInit;
    end;
    f_DataFile := DupHandle;
  finally
    Free;
  end;

  f_DataFileMapping := CreateFileMapping(f_DataFile, nil, PAGE_READONLY, 0, 0, nil);
  f_PFileHeader := MapViewOfFile(f_DataFileMapping, FILE_MAP_READ, 0, 0, 0);
  SetPointers;
//#UC END# *502957040259_50294ABA02B0_impl*
end;//TatStringsFromFile.Create

destructor TatStringsFromFile.Destroy;
//#UC START# *48077504027E_50294ABA02B0_var*
//#UC END# *48077504027E_50294ABA02B0_var*
begin
//#UC START# *48077504027E_50294ABA02B0_impl*
  CloseDataFile;
  DeleteFile(PAnsiChar(f_DataFileName)); // ���� ���-�� ����������, �� � �� ��������
  if f_StringFile <> INVALID_HANDLE_VALUE then
  begin
    CloseHandle(f_StringFile);
    f_StringFile := INVALID_HANDLE_VALUE;
  end;
  //
  inherited;
//#UC END# *48077504027E_50294ABA02B0_impl*
end;//TatStringsFromFile.Destroy

end.
