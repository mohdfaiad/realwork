unit nscCustomTreeComboWithHistoryRes;
 {* ������� ��� TnscCustomTreeComboWithHistory }

// ������: "w:\common\components\gui\Garant\Nemesis\nscCustomTreeComboWithHistoryRes.pas"
// ���������: "UtilityPack"

{$Include nscDefine.inc}

interface

{$If Defined(Nemesis)}
uses
 l3IntfUses
 , l3StringIDEx
;

const
 {* ������������ ������ MiscMessages }
 str_nsc_CloseHyperlinkText: Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'nsc_CloseHyperlinkText'; rValue : '�������');
  {* '�������' }
{$IfEnd} // Defined(Nemesis)

implementation

{$If Defined(Nemesis)}
uses
 l3ImplUses
 , l3MessageID
;

initialization
 str_nsc_CloseHyperlinkText.Init;
 {* ������������� str_nsc_CloseHyperlinkText }
{$IfEnd} // Defined(Nemesis)

end.
