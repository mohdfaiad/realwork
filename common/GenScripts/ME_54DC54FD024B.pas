unit nsDocumentPreviewWithoutBlockNames;

// ������: "w:\garant6x\implementation\Garant\GbaNemesis\Search\nsDocumentPreviewWithoutBlockNames.pas"
// ���������: "SimpleClass"

{$Include w:\garant6x\implementation\Garant\nsDefine.inc}

interface

{$If NOT Defined(Admin)}
uses
 l3IntfUses
 , nsDocumentPreview
;

type
 TnsDocumentPreviewWithoutBlockNames = class(TnsDocumentPreview)
  protected
   function NeedAddBlockNames: Boolean; override;
    {* ����� �� ��������� ����� ������ }
 end;//TnsDocumentPreviewWithoutBlockNames
{$IfEnd} // NOT Defined(Admin)

implementation

{$If NOT Defined(Admin)}
uses
 l3ImplUses
;

function TnsDocumentPreviewWithoutBlockNames.NeedAddBlockNames: Boolean;
 {* ����� �� ��������� ����� ������ }
//#UC START# *4A2E97A4021B_54DC54FD024B_var*
//#UC END# *4A2E97A4021B_54DC54FD024B_var*
begin
//#UC START# *4A2E97A4021B_54DC54FD024B_impl*
 Result := False;
//#UC END# *4A2E97A4021B_54DC54FD024B_impl*
end;//TnsDocumentPreviewWithoutBlockNames.NeedAddBlockNames
{$IfEnd} // NOT Defined(Admin)

end.
