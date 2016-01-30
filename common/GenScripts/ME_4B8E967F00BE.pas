unit vcmMenuManagerRes;

// ������: "w:\common\components\gui\Garant\VCM\implementation\vcmMenuManagerRes.pas"
// ���������: "UtilityPack"

{$Include vcmDefine.inc}

interface

{$If NOT Defined(NoVCM)}
uses
 l3IntfUses
 , l3StringIDEx
;

const
 {* ������������ ������ TvcmUserTypeHints }
 str_vcmCloseHint: Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'vcmCloseHint'; rValue : '�������');
  {* '�������' }
 str_vcmMaximizedHint: Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'vcmMaximizedHint'; rValue : '������� � ����� ����');
  {* '������� � ����� ����' }
 str_vcmOpenHint: Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'vcmOpenHint'; rValue : '������� � ������� ����');
  {* '������� � ������� ����' }
{$IfEnd} // NOT Defined(NoVCM)

implementation

{$If NOT Defined(NoVCM)}
uses
 l3ImplUses
 , l3MessageID
;

initialization
 str_vcmCloseHint.Init;
 {* ������������� str_vcmCloseHint }
 str_vcmMaximizedHint.Init;
 {* ������������� str_vcmMaximizedHint }
 str_vcmOpenHint.Init;
 {* ������������� str_vcmOpenHint }
{$IfEnd} // NOT Defined(NoVCM)

end.
