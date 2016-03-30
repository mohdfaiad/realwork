unit afwTextControl;

// ������: "w:\common\components\gui\Garant\AFW\implementation\Visual\afwTextControl.pas"
// ���������: "GuiControl"
// ������� ������: "TafwTextControl" MUID: (48BBF1470238)

{$Include w:\common\components\gui\Garant\AFW\afwDefine.inc}

interface

uses
 l3IntfUses
 , afwTextControlPrim
 , afwInterfaces
 //#UC START# *48BBF1470238intf_uses*
 //#UC END# *48BBF1470238intf_uses*
;

type
 //#UC START# *48BBF1470238ci*
 //#UC END# *48BBF1470238ci*
 //#UC START# *48BBF1470238cit*
 //#UC END# *48BBF1470238cit*
 TafwTextControl = class(TafwTextControlPrim, IafwTextControl)
  private
   function CaptionStored: Boolean;
  protected
   function pm_GetCCaption: IafwCString;
   procedure pm_SetCCaption(const aValue: IafwCString);
 //#UC START# *48BBF1470238publ*
    public
    // public properties
      property Caption
        stored CaptionStored;
        {-}
 //#UC END# *48BBF1470238publ*
 end;//TafwTextControl

implementation

uses
 l3ImplUses
 {$If NOT Defined(NoVCL)}
 , Controls
 {$IfEnd} // NOT Defined(NoVCL)
 , l3String
 {$If NOT Defined(NoScripts)}
 , TtfwClassRef_Proxy
 {$IfEnd} // NOT Defined(NoScripts)
 //#UC START# *48BBF1470238impl_uses*
 //#UC END# *48BBF1470238impl_uses*
;

type
 THackLink = class(TControlActionLink)
 end;//THackLink

function TafwTextControl.CaptionStored: Boolean;
//#UC START# *48BBF3DD019D_48BBF1470238_var*
//#UC END# *48BBF3DD019D_48BBF1470238_var*
begin
//#UC START# *48BBF3DD019D_48BBF1470238_impl*
 Result := not l3IsNil(CCaption) AND
           ((ActionLink = nil) or not THackLink(ActionLink).IsCaptionLinked);
//#UC END# *48BBF3DD019D_48BBF1470238_impl*
end;//TafwTextControl.CaptionStored

function TafwTextControl.pm_GetCCaption: IafwCString;
//#UC START# *473DAC05025F_48BBF1470238get_var*
//#UC END# *473DAC05025F_48BBF1470238get_var*
begin
//#UC START# *473DAC05025F_48BBF1470238get_impl*
 Result := CCaption;
//#UC END# *473DAC05025F_48BBF1470238get_impl*
end;//TafwTextControl.pm_GetCCaption

procedure TafwTextControl.pm_SetCCaption(const aValue: IafwCString);
//#UC START# *473DAC05025F_48BBF1470238set_var*
//#UC END# *473DAC05025F_48BBF1470238set_var*
begin
//#UC START# *473DAC05025F_48BBF1470238set_impl*
 CCaption := aValue;
//#UC END# *473DAC05025F_48BBF1470238set_impl*
end;//TafwTextControl.pm_SetCCaption

//#UC START# *48BBF1470238impl*
//#UC END# *48BBF1470238impl*

initialization
{$If NOT Defined(NoScripts)}
 TtfwClassRef.Register(TafwTextControl);
 {* ����������� TafwTextControl }
{$IfEnd} // NOT Defined(NoScripts)

end.
