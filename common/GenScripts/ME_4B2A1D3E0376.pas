unit TestMMX;

// ������: "w:\common\components\rtl\Garant\Daily\TestMMX.pas"
// ���������: "TestCase"

{$Include w:\common\components\rtl\Garant\Daily\TestDefine.inc.pas}

interface

{$If Defined(nsTest) AND NOT Defined(NoScripts)}
uses
 l3IntfUses
 {$If NOT Defined(NotTunedDUnit)}
 , BaseTest
 {$IfEnd} // NOT Defined(NotTunedDUnit)
;

type
 TTestMMX = class(TBaseTest)
  protected
   function GetFolder: AnsiString; override;
    {* ����� � ������� ������ ���� }
   function GetModelElementGUID: AnsiString; override;
    {* ������������� �������� ������, ������� ��������� ���� }
  public
   procedure DoMMX;
 end;//TTestMMX
{$IfEnd} // Defined(nsTest) AND NOT Defined(NoScripts)

implementation

{$If Defined(nsTest) AND NOT Defined(NoScripts)}
uses
 l3ImplUses
 , TestFrameWork
 , l3Base
;

procedure TTestMMX.DoMMX;
//#UC START# *4B2A1D6D001D_4B2A1D3E0376_var*
//#UC END# *4B2A1D6D001D_4B2A1D3E0376_var*
begin
//#UC START# *4B2A1D6D001D_4B2A1D3E0376_impl*
 {$IfDef l3UseMMX}
 ToLog('l3UseMMX enabled');
 Check(MMX_Supported);
 {$Else  l3UseMMX}
 ToLog('l3UseMMX disabled');
 {$EndIf l3UseMMX}
//#UC END# *4B2A1D6D001D_4B2A1D3E0376_impl*
end;//TTestMMX.DoMMX

function TTestMMX.GetFolder: AnsiString;
 {* ����� � ������� ������ ���� }
begin
 Result := 'Core';
end;//TTestMMX.GetFolder

function TTestMMX.GetModelElementGUID: AnsiString;
 {* ������������� �������� ������, ������� ��������� ���� }
begin
 Result := '4B2A1D3E0376';
end;//TTestMMX.GetModelElementGUID

initialization
 TestFramework.RegisterTest(TTestMMX.Suite);
{$IfEnd} // Defined(nsTest) AND NOT Defined(NoScripts)

end.
