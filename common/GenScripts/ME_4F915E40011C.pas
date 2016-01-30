unit K358976074;
 {* [Requestlink:358976074] }

// ������: "w:\archi\source\projects\Archi\Tests\K358976074.pas"
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
 TK358976074 = class(TArchiInsiderTest)
  {* [Requestlink:358976074] }
  protected
   function GetFolder: AnsiString; override;
    {* ����� � ������� ������ ���� }
   function GetModelElementGUID: AnsiString; override;
    {* ������������� �������� ������, ������� ��������� ���� }
 end;//TK358976074
{$IfEnd} // Defined(nsTest) AND Defined(InsiderTest)

implementation

{$If Defined(nsTest) AND Defined(InsiderTest)}
uses
 l3ImplUses
 , TestFrameWork
;

function TK358976074.GetFolder: AnsiString;
 {* ����� � ������� ������ ���� }
begin
 Result := 'EditorTests';
end;//TK358976074.GetFolder

function TK358976074.GetModelElementGUID: AnsiString;
 {* ������������� �������� ������, ������� ��������� ���� }
begin
 Result := '4F915E40011C';
end;//TK358976074.GetModelElementGUID

initialization
 TestFramework.RegisterTest(TK358976074.Suite);
{$IfEnd} // Defined(nsTest) AND Defined(InsiderTest)

end.
