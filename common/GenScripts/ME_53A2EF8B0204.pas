unit NOT_FINISHED_ddProgressObj;

// ������: "w:\common\components\rtl\Garant\dd\NOT_FINISHED_ddProgressObj.pas"
// ���������: "UtilityPack"

{$Include ddDefine.inc}

interface

uses
 l3IntfUses
;

type
 TddProgressObject = class
 end;//TddProgressObject

 TddProgressEvent = procedure(Sender: TObject;
  aTotalPercent: Integer) of object;

implementation

uses
 l3ImplUses
;

end.
