unit IafwSettingsReplaceListenerPtrList;
 {* ������ ���������� �� IafwSettingsReplaceListener }

// ������: "w:\common\components\gui\Garant\AFW\IafwSettingsReplaceListenerPtrList.pas"
// ���������: "SimpleClass"

{$Include afwDefine.inc}

interface

uses
 l3IntfUses
 , l3ProtoDataContainer
 , afwInterfaces
 , l3Memory
 , l3Types
 , l3Interfaces
 , l3Core
 , l3Except
 , Classes
;

type
 _ItemType_ = IafwSettingsReplaceListener;
 _l3InterfacePtrList_Parent_ = Tl3ProtoDataContainer;
 {$Define l3Items_IsProto}
 {$Include l3InterfacePtrList.imp.pas}
 TIafwSettingsReplaceListenerPtrList = class(_l3InterfacePtrList_)
  {* ������ ���������� �� IafwSettingsReplaceListener }
 end;//TIafwSettingsReplaceListenerPtrList

implementation

uses
 l3ImplUses
 , l3Base
 , l3MinMax
 , RTLConsts
 , SysUtils
;

type _Instance_R_ = TIafwSettingsReplaceListenerPtrList;

{$Include l3InterfacePtrList.imp.pas}

end.
