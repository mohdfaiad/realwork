unit atNodeHelper;

// ������: "w:\quality\test\garant6x\AdapterTest\AdapterHelpers\atNodeHelper.pas"
// ���������: "SimpleClass"
// ������� ������: "TatNodeHelper" MUID: (48078D230277)

interface

uses
 l3IntfUses
 , DynamicTreeUnit
 , DynamicTreeDefinesUnit
 , BaseTreeSupportUnit
 , FoldersUnit
 , atStringToStringConverterBase
;

type
 TatNodeCallBackProcOfObj = procedure(const node: INodeBase) of object;

 TatNodeCallbacks = class
  public
   class procedure CallNodeCaption(const node: INodeBase); virtual;
 end;//TatNodeCallbacks

 TatNodeMatchFuncOfObj = function(const aNode: INodeBase;
  const aParam: Variant): Boolean of object;

 TatNodeMatchFuncs = class
  public
   class function MatchByCaption(const aNode: INodeBase;
    const aCaption: Variant): Boolean; virtual;
   class function MatchByCaptionCI(const aNode: INodeBase;
    const aCaption: Variant): Boolean;
 end;//TatNodeMatchFuncs

 TatTreeTagConverter = class(TatStringToStringConverterBase)
  {* ����������� ����� ���������� ������ ������  � ��� ��� ��� ������� � ���� ������� }
  protected
   procedure InitConvertMap; override;
  public
   class function Instance: TatTreeTagConverter;
    {* ����� ��������� ���������� ���������� TatTreeTagConverter }
   class function Exists: Boolean;
    {* ��������� ������ ��������� ���������� ��� ��� }
 end;//TatTreeTagConverter

 TatNodeHelper = class
  private
   class procedure LoadNodesPriv(const rootNode: INodeBase;
    const level: Word;
    var count: Longword;
    nodeCallBack: TatNodeCallBackProcOfObj);
  public
   class function LoadNodesThrough(const rootNode: INodeBase;
    nodeFlag: TFlagMask;
    nodesCount: Integer;
    NodeCallBack: TatNodeCallBackProcOfObj = nil): Boolean;
   class function GetCaption(const aNode: INode): AnsiString; overload; virtual;
   class procedure LoadNodes(const rootNode: INodeBase;
    const level: Word = 0;
    count: Longword = 4294967295;
    nodeCallBack: TatNodeCallBackProcOfObj = nil); virtual;
   class function FindNodeByPath(const aRoot: INodeBase;
    const aPath: array of Variant;
    aMatchFunc: TatNodeMatchFuncOfObj;
    const isExcludeRoot: Boolean = False): INodeBase; overload; virtual;
   class function CountNodes(const rootNode: INodeBase): Integer;
   class function FindNode(const aNode: INodeBase;
    const aValue: Variant;
    aMatchFunc: TatNodeMatchFuncOfObj): INodeBase; virtual;
   class function GetCaption(const aNode: INodeBase): AnsiString; overload; virtual;
   class function GetCaption(const aNode: IFoldersNode): AnsiString; overload;
   class function FindNodeByPath(const aRoot: INodeBase;
    const aPath: AnsiString;
    const aPathDelimiter: AnsiChar = '\';
    const isCaseInsensitive: Boolean = False;
    const isExcludeRoot: Boolean = False): INodeBase; overload;
   class function GetPath(const aNode: INodeBase;
    const aPathDelimiter: AnsiString = '\';
    const isExcludeRoot: Boolean = False): AnsiString;
    {* ���������� ��������� ���� (�� Caption'��) � ���� }
   class function GetNext(const aNode: INodeBase): INodeBase;
 end;//TatNodeHelper

implementation

uses
 l3ImplUses
 , IOUnit
 , atDocumentHelper
 , Variants
 , SysUtils
 , Classes
 , l3Base
 //#UC START# *48078D230277impl_uses*
 //#UC END# *48078D230277impl_uses*
;

var g_TatTreeTagConverter: TatTreeTagConverter = nil;
 {* ��������� ���������� TatTreeTagConverter }

procedure TatTreeTagConverterFree;
 {* ����� ������������ ���������� ���������� TatTreeTagConverter }
begin
 l3Free(g_TatTreeTagConverter);
end;//TatTreeTagConverterFree

class procedure TatNodeCallbacks.CallNodeCaption(const node: INodeBase);
//#UC START# *4A4DEF3101A3_4A4DEF1D0195_var*
  var
    str : IString;
//#UC END# *4A4DEF3101A3_4A4DEF1D0195_var*
begin
//#UC START# *4A4DEF3101A3_4A4DEF1D0195_impl*
  node.GetCaption(str);
  if str <> nil then str.GetData;
//#UC END# *4A4DEF3101A3_4A4DEF1D0195_impl*
end;//TatNodeCallbacks.CallNodeCaption

class function TatNodeMatchFuncs.MatchByCaption(const aNode: INodeBase;
 const aCaption: Variant): Boolean;
//#UC START# *4B90F22700A3_4B90F1F501DD_var*
  var
    l_String : IString;
//#UC END# *4B90F22700A3_4B90F1F501DD_var*
begin
//#UC START# *4B90F22700A3_4B90F1F501DD_impl*
  Assert(VarType(aCaption) = varString, 'VarType(aCaption) = varString');
  aNode.GetCaption(l_String);
  Result := Assigned(l_String) AND (String(l_String.GetData) = VarToStr(aCaption));
//#UC END# *4B90F22700A3_4B90F1F501DD_impl*
end;//TatNodeMatchFuncs.MatchByCaption

class function TatNodeMatchFuncs.MatchByCaptionCI(const aNode: INodeBase;
 const aCaption: Variant): Boolean;
//#UC START# *50046733037B_4B90F1F501DD_var*
  var
    l_String : IString;
//#UC END# *50046733037B_4B90F1F501DD_var*
begin
//#UC START# *50046733037B_4B90F1F501DD_impl*
  Assert(VarType(aCaption) = varString, 'VarType(aCaption) = varString');
  aNode.GetCaption(l_String);
  Result := Assigned(l_String) AND AnsiSameText(l_String.GetData, VarToStr(aCaption));
//#UC END# *50046733037B_4B90F1F501DD_impl*
end;//TatNodeMatchFuncs.MatchByCaptionCI

procedure TatTreeTagConverter.InitConvertMap;
//#UC START# *503E3A040395_503F7E3800E2_var*
  const
    CONVERT_MAP : array [0..44] of Synonyms = (
   (First : AT_ANNO_INTEREST; Second : '����� ���������'),
   (First : AT_ANNO_KIND; Second : '��� ����������'),
   (First : AT_ANNO_ORG; Second : '��������� ����� �����������'),
   (First : AT_ANNO_TAX; Second : '������ � ���������������'),
   (First : AT_ANNO_USER; Second : '���� ���������'),
   (First : AT_BASES; Second : '�������������� ����'),
   (First : AT_CLASS; Second : '������/����'),
   (First : AT_EDITION; Second : '������ � ������������� ���������'),
   (First : AT_KW; Second : '��������'),
   (First : AT_NORM; Second : '����������'),
   (First : AT_PREFIX; Second : '��� �������� ����������'),
   (First : AT_PUBLISH_SOURCE; Second : '�������� �������������'),
   (First : AT_REG_IN_MU_NUM; Second : '��������������� �����'),
   (First : AT_REG_IN_MU; Second : '������ �����������'),
   (First : AT_REG_NUM; Second : '�����'),
   (First : AT_SOURCE; Second : '�����/��������'),
   (First : AT_STATUS; Second : '������'),
   (First : AT_TERRITORY; Second : '���������� �������������'),
   (First : AT_TYPE; Second : '���'),
   (First : AT_UC; Second : '��� �����������'),
   (First : AT_PHARM_INTERNATIONAL_NAME; Second : '������������� ������������'),
   (First : AT_PHARM_TRADE_NAME; Second : '�������� ������������'),
   (First : AT_PHARM_CHAPTER; Second : '������ �����������'),
   (First : AT_PHARM_COUNTRY; Second : '������'),
   (First : AT_PHARM_FIRM; Second : '�����'),
   (First : AT_PHARM_REG_STATUS; Second : '������ �����������'),
   (First : AT_PHARM_MEDICINAL_FORM; Second : '������������� �����'),
   (First : AT_PHARM_ATC; Second : '��� ���'),
   (First : AT_PHARM_MKB; Second : '����� ���'),
   (First : AT_PHARM_GROUP; Second : '����������'),
   (First : AT_PHARM_EFFECT; Second : '����������������� ��������'),
   (First : AT_PHARM_NARCOTIC; Second : '����������������� ��������'),
   (First : AT_PHARM_IMPORTANT; Second : '�����'),
   (First : AT_PHARM_COUNTRY_FOR_FILTER; Second : '������'),
   (First : AT_PREFIX_REVIEW; Second : '��� �������� ����������'),
   (First : AT_PUBLISH_SOURCE_FINANCE; Second : '��� �� ������� � ��������'),
   (First : AT_PUBLISH_SOURCE_LEGAL; Second : '��� ��� ������'),
   (First : AT_PUBLISH_SOURCE_HR; Second : '��� �� �������� ��������'),
   (First : AT_PUBLISH_SOURCE_BUDGET_ORGS; Second : '��� ��� ���������������� �������'),
   (First : AT_BASE_SEARCH_PANES; Second : '������� �������� ������'),
   (First : AT_CLASS_REVIEW; Second : '������/����'),
   (First : AT_SOURCE_REVIEW; Second : '�����/��������'),
    (First : 'ExplanatoryDiction'; Second : '�������� �������'),
      (First : 'MainMenu'; Second : '��������'),
   (First : 'MedExplanatoryDiction'; Second : '������� ����������� ��������')
    );
//#UC END# *503E3A040395_503F7E3800E2_var*
begin
//#UC START# *503E3A040395_503F7E3800E2_impl*
  InitConvertMap(CONVERT_MAP);
//#UC END# *503E3A040395_503F7E3800E2_impl*
end;//TatTreeTagConverter.InitConvertMap

class function TatTreeTagConverter.Instance: TatTreeTagConverter;
 {* ����� ��������� ���������� ���������� TatTreeTagConverter }
begin
 if (g_TatTreeTagConverter = nil) then
 begin
  l3System.AddExitProc(TatTreeTagConverterFree);
  g_TatTreeTagConverter := Create;
 end;
 Result := g_TatTreeTagConverter;
end;//TatTreeTagConverter.Instance

class function TatTreeTagConverter.Exists: Boolean;
 {* ��������� ������ ��������� ���������� ��� ��� }
begin
 Result := g_TatTreeTagConverter <> nil;
end;//TatTreeTagConverter.Exists

class procedure TatNodeHelper.LoadNodesPriv(const rootNode: INodeBase;
 const level: Word;
 var count: Longword;
 nodeCallBack: TatNodeCallBackProcOfObj);
//#UC START# *48078DCF011F_48078D230277_var*
    var
      currNode, tempNode, firstChild : INodeBase;
//#UC END# *48078DCF011F_48078D230277_var*
begin
//#UC START# *48078DCF011F_48078D230277_impl*
  Assert(rootNode <> nil, 'rootNode <> nil');
  currNode := rootNode;
  if (count > 0) then
    while (true) do
    begin
      if (@NodeCallBack <> nil) then
        NodeCallBack(currNode);
      Dec(count);
      if (count = 0) then break;
      //
      if (level > 0 ) AND (currNode.HasChildren) then
      begin
        currNode.GetFirstChild(firstChild);
        if (firstChild <> nil) then // firstChild = nil ��� ������� �������� (��. K: 106989170)
          LoadNodesPriv(firstChild, level-1, count, NodeCallBack);
      end;
      //
      if currNode.IsLast then break;
      //
      currNode.GetNext(tempNode);
      currNode := tempNode;
      tempNode := nil;
    end;
//#UC END# *48078DCF011F_48078D230277_impl*
end;//TatNodeHelper.LoadNodesPriv

class function TatNodeHelper.LoadNodesThrough(const rootNode: INodeBase;
 nodeFlag: TFlagMask;
 nodesCount: Integer;
 NodeCallBack: TatNodeCallBackProcOfObj = nil): Boolean;
//#UC START# *48078DFD028F_48078D230277_var*
    const
      FUNCTION_NAME = 'TatNodeHelper.LoadNodes';
    var
      node : INodeBase;
      nodeIter : INodeIterator;
      isLoadAll : boolean;
      i : integer;
//#UC END# *48078DFD028F_48078D230277_var*
begin
//#UC START# *48078DFD028F_48078D230277_impl*
    Result := false;
    assert(rootNode <> nil, 'rootNode <> nil');
    isLoadAll := (nodesCount = -1);
    //
    rootNode.IterateAllNodes(nodeFlag, nodeIter);
    assert(nodeIter <> nil, 'nodeIter <> nil');
    //
    node := rootNode;
    i := 1;
    while isLoadAll OR (i < nodesCount) do
    begin
      if (node = nil) then
      begin
        Result := isLoadAll;
        break;
      end;
      if (@NodeCallBack <> nil) then
        NodeCallBack(node);
      // ����� ���������
      nodeIter.GetNext(node);
      //
      Inc(i);
    end;
//#UC END# *48078DFD028F_48078D230277_impl*
end;//TatNodeHelper.LoadNodesThrough

class function TatNodeHelper.GetCaption(const aNode: INode): AnsiString;
//#UC START# *4840189501ED_48078D230277_var*
  var
    l_String : IString;
//#UC END# *4840189501ED_48078D230277_var*
begin
//#UC START# *4840189501ED_48078D230277_impl*
  Assert(aNode <> nil, 'aNode <> nil');
  aNode.GetCaption(l_String);
  Result := l_String.GetData
//#UC END# *4840189501ED_48078D230277_impl*
end;//TatNodeHelper.GetCaption

class procedure TatNodeHelper.LoadNodes(const rootNode: INodeBase;
 const level: Word = 0;
 count: Longword = 4294967295;
 nodeCallBack: TatNodeCallBackProcOfObj = nil);
//#UC START# *4A4DE37502ED_48078D230277_var*
//#UC END# *4A4DE37502ED_48078D230277_var*
begin
//#UC START# *4A4DE37502ED_48078D230277_impl*
  LoadNodesPriv(rootNode, level, count, nodeCallBack);
//#UC END# *4A4DE37502ED_48078D230277_impl*
end;//TatNodeHelper.LoadNodes

class function TatNodeHelper.FindNodeByPath(const aRoot: INodeBase;
 const aPath: array of Variant;
 aMatchFunc: TatNodeMatchFuncOfObj;
 const isExcludeRoot: Boolean = False): INodeBase;
//#UC START# *4B90F261015F_48078D230277_var*
  var
    l_CurrNode, l_TmpNode : INodeBase;
    i : Integer;

  procedure GoToNextLevel;
  begin
    l_CurrNode.GetFirstChild(l_TmpNode);
    l_CurrNode := l_TmpNode;
    l_TmpNode := nil;
  end;
//#UC END# *4B90F261015F_48078D230277_var*
begin
//#UC START# *4B90F261015F_48078D230277_impl*
  Result := nil;
  l_CurrNode := aRoot;
  i := Low(aPath);
  if isExcludeRoot then
    GoToNextLevel;
  // �������� �� ������
  while (Result = nil) AND (l_CurrNode <> nil) do //AND (l_CurrNode.HasChildren)) do
  begin
    // ���� �� ������� ������ ��������������� ����
    while (l_CurrNode <> nil) AND (NOT aMatchFunc(l_CurrNode, aPath[i])) do
    begin
      l_CurrNode.GetNext(l_TmpNode);
      l_CurrNode := l_TmpNode;
      l_TmpNode := nil;
    end;
    // ���� ���� �������
    if (l_CurrNode <> nil) then
      if (i = High(aPath)) then // � ���� ��������, �� ������ ����� �� ��� ������
        Result := l_CurrNode
      else
      begin
        // ��������� � ���������� �������� ����
        Inc(i);
        // ��������� � ���������� ������
        GoToNextLevel;
      end;
  end;
//#UC END# *4B90F261015F_48078D230277_impl*
end;//TatNodeHelper.FindNodeByPath

class function TatNodeHelper.CountNodes(const rootNode: INodeBase): Integer;
//#UC START# *4B90F2D60278_48078D230277_var*
    var
      parentNode, currNode, firstChild : INodeBase;
      currNodeChildCount : integer;
      nodeIter : INodeIterator;
//#UC END# *4B90F2D60278_48078D230277_var*
begin
//#UC START# *4B90F2D60278_48078D230277_impl*
    assert(rootNode <> nil, 'rootNode <> nil');
    //
    Result := 1;
    // ���� ����������� �� �����
    rootNode.IterateAllNodes(FM_SHARED_NONE, nodeIter);
    if (nodeIter <> nil) then
      while true do
      begin
        nodeIter.GetNext(currNode);
        if (currNode <> nil) then
          Inc(Result)
        else
          break;
      end;

  {  currNode := rootNode;
    //
    if (NOT rootNode.HasChildren) then
    begin
      parentNode.GetParent(parentNode);
      if (parentNode <> nil) then
        rootNode.GetBySibblingIndex(parentNode.GetChildCount-1, currNode);
    end
    else // ��������������� �� ������ ���������� �������
      while currNode.HasChildren do
      begin
        currNode.GetFirstChild(firstChild);
        currNodeChildCount := currNode.GetChildCount;
        firstChild.GetBySibblingIndex(currNodeChildCount-1, currNode);
      end;
    // �������� ���������� ��� ��� ������� ���������� ��������
    Result := currNode.GetAbsIndex - rootNode.GetAbsIndex + 1; }
//#UC END# *4B90F2D60278_48078D230277_impl*
end;//TatNodeHelper.CountNodes

class function TatNodeHelper.FindNode(const aNode: INodeBase;
 const aValue: Variant;
 aMatchFunc: TatNodeMatchFuncOfObj): INodeBase;
//#UC START# *4BAB7D76024F_48078D230277_var*
  var
    l_CurrNode, l_NextNode : INodeBase;
//#UC END# *4BAB7D76024F_48078D230277_var*
begin
//#UC START# *4BAB7D76024F_48078D230277_impl*
  Result := nil;
  l_CurrNode := aNode;
  //
  while (Result = nil) AND (l_CurrNode <> nil) do
    if aMatchFunc(l_CurrNode, aValue) then
      Result := l_CurrNode
    else
    begin
      if l_CurrNode.HasChildren then // ���� ���� ����, �� �������� ������ ����� ���
        l_CurrNode.GetFirstChild(l_NextNode)
      else // ����� ��������� ����
      begin
        l_CurrNode.GetNext(l_NextNode);
        // ���� ��� ������, ������ ������� ����� ����
        while (l_NextNode = nil) AND (l_CurrNode <> nil) do
        begin
          l_CurrNode.GetParent(l_NextNode);
          l_CurrNode := l_NextNode;
          l_NextNode := nil;
          //
          if (l_CurrNode <> nil) then
            l_CurrNode.GetNext(l_NextNode);
        end;
      end;
      //
      l_CurrNode := l_NextNode;
      l_NextNode := nil;
   end;
//#UC END# *4BAB7D76024F_48078D230277_impl*
end;//TatNodeHelper.FindNode

class function TatNodeHelper.GetCaption(const aNode: INodeBase): AnsiString;
//#UC START# *4BACB88F0360_48078D230277_var*
  var
    l_String : IString;
//#UC END# *4BACB88F0360_48078D230277_var*
begin
//#UC START# *4BACB88F0360_48078D230277_impl*
  Assert(aNode <> nil, 'aNode <> nil');
  aNode.GetCaption(l_String);
  Result := l_String.GetData
//#UC END# *4BACB88F0360_48078D230277_impl*
end;//TatNodeHelper.GetCaption

class function TatNodeHelper.GetCaption(const aNode: IFoldersNode): AnsiString;
//#UC START# *4FDB88BF0068_48078D230277_var*
  var
    l_String : IString;
//#UC END# *4FDB88BF0068_48078D230277_var*
begin
//#UC START# *4FDB88BF0068_48078D230277_impl*
  Assert(aNode <> nil, 'aNode <> nil');
  aNode.GetCaption(l_String);
  Result := l_String.GetData
//#UC END# *4FDB88BF0068_48078D230277_impl*
end;//TatNodeHelper.GetCaption

class function TatNodeHelper.FindNodeByPath(const aRoot: INodeBase;
 const aPath: AnsiString;
 const aPathDelimiter: AnsiChar = '\';
 const isCaseInsensitive: Boolean = False;
 const isExcludeRoot: Boolean = False): INodeBase;
//#UC START# *500466E70257_48078D230277_var*
  var
    l_Path : array of Variant;
    i : Integer;
    l_MatchFunc : TatNodeMatchFuncOfObj;
    l_Strings : TStringList;
//#UC END# *500466E70257_48078D230277_var*
begin
//#UC START# *500466E70257_48078D230277_impl*
  // ��������� ���� �� ������ ���������
  l_Strings := TStringList.Create;
  try
    ExtractStrings([aPathDelimiter], [], PAnsiChar(aPath), l_Strings);
    SetLength(l_Path, l_Strings.Count);
    for i := 0 to l_Strings.Count-1 do
      l_Path[i] := l_Strings.Strings[i];
  finally
    FreeAndNil(l_Strings);
  end;

  if isCaseInsensitive then
    l_MatchFunc := TatNodeMatchFuncs.MatchByCaptionCI
  else
    l_MatchFunc := TatNodeMatchFuncs.MatchByCaption;

  Result := TatNodeHelper.FindNodeByPath(aRoot, l_Path, l_MatchFunc, isExcludeRoot);
//#UC END# *500466E70257_48078D230277_impl*
end;//TatNodeHelper.FindNodeByPath

class function TatNodeHelper.GetPath(const aNode: INodeBase;
 const aPathDelimiter: AnsiString = '\';
 const isExcludeRoot: Boolean = False): AnsiString;
 {* ���������� ��������� ���� (�� Caption'��) � ���� }
//#UC START# *50056589021B_48078D230277_var*
  var
    l_CurrentNode, l_ParentNode : INodeBase;
    l_Caption : IString;
//#UC END# *50056589021B_48078D230277_var*
begin
//#UC START# *50056589021B_48078D230277_impl*
  Result := '';
  l_CurrentNode := aNode;
  while true do
  begin
    l_CurrentNode.GetCaption(l_Caption);
    if NOT Assigned(l_Caption) then
      Raise Exception.Create('������ �������� ���� ������ ��� ������ ������ caption!');
    //
    l_CurrentNode.GetParent(l_ParentNode);
    l_CurrentNode := l_ParentNode;
    //
    if (l_CurrentNode <> nil) OR (NOT isExcludeRoot) then
      Result := String(l_Caption.GetData) + aPathDelimiter + Result;
    if l_CurrentNode = nil then break;
  end;
  if Length(Result) > 0 then
    SetLength(Result, Length(Result) - Length(aPathDelimiter));
//#UC END# *50056589021B_48078D230277_impl*
end;//TatNodeHelper.GetPath

class function TatNodeHelper.GetNext(const aNode: INodeBase): INodeBase;
//#UC START# *505216EC02EC_48078D230277_var*
//#UC END# *505216EC02EC_48078D230277_var*
begin
//#UC START# *505216EC02EC_48078D230277_impl*
  aNode.GetNext(Result);
//#UC END# *505216EC02EC_48078D230277_impl*
end;//TatNodeHelper.GetNext

end.
