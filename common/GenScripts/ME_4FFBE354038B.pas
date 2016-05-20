{$IfNDef DocumentWithFlashUserTypes_imp}

// ������: "w:\garant6x\implementation\Garant\GbaNemesis\View\DocumentWithFlashUserTypes.imp.pas"
// ���������: "VCMForm"
// ������� ������: "DocumentWithFlashUserTypes" MUID: (4FFBE354038B)
// ��� ����: "_DocumentWithFlashUserTypes_"

{$Define DocumentWithFlashUserTypes_imp}

{$If NOT Defined(Admin) AND NOT Defined(Monitorings)}
 _DocumentWithFlashUserTypes_ = {abstract} class(_DocumentWithFlashUserTypes_Parent_)
  protected
   {$If NOT Defined(NoVCM)}
   procedure MakeControls; override;
   {$IfEnd} // NOT Defined(NoVCM)
 end;//_DocumentWithFlashUserTypes_

{$Else NOT Defined(Admin) AND NOT Defined(Monitorings)}

_DocumentWithFlashUserTypes_ = _DocumentWithFlashUserTypes_Parent_;

{$IfEnd} // NOT Defined(Admin) AND NOT Defined(Monitorings)
{$Else DocumentWithFlashUserTypes_imp}

{$IfNDef DocumentWithFlashUserTypes_imp_impl}

{$Define DocumentWithFlashUserTypes_imp_impl}

{$If NOT Defined(Admin) AND NOT Defined(Monitorings)}
const
 {* ������������ ������ dwftMainLocalConstants }
 str_dwftMainCaption: Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'dwftMainCaption'; rValue : '�����');
  {* ��������� ����������������� ���� "�����" }
 {* ������������ ������ dwftSynchroLocalConstants }
 str_dwftSynchroCaption: Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'dwftSynchroCaption'; rValue : '����� (���������� ��������)');
  {* ��������� ����������������� ���� "����� (���������� ��������)" }
 str_dwftSynchroSettingsCaption: Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'dwftSynchroSettingsCaption'; rValue : '���������� ��������: �����');
  {* ��������� ����������������� ���� "����� (���������� ��������)" ��� ��������� ������� ������������ }

{$If NOT Defined(NoVCM)}
procedure _DocumentWithFlashUserTypes_.MakeControls;
begin
 inherited;
 with AddUsertype(dwftMainName,
  str_dwftMainCaption,
  str_dwftMainCaption,
  False,
  21,
  -1,
  '',
  nil,
  nil,
  nil,
  vcm_ccNone) do
 begin
 end;//with AddUsertype(dwftMainName
 with AddUsertype(dwftSynchroName,
  str_dwftSynchroCaption,
  str_dwftSynchroSettingsCaption,
  False,
  -1,
  -1,
  '',
  nil,
  nil,
  nil,
  vcm_ccNone) do
 begin
 end;//with AddUsertype(dwftSynchroName
end;//_DocumentWithFlashUserTypes_.MakeControls
{$IfEnd} // NOT Defined(NoVCM)

{$Else DocumentWithFlashUserTypes_imp_impl}

 str_dwftMainCaption.Init;
 {* ������������� str_dwftMainCaption }
 str_dwftSynchroCaption.Init;
 {* ������������� str_dwftSynchroCaption }
 str_dwftSynchroSettingsCaption.Init;
 {* ������������� str_dwftSynchroSettingsCaption }
{$IfEnd} // NOT Defined(Admin) AND NOT Defined(Monitorings)

{$EndIf DocumentWithFlashUserTypes_imp_impl}

{$EndIf DocumentWithFlashUserTypes_imp}

