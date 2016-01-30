unit l3CustomRecListView;

// ������: "w:\common\components\rtl\Garant\L3\l3CustomRecListView.pas"
// ���������: "SimpleClass"

{$Include l3Define.inc}

interface

uses
 l3IntfUses
 , l3ProtoPtrRecListPrim
 , l3PureMixIns
 , l3CustomOtherListView
;

type
 _ListType_ = Tl3ProtoPtrRecListPrim;
 _ItemType_ = VOID;
 {$Include l3OtherListView.imp.pas}
 Tl3CustomRecListView = {abstract} class(_l3OtherListView_)
  protected
   function CompareRecs(aRec1: PItemType;
    aRec2: PItemType): Integer; virtual; abstract;
   function CompareData(const anItem1: _ItemType_;
    const anItem2: _ItemType_): Integer; override;
 end;//Tl3CustomRecListView

implementation

uses
 l3ImplUses
 , l3Base
 , SysUtils
;

{$Include l3OtherListView.imp.pas}

function Tl3CustomRecListView.CompareData(const anItem1: _ItemType_;
 const anItem2: _ItemType_): Integer;
//#UC START# *4DEFB2D90167_4DEFC4AE0296_var*
//#UC END# *4DEFB2D90167_4DEFC4AE0296_var*
begin
//#UC START# *4DEFB2D90167_4DEFC4AE0296_impl*
 Result := CompareRecs(@anItem1, @anItem2);
//#UC END# *4DEFB2D90167_4DEFC4AE0296_impl*
end;//Tl3CustomRecListView.CompareData

end.
