unit K200087275;
 {* [Requestlink:200087275] }

// ������: "w:\archi\source\projects\Archi\Tests\K200087275.pas"
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
 TK200087275 = class(TArchiInsiderTest)
  {* [Requestlink:200087275] }
  protected
   function GetFolder: AnsiString; override;
    {* ����� � ������� ������ ���� }
   function GetModelElementGUID: AnsiString; override;
    {* ������������� �������� ������, ������� ��������� ���� }
 end;//TK200087275
{$IfEnd} // Defined(nsTest) AND Defined(InsiderTest)

implementation

{$If Defined(nsTest) AND Defined(InsiderTest)}
uses
 l3ImplUses
 , TestFrameWork
;

function TK200087275.GetFolder: AnsiString;
 {* ����� � ������� ������ ���� }
begin
 Result := 'TableBoundariesAlignment';
end;//TK200087275.GetFolder

function TK200087275.GetModelElementGUID: AnsiString;
 {* ������������� �������� ������, ������� ��������� ���� }
begin
 Result := '4F30CBE30015';
end;//TK200087275.GetModelElementGUID

initialization
 TestFramework.RegisterTest(TK200087275.Suite);
{$IfEnd} // Defined(nsTest) AND Defined(InsiderTest)

end.
