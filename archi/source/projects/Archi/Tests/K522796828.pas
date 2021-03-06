unit K522796828;
 {* [Requestlink:522796828] }

// ������: "w:\archi\source\projects\Archi\Tests\K522796828.pas"
// ���������: "TestCase"
// ������� ������: "K522796828" MUID: (5333FE1F0324)
// ��� ����: "TK522796828"

{$Include w:\archi\source\projects\Archi\arDefine.inc}

interface

{$If Defined(nsTest) AND Defined(InsiderTest)}
uses
 l3IntfUses
 {$If NOT Defined(NoScripts)}
 , ArchiInsiderTest
 {$IfEnd} // NOT Defined(NoScripts)
;

type
 TK522796828 = class({$If NOT Defined(NoScripts)}
 TArchiInsiderTest
 {$IfEnd} // NOT Defined(NoScripts)
 )
  {* [Requestlink:522796828] }
  protected
   function GetFolder: AnsiString; override;
    {* ����� � ������� ������ ���� }
   function GetModelElementGUID: AnsiString; override;
    {* ������������� �������� ������, ������� ��������� ���� }
 end;//TK522796828
{$IfEnd} // Defined(nsTest) AND Defined(InsiderTest)

implementation

{$If Defined(nsTest) AND Defined(InsiderTest)}
uses
 l3ImplUses
 , TestFrameWork
 //#UC START# *5333FE1F0324impl_uses*
 //#UC END# *5333FE1F0324impl_uses*
;

{$If NOT Defined(NoScripts)}
function TK522796828.GetFolder: AnsiString;
 {* ����� � ������� ������ ���� }
begin
 Result := 'DialogTest';
end;//TK522796828.GetFolder

function TK522796828.GetModelElementGUID: AnsiString;
 {* ������������� �������� ������, ������� ��������� ���� }
begin
 Result := '5333FE1F0324';
end;//TK522796828.GetModelElementGUID

initialization
 TestFramework.RegisterTest(TK522796828.Suite);
{$IfEnd} // NOT Defined(NoScripts)

{$IfEnd} // Defined(nsTest) AND Defined(InsiderTest)
end.
