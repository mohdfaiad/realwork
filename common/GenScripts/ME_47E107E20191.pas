unit afwPreviewPageList;

// ������: "w:\common\components\gui\Garant\AFW\implementation\Visual\afwPreviewPageList.pas"
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
 _ItemType_ = IafwPreviewPage;
 _l3InterfaceRefList_Parent_ = Tl3ProtoDataContainer;
 {$Define l3Items_IsProto}
 {$Include l3InterfaceRefList.imp.pas}
 TafwPreviewPageList = class(_l3InterfaceRefList_)
 end;//TafwPreviewPageList

implementation

uses
 l3ImplUses
 , l3Base
 , l3MinMax
 , RTLConsts
 , SysUtils
;

type _Instance_R_ = TafwPreviewPageList;

{$Include l3InterfaceRefList.imp.pas}

end.
