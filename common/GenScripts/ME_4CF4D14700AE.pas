unit nscTreeComboWithHistoryAndOperations;

// ������: "w:\common\components\gui\Garant\Nemesis\nscTreeComboWithHistoryAndOperations.pas"
// ���������: "GuiControl"

{$Include nscDefine.inc}

interface

{$If Defined(Nemesis)}
uses
 l3IntfUses
 , nscTreeComboWithHistory
;

type
 TnscTreeComboWithHistoryAndOperations = class(TnscTreeComboWithHistory)
 end;//TnscTreeComboWithHistoryAndOperations
{$IfEnd} // Defined(Nemesis)

implementation

{$If Defined(Nemesis)}
uses
 l3ImplUses
 {$If NOT Defined(NoScripts)}
 , TtfwClassRef_Proxy
 {$IfEnd} // NOT Defined(NoScripts)
;

initialization
{$If NOT Defined(NoScripts)}
 TtfwClassRef.Register(TnscTreeComboWithHistoryAndOperations);
 {* ����������� TnscTreeComboWithHistoryAndOperations }
{$IfEnd} // NOT Defined(NoScripts)
{$IfEnd} // Defined(Nemesis)

end.
