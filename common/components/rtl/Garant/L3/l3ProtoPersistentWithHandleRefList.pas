unit l3ProtoPersistentWithHandleRefList;

// ������: "w:\common\components\rtl\Garant\L3\l3ProtoPersistentWithHandleRefList.pas"
// ���������: "SimpleClass"
// ������� ������: "Tl3ProtoPersistentWithHandleRefList" MUID: (52FCCB450032)

{$Include w:\common\components\rtl\Garant\L3\l3Define.inc}

interface

uses
 l3IntfUses
 , l3ProtoPersistentWithHandleRefListPrim
 , l3Types
;

type
 _l3ObjectByHandleSearcher_Parent_ = Tl3ProtoPersistentWithHandleRefListPrim;
 {$Include w:\common\components\rtl\Garant\L3\l3ObjectByHandleSearcher.imp.pas}
 Tl3ProtoPersistentWithHandleRefList = class(_l3ObjectByHandleSearcher_)
 end;//Tl3ProtoPersistentWithHandleRefList

implementation

uses
 l3ImplUses
 , l3ProtoPersistentWithHandle
 , l3Memory
 //#UC START# *52FCCB450032impl_uses*
 //#UC END# *52FCCB450032impl_uses*
;

type _Instance_R_ = Tl3ProtoPersistentWithHandleRefList;

{$Include w:\common\components\rtl\Garant\L3\l3ObjectByHandleSearcher.imp.pas}

end.
