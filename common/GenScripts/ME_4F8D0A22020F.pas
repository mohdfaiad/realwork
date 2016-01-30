unit K358354724;
 {* [Requestlink:358354724] }

// ������: "w:\archi\source\projects\Archi\Tests\K358354724.pas"
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
 TK358354724 = class(TArchiInsiderTest)
  {* [Requestlink:358354724] }
  protected
   function GetFolder: AnsiString; override;
    {* ����� � ������� ������ ���� }
   function GetModelElementGUID: AnsiString; override;
    {* ������������� �������� ������, ������� ��������� ���� }
 end;//TK358354724
{$IfEnd} // Defined(nsTest) AND Defined(InsiderTest)

implementation

{$If Defined(nsTest) AND Defined(InsiderTest)}
uses
 l3ImplUses
 , TestFrameWork
;

function TK358354724.GetFolder: AnsiString;
 {* ����� � ������� ������ ���� }
begin
 Result := 'TableTools';
end;//TK358354724.GetFolder

function TK358354724.GetModelElementGUID: AnsiString;
 {* ������������� �������� ������, ������� ��������� ���� }
begin
 Result := '4F8D0A22020F';
end;//TK358354724.GetModelElementGUID

initialization
 TestFramework.RegisterTest(TK358354724.Suite);
{$IfEnd} // Defined(nsTest) AND Defined(InsiderTest)

end.
