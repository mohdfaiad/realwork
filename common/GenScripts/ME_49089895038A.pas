unit Il3ContextFilterParamsNotifierPtrList;
 {* ������ ���������� �� Il3ContextFilterParamsNotifier }

// ������: "w:\garant6x\implementation\Garant\GbaNemesis\Data\Tree\Il3ContextFilterParamsNotifierPtrList.pas"
// ���������: "SimpleClass"

{$Include nsDefine.inc}

interface

uses
 l3IntfUses
 , l3SimpleDataContainer
 , l3TreeInterfaces
 , l3Memory
 , l3Types
 , l3Interfaces
 , l3Core
 , l3Except
 , Classes
;

type
 _ItemType_ = Il3ContextFilterParamsNotifier;
 _l3InterfacePtrList_Parent_ = Tl3SimpleDataContainer;
 {$Define l3Items_IsProto}
 {$Include l3InterfacePtrList.imp.pas}
 TIl3ContextFilterParamsNotifierPtrList = class(_l3InterfacePtrList_)
  {* ������ ���������� �� Il3ContextFilterParamsNotifier }
 end;//TIl3ContextFilterParamsNotifierPtrList

implementation

uses
 l3ImplUses
 , l3Base
 , l3MinMax
 , RTLConsts
 , SysUtils
;

type _Instance_R_ = TIl3ContextFilterParamsNotifierPtrList;

{$Include l3InterfacePtrList.imp.pas}

end.
