unit NOT_FINISHED_ObjExWin;

// ������: "w:\archi\source\projects\Archi\Main\NOT_FINISHED_ObjExWin.pas"
// ���������: "UtilityPack"

{$Include arDefine.inc}

interface

{$If Defined(AppClientSide)}
uses
 l3IntfUses
;

type
 TObjectExplorerWin = class
 end;//TObjectExplorerWin
{$IfEnd} // Defined(AppClientSide)

implementation

{$If Defined(AppClientSide)}
uses
 l3ImplUses
;
{$IfEnd} // Defined(AppClientSide)

end.
