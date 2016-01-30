unit PrimBaseSearch_BaseSearch_UserType;
 {* ������� ����� }

// ������: "w:\garant6x\implementation\Garant\GbaNemesis\View\BaseSearch\Forms\PrimBaseSearch_BaseSearch_UserType.pas"
// ���������: "UserType"

{$Include nsDefine.inc}

interface

{$If NOT Defined(Admin) AND NOT Defined(Monitorings)}
uses
 l3IntfUses
 {$If NOT Defined(NoVCM)}
 , vcmUserControls
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoScripts)}
 , tfwInteger
 {$IfEnd} // NOT Defined(NoScripts)
;

const
 {* ��������� ��� ���� ����� BaseSearch }
 BaseSearchName = 'BaseSearch';
  {* ��������� ������������� ����������������� ���� "������� �����" }
 BaseSearch = TvcmUserType(0);
  {* ������� ����� }
{$IfEnd} // NOT Defined(Admin) AND NOT Defined(Monitorings)

implementation

{$If NOT Defined(Admin) AND NOT Defined(Monitorings)}
uses
 l3ImplUses
;

type
 {$If NOT Defined(NoScripts)}
 Tkw_FormUserType_BaseSearch = {final} class(TtfwInteger)
  {* ����� ������� ��� ���� ����� BaseSearch }
  protected
   class function GetWordNameForRegister: AnsiString; override;
   function GetInteger: Integer; override;
 end;//Tkw_FormUserType_BaseSearch
 {$IfEnd} // NOT Defined(NoScripts)

{$If NOT Defined(NoScripts)}
class function Tkw_FormUserType_BaseSearch.GetWordNameForRegister: AnsiString;
begin
 Result := '���_�����::BaseSearch';
end;//Tkw_FormUserType_BaseSearch.GetWordNameForRegister
{$IfEnd} // NOT Defined(NoScripts)

{$If NOT Defined(NoScripts)}
function Tkw_FormUserType_BaseSearch.GetInteger: Integer;
begin
 Result := BaseSearch;
end;//Tkw_FormUserType_BaseSearch.GetInteger
{$IfEnd} // NOT Defined(NoScripts)

initialization
{$If NOT Defined(NoScripts)}
 Tkw_FormUserType_BaseSearch.RegisterInEngine;
 {* ����������� Tkw_FormUserType_BaseSearch }
{$IfEnd} // NOT Defined(NoScripts)
{$IfEnd} // NOT Defined(Admin) AND NOT Defined(Monitorings)

end.
