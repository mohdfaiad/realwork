unit NOT_FINISHED_csTaskRequest;

// ������: "w:\common\components\rtl\Garant\cs\NOT_FINISHED_csTaskRequest.pas"
// ���������: "UtilityPack"

{$Include CsDefine.inc}

interface

{$If NOT Defined(Nemesis)}
uses
 l3IntfUses
 , ddGetTaskRequestPrim
 , ddTaskResultRequestPrim
;

type
 TddGetTaskRequest = class(TddGetTaskRequestPrim)
 end;//TddGetTaskRequest

 TddTaskResultRequest = class(TddTaskResultRequestPrim)
 end;//TddTaskResultRequest
{$IfEnd} // NOT Defined(Nemesis)

implementation

{$If NOT Defined(Nemesis)}
uses
 l3ImplUses
;
{$IfEnd} // NOT Defined(Nemesis)

end.
