unit K421123924;
 {* [Requestlink:421123924] }

// ������: "w:\archi\source\projects\Archi\Tests\K421123924.pas"
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
 TK421123924 = class(TArchiInsiderTest)
  {* [Requestlink:421123924] }
  protected
   function GetFolder: AnsiString; override;
    {* ����� � ������� ������ ���� }
   function GetModelElementGUID: AnsiString; override;
    {* ������������� �������� ������, ������� ��������� ���� }
 end;//TK421123924
{$IfEnd} // Defined(nsTest) AND Defined(InsiderTest)

implementation

{$If Defined(nsTest) AND Defined(InsiderTest)}
uses
 l3ImplUses
 , TestFrameWork
;

function TK421123924.GetFolder: AnsiString;
 {* ����� � ������� ������ ���� }
begin
 Result := 'SelectionTests';
end;//TK421123924.GetFolder

function TK421123924.GetModelElementGUID: AnsiString;
 {* ������������� �������� ������, ������� ��������� ���� }
begin
 Result := '50D94F2200F8';
end;//TK421123924.GetModelElementGUID

initialization
 TestFramework.RegisterTest(TK421123924.Suite);
{$IfEnd} // Defined(nsTest) AND Defined(InsiderTest)

end.
