unit K604908954;
 {* [Requestlink:604908954] }

// ������: "w:\common\components\rtl\Garant\Daily\K604908954.pas"
// ���������: "TestCase"

{$Include TestDefine.inc.pas}

interface

{$If Defined(nsTest) AND NOT Defined(NoScripts)}
uses
 l3IntfUses
 , RTFtoEVDWriterTest
;

type
 TK604908954 = class(TRTFtoEVDWriterTest)
  {* [Requestlink:604908954] }
  protected
   function GetFolder: AnsiString; override;
    {* ����� � ������� ������ ���� }
   function GetModelElementGUID: AnsiString; override;
    {* ������������� �������� ������, ������� ��������� ���� }
 end;//TK604908954
{$IfEnd} // Defined(nsTest) AND NOT Defined(NoScripts)

implementation

{$If Defined(nsTest) AND NOT Defined(NoScripts)}
uses
 l3ImplUses
 , TestFrameWork
;

function TK604908954.GetFolder: AnsiString;
 {* ����� � ������� ������ ���� }
begin
 Result := '7.11';
end;//TK604908954.GetFolder

function TK604908954.GetModelElementGUID: AnsiString;
 {* ������������� �������� ������, ������� ��������� ���� }
begin
 Result := '55D6EC680274';
end;//TK604908954.GetModelElementGUID

initialization
 TestFramework.RegisterTest(TK604908954.Suite);
{$IfEnd} // Defined(nsTest) AND NOT Defined(NoScripts)

end.
