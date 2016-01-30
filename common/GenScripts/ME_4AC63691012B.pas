unit NOT_FINISHED_nscComboBox;

// ������: "w:\common\components\gui\Garant\Nemesis\NOT_FINISHED_nscComboBox.pas"
// ���������: "GuiControl"

{$Include nscDefine.inc}

interface

{$If Defined(Nemesis)}
uses
 l3IntfUses
 , vtComboTree
;

type
 TnscEdit = class(TnscComboBox)
 end;//TnscEdit

 TnscEditWithoutPlusMinusShortcut = class(TnscEdit)
 end;//TnscEditWithoutPlusMinusShortcut

 TnscComboBoxWithPwdChar = class(TnscEdit)
 end;//TnscComboBoxWithPwdChar

 TnscComboBox = class(TvtComboTree)
 end;//TnscComboBox
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
 TtfwClassRef.Register(TnscEdit);
 {* ����������� TnscEdit }
{$IfEnd} // NOT Defined(NoScripts)
{$If NOT Defined(NoScripts)}
 TtfwClassRef.Register(TnscEditWithoutPlusMinusShortcut);
 {* ����������� TnscEditWithoutPlusMinusShortcut }
{$IfEnd} // NOT Defined(NoScripts)
{$If NOT Defined(NoScripts)}
 TtfwClassRef.Register(TnscComboBoxWithPwdChar);
 {* ����������� TnscComboBoxWithPwdChar }
{$IfEnd} // NOT Defined(NoScripts)
{$If NOT Defined(NoScripts)}
 TtfwClassRef.Register(TnscComboBox);
 {* ����������� TnscComboBox }
{$IfEnd} // NOT Defined(NoScripts)
{$IfEnd} // Defined(Nemesis)

end.
