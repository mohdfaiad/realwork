unit Base_Operations_Chat_Controls;
 {* ��� }

// ������: "w:\garant6x\implementation\Garant\GbaNemesis\View\Base_Operations_Chat_Controls.pas"
// ���������: "VCMControls"

{$Include nsDefine.inc}

interface

{$If NOT Defined(Admin) AND NOT Defined(Monitorings)}
uses
 l3IntfUses
;

type
 // Chat

 // History

 // UserFilter

 // OpenChatWindow

 // Chat
{$IfEnd} // NOT Defined(Admin) AND NOT Defined(Monitorings)

implementation

{$If NOT Defined(Admin) AND NOT Defined(Monitorings)}
uses
 l3ImplUses
;
{$IfEnd} // NOT Defined(Admin) AND NOT Defined(Monitorings)

end.
