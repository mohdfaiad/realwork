unit kwWinControlFromStackWord;

// ������: "w:\common\components\rtl\Garant\ScriptEngine\kwWinControlFromStackWord.pas"
// ���������: "SimpleClass"

{$Include seDefine.inc}

interface

{$If NOT Defined(NoScripts) AND NOT Defined(NoVCL)}
uses
 l3IntfUses
 , Controls
 , tfwScriptingInterfaces
 , kwComponentFromStackWord
 , Classes
;

type
 {$Include kwControlFromStackWord.imp.pas}
 TkwWinControlFromStackWord = {abstract} class(_kwControlFromStackWord_)
  protected
   procedure DoWinControl(aControl: TWinControl;
    const aCtx: TtfwContext); virtual; abstract;
   procedure DoControl(aControl: TControl;
    const aCtx: TtfwContext); override;
 end;//TkwWinControlFromStackWord
{$IfEnd} // NOT Defined(NoScripts) AND NOT Defined(NoVCL)

implementation

{$If NOT Defined(NoScripts) AND NOT Defined(NoVCL)}
uses
 l3ImplUses
;

{$Include kwControlFromStackWord.imp.pas}

procedure TkwWinControlFromStackWord.DoControl(aControl: TControl;
 const aCtx: TtfwContext);
//#UC START# *4F212C3A015A_4F212C680161_var*
//#UC END# *4F212C3A015A_4F212C680161_var*
begin
//#UC START# *4F212C3A015A_4F212C680161_impl*
 DoWinControl(aControl As TWinControl, aCtx);
//#UC END# *4F212C3A015A_4F212C680161_impl*
end;//TkwWinControlFromStackWord.DoControl

initialization
 TkwWinControlFromStackWord.RegisterClass;
 {* ����������� TkwWinControlFromStackWord }
{$IfEnd} // NOT Defined(NoScripts) AND NOT Defined(NoVCL)

end.
