unit Long_Wrap;
 {* WLong }

// ������: "w:\common\components\rtl\Garant\K2\Long_Wrap.pas"
// ���������: "Wrapper"

{$Include k2Define.inc}

interface

uses
 l3IntfUses
 , k2Base
 , k2Long_Const
 , l3Variant
;

type
 WLong = class(Wk2Atom)
  {* WLong }
  protected
   function AsString(A: Tl3Variant): AnsiString; override;
 end;//WLong

implementation

uses
 l3ImplUses
 , SysUtils
 , l3Const
;

function WLong.AsString(A: Tl3Variant): AnsiString;
//#UC START# *484CCE970073_4849423C0299_var*
//#UC END# *484CCE970073_4849423C0299_var*
begin
//#UC START# *484CCE970073_4849423C0299_impl*
 if A.IsNull then
  Result := ''
 else
  Result := IntToStr(A.AsLong);
//#UC END# *484CCE970073_4849423C0299_impl*
end;//WLong.AsString

end.
