unit NOT_FINISHED_evLinePainter;

// ������: "w:\common\components\gui\Garant\Everest\NOT_FINISHED_evLinePainter.pas"
// ���������: "SimpleClass"

{$Include evDefine.inc}

interface

{$If Defined(evNeedPainters)}
uses
 l3IntfUses
;

type
 TevLinePainter = class
 end;//TevLinePainter
{$IfEnd} // Defined(evNeedPainters)

implementation

{$If Defined(evNeedPainters)}
uses
 l3ImplUses
;
{$IfEnd} // Defined(evNeedPainters)

end.
