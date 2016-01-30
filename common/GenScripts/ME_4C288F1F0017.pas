unit K165514106;
 {* [RequestLink:165514106] }

// ������: "w:\common\components\rtl\Garant\Daily\K165514106.pas"
// ���������: "TestCase"

{$Include TestDefine.inc.pas}

interface

{$If Defined(nsTest) AND NOT Defined(NoScripts)}
uses
 l3IntfUses
 {$If NOT Defined(NoVCM)}
 , TwoEmptyParaForOneReplacerTest
 {$IfEnd} // NOT Defined(NoVCM)
;

type
 TK165514106 = class(TTwoEmptyParaForOneReplacerTest)
  {* [RequestLink:165514106] }
  protected
   function GetFolder: AnsiString; override;
    {* ����� � ������� ������ ���� }
   function GetModelElementGUID: AnsiString; override;
    {* ������������� �������� ������, ������� ��������� ���� }
 end;//TK165514106
{$IfEnd} // Defined(nsTest) AND NOT Defined(NoScripts)

implementation

{$If Defined(nsTest) AND NOT Defined(NoScripts)}
uses
 l3ImplUses
 , TestFrameWork
;

function TK165514106.GetFolder: AnsiString;
 {* ����� � ������� ������ ���� }
begin
 Result := '7.6';
end;//TK165514106.GetFolder

function TK165514106.GetModelElementGUID: AnsiString;
 {* ������������� �������� ������, ������� ��������� ���� }
begin
 Result := '4C288F1F0017';
end;//TK165514106.GetModelElementGUID

initialization
 TestFramework.RegisterTest(TK165514106.Suite);
{$IfEnd} // Defined(nsTest) AND NOT Defined(NoScripts)

end.
