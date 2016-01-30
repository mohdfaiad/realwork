unit K233015604;
 {* [$235869058] }

// ������: "w:\common\components\rtl\Garant\Daily\K233015604.pas"
// ���������: "TestCase"

{$Include TestDefine.inc.pas}

interface

{$If Defined(nsTest) AND NOT Defined(NoScripts)}
uses
 l3IntfUses
 {$If NOT Defined(NoVCM)}
 , ScrollTest
 {$IfEnd} // NOT Defined(NoVCM)
 , Types
;

type
 TK233015604 = class(TScrollTest)
  {* [$235869058] }
  protected
   {$If NOT Defined(NoVCM)}
   function GetNormalFontSize: Integer; override;
    {* ���������� ������ ������ ����� "����������". 0 - ��-��������� }
   {$IfEnd} // NOT Defined(NoVCM)
   {$If NOT Defined(NoVCM)}
   function FormExtent: TPoint; override;
    {* ������� ����� }
   {$IfEnd} // NOT Defined(NoVCM)
   function GetFolder: AnsiString; override;
    {* ����� � ������� ������ ���� }
   function GetModelElementGUID: AnsiString; override;
    {* ������������� �������� ������, ������� ��������� ���� }
 end;//TK233015604
{$IfEnd} // Defined(nsTest) AND NOT Defined(NoScripts)

implementation

{$If Defined(nsTest) AND NOT Defined(NoScripts)}
uses
 l3ImplUses
 , TestFrameWork
;

{$If NOT Defined(NoVCM)}
function TK233015604.GetNormalFontSize: Integer;
 {* ���������� ������ ������ ����� "����������". 0 - ��-��������� }
//#UC START# *4C07AC6F036D_4CBC3C0C0141_var*
//#UC END# *4C07AC6F036D_4CBC3C0C0141_var*
begin
//#UC START# *4C07AC6F036D_4CBC3C0C0141_impl*
 Result := 12;
//#UC END# *4C07AC6F036D_4CBC3C0C0141_impl*
end;//TK233015604.GetNormalFontSize
{$IfEnd} // NOT Defined(NoVCM)

{$If NOT Defined(NoVCM)}
function TK233015604.FormExtent: TPoint;
 {* ������� ����� }
//#UC START# *4C08CF700318_4CBC3C0C0141_var*
//#UC END# *4C08CF700318_4CBC3C0C0141_var*
begin
//#UC START# *4C08CF700318_4CBC3C0C0141_impl*
 Result.X := 768;
 Result.Y := 403;
//#UC END# *4C08CF700318_4CBC3C0C0141_impl*
end;//TK233015604.FormExtent
{$IfEnd} // NOT Defined(NoVCM)

function TK233015604.GetFolder: AnsiString;
 {* ����� � ������� ������ ���� }
begin
 Result := '7.6';
end;//TK233015604.GetFolder

function TK233015604.GetModelElementGUID: AnsiString;
 {* ������������� �������� ������, ������� ��������� ���� }
begin
 Result := '4CBC3C0C0141';
end;//TK233015604.GetModelElementGUID

initialization
 TestFramework.RegisterTest(TK233015604.Suite);
{$IfEnd} // Defined(nsTest) AND NOT Defined(NoScripts)

end.
