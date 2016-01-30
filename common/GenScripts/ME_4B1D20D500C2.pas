unit evBreakParaCursor;

// ������: "w:\common\components\gui\Garant\Everest\evBreakParaCursor.pas"
// ���������: "SimpleClass"

{$Include evDefine.inc}

interface

{$If Defined(evUseVisibleCursors)}
uses
 l3IntfUses
 , evSolidParaCursor
 , nevTools
;

type
 _nevBreakParaAnchorModify_Parent_ = TevSolidParaCursor;
 {$Include nevBreakParaAnchorModify.imp.pas}
 TevBreakParaCursor = class(_nevBreakParaAnchorModify_)
 end;//TevBreakParaCursor
{$IfEnd} // Defined(evUseVisibleCursors)

implementation

{$If Defined(evUseVisibleCursors)}
uses
 l3ImplUses
;

{$Include nevBreakParaAnchorModify.imp.pas}
{$IfEnd} // Defined(evUseVisibleCursors)

end.
