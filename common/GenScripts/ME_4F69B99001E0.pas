unit kwVcmDispatcherLock;

// ������: "w:\common\components\gui\Garant\VCM\implementation\Scripting\kwVcmDispatcherLock.pas"
// ���������: "ScriptKeyword"

{$Include vcmDefine.inc}

interface

{$If NOT Defined(NoScripts) AND NOT Defined(NoVCM)}
uses
 l3IntfUses
 , tfwRegisterableWord
 , tfwScriptingInterfaces
;

type
 _VCMWord_Parent_ = TtfwRegisterableWord;
 {$Include VCMWord.imp.pas}
 TkwVcmDispatcherLock = {final} class(_VCMWord_)
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwVcmDispatcherLock
{$IfEnd} // NOT Defined(NoScripts) AND NOT Defined(NoVCM)

implementation

{$If NOT Defined(NoScripts) AND NOT Defined(NoVCM)}
uses
 l3ImplUses
 , vcmForm
 {$If NOT Defined(NoVCL)}
 , Controls
 {$IfEnd} // NOT Defined(NoVCL)
 , StdRes
 , vcmBase
 , afwAnswer
;

{$Include VCMWord.imp.pas}

procedure TkwVcmDispatcherLock.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4F69B99001E0_var*
//#UC END# *4DAEEDE10285_4F69B99001E0_var*
begin
//#UC START# *4DAEEDE10285_4F69B99001E0_impl*
 vcmDispatcher.FormDispatcher.Lock;
//#UC END# *4DAEEDE10285_4F69B99001E0_impl*
end;//TkwVcmDispatcherLock.DoDoIt

class function TkwVcmDispatcherLock.GetWordNameForRegister: AnsiString;
begin
 Result := 'vcm:Dispatcher:Lock';
end;//TkwVcmDispatcherLock.GetWordNameForRegister

initialization
 TkwVcmDispatcherLock.RegisterInEngine;
 {* ����������� vcm_Dispatcher_Lock }
{$IfEnd} // NOT Defined(NoScripts) AND NOT Defined(NoVCM)

end.
