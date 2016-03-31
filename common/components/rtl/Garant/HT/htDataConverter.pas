unit htDataConverter;

// ������: "w:\common\components\rtl\Garant\HT\htDataConverter.pas"
// ���������: "SimpleClass"
// ������� ������: "ThtDataConverter" MUID: (55599B5C014A)

{$Include w:\common\components\rtl\Garant\HT\htDefineDA.inc}

interface

uses
 l3IntfUses
 , l3ProtoObject
 , htInterfaces
 {$If NOT Defined(Nemesis)}
 , HT_Const
 {$IfEnd} // NOT Defined(Nemesis)
 , daTypes
 , l3Date
 , daInterfaces
;

type
 ThtDataConverter = class(Tl3ProtoObject, IhtDataConverter)
  private
   function MakeString(aData: Pointer;
    const aDesc: OPEL): AnsiString;
  protected
   function AllocateParamBuffer(const aDescription: IdaParamDescription): Pointer;
   procedure ParamToDataBase(const aDescription: IdaParamDescription;
    ClientBufferFormat: TdaDataType;
    aClientBuffer: Pointer;
    var aServerBuffer: Pointer);
   procedure ParamFromDataBase(const aDescription: IdaParamDescription;
    ClientBufferFormat: TdaDataType;
    aServerBuffer: Pointer;
    aClientBuffer: Pointer);
   procedure FreeParamBuffer(const aDescription: IdaParamDescription;
    aBuffer: Pointer);
   function ToLargeInt(aData: Pointer;
    const aDesc: OPEL): LargeInt;
   function ToInteger(aData: Pointer;
    const aDesc: OPEL): Integer;
   function ToStDate(aData: Pointer;
    const aDesc: OPEL): TStDate;
   function ToStTime(aData: Pointer;
    const aDesc: OPEL): TStTime;
   function ToString(aData: Pointer;
    const aDesc: OPEL): AnsiString;
   function ToByte(aData: Pointer;
    const aDesc: OPEL): Byte;
  public
   constructor Create; reintroduce;
   class function Make: IhtDataConverter; reintroduce;
 end;//ThtDataConverter

implementation

uses
 l3ImplUses
 , l3Base
 , l3String
 , SysUtils
;

constructor ThtDataConverter.Create;
//#UC START# *55599D240026_55599B5C014A_var*
//#UC END# *55599D240026_55599B5C014A_var*
begin
//#UC START# *55599D240026_55599B5C014A_impl*
 inherited Create;
//#UC END# *55599D240026_55599B5C014A_impl*
end;//ThtDataConverter.Create

class function ThtDataConverter.Make: IhtDataConverter;
var
 l_Inst : ThtDataConverter;
begin
 l_Inst := Create;
 try
  Result := l_Inst;
 finally
  l_Inst.Free;
 end;//try..finally
end;//ThtDataConverter.Make

function ThtDataConverter.MakeString(aData: Pointer;
 const aDesc: OPEL): AnsiString;
//#UC START# *562E1BAB0090_55599B5C014A_var*
//#UC END# *562E1BAB0090_55599B5C014A_var*
begin
//#UC START# *562E1BAB0090_55599B5C014A_impl*
 if aDesc.nType = ET_CHAR then
  Result := l3ArrayToString(aData^, aDesc.wLen)
 else
  Result := '';
//#UC END# *562E1BAB0090_55599B5C014A_impl*
end;//ThtDataConverter.MakeString

function ThtDataConverter.AllocateParamBuffer(const aDescription: IdaParamDescription): Pointer;
//#UC START# *555995210007_55599B5C014A_var*
//#UC END# *555995210007_55599B5C014A_var*
begin
//#UC START# *555995210007_55599B5C014A_impl*
 case aDescription.DataType of
  da_dtChar:
   l3System.GetLocalMem(Result, aDescription.Size + 1);
  da_dtDWord:
   l3System.GetLocalMem(Result, SizeOf(LongInt));
  da_dtQWord:
   l3System.GetLocalMem(Result, SizeOf(LargeInt));
  da_dtDate:                                           
   l3System.GetLocalMem(Result, SizeOf(TStDate));
  da_dtTime:
   l3System.GetLocalMem(Result, SizeOf(TStTime));
  da_dtWord:
   l3System.GetLocalMem(Result, SizeOf(Word));
(*
++   da_dtChar
 , da_dtByte
++ , da_dtDate
++ , da_dtTime
++ , da_dtDWord
++ , da_dtWord
 , da_dtInteger
 , da_dtBoolean
++ , da_dtQWord*)

 else
  Assert(False);
 end;
//!! !!! Needs to be implemented !!!
//#UC END# *555995210007_55599B5C014A_impl*
end;//ThtDataConverter.AllocateParamBuffer

procedure ThtDataConverter.ParamToDataBase(const aDescription: IdaParamDescription;
 ClientBufferFormat: TdaDataType;
 aClientBuffer: Pointer;
 var aServerBuffer: Pointer);
//#UC START# *5559955500DF_55599B5C014A_var*
//#UC END# *5559955500DF_55599B5C014A_var*
begin
//#UC START# *5559955500DF_55599B5C014A_impl*
 case aDescription.DataType of
  da_dtChar:
   case ClientBufferFormat of
    da_dtDWord:
     StrPLCopy(PAnsiChar(aServerBuffer), PAnsiChar(IntToStr(PLongInt(aClientBuffer)^)), aDescription.Size);
    da_dtQWord:
     StrPLCopy(PAnsiChar(aServerBuffer), PAnsiChar(IntToStr(PLargeInt(aClientBuffer)^)), aDescription.Size);
    da_dtChar:
     StrPLCopy(PAnsiChar(aServerBuffer), PAnsiChar(PAnsiString(aClientBuffer)^), aDescription.Size);
    da_dtDate:
     StrPLCopy(PAnsiChar(aServerBuffer), PAnsiChar(IntToStr(PStDate(aClientBuffer)^)), aDescription.Size);
    da_dtTime:
     StrPLCopy(PAnsiChar(aServerBuffer), PAnsiChar(IntToStr(PStTime(aClientBuffer)^)), aDescription.Size);
    da_dtWord:
     StrPLCopy(PAnsiChar(aServerBuffer), PAnsiChar(IntToStr(PWord(aClientBuffer)^)), aDescription.Size);
(*
++   da_dtChar
 , da_dtByte
++ , da_dtDate
++ , da_dtTime
++ , da_dtDWord
++ , da_dtWord
 , da_dtInteger
 , da_dtBoolean
++ , da_dtQWord*)
   end; // Client case da_dtDWord
  da_dtDWord:
   case ClientBufferFormat of
    da_dtDWord:
     PLongInt(aServerBuffer)^ := PLongInt(aClientBuffer)^;
    da_dtQWord:
     PLongInt(aServerBuffer)^ := PLargeInt(aClientBuffer)^;
    da_dtChar:
     PLongInt(aServerBuffer)^ := StrToInt(PAnsiString(aClientBuffer)^);
    da_dtDate:
     PLongInt(aServerBuffer)^ := PStDate(aClientBuffer)^;
    da_dtTime:
     PLongInt(aServerBuffer)^ := PStTime(aClientBuffer)^;
    da_dtWord:
     PLongInt(aServerBuffer)^ := PWord(aClientBuffer)^;
(*
++   da_dtChar
 , da_dtByte
++ , da_dtDate
++ , da_dtTime
++ , da_dtDWord
++ , da_dtWord
 , da_dtInteger
 , da_dtBoolean
++ , da_dtQWord*)
   end; // Client case da_dtDWord
  da_dtQWord:
   case ClientBufferFormat of
    da_dtDWord:
     PLargeInt(aServerBuffer)^ := PLongInt(aClientBuffer)^;
    da_dtQWord:
     PLargeInt(aServerBuffer)^ := PLargeInt(aClientBuffer)^;
    da_dtChar:
     PLargeInt(aServerBuffer)^ := StrToInt64(PAnsiString(aClientBuffer)^);
    da_dtDate:
     PLargeInt(aServerBuffer)^ := PStDate(aClientBuffer)^;
    da_dtTime:
     PLargeInt(aServerBuffer)^ := PStTime(aClientBuffer)^;
    da_dtWord:
     PLargeInt(aServerBuffer)^ := PWord(aClientBuffer)^;
(*
++   da_dtChar
 , da_dtByte
++ , da_dtDate
++ , da_dtTime
++ , da_dtDWord
++ , da_dtWord
 , da_dtInteger
 , da_dtBoolean
++ , da_dtQWord*)
   end; // Client case da_dtQWord

  da_dtDate:
   case ClientBufferFormat of
    da_dtDWord:
     PStDate(aServerBuffer)^ := PLongInt(aClientBuffer)^;
    da_dtQWord:
     PStDate(aServerBuffer)^ := PLargeInt(aClientBuffer)^;
    da_dtChar:
     PStDate(aServerBuffer)^ := StrToInt(PAnsiString(aClientBuffer)^);
    da_dtDate:
     PStDate(aServerBuffer)^ := PStDate(aClientBuffer)^;
    da_dtTime:
     PStDate(aServerBuffer)^ := PStTime(aClientBuffer)^;
    da_dtWord:
     PStDate(aServerBuffer)^ := PWord(aClientBuffer)^;
(*
++   da_dtChar
 , da_dtByte
++ , da_dtDate
++ , da_dtTime
++ , da_dtDWord
++ , da_dtWord
 , da_dtInteger
 , da_dtBoolean
++ , da_dtQWord*)
   end; // Client case da_dtQWord

  da_dtTime:
   case ClientBufferFormat of
    da_dtDWord:
     PStTime(aServerBuffer)^ := PLongInt(aClientBuffer)^;
    da_dtQWord:
     PStTime(aServerBuffer)^ := PLargeInt(aClientBuffer)^;
    da_dtChar:
     PStTime(aServerBuffer)^ := StrToInt(PAnsiString(aClientBuffer)^);
    da_dtDate:
     PStTime(aServerBuffer)^ := PStDate(aClientBuffer)^;
    da_dtTime:
     PStTime(aServerBuffer)^ := PStTime(aClientBuffer)^;
    da_dtWord:
     PStTime(aServerBuffer)^ := PWord(aClientBuffer)^;
(*
++   da_dtChar
 , da_dtByte
++ , da_dtDate
++ , da_dtTime
++ , da_dtDWord
++ , da_dtWord
 , da_dtInteger
 , da_dtBoolean
++ , da_dtQWord*)
  end;

  da_dtWord:
   case ClientBufferFormat of
    da_dtDWord:
     PWord(aServerBuffer)^ := PLongInt(aClientBuffer)^;
    da_dtQWord:
     PWord(aServerBuffer)^ := PLargeInt(aClientBuffer)^;
    da_dtChar:
     PWord(aServerBuffer)^ := StrToInt(PAnsiString(aClientBuffer)^);
    da_dtDate:
     PWord(aServerBuffer)^ := PStDate(aClientBuffer)^;
    da_dtTime:
     PWord(aServerBuffer)^ := PStTime(aClientBuffer)^;
    da_dtWord:
     PWord(aServerBuffer)^ := PWord(aClientBuffer)^;
(*
++   da_dtChar
 , da_dtByte
++ , da_dtDate
++ , da_dtTime
++ , da_dtDWord
++ , da_dtWord
 , da_dtInteger
 , da_dtBoolean
++ , da_dtQWord*)
   end; // Client case da_dtQWord

(*   da_dtChar
 , da_dtByte
++ , da_dtDate
++ , da_dtTime
++ , da_dtDWord
++ , da_dtWord
 , da_dtInteger
 , da_dtBoolean
++ , da_dtQWord*)

 else
  Assert(False);
 end;
//!! !!! Needs to be implemented !!!
//#UC END# *5559955500DF_55599B5C014A_impl*
end;//ThtDataConverter.ParamToDataBase

procedure ThtDataConverter.ParamFromDataBase(const aDescription: IdaParamDescription;
 ClientBufferFormat: TdaDataType;
 aServerBuffer: Pointer;
 aClientBuffer: Pointer);
//#UC START# *55599596005B_55599B5C014A_var*
//#UC END# *55599596005B_55599B5C014A_var*
begin
//#UC START# *55599596005B_55599B5C014A_impl*
 case ClientBufferFormat of
  da_dtChar:
   case aDescription.DataType of
    da_dtChar:
     PString(aClientBuffer)^ := StrPas(PAnsiChar(aServerBuffer));
    da_dtDWord:
     PString(aClientBuffer)^ := IntToStr(PLongInt(aServerBuffer)^);
    da_dtQWord:
     PString(aClientBuffer)^ := IntToStr(PLargeInt(aServerBuffer)^);
    da_dtDate:
     PAnsiString(aClientBuffer)^ := IntToStr(PStDate(aServerBuffer)^);
    da_dtTime:
     PAnsiString(aClientBuffer)^ := IntToStr(PStTime(aServerBuffer)^);
    da_dtWord:
     PAnsiString(aClientBuffer)^ := IntToStr(PWord(aServerBuffer)^);
(*
++   da_dtChar
 , da_dtByte
++ , da_dtDate
++ , da_dtTime
++ , da_dtDWord
++ , da_dtWord
 , da_dtInteger
 , da_dtBoolean
++ , da_dtQWord*)
   end; // Client case da_dtDWord

  da_dtDWord:
   case aDescription.DataType of
    da_dtChar:
     PLongInt(aClientBuffer)^ := StrToInt(PAnsiChar(aServerBuffer)^);
    da_dtDWord:
     PLongInt(aClientBuffer)^ := PLongInt(aServerBuffer)^;
    da_dtQWord:
     PLongInt(aClientBuffer)^ := PLargeInt(aServerBuffer)^;
    da_dtDate:
     PLongInt(aClientBuffer)^ := PStDate(aServerBuffer)^;
    da_dtTime:
     PLongInt(aClientBuffer)^ := PStTime(aServerBuffer)^;
    da_dtWord:
     PLongInt(aClientBuffer)^ := PWord(aServerBuffer)^;
(*
++   da_dtChar
 , da_dtByte
++ , da_dtDate
++ , da_dtTime
++ , da_dtDWord
++ , da_dtWord
 , da_dtInteger
 , da_dtBoolean
++ , da_dtQWord*)
   end; // Client case da_dtDWord
  da_dtQWord:
   case ClientBufferFormat of
    da_dtChar:
     PLargeInt(aClientBuffer)^ := StrToInt64(PAnsiChar(aServerBuffer)^);
    da_dtDWord:
     PLargeInt(aClientBuffer)^ := PLongInt(aServerBuffer)^;
    da_dtQWord:
     PLargeInt(aClientBuffer)^ := PLargeInt(aServerBuffer)^;
    da_dtDate:
     PLargeInt(aClientBuffer)^ := PStDate(aServerBuffer)^;
    da_dtTime:
     PLargeInt(aClientBuffer)^ := PStTime(aServerBuffer)^;
    da_dtWord:
     PLargeInt(aClientBuffer)^ := PWord(aServerBuffer)^;
(*
++   da_dtChar
 , da_dtByte
++ , da_dtDate
++ , da_dtTime
++ , da_dtDWord
++ , da_dtWord
 , da_dtInteger
 , da_dtBoolean
++ , da_dtQWord*)
   end; // Client case da_dtQWord

  da_dtDate:
   case ClientBufferFormat of
    da_dtChar:
     PStDate(aClientBuffer)^ := StrToInt(PAnsiChar(aServerBuffer)^);
    da_dtDWord:
     PStDate(aClientBuffer)^ := PLongInt(aServerBuffer)^;
    da_dtQWord:
     PStDate(aClientBuffer)^ := PLargeInt(aServerBuffer)^;
    da_dtDate:
     PStDate(aClientBuffer)^ := PStDate(aServerBuffer)^;
    da_dtTime:
     PStDate(aClientBuffer)^ := PStTime(aServerBuffer)^;
    da_dtWord:
     PStDate(aClientBuffer)^ := PWord(aServerBuffer)^;
(*
++   da_dtChar
 , da_dtByte
++ , da_dtDate
++ , da_dtTime
++ , da_dtDWord
++ , da_dtWord
 , da_dtInteger
 , da_dtBoolean
++ , da_dtQWord*)
   end; // Client case da_dtQWord

  da_dtTime:
   case ClientBufferFormat of
    da_dtChar:
     PStTime(aClientBuffer)^ := StrToInt(PAnsiChar(aServerBuffer)^);
    da_dtDWord:
     PStTime(aClientBuffer)^ := PLongInt(aServerBuffer)^;
    da_dtQWord:
     PStTime(aClientBuffer)^ := PLargeInt(aServerBuffer)^;
    da_dtDate:
     PStTime(aClientBuffer)^ := PStDate(aServerBuffer)^;
    da_dtTime:
     PStTime(aClientBuffer)^ := PStTime(aServerBuffer)^;
    da_dtWord:
     PStTime(aClientBuffer)^ := PWord(aServerBuffer)^;
(*
++   da_dtChar
 , da_dtByte
++ , da_dtDate
++ , da_dtTime
++ , da_dtDWord
++ , da_dtWord
 , da_dtInteger
 , da_dtBoolean
++ , da_dtQWord*)
   end;

  da_dtWord:
   case ClientBufferFormat of
    da_dtChar:
     PWord(aClientBuffer)^ := StrToInt(PAnsiChar(aServerBuffer)^);
    da_dtDWord:
     PWord(aClientBuffer)^ := PLongInt(aServerBuffer)^;
    da_dtQWord:
     PWord(aClientBuffer)^ := PLargeInt(aServerBuffer)^;
    da_dtDate:
     PWord(aClientBuffer)^ := PStDate(aServerBuffer)^;
    da_dtTime:
     PWord(aClientBuffer)^ := PStTime(aServerBuffer)^;
    da_dtWord:
     PWord(aClientBuffer)^ := PWord(aServerBuffer)^;
(*
++   da_dtChar
 , da_dtByte
++ , da_dtDate
++ , da_dtTime
++ , da_dtDWord
++ , da_dtWord
 , da_dtInteger
 , da_dtBoolean
++ , da_dtQWord*)
   end; // Client case da_dtQWord

(*   da_dtChar
 , da_dtByte
++ , da_dtDate
++ , da_dtTime
++ , da_dtDWord
++ , da_dtWord
 , da_dtInteger
 , da_dtBoolean
++ , da_dtQWord*)
 else
  Assert(False);
 end;
//!! !!! Needs to be implemented !!!
//#UC END# *55599596005B_55599B5C014A_impl*
end;//ThtDataConverter.ParamFromDataBase

procedure ThtDataConverter.FreeParamBuffer(const aDescription: IdaParamDescription;
 aBuffer: Pointer);
//#UC START# *5559D14D02D1_55599B5C014A_var*
//#UC END# *5559D14D02D1_55599B5C014A_var*
begin
//#UC START# *5559D14D02D1_55599B5C014A_impl*
 l3System.FreeLocalMem(aBuffer);
//#UC END# *5559D14D02D1_55599B5C014A_impl*
end;//ThtDataConverter.FreeParamBuffer

function ThtDataConverter.ToLargeInt(aData: Pointer;
 const aDesc: OPEL): LargeInt;
//#UC START# *55C89B830012_55599B5C014A_var*
//#UC END# *55C89B830012_55599B5C014A_var*
begin
//#UC START# *55C89B830012_55599B5C014A_impl*
 Result := 0;
 case aDesc.nType of
  ET_CHAR:
   Result := StrToInt64(MakeString(aData, aDesc));
//  ET_ARRA = 1;   (* ������ ������ �������� ����� *)
  ET_BYTE:
   Result := PByte(aData)^;   (* ������� - �������� ����� (1 ����) ��� ����� *)
  ET_INTR:
   Result := PSmallInt(aData)^;   (* ������� - ����� �� ������ *)
  ET_WORD:
   Result := PWord(aData)^;   (* ������� - ����� ��� ����� *)
//  ET_DATE = 5;   (* ����    - ����� ��� ����� *)
//  ET_NMBR = 6;   (* �����   - 3-� �������� ����� ��� ����� *)
  ET_LONG:
   Result := PLongInt(aData)^;   (* ������� - ������� ����� �� ������ *)
  ET_DWRD:
   Result := PLongWord(aData)^;   (* ������� - ������� ����� ��� ����� *)
//  ET_FLOA = 9;   (* ������� - single *)
//  ET_CURR =10;   (* ������  - double *)
//  ET_DFLT =11;   (* ������� - double *)
 else
  Assert(False);
 end;
//#UC END# *55C89B830012_55599B5C014A_impl*
end;//ThtDataConverter.ToLargeInt

function ThtDataConverter.ToInteger(aData: Pointer;
 const aDesc: OPEL): Integer;
//#UC START# *55C89BB40093_55599B5C014A_var*
//#UC END# *55C89BB40093_55599B5C014A_var*
begin
//#UC START# *55C89BB40093_55599B5C014A_impl*
 Result := 0;
 case aDesc.nType of
  ET_CHAR:
   Result := StrToInt(MakeString(aData, aDesc));
//  ET_ARRA = 1;   (* ������ ������ �������� ����� *)
  ET_BYTE:
   Result := PByte(aData)^;   (* ������� - �������� ����� (1 ����) ��� ����� *)
  ET_INTR:
   Result := PSmallInt(aData)^;   (* ������� - ����� �� ������ *)
  ET_WORD:
   Result := PWord(aData)^;   (* ������� - ����� ��� ����� *)
//  ET_DATE = 5;   (* ����    - ����� ��� ����� *)
//  ET_NMBR = 6;   (* �����   - 3-� �������� ����� ��� ����� *)
  ET_LONG:
   Result := PLongInt(aData)^;   (* ������� - ������� ����� �� ������ *)
  ET_DWRD:
   Result := PLongWord(aData)^;   (* ������� - ������� ����� ��� ����� *)
//  ET_FLOA = 9;   (* ������� - single *)
//  ET_CURR =10;   (* ������  - double *)
//  ET_DFLT =11;   (* ������� - double *)
 else
  Assert(False);
 end;
//#UC END# *55C89BB40093_55599B5C014A_impl*
end;//ThtDataConverter.ToInteger

function ThtDataConverter.ToStDate(aData: Pointer;
 const aDesc: OPEL): TStDate;
//#UC START# *55C89BC8017D_55599B5C014A_var*
//#UC END# *55C89BC8017D_55599B5C014A_var*
begin
//#UC START# *55C89BC8017D_55599B5C014A_impl*
 Result := 0;
 case aDesc.nType of
  ET_CHAR:
   Result := StrToInt(MakeString(aData, aDesc));
//  ET_ARRA = 1;   (* ������ ������ �������� ����� *)
  ET_BYTE:
   Result := PByte(aData)^;   (* ������� - �������� ����� (1 ����) ��� ����� *)
  ET_INTR:
   Result := PSmallInt(aData)^;   (* ������� - ����� �� ������ *)
  ET_WORD:
   Result := PWord(aData)^;   (* ������� - ����� ��� ����� *)
//  ET_DATE = 5;   (* ����    - ����� ��� ����� *)
//  ET_NMBR = 6;   (* �����   - 3-� �������� ����� ��� ����� *)
  ET_LONG:
   Result := PLongInt(aData)^;   (* ������� - ������� ����� �� ������ *)
  ET_DWRD:
   Result := PLongWord(aData)^;   (* ������� - ������� ����� ��� ����� *)
//  ET_FLOA = 9;   (* ������� - single *)
//  ET_CURR =10;   (* ������  - double *)
//  ET_DFLT =11;   (* ������� - double *)
 else
  Assert(False);
 end;
//#UC END# *55C89BC8017D_55599B5C014A_impl*
end;//ThtDataConverter.ToStDate

function ThtDataConverter.ToStTime(aData: Pointer;
 const aDesc: OPEL): TStTime;
//#UC START# *55C89BDC012F_55599B5C014A_var*
//#UC END# *55C89BDC012F_55599B5C014A_var*
begin
//#UC START# *55C89BDC012F_55599B5C014A_impl*
 Result := 0;
 case aDesc.nType of
  ET_CHAR:
   Result := StrToInt(MakeString(aData, aDesc));
//  ET_ARRA = 1;   (* ������ ������ �������� ����� *)
  ET_BYTE:
   Result := PByte(aData)^;   (* ������� - �������� ����� (1 ����) ��� ����� *)
  ET_INTR:
   Result := PSmallInt(aData)^;   (* ������� - ����� �� ������ *)
  ET_WORD:
   Result := PWord(aData)^;   (* ������� - ����� ��� ����� *)
//  ET_DATE = 5;   (* ����    - ����� ��� ����� *)
//  ET_NMBR = 6;   (* �����   - 3-� �������� ����� ��� ����� *)
  ET_LONG:
   Result := PLongInt(aData)^;   (* ������� - ������� ����� �� ������ *)
  ET_DWRD:
   Result := PLongWord(aData)^;   (* ������� - ������� ����� ��� ����� *)
//  ET_FLOA = 9;   (* ������� - single *)
//  ET_CURR =10;   (* ������  - double *)
//  ET_DFLT =11;   (* ������� - double *)
 else
  Assert(False);
 end;
//#UC END# *55C89BDC012F_55599B5C014A_impl*
end;//ThtDataConverter.ToStTime

function ThtDataConverter.ToString(aData: Pointer;
 const aDesc: OPEL): AnsiString;
//#UC START# *55FA9B9301D7_55599B5C014A_var*
//#UC END# *55FA9B9301D7_55599B5C014A_var*
begin
//#UC START# *55FA9B9301D7_55599B5C014A_impl*
 Result := '';
 case aDesc.nType of
  ET_CHAR:
   Result := MakeString(aData, aDesc);
//  ET_ARRA = 1;   (* ������ ������ �������� ����� *)
  ET_BYTE:
   Result := IntToStr(PByte(aData)^);   (* ������� - �������� ����� (1 ����) ��� ����� *)
  ET_INTR:
   Result := IntToStr(PSmallInt(aData)^);   (* ������� - ����� �� ������ *)
  ET_WORD:
   Result := IntToStr(PWord(aData)^);   (* ������� - ����� ��� ����� *)
//  ET_DATE = 5;   (* ����    - ����� ��� ����� *)
//  ET_NMBR = 6;   (* �����   - 3-� �������� ����� ��� ����� *)
  ET_LONG:
   Result := IntToStr(PLongInt(aData)^);   (* ������� - ������� ����� �� ������ *)
  ET_DWRD:
   Result := IntToStr(PLongWord(aData)^);   (* ������� - ������� ����� ��� ����� *)
//  ET_FLOA = 9;   (* ������� - single *)
//  ET_CURR =10;   (* ������  - double *)
//  ET_DFLT =11;   (* ������� - double *)
 else
  Assert(False);
 end;
//#UC END# *55FA9B9301D7_55599B5C014A_impl*
end;//ThtDataConverter.ToString

function ThtDataConverter.ToByte(aData: Pointer;
 const aDesc: OPEL): Byte;
//#UC START# *562E0F8F02F3_55599B5C014A_var*
//#UC END# *562E0F8F02F3_55599B5C014A_var*
begin
//#UC START# *562E0F8F02F3_55599B5C014A_impl*
 Result := 0;
 case aDesc.nType of
  ET_CHAR:
   Result := StrToInt(MakeString(aData, aDesc));
//  ET_ARRA = 1;   (* ������ ������ �������� ����� *)
  ET_BYTE:
   Result := PByte(aData)^;   (* ������� - �������� ����� (1 ����) ��� ����� *)
  ET_INTR:
   Result := PSmallInt(aData)^;   (* ������� - ����� �� ������ *)
  ET_WORD:
   Result := PWord(aData)^;   (* ������� - ����� ��� ����� *)
//  ET_DATE = 5;   (* ����    - ����� ��� ����� *)
//  ET_NMBR = 6;   (* �����   - 3-� �������� ����� ��� ����� *)
  ET_LONG:
   Result := PLongInt(aData)^;   (* ������� - ������� ����� �� ������ *)
  ET_DWRD:
   Result := PLongWord(aData)^;   (* ������� - ������� ����� ��� ����� *)
//  ET_FLOA = 9;   (* ������� - single *)
//  ET_CURR =10;   (* ������  - double *)
//  ET_DFLT =11;   (* ������� - double *)
 else
  Assert(False);
 end;
//#UC END# *562E0F8F02F3_55599B5C014A_impl*
end;//ThtDataConverter.ToByte

end.
