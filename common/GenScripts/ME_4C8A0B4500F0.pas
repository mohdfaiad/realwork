unit PrimUserPropertyOptions_Form;

// ������: "w:\garant6x\implementation\Garant\GbaNemesis\View\Admin\Forms\PrimUserPropertyOptions_Form.pas"
// ���������: "VCMForm"

{$Include w:\garant6x\implementation\Garant\nsDefine.inc}

interface

{$If Defined(Admin)}
uses
 l3IntfUses
 , PrimUserProperty_Form
 {$If NOT Defined(NoVCM)}
 , OfficeLike_Result_Controls
 {$IfEnd} // NOT Defined(NoVCM)
 , Admin_Users_Controls
;

type
 TPrimUserPropertyOptionsForm = class(TPrimUserPropertyForm)
  public
   {$If NOT Defined(NoVCM)}
   procedure Result_Cancel_Test(const aParams: IvcmTestParamsPrim);
    {* ������ }
   {$IfEnd} // NOT Defined(NoVCM)
   {$If NOT Defined(NoVCM)}
   procedure Result_Cancel_Execute(const aParams: IvcmExecuteParamsPrim);
    {* ������ }
   {$IfEnd} // NOT Defined(NoVCM)
   procedure Result_Save_Test(const aParams: IvcmTestParamsPrim);
    {* ��������� }
   procedure Result_Save_Execute(const aParams: IvcmExecuteParamsPrim);
    {* ��������� }
   procedure Result_Save_GetState(var State: TvcmOperationStateIndex);
    {* ��������� }
 end;//TPrimUserPropertyOptionsForm
{$IfEnd} // Defined(Admin)

implementation

{$If Defined(Admin)}
uses
 l3ImplUses
 {$If NOT Defined(NoScripts)}
 , TtfwClassRef_Proxy
 {$IfEnd} // NOT Defined(NoScripts)
;

{$If NOT Defined(NoVCM)}
procedure TPrimUserPropertyOptionsForm.Result_Cancel_Test(const aParams: IvcmTestParamsPrim);
 {* ������ }
//#UC START# *4C762C910358_4C8A0B4500F0test_var*
//#UC END# *4C762C910358_4C8A0B4500F0test_var*
begin
//#UC START# *4C762C910358_4C8A0B4500F0test_impl*
 aParams.Op.Flag[vcm_ofEnabled] := Assigned(dsUserProperty) and dsUserProperty.IsChanged;
//#UC END# *4C762C910358_4C8A0B4500F0test_impl*
end;//TPrimUserPropertyOptionsForm.Result_Cancel_Test
{$IfEnd} // NOT Defined(NoVCM)

{$If NOT Defined(NoVCM)}
procedure TPrimUserPropertyOptionsForm.Result_Cancel_Execute(const aParams: IvcmExecuteParamsPrim);
 {* ������ }
//#UC START# *4C762C910358_4C8A0B4500F0exec_var*
var
 l_NeedNotify: Boolean;
//#UC END# *4C762C910358_4C8A0B4500F0exec_var*
begin
//#UC START# *4C762C910358_4C8A0B4500F0exec_impl*
 l_NeedNotify := Assigned(dsUserProperty) and dsUserProperty.IsNewUser;
 RestoreFields;
 if l_NeedNotify then
  dsUserProperty.CreateUserFinished(False);
//#UC END# *4C762C910358_4C8A0B4500F0exec_impl*
end;//TPrimUserPropertyOptionsForm.Result_Cancel_Execute
{$IfEnd} // NOT Defined(NoVCM)

procedure TPrimUserPropertyOptionsForm.Result_Save_Test(const aParams: IvcmTestParamsPrim);
 {* ��������� }
//#UC START# *4C7BB8DD0057_4C8A0B4500F0test_var*
//#UC END# *4C7BB8DD0057_4C8A0B4500F0test_var*
begin
//#UC START# *4C7BB8DD0057_4C8A0B4500F0test_impl*
 aParams.Op.Flag[vcm_ofEnabled] := f_IsCorrectInfo and Assigned(dsUserProperty) and dsUserProperty.IsChanged;
//#UC END# *4C7BB8DD0057_4C8A0B4500F0test_impl*
end;//TPrimUserPropertyOptionsForm.Result_Save_Test

procedure TPrimUserPropertyOptionsForm.Result_Save_Execute(const aParams: IvcmExecuteParamsPrim);
 {* ��������� }
//#UC START# *4C7BB8DD0057_4C8A0B4500F0exec_var*
//#UC END# *4C7BB8DD0057_4C8A0B4500F0exec_var*
begin
//#UC START# *4C7BB8DD0057_4C8A0B4500F0exec_impl*
 SaveChangedProfile(dsUserProperty);
//#UC END# *4C7BB8DD0057_4C8A0B4500F0exec_impl*
end;//TPrimUserPropertyOptionsForm.Result_Save_Execute

procedure TPrimUserPropertyOptionsForm.Result_Save_GetState(var State: TvcmOperationStateIndex);
 {* ��������� }
//#UC START# *4C7BB8DD0057_4C8A0B4500F0getstate_var*
//#UC END# *4C7BB8DD0057_4C8A0B4500F0getstate_var*
begin
//#UC START# *4C7BB8DD0057_4C8A0B4500F0getstate_impl*
 if Assigned(dsUserProperty) and dsUserProperty.IsNewUser then
  State := st_user_Result_Save_Create
 else
  State := vcm_DefaultOperationState;
//#UC END# *4C7BB8DD0057_4C8A0B4500F0getstate_impl*
end;//TPrimUserPropertyOptionsForm.Result_Save_GetState

initialization
{$If NOT Defined(NoScripts)}
 TtfwClassRef.Register(TPrimUserPropertyOptionsForm);
 {* ����������� PrimUserPropertyOptions }
{$IfEnd} // NOT Defined(NoScripts)
{$IfEnd} // Defined(Admin)

end.
