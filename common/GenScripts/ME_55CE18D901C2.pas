unit K604929313;
 {* [RequestLink:604929313] }

// ������: "w:\common\components\rtl\Garant\Daily\K604929313.pas"
// ���������: "TestCase"

{$Include TestDefine.inc.pas}

interface

{$If Defined(nsTest) AND NOT Defined(NoScripts)}
uses
 l3IntfUses
 , EVDtoBothNSRCWriterTest
;

type
 TK604929313 = class(TEVDtoBothNSRCWriterTest)
  {* [RequestLink:604929313] }
  protected
   function GetFolder: AnsiString; override;
    {* ����� � ������� ������ ���� }
   function GetModelElementGUID: AnsiString; override;
    {* ������������� �������� ������, ������� ��������� ���� }
 end;//TK604929313
{$IfEnd} // Defined(nsTest) AND NOT Defined(NoScripts)

implementation

{$If Defined(nsTest) AND NOT Defined(NoScripts)}
uses
 l3ImplUses
 , TestFrameWork
;

function TK604929313.GetFolder: AnsiString;
 {* ����� � ������� ������ ���� }
begin
 Result := 'DecorText';
end;//TK604929313.GetFolder

function TK604929313.GetModelElementGUID: AnsiString;
 {* ������������� �������� ������, ������� ��������� ���� }
begin
 Result := '55CE18D901C2';
end;//TK604929313.GetModelElementGUID

initialization
 TestFramework.RegisterTest(TK604929313.Suite);
{$IfEnd} // Defined(nsTest) AND NOT Defined(NoScripts)

end.
