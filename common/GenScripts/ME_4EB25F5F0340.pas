unit kwDiffIteratorNext;

// ������: "w:\garant6x\implementation\Garant\GbaNemesis\F1_Shell_Words\kwDiffIteratorNext.pas"
// ���������: "ScriptKeyword"

{$Include nsDefine.inc}

interface

{$If NOT Defined(NoScripts)}
uses
 l3IntfUses
 , kwDiffIteratorWord
 , DocumentUnit
 , tfwScriptingInterfaces
;

type
 TkwDiffIteratorNext = class(TkwDiffIteratorWord)
  protected
   procedure DoIterator(const anIterator: IDiffIterator;
    const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwDiffIteratorNext
{$IfEnd} // NOT Defined(NoScripts)

implementation

{$If NOT Defined(NoScripts)}
uses
 l3ImplUses
;

procedure TkwDiffIteratorNext.DoIterator(const anIterator: IDiffIterator;
 const aCtx: TtfwContext);
//#UC START# *4EB2634D0118_4EB25F5F0340_var*
//#UC END# *4EB2634D0118_4EB25F5F0340_var*
begin
//#UC START# *4EB2634D0118_4EB25F5F0340_impl*
 aCtx.rEngine.PushInt(anIterator.Next);
//#UC END# *4EB2634D0118_4EB25F5F0340_impl*
end;//TkwDiffIteratorNext.DoIterator

class function TkwDiffIteratorNext.GetWordNameForRegister: AnsiString;
begin
 Result := 'DiffIterator:Next';
end;//TkwDiffIteratorNext.GetWordNameForRegister

initialization
 TkwDiffIteratorNext.RegisterInEngine;
 {* ����������� TkwDiffIteratorNext }
{$IfEnd} // NOT Defined(NoScripts)

end.
