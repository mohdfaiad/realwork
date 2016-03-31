unit afwOvrCaretType;

// ������: "w:\common\components\gui\Garant\AFW\implementation\Visual\afwOvrCaretType.pas"
// ���������: "SimpleClass"
// ������� ������: "TafwOvrCaretType" MUID: (480DD2B200D2)

{$Include w:\common\components\gui\Garant\AFW\afwDefine.inc}

interface

uses
 l3IntfUses
 , afwCustomCaretType
 //#UC START# *480DD2B200D2intf_uses*
 //#UC END# *480DD2B200D2intf_uses*
;

type
 //#UC START# *480DD2B200D2ci*
 //#UC END# *480DD2B200D2ci*
 //#UC START# *480DD2B200D2cit*
 //#UC END# *480DD2B200D2cit*
 TafwOvrCaretType = class(TafwCustomCaretType)
  public
   constructor Create; override;
 //#UC START# *480DD2B200D2publ*
 published
 // published properties
   property Shape
    default csBlock;
    {* - ����� �������. }
 //#UC END# *480DD2B200D2publ*
 end;//TafwOvrCaretType

implementation

uses
 l3ImplUses
 //#UC START# *480DD2B200D2impl_uses*
 //#UC END# *480DD2B200D2impl_uses*
;

constructor TafwOvrCaretType.Create;
//#UC START# *480DCA5C03B7_480DD2B200D2_var*
//#UC END# *480DCA5C03B7_480DD2B200D2_var*
begin
//#UC START# *480DCA5C03B7_480DD2B200D2_impl*
 inherited;
 Shape := csBlock;
//#UC END# *480DCA5C03B7_480DD2B200D2_impl*
end;//TafwOvrCaretType.Create

//#UC START# *480DD2B200D2impl*
//#UC END# *480DD2B200D2impl*

end.
