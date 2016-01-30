unit vcmEntitiesDefList;

// ������: "w:\common\components\gui\Garant\VCM\implementation\vcmEntitiesDefList.pas"
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
 _ItemType_ = IvcmEntityDef;
 _l3InterfaceRefList_Parent_ = Tl3ProtoDataContainer;
 {$Define l3Items_IsProto}
 {$Include l3InterfaceRefList.imp.pas}
 TvcmEntitiesDefList = class(_l3InterfaceRefList_)
 end;//TvcmEntitiesDefList
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

type _Instance_R_ = TvcmEntitiesDefList;

{$Include l3InterfaceRefList.imp.pas}
{$IfEnd} // NOT Defined(NoVCM)

end.
