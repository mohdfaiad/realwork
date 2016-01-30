unit K330705088;
 {* [Requestlink:330705088] }

// ������: "w:\archi\source\projects\Archi\Tests\K330705088.pas"
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
 TK330705088 = class(TArchiInsiderTest)
  {* [Requestlink:330705088] }
  protected
   function GetFolder: AnsiString; override;
    {* ����� � ������� ������ ���� }
   function GetModelElementGUID: AnsiString; override;
    {* ������������� �������� ������, ������� ��������� ���� }
 end;//TK330705088
{$IfEnd} // Defined(nsTest) AND Defined(InsiderTest)

implementation

{$If Defined(nsTest) AND Defined(InsiderTest)}
uses
 l3ImplUses
 , TestFrameWork
;

function TK330705088.GetFolder: AnsiString;
 {* ����� � ������� ������ ���� }
begin
 Result := 'DialogTest';
end;//TK330705088.GetFolder

function TK330705088.GetModelElementGUID: AnsiString;
 {* ������������� �������� ������, ������� ��������� ���� }
begin
 Result := '506E75B402D6';
end;//TK330705088.GetModelElementGUID

initialization
 TestFramework.RegisterTest(TK330705088.Suite);
{$IfEnd} // Defined(nsTest) AND Defined(InsiderTest)

end.
