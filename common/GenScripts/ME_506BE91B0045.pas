unit K395659375;
 {* [Requestlink:395659375] }

// ������: "w:\archi\source\projects\Archi\Tests\K395659375.pas"
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
 TK395659375 = class(TArchiInsiderTest)
  {* [Requestlink:395659375] }
  protected
   function GetFolder: AnsiString; override;
    {* ����� � ������� ������ ���� }
   function GetModelElementGUID: AnsiString; override;
    {* ������������� �������� ������, ������� ��������� ���� }
 end;//TK395659375
{$IfEnd} // Defined(nsTest) AND Defined(InsiderTest)

implementation

{$If Defined(nsTest) AND Defined(InsiderTest)}
uses
 l3ImplUses
 , TestFrameWork
;

function TK395659375.GetFolder: AnsiString;
 {* ����� � ������� ������ ���� }
begin
 Result := 'TableTools';
end;//TK395659375.GetFolder

function TK395659375.GetModelElementGUID: AnsiString;
 {* ������������� �������� ������, ������� ��������� ���� }
begin
 Result := '506BE91B0045';
end;//TK395659375.GetModelElementGUID

initialization
 TestFramework.RegisterTest(TK395659375.Suite);
{$IfEnd} // Defined(nsTest) AND Defined(InsiderTest)

end.
