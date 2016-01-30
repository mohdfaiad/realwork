unit K400531159;
 {* [Requestlink:400531159] }

// ������: "w:\archi\source\projects\Archi\Tests\K400531159.pas"
// ���������: "TestCase"

{$Include arDefine.inc}

interface

{$If Defined(nsTest) AND Defined(InsiderTest)}
uses
 l3IntfUses
 {$If NOT Defined(NoScripts)}
 , ArchiInsiderTest
 {$IfEnd} // NOT Defined(NoScripts)
;

type
 TK400531159 = class(TArchiInsiderTest)
  {* [Requestlink:400531159] }
  protected
   function GetFolder: AnsiString; override;
    {* ����� � ������� ������ ���� }
   function GetModelElementGUID: AnsiString; override;
    {* ������������� �������� ������, ������� ��������� ���� }
 end;//TK400531159
{$IfEnd} // Defined(nsTest) AND Defined(InsiderTest)

implementation

{$If Defined(nsTest) AND Defined(InsiderTest)}
uses
 l3ImplUses
 , TestFrameWork
;

function TK400531159.GetFolder: AnsiString;
 {* ����� � ������� ������ ���� }
begin
 Result := 'TableTools';
end;//TK400531159.GetFolder

function TK400531159.GetModelElementGUID: AnsiString;
 {* ������������� �������� ������, ������� ��������� ���� }
begin
 Result := '50750748009E';
end;//TK400531159.GetModelElementGUID

initialization
 TestFramework.RegisterTest(TK400531159.Suite);
{$IfEnd} // Defined(nsTest) AND Defined(InsiderTest)

end.
