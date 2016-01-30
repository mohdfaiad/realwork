{$IfNDef l3DelphiStringSearcherPrim_imp}

// ������: "w:\common\components\rtl\Garant\L3\l3DelphiStringSearcherPrim.imp.pas"
// ���������: "Impurity"

{$Define l3DelphiStringSearcherPrim_imp}

 _FindDataType_ = AnsiString;
 _l3Searcher_Parent_ = _l3DelphiStringSearcherPrim_Parent_;
 {$Include l3Searcher.imp.pas}
 _l3DelphiStringSearcherPrim_ = {abstract} class(_l3Searcher_)
 end;//_l3DelphiStringSearcherPrim_

{$Else l3DelphiStringSearcherPrim_imp}

{$IfNDef l3DelphiStringSearcherPrim_imp_impl}

{$Define l3DelphiStringSearcherPrim_imp_impl}

function CompareItemWithData(const anItem: _ItemType_;
 const aData: _FindDataType_;
 aSortIndex: Tl3SortIndex;
 aList: _l3Searcher_): Integer;
 {* ���������� ������������ ������� � �������. }
//#UC START# *47B9BAFD01F4_4B891136016F_var*
//#UC END# *47B9BAFD01F4_4B891136016F_var*
begin
//#UC START# *47B9BAFD01F4_4B891136016F_impl*
 Result := l3Compare(ItemToWStr(anItem), aData, aSortIndex);
//#UC END# *47B9BAFD01F4_4B891136016F_impl*
end;//CompareItemWithData

type _Instance_R_ = _l3DelphiStringSearcherPrim_;

{$Include l3Searcher.imp.pas}

{$EndIf l3DelphiStringSearcherPrim_imp_impl}

{$EndIf l3DelphiStringSearcherPrim_imp}

