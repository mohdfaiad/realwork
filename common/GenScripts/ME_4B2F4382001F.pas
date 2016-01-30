unit l3CardinalList;
 {* ������, ���������� Cardinal }

// ������: "w:\common\components\rtl\Garant\L3\l3CardinalList.pas"
// ���������: "SimpleClass"

{$Include l3Define.inc}

interface

uses
 l3IntfUses
 , l3ProtoDataContainer
 , l3Memory
 , l3Types
 , l3Interfaces
 , l3Core
 , l3Except
 , Classes
;

type
 _ItemType_ = Cardinal;
 _l3AtomicList_Parent_ = Tl3ProtoDataContainer;
 {$Define l3Items_IsProto}
 {$Include l3AtomicList.imp.pas}
 Tl3CardinalList = class(_l3AtomicList_)
  {* ������, ���������� Cardinal }
 end;//Tl3CardinalList

implementation

uses
 l3ImplUses
 , l3Base
 , l3MinMax
 , RTLConsts
 , SysUtils
;

type _Instance_R_ = Tl3CardinalList;

{$Include l3AtomicList.imp.pas}

end.
