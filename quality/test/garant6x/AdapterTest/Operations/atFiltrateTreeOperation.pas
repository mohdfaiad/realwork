unit atFiltrateTreeOperation;

// ������: "w:\quality\test\garant6x\AdapterTest\Operations\atFiltrateTreeOperation.pas"
// ���������: "SimpleClass"
// ������� ������: "TatFiltrateTreeOperation" MUID: (503B7D18032C)

interface

uses
 l3IntfUses
 , atOperationBase
 , atStringProvider
;

type
 _atHasStringParamAddOn_Parent_ = TatOperationBase;
 {$Include w:\quality\test\garant6x\AdapterTest\Operations\atHasStringParamAddOn.imp.pas}
 TatFiltrateTreeOperation = class(_atHasStringParamAddOn_)
  protected
   function OnString(const aString: AnsiString): Boolean; override;
   procedure InitParamList; override;
 end;//TatFiltrateTreeOperation

implementation

uses
 l3ImplUses
 , atLogger
 , DynamicTreeUnit
 , atNodeHelper
 , atStringHelper
 , atSettingsHelper
 , atFilterHelper
 , SysUtils
 , atSyncedStringFileReader
 , atStringFileReader
 , atConstStringProvider
 //#UC START# *503B7D18032Cimpl_uses*
 //#UC END# *503B7D18032Cimpl_uses*
;

{$Include w:\quality\test\garant6x\AdapterTest\Operations\atHasStringParamAddOn.imp.pas}

function TatFiltrateTreeOperation.OnString(const aString: AnsiString): Boolean;
//#UC START# *503648620273_503B7D18032C_var*
  const
    DELIM = ';';
  var
    l_TreeTag, l_Context, l_SrcTreeName, l_SrcContext : String;
    l_Root, l_Tree, l_FilteredTree, l_Node : INodeBase;
    l_NodeIter : INodeIterator;
    l_Filters : IFilterList;
    l_Filter : TatContextFilter;
    l_FilterParams : ContextFilterParams;
    l_SyncIndex, l_NodesCount, l_DelimPos : Integer;
    l_WasNonEmptyResult : Boolean;
//#UC END# *503648620273_503B7D18032C_var*
begin
//#UC START# *503648620273_503B7D18032C_impl*
  Result := true;

  // ��������� �������� ������ �� �������� � ��� ������
  l_DelimPos := Pos(DELIM, aString);
  if l_DelimPos = -1 then
  begin
    Logger.Error('������ %s �� �������� ����������� (����������� ������������)', [aString]);
    Exit;
  end;
  //
  l_SrcTreeName := Trim(Copy(aString, 1, l_DelimPos - 1));
  l_SrcContext := Trim(Copy(aString, l_DelimPos + 1, Length(aString) - l_DelimPos));

  // ����� ���� ��� ������ ������ � ������������ ����, ��������...
  try
    l_TreeTag := TatTreeTagConverter.Instance.SecondToFirstCI(l_SrcTreeName);
  except
    on EConvertError do
      l_TreeTag := l_SrcTreeName; // ���, ����� ��� ����
  end;

  // �������� ����������� ������
  try
    l_Tree := ExecutionContext.GblAdapterWorker.GblAdapterDll.MakeNodeBase(PAnsiChar(l_TreeTag));
  except
    on ex : Exception do
    begin
      Logger.Exception(ex);
      l_Tree := nil;
    end;
  end;
  if l_Tree = nil then
  begin
    Logger.Error('��� ������ ������: %s (%s)', [l_TreeTag, l_SrcTreeName]);
    Exit;
  end;
  l_Root := l_Tree; // ��������� ������ ������

  // ������� � ����������� ������
  l_Filter := TatContextFilter.Create;
  try
    // �������� ��������� ������� �� ��������
    if NOT TatSettingsHelper.GetContextFilterParamsByTreeTag(l_TreeTag, l_FilterParams) then
      l_FilterParams := DEFAULT_CONTEXT_FILTER_PARAMS; // ���� � ���������� ���, �� ��-���������
    // ����������� ������
    l_Filter.Area := l_FilterParams.SearchArea;
    l_Filter.Place := l_FilterParams.ContextPlace;
    l_Filter.Order := l_FilterParams.FindOrder;
    l_Filter.TweakContextOnAssignment := Parameters['is_tweak_context'].AsBool;
    //
    l_Filters := ExecutionContext.GblAdapterWorker.GblAdapterDll.MakeFilterList;
    l_Filters.Add(l_Filter.Filter);

    if Parameters['is_emulate_user_input'].AsBool then
      SetLength(l_Context, 0)
    else
      SetLength(l_Context, Length(l_SrcContext)-1);

    l_WasNonEmptyResult := false;
    l_FilteredTree := l_Tree;
    repeat
      l_Context := Copy(l_SrcContext, 1, Length(l_Context) + 1); // ����������� �������� �� ���� ������

      l_Filter.Context := l_Context;

      Logger.Info('����� ����������� ������ %s ���������� "%s" (�������� �������: "%s")', [l_TreeTag, l_Filter.Context, l_Context]);

      l_Tree := l_FilteredTree;
      l_Tree.CreateViewEx(l_Filters, FM_USER_FLAG_MASK, nil, l_SyncIndex, 0, false, true, true, l_FilteredTree);
      //
      if l_FilteredTree = nil then
      begin
        Logger.Info('��������� ����');
        break;
      end
      else
      begin
        // ������� ���������� ��������������� ���
        l_NodesCount := 0;
        l_FilteredTree.IterateNodes(FM_SHARED_NONE, l_NodeIter);
        while true do
        begin
          l_NodeIter.GetNext(l_Node);
          if (l_Node = nil) then break;
          Inc(l_NodesCount);
          TatNodeHelper.GetCaption(l_Node);
        end;
        Logger.Info('��������� �������� %d �����', [l_NodesCount]);
        //
        if (l_NodesCount = 0) then
          if (NOT l_WasNonEmptyResult) AND Parameters['is_emulate_user_input'].AsBool then // ���� ������� ������ �� ����������, �� ����� ����� ����
            l_FilteredTree := l_Root
          else
            break;  
        l_WasNonEmptyResult := l_NodesCount > 0;
      end;
    until l_Context = l_SrcContext; // ���������� ���� ��������

  finally
    FreeAndNil(l_Filter);
  end;
//#UC END# *503648620273_503B7D18032C_impl*
end;//TatFiltrateTreeOperation.OnString

procedure TatFiltrateTreeOperation.InitParamList;
//#UC START# *48089F3701B4_503B7D18032C_var*
//#UC END# *48089F3701B4_503B7D18032C_var*
begin
//#UC START# *48089F3701B4_503B7D18032C_impl*
  inherited;
  with f_ParamList do
  begin
    Add( ParamType.Create('is_tweak_context', '��������������� �������� ��� ���������� � ������������ � ���������� �������', 'true'));
    Add( ParamType.Create('is_emulate_user_input', '����������� ���������� �� ���� ����� ������������� ����� ��������', 'true'));
  end;
//#UC END# *48089F3701B4_503B7D18032C_impl*
end;//TatFiltrateTreeOperation.InitParamList

end.
