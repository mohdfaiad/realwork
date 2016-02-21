unit PrimContactList_chatAddContact_UserType;
 {* �������� ������� }

// ������: "w:\garant6x\implementation\Garant\GbaNemesis\View\Chat\Forms\PrimContactList_chatAddContact_UserType.pas"
// ���������: "UserType"

{$Include w:\garant6x\implementation\Garant\nsDefine.inc}

interface

{$If NOT Defined(Admin) AND NOT Defined(Monitorings)}
uses
 l3IntfUses
 , PrimContactList_chatContacts_UserType
 {$If NOT Defined(NoVCM)}
 , vcmUserControls
 {$IfEnd} // NOT Defined(NoVCM)
;

const
 {* ��������� ��� ���� ����� chatAddContact }
 chatAddContactName = 'chatAddContact';
  {* ��������� ������������� ����������������� ���� "�������� �������" }
 chatAddContact = TvcmUserType(chatContacts + 1);
  {* �������� ������� }
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
 Tkw_FormUserType_chatAddContact = {final} class(TtfwInteger)
  {* ����� ������� ��� ���� ����� chatAddContact }
  protected
   class function GetWordNameForRegister: AnsiString; override;
   function GetInteger: Integer; override;
 end;//Tkw_FormUserType_chatAddContact
 {$IfEnd} // NOT Defined(NoScripts)

{$If NOT Defined(NoScripts)}
class function Tkw_FormUserType_chatAddContact.GetWordNameForRegister: AnsiString;
begin
 Result := '���_�����::chatAddContact';
end;//Tkw_FormUserType_chatAddContact.GetWordNameForRegister

function Tkw_FormUserType_chatAddContact.GetInteger: Integer;
begin
 Result := chatAddContact;
end;//Tkw_FormUserType_chatAddContact.GetInteger
{$IfEnd} // NOT Defined(NoScripts)

initialization
{$If NOT Defined(NoScripts)}
 Tkw_FormUserType_chatAddContact.RegisterInEngine;
 {* ����������� Tkw_FormUserType_chatAddContact }
{$IfEnd} // NOT Defined(NoScripts)
{$IfEnd} // NOT Defined(Admin) AND NOT Defined(Monitorings)

end.
