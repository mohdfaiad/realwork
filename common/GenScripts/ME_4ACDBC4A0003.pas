unit NOT_FINISHED_imageenview;

// ������: "w:\common\components\rtl\external\ImageEn\src\NOT_FINISHED_imageenview.pas"
// ���������: "UtilityPack"

interface

{$If NOT Defined(NoImageEn)}
uses
 l3IntfUses
;

type
 TImageEnView = class
 end;//TImageEnView
{$IfEnd} // NOT Defined(NoImageEn)

implementation

{$If NOT Defined(NoImageEn)}
uses
 l3ImplUses
 {$If NOT Defined(NoScripts)}
 , TtfwClassRef_Proxy
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , ImageEnPack
 {$IfEnd} // NOT Defined(NoScripts)
;

initialization
{$If NOT Defined(NoScripts)}
 TtfwClassRef.Register(TImageEnView);
 {* ����������� TImageEnView }
{$IfEnd} // NOT Defined(NoScripts)
{$IfEnd} // NOT Defined(NoImageEn)

end.
