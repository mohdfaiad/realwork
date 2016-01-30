unit K453151648;
 {* [Requestlink:453151648] }

// ������: "w:\common\components\rtl\Garant\Daily\K453151648.pas"
// ���������: "TestCase"

{$Include TestDefine.inc.pas}

interface

{$If Defined(nsTest) AND NOT Defined(NoScripts)}
uses
 l3IntfUses
 , RTFtoEVDWriterTest
;

type
 TK453151648 = class(TRTFtoEVDWriterTest)
  {* [Requestlink:453151648] }
  protected
   function GetFolder: AnsiString; override;
    {* ����� � ������� ������ ���� }
   function GetModelElementGUID: AnsiString; override;
    {* ������������� �������� ������, ������� ��������� ���� }
 end;//TK453151648
{$IfEnd} // Defined(nsTest) AND NOT Defined(NoScripts)

implementation

{$If Defined(nsTest) AND NOT Defined(NoScripts)}
uses
 l3ImplUses
 , TestFrameWork
;

function TK453151648.GetFolder: AnsiString;
 {* ����� � ������� ������ ���� }
begin
 Result := '7.8';
end;//TK453151648.GetFolder

function TK453151648.GetModelElementGUID: AnsiString;
 {* ������������� �������� ������, ������� ��������� ���� }
begin
 Result := '5187509D034E';
end;//TK453151648.GetModelElementGUID

initialization
 TestFramework.RegisterTest(TK453151648.Suite);
{$IfEnd} // Defined(nsTest) AND NOT Defined(NoScripts)

end.
