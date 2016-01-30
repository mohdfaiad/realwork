unit DiffOptions_Form;

// ������: "w:\garant6x\implementation\Garant\GbaNemesis\View\Editions\Forms\DiffOptions_Form.pas"
// ���������: "VCMForm"

{$Include nsDefine.inc}

interface

{$If NOT Defined(Admin) AND NOT Defined(Monitorings)}
uses
 l3IntfUses
 , Diff_Form
;

type
 TDiffOptionsForm = {abstract} class(TDiffForm)
  public
   {$If NOT Defined(NoVCM)}
   procedure Print; override;
    {* ������ }
   {$IfEnd} // NOT Defined(NoVCM)
   {$If NOT Defined(NoVCM)}
   procedure PrintDialog; override;
    {* ������... }
   {$IfEnd} // NOT Defined(NoVCM)
   procedure ToMSWord; override;
    {* ������� � Word }
 end;//TDiffOptionsForm
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
procedure TDiffOptionsForm.Print;
 {* ������ }
//#UC START# *49521D8E0295_4C7F6D8800EE_var*
//#UC END# *49521D8E0295_4C7F6D8800EE_var*
begin
//#UC START# *49521D8E0295_4C7F6D8800EE_impl*
 !!! Needs to be implemented !!!
//#UC END# *49521D8E0295_4C7F6D8800EE_impl*
end;//TDiffOptionsForm.Print
{$IfEnd} // NOT Defined(NoVCM)

{$If NOT Defined(NoVCM)}
procedure TDiffOptionsForm.PrintDialog;
 {* ������... }
//#UC START# *495220DE0298_4C7F6D8800EE_var*
//#UC END# *495220DE0298_4C7F6D8800EE_var*
begin
//#UC START# *495220DE0298_4C7F6D8800EE_impl*
 !!! Needs to be implemented !!!
//#UC END# *495220DE0298_4C7F6D8800EE_impl*
end;//TDiffOptionsForm.PrintDialog
{$IfEnd} // NOT Defined(NoVCM)

procedure TDiffOptionsForm.ToMSWord;
 {* ������� � Word }
//#UC START# *495238EB0160_4C7F6D8800EE_var*
//#UC END# *495238EB0160_4C7F6D8800EE_var*
begin
//#UC START# *495238EB0160_4C7F6D8800EE_impl*
 !!! Needs to be implemented !!!
//#UC END# *495238EB0160_4C7F6D8800EE_impl*
end;//TDiffOptionsForm.ToMSWord

initialization
{$If NOT Defined(NoScripts)}
 TtfwClassRef.Register(TDiffOptionsForm);
 {* ����������� DiffOptions }
{$IfEnd} // NOT Defined(NoScripts)
{$IfEnd} // NOT Defined(Admin) AND NOT Defined(Monitorings)

end.
