unit dsBaseContentsRes;

// ������: "w:\garant6x\implementation\Garant\GbaNemesis\Business\Document\dsBaseContentsRes.pas"
// ���������: "UtilityPack"
// ������� ������: "dsBaseContentsRes" MUID: (4D416F1300DB)

{$Include w:\garant6x\implementation\Garant\nsDefine.inc}

interface

{$If NOT Defined(Admin) AND NOT Defined(Monitorings)}
uses
 l3IntfUses
 , l3StringIDEx
;

const
 {* ������������ ������ Local }
 str_CommentStub: Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'CommentStub'; rValue : '����������� �%d � ��������� %d');
  {* '����������� �%d � ��������� %d' }
{$IfEnd} // NOT Defined(Admin) AND NOT Defined(Monitorings)

implementation

{$If NOT Defined(Admin) AND NOT Defined(Monitorings)}
uses
 l3ImplUses
;

initialization
 str_CommentStub.Init;
 {* ������������� str_CommentStub }
{$IfEnd} // NOT Defined(Admin) AND NOT Defined(Monitorings)

end.
