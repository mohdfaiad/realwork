unit K439979342;
 {* [Requestlink:439979342] }

// ������: "w:\archi\source\projects\Archi\Tests\K439979342.pas"
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
 TK439979342 = class(TArchiInsiderTest)
  {* [Requestlink:439979342] }
  protected
   function GetFolder: AnsiString; override;
    {* ����� � ������� ������ ���� }
   function GetModelElementGUID: AnsiString; override;
    {* ������������� �������� ������, ������� ��������� ���� }
 end;//TK439979342
{$IfEnd} // Defined(nsTest) AND Defined(InsiderTest)

implementation

{$If Defined(nsTest) AND Defined(InsiderTest)}
uses
 l3ImplUses
 , TestFrameWork
;

function TK439979342.GetFolder: AnsiString;
 {* ����� � ������� ������ ���� }
begin
 Result := 'BlockTest';
end;//TK439979342.GetFolder

function TK439979342.GetModelElementGUID: AnsiString;
 {* ������������� �������� ������, ������� ��������� ���� }
begin
 Result := '514AE76300C0';
end;//TK439979342.GetModelElementGUID

initialization
 TestFramework.RegisterTest(TK439979342.Suite);
{$IfEnd} // Defined(nsTest) AND Defined(InsiderTest)

end.
