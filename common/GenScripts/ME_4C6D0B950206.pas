unit PrimSelectedAttributes_utSelectedAttributes_UserType;
 {* �����: ��������� �������� ��������� }

// ������: "w:\garant6x\implementation\Garant\GbaNemesis\View\LiteSearch\Forms\PrimSelectedAttributes_utSelectedAttributes_UserType.pas"
// ���������: "UserType"

{$Include w:\garant6x\implementation\Garant\nsDefine.inc}

interface

uses
 l3IntfUses
 {$If NOT Defined(NoVCM)}
 , vcmUserControls
 {$IfEnd} // NOT Defined(NoVCM)
;

const
 {* ��������� ��� ���� ����� utSelectedAttributes }
 utSelectedAttributesName = 'utSelectedAttributes';
  {* ��������� ������������� ����������������� ���� "�����: ��������� �������� ���������" }
 utSelectedAttributes = TvcmUserType(0);
  {* �����: ��������� �������� ��������� }

implementation

uses
 l3ImplUses
 {$If NOT Defined(NoScripts)}
 , tfwInteger
 {$IfEnd} // NOT Defined(NoScripts)
;

type
 {$If NOT Defined(NoScripts)}
 Tkw_FormUserType_utSelectedAttributes = {final} class(TtfwInteger)
  {* ����� ������� ��� ���� ����� utSelectedAttributes }
  protected
   class function GetWordNameForRegister: AnsiString; override;
   function GetInteger: Integer; override;
 end;//Tkw_FormUserType_utSelectedAttributes
 {$IfEnd} // NOT Defined(NoScripts)

{$If NOT Defined(NoScripts)}
class function Tkw_FormUserType_utSelectedAttributes.GetWordNameForRegister: AnsiString;
begin
 Result := '���_�����::utSelectedAttributes';
end;//Tkw_FormUserType_utSelectedAttributes.GetWordNameForRegister

function Tkw_FormUserType_utSelectedAttributes.GetInteger: Integer;
begin
 Result := utSelectedAttributes;
end;//Tkw_FormUserType_utSelectedAttributes.GetInteger
{$IfEnd} // NOT Defined(NoScripts)

initialization
{$If NOT Defined(NoScripts)}
 Tkw_FormUserType_utSelectedAttributes.RegisterInEngine;
 {* ����������� Tkw_FormUserType_utSelectedAttributes }
{$IfEnd} // NOT Defined(NoScripts)

end.
