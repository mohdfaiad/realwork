unit K616562811;
 {* ���� �� ������ ��������� ����� �� RTF (�����, ������� �� ������ ������������). }

// ������: "w:\common\components\rtl\Garant\Daily\K616562811.pas"
// ���������: "TestCase"

{$Include TestDefine.inc.pas}

interface

{$If Defined(nsTest) AND NOT Defined(NoScripts)}
uses
 l3IntfUses
 , RTFtoEVDWriterTest
;

type
 TK616562811 = class(TRTFtoEVDWriterTest)
  {* ���� �� ������ ��������� ����� �� RTF (�����, ������� �� ������ ������������). }
  protected
   function GetFolder: AnsiString; override;
    {* ����� � ������� ������ ���� }
   function GetModelElementGUID: AnsiString; override;
    {* ������������� �������� ������, ������� ��������� ���� }
 end;//TK616562811
{$IfEnd} // Defined(nsTest) AND NOT Defined(NoScripts)

implementation

{$If Defined(nsTest) AND NOT Defined(NoScripts)}
uses
 l3ImplUses
 , TestFrameWork
;

function TK616562811.GetFolder: AnsiString;
 {* ����� � ������� ������ ���� }
begin
 Result := '7.12';
end;//TK616562811.GetFolder

function TK616562811.GetModelElementGUID: AnsiString;
 {* ������������� �������� ������, ������� ��������� ���� }
begin
 Result := '56AB2BA20338';
end;//TK616562811.GetModelElementGUID

initialization
 TestFramework.RegisterTest(TK616562811.Suite);
{$IfEnd} // Defined(nsTest) AND NOT Defined(NoScripts)

end.
