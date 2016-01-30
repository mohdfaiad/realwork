unit PrimDocumentListFromFile_Module;
 {* ������ ���������� �� ����� }

// ������: "w:\garant6x\implementation\Garant\GbaNemesis\View\DocumentListFromFile\PrimDocumentListFromFile_Module.pas"
// ���������: "VCMFormsPack"

{$Include nsDefine.inc}

interface

{$If NOT Defined(Admin) AND NOT Defined(Monitorings)}
uses
 l3IntfUses
 , l3StringIDEx
;

type
 TPrimDocumentListFromFileModule = class
  {* ������ ���������� �� ����� }
  private
   procedure OpenDocumentListFromFile;
    {* ������� ������ ���������� �� ����� }
 end;//TPrimDocumentListFromFileModule
{$IfEnd} // NOT Defined(Admin) AND NOT Defined(Monitorings)

implementation

{$If NOT Defined(Admin) AND NOT Defined(Monitorings)}
uses
 l3ImplUses
 {$If NOT Defined(NoVCM)}
 , vcmMessagesSupport
 {$IfEnd} // NOT Defined(NoVCM)
 , l3MessageID
 {$If NOT Defined(NoVCL)}
 , Dialogs
 {$IfEnd} // NOT Defined(NoVCL)
 , DataAdapter
 , DynamicDocListUnit
 , SysUtils
 , nsTypes
 , deListSet
 , afwFacade
 {$If NOT Defined(NoVCM)}
 , vcmBase
 {$IfEnd} // NOT Defined(NoVCM)
 , BaseTypesUnit
 , nsOpenDialog
 , bsOpenListInfo
 , PrimPrimListInterfaces
;

const
 {* ������������ ������ Local }
 str_AccessDenied: Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'AccessDenied'; rValue : '��� ������� � �����');
  {* '��� ������� � �����' }
 str_InvalidType: Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'InvalidType'; rValue : '�������� ��� �����');
  {* '�������� ��� �����' }
 str_ImportDocuments: Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'ImportDocuments'; rValue : '������������� ����������');
  {* '������������� ����������' }

procedure TPrimDocumentListFromFileModule.OpenDocumentListFromFile;
 {* ������� ������ ���������� �� ����� }
//#UC START# *4DA44BDB01D9_4DA44B2C01BB_var*
//#UC END# *4DA44BDB01D9_4DA44B2C01BB_var*
begin
//#UC START# *4DA44BDB01D9_4DA44B2C01BB_impl*
 !!! Needs to be implemented !!!
//#UC END# *4DA44BDB01D9_4DA44B2C01BB_impl*
end;//TPrimDocumentListFromFileModule.OpenDocumentListFromFile

initialization
 str_AccessDenied.Init;
 {* ������������� str_AccessDenied }
 str_InvalidType.Init;
 {* ������������� str_InvalidType }
 str_ImportDocuments.Init;
 {* ������������� str_ImportDocuments }
{$IfEnd} // NOT Defined(Admin) AND NOT Defined(Monitorings)

end.
