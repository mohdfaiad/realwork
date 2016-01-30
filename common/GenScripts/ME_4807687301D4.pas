unit Contnrs;

// ������: "w:\common\components\rtl\external\NotFinished\Borland\Delphi\Rtl\Common\Contnrs.pas"
// ���������: "UtilityPack"

interface

uses
 l3IntfUses
 , Classes
;

type
 TObjectList = class(TList)
  {* TObjectList maintains a list of (owned) objects. }
 end;//TObjectList

 TOrderedList = class(TObject)
  {* TOrderedList maintains an array of pointers that must be accessed in serial order. }
 end;//TOrderedList

 TStack = class(TOrderedList)
  {* TStack maintains a last-in first-out array of pointers. }
 end;//TStack

 TBucketList = class(TObject)
  {* TBucketList is a simple hash table that stores pointers indexed by pointers. }
 end;//TBucketList

implementation

uses
 l3ImplUses
;

end.
