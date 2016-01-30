unit K265409725;
 {* [$265409725] }

// ������: "w:\common\components\rtl\Garant\Daily\K265409725.pas"
// ���������: "TestCase"

{$Include TestDefine.inc.pas}

interface

{$If Defined(nsTest) AND NOT Defined(NoScripts)}
uses
 l3IntfUses
 , DrawTest
 , Types
;

type
 TK265409725 = class(TDrawTest)
  {* [$265409725] }
  protected
   {$If NOT Defined(NoVCM)}
   function FormExtent: TPoint; override;
    {* ������� ����� }
   {$IfEnd} // NOT Defined(NoVCM)
   function GetFolder: AnsiString; override;
    {* ����� � ������� ������ ���� }
   function GetModelElementGUID: AnsiString; override;
    {* ������������� �������� ������, ������� ��������� ���� }
 end;//TK265409725
{$IfEnd} // Defined(nsTest) AND NOT Defined(NoScripts)

implementation

{$If Defined(nsTest) AND NOT Defined(NoScripts)}
uses
 l3ImplUses
 , TestFrameWork
;

{$If NOT Defined(NoVCM)}
function TK265409725.FormExtent: TPoint;
 {* ������� ����� }
//#UC START# *4C08CF700318_4DEDC61B02A0_var*
//#UC END# *4C08CF700318_4DEDC61B02A0_var*
begin
//#UC START# *4C08CF700318_4DEDC61B02A0_impl*
 Result.X := 1024;
 Result.Y := 710; 
//#UC END# *4C08CF700318_4DEDC61B02A0_impl*
end;//TK265409725.FormExtent
{$IfEnd} // NOT Defined(NoVCM)

function TK265409725.GetFolder: AnsiString;
 {* ����� � ������� ������ ���� }
begin
 Result := '7.7';
end;//TK265409725.GetFolder

function TK265409725.GetModelElementGUID: AnsiString;
 {* ������������� �������� ������, ������� ��������� ���� }
begin
 Result := '4DEDC61B02A0';
end;//TK265409725.GetModelElementGUID

initialization
 TestFramework.RegisterTest(TK265409725.Suite);
{$IfEnd} // Defined(nsTest) AND NOT Defined(NoScripts)

end.
