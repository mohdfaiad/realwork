unit nevTable;

// ������: "w:\common\components\gui\Garant\Everest\new\nevTable.pas"
// ���������: "SimpleClass"

{$Include evDefine.inc}

interface

{$If Defined(k2ForEditor)}
uses
 l3IntfUses
 , nevParaList
 , nevTools
 , l3Variant
 , nevBase
;

type
 TnevTable = class(TnevParaList, InevTable)
  protected
   procedure AddRow(aColCount: Integer;
    aColumnWidth: Integer;
    aFramed: Boolean);
    {* ��������� � ������� ������ � ��������� ���������� ������ aColumnWidth. 
         ���� aFramed ���������, �� ��� ������ ������ ����������� �����. }
   function DoGetBackColor: TnevColor; override;
  public
   class function Make(aTag: Tl3Variant): InevTable; reintroduce;
 end;//TnevTable
{$IfEnd} // Defined(k2ForEditor)

implementation

{$If Defined(k2ForEditor)}
uses
 l3ImplUses
 , k2Base
 , evdFrame_Const
 , k2Tags
 , k2Const
;

class function TnevTable.Make(aTag: Tl3Variant): InevTable;
var
 l_Inst : TnevTable;
begin
 l_Inst := Create(aTag);
 try
  Result := l_Inst;
 finally
  l_Inst.Free;
 end;//try..finally
end;//TnevTable.Make

procedure TnevTable.AddRow(aColCount: Integer;
 aColumnWidth: Integer;
 aFramed: Boolean);
 {* ��������� � ������� ������ � ��������� ���������� ������ aColumnWidth. 
         ���� aFramed ���������, �� ��� ������ ������ ����������� �����. }
//#UC START# *47C7E02D0212_52B2A333009E_var*
var
 i         : Integer;
 l_NewRow  : Tl3Variant;
 l_NewCell : Tl3Variant;
 l_NewPara : Tl3Variant;
//#UC END# *47C7E02D0212_52B2A333009E_var*
begin
//#UC START# *47C7E02D0212_52B2A333009E_impl*
 l_NewRow := Tk2Type(GetRedirect.TagType).ArrayProp[k2_tiChildren].DefaultChildType.MakeTag.AsObject;
 try
  for i := 1 to aColCount do 
  begin
   with l_NewRow do 
   begin
    l_NewCell := Tk2Type(l_NewRow.TagType).ArrayProp[k2_tiChildren].DefaultChildType.MakeTag.AsObject;
    try
     if aFramed then
      l_NewCell.IntA[k2_tiFrame] := evd_fvSolid
     else
      l_NewCell.IntA[k2_tiFrame] := evd_fvEmpty;
     l_NewPara := Tk2Type(l_NewCell.TagType).ArrayProp[k2_tiChildren].DefaultChildType.MakeTag.AsObject;
     try
      with l_NewCell do 
      begin
       IntA[k2_tiWidth] := aColumnWidth;
       AddChild(l_NewPara);
      end;{with l_NewCell}
     finally
      l_NewPara := nil;
     end;{try..finally}
     IntA[k2_tiWidth] := IntA[k2_tiWidth] + l_NewCell.IntA[k2_tiWidth];
     AddChild(l_NewCell);
    finally
     l_NewCell := nil;
    end;{try..finally}
   end;{with l_NewRow}
  end;{for i}
  GetRedirect.AddChild(l_NewRow, nil);
 finally
  l_NewRow := nil;
 end;//try..finally
//#UC END# *47C7E02D0212_52B2A333009E_impl*
end;//TnevTable.AddRow

function TnevTable.DoGetBackColor: TnevColor;
//#UC START# *52B29B2E013C_52B2A333009E_var*
//#UC END# *52B29B2E013C_52B2A333009E_var*
begin
//#UC START# *52B29B2E013C_52B2A333009E_impl*
 Result := rLong(k2_tiBackColor, nevDefaultColor);
 if (Result = k2_TransparentValue) then
  Result := nevDefaultColor;
//#UC END# *52B29B2E013C_52B2A333009E_impl*
end;//TnevTable.DoGetBackColor
{$IfEnd} // Defined(k2ForEditor)

end.
