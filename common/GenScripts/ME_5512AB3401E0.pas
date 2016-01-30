unit VarWorkingPack;

// ������: "w:\common\components\rtl\Garant\ScriptEngine\VarWorkingPack.pas"
// ���������: "ScriptKeywordsPack"

{$Include seDefine.inc}

interface

{$If NOT Defined(NoScripts)}
uses
 l3IntfUses
 , tfwTypeInfo
 , tfwConst
;
{$IfEnd} // NOT Defined(NoScripts)

implementation

{$If NOT Defined(NoScripts)}
uses
 l3ImplUses
 , tfwScriptingTypes
;

type
 TkwCONST = {final} class(TtfwConst)
  {* ���������� ���������.
������:
[code]
 CONST cFake1 5
[code] }
  protected
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwCONST

class function TkwCONST.GetWordNameForRegister: AnsiString;
begin
 Result := 'CONST';
end;//TkwCONST.GetWordNameForRegister

initialization
 TkwCONST.RegisterInEngine;
 {* ����������� CONST }
{$IfEnd} // NOT Defined(NoScripts)

end.
