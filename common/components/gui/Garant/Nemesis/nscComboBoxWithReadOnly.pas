unit nscComboBoxWithReadOnly;

// ������: "w:\common\components\gui\Garant\Nemesis\nscComboBoxWithReadOnly.pas"
// ���������: "GuiControl"

{$Include w:\common\components\gui\Garant\Nemesis\nscDefine.inc}

interface

{$If Defined(Nemesis)}
uses
 l3IntfUses
 , nscComboBox
;

type
 //#UC START# *4AF46F430293ci*
 //#UC END# *4AF46F430293ci*
 //#UC START# *4AF46F430293cit*
 //#UC END# *4AF46F430293cit*
 TnscComboBoxWithReadOnly = class(TnscEdit)
 //#UC START# *4AF46F430293publ*
  published
  // published methods
   property ReadOnly;
     {-}
 //#UC END# *4AF46F430293publ*
 end;//TnscComboBoxWithReadOnly
{$IfEnd} // Defined(Nemesis)

implementation

{$If Defined(Nemesis)}
uses
 l3ImplUses
 {$If NOT Defined(NoScripts)}
 , TtfwClassRef_Proxy
 {$IfEnd} // NOT Defined(NoScripts)
;

//#UC START# *4AF46F430293impl*
//#UC END# *4AF46F430293impl*

initialization
{$If NOT Defined(NoScripts)}
 TtfwClassRef.Register(TnscComboBoxWithReadOnly);
 {* ����������� TnscComboBoxWithReadOnly }
{$IfEnd} // NOT Defined(NoScripts)
{$IfEnd} // Defined(Nemesis)

end.
