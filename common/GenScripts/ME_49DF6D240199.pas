unit evBitmapParaCursor;

// ������: "w:\common\components\gui\Garant\Everest\evBitmapParaCursor.pas"
// ���������: "SimpleClass"

{$Include evDefine.inc}

interface

{$If Defined(evUseVisibleCursors)}
uses
 l3IntfUses
 , evSolidParaCursor
;

type
 TevBitmapParaCursor = class(TevSolidParaCursor)
  protected
   function GetNeedWindowsCaret: Boolean; override;
 end;//TevBitmapParaCursor
{$IfEnd} // Defined(evUseVisibleCursors)

implementation

{$If Defined(evUseVisibleCursors)}
uses
 l3ImplUses
;

function TevBitmapParaCursor.GetNeedWindowsCaret: Boolean;
//#UC START# *49E34A6301AC_49DF6D240199_var*
//#UC END# *49E34A6301AC_49DF6D240199_var*
begin
//#UC START# *49E34A6301AC_49DF6D240199_impl*
 Result := false;
//#UC END# *49E34A6301AC_49DF6D240199_impl*
end;//TevBitmapParaCursor.GetNeedWindowsCaret
{$IfEnd} // Defined(evUseVisibleCursors)

end.
