unit EditorParaCoordsToScreenPack;

// ������: "w:\common\components\rtl\Garant\ScriptEngine\EditorParaCoordsToScreenPack.pas"
// ���������: "ScriptKeywordsPack"
// ������� ������: "EditorParaCoordsToScreenPack" MUID: (4F954F670262)

{$Include w:\common\components\rtl\Garant\ScriptEngine\seDefine.inc}

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
 , kwPopEditorParaCoordsToScreen
 , kwPopEditorParaEndCoordsToScreen
 , kwPopEditorParaMiddleCoordsToScreen
 , kwPopEditorCursorCoordsToScreen
 , SysUtils
 , tfwTypeRegistrator
 , tfwScriptingTypes
;
{$IfEnd} // NOT Defined(NoScripts)

end.
