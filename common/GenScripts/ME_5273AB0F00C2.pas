unit k2TypesByHandleList;

// ������: "w:\common\components\rtl\Garant\K2\k2TypesByHandleList.pas"
// ���������: "SimpleClass"

{$Include k2Define.inc}

interface

uses
 l3IntfUses
 , l3ProtoDataContainer
 , k2Base
 , l3Memory
 , l3Types
 , l3Interfaces
 , l3Core
 , l3Except
 , Classes
;

 {$Define l3Items_NoSort}

type
 _ItemType_ = Tk2Type;
 _l3UnrefcountedList_Parent_ = Tl3ProtoDataContainer;
 {$Define l3Items_IsProto}
 {$Include l3UnrefcountedList.imp.pas}
 _l3OpenArray_Parent_ = _l3UnrefcountedList_;
 {$Include l3OpenArray.imp.pas}
 Tk2TypesByHandleList = class(_l3OpenArray_)
 end;//Tk2TypesByHandleList

implementation

uses
 l3ImplUses
 , l3Base
 , l3MinMax
 , RTLConsts
 , SysUtils
;

function CompareExistingItems(const CI: CompareItemsRec): Integer;
 {* ���������� ��� ������������ ��������. }
//#UC START# *47B99D4503A2_5273AB0F00C2_var*
//#UC END# *47B99D4503A2_5273AB0F00C2_var*
begin
//#UC START# *47B99D4503A2_5273AB0F00C2_impl*
 Assert(false);
 Result := -1;
//#UC END# *47B99D4503A2_5273AB0F00C2_impl*
end;//CompareExistingItems

type _Instance_R_ = Tk2TypesByHandleList;

{$Include l3UnrefcountedList.imp.pas}

{$Include l3OpenArray.imp.pas}

end.
