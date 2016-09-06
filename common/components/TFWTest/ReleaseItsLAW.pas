unit ReleaseItsLAW;
 {*  (�������� �������) }

// ������: "w:\common\components\TFWTest\ReleaseItsLAW.pas"
// ���������: "TestResults"
// ������� ������: "ReleaseItsLAW" MUID: (F8EECE1AEED7)
// ��� ����: "TReleaseItsLAW"

interface

{$If Defined(nsTest) AND NOT Defined(NoScripts)}
uses
 l3IntfUses
 {$If NOT Defined(NotTunedDUnit)}
 , KTestRunner
 {$IfEnd} // NOT Defined(NotTunedDUnit)
;

type
 TReleaseItsLAW = class({$If NOT Defined(NotTunedDUnit)}
 TTestResultsPlace
 {$IfEnd} // NOT Defined(NotTunedDUnit)
 )
  {*  (�������� �������) }
  protected
   {$If NOT Defined(NotTunedDUnit)}
   class function IsLAW: Boolean; override;
   {$IfEnd} // NOT Defined(NotTunedDUnit)
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
 end;//TReleaseItsLAW
{$IfEnd} // Defined(nsTest) AND NOT Defined(NoScripts)

implementation

{$If Defined(nsTest) AND NOT Defined(NoScripts)}
uses
 l3ImplUses
 //#UC START# *F8EECE1AEED7impl_uses*
 //#UC END# *F8EECE1AEED7impl_uses*
;

{$If NOT Defined(NotTunedDUnit)}
class function TReleaseItsLAW.CommandLineKey: AnsiString;
 {* ���� ��������� ������ ��� �������� �������� ����� ������� ������ ����� ������������ ����������� }
begin
 Result := '-ItsLAW';
end;//TReleaseItsLAW.CommandLineKey

class function TReleaseItsLAW.TimesPage: Integer;
 {* �������� ��� ������ ������� ������� }
//#UC START# *4B7C0B43005B_F8EECE1AEED7_var*
//#UC END# *4B7C0B43005B_F8EECE1AEED7_var*
begin
//#UC START# *4B7C0B43005B_F8EECE1AEED7_impl*
 Result := 260441923;
//#UC END# *4B7C0B43005B_F8EECE1AEED7_impl*
end;//TReleaseItsLAW.TimesPage

class function TReleaseItsLAW.ResultsPage: Integer;
 {* �������� ��� ������ ����������� ������ }
//#UC START# *4B7C0B670215_F8EECE1AEED7_var*
//#UC END# *4B7C0B670215_F8EECE1AEED7_var*
begin
//#UC START# *4B7C0B670215_F8EECE1AEED7_impl*
 Result := 260441921;
//#UC END# *4B7C0B670215_F8EECE1AEED7_impl*
end;//TReleaseItsLAW.ResultsPage

class function TReleaseItsLAW.IsLAW: Boolean;
//#UC START# *4C35A6DA02E9_F8EECE1AEED7_var*
//#UC END# *4C35A6DA02E9_F8EECE1AEED7_var*
begin
//#UC START# *4C35A6DA02E9_F8EECE1AEED7_impl*
 Result := true;
//#UC END# *4C35A6DA02E9_F8EECE1AEED7_impl*
end;//TReleaseItsLAW.IsLAW
{$IfEnd} // NOT Defined(NotTunedDUnit)

{$IfEnd} // Defined(nsTest) AND NOT Defined(NoScripts)
end.
