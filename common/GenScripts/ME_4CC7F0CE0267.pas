unit PrimBaseSearchOptions_Form;

// ������: "w:\garant6x\implementation\Garant\GbaNemesis\View\BaseSearch\Forms\PrimBaseSearchOptions_Form.pas"
// ���������: "VCMForm"

{$Include w:\garant6x\implementation\Garant\nsDefine.inc}

interface

{$If NOT Defined(Admin) AND NOT Defined(Monitorings)}
uses
 l3IntfUses
 , PrimBaseSearch_Form
 {$If NOT Defined(NoVCM)}
 , OfficeLike_Text_Controls
 {$IfEnd} // NOT Defined(NoVCM)
;

type
 TPrimBaseSearchOptionsForm = class(TPrimBaseSearchForm)
  public
   {$If NOT Defined(NoVCM)}
   procedure Edit_FindNext_Test(const aParams: IvcmTestParamsPrim);
    {* ����� ����� }
   {$IfEnd} // NOT Defined(NoVCM)
   {$If NOT Defined(NoVCM)}
   procedure Edit_FindNext_Execute(const aParams: IvcmExecuteParamsPrim);
    {* ����� ����� }
   {$IfEnd} // NOT Defined(NoVCM)
   {$If NOT Defined(NoVCM)}
   procedure Edit_FindPrev_Test(const aParams: IvcmTestParamsPrim);
   {$IfEnd} // NOT Defined(NoVCM)
   {$If NOT Defined(NoVCM)}
   procedure Edit_FindPrev_Execute(const aParams: IvcmExecuteParamsPrim);
   {$IfEnd} // NOT Defined(NoVCM)
 end;//TPrimBaseSearchOptionsForm
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
procedure TPrimBaseSearchOptionsForm.Edit_FindNext_Test(const aParams: IvcmTestParamsPrim);
 {* ����� ����� }
//#UC START# *495130C40123_4CC7F0CE0267test_var*
//#UC END# *495130C40123_4CC7F0CE0267test_var*
begin
//#UC START# *495130C40123_4CC7F0CE0267test_impl*
 // - ������ �� ������
//#UC END# *495130C40123_4CC7F0CE0267test_impl*
end;//TPrimBaseSearchOptionsForm.Edit_FindNext_Test
{$IfEnd} // NOT Defined(NoVCM)

{$If NOT Defined(NoVCM)}
procedure TPrimBaseSearchOptionsForm.Edit_FindNext_Execute(const aParams: IvcmExecuteParamsPrim);
 {* ����� ����� }
//#UC START# *495130C40123_4CC7F0CE0267exec_var*
//#UC END# *495130C40123_4CC7F0CE0267exec_var*
begin
//#UC START# *495130C40123_4CC7F0CE0267exec_impl*
 DoFindBtnClick;
//#UC END# *495130C40123_4CC7F0CE0267exec_impl*
end;//TPrimBaseSearchOptionsForm.Edit_FindNext_Execute
{$IfEnd} // NOT Defined(NoVCM)

{$If NOT Defined(NoVCM)}
procedure TPrimBaseSearchOptionsForm.Edit_FindPrev_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *49FEDE4703B8_4CC7F0CE0267test_var*
//#UC END# *49FEDE4703B8_4CC7F0CE0267test_var*
begin
//#UC START# *49FEDE4703B8_4CC7F0CE0267test_impl*
 aParams.Op.Flag[vcm_ofEnabled] := Assigned(f_BaseSearcher) and f_BaseSearcher.WindowData.FindBackEnabled;
//#UC END# *49FEDE4703B8_4CC7F0CE0267test_impl*
end;//TPrimBaseSearchOptionsForm.Edit_FindPrev_Test
{$IfEnd} // NOT Defined(NoVCM)

{$If NOT Defined(NoVCM)}
procedure TPrimBaseSearchOptionsForm.Edit_FindPrev_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *49FEDE4703B8_4CC7F0CE0267exec_var*
//#UC END# *49FEDE4703B8_4CC7F0CE0267exec_var*
begin
//#UC START# *49FEDE4703B8_4CC7F0CE0267exec_impl*
 DoFindBackBtnClick;
//#UC END# *49FEDE4703B8_4CC7F0CE0267exec_impl*
end;//TPrimBaseSearchOptionsForm.Edit_FindPrev_Execute
{$IfEnd} // NOT Defined(NoVCM)

initialization
{$If NOT Defined(NoScripts)}
 TtfwClassRef.Register(TPrimBaseSearchOptionsForm);
 {* ����������� PrimBaseSearchOptions }
{$IfEnd} // NOT Defined(NoScripts)
{$IfEnd} // NOT Defined(Admin) AND NOT Defined(Monitorings)

end.
