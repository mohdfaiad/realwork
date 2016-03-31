unit atDumpTreeOperation;

// ������: "w:\quality\test\garant6x\AdapterTest\Operations\atDumpTreeOperation.pas"
// ���������: "SimpleClass"
// ������� ������: "TatDumpTreeOperation" MUID: (503D03510064)

interface

uses
 l3IntfUses
 , atOperationBase
;

type
 TatDumpTreeOperation = class(TatOperationBase)
  protected
   procedure ExecuteSelf; override;
   procedure InitParamList; override;
 end;//TatDumpTreeOperation

implementation

uses
 l3ImplUses
 , DynamicTreeUnit
 , atNodeHelper
 , atLogger
 , BaseTypesUnit
;

procedure TatDumpTreeOperation.ExecuteSelf;
//#UC START# *48089F460352_503D03510064_var*
  const
    l_TagArr : array [0..47] of String = (
      AT_ANNO_INTEREST,
      AT_ANNO_KIND,
      AT_ANNO_ORG,
      AT_ANNO_TAX,
      AT_ANNO_USER,
      AT_BASES,
      AT_CLASS,
      AT_EDITION,
      AT_KW,
      AT_NORM,
      AT_PREFIX,
      AT_PUBLISH_SOURCE,
      AT_REG_IN_MU_NUM,
      AT_REG_IN_MU,
      AT_REG_NUM,
      AT_SOURCE,
      AT_STATUS,
      AT_TERRITORY,
      AT_TYPE,
      AT_UC,
      AT_PHARM_INTERNATIONAL_NAME,
      AT_PHARM_TRADE_NAME,
      AT_PHARM_CHAPTER,
      AT_PHARM_COUNTRY,
      AT_PHARM_FIRM,
      AT_PHARM_REG_STATUS,
      AT_PHARM_MEDICINAL_FORM,
      AT_PHARM_ATC,
      AT_PHARM_MKB,
      AT_PHARM_GROUP,
      AT_PHARM_EFFECT,
      AT_PHARM_NARCOTIC,
      AT_PHARM_UNRECIPE,
      AT_PHARM_IMPORTANT,
      AT_PHARM_COUNTRY_FOR_FILTER,
      AT_VARIANTS,
      AT_PREFIX_REVIEW,
      AT_PUBLISH_SOURCE_FINANCE,
      AT_PUBLISH_SOURCE_LEGAL,
      AT_PUBLISH_SOURCE_HR,
      AT_PUBLISH_SOURCE_BUDGET_ORGS,
      AT_BASE_SEARCH_PANES,
      AT_CLASS_REVIEW,
      AT_SOURCE_REVIEW,
      'ExplanatoryDiction',
      'MainMenu',
      'MedExplanatoryDiction',
      'CRTree'
  );
  var
    i : Integer;
    l_TreeTag, l_FilePathPrefix : String;
    l_IsFullNodePath : Boolean;

  procedure DumpTreeToFile;
    var
      l_File : Text;
      l_FileName, l_Line : String;
      l_NodeIter : INodeIterator;
      l_Root, l_Node : INodeBase;
  begin
    try
      l_Root := ExecutionContext.GblAdapterWorker.GblAdapterDll.MakeNodeBase(PAnsiChar(l_TreeTag));
    except
      on ECanNotFindData do
        begin
          Logger.Error('��� ������ ������ %s', [l_TreeTag]);
          l_Root := nil;
        end;
    end;
    if l_Root = nil then Exit;
    //
    l_FileName := l_FilePathPrefix + l_TreeTag + '.tree_dump.txt';
    AssignFile(l_File, l_FileName);
    try
      Rewrite(l_File);
      //
      l_Root.IterateAllNodes(FM_SHARED_NONE, l_NodeIter);
      l_Node := l_Root;
      repeat
        if l_IsFullNodePath then
          l_Line := TatNodeHelper.GetPath(l_Node)
        else
          l_Line := StringOfChar(#9, l_Node.GetLevel) + TatNodeHelper.GetCaption(l_Node);
        WriteLn(l_File, l_Line);
        l_NodeIter.GetNext(l_Node);
      until l_Node = nil;
    finally
      CloseFile(l_File);
    end;
  end;
//#UC END# *48089F460352_503D03510064_var*
begin
//#UC START# *48089F460352_503D03510064_impl*
  l_FilePathPrefix := Parameters['file_path_prefix'].AsStr;
  l_TreeTag := Parameters['tree_tag'].AsStr;
  l_IsFullNodePath := Parameters['is_full_node_path'].AsBool;
  //
  if l_TreeTag <> '' then
    DumpTreeToFile
  else
    for i := Low(l_TagArr) to High(l_TagArr) do
    begin
      l_TreeTag := l_TagArr[i];
      DumpTreeToFile
    end;
//#UC END# *48089F460352_503D03510064_impl*
end;//TatDumpTreeOperation.ExecuteSelf

procedure TatDumpTreeOperation.InitParamList;
//#UC START# *48089F3701B4_503D03510064_var*
//#UC END# *48089F3701B4_503D03510064_var*
begin
//#UC START# *48089F3701B4_503D03510064_impl*
  inherited;
  with f_ParamList do
  begin
    Add( ParamType.Create('file_path_prefix', '������� ���� � �����', ''));
    Add( ParamType.Create('tree_tag', '��� ������', ''));
    Add( ParamType.Create('is_full_node_path', '�������� ������ ���� ������ ����', 'false'));
  end;
//#UC END# *48089F3701B4_503D03510064_impl*
end;//TatDumpTreeOperation.InitParamList

end.
