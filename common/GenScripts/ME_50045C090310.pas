unit atQueryLogicOperationConverter;

// ������: "w:\quality\test\garant6x\AdapterTest\AdapterHelpers\atQueryLogicOperationConverter.pas"
// ���������: "SimpleClass"

interface

uses
 l3IntfUses
 , SearchUnit
;

type
 _EnumType_ = TQueryLogicOperation;
 {$Include atEnumConverter.imp.pas}
 TatQueryLogicOperationConverter = class(_atEnumConverter_)
  public
   class function Exists: Boolean;
    {* ��������� ������ ��������� ���������� ��� ��� }
   class function Instance: TatQueryLogicOperationConverter;
    {* ����� ��������� ���������� ���������� TatQueryLogicOperationConverter }
 end;//TatQueryLogicOperationConverter

implementation

uses
 l3ImplUses
 , TypInfo
 , SysUtils
 , l3Base
;

var g_TatQueryLogicOperationConverter: TatQueryLogicOperationConverter = nil;
 {* ��������� ���������� TatQueryLogicOperationConverter }

procedure TatQueryLogicOperationConverterFree;
 {* ����� ������������ ���������� ���������� TatQueryLogicOperationConverter }
begin
 l3Free(g_TatQueryLogicOperationConverter);
end;//TatQueryLogicOperationConverterFree

{$Include atEnumConverter.imp.pas}

class function TatQueryLogicOperationConverter.Exists: Boolean;
 {* ��������� ������ ��������� ���������� ��� ��� }
begin
 Result := g_TatQueryLogicOperationConverter <> nil;
end;//TatQueryLogicOperationConverter.Exists

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

end.
