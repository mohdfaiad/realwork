unit K330141531;
 {* [Requestlink:330141531] }

// ������: "w:\archi\source\projects\Archi\Tests\K330141531.pas"
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
 TK330141531 = class(TArchiInsiderTest)
  {* [Requestlink:330141531] }
  protected
   function GetFolder: AnsiString; override;
    {* ����� � ������� ������ ���� }
   function GetModelElementGUID: AnsiString; override;
    {* ������������� �������� ������, ������� ��������� ���� }
 end;//TK330141531
{$IfEnd} // Defined(nsTest) AND Defined(InsiderTest)

implementation

{$If Defined(nsTest) AND Defined(InsiderTest)}
uses
 l3ImplUses
 , TestFrameWork
;

function TK330141531.GetFolder: AnsiString;
 {* ����� � ������� ������ ���� }
begin
 Result := 'DialogTest';
end;//TK330141531.GetFolder

function TK330141531.GetModelElementGUID: AnsiString;
 {* ������������� �������� ������, ������� ��������� ���� }
begin
 Result := '4F2679EA023D';
end;//TK330141531.GetModelElementGUID

initialization
 TestFramework.RegisterTest(TK330141531.Suite);
{$IfEnd} // Defined(nsTest) AND Defined(InsiderTest)

end.
