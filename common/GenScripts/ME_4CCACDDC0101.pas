unit UnderControl_Strange_Controls;

// ������: "w:\garant6x\implementation\Garant\GbaNemesis\View\UnderControl_Strange_Controls.pas"
// ���������: "VCMControls"

{$Include nsDefine.inc}

interface

{$If NOT Defined(Admin) AND NOT Defined(Monitorings)}
uses
 l3IntfUses
;

type
 // Add

 // CreateList

 // Sort

 // ClearAllStatus

 // ControlCenter

 // Open

 // ClearStatus

 // ControledObject
{$IfEnd} // NOT Defined(Admin) AND NOT Defined(Monitorings)

implementation

{$If NOT Defined(Admin) AND NOT Defined(Monitorings)}
uses
 l3ImplUses
;
{$IfEnd} // NOT Defined(Admin) AND NOT Defined(Monitorings)

end.
