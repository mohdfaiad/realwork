unit K615938312_1;
 {* [RequestLink:615938312] }

// ������: "w:\common\components\rtl\Garant\Daily\K615938312_1.pas"
// ���������: "TestCase"
// ������� ������: "K615938312_1" MUID: (56E7C07C02E3)
// ��� ����: "TK615938312_1"

{$Include w:\common\components\rtl\Garant\Daily\TestDefine.inc.pas}

interface

{$If Defined(nsTest) AND NOT Defined(NoScripts)}
uses
 l3IntfUses
 , EVDtoBothNSRCWriterTest
;

type
 TK615938312_1 = class(TEVDtoBothNSRCWriterTest)
  {* [RequestLink:615938312] }
  protected
   function GetFolder: AnsiString; override;
    {* ����� � ������� ������ ���� }
   function GetModelElementGUID: AnsiString; override;
    {* ������������� �������� ������, ������� ��������� ���� }
 end;//TK615938312_1
{$IfEnd} // Defined(nsTest) AND NOT Defined(NoScripts)

implementation

{$If Defined(nsTest) AND NOT Defined(NoScripts)}
uses
 l3ImplUses
 , TestFrameWork
 //#UC START# *56E7C07C02E3impl_uses*
 //#UC END# *56E7C07C02E3impl_uses*
;

function TK615938312_1.GetFolder: AnsiString;
 {* ����� � ������� ������ ���� }
begin
 Result := '7.12';
end;//TK615938312_1.GetFolder

function TK615938312_1.GetModelElementGUID: AnsiString;
 {* ������������� �������� ������, ������� ��������� ���� }
begin
 Result := '56E7C07C02E3';
end;//TK615938312_1.GetModelElementGUID

initialization
 TestFramework.RegisterTest(TK615938312_1.Suite);
{$IfEnd} // Defined(nsTest) AND NOT Defined(NoScripts)

end.
