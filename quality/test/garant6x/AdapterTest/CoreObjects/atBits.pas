unit atBits;

// ������: "w:\quality\test\garant6x\AdapterTest\CoreObjects\atBits.pas"
// ���������: "SimpleClass"
// ������� ������: "TatBits" MUID: (502563E400D8)

interface

uses
 l3IntfUses
;

type
 TatBits = class(TObject)
  private
   f_Bits: Pointer;
   f_Size: Integer;
    {* ���� ��� �������� Size }
  private
   function GetBufSize(aBitsCount: Integer): Integer; virtual;
  protected
   procedure pm_SetSize(aValue: Integer);
   function pm_GetBits(anIndex: Integer): Boolean; virtual;
   procedure pm_SetBits(anIndex: Integer;
    aValue: Boolean); virtual;
   function GetBitFrom(const aStartIndex: Integer;
    const aForward: Boolean;
    const aSetBit: Boolean): Integer; virtual;
  public
   function GetLastSetBit: Integer; virtual;
   function GetRandomOpenBit: Integer; virtual;
   procedure Reset; virtual;
   procedure SaveToFile(const aFileName: AnsiString); virtual;
   procedure LoadFromFile(const aFileName: AnsiString); virtual;
   destructor Destroy; override;
  public
   property Size: Integer
    read f_Size
    write pm_SetSize;
   property Bits[anIndex: Integer]: Boolean
    read pm_GetBits
    write pm_SetBits;
    default;
 end;//TatBits

implementation

uses
 l3ImplUses
 , Windows
 , SysUtils
;

const
 BITS_PER_INT = SizeOf(Integer)*8;

procedure TatBits.pm_SetSize(aValue: Integer);
//#UC START# *5025646900CB_502563E400D8set_var*
  var
    l_NewMem: Pointer;
    l_NewMemSize, l_OldMemSize: Integer;

  function Min(X, Y: Integer): Integer;
  begin
    Result := X;
    if X > Y then Result := Y;
  end;
//#UC END# *5025646900CB_502563E400D8set_var*
begin
//#UC START# *5025646900CB_502563E400D8set_impl*
  if aValue <> Size then
  begin
    l_NewMemSize := GetBufSize(aValue);
    l_OldMemSize := GetBufSize(Size);
    if l_NewMemSize <> l_OldMemSize then
    begin
      l_NewMem := nil;
      if l_NewMemSize <> 0 then
      begin
        GetMem(l_NewMem, l_NewMemSize);
        FillChar(l_NewMem^, l_NewMemSize, 0);
      end;
      if l_OldMemSize <> 0 then
      begin
        if l_NewMem <> nil then
          Move(f_Bits^, l_NewMem^, Min(l_OldMemSize, l_NewMemSize));
        FreeMem(f_Bits, l_OldMemSize);
      end;
      f_Bits := l_NewMem;
    end;
    f_Size := aValue;
  end;
//#UC END# *5025646900CB_502563E400D8set_impl*
end;//TatBits.pm_SetSize

function TatBits.pm_GetBits(anIndex: Integer): Boolean;
//#UC START# *502565320313_502563E400D8get_var*
//#UC END# *502565320313_502563E400D8get_var*
begin
//#UC START# *502565320313_502563E400D8get_impl*
  asm
    MOV EAX, [Self]
    MOV EAX, [EAX].f_Bits
    MOV ECX, anIndex
    BT  [EAX], ECX
    SBB EAX, EAX
    AND EAX, 1
    MOV Result, AL
  end;
//#UC END# *502565320313_502563E400D8get_impl*
end;//TatBits.pm_GetBits

procedure TatBits.pm_SetBits(anIndex: Integer;
 aValue: Boolean);
//#UC START# *502565320313_502563E400D8set_var*
//#UC END# *502565320313_502563E400D8set_var*
begin
//#UC START# *502565320313_502563E400D8set_impl*
  asm
    MOV ECX, anIndex
    MOV EDX, [Self]
    MOV EDX, [EDX].f_Bits
    MOV AL, aValue
    OR AL, AL
    JZ  @@2
    BTS [EDX], ECX
    JMP @@quit

  @@2:
    BTR [EDX], ECX

  @@quit:
  end;
//#UC END# *502565320313_502563E400D8set_impl*
end;//TatBits.pm_SetBits

function TatBits.GetBitFrom(const aStartIndex: Integer;
 const aForward: Boolean;
 const aSetBit: Boolean): Integer;
//#UC START# *5025659F0300_502563E400D8_var*
  var
    l_Start, l_LastOfBits : Pointer;
    l_InvertMask, l_LastBlockMask, l_FirstBlockMask : Longword;
//#UC END# *5025659F0300_502563E400D8_var*
begin
//#UC START# *5025659F0300_502563E400D8_impl*
  Result := -1;

  l_Start := Pointer(Integer(f_Bits) + GetBufSize(aStartIndex+1) - SizeOf(Integer));
  Assert(Integer(l_Start) mod SizeOf(Integer) = 0, 'Integer(l_Start) mod SizeOf(Integer) = 0'); // ��������� ������ ���� ������ SizeOf(Int)
  l_LastOfBits := Pointer(Integer(f_Bits) + GetBufSize(Size) - SizeOf(Integer));

  if aSetBit then
    l_InvertMask := 0
  else
    l_InvertMask := $FFFFFFFF;

  l_LastBlockMask := ($FFFFFFFF shr (GetBufSize(Size) * BITS_PER_INT - Size));

  if aForward then
    l_FirstBlockMask := $FFFFFFFF shl (aStartIndex AND $1F)
  else
    l_FirstBlockMask := ($FFFFFFFF shl ((aStartIndex AND $1F)+1)) XOR $FFFFFFFF;

  asm
    MOV EAX, [l_Start]  // EAX �������� ����� � �������� ����
    MOV EDX, [EAX]
    XOR EDX, l_InvertMask // ����������� ��� ������ ���������� �����
    AND EDX, l_FirstBlockMask // �� ������� ����� �������� ���� ������ ���������� �������

    MOV CL, aForward
    CMP CL, 0
    JE @@backward_search

  // ���� ������ ��� �� ���������� �������
  @@forward_search:
    MOV ECX, [l_LastOfBits] // ECX �������� ������� ������ - �����
    CMP EAX, ECX
    JE @@forward_last_block
    //
  @@forward_cycle:
    BSF EDX, EDX
    JNE @@found
    CMP ECX, 0
    JE @@quit
    ADD EAX, $04 // ����������� ��������� �� 4 ����� ������
    MOV EDX, [EAX]
    XOR EDX, l_InvertMask // ����������� ��� ������ ���������� �����
    CMP EAX, ECX // �������� ������ ������?
    JNE @@forward_cycle
  @@forward_last_block:
    AND EDX, l_LastBlockMask // �� ���������� ����� �������� ���� ������ ��� ������
    MOV ECX, 0 // ��������� �������� ������ ���������
    JMP @@forward_cycle

  // ���� ������ ��� �� ���������� �������
  @@backward_search:
    MOV ECX, [Self]
    MOV ECX, [ECX].f_Bits // ECX �������� ������� - ������ ������
    CMP EAX, ECX
    JNE @@backward_cycle
    AND EDX, l_LastBlockMask
    //
  @@backward_cycle:
    BSR EDX, EDX
    JNE @@found
    CMP EAX, ECX
    JE @@quit
    SUB EAX, $04 // ����������� ��������� �� 4 ����� �����
    MOV EDX, [EAX]
    XOR EDX, l_InvertMask
    JMP @@backward_cycle

  @@found:
    MOV ECX, [Self]
    MOV ECX, [ECX].f_Bits
    SUB EAX, ECX // ������� ����� ����������� � ������
    IMUL EAX, $8 // 8 ����� � �����
    ADD EDX, EAX // EDX �������� ����� ���������� �������������� ���� �� ������ ������
    MOV Result, EDX
  @@quit:
  end;
//#UC END# *5025659F0300_502563E400D8_impl*
end;//TatBits.GetBitFrom

function TatBits.GetBufSize(aBitsCount: Integer): Integer;
//#UC START# *502565EE034B_502563E400D8_var*
//#UC END# *502565EE034B_502563E400D8_var*
begin
//#UC START# *502565EE034B_502563E400D8_impl*
  Result := ((aBitsCount + BITS_PER_INT - 1) div BITS_PER_INT) * SizeOf(Integer);
//#UC END# *502565EE034B_502563E400D8_impl*
end;//TatBits.GetBufSize

function TatBits.GetLastSetBit: Integer;
//#UC START# *5025661502E8_502563E400D8_var*
//#UC END# *5025661502E8_502563E400D8_var*
begin
//#UC START# *5025661502E8_502563E400D8_impl*
  Result := GetBitFrom(Size-1, false, true);
//#UC END# *5025661502E8_502563E400D8_impl*
end;//TatBits.GetLastSetBit

function TatBits.GetRandomOpenBit: Integer;
//#UC START# *5025662B0086_502563E400D8_var*
  var
    l_StartIndex : Integer;
    l_Direction : Boolean;
//#UC END# *5025662B0086_502563E400D8_var*
begin
//#UC START# *5025662B0086_502563E400D8_impl*
  l_StartIndex := Random(Size);
  l_Direction := Random > 0.5;
  Result := GetBitFrom(l_StartIndex, l_Direction, false);
  if Result = -1 then
    Result := GetBitFrom(l_StartIndex, NOT l_Direction, false);
//#UC END# *5025662B0086_502563E400D8_impl*
end;//TatBits.GetRandomOpenBit

procedure TatBits.Reset;
//#UC START# *5025664301E6_502563E400D8_var*
  var
    l_Size : Integer;
//#UC END# *5025664301E6_502563E400D8_var*
begin
//#UC START# *5025664301E6_502563E400D8_impl*
  l_Size := Size;
  Size := 0;
  Size := l_Size;
//#UC END# *5025664301E6_502563E400D8_impl*
end;//TatBits.Reset

procedure TatBits.SaveToFile(const aFileName: AnsiString);
//#UC START# *5025664D00CC_502563E400D8_var*
  var
    l_Handle : Windows.THandle;
//#UC END# *5025664D00CC_502563E400D8_var*
begin
//#UC START# *5025664D00CC_502563E400D8_impl*
  l_Handle := CreateFile(PAnsiChar(aFileName), GENERIC_WRITE, FILE_SHARE_READ, nil, CREATE_ALWAYS, FILE_ATTRIBUTE_NORMAL, 0);
  if l_Handle = INVALID_HANDLE_VALUE then
    Raise Exception.Create( SysErrorMessage(GetLastError) );

  try
    FileSeek(l_Handle, 0, 0);
    FileWrite(l_Handle, f_Size, SizeOf(f_Size));
    FileWrite(l_Handle, f_Bits^, GetBufSize(f_Size));
  finally
    CloseHandle(l_Handle);
  end;
//#UC END# *5025664D00CC_502563E400D8_impl*
end;//TatBits.SaveToFile

procedure TatBits.LoadFromFile(const aFileName: AnsiString);
//#UC START# *50256663004A_502563E400D8_var*
  var
    l_Handle : Windows.THandle;
    l_Size : Integer;
//#UC END# *50256663004A_502563E400D8_var*
begin
//#UC START# *50256663004A_502563E400D8_impl*
  l_Handle := CreateFile(PAnsiChar(aFileName), GENERIC_READ, FILE_SHARE_READ, nil, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, 0);
  if l_Handle = INVALID_HANDLE_VALUE then
    Raise Exception.Create( SysErrorMessage(GetLastError) );

  try
    FileSeek(l_Handle, 0, 0);
    FileRead(l_Handle, l_Size, SizeOf(l_Size));
    Size := l_Size;
    FileRead(l_Handle, f_Bits^, GetBufSize(Size));
  finally
    CloseHandle(l_Handle);
  end;
//#UC END# *50256663004A_502563E400D8_impl*
end;//TatBits.LoadFromFile

destructor TatBits.Destroy;
//#UC START# *48077504027E_502563E400D8_var*
//#UC END# *48077504027E_502563E400D8_var*
begin
//#UC START# *48077504027E_502563E400D8_impl*
  Size := 0;
  inherited;
//#UC END# *48077504027E_502563E400D8_impl*
end;//TatBits.Destroy

end.
