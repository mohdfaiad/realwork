unit K480809940;
 {* [Requestlink:480809940] }

// ������: "w:\archi\source\projects\Archi\Tests\K480809940.pas"
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
 TK480809940 = class(TArchiInsiderTest)
  {* [Requestlink:480809940] }
  protected
   function GetFolder: AnsiString; override;
    {* ����� � ������� ������ ���� }
   function GetModelElementGUID: AnsiString; override;
    {* ������������� �������� ������, ������� ��������� ���� }
 end;//TK480809940
{$IfEnd} // Defined(nsTest) AND Defined(InsiderTest)

implementation

{$If Defined(nsTest) AND Defined(InsiderTest)}
uses
 l3ImplUses
 , TestFrameWork
;

function TK480809940.GetFolder: AnsiString;
 {* ����� � ������� ������ ���� }
begin
 Result := 'DialogTest';
end;//TK480809940.GetFolder

function TK480809940.GetModelElementGUID: AnsiString;
 {* ������������� �������� ������, ������� ��������� ���� }
begin
 Result := '521EFB1200C3';
end;//TK480809940.GetModelElementGUID

initialization
 TestFramework.RegisterTest(TK480809940.Suite);
{$IfEnd} // Defined(nsTest) AND Defined(InsiderTest)

end.
