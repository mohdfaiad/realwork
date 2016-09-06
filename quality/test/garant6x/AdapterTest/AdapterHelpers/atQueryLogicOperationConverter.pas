unit atQueryLogicOperationConverter;

// ������: "w:\quality\test\garant6x\AdapterTest\AdapterHelpers\atQueryLogicOperationConverter.pas"
// ���������: "SimpleClass"
// ������� ������: "TatQueryLogicOperationConverter" MUID: (50045C090310)

interface

uses
 l3IntfUses
 , SearchUnit
 , SysUtils
;

type
 _EnumType_ = TQueryLogicOperation;
 {$Include w:\quality\test\garant6x\AdapterTest\CoreObjects\atEnumConverter.imp.pas}
 TatQueryLogicOperationConverter = class(_atEnumConverter_)
  public
   class function Instance: TatQueryLogicOperationConverter;
    {* ����� ��������� ���������� ���������� TatQueryLogicOperationConverter }
   class function Exists: Boolean;
    {* ��������� ������ ��������� ���������� ��� ��� }
 end;//TatQueryLogicOperationConverter

implementation

uses
 l3ImplUses
 , TypInfo
 , l3Base
 //#UC START# *50045C090310impl_uses*
 //#UC END# *50045C090310impl_uses*
;

var g_TatQueryLogicOperationConverter: TatQueryLogicOperationConverter = nil;
 {* ��������� ���������� TatQueryLogicOperationConverter }

procedure TatQueryLogicOperationConverterFree;
 {* ����� ������������ ���������� ���������� TatQueryLogicOperationConverter }
begin
 l3Free(g_TatQueryLogicOperationConverter);
end;//TatQueryLogicOperationConverterFree

{$Include w:\quality\test\garant6x\AdapterTest\CoreObjects\atEnumConverter.imp.pas}

class function TatQueryLogicOperationConverter.Instance: TatQueryLogicOperationConverter;
 {* ����� ��������� ���������� ���������� TatQueryLogicOperationConverter }
begin
 if (g_TatQueryLogicOperationConverter = nil) then
 begin
  l3System.AddExitProc(TatQueryLogicOperationConverterFree);
  g_TatQueryLogicOperationConverter := Create;
 end;
 Result := g_TatQueryLogicOperationConverter;
end;//TatQueryLogicOperationConverter.Instance

class function TatQueryLogicOperationConverter.Exists: Boolean;
 {* ��������� ������ ��������� ���������� ��� ��� }
begin
 Result := g_TatQueryLogicOperationConverter <> nil;
end;//TatQueryLogicOperationConverter.Exists

initialization
{$Include w:\quality\test\garant6x\AdapterTest\CoreObjects\atEnumConverter.imp.pas}


end.
