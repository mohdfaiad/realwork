unit IncludesAndUsesPack;

// ������: "w:\common\components\rtl\Garant\ScriptEngine\IncludesAndUsesPack.pas"
// ���������: "ScriptKeywordsPack"

{$Include seDefine.inc}

interface

{$If NOT Defined(NoScripts)}
uses
 l3IntfUses
;
{$IfEnd} // NOT Defined(NoScripts)

implementation

{$If NOT Defined(NoScripts)}
uses
 l3ImplUses
 , tfwScriptingTypes
;
{$IfEnd} // NOT Defined(NoScripts)

end.
