unit K482767115;
 {* [Requestlink:482752570] }

// ������: "w:\archi\source\projects\Archi\Tests\K482767115.pas"
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
 TK482767115 = class(TArchiInsiderTest)
  {* [Requestlink:482752570] }
  protected
   function GetFolder: AnsiString; override;
    {* ����� � ������� ������ ���� }
   function GetModelElementGUID: AnsiString; override;
    {* ������������� �������� ������, ������� ��������� ���� }
 end;//TK482767115
{$IfEnd} // Defined(nsTest) AND Defined(InsiderTest)

implementation

{$If Defined(nsTest) AND Defined(InsiderTest)}
uses
 l3ImplUses
 , TestFrameWork
;

function TK482767115.GetFolder: AnsiString;
 {* ����� � ������� ������ ���� }
begin
 Result := 'LoadText';
end;//TK482767115.GetFolder

function TK482767115.GetModelElementGUID: AnsiString;
 {* ������������� �������� ������, ������� ��������� ���� }
begin
 Result := '52380FF10094';
end;//TK482767115.GetModelElementGUID

initialization
 TestFramework.RegisterTest(TK482767115.Suite);
{$IfEnd} // Defined(nsTest) AND Defined(InsiderTest)

end.
