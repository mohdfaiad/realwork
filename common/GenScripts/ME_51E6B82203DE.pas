unit K471764286;
 {* [RequestLink:471764286] }

// ������: "w:\common\components\rtl\Garant\Daily\K471764286.pas"
// ���������: "TestCase"

{$Include w:\common\components\rtl\Garant\Daily\TestDefine.inc.pas}

interface

{$If Defined(nsTest) AND NOT Defined(NoScripts)}
uses
 l3IntfUses
 , EVDtoNSRCPlusWriterTest
;

type
 TK471764286 = class(TEVDtoNSRCPlusWriterTest)
  {* [RequestLink:471764286] }
  protected
   function GetFolder: AnsiString; override;
    {* ����� � ������� ������ ���� }
   function GetModelElementGUID: AnsiString; override;
    {* ������������� �������� ������, ������� ��������� ���� }
 end;//TK471764286
{$IfEnd} // Defined(nsTest) AND NOT Defined(NoScripts)

implementation

{$If Defined(nsTest) AND NOT Defined(NoScripts)}
uses
 l3ImplUses
 , TestFrameWork
;

function TK471764286.GetFolder: AnsiString;
 {* ����� � ������� ������ ���� }
begin
 Result := '7.9';
end;//TK471764286.GetFolder

function TK471764286.GetModelElementGUID: AnsiString;
 {* ������������� �������� ������, ������� ��������� ���� }
begin
 Result := '51E6B82203DE';
end;//TK471764286.GetModelElementGUID

initialization
 TestFramework.RegisterTest(TK471764286.Suite);
{$IfEnd} // Defined(nsTest) AND NOT Defined(NoScripts)

end.
