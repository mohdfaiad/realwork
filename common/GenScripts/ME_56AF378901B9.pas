unit arBelaPubList;

// ������: "w:\common\components\rtl\Garant\ar\arBelaPubList.pas"
// ���������: "SimpleClass"

{$Include l3Define.inc}

interface

{$If NOT Defined(Nemesis)}
uses
 l3IntfUses
 , l3ProtoDataContainer
 , l3Memory
 , l3Types
 , l3Interfaces
 , l3Core
 , l3Except
 , Classes
 , l3Date
;

type
 TarBelaPubInfo = record
  rPubSource: Il3CString;
   {* IST � �������� ���������� ��������� ���� (��� ��������) (�); }
  rDate: TStDate;
   {* IDAT � ���� ������� ��������� ���������� (M); }
  rYear: Word;
   {* YEAR � ��� ���������� (M); }
  rNum: Integer;
   {* NUMB � ����� ��������� ���������� (M); }
  rArticle: Integer;
   {* IN � ����� ������ (M). ��� ���������� ���������� � ������ ������ �� ��������������� ���� ����� ������ �������� ������ �-� (�����); }
 end;//TarBelaPubInfo

 ParBelaPubInfo = ^TarBelaPubInfo;

 _ItemType_ = TarBelaPubInfo;
 _l3RecordListPrim_Parent_ = Tl3ProtoDataContainer;
 {$Define l3Items_IsProto}
 {$Include l3RecordListPrim.imp.pas}
 TarBelaPubList = class(_l3RecordListPrim_)
 end;//TarBelaPubList
{$IfEnd} // NOT Defined(Nemesis)

implementation

{$If NOT Defined(Nemesis)}
uses
 l3ImplUses
 , l3String
 , l3Base
 , l3MinMax
 , RTLConsts
 , SysUtils
;

{$If Defined(l3Items_NeedsAssignItem) AND NOT Defined(l3Items_NoSort)}
procedure AssignItem(const aTo: _ItemType_;
 const aFrom: _ItemType_); forward;
{$IfEnd} // Defined(l3Items_NeedsAssignItem) AND NOT Defined(l3Items_NoSort)
function CompareExistingItems(const CI: CompareItemsRec): Integer; forward;

{$If NOT Defined(l3Items_IsAtomic)}
function IsSameItems(const A: _ItemType_;
 const B: _ItemType_): Boolean;
 {* ���������� �������� ������ }
//#UC START# *47B07CF403D0_56AF378901B9_var*
//#UC END# *47B07CF403D0_56AF378901B9_var*
begin
//#UC START# *47B07CF403D0_56AF378901B9_impl*
 !!! Needs to be implemented !!!
//#UC END# *47B07CF403D0_56AF378901B9_impl*
end;//IsSameItems
{$IfEnd} // NOT Defined(l3Items_IsAtomic)

{$If Defined(l3Items_NeedsAssignItem) AND NOT Defined(l3Items_NoSort)}
procedure AssignItem(const aTo: _ItemType_;
 const aFrom: _ItemType_);
//#UC START# *47B2C42A0163_56AF378901B9_var*
//#UC END# *47B2C42A0163_56AF378901B9_var*
begin
//#UC START# *47B2C42A0163_56AF378901B9_impl*
 !!! Needs to be implemented !!!
//#UC END# *47B2C42A0163_56AF378901B9_impl*
end;//AssignItem
{$IfEnd} // Defined(l3Items_NeedsAssignItem) AND NOT Defined(l3Items_NoSort)

function CompareExistingItems(const CI: CompareItemsRec): Integer;
 {* ���������� ��� ������������ ��������. }
//#UC START# *47B99D4503A2_56AF378901B9_var*
//#UC END# *47B99D4503A2_56AF378901B9_var*
begin
//#UC START# *47B99D4503A2_56AF378901B9_impl*
 !!! Needs to be implemented !!!
//#UC END# *47B99D4503A2_56AF378901B9_impl*
end;//CompareExistingItems

type _Instance_R_ = TarBelaPubList;

{$Include l3RecordListPrim.imp.pas}
{$IfEnd} // NOT Defined(Nemesis)

end.
