unit PrimOldSituationSearchOptions_Form;
 {* ����� �� �������� }

// ������: "w:\garant6x\implementation\Garant\GbaNemesis\View\Search\Forms\PrimOldSituationSearchOptions_Form.pas"
// ���������: "VCMContainer"

{$Include w:\garant6x\implementation\Garant\nsDefine.inc}

interface

{$If NOT Defined(Admin) AND NOT Defined(Monitorings)}
uses
 l3IntfUses
 , PrimOldSituationSearch_Form
;

type
 TPrimOldSituationSearchOptionsForm = class(TPrimOldSituationSearchForm)
  {* ����� �� �������� }
  public
   {$If NOT Defined(NoVCM)}
   procedure Edit_Delete_GetState(var State: TvcmOperationStateIndex);
    {* ������� }
   {$IfEnd} // NOT Defined(NoVCM)
 end;//TPrimOldSituationSearchOptionsForm
{$IfEnd} // NOT Defined(Admin) AND NOT Defined(Monitorings)

implementation

{$If NOT Defined(Admin) AND NOT Defined(Monitorings)}
uses
 l3ImplUses
 {$If NOT Defined(NoScripts)}
 , TtfwClassRef_Proxy
 {$IfEnd} // NOT Defined(NoScripts)
;

{$If NOT Defined(NoVCM)}
procedure TPrimOldSituationSearchOptionsForm.Edit_Delete_GetState(var State: TvcmOperationStateIndex);
 {* ������� }
//#UC START# *494F89C30197_4C44149E023Fgetstate_var*
//#UC END# *494F89C30197_4C44149E023Fgetstate_var*
begin
//#UC START# *494F89C30197_4C44149E023Fgetstate_impl*
 // - ������ �� ������ 
//#UC END# *494F89C30197_4C44149E023Fgetstate_impl*
end;//TPrimOldSituationSearchOptionsForm.Edit_Delete_GetState
{$IfEnd} // NOT Defined(NoVCM)

initialization
{$If NOT Defined(NoScripts)}
 TtfwClassRef.Register(TPrimOldSituationSearchOptionsForm);
 {* ����������� PrimOldSituationSearchOptions }
{$IfEnd} // NOT Defined(NoScripts)
{$IfEnd} // NOT Defined(Admin) AND NOT Defined(Monitorings)

end.
