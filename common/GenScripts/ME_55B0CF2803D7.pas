unit f1StartupCompletedServiceImpl;

// ������: "w:\garant6x\implementation\Garant\GbaNemesis\View\Search\f1StartupCompletedServiceImpl.pas"
// ���������: "ServiceImplementation"
// ������� ������: "Tf1StartupCompletedServiceImpl" MUID: (55B0CF2803D7)

{$Include w:\garant6x\implementation\Garant\nsDefine.inc}

interface

{$If NOT Defined(Admin) AND NOT Defined(Monitorings)}
uses
 l3IntfUses
 , l3ProtoObject
 , f1StartupCompletedService
 //#UC START# *55B0CF2803D7intf_uses*
 //#UC END# *55B0CF2803D7intf_uses*
;

type
 //#UC START# *55B0CF2803D7ci*
 //#UC END# *55B0CF2803D7ci*
 //#UC START# *55B0CF2803D7cit*
 //#UC END# *55B0CF2803D7cit*
 Tf1StartupCompletedServiceImpl = {final} class(Tl3ProtoObject, If1StartupCompletedService)
  private
   f_NeedAskToFillPrimeAtStartup: Boolean;
   f_NeedShowSettingsDialog: Boolean;
  protected
   procedure InitFields; override;
  public
   procedure StartupComplete;
   class function Instance: Tf1StartupCompletedServiceImpl;
    {* ����� ��������� ���������� ���������� Tf1StartupCompletedServiceImpl }
   class function Exists: Boolean;
    {* ��������� ������ ��������� ���������� ��� ��� }
  public
   property NeedAskToFillPrimeAtStartup: Boolean
    read f_NeedAskToFillPrimeAtStartup
    write f_NeedAskToFillPrimeAtStartup;
   property NeedShowSettingsDialog: Boolean
    read f_NeedShowSettingsDialog
    write f_NeedShowSettingsDialog;
 //#UC START# *55B0CF2803D7publ*
 //#UC END# *55B0CF2803D7publ*
 end;//Tf1StartupCompletedServiceImpl
{$IfEnd} // NOT Defined(Admin) AND NOT Defined(Monitorings)

implementation

{$If NOT Defined(Admin) AND NOT Defined(Monitorings)}
uses
 l3ImplUses
 , l3StringIDEx
 , l3MessageID
 , PrimMonitorings_Module
 , SysUtils
 , l3Base
 {$If NOT Defined(NoVCL)}
 , Dialogs
 {$IfEnd} // NOT Defined(NoVCL)
 //#UC START# *55B0CF2803D7impl_uses*
 , StdRes
 , vcmMessagesSupport
 //#UC END# *55B0CF2803D7impl_uses*
;

var g_Tf1StartupCompletedServiceImpl: Tf1StartupCompletedServiceImpl = nil;
 {* ��������� ���������� Tf1StartupCompletedServiceImpl }

const
 {* ������������ ������ Messages For User }
 str_StartupInitPrime: Tl3MessageID = (rS : -1; rLocalized : false; rKey : 'StartupInitPrime'; rValue : '��������� ������������!'#13#10 + 
'� ����� ������ ������� ������ �� ������ �������������� ����������� � ������������� �������������� ��������� ����� �����.' + 
' �������� ��������� ����� �� ���������, �� ������ ������ � ����� ��������� �������� ����������������, ���������� ����� ���������������� ���������.');
  {* '��������� ������������!'#13#10 + 
'� ����� ������ ������� ������ �� ������ �������������� ����������� � ������������� �������������� ��������� ����� �����.' + 
' �������� ��������� ����� �� ���������, �� ������ ������ � ����� ��������� �������� ����������������, ���������� ����� ���������������� ���������.' }
 str_DefaultSetttingsWereChanged: Tl3MessageID = (rS : -1; rLocalized : false; rKey : 'DefaultSetttingsWereChanged'; rValue : '� ����� ������ �������� ������������ �� ��������� ������������ ����������������� ����������. ����� ��������� �������� ������ � ��������, ��������� �� ����� ������� �������.'#13#10 + 
'������������, � ������� �� �������� ������, ���������. ��� ��������� � ��� �������� � ������� ���������� ���� ����� ����� ������ ������������.');
  {* '� ����� ������ �������� ������������ �� ��������� ������������ ����������������� ����������. ����� ��������� �������� ������ � ��������, ��������� �� ����� ������� �������.'#13#10 + 
'������������, � ������� �� �������� ������, ���������. ��� ��������� � ��� �������� � ������� ���������� ���� ����� ����� ������ ������������.' }
 {* �������� ������ ��� ������� StartupInitPrime }
 str_StartupInitPrime_Choice_Init: Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'StartupInitPrime_Choice_Init'; rValue : '��������� ����� �����');
  {* '��������� ����� �����' }
 str_StartupInitPrime_Choice_NoThanks: Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'StartupInitPrime_Choice_NoThanks'; rValue : '������ ������ � ��������');
  {* '������ ������ � ��������' }

procedure Tf1StartupCompletedServiceImplFree;
 {* ����� ������������ ���������� ���������� Tf1StartupCompletedServiceImpl }
begin
 l3Free(g_Tf1StartupCompletedServiceImpl);
end;//Tf1StartupCompletedServiceImplFree

procedure Tf1StartupCompletedServiceImpl.StartupComplete;
//#UC START# *2627E933260B_55B0CF2803D7_var*
//#UC END# *2627E933260B_55B0CF2803D7_var*
begin
//#UC START# *2627E933260B_55B0CF2803D7_impl*
 if NeedAskToFillPrimeAtStartup then
 begin
  NeedAskToFillPrimeAtStartup := False;
  if vcmAsk(str_StartupInitPrime, []) then
   TPrimMonitoringsModule.OpenNewsLinePrim;
 end;

 if NeedShowSettingsDialog then
 begin
  NeedShowSettingsDialog := False;
  vcmAsk(str_DefaultSetttingsWereChanged, []);
 end;
//#UC END# *2627E933260B_55B0CF2803D7_impl*
end;//Tf1StartupCompletedServiceImpl.StartupComplete

class function Tf1StartupCompletedServiceImpl.Instance: Tf1StartupCompletedServiceImpl;
 {* ����� ��������� ���������� ���������� Tf1StartupCompletedServiceImpl }
begin
 if (g_Tf1StartupCompletedServiceImpl = nil) then
 begin
  l3System.AddExitProc(Tf1StartupCompletedServiceImplFree);
  g_Tf1StartupCompletedServiceImpl := Create;
 end;
 Result := g_Tf1StartupCompletedServiceImpl;
end;//Tf1StartupCompletedServiceImpl.Instance

class function Tf1StartupCompletedServiceImpl.Exists: Boolean;
 {* ��������� ������ ��������� ���������� ��� ��� }
begin
 Result := g_Tf1StartupCompletedServiceImpl <> nil;
end;//Tf1StartupCompletedServiceImpl.Exists

procedure Tf1StartupCompletedServiceImpl.InitFields;
//#UC START# *47A042E100E2_55B0CF2803D7_var*
//#UC END# *47A042E100E2_55B0CF2803D7_var*
begin
//#UC START# *47A042E100E2_55B0CF2803D7_impl*
 inherited;
 f_NeedAskToFillPrimeAtStartup := False;
 f_NeedShowSettingsDialog := False;
//#UC END# *47A042E100E2_55B0CF2803D7_impl*
end;//Tf1StartupCompletedServiceImpl.InitFields

//#UC START# *55B0CF2803D7impl*
//#UC END# *55B0CF2803D7impl*

initialization
 str_StartupInitPrime.Init;
 str_StartupInitPrime.AddChoice(str_StartupInitPrime_Choice_Init);
 str_StartupInitPrime.AddChoice(str_StartupInitPrime_Choice_NoThanks);
 str_StartupInitPrime.AddDefaultChoice(str_StartupInitPrime_Choice_Init);
 str_StartupInitPrime.SetDlgType(mtInformation);
 {* ������������� str_StartupInitPrime }
 str_DefaultSetttingsWereChanged.Init;
 str_DefaultSetttingsWereChanged.SetDlgType(mtInformation);
 {* ������������� str_DefaultSetttingsWereChanged }
 str_StartupInitPrime_Choice_Init.Init;
 {* ������������� str_StartupInitPrime_Choice_Init }
 str_StartupInitPrime_Choice_NoThanks.Init;
 {* ������������� str_StartupInitPrime_Choice_NoThanks }
 Tf1StartupCompletedService.Instance.Alien := Tf1StartupCompletedServiceImpl.Instance;
 {* ����������� Tf1StartupCompletedServiceImpl }
{$IfEnd} // NOT Defined(Admin) AND NOT Defined(Monitorings)

end.
