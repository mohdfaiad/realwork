unit MedicListSynchroView_Form;
 {* ���������� �������� }

// ������: "w:\garant6x\implementation\Garant\GbaNemesis\View\Inpharm\Forms\MedicListSynchroView_Form.pas"
// ���������: "VCMFinalForm"
// ������� ������: "MedicListSynchroView" MUID: (4AB9E6D40211)
// ��� ����: "Ten_MedicListSynchroView"

{$Include w:\garant6x\implementation\Garant\nsDefine.inc}

interface

{$If NOT Defined(Admin) AND NOT Defined(Monitorings)}
uses
 l3IntfUses
 , PrimMedicListSynchroView_Form
 , Common_FormDefinitions_Controls
 {$If NOT Defined(NoVCM)}
 , vcmEntities
 {$IfEnd} // NOT Defined(NoVCM)
;

type
 Ten_MedicListSynchroView = {final} class(TPrimMedicListSynchroViewForm, MedicListSynchroViewFormDef)
  {* ���������� �������� }
   Entities : TvcmEntities;
 end;//Ten_MedicListSynchroView
{$IfEnd} // NOT Defined(Admin) AND NOT Defined(Monitorings)

implementation

{$If NOT Defined(Admin) AND NOT Defined(Monitorings)}
uses
 l3ImplUses
 {$If NOT Defined(NoScripts)}
 , TtfwClassRef_Proxy
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts) AND NOT Defined(NoVCL)}
 , MedicListSynchroViewKeywordsPack
 {$IfEnd} // NOT Defined(NoScripts) AND NOT Defined(NoVCL)
;

{$R *.DFM}

initialization
 fm_en_MedicListSynchroView.SetFactory(Ten_MedicListSynchroView.Make);
 {* ����������� ������� ����� MedicListSynchroView }
{$If NOT Defined(NoScripts)}
 TtfwClassRef.Register(Ten_MedicListSynchroView);
 {* ����������� MedicListSynchroView }
{$IfEnd} // NOT Defined(NoScripts)
{$IfEnd} // NOT Defined(Admin) AND NOT Defined(Monitorings)

end.
