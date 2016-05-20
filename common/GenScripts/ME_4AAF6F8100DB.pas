unit Preview_Form;
 {* ��������������� �������� }

// ������: "w:\garant6x\implementation\Garant\GbaNemesis\View\Search\Forms\Preview_Form.pas"
// ���������: "VCMFinalForm"
// ������� ������: "PreviewForm" MUID: (4AAF6F8100DB)
// ��� ����: "TefPreviewForm"

{$Include w:\garant6x\implementation\Garant\nsDefine.inc}

interface

{$If NOT Defined(Admin)}
uses
 l3IntfUses
 , PrimPreview_Form
 , Search_FormDefinitions_Controls
 {$If NOT Defined(NoVCM)}
 , vcmEntities
 {$IfEnd} // NOT Defined(NoVCM)
;

type
 TefPreviewForm = {final} class(TPrimPreviewForm, PreviewFormDef)
  {* ��������������� �������� }
   Entities : TvcmEntities;
 end;//TefPreviewForm
{$IfEnd} // NOT Defined(Admin)

implementation

{$If NOT Defined(Admin)}
uses
 l3ImplUses
 {$If NOT Defined(NoScripts)}
 , TtfwClassRef_Proxy
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts) AND NOT Defined(NoVCL)}
 , PreviewFormKeywordsPack
 {$IfEnd} // NOT Defined(NoScripts) AND NOT Defined(NoVCL)
 {$If NOT Defined(NoVCM) AND NOT Defined(NoVGScene) AND NOT Defined(NoTabs)}
 , vcmTabbedContainerFormDispatcher
 {$IfEnd} // NOT Defined(NoVCM) AND NOT Defined(NoVGScene) AND NOT Defined(NoTabs)
;

{$R *.DFM}

initialization
{$If NOT Defined(NoScripts)}
 TtfwClassRef.Register(TefPreviewForm);
 {* ����������� PreviewForm }
{$IfEnd} // NOT Defined(NoScripts)
{$IfEnd} // NOT Defined(Admin)

end.
