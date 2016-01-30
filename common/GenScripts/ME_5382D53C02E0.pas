unit K537234131;
 {* [Requestlink:537234131] }

// ������: "w:\common\components\rtl\Garant\Daily\K537234131.pas"
// ���������: "TestCase"

{$Include TestDefine.inc.pas}

interface

{$If Defined(nsTest) AND NOT Defined(NoScripts)}
uses
 l3IntfUses
 , RTFtoEVDWriterTest
;

type
 TK537234131 = class(TRTFtoEVDWriterTest)
  {* [Requestlink:537234131] }
  protected
   function GetFolder: AnsiString; override;
    {* ����� � ������� ������ ���� }
   function GetModelElementGUID: AnsiString; override;
    {* ������������� �������� ������, ������� ��������� ���� }
 end;//TK537234131
{$IfEnd} // Defined(nsTest) AND NOT Defined(NoScripts)

implementation

{$If Defined(nsTest) AND NOT Defined(NoScripts)}
uses
 l3ImplUses
 , TestFrameWork
;

function TK537234131.GetFolder: AnsiString;
 {* ����� � ������� ������ ���� }
begin
 Result := '7.10';
end;//TK537234131.GetFolder

function TK537234131.GetModelElementGUID: AnsiString;
 {* ������������� �������� ������, ������� ��������� ���� }
begin
 Result := '5382D53C02E0';
end;//TK537234131.GetModelElementGUID

initialization
 TestFramework.RegisterTest(TK537234131.Suite);
{$IfEnd} // Defined(nsTest) AND NOT Defined(NoScripts)

end.
