unit Menu_p;

// ������: "w:\common\components\gui\Garant\AFW\Menu_p.pas"
// ���������: "TestClass"

{$Include l3Define.inc}

interface

{$If NOT Defined(XE)}
uses
 l3IntfUses
 {$If NOT Defined(NoVCL)}
 , Menus
 {$IfEnd} // NOT Defined(NoVCL)
;

type
 // TMenu
{$IfEnd} // NOT Defined(XE)

implementation

{$If NOT Defined(XE)}
uses
 l3ImplUses
;

initialization
 _RegisterPublicInformation5;
 _RegisterPublicInformation6;
{$IfEnd} // NOT Defined(XE)

end.
