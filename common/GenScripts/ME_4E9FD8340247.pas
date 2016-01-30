unit evdHyperlinkEliminator;
 {* ������, ��������� ��� ����������� � ��������� }

// ������: "w:\common\components\rtl\Garant\EVD\evdHyperlinkEliminator.pas"
// ���������: "SimpleClass"

{$Include evdDefine.inc}

interface

uses
 l3IntfUses
 , evdLeafParaFilter
 , k2Base
 , l3Variant
;

type
 TevdHyperlinkEliminator = class(TevdLeafParaFilter)
  {* ������, ��������� ��� ����������� � ��������� }
  protected
   function ParaTypeForFiltering: Tk2Type; override;
    {* �������, ������������ ��� �������, ��� ������� ����� ����������� ���������� }
   function NeedWritePara(aLeaf: Tl3Variant): Boolean; override;
    {* ���������� ����� �� ����������� ���������� ����� }
 end;//TevdHyperlinkEliminator

implementation

uses
 l3ImplUses
 , HyperLink_Const
;

function TevdHyperlinkEliminator.ParaTypeForFiltering: Tk2Type;
 {* �������, ������������ ��� �������, ��� ������� ����� ����������� ���������� }
//#UC START# *49E488070386_4E9FD8340247_var*
//#UC END# *49E488070386_4E9FD8340247_var*
begin
//#UC START# *49E488070386_4E9FD8340247_impl*
 Result := k2_typHyperLink;
//#UC END# *49E488070386_4E9FD8340247_impl*
end;//TevdHyperlinkEliminator.ParaTypeForFiltering

function TevdHyperlinkEliminator.NeedWritePara(aLeaf: Tl3Variant): Boolean;
 {* ���������� ����� �� ����������� ���������� ����� }
//#UC START# *49E48829016F_4E9FD8340247_var*
//#UC END# *49E48829016F_4E9FD8340247_var*
begin
//#UC START# *49E48829016F_4E9FD8340247_impl*
 Result := False;
//#UC END# *49E48829016F_4E9FD8340247_impl*
end;//TevdHyperlinkEliminator.NeedWritePara

end.
