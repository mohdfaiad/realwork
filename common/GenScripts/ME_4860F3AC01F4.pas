unit My_Schema;

// ������: "w:\common\components\gui\Garant\Everest\My_Schema.pas"
// ���������: "TagTable"

{$Include evDefine.inc}

interface

{$If Defined(evMyEditor)}
uses
 l3IntfUses
 , Everest_Schema
;

type
 // TMySchema
{$IfEnd} // Defined(evMyEditor)

implementation

{$If Defined(evMyEditor)}
uses
 l3ImplUses
;

initialization
 TMySchema.SetAsDefault;
{$IfEnd} // Defined(evMyEditor)

end.
