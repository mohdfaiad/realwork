unit K294595323Suite;

// ������: "w:\common\components\rtl\Garant\Archi_Tests\K294595323Suite.pas"
// ���������: "SimpleClass"

{$Include w:\common\components\rtl\Garant\Archi_Tests\TestDefine.inc.pas}

interface

{$If Defined(nsTest) AND NOT Defined(NoScripts)}
uses
 l3IntfUses
 , CustomFolderTestSuite
;

type
 TK294595323Suite = class(TCustomFolderTestSuite)
 end;//TK294595323Suite
{$IfEnd} // Defined(nsTest) AND NOT Defined(NoScripts)

implementation

{$If Defined(nsTest) AND NOT Defined(NoScripts)}
uses
 l3ImplUses
;
{$IfEnd} // Defined(nsTest) AND NOT Defined(NoScripts)

end.
