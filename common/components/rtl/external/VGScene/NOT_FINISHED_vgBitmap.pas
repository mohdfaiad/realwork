unit NOT_FINISHED_vgBitmap;

// ������: "w:\common\components\rtl\external\VGScene\NOT_FINISHED_vgBitmap.pas"
// ���������: "SimpleClass"
// ������� ������: "TvgBitmap" MUID: (4D5415920189)

{$Include w:\common\components\rtl\external\VGScene\vg_define.inc}

interface

{$If NOT Defined(NoVGScene)}
uses
 l3IntfUses
 , vgCustomBitmap
 , vgObject
;

type
 TvgBitmapObject = class(TvgObject)
 end;//TvgBitmapObject

 TvgBitmap = class(TvgCustomBitmap)
 end;//TvgBitmap
{$IfEnd} // NOT Defined(NoVGScene)

implementation

{$If NOT Defined(NoVGScene)}
uses
 l3ImplUses
 {$If NOT Defined(NoScripts)}
 , TtfwClassRef_Proxy
 {$IfEnd} // NOT Defined(NoScripts)
 //#UC START# *4D5415920189impl_uses*
 //#UC END# *4D5415920189impl_uses*
;

initialization
{$If NOT Defined(NoScripts)}
 TtfwClassRef.Register(TvgBitmapObject);
 {* ����������� TvgBitmapObject }
{$IfEnd} // NOT Defined(NoScripts)
{$IfEnd} // NOT Defined(NoVGScene)

end.
