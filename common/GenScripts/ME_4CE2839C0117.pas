unit K217681225;
 {* [$217681225] }

// ������: "w:\common\components\rtl\Garant\Daily\K217681225.pas"
// ���������: "TestCase"

{$Include TestDefine.inc.pas}

interface

{$If Defined(nsTest) AND NOT Defined(NoScripts)}
uses
 l3IntfUses
 , ScrollByArrow
;

type
 TK217681225 = class(TScrollByArrow)
  {* [$217681225] }
  protected
   function GetFolder: AnsiString; override;
    {* ����� � ������� ������ ���� }
   function GetModelElementGUID: AnsiString; override;
    {* ������������� �������� ������, ������� ��������� ���� }
 end;//TK217681225
{$IfEnd} // Defined(nsTest) AND NOT Defined(NoScripts)

implementation

{$If Defined(nsTest) AND NOT Defined(NoScripts)}
uses
 l3ImplUses
 , TestFrameWork
;

function TK217681225.GetFolder: AnsiString;
 {* ����� � ������� ������ ���� }
begin
 Result := '7.6';
end;//TK217681225.GetFolder

function TK217681225.GetModelElementGUID: AnsiString;
 {* ������������� �������� ������, ������� ��������� ���� }
begin
 Result := '4CE2839C0117';
end;//TK217681225.GetModelElementGUID

initialization
 TestFramework.RegisterTest(TK217681225.Suite);
{$IfEnd} // Defined(nsTest) AND NOT Defined(NoScripts)

end.
