unit l3StringList1;

// ������: "w:\common\components\rtl\Garant\L3\l3StringList1.pas"
// ���������: "SimpleClass"

{$Include l3Define.inc}

interface

uses
 l3IntfUses
 , l3StringListPrim
 , l3Interfaces
 , l3Types
;

type
 _l3DelphiStringSearcher_Parent_ = Tl3StringListPrim;
 {$Include l3DelphiStringSearcher.imp.pas}
 Tl3StringList1 = class(_l3DelphiStringSearcher_)
 end;//Tl3StringList1

implementation

uses
 l3ImplUses
 , l3String
;

type _Instance_R_ = Tl3StringList1;

{$Include l3DelphiStringSearcher.imp.pas}

end.
