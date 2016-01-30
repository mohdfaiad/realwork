unit ddBase;

// ������: "w:\common\components\rtl\Garant\dd\ddBase.pas"
// ���������: "UtilityPack"

{$Include ddDefine.inc}

interface

uses
 l3IntfUses
 , ddTypes
 , evdTypes
;

function k2JustToJust(Just: TevIndentType): TJust;
function ddGetMinimalCellWidth: Integer;
function ColorToHighlight(Color: LongInt): Integer;
function HighlightToColor(No: Integer): LongInt;
function ConvertStyleNumber(aNum: LongInt): Integer;

implementation

uses
 l3ImplUses
 , l3UnitsTools
 , Graphics
;

type
 TddColorSetRange = 1 .. 16;

 TddColorArray = array [TddColorSetRange] of LongInt;

const
 cddColorSet: TddColorArray = (clBlack, clBlue, clAqua, clLime, clFuchsia, clRed, clYellow, clWhite, clNavy,clTeal, clGreen, clPurple,clMaroon, clOlive, clGray, clSilver);

function k2JustToJust(Just: TevIndentType): TJust;
//#UC START# *5111FEEE0291_4F6843D50173_var*
//#UC END# *5111FEEE0291_4F6843D50173_var*
begin
//#UC START# *5111FEEE0291_4F6843D50173_impl*
 case Just of
  ev_itRight        : Result := justR;
  ev_itCenter       : Result := justC;
  ev_itWidth        : Result := justF;
  ev_itPreformatted : Result := justP;
 else
  Result := justL;
 end; { case Just}
//#UC END# *5111FEEE0291_4F6843D50173_impl*
end;//k2JustToJust

function ddGetMinimalCellWidth: Integer;
//#UC START# *52CFB420035C_4F6843D50173_var*
//#UC END# *52CFB420035C_4F6843D50173_var*
begin
//#UC START# *52CFB420035C_4F6843D50173_impl*
 Result := 2 * evGetMinimalCellWidth;
//#UC END# *52CFB420035C_4F6843D50173_impl*
end;//ddGetMinimalCellWidth

function ColorToHighlight(Color: LongInt): Integer;
//#UC START# *52CFE5490025_4F6843D50173_var*
var
 i: Integer;
//#UC END# *52CFE5490025_4F6843D50173_var*
begin
//#UC START# *52CFE5490025_4F6843D50173_impl*
 i:= 1;
 while (i <= 16) do
 begin
  if Color = cddColorSet[i] then
   Break;
  Inc(i);
 end;
 if I > 16 then
  Result := 1
 else
  Result := i;
//#UC END# *52CFE5490025_4F6843D50173_impl*
end;//ColorToHighlight

function HighlightToColor(No: Integer): LongInt;
//#UC START# *52CFE56D0247_4F6843D50173_var*
//#UC END# *52CFE56D0247_4F6843D50173_var*
begin
//#UC START# *52CFE56D0247_4F6843D50173_impl*
 try
  Result:= cddColorSet[No];
 except
  Result:= 0;
 end;
//#UC END# *52CFE56D0247_4F6843D50173_impl*
end;//HighlightToColor

function ConvertStyleNumber(aNum: LongInt): Integer;
//#UC START# *52CFE5DC02E2_4F6843D50173_var*
//#UC END# *52CFE5DC02E2_4F6843D50173_var*
begin
//#UC START# *52CFE5DC02E2_4F6843D50173_impl*
 case aNum of
  0  : Result := 0;
  -1 : Result := 0;
  -3 : Result := 1;
  -4 : Result := 2;
  -5 : Result := 3;
  -6 : Result := 4;
 else
   Result := Abs(aNum)+16;
 end;
//#UC END# *52CFE5DC02E2_4F6843D50173_impl*
end;//ConvertStyleNumber

end.
