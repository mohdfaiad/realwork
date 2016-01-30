unit evLeafParaMultiSelectionBlock;

// ������: "w:\common\components\gui\Garant\Everest\evLeafParaMultiSelectionBlock.pas"
// ���������: "SimpleClass"

{$Include evDefine.inc}

interface

uses
 l3IntfUses
 , evMultiSelectionBlock
 , nevTools
 , l3Variant
 , nevRangeList
 , nevBase
 , evdInterfaces
;

type
 TevLeafParaMultiSelectionBlock = class(TevMultiSelectionBlock)
  protected
   procedure DoStore(const aView: InevView;
    const G: InevTagGenerator;
    aFlags: TevdStoreFlags); override;
    {* ��������� ��������� � G }
  public
   procedure IterateX; virtual;
   class function Make(aTagWrap: Tl3Variant;
    aBlocks: TnevRangeList): InevRange; reintroduce;
    {* ������ ������ ���������, �. � ������������ �� ������� ���������� ����������, � �� ��������� ����� ������ ��������� }
 end;//TevLeafParaMultiSelectionBlock

implementation

uses
 l3ImplUses
 , l3Base
;

procedure TevLeafParaMultiSelectionBlock.IterateX;
//#UC START# *4BAA60370285_48ECD64B005A_var*
//#UC END# *4BAA60370285_48ECD64B005A_var*
begin
//#UC START# *4BAA60370285_48ECD64B005A_impl*
 !!! Needs to be implemented !!!
//#UC END# *4BAA60370285_48ECD64B005A_impl*
end;//TevLeafParaMultiSelectionBlock.IterateX

class function TevLeafParaMultiSelectionBlock.Make(aTagWrap: Tl3Variant;
 aBlocks: TnevRangeList): InevRange;
 {* ������ ������ ���������, �. � ������������ �� ������� ���������� ����������, � �� ��������� ����� ������ ��������� }
var
 l_Inst : TevLeafParaMultiSelectionBlock;
begin
 l_Inst := Create(aTagWrap, aBlocks);
 try
  Result := l_Inst;
 finally
  l_Inst.Free;
 end;//try..finally
end;//TevLeafParaMultiSelectionBlock.Make

procedure TevLeafParaMultiSelectionBlock.DoStore(const aView: InevView;
 const G: InevTagGenerator;
 aFlags: TevdStoreFlags);
 {* ��������� ��������� � G }
//#UC START# *48ECE4420180_48ECD64B005A_var*
//#UC END# *48ECE4420180_48ECD64B005A_var*
begin
//#UC START# *48ECE4420180_48ECD64B005A_impl*
 if (Blocks <> nil) AND (Blocks.Count = 1) then
  Blocks.First.AsStorable.Store(aView, G, aFlags)
 else
  Assert(false, '���.. �� ���� �� ������ ��������� ������������� ��������� ��� ���������� ���������.');
//#UC END# *48ECE4420180_48ECD64B005A_impl*
end;//TevLeafParaMultiSelectionBlock.DoStore

end.
