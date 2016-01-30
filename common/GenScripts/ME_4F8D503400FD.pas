unit kwMainFormFindDocuments;
 {* �������� ����� ����������. }

// ������: "w:\archi\source\projects\Archi\Archi_Insider_Test_Support\kwMainFormFindDocuments.pas"
// ���������: "ScriptKeyword"

{$Include arDefine.inc}

interface

{$If Defined(nsTest) AND Defined(InsiderTest) AND Defined(AppClientSide) AND NOT Defined(NoScripts)}
uses
 l3IntfUses
 , tfwRegisterableWord
 , tfwScriptingInterfaces
;

type
 TkwMainFormFindDocuments = {final} class(TtfwRegisterableWord)
  {* �������� ����� ����������. }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwMainFormFindDocuments
{$IfEnd} // Defined(nsTest) AND Defined(InsiderTest) AND Defined(AppClientSide) AND NOT Defined(NoScripts)

implementation

{$If Defined(nsTest) AND Defined(InsiderTest) AND Defined(AppClientSide) AND NOT Defined(NoScripts)}
uses
 l3ImplUses
 , Main
;

procedure TkwMainFormFindDocuments.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4F8D503400FD_var*
//#UC END# *4DAEEDE10285_4F8D503400FD_var*
begin
//#UC START# *4DAEEDE10285_4F8D503400FD_impl*
 Assert(MainForm <> nil);
 MainForm.acFindDoc.Execute;
//#UC END# *4DAEEDE10285_4F8D503400FD_impl*
end;//TkwMainFormFindDocuments.DoDoIt

class function TkwMainFormFindDocuments.GetWordNameForRegister: AnsiString;
begin
 Result := 'MainForm:FindDocuments';
end;//TkwMainFormFindDocuments.GetWordNameForRegister

initialization
 TkwMainFormFindDocuments.RegisterInEngine;
 {* ����������� MainForm_FindDocuments }
{$IfEnd} // Defined(nsTest) AND Defined(InsiderTest) AND Defined(AppClientSide) AND NOT Defined(NoScripts)

end.
