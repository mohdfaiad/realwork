unit evArchi_Schema;
 {* ����� ��������� ��� ����������� }

// ������: "w:\common\components\gui\Garant\Everest\evArchi_Schema.pas"
// ���������: "TagTable"

{$Include evDefine.inc}

interface

{$If Defined(Archi)}
uses
 l3IntfUses
 , Everest_Schema
;

type
 // TevArchiSchema
{$IfEnd} // Defined(Archi)

implementation

{$If Defined(Archi)}
uses
 l3ImplUses
;

initialization
 TevArchiSchema.SetAsDefault;
{$IfEnd} // Defined(Archi)

end.
