unit k2PropertyArray;

// ������: "w:\common\components\rtl\Garant\K2\k2PropertyArray.pas"
// ���������: "SimpleClass"

{$Include k2Define.inc}

interface

uses
 l3IntfUses
 , l3ProtoDataContainer
 , l3Variant
 , l3Memory
 , l3Types
 , l3Interfaces
 , l3Core
 , l3Except
 , Classes
;

 {$Define l3Items_NoSort}

type
 _ItemType_ = Tl3VariantDef;
 _l3UncomparabeObjectRefList_Parent_ = Tl3ProtoDataContainer;
 {$Define l3Items_IsProto}
 {$Include l3UncomparabeObjectRefList.imp.pas}
 _l3OpenArray_Parent_ = _l3UncomparabeObjectRefList_;
 {$Include l3OpenArray.imp.pas}
 Tk2PropertyArray = class(_l3OpenArray_)
 end;//Tk2PropertyArray

implementation

uses
 l3ImplUses
 , l3Base
 , l3MinMax
 , RTLConsts
 , SysUtils
;

function CompareExistingItems(const CI: CompareItemsRec): Integer; forward;

{$If Defined(l3Items_NeedsAssignItem) AND NOT Defined(l3Items_NoSort)}
procedure AssignItem(const aTo: _ItemType_;
 const aFrom: _ItemType_);
//#UC START# *47B2C42A0163_53AABF30022F_var*
//#UC END# *47B2C42A0163_53AABF30022F_var*
begin
//#UC START# *47B2C42A0163_53AABF30022F_impl*
 !!! Needs to be implemented !!!
//#UC END# *47B2C42A0163_53AABF30022F_impl*
end;//AssignItem
{$IfEnd} // Defined(l3Items_NeedsAssignItem) AND NOT Defined(l3Items_NoSort)

function CompareExistingItems(const CI: CompareItemsRec): Integer;
 {* ���������� ��� ������������ ��������. }
//#UC START# *47B99D4503A2_53AABF30022F_var*
//#UC END# *47B99D4503A2_53AABF30022F_var*
begin
//#UC START# *47B99D4503A2_53AABF30022F_impl*
 Result := -1;
 Assert(false);
//#UC END# *47B99D4503A2_53AABF30022F_impl*
end;//CompareExistingItems

type _Instance_R_ = Tk2PropertyArray;

{$Include l3UncomparabeObjectRefList.imp.pas}

{$Include l3OpenArray.imp.pas}

end.
