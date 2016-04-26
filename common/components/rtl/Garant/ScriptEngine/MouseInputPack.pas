unit MouseInputPack;

// ������: "w:\common\components\rtl\Garant\ScriptEngine\MouseInputPack.pas"
// ���������: "ScriptKeywordsPack"
// ������� ������: "MouseInputPack" MUID: (4F8EC88A01F2)

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
 , kwMouseLeftDown
 , kwMouseLeftUp
 , kwMouseMiddleUp
 , kwMouseMiddleDown
 , kwMouseRightUp
 , kwMouseRightDown
 , kwMouseSetCursorPosition
 , kwMouseGetCursorIndex
 , kwMouseGetCursorNameByIndex
 , kwMouseGetCursorPosition
 , kwMouseWheelUp
 , kwMouseWheelDown
 , SysUtils
 , tfwTypeRegistrator
 , tfwScriptingTypes
;
{$IfEnd} // NOT Defined(NoScripts)

end.
