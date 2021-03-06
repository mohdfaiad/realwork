unit msmModelElementTree;

// ������: "w:\common\components\gui\Garant\msm\msmModelElementTree.pas"
// ���������: "SimpleClass"
// ������� ������: "TmsmModelElementTree" MUID: (57AC3A8100E5)

{$Include w:\common\components\msm.inc}

interface

uses
 l3IntfUses
 , l3SimpleTree
 , msmElementViews
 , msmEvents
 , msmModelElementNodeList
 , msmModelElementRootNode
 , l3LongintList
 , msmModelElements
 , l3Interfaces
 , l3TreeInterfaces
 {$If NOT Defined(NoScripts)}
 , tfwScriptingInterfaces
 {$IfEnd} // NOT Defined(NoScripts)
 //#UC START# *57AC3A8100E5intf_uses*
 //#UC END# *57AC3A8100E5intf_uses*
;

type
 //#UC START# *57AC3A8100E5ci*
 //#UC END# *57AC3A8100E5ci*
 //#UC START# *57AC3A8100E5cit*
 //#UC END# *57AC3A8100E5cit*
 TmsmModelElementTree = class(Tl3SimpleTree, ImsmModelElementTree, ImsmModelElementStringList, ImsmEventsPublisher)
  private
   f_Nodes: TmsmModelElementNodeList;
   f_Root: TmsmModelElementRootNode;
   f_Flags: Tl3LongintList;
  protected
   function As_ImsmModelElementStringList: ImsmModelElementStringList;
    {* ����� ���������� ������ ���������� � ImsmModelElementStringList }
   function As_ImsmEventsPublisher: ImsmEventsPublisher;
    {* ����� ���������� ������ ���������� � ImsmEventsPublisher }
   function Get_Item(anIndex: Integer): ImsmModelElement;
   function Get_Count: Integer;
   function Get_Elements(anIndex: Integer): ImsmModelElement;
   function Get_Owner: ImsmModelElement;
   function Get_Strings(anIndex: Integer): Il3CString;
   function Get_StringsToFind(anIndex: Integer): Il3CString;
   function NodeByElement(const anElement: ImsmModelElement): Il3SimpleNode;
   procedure Cleanup; override;
    {* ������� ������� ����� �������. }
  public
   constructor Create(const anElement: TmsmModelElementView); reintroduce;
   class function Make(const anElement: TmsmModelElementView): ImsmModelElementTree; reintroduce;
   procedure AddEventsSubscriber(const aListener: ImsmEventsSubscriber);
   procedure RemoveEventsSubscriber(const aListener: ImsmEventsSubscriber);
   function IndexOfElementView(const anElement: ImsmModelElement): Integer;
   procedure Add(anItem: TtfwWord);
 //#UC START# *57AC3A8100E5publ*
  protected
   function DoGet_Nodes(anIndex: Integer): Il3SimpleNode; override;
   function DoGet_CountView: Integer; override;
   function DoGet_Flags(anIndex: Integer): Integer; override;
   function DoChangeExpand(const aNode: Il3SimpleNode;
    aMode: Tl3SetBitType;
    aForceMode: Boolean): Boolean; override;
   function DoIsExpanded(const aNode: Il3SimpleNode): Boolean; override;
   function DoCountViewItemsInSubDir(const aNode: Il3SimpleNode): Integer; override;
   function DoGetIndex(const aNode: Il3SimpleNode;
    const aSubRootNode: Il3SimpleNode): Integer; override;
   procedure DoSetShowRoot(aValue: Boolean); override;
   function DoMakeNodeVisible(const aNode: Il3SimpleNode): Integer; override;
 //#UC END# *57AC3A8100E5publ*
 end;//TmsmModelElementTree

implementation

uses
 l3ImplUses
 , SysUtils
 , msmModelElementNode
 , msmModelElementStringList
 //#UC START# *57AC3A8100E5impl_uses*
 , l3Bits
 //#UC END# *57AC3A8100E5impl_uses*
;

constructor TmsmModelElementTree.Create(const anElement: TmsmModelElementView);
//#UC START# *57AC62550086_57AC3A8100E5_var*
var
 l_N : Il3SimpleNode;
//#UC END# *57AC62550086_57AC3A8100E5_var*
begin
//#UC START# *57AC62550086_57AC3A8100E5_impl*
 Assert(anElement.rElement <> nil);
 Assert(anElement.rListName <> '');
 Assert(anElement.rTextName <> '');
 f_Nodes := TmsmModelElementNodeList.Create;
 f_Root := TmsmModelElementRootNode.Create(anElement);
 f_Flags := Tl3LongintList.Create;
 //f_Nodes.Add(f_Root);
 l_N := Il3SimpleNode(f_Root).Child;
 while (l_N <> nil) do
 begin
  f_Nodes.AddNode(l_N);
  l_N := l_N.Next;
 end;//while (l_N <> nil)
 f_Flags.Count := f_Nodes.Count;
 DoChangeExpand(Il3SimpleNode(f_Root).Child, sbSelect, false);
 //f_Flags[0] := nfExpanded;
 inherited DoSetShowRoot(false);
 inherited Create(f_Root);
//#UC END# *57AC62550086_57AC3A8100E5_impl*
end;//TmsmModelElementTree.Create

class function TmsmModelElementTree.Make(const anElement: TmsmModelElementView): ImsmModelElementTree;
var
 l_Inst : TmsmModelElementTree;
begin
 l_Inst := Create(anElement);
 try
  Result := l_Inst;
 finally
  l_Inst.Free;
 end;//try..finally
end;//TmsmModelElementTree.Make

function TmsmModelElementTree.As_ImsmModelElementStringList: ImsmModelElementStringList;
 {* ����� ���������� ������ ���������� � ImsmModelElementStringList }
begin
 Result := Self;
end;//TmsmModelElementTree.As_ImsmModelElementStringList

function TmsmModelElementTree.As_ImsmEventsPublisher: ImsmEventsPublisher;
 {* ����� ���������� ������ ���������� � ImsmEventsPublisher }
begin
 Result := Self;
end;//TmsmModelElementTree.As_ImsmEventsPublisher

function TmsmModelElementTree.Get_Item(anIndex: Integer): ImsmModelElement;
//#UC START# *57AAD86403AD_57AC3A8100E5get_var*
//#UC END# *57AAD86403AD_57AC3A8100E5get_var*
begin
//#UC START# *57AAD86403AD_57AC3A8100E5get_impl*
 Result := Get_Elements(anIndex);
//#UC END# *57AAD86403AD_57AC3A8100E5get_impl*
end;//TmsmModelElementTree.Get_Item

function TmsmModelElementTree.Get_Count: Integer;
//#UC START# *57AAD89C0277_57AC3A8100E5get_var*
//#UC END# *57AAD89C0277_57AC3A8100E5get_var*
begin
//#UC START# *57AAD89C0277_57AC3A8100E5get_impl*
 Result := Get_CountView;
//#UC END# *57AAD89C0277_57AC3A8100E5get_impl*
end;//TmsmModelElementTree.Get_Count

function TmsmModelElementTree.Get_Elements(anIndex: Integer): ImsmModelElement;
//#UC START# *57ADF1B40310_57AC3A8100E5get_var*
//#UC END# *57ADF1B40310_57AC3A8100E5get_var*
begin
//#UC START# *57ADF1B40310_57AC3A8100E5get_impl*
 Result := f_Nodes[anIndex].Element.rElement;
//#UC END# *57ADF1B40310_57AC3A8100E5get_impl*
end;//TmsmModelElementTree.Get_Elements

function TmsmModelElementTree.Get_Owner: ImsmModelElement;
//#UC START# *57AE2E140297_57AC3A8100E5get_var*
//#UC END# *57AE2E140297_57AC3A8100E5get_var*
begin
//#UC START# *57AE2E140297_57AC3A8100E5get_impl*
 if (f_Root.Element.rElement = nil) then
  Result := nil
 else
  Result := f_Root.Element.rElement.Parent;
//#UC END# *57AE2E140297_57AC3A8100E5get_impl*
end;//TmsmModelElementTree.Get_Owner

function TmsmModelElementTree.Get_Strings(anIndex: Integer): Il3CString;
//#UC START# *57AEBED1018D_57AC3A8100E5get_var*
//#UC END# *57AEBED1018D_57AC3A8100E5get_var*
begin
//#UC START# *57AEBED1018D_57AC3A8100E5get_impl*
 with f_Nodes[anIndex].Element do
  Result := rElement.StringProp[rTextName];
//#UC END# *57AEBED1018D_57AC3A8100E5get_impl*
end;//TmsmModelElementTree.Get_Strings

procedure TmsmModelElementTree.AddEventsSubscriber(const aListener: ImsmEventsSubscriber);
//#UC START# *57B4228B001E_57AC3A8100E5_var*
//#UC END# *57B4228B001E_57AC3A8100E5_var*
begin
//#UC START# *57B4228B001E_57AC3A8100E5_impl*
 Assert(false);
//#UC END# *57B4228B001E_57AC3A8100E5_impl*
end;//TmsmModelElementTree.AddEventsSubscriber

procedure TmsmModelElementTree.RemoveEventsSubscriber(const aListener: ImsmEventsSubscriber);
//#UC START# *57B422AB0293_57AC3A8100E5_var*
//#UC END# *57B422AB0293_57AC3A8100E5_var*
begin
//#UC START# *57B422AB0293_57AC3A8100E5_impl*
 Assert(false);
//#UC END# *57B422AB0293_57AC3A8100E5_impl*
end;//TmsmModelElementTree.RemoveEventsSubscriber

function TmsmModelElementTree.Get_StringsToFind(anIndex: Integer): Il3CString;
//#UC START# *57B6C7D40215_57AC3A8100E5get_var*
//#UC END# *57B6C7D40215_57AC3A8100E5get_var*
begin
//#UC START# *57B6C7D40215_57AC3A8100E5get_impl*
 Result := Get_Item(anIndex).StringProp['DefaultSearchText'];
//#UC END# *57B6C7D40215_57AC3A8100E5get_impl*
end;//TmsmModelElementTree.Get_StringsToFind

function TmsmModelElementTree.NodeByElement(const anElement: ImsmModelElement): Il3SimpleNode;
//#UC START# *57C9AD1303C2_57AC3A8100E5_var*
var
 l_Index : Integer;
//#UC END# *57C9AD1303C2_57AC3A8100E5_var*
begin
//#UC START# *57C9AD1303C2_57AC3A8100E5_impl*
 Result := nil;
 if (anElement = nil) then
  Exit;
 for l_Index := 0 to Pred(f_Nodes.Count) do
  if f_Nodes[l_Index].Element.rElement.IsSameElement(anElement) then
  begin
   Result := f_Nodes[l_Index];
   Exit;
  end;//f_Nodes[l_Index].Element.rElement.IsSameElement(anElement)
 Result := TmsmModelElementNode.Make(TmsmModelElementView_C(anElement, f_Root.Element.rListName, f_Root.Element.rTextName), -1); 
//#UC END# *57C9AD1303C2_57AC3A8100E5_impl*
end;//TmsmModelElementTree.NodeByElement

function TmsmModelElementTree.IndexOfElementView(const anElement: ImsmModelElement): Integer;
//#UC START# *57D1327900BC_57AC3A8100E5_var*
var
 l_Index : Integer;
 l_E : ImsmModelElement;
//#UC END# *57D1327900BC_57AC3A8100E5_var*
begin
//#UC START# *57D1327900BC_57AC3A8100E5_impl*
 Result := -1;
 if (anElement <> nil) then
 begin
  for l_Index := 0 to Pred(Get_Count) do
  begin
   l_E := Get_Item(l_Index);
   if l_E.IsSameElement(anElement) then
   begin
    Result := l_Index;
    Exit;
   end;//l_E.IsSameElement(anElement)
  end;//for l_Index
  for l_Index := 0 to Pred(Get_Count) do
  begin
   l_E := Get_Item(l_Index);
   if l_E.IsSameElementView(anElement) then
   begin
    Result := l_Index;
    Exit;
   end;//l_E.IsSameElementView(anElement)
  end;//for l_Index
 end;//anElement <> nil
//#UC END# *57D1327900BC_57AC3A8100E5_impl*
end;//TmsmModelElementTree.IndexOfElementView

procedure TmsmModelElementTree.Add(anItem: TtfwWord);
//#UC START# *58094B920194_57AC3A8100E5_var*
//#UC END# *58094B920194_57AC3A8100E5_var*
begin
//#UC START# *58094B920194_57AC3A8100E5_impl*
 Assert(false);
//#UC END# *58094B920194_57AC3A8100E5_impl*
end;//TmsmModelElementTree.Add

procedure TmsmModelElementTree.Cleanup;
 {* ������� ������� ����� �������. }
//#UC START# *479731C50290_57AC3A8100E5_var*
//#UC END# *479731C50290_57AC3A8100E5_var*
begin
//#UC START# *479731C50290_57AC3A8100E5_impl*
 FreeAndNil(f_Nodes);
 FreeAndNil(f_Root);
 FreeAndNil(f_Flags);
 inherited;
//#UC END# *479731C50290_57AC3A8100E5_impl*
end;//TmsmModelElementTree.Cleanup

//#UC START# *57AC3A8100E5impl*

function TmsmModelElementTree.DoGet_Nodes(anIndex: Integer): Il3SimpleNode;
begin
 if (anIndex < 0) then
  Result := nil
 else
 if (anIndex >= f_Nodes.Count) then
  Result := nil
 else
 Result := f_Nodes[anIndex];
end;

function TmsmModelElementTree.DoGet_CountView: Integer;
begin
 Result := f_Nodes.Count;
end;

function TmsmModelElementTree.DoGet_Flags(anIndex: Integer): Integer;
begin
 Result := f_Flags[anIndex];
end;

function TmsmModelElementTree.DoChangeExpand(const aNode: Il3SimpleNode;
 aMode: Tl3SetBitType;
 aForceMode: Boolean): Boolean;
var
 l_I : Integer;
 l_V : Integer;
 l_OV : Integer;
 l_N : Il3SimpleNode;
 l_Index : Integer;
begin
 Assert(not aForceMode);
 Result := false;
 l_I := f_Nodes.IndexOfNode(aNode);
 l_Index := l_I;
 l_V := f_Flags[l_I];
 l_OV := l_V;
 Assert(l_I >= 0);
 Changing;
 try
  Case aMode of
   sbSelect:
   begin
    if l3TestMask(l_V, nfExpanded) then
     Exit;
    l3SetMask(l_V, nfExpanded);
    l_N := aNode.Child;
    while (l_N <> nil) do
    begin
     Inc(l_Index);
     f_Nodes.InsertNode(l_Index, l_N);
     f_Flags.Insert(l_Index, 0);
     l_N := l_N.Next;
    end;//while (l_N <> nil)
   end;//sbSelect
   sbDeselect:
   begin
    if not l3TestMask(l_V, nfExpanded) then
     Exit;
    l3ClearMask(l_V, nfExpanded);
    l_N := aNode.Child;
    while (l_N <> nil) do
    // - ���������, �.�. ������ ����� ���� �� ���������������� � ������
    begin
     l_Index := f_Nodes.IndexOfNode(l_N);
     if (l_Index >= 0) then
     begin
      DoChangeExpand(f_Nodes[l_Index], sbDeselect, false);
      l_Index := f_Nodes.IndexOfNode(l_N);
      if (l_Index >= 0) then
      begin
       f_Nodes.Delete(l_Index);
       f_Flags.Delete(l_Index);
      end;//l_Index >= 0
     end;//l_Index >= 0
     l_N := l_N.Next;
    end;//while (l_N <> nil)
(*    for l_Index := 0 to Pred(aNode.ThisChildrenCount) do
    begin
     DoChangeExpand(f_Nodes[l_I + 1], sbDeselect, false);
     f_Nodes.Delete(l_I + 1);
     f_Flags.Delete(l_I + 1);
    end;//for l_Index*)
   end;//sbDeselect
   else
    Assert(false);
  end;//Case aMode
  f_Flags[l_I] := l_V;
  Result := (l_OV <> l_V);
 finally
  Changed;
 end;//try..finally
end;

function TmsmModelElementTree.DoIsExpanded(const aNode: Il3SimpleNode): Boolean;
begin
 if Il3SimpleNode(f_Root).IsSame(aNode) then
  Result := true
 else
  Result := l3TestMask(f_Flags[f_Nodes.IndexOfNode(aNode)], nfExpanded);
end;

function TmsmModelElementTree.DoCountViewItemsInSubDir(const aNode: Il3SimpleNode): Integer;
begin
 Result := aNode.ThisChildrenCount;
end;

function TmsmModelElementTree.DoGetIndex(const aNode: Il3SimpleNode;
 const aSubRootNode: Il3SimpleNode): Integer;
begin
 Assert(aNode <> nil);
 Assert(aSubRootNode = nil);
 Result := f_Nodes.IndexOfNode(aNode);
end;

procedure TmsmModelElementTree.DoSetShowRoot(aValue: Boolean);
begin
 // - �� ��� ������ Root
end;

function TmsmModelElementTree.DoMakeNodeVisible(const aNode: Il3SimpleNode): Integer;

 procedure MakeParentVisible(const aParent: Il3SimpleNode);
 var
  l_I : Integer;
  l_SR : Il3SimpleNode;
 begin//MakeParentVisible
  if (aParent <> nil) then
  begin
   l_I := f_Nodes.IndexOfNode(aParent);
   if (l_I >= 0) then
   begin
    DoChangeExpand(aParent, sbSelect, false);
   end//l_I >= 0
   else
   begin
    MakeParentVisible(aParent.Parent);
    l_I := f_Nodes.IndexOfNode(aParent);
    if (l_I >= 0) then
     DoChangeExpand(aParent, sbSelect, false)
    else
    begin
     if (aParent.Parent = nil) then
     begin
      Changing;
      try
       l_SR := f_Root.AddSubRoot(aParent);
       if (l_SR <> nil) then
       begin
        l_I := f_Nodes.AddNode(l_SR);
        if (l_I >= 0) then
        begin
         f_Flags.Insert(l_I, 0);
         DoChangeExpand(aParent, sbSelect, false);
        end;//l_I >= 0
       end;//l_SR <> nil
      finally
       Changed;
      end;//try..finally
     end;//aParent.Parent = nil
    end;//l_I >= 0
   end;//l_I >= 0
  end;//l_Parent <> nil
 end;//MakeParentVisible
 
begin
 Result := inherited DoMakeNodeVisible(aNode);
 if (Result < 0) then
 begin
  Changing;
  try
   //MakeParentVisible(aNode.Parent);
   MakeParentVisible(aNode);
   Result := inherited DoMakeNodeVisible(aNode);
  finally
   Changed;
  end;//try..finally
 end;//Result < 0
end;

//#UC END# *57AC3A8100E5impl*

end.
