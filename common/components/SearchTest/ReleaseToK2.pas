unit ReleaseToK2;
 {*  (�������� �������) }

// ������: "w:\common\components\SearchTest\ReleaseToK2.pas"
// ���������: "TestResults"
// ������� ������: "ReleaseToK2" MUID: (CFD0344B37B4)
// ��� ����: "TReleaseToK2"

interface

{$If Defined(nsTest)}
uses
 l3IntfUses
 {$If NOT Defined(NotTunedDUnit)}
 , KTestRunner
 {$IfEnd} // NOT Defined(NotTunedDUnit)
;

type
 TReleaseToK2 = class({$If NOT Defined(NotTunedDUnit)}
 TTestResultsPlace
 {$IfEnd} // NOT Defined(NotTunedDUnit)
 )
  {*  (�������� �������) }
  public
   {$If NOT Defined(NotTunedDUnit)}
   class function CommandLineKey: AnsiString; override;
    {* ���� ��������� ������ ��� �������� �������� ����� ������� ������ ����� ������������ ����������� }
   {$IfEnd} // NOT Defined(NotTunedDUnit)
   {$If NOT Defined(NotTunedDUnit)}
   class function TimesPage: Integer; override;
    {* �������� ��� ������ ������� ������� }
   {$IfEnd} // NOT Defined(NotTunedDUnit)
   {$If NOT Defined(NotTunedDUnit)}
   class function ResultsPage: Integer; override;
    {* �������� ��� ������ ����������� ������ }
   {$IfEnd} // NOT Defined(NotTunedDUnit)
 end;//TReleaseToK2
{$IfEnd} // Defined(nsTest)

implementation

{$If Defined(nsTest)}
uses
 l3ImplUses
 //#UC START# *CFD0344B37B4impl_uses*
 //#UC END# *CFD0344B37B4impl_uses*
;

{$If NOT Defined(NotTunedDUnit)}
class function TReleaseToK2.CommandLineKey: AnsiString;
 {* ���� ��������� ������ ��� �������� �������� ����� ������� ������ ����� ������������ ����������� }
begin
 Result := '-ToK2';
end;//TReleaseToK2.CommandLineKey

class function TReleaseToK2.TimesPage: Integer;
 {* �������� ��� ������ ������� ������� }
//#UC START# *4B7C0B43005B_CFD0344B37B4_var*
//#UC END# *4B7C0B43005B_CFD0344B37B4_var*
begin
//#UC START# *4B7C0B43005B_CFD0344B37B4_impl*
 !!! Needs to be implemented !!!
//#UC END# *4B7C0B43005B_CFD0344B37B4_impl*
end;//TReleaseToK2.TimesPage

class function TReleaseToK2.ResultsPage: Integer;
 {* �������� ��� ������ ����������� ������ }
//#UC START# *4B7C0B670215_CFD0344B37B4_var*
//#UC END# *4B7C0B670215_CFD0344B37B4_var*
begin
//#UC START# *4B7C0B670215_CFD0344B37B4_impl*
 !!! Needs to be implemented !!!
//#UC END# *4B7C0B670215_CFD0344B37B4_impl*
end;//TReleaseToK2.ResultsPage
{$IfEnd} // NOT Defined(NotTunedDUnit)

{$IfEnd} // Defined(nsTest)
end.
