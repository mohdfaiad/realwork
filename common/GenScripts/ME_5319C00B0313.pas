unit k2Tag;
 {* ������� ��� }

// ������: "w:\common\components\rtl\Garant\K2\k2Tag.pas"
// ���������: "SimpleClass"

{$Include k2Define.inc}

interface

uses
 l3IntfUses
 , l3Variant
;

type
 Tk2Tag = {abstract} class(Tl3Tag)
  {* ������� ��� }
  protected
   function GetIsOrd: Boolean; override;
 end;//Tk2Tag

implementation

uses
 l3ImplUses
;

function Tk2Tag.GetIsOrd: Boolean;
//#UC START# *532AE8F2009A_5319C00B0313_var*
//#UC END# *532AE8F2009A_5319C00B0313_var*
begin
//#UC START# *532AE8F2009A_5319C00B0313_impl*
 Result := false;
//#UC END# *532AE8F2009A_5319C00B0313_impl*
end;//Tk2Tag.GetIsOrd

end.
