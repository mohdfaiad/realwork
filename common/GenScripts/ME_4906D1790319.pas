unit nsBaseSearchPromptTreeBase;
 {* ������ ��������� ��� �� }

// ������: "w:\garant6x\implementation\Garant\GbaNemesis\View\nsBaseSearchPromptTreeBase.pas"
// ���������: "SimpleClass"

{$Include w:\garant6x\implementation\Garant\nsDefine.inc}

interface

{$If NOT Defined(Admin) AND NOT Defined(Monitorings)}
uses
 l3IntfUses
 , nsDataResetTreeStruct
 , l3TreeInterfaces
 , DynamicTreeUnit
 , nsINodeWrapBase
 , bsInterfaces
 , SysUtils
 , nsINodeRootWrap
 {$If Defined(Nemesis)}
 , nscNewInterfaces
 {$IfEnd} // Defined(Nemesis)
 , l3Variant
 , l3IID
 , nsLogEvent
;

type
 EPromptTreeNotFound = class(Exception)
  {* ��������� �� ������� }
 end;//EPromptTreeNotFound

 TnsOpenDocumentFromBaseSearchPromptEvent = class(TnsLogEvent)
  private
   class procedure Log(const aText: AnsiString;
    aDoc: Integer);
 end;//TnsOpenDocumentFromBaseSearchPromptEvent

 TnsBaseSearchPromptRoot = class(TnsINodeRootWrap{$If Defined(Nemesis)}
 , InscBaseSearchPromptNode
 {$IfEnd} // Defined(Nemesis)
 )
  private
   f_Doc: Integer;
   f_Sub: Integer;
   f_Text: AnsiString;
   f_Para: Tl3Tag;
    {* ���� ��� �������� Para }
  protected
   function pm_GetPara: Tl3Tag;
   {$If Defined(Nemesis)}
   function OpenDocument: Boolean;
   {$IfEnd} // Defined(Nemesis)
   {$If Defined(Nemesis)}
   function IsLinkOnDocument: Boolean;
   {$IfEnd} // Defined(Nemesis)
   procedure Cleanup; override;
    {* ������� ������� ����� �������. }
   function COMQueryInterface(const IID: Tl3GUID;
    out Obj): Tl3HResult; override;
    {* ���������� ������� ���������� }
  protected
   property Para: Tl3Tag
    read pm_GetPara;
 end;//TnsBaseSearchPromptRoot

 TnsBaseSearchPromptTreeBase = class(TnsDataResetTreeStruct)
  {* ������ ��������� ��� �� }
  protected
   function ReAqurieUnfilteredRoot: INodeBase; override;
   function RootNodeClass: RnsINodeWrap; override;
    {* ���������� ����� ������� ��� Root }
   function MakeFilters: Il3TreeFilters; override;
   procedure FillFilters(const aFilters: Il3TreeFilters;
    const anAdapterFilters: InsAdapterFilters); override;
   function MakeContextFilterParams: Il3ContextFilterParams; override;
  public
   constructor Create; reintroduce; { can raise EPromptTreeNotFound }
   class function Make: Il3SimpleTree;
    {* ������ ������ ��������� }
 end;//TnsBaseSearchPromptTreeBase
{$IfEnd} // NOT Defined(Admin) AND NOT Defined(Monitorings)

implementation

{$If NOT Defined(Admin) AND NOT Defined(Monitorings)}
uses
 l3ImplUses
 , DataAdapter
 , nsPromptContextFilterParams
 , nsBaseSearchPromptFilters
 , nsCutToLeafFilter
 , nsTypes
 , nsConst
 , BaseTypesUnit
 , nsPromptForDocFilter
 , BaseSearchInterfaces
 , evNodePainter
 , l3Memory
 , l3Stream
 , evCustomWikiReader
 , l3InternalInterfaces
 , k2DocumentBuffer
 , l3Interfaces
 , k2Tags
 , evTextStyle_Const
 , evdTypes
 , k2Const
 , bsTypesNew
 , nsUtils
 {$If NOT Defined(NoVCM)}
 , vcmBase
 {$IfEnd} // NOT Defined(NoVCM)
 , LoggingUnit
;

const
 {* ��������� ��������� }
 c_CutCount = 7;
  {* �������, ��� ���? }

class procedure TnsOpenDocumentFromBaseSearchPromptEvent.Log(const aText: AnsiString;
 aDoc: Integer);
//#UC START# *555DC78401EF_555DAC3101FD_var*
var
 l_Data: InsLogEventData;
//#UC END# *555DC78401EF_555DAC3101FD_var*
begin
//#UC START# *555DC78401EF_555DAC3101FD_impl*
 l_Data := MakeParamsList;
 l_Data.AddString(PAnsiChar(aText));
 l_Data.AddUlong(aDoc);
 GetLogger.AddEvent(LE_OPEN_DOCUMENT_FROM_SEARCH_HINT, l_Data);
//#UC END# *555DC78401EF_555DAC3101FD_impl*
end;//TnsOpenDocumentFromBaseSearchPromptEvent.Log

function TnsBaseSearchPromptRoot.pm_GetPara: Tl3Tag;
//#UC START# *52B1DDA402C8_52B1DD5901CEget_var*
var
 l_G: Tk2DocumentBuffer;
 l_R: TevCustomWikiReader;
 l_S: Tl3ConstMemoryStream;
 l_W: Tl3WString;
//#UC END# *52B1DDA402C8_52B1DD5901CEget_var*
begin
//#UC START# *52B1DDA402C8_52B1DD5901CEget_impl*
 if not Assigned(f_Para) then
 begin
  l_R := TevCustomWikiReader.Create;
  try
   l_R.AnalizeCharSet := False;
   l_G := Tk2DocumentBuffer.Create;
   try
    l_R.Generator := l_G;
    l_W := Self.Get_Text;
    l_S := Tl3ConstMemoryStream.Create(l_W.S, l_W.SLen);
    try
     l_R.Filer.NeedProcessMessages := False;
     l_R.Filer.Indicator.NeedProgressProc := False;
     l_R.Filer.COMStream := l_S;
     try
      l_R.Filer.CodePage := l_W.SCodePage;
      l_R.Execute;
     finally
      l_R.Filer.COMStream := nil;
     end;//try..finally
    finally
     FreeAndNil(l_S);
    end;//try..finally
    l_G.Root.Child[0].SetRef(f_Para);
   finally
    FreeAndNil(l_G);
   end;//try..finally
  finally
   FreeAndNil(l_R);
  end;//try..finally
 end;//not Assigned(f_Para)
 f_Para.IntA[k2_tiStyle] := ev_saPromptTree;
 Result := f_Para;
//#UC END# *52B1DDA402C8_52B1DD5901CEget_impl*
end;//TnsBaseSearchPromptRoot.pm_GetPara

{$If Defined(Nemesis)}
function TnsBaseSearchPromptRoot.OpenDocument: Boolean;
//#UC START# *52B9761F024B_52B1DD5901CE_var*
var
 l_BS: InsBaseSearcher;
 l_WD: InsBaseSearcherWindowData;
//#UC END# *52B9761F024B_52B1DD5901CE_var*
begin
//#UC START# *52B9761F024B_52B1DD5901CE_impl*
 Result := IsLinkOnDocument and
           nsOpenDocumentByNumber(f_Doc - c_InternalDocShift, f_Sub, dptSub, True, True);
 if Result then
 begin
  TnsOpenDocumentFromBaseSearchPromptEvent.Log(f_Text, f_Doc - c_InternalDocShift);
  if Supports(vcmDispatcher.FormDispatcher.CurrentMainForm, InsBaseSearcher, l_BS) then
   if Supports(l_BS, InsBaseSearcherWindowData, l_WD) then
   begin
    l_WD.Area := ns_saText; // 555398664
   end;
 end;
//#UC END# *52B9761F024B_52B1DD5901CE_impl*
end;//TnsBaseSearchPromptRoot.OpenDocument
{$IfEnd} // Defined(Nemesis)

{$If Defined(Nemesis)}
function TnsBaseSearchPromptRoot.IsLinkOnDocument: Boolean;
//#UC START# *52B977E30154_52B1DD5901CE_var*
var
 l_Hyperlink,
 l_Address: Tl3Variant;
//#UC END# *52B977E30154_52B1DD5901CE_var*
begin
//#UC START# *52B977E30154_52B1DD5901CE_impl*
 Result := False;
 if Assigned(Para) then
 begin
  f_Text := Para.StrA[k2_tiText];
  l_Hyperlink := Para.rAtomEx([k2_tiSegments, k2_tiChildren, k2_tiHandle, Ord(ev_slHyperlinks), k2_tiChildren, k2_tiByIndex, 0]);
  if l_Hyperlink.IsValid then
  begin
   Result := l_Hyperlink.ChildrenCount > 0;
   Assert(Result, '������ ������.');
   if Result then
   begin
    l_Address := l_Hyperlink.Child[0];
    f_Doc := l_Address.IntA[k2_tiDocID];
    f_Sub := l_Address.IntA[k2_tiSubID];
   end;
  end;//l_Hyperlink.IsValid
 end;//Assigned(Para)
//#UC END# *52B977E30154_52B1DD5901CE_impl*
end;//TnsBaseSearchPromptRoot.IsLinkOnDocument
{$IfEnd} // Defined(Nemesis)

procedure TnsBaseSearchPromptRoot.Cleanup;
 {* ������� ������� ����� �������. }
//#UC START# *479731C50290_52B1DD5901CE_var*
//#UC END# *479731C50290_52B1DD5901CE_var*
begin
//#UC START# *479731C50290_52B1DD5901CE_impl*
 FreeAndNil(f_Para);
 inherited;
//#UC END# *479731C50290_52B1DD5901CE_impl*
end;//TnsBaseSearchPromptRoot.Cleanup

function TnsBaseSearchPromptRoot.COMQueryInterface(const IID: Tl3GUID;
 out Obj): Tl3HResult;
 {* ���������� ������� ���������� }
//#UC START# *4A60B23E00C3_52B1DD5901CE_var*
//#UC END# *4A60B23E00C3_52B1DD5901CE_var*
begin
//#UC START# *4A60B23E00C3_52B1DD5901CE_impl*
 if IID.EQ(Il3NodePainter) then
 begin
  Result.SetOk;
  Il3NodePainter(Obj) := TevNodePainter.Make(Para);
 end//IID.EQ(Il3NodePainter)
 else
  Result := inherited COMQueryInterface(IID, Obj);
//#UC END# *4A60B23E00C3_52B1DD5901CE_impl*
end;//TnsBaseSearchPromptRoot.COMQueryInterface

constructor TnsBaseSearchPromptTreeBase.Create; { can raise EPromptTreeNotFound }
//#UC START# *4906D20B0185_4906D1790319_var*
var
 l_Node : INodeBase;
//#UC END# *4906D20B0185_4906D1790319_var*
begin
//#UC START# *4906D20B0185_4906D1790319_impl*
 l_Node := ReAqurieUnfilteredRoot;
 if Assigned(l_Node) then
  inherited Create(l_Node, False)
 else
  raise EPromptTreeNotFound.Create('');
//#UC END# *4906D20B0185_4906D1790319_impl*
end;//TnsBaseSearchPromptTreeBase.Create

class function TnsBaseSearchPromptTreeBase.Make: Il3SimpleTree;
 {* ������ ������ ��������� }
//#UC START# *4906D21E035B_4906D1790319_var*
var
 l_Tree        : TnsBaseSearchPromptTreeBase;
 l_TreeFilters : InsBaseSearchPromptFilters;
 l_Current     : Integer;
//#UC END# *4906D21E035B_4906D1790319_var*
begin
//#UC START# *4906D21E035B_4906D1790319_impl*
 try
  l_Tree := Create;
  try
   Result := l_Tree;
   if Supports(l_Tree.CloneFilters, InsBaseSearchPromptFilters, l_TreeFilters) then
    Result := l_Tree.MakeFiltered(l_TreeFilters.SetLeaf(TnsCutToLeafFilter.Make(c_CutCount)),
                           nil,
                           l_Current,
                           True);
  finally;
   FreeAndNil(l_Tree);
  end;//try..finally
 except
  on EPromptTreeNotFound do
   Result := nil;
 end;//try..except
//#UC END# *4906D21E035B_4906D1790319_impl*
end;//TnsBaseSearchPromptTreeBase.Make

function TnsBaseSearchPromptTreeBase.ReAqurieUnfilteredRoot: INodeBase;
//#UC START# *48FF64F60078_4906D1790319_var*
//#UC END# *48FF64F60078_4906D1790319_var*
begin
//#UC START# *48FF64F60078_4906D1790319_impl*
 try
  Result := DefDataAdapter.NativeAdapter.MakeNodeBase(nsAStr(AT_VARIANTS));
 except
  on ECanNotFindData do
   Result := nil;
 end;//try..except
//#UC END# *48FF64F60078_4906D1790319_impl*
end;//TnsBaseSearchPromptTreeBase.ReAqurieUnfilteredRoot

function TnsBaseSearchPromptTreeBase.RootNodeClass: RnsINodeWrap;
 {* ���������� ����� ������� ��� Root }
//#UC START# *48FEE3640227_4906D1790319_var*
//#UC END# *48FEE3640227_4906D1790319_var*
begin
//#UC START# *48FEE3640227_4906D1790319_impl*
 Result := TnsBaseSearchPromptRoot;
//#UC END# *48FEE3640227_4906D1790319_impl*
end;//TnsBaseSearchPromptTreeBase.RootNodeClass

function TnsBaseSearchPromptTreeBase.MakeFilters: Il3TreeFilters;
//#UC START# *48FF4C25031E_4906D1790319_var*
//#UC END# *48FF4C25031E_4906D1790319_var*
begin
//#UC START# *48FF4C25031E_4906D1790319_impl*
 Result := TnsBaseSearchPromptFilters.Make;
//#UC END# *48FF4C25031E_4906D1790319_impl*
end;//TnsBaseSearchPromptTreeBase.MakeFilters

procedure TnsBaseSearchPromptTreeBase.FillFilters(const aFilters: Il3TreeFilters;
 const anAdapterFilters: InsAdapterFilters);
//#UC START# *48FF520E03A0_4906D1790319_var*
var
 l_Filters: InsBaseSearchPromptFilters;
 l_Node: INodeBase;
//#UC END# *48FF520E03A0_4906D1790319_var*
begin
//#UC START# *48FF520E03A0_4906D1790319_impl*
 inherited FillFilters(aFilters, anAdapterFilters);
 if Supports(aFilters, InsBaseSearchPromptFilters, l_Filters) then
 begin
  if Assigned(l_Filters.Leaf) and (l_Filters.Leaf.LeafCount > 0) then
   anAdapterFilters.CutToLeaf.SetLeafCount(l_Filters.Leaf.LeafCount);
  if Assigned(l_Filters.ForDoc) then
   anAdapterFilters.MakePromptsTreeFilter(l_Filters.ForDoc.InternalDocNumber);
 end;//Supports(aFilters, InsBaseSearchPromptFilters, l_Filters)
//#UC END# *48FF520E03A0_4906D1790319_impl*
end;//TnsBaseSearchPromptTreeBase.FillFilters

function TnsBaseSearchPromptTreeBase.MakeContextFilterParams: Il3ContextFilterParams;
//#UC START# *48FF52670038_4906D1790319_var*
//#UC END# *48FF52670038_4906D1790319_var*
begin
//#UC START# *48FF52670038_4906D1790319_impl*
 Result := TnsPromptContextFilterParams.Make;
//#UC END# *48FF52670038_4906D1790319_impl*
end;//TnsBaseSearchPromptTreeBase.MakeContextFilterParams
{$IfEnd} // NOT Defined(Admin) AND NOT Defined(Monitorings)

end.
