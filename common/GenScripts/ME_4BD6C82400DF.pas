unit PrimMedicListSynchroView_mlsfDrugList_UserType;
 {* ���������� �������� }

// ������: "w:\garant6x\implementation\Garant\GbaNemesis\View\Inpharm\Forms\PrimMedicListSynchroView_mlsfDrugList_UserType.pas"
// ���������: "UserType"

{$Include w:\garant6x\implementation\Garant\nsDefine.inc}

interface

{$If NOT Defined(Admin) AND NOT Defined(Monitorings)}
uses
 l3IntfUses
 {$If NOT Defined(NoVCM)}
 , vcmUserControls
 {$IfEnd} // NOT Defined(NoVCM)
;

const
 {* ��������� ��� ���� ����� mlsfDrugList }
 mlsfDrugListName = 'mlsfDrugList';
  {* ��������� ������������� ����������������� ���� "���������� ��������" }
 mlsfDrugList = TvcmUserType(0);
  {* ���������� �������� }
{$IfEnd} // NOT Defined(Admin) AND NOT Defined(Monitorings)

implementation

{$If NOT Defined(Admin) AND NOT Defined(Monitorings)}
uses
 l3ImplUses
 {$If NOT Defined(NoScripts)}
 , tfwInteger
 {$IfEnd} // NOT Defined(NoScripts)
;

type
 {$If NOT Defined(NoScripts)}
 Tkw_FormUserType_mlsfDrugList = {final} class(TtfwInteger)
  {* ����� ������� ��� ���� ����� mlsfDrugList }
  protected
   class function GetWordNameForRegister: AnsiString; override;
   function GetInteger: Integer; override;
 end;//Tkw_FormUserType_mlsfDrugList
 {$IfEnd} // NOT Defined(NoScripts)

{$If NOT Defined(NoScripts)}
class function Tkw_FormUserType_mlsfDrugList.GetWordNameForRegister: AnsiString;
begin
 Result := '���_�����::mlsfDrugList';
end;//Tkw_FormUserType_mlsfDrugList.GetWordNameForRegister

function Tkw_FormUserType_mlsfDrugList.GetInteger: Integer;
begin
 Result := mlsfDrugList;
end;//Tkw_FormUserType_mlsfDrugList.GetInteger
{$IfEnd} // NOT Defined(NoScripts)

initialization
{$If NOT Defined(NoScripts)}
 Tkw_FormUserType_mlsfDrugList.RegisterInEngine;
 {* ����������� Tkw_FormUserType_mlsfDrugList }
{$IfEnd} // NOT Defined(NoScripts)
{$IfEnd} // NOT Defined(Admin) AND NOT Defined(Monitorings)

end.
