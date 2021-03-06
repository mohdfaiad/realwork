unit InsContextSearchHistoryNotifierList;

// ������: "w:\garant6x\implementation\Garant\GbaNemesis\rtl\Garant\ContextHistory\InsContextSearchHistoryNotifierList.pas"
// ���������: "SimpleClass"
// ������� ������: "TInsContextSearchHistoryNotifierList" MUID: (4AD83627037B)

{$Include w:\garant6x\implementation\Garant\nsDefine.inc}

interface

{$If NOT Defined(Admin)}
uses
 l3IntfUses
 , l3SimpleDataContainer
 , ContextHistoryInterfaces
 , l3Memory
 , l3Types
 , l3Interfaces
 , l3Core
 , l3Except
 , Classes
;

type
 _ItemType_ = InsContextSearchHistoryNotifier;
 _l3InterfacePtrList_Parent_ = Tl3SimpleDataContainer;
 {$Define l3Items_IsProto}
 {$Include w:\common\components\rtl\Garant\L3\l3InterfacePtrList.imp.pas}
 TInsContextSearchHistoryNotifierList = class(_l3InterfacePtrList_)
 end;//TInsContextSearchHistoryNotifierList
{$IfEnd} // NOT Defined(Admin)

implementation

{$If NOT Defined(Admin)}
uses
 l3ImplUses
 , l3Base
 , l3MinMax
 , RTLConsts
 , SysUtils
 //#UC START# *4AD83627037Bimpl_uses*
 //#UC END# *4AD83627037Bimpl_uses*
;

type _Instance_R_ = TInsContextSearchHistoryNotifierList;

{$Include w:\common\components\rtl\Garant\L3\l3InterfacePtrList.imp.pas}
{$IfEnd} // NOT Defined(Admin)

end.
