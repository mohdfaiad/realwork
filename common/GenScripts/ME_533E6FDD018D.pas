unit vgRectList;

// ������: "w:\common\components\rtl\external\VGScene\vgRectList.pas"
// ���������: "SimpleClass"

{$Include vg_define.inc}

interface

{$If NOT Defined(NoVGScene)}
uses
 l3IntfUses
 , l3ProtoDataContainer
 , vg_scene
 , l3Memory
 , l3Types
 , l3Interfaces
 , l3Core
 , l3Except
 , Classes
;

type
 _ItemType_ = TvgRect;
 _l3RecordListPrim_Parent_ = Tl3ProtoDataContainer;
 {$Define l3Items_IsProto}
 {$Include l3RecordListPrim.imp.pas}
 TvgRectList = class(_l3RecordListPrim_)
 end;//TvgRectList
{$IfEnd} // NOT Defined(NoVGScene)

implementation

{$If NOT Defined(NoVGScene)}
uses
 l3ImplUses
 , l3Base
 , l3MinMax
 , RTLConsts
 , SysUtils
;

{$If Defined(l3Items_NeedsAssignItem) AND NOT Defined(l3Items_NoSort)}
procedure AssignItem(const aTo: _ItemType_;
 const aFrom: _ItemType_); forward;
{$IfEnd} // Defined(l3Items_NeedsAssignItem) AND NOT Defined(l3Items_NoSort)
function CompareExistingItems(const CI: CompareItemsRec): Integer; forward;

{$If NOT Defined(l3Items_IsAtomic)}
function IsSameItems(const A: _ItemType_;
 const B: _ItemType_): Boolean;
 {* ���������� �������� ������ }
//#UC START# *47B07CF403D0_533E6FDD018D_var*
//#UC END# *47B07CF403D0_533E6FDD018D_var*
begin
//#UC START# *47B07CF403D0_533E6FDD018D_impl*
 Result := false;
 Assert(false);
//#UC END# *47B07CF403D0_533E6FDD018D_impl*
end;//IsSameItems
{$IfEnd} // NOT Defined(l3Items_IsAtomic)

{$If Defined(l3Items_NeedsAssignItem) AND NOT Defined(l3Items_NoSort)}
procedure AssignItem(const aTo: _ItemType_;
 const aFrom: _ItemType_);
//#UC START# *47B2C42A0163_533E6FDD018D_var*
//#UC END# *47B2C42A0163_533E6FDD018D_var*
begin
//#UC START# *47B2C42A0163_533E6FDD018D_impl*
 Assert(false);
//#UC END# *47B2C42A0163_533E6FDD018D_impl*
end;//AssignItem
{$IfEnd} // Defined(l3Items_NeedsAssignItem) AND NOT Defined(l3Items_NoSort)

function CompareExistingItems(const CI: CompareItemsRec): Integer;
 {* ���������� ��� ������������ ��������. }
//#UC START# *47B99D4503A2_533E6FDD018D_var*
//#UC END# *47B99D4503A2_533E6FDD018D_var*
begin
//#UC START# *47B99D4503A2_533E6FDD018D_impl*
 Result := -1;
 Assert(false);
//#UC END# *47B99D4503A2_533E6FDD018D_impl*
end;//CompareExistingItems

type _Instance_R_ = TvgRectList;

{$Include l3RecordListPrim.imp.pas}
{$IfEnd} // NOT Defined(NoVGScene)

end.
