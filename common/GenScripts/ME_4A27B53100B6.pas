unit NOT_FINISHED_evControlsBlockHotSpotTester;

// ������: "w:\common\components\gui\Garant\Everest\NOT_FINISHED_evControlsBlockHotSpotTester.pas"
// ���������: "SimpleClass"

{$Include evDefine.inc}

interface

{$If Defined(evNeedHotSpot) AND NOT Defined(evCanEditControlsAsText)}
uses
 l3IntfUses
 , evControlsBlockHotSpotTesterPrim
;

type
 TevControlsBlockHotSpotTester = class(TevControlsBlockHotSpotTesterPrim)
 end;//TevControlsBlockHotSpotTester
{$IfEnd} // Defined(evNeedHotSpot) AND NOT Defined(evCanEditControlsAsText)

implementation

{$If Defined(evNeedHotSpot) AND NOT Defined(evCanEditControlsAsText)}
uses
 l3ImplUses
;
{$IfEnd} // Defined(evNeedHotSpot) AND NOT Defined(evCanEditControlsAsText)

end.
