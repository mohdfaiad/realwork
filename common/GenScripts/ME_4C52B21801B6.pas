unit PrimStyleEditorContainerOptions_Form;
 {* �������� ������ }

// ������: "w:\garant6x\implementation\Garant\GbaNemesis\View\Settings\Forms\PrimStyleEditorContainerOptions_Form.pas"
// ���������: "VCMContainer"

{$Include w:\garant6x\implementation\Garant\nsDefine.inc}

interface

{$If NOT Defined(Admin) AND NOT Defined(Monitorings)}
uses
 l3IntfUses
 , PrimStyleEditorContainer_Form
 {$If NOT Defined(NoVCM)}
 , OfficeLike_Result_Controls
 {$IfEnd} // NOT Defined(NoVCM)
 , Search_Strange_Controls
;

type
 TPrimStyleEditorContainerOptionsForm = class(TPrimStyleEditorContainerForm)
  {* �������� ������ }
  public
   {$If NOT Defined(NoVCM)}
   procedure Result_Cancel_Execute(const aParams: IvcmExecuteParamsPrim);
    {* ������ }
   {$IfEnd} // NOT Defined(NoVCM)
   {$If NOT Defined(NoVCM)}
   procedure Result_Ok_Test(const aParams: IvcmTestParamsPrim);
    {* OK }
   {$IfEnd} // NOT Defined(NoVCM)
   {$If NOT Defined(NoVCM)}
   procedure Result_Ok_Execute(const aParams: IvcmExecuteParamsPrim);
    {* OK }
   {$IfEnd} // NOT Defined(NoVCM)
   procedure Result_Restore_Test(const aParams: IvcmTestParamsPrim);
   procedure Result_Restore_Execute(const aParams: IvcmExecuteParamsPrim);
   procedure Result_SaveAsDefault_Test(const aParams: IvcmTestParamsPrim);
   procedure Result_SaveAsDefault_Execute(const aParams: IvcmExecuteParamsPrim);
 end;//TPrimStyleEditorContainerOptionsForm
{$IfEnd} // NOT Defined(Admin) AND NOT Defined(Monitorings)

implementation

{$If NOT Defined(Admin) AND NOT Defined(Monitorings)}
uses
 l3ImplUses
 {$If NOT Defined(NoVCL)}
 , Controls
 {$IfEnd} // NOT Defined(NoVCL)
 , Settings_Strange_Controls
 {$If NOT Defined(NoScripts)}
 , TtfwClassRef_Proxy
 {$IfEnd} // NOT Defined(NoScripts)
;

{$If NOT Defined(NoVCM)}
procedure TPrimStyleEditorContainerOptionsForm.Result_Cancel_Execute(const aParams: IvcmExecuteParamsPrim);
 {* ������ }
//#UC START# *4A8AD46D0226_4C52B21801B6exec_var*
//#UC END# *4A8AD46D0226_4C52B21801B6exec_var*
begin
//#UC START# *4A8AD46D0226_4C52B21801B6exec_impl*
 ModalResult := mrCancel;
//#UC END# *4A8AD46D0226_4C52B21801B6exec_impl*
end;//TPrimStyleEditorContainerOptionsForm.Result_Cancel_Execute
{$IfEnd} // NOT Defined(NoVCM)

{$If NOT Defined(NoVCM)}
procedure TPrimStyleEditorContainerOptionsForm.Result_Ok_Test(const aParams: IvcmTestParamsPrim);
 {* OK }
//#UC START# *4A97EBE702F8_4C52B21801B6test_var*
//#UC END# *4A97EBE702F8_4C52B21801B6test_var*
begin
//#UC START# *4A97EBE702F8_4C52B21801B6test_impl*
 aParams.Op.Flag[vcm_ofEnabled] := f_SettingsInfo.Modified;
//#UC END# *4A97EBE702F8_4C52B21801B6test_impl*
end;//TPrimStyleEditorContainerOptionsForm.Result_Ok_Test
{$IfEnd} // NOT Defined(NoVCM)

{$If NOT Defined(NoVCM)}
procedure TPrimStyleEditorContainerOptionsForm.Result_Ok_Execute(const aParams: IvcmExecuteParamsPrim);
 {* OK }
//#UC START# *4A97EBE702F8_4C52B21801B6exec_var*
//#UC END# *4A97EBE702F8_4C52B21801B6exec_var*
begin
//#UC START# *4A97EBE702F8_4C52B21801B6exec_impl*
 Op_StyleEditor_SaveStyleTable.Call(Aggregate, false);
 ModalResult := mrOk;
//#UC END# *4A97EBE702F8_4C52B21801B6exec_impl*
end;//TPrimStyleEditorContainerOptionsForm.Result_Ok_Execute
{$IfEnd} // NOT Defined(NoVCM)

procedure TPrimStyleEditorContainerOptionsForm.Result_Restore_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4C52B34E0125_4C52B21801B6test_var*
//#UC END# *4C52B34E0125_4C52B21801B6test_var*
begin
//#UC START# *4C52B34E0125_4C52B21801B6test_impl*
 aParams.Op.Flag[vcm_ofEnabled] := f_SettingsInfo.Modified or f_SettingsInfo.IsDifferFromDefault;
//#UC END# *4C52B34E0125_4C52B21801B6test_impl*
end;//TPrimStyleEditorContainerOptionsForm.Result_Restore_Test

procedure TPrimStyleEditorContainerOptionsForm.Result_Restore_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4C52B34E0125_4C52B21801B6exec_var*
//#UC END# *4C52B34E0125_4C52B21801B6exec_var*
begin
//#UC START# *4C52B34E0125_4C52B21801B6exec_impl*
 if not Ask(qr_RestoreDefaultValuesStyleTable) then
  Exit;
 Op_StyleEditor_RestoreStyleTable.Call(Aggregate, true);
//#UC END# *4C52B34E0125_4C52B21801B6exec_impl*
end;//TPrimStyleEditorContainerOptionsForm.Result_Restore_Execute

procedure TPrimStyleEditorContainerOptionsForm.Result_SaveAsDefault_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4C52B36B01B3_4C52B21801B6test_var*
//#UC END# *4C52B36B01B3_4C52B21801B6test_var*
begin
//#UC START# *4C52B36B01B3_4C52B21801B6test_impl*
 aParams.Op.Flag[vcm_ofEnabled] := not f_SettingsInfo.IsPredefined and
                                  (f_SettingsInfo.Modified or f_SettingsInfo.IsDifferFromDefault);
//#UC END# *4C52B36B01B3_4C52B21801B6test_impl*
end;//TPrimStyleEditorContainerOptionsForm.Result_SaveAsDefault_Test

procedure TPrimStyleEditorContainerOptionsForm.Result_SaveAsDefault_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4C52B36B01B3_4C52B21801B6exec_var*
//#UC END# *4C52B36B01B3_4C52B21801B6exec_var*
begin
//#UC START# *4C52B36B01B3_4C52B21801B6exec_impl*
 if not Ask(qr_SaveAsDefaultValuesStyleTable) then
  Exit;
 Op_StyleEditor_SaveStyleTable.Call(Aggregate, true); 
//#UC END# *4C52B36B01B3_4C52B21801B6exec_impl*
end;//TPrimStyleEditorContainerOptionsForm.Result_SaveAsDefault_Execute

initialization
{$If NOT Defined(NoScripts)}
 TtfwClassRef.Register(TPrimStyleEditorContainerOptionsForm);
 {* ����������� PrimStyleEditorContainerOptions }
{$IfEnd} // NOT Defined(NoScripts)
{$IfEnd} // NOT Defined(Admin) AND NOT Defined(Monitorings)

end.
