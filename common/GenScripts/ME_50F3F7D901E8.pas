unit K423605014;
 {* [Requestlink:423605014] }

// ������: "w:\archi\source\projects\Archi\Tests\K423605014.pas"
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
 TK423605014 = class(TArchiInsiderTest)
  {* [Requestlink:423605014] }
  protected
   function GetFolder: AnsiString; override;
    {* ����� � ������� ������ ���� }
   function GetModelElementGUID: AnsiString; override;
    {* ������������� �������� ������, ������� ��������� ���� }
 end;//TK423605014
{$IfEnd} // Defined(nsTest) AND Defined(InsiderTest)

implementation

{$If Defined(nsTest) AND Defined(InsiderTest)}
uses
 l3ImplUses
 , TestFrameWork
;

function TK423605014.GetFolder: AnsiString;
 {* ����� � ������� ������ ���� }
begin
 Result := 'SelectionTests';
end;//TK423605014.GetFolder

function TK423605014.GetModelElementGUID: AnsiString;
 {* ������������� �������� ������, ������� ��������� ���� }
begin
 Result := '50F3F7D901E8';
end;//TK423605014.GetModelElementGUID

initialization
 TestFramework.RegisterTest(TK423605014.Suite);
{$IfEnd} // Defined(nsTest) AND Defined(InsiderTest)

end.
