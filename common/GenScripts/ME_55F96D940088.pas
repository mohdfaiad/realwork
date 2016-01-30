unit vcmLockListenerList;

// ������: "w:\common\components\gui\Garant\VCM\implementation\vcmLockListenerList.pas"
// ���������: "SimpleClass"

{$Include vcmDefine.inc}

interface

{$If NOT Defined(NoVCM)}
uses
 l3IntfUses
 , l3ProtoDataContainer
 , vcmInterfaces
 , l3Memory
 , l3Types
 , l3Interfaces
 , l3Core
 , l3Except
 , Classes
;

type
 _ItemType_ = IvcmLockListener;
 _l3InterfacePtrList_Parent_ = Tl3ProtoDataContainer;
 {$Define l3Items_IsProto}
 {$Include l3InterfacePtrList.imp.pas}
 TvcmLockListenerList = class(_l3InterfacePtrList_)
 end;//TvcmLockListenerList
{$IfEnd} // NOT Defined(NoVCM)

implementation

{$If NOT Defined(NoVCM)}
uses
 l3ImplUses
 , l3Base
 , l3MinMax
 , RTLConsts
 , SysUtils
;

type _Instance_R_ = TvcmLockListenerList;

{$Include l3InterfacePtrList.imp.pas}
{$IfEnd} // NOT Defined(NoVCM)

end.
