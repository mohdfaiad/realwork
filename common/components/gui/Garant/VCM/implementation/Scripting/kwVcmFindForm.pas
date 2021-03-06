unit kwVcmFindForm;

// ������: "w:\common\components\gui\Garant\VCM\implementation\Scripting\kwVcmFindForm.pas"
// ���������: "ScriptKeyword"
// ������� ������: "vcm_FindForm" MUID: (4F215ADB00AF)
// ��� ����: "TkwVcmFindForm"

{$Include w:\common\components\gui\Garant\VCM\vcmDefine.inc}

interface

{$If NOT Defined(NoScripts) AND NOT Defined(NoVCM)}
uses
 l3IntfUses
 , tfwRegisterableWord
 , tfwScriptingInterfaces
;

type
 _VCMWord_Parent_ = TtfwRegisterableWord;
 {$Include w:\common\components\gui\Garant\VCM\implementation\Scripting\VCMWord.imp.pas}
 TkwVcmFindForm = class(_VCMWord_)
  protected
   class function GetWordNameForRegister: AnsiString; override;
   procedure DoDoIt(const aCtx: TtfwContext); override;
 end;//TkwVcmFindForm
{$IfEnd} // NOT Defined(NoScripts) AND NOT Defined(NoVCM)

implementation

{$If NOT Defined(NoScripts) AND NOT Defined(NoVCM)}
uses
 l3ImplUses
 , vcmInterfaces
 , vcmForm
 {$If NOT Defined(NoVCL)}
 , Controls
 {$IfEnd} // NOT Defined(NoVCL)
 , StdRes
 , vcmBase
 , afwAnswer
 //#UC START# *4F215ADB00AFimpl_uses*
 //#UC END# *4F215ADB00AFimpl_uses*
;

{$Include w:\common\components\gui\Garant\VCM\implementation\Scripting\VCMWord.imp.pas}

class function TkwVcmFindForm.GetWordNameForRegister: AnsiString;
begin
 Result := 'vcm:FindForm';
end;//TkwVcmFindForm.GetWordNameForRegister

procedure TkwVcmFindForm.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4F215ADB00AF_var*
var
 l_Res : Boolean;
 //l_N  : AnsiString;
 l_F  : AnsiString;
 l_ID : TvcmFormID;
 l_EF : IvcmEntityForm;
 l_UT : Integer;
//#UC END# *4DAEEDE10285_4F215ADB00AF_var*
begin
//#UC START# *4DAEEDE10285_4F215ADB00AF_impl*
 l_Res := false;
 try
  l_F := aCtx.rEngine.PopDelphiString;
  //l_N := aCtx.rEngine.PopDelphiString;
  l_UT := aCtx.rEngine.PopInt;
  l_ID.rName := l_F;
  l_ID.rID := 0;
  l_Res := vcmDispatcher.FormDispatcher.
   CurrentMainForm.AsContainer.HasForm(l_ID, vcm_ztAny, true,  @l_EF, l_UT);
 finally
  aCtx.rEngine.PushBool(l_Res);
 end;//try..finally
 if l_Res then
 begin
  aCtx.rEngine.PushObj(l_EF.VCLWinControl);
  aCtx.rEngine.Swap;
 end;//l_Res
//#UC END# *4DAEEDE10285_4F215ADB00AF_impl*
end;//TkwVcmFindForm.DoDoIt

initialization
 TkwVcmFindForm.RegisterInEngine;
 {* ����������� vcm_FindForm }
{$IfEnd} // NOT Defined(NoScripts) AND NOT Defined(NoVCM)

end.
