unit K537233020;
 {* [Requestlink:537233020] }

// ������: "w:\common\components\rtl\Garant\Daily\K537233020.pas"
// ���������: "TestCase"

{$Include TestDefine.inc.pas}

interface

{$If Defined(nsTest) AND NOT Defined(NoScripts)}
uses
 l3IntfUses
 , RTFtoEVDWriterTest
;

type
 TK537233020 = class(TRTFtoEVDWriterTest)
  {* [Requestlink:537233020] }
  protected
   function GetFolder: AnsiString; override;
    {* ����� � ������� ������ ���� }
   function GetModelElementGUID: AnsiString; override;
    {* ������������� �������� ������, ������� ��������� ���� }
 end;//TK537233020
{$IfEnd} // Defined(nsTest) AND NOT Defined(NoScripts)

implementation

{$If Defined(nsTest) AND NOT Defined(NoScripts)}
uses
 l3ImplUses
 , TestFrameWork
;

function TK537233020.GetFolder: AnsiString;
 {* ����� � ������� ������ ���� }
begin
 Result := '7.10';
end;//TK537233020.GetFolder

function TK537233020.GetModelElementGUID: AnsiString;
 {* ������������� �������� ������, ������� ��������� ���� }
begin
 Result := '537F13DD031D';
end;//TK537233020.GetModelElementGUID

initialization
 TestFramework.RegisterTest(TK537233020.Suite);
{$IfEnd} // Defined(nsTest) AND NOT Defined(NoScripts)

end.
