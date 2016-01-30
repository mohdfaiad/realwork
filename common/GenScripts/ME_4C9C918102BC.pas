unit nsFindIteratorNew;
 {* ���������� IFindIterator ��� ������ ������������� ���������� (��� ��������) }

// ������: "w:\garant6x\implementation\Garant\GbaNemesis\View\nsFindIteratorNew.pas"
// ���������: "SimpleClass"

{$Include nsDefine.inc}

interface

{$If NOT Defined(Admin) AND NOT Defined(Monitorings)}
uses
 l3IntfUses
 , l3ProtoObjectForTie
 , DynamicTreeUnit
 , DocumentUnit
;

type
 TnsFindIteratorNew = class(Tl3ProtoObjectForTie, IFindIterator)
  {* ���������� IFindIterator ��� ������ ������������� ���������� (��� ��������) }
  private
   f_Current: Integer;
   f_List: IContextList;
  protected
   procedure next;
    {* ����������� ��������� �� ��������� �������. }
   procedure prev;
    {* ����������� ��������� �� ���������� �������. }
   function is_good: Boolean;
    {* ���������� true, ���� �� ��������� ����� �������� ������, �.�. position. ����� �������� �� ������, �.�. ����� end ��� ������ ���� }
   function get_position: IFindPositionList;
   function is_first: Boolean;
    {* ���������� true, ���� ������ ������� �� ���������� �������� }
   function Get_count: Cardinal;
   procedure ClearFields; override;
  public
   constructor Create(const aContext: IFoundContext); reintroduce; overload;
   class function Make(const aContext: IFoundContext): IFindIterator; reintroduce; overload;
   constructor Create(const aList: IContextList); reintroduce; overload;
   class function Make(const aList: IContextList): IFindIterator; reintroduce; overload;
 end;//TnsFindIteratorNew
{$IfEnd} // NOT Defined(Admin) AND NOT Defined(Monitorings)

implementation

{$If NOT Defined(Admin) AND NOT Defined(Monitorings)}
uses
 l3ImplUses
 , nsFindIteratorNewFindPositionList
;

constructor TnsFindIteratorNew.Create(const aContext: IFoundContext);
//#UC START# *4C9C92330122_4C9C918102BC_var*
var
 l_List : IContextList;
//#UC END# *4C9C92330122_4C9C918102BC_var*
begin
//#UC START# *4C9C92330122_4C9C918102BC_impl*
 if (aContext <> nil) then
  aContext.GetList(l_List)
 else
  l_List := nil;
 Create(l_List);
//#UC END# *4C9C92330122_4C9C918102BC_impl*
end;//TnsFindIteratorNew.Create

class function TnsFindIteratorNew.Make(const aContext: IFoundContext): IFindIterator;
var
 l_Inst : TnsFindIteratorNew;
begin
 l_Inst := Create(aContext);
 try
  Result := l_Inst;
 finally
  l_Inst.Free;
 end;//try..finally
end;//TnsFindIteratorNew.Make

constructor TnsFindIteratorNew.Create(const aList: IContextList);
//#UC START# *4D8A1E420133_4C9C918102BC_var*
//#UC END# *4D8A1E420133_4C9C918102BC_var*
begin
//#UC START# *4D8A1E420133_4C9C918102BC_impl*
 inherited Create;
 f_Current := -1;
 f_List := aList;
//#UC END# *4D8A1E420133_4C9C918102BC_impl*
end;//TnsFindIteratorNew.Create

class function TnsFindIteratorNew.Make(const aList: IContextList): IFindIterator;
var
 l_Inst : TnsFindIteratorNew;
begin
 l_Inst := Create(aList);
 try
  Result := l_Inst;
 finally
  l_Inst.Free;
 end;//try..finally
end;//TnsFindIteratorNew.Make

procedure TnsFindIteratorNew.next;
 {* ����������� ��������� �� ��������� �������. }
//#UC START# *45EEC28202A0_4C9C918102BC_var*
//#UC END# *45EEC28202A0_4C9C918102BC_var*
begin
//#UC START# *45EEC28202A0_4C9C918102BC_impl*
 Assert(f_Current <= Pred(GetCount));
 Inc(f_Current);
//#UC END# *45EEC28202A0_4C9C918102BC_impl*
end;//TnsFindIteratorNew.next

procedure TnsFindIteratorNew.prev;
 {* ����������� ��������� �� ���������� �������. }
//#UC START# *45EEC28202A1_4C9C918102BC_var*
//#UC END# *45EEC28202A1_4C9C918102BC_var*
begin
//#UC START# *45EEC28202A1_4C9C918102BC_impl*
 Assert(f_Current >= 0);
 Dec(f_Current);
//#UC END# *45EEC28202A1_4C9C918102BC_impl*
end;//TnsFindIteratorNew.prev

function TnsFindIteratorNew.is_good: Boolean;
 {* ���������� true, ���� �� ��������� ����� �������� ������, �.�. position. ����� �������� �� ������, �.�. ����� end ��� ������ ���� }
//#UC START# *45EEC28202A2_4C9C918102BC_var*
//#UC END# *45EEC28202A2_4C9C918102BC_var*
begin
//#UC START# *45EEC28202A2_4C9C918102BC_impl*
 Result := (GetCount > 0) AND
           (f_Current >= 0) AND (f_Current <= Pred(GetCount));
//#UC END# *45EEC28202A2_4C9C918102BC_impl*
end;//TnsFindIteratorNew.is_good

function TnsFindIteratorNew.get_position: IFindPositionList;
//#UC START# *461D00B9005D_4C9C918102BC_var*
var
 l_GotList : IFragmentList;
//#UC END# *461D00B9005D_4C9C918102BC_var*
begin
//#UC START# *461D00B9005D_4C9C918102BC_impl*
 Assert(IsGood);
 f_List.pm_GetItem(f_Current, l_GotList);
 IFindPositionList(aRet) := TnsFindIteratorNewFindPositionList.Make(l_GotList);
//#UC END# *461D00B9005D_4C9C918102BC_impl*
end;//TnsFindIteratorNew.get_position

function TnsFindIteratorNew.is_first: Boolean;
 {* ���������� true, ���� ������ ������� �� ���������� �������� }
//#UC START# *49FEC51501D8_4C9C918102BC_var*
//#UC END# *49FEC51501D8_4C9C918102BC_var*
begin
//#UC START# *49FEC51501D8_4C9C918102BC_impl*
 Result := (f_Current <= 0);
//#UC END# *49FEC51501D8_4C9C918102BC_impl*
end;//TnsFindIteratorNew.is_first

function TnsFindIteratorNew.Get_count: Cardinal;
//#UC START# *49FFDC8B015D_4C9C918102BCget_var*
//#UC END# *49FFDC8B015D_4C9C918102BCget_var*
begin
//#UC START# *49FFDC8B015D_4C9C918102BCget_impl*
 if (f_List = nil) then
  Result := 0
 else
  Result := f_List.Count;
//#UC END# *49FFDC8B015D_4C9C918102BCget_impl*
end;//TnsFindIteratorNew.Get_count

procedure TnsFindIteratorNew.ClearFields;
begin
 Finalize(f_List);
 inherited;
end;//TnsFindIteratorNew.ClearFields
{$IfEnd} // NOT Defined(Admin) AND NOT Defined(Monitorings)

end.
