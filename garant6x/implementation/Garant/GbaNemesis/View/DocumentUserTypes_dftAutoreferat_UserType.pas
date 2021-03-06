unit DocumentUserTypes_dftAutoreferat_UserType;
 {* �����. ��� ��������� ����� }

// ������: "w:\garant6x\implementation\Garant\GbaNemesis\View\DocumentUserTypes_dftAutoreferat_UserType.pas"
// ���������: "UserType"
// ������� ������: "dftAutoreferat" MUID: (4B04102D00B6)

{$Include w:\garant6x\implementation\Garant\nsDefine.inc}

interface

{$If NOT Defined(Admin) AND NOT Defined(Monitorings)}
uses
 l3IntfUses
 , DocumentUserTypes_dftMedDictEntry_UserType
 {$If NOT Defined(NoVCM)}
 , vcmUserControls
 {$IfEnd} // NOT Defined(NoVCM)
 , l3StringIDEx
;

const
 {* ������������ ������ dftAutoreferatLocalConstants }
 str_dftAutoreferatCaption: Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'dftAutoreferatCaption'; rValue : '�����. ��� ��������� �����');
  {* ��������� ����������������� ���� "�����. ��� ��������� �����" }
 str_dftAutoreferatSettingsCaption: Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'dftAutoreferatSettingsCaption'; rValue : '��������: �����. ��� ��������� �����');
  {* ��������� ����������������� ���� "�����. ��� ��������� �����" ��� ��������� ������� ������������ }
 {* ��������� ��� ���� ����� dftAutoreferat }
 dftAutoreferatName = 'dftAutoreferat';
  {* ��������� ������������� ����������������� ���� "�����. ��� ��������� �����" }
 dftAutoreferat = TvcmUserType(dftMedDictEntry + 1);
  {* �����. ��� ��������� ����� }
{$IfEnd} // NOT Defined(Admin) AND NOT Defined(Monitorings)

implementation

{$If NOT Defined(Admin) AND NOT Defined(Monitorings)}
uses
 l3ImplUses
 {$If NOT Defined(NoScripts)}
 , tfwInteger
 {$IfEnd} // NOT Defined(NoScripts)
;

{$If NOT Defined(NoScripts)}
type
 Tkw_FormUserType_dftAutoreferat = {final} class(TtfwInteger)
  {* ����� ������� ��� ���� ����� dftAutoreferat }
  protected
   function GetInteger: Integer; override;
   class function GetWordNameForRegister: AnsiString; override;
 end;//Tkw_FormUserType_dftAutoreferat
{$IfEnd} // NOT Defined(NoScripts)

{$If NOT Defined(NoScripts)}
function Tkw_FormUserType_dftAutoreferat.GetInteger: Integer;
begin
 Result := dftAutoreferat;
end;//Tkw_FormUserType_dftAutoreferat.GetInteger

class function Tkw_FormUserType_dftAutoreferat.GetWordNameForRegister: AnsiString;
begin
 Result := '���_�����::dftAutoreferat';
end;//Tkw_FormUserType_dftAutoreferat.GetWordNameForRegister
{$IfEnd} // NOT Defined(NoScripts)

initialization
 str_dftAutoreferatCaption.Init;
 {* ������������� str_dftAutoreferatCaption }
 str_dftAutoreferatSettingsCaption.Init;
 {* ������������� str_dftAutoreferatSettingsCaption }
{$If NOT Defined(NoScripts)}
 Tkw_FormUserType_dftAutoreferat.RegisterInEngine;
 {* ����������� Tkw_FormUserType_dftAutoreferat }
{$IfEnd} // NOT Defined(NoScripts)
{$IfEnd} // NOT Defined(Admin) AND NOT Defined(Monitorings)

end.
