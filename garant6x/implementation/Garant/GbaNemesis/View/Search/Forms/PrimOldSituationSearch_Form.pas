unit PrimOldSituationSearch_Form;
 {* ����� �� �������� }

// ������: "w:\garant6x\implementation\Garant\GbaNemesis\View\Search\Forms\PrimOldSituationSearch_Form.pas"
// ���������: "VCMContainer"
// ������� ������: "PrimOldSituationSearch" MUID: (4AE8831A02A5)
// ��� ����: "TPrimOldSituationSearchForm"

{$Include w:\garant6x\implementation\Garant\nsDefine.inc}

interface

{$If NOT Defined(Admin) AND NOT Defined(Monitorings)}
uses
 l3IntfUses
 {$If NOT Defined(NoVCM)}
 , vcmContainerForm
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , OfficeLike_Usual_Controls
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , OfficeLike_Text_Controls
 {$IfEnd} // NOT Defined(NoVCM)
 , SearchLite_Strange_Controls
 , nsQueryInterfaces
 , vtPanel
 , SearchUnit
 {$If Defined(Nemesis)}
 , nscContextFilter
 {$IfEnd} // Defined(Nemesis)
 , vtProportionalPanel
 , vtSizeablePanel
 {$If NOT Defined(NoVCL)}
 , Controls
 {$IfEnd} // NOT Defined(NoVCL)
 , Messages
 {$If Defined(Nemesis)}
 , nscNewInterfaces
 {$IfEnd} // Defined(Nemesis)
 , l3TreeInterfaces
 {$If NOT Defined(NoVCM)}
 , vcmInterfaces
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , vcmExternalInterfaces
 {$IfEnd} // NOT Defined(NoVCM)
;

const
 CM_AFTER_INIT = WM_USER + 201;

type
 TPrimOldSituationSearchForm = {abstract} class({$If NOT Defined(NoVCM)}
 TvcmContainerForm
 {$IfEnd} // NOT Defined(NoVCM)
 )
  {* ����� �� �������� }
  private
   f_BackgroundPanel: TvtPanel;
   f_ContextFilter: TnscContextFilter;
   f_InnerBackgroundPanel: TvtProportionalPanel;
   f_BotomPanel: TvtSizeablePanel;
   f_ParentZone: TvtPanel;
   f_ZoneContainer: TvtProportionalPanel;
   f_ChildZone: TvtPanel;
   f_MainZone: TvtSizeablePanel;
  protected
   f_FormState: InsQueryFormState;
  private
   procedure ContextFilterChange(Sender: TObject);
   procedure ContextFilterWrongContext(Sender: TObject);
   procedure AfterInit(var Message: TMessage); message CM_AFTER_INIT;
  protected
   function FillQuery: IQuery;
   procedure Cleanup; override;
    {* ������� ������� ����� �������. }
   procedure InitFields; override;
   {$If NOT Defined(NoVCM)}
   function DoSaveState(out theState: IvcmBase;
    aStateType: TvcmStateType;
    aForClone: Boolean): Boolean; override;
    {* ��������� ��������� �����. ��� ���������� � �������� }
   {$IfEnd} // NOT Defined(NoVCM)
   {$If NOT Defined(NoVCM)}
   function DoLoadState(const aState: IvcmBase;
    aStateType: TvcmStateType;
    aClone: Boolean): Boolean; override;
    {* ��������� ��������� �����. ��� ���������� � �������� }
   {$IfEnd} // NOT Defined(NoVCM)
   {$If NOT Defined(NoVCM)}
   procedure InitControls; override;
    {* ��������� ������������� ���������. ��� ���������� � �������� }
   {$IfEnd} // NOT Defined(NoVCM)
   {$If NOT Defined(NoVCM)}
   procedure FormInsertedIntoContainer; override;
   {$IfEnd} // NOT Defined(NoVCM)
   procedure ClearFields; override;
   {$If NOT Defined(NoVCM)}
   procedure InitEntities; override;
    {* �������������� �������� �� �� dfm.
             ����� ��� ���������� ��������� ��� �������� VCM �� ������ }
   {$IfEnd} // NOT Defined(NoVCM)
   {$If NOT Defined(NoVCM)}
   procedure MakeControls; override;
   {$IfEnd} // NOT Defined(NoVCM)
  public
   function SearchParameters_IsQueryEmpty_Execute: Boolean;
   procedure SearchParameters_IsQueryEmpty(const aParams: IvcmExecuteParams);
   function SearchParameters_GetQuery_Execute(aIgnoreError: Boolean = False): TnsQueryInfo;
   procedure SearchParameters_GetQuery(const aParams: IvcmExecuteParams);
   function SearchParameters_IsQuerySaved_Execute: Boolean;
   procedure SearchParameters_IsQuerySaved(const aParams: IvcmExecuteParams);
   procedure SearchParameters_SetQuery_Execute(const aQuery: IQuery);
   procedure SearchParameters_SetQuery(const aParams: IvcmExecuteParams);
   procedure ContextParams_ContextChanged_Execute(const aContextState: InscContextFilterState;
    const aContextTarget: Il3ContextFilterTarget);
   procedure ContextParams_ContextChanged(const aParams: IvcmExecuteParams);
   procedure SearchParameters_ClearQuery_Execute;
   procedure SearchParameters_ClearQuery(const aParams: IvcmExecuteParams);
  public
   property BackgroundPanel: TvtPanel
    read f_BackgroundPanel;
   property ContextFilter: TnscContextFilter
    read f_ContextFilter;
   property InnerBackgroundPanel: TvtProportionalPanel
    read f_InnerBackgroundPanel;
   property BotomPanel: TvtSizeablePanel
    read f_BotomPanel;
   property ParentZone: TvtPanel
    read f_ParentZone;
   property ZoneContainer: TvtProportionalPanel
    read f_ZoneContainer;
   property ChildZone: TvtPanel
    read f_ChildZone;
   property MainZone: TvtSizeablePanel
    read f_MainZone;
 end;//TPrimOldSituationSearchForm
{$IfEnd} // NOT Defined(Admin) AND NOT Defined(Monitorings)

implementation

{$If NOT Defined(Admin) AND NOT Defined(Monitorings)}
uses
 l3ImplUses
 {$If NOT Defined(NoVCM)}
 , vcmBase
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCL)}
 , Forms
 {$IfEnd} // NOT Defined(NoVCL)
 , SysUtils
 , Windows
 {$If NOT Defined(NoVCM)}
 , StdRes
 {$IfEnd} // NOT Defined(NoVCM)
 , nsUtils
 , DataAdapter
 , nsQuery
 , l3InterfacesMisc
 , nsQueryUtils
 {$If NOT Defined(NoScripts)}
 , TtfwClassRef_Proxy
 {$IfEnd} // NOT Defined(NoScripts)
 , PrimOldSituationSearch_cutOldKeyWord_UserType
 //#UC START# *4AE8831A02A5impl_uses*
 , vcmEntityForm
 , l3Base
 //#UC END# *4AE8831A02A5impl_uses*
;

{$If NOT Defined(NoVCM)}
function TPrimOldSituationSearchForm.FillQuery: IQuery;
//#UC START# *52442A050274_4AE8831A02A5_var*
//#UC END# *52442A050274_4AE8831A02A5_var*
begin
//#UC START# *52442A050274_4AE8831A02A5_impl*
 if (f_FormState.Query <> nil) then
  Result := f_FormState.Query
 else
 begin
  f_FormState.Query := DefDataAdapter.CreateEmptyQuery(QT_KEYWORD);
  Result := f_FormState.Query;
 end;//f_FormState.Query <> nil

 // ��������� ��������� �������� � Query
 if (Result <> nil) then
  Op_AttributeTree_SaveToQuery.Call(Aggregate, Result);
//#UC END# *52442A050274_4AE8831A02A5_impl*
end;//TPrimOldSituationSearchForm.FillQuery

procedure TPrimOldSituationSearchForm.ContextFilterChange(Sender: TObject);
//#UC START# *5245624602AE_4AE8831A02A5_var*
//#UC END# *5245624602AE_4AE8831A02A5_var*
begin
//#UC START# *5245624602AE_4AE8831A02A5_impl*
 Op_Context_SetContext.Call(Aggregate, ContextFilter.MakeState);
//#UC END# *5245624602AE_4AE8831A02A5_impl*
end;//TPrimOldSituationSearchForm.ContextFilterChange

procedure TPrimOldSituationSearchForm.ContextFilterWrongContext(Sender: TObject);
//#UC START# *524562520333_4AE8831A02A5_var*
//#UC END# *524562520333_4AE8831A02A5_var*
begin
//#UC START# *524562520333_4AE8831A02A5_impl*
 nsBeepWrongContext;
//#UC END# *524562520333_4AE8831A02A5_impl*
end;//TPrimOldSituationSearchForm.ContextFilterWrongContext

procedure TPrimOldSituationSearchForm.AfterInit(var Message: TMessage);
//#UC START# *524565FD004E_4AE8831A02A5_var*
var
 l_C : TControl;  
//#UC END# *524565FD004E_4AE8831A02A5_var*
begin
//#UC START# *524565FD004E_4AE8831A02A5_impl*
 if (MainZone.ControlCount > 0) then
 begin
  l_C := MainZone.Controls[0];
  if (l_C is TvcmEntityForm) then
   if TvcmEntityForm(l_C).CanFocus then
   // - http://mdp.garant.ru/pages/viewpage.action?pageId=271749118
   // - http://mdp.garant.ru/pages/viewpage.action?pageId=271749118&focusedCommentId=274468233#comment-274468233
    TvcmEntityForm(l_C).SetFocus;
 end;//MainZone.ControlCount > 0
//#UC END# *524565FD004E_4AE8831A02A5_impl*
end;//TPrimOldSituationSearchForm.AfterInit

function TPrimOldSituationSearchForm.SearchParameters_IsQueryEmpty_Execute: Boolean;
//#UC START# *4AE879D00143_4AE8831A02A5exec_var*
//#UC END# *4AE879D00143_4AE8831A02A5exec_var*
begin
//#UC START# *4AE879D00143_4AE8831A02A5exec_impl*
 Result := false;
//#UC END# *4AE879D00143_4AE8831A02A5exec_impl*
end;//TPrimOldSituationSearchForm.SearchParameters_IsQueryEmpty_Execute

procedure TPrimOldSituationSearchForm.SearchParameters_IsQueryEmpty(const aParams: IvcmExecuteParams);
begin
 with ISearchParameters_IsQueryEmpty_Params(aParams.Data) do
  ResultValue := Self.SearchParameters_IsQueryEmpty_Execute;
end;//TPrimOldSituationSearchForm.SearchParameters_IsQueryEmpty

function TPrimOldSituationSearchForm.SearchParameters_GetQuery_Execute(aIgnoreError: Boolean = False): TnsQueryInfo;
//#UC START# *4AE884E803AA_4AE8831A02A5exec_var*
//#UC END# *4AE884E803AA_4AE8831A02A5exec_var*
begin
//#UC START# *4AE884E803AA_4AE8831A02A5exec_impl*
 l3FillChar(Result, SizeOf(Result));
 if (f_FormState.Query <> nil) then
  f_FormState.Query.Clear;
 Result.rQuery := FillQuery;
 if (f_FormState.Filter <> nil) then
  Result.rFilter := f_FormState.Filter
 else
  Result.rAskFilters := true; 
//#UC END# *4AE884E803AA_4AE8831A02A5exec_impl*
end;//TPrimOldSituationSearchForm.SearchParameters_GetQuery_Execute

procedure TPrimOldSituationSearchForm.SearchParameters_GetQuery(const aParams: IvcmExecuteParams);
begin
 with ISearchParameters_GetQuery_Params(aParams.Data) do
  ResultValue := Self.SearchParameters_GetQuery_Execute(IgnoreError);
end;//TPrimOldSituationSearchForm.SearchParameters_GetQuery

function TPrimOldSituationSearchForm.SearchParameters_IsQuerySaved_Execute: Boolean;
//#UC START# *4AE8A577027D_4AE8831A02A5exec_var*
//#UC END# *4AE8A577027D_4AE8831A02A5exec_var*
begin
//#UC START# *4AE8A577027D_4AE8831A02A5exec_impl*
 Result := nsIsQuerySaved(f_FormState.Query);
//#UC END# *4AE8A577027D_4AE8831A02A5exec_impl*
end;//TPrimOldSituationSearchForm.SearchParameters_IsQuerySaved_Execute

procedure TPrimOldSituationSearchForm.SearchParameters_IsQuerySaved(const aParams: IvcmExecuteParams);
begin
 with ISearchParameters_IsQuerySaved_Params(aParams.Data) do
  ResultValue := Self.SearchParameters_IsQuerySaved_Execute;
end;//TPrimOldSituationSearchForm.SearchParameters_IsQuerySaved

procedure TPrimOldSituationSearchForm.SearchParameters_SetQuery_Execute(const aQuery: IQuery);
//#UC START# *4AEF213001F0_4AE8831A02A5exec_var*
//#UC END# *4AEF213001F0_4AE8831A02A5exec_var*
begin
//#UC START# *4AEF213001F0_4AE8831A02A5exec_impl*
 f_FormState.Query := nil;

 // ������� ������� ��������� ��������
 Op_AttributeTree_DropAllLogicSelection.Call(Aggregate, true, true);

 if (aQuery <> nil) then
 begin
  f_FormState.Query := aQuery;
  op_AttributeTree_LoadQuery.Call(Aggregate, f_FormState.Query);
 end;//aQuery <> nil
//#UC END# *4AEF213001F0_4AE8831A02A5exec_impl*
end;//TPrimOldSituationSearchForm.SearchParameters_SetQuery_Execute

procedure TPrimOldSituationSearchForm.SearchParameters_SetQuery(const aParams: IvcmExecuteParams);
begin
 with ISearchParameters_SetQuery_Params(aParams.Data) do
  Self.SearchParameters_SetQuery_Execute(Query);
end;//TPrimOldSituationSearchForm.SearchParameters_SetQuery

procedure TPrimOldSituationSearchForm.ContextParams_ContextChanged_Execute(const aContextState: InscContextFilterState;
 const aContextTarget: Il3ContextFilterTarget);
//#UC START# *4AF4008101F4_4AE8831A02A5exec_var*
//#UC END# *4AF4008101F4_4AE8831A02A5exec_var*
begin
//#UC START# *4AF4008101F4_4AE8831A02A5exec_impl*
 ContextFilter.AssignState(aContextState);
 Assert(Assigned(aContextTarget));
 ContextFilter.UpdateIsContextWrong(aContextTarget);
//#UC END# *4AF4008101F4_4AE8831A02A5exec_impl*
end;//TPrimOldSituationSearchForm.ContextParams_ContextChanged_Execute

procedure TPrimOldSituationSearchForm.ContextParams_ContextChanged(const aParams: IvcmExecuteParams);
begin
 with IContextParams_ContextChanged_Params(aParams.Data) do
  Self.ContextParams_ContextChanged_Execute(ContextState, ContextTarget);
end;//TPrimOldSituationSearchForm.ContextParams_ContextChanged

procedure TPrimOldSituationSearchForm.SearchParameters_ClearQuery_Execute;
//#UC START# *4AF92B09017F_4AE8831A02A5exec_var*
//#UC END# *4AF92B09017F_4AE8831A02A5exec_var*
begin
//#UC START# *4AF92B09017F_4AE8831A02A5exec_impl*
 Op_AttributeTree_DropAllLogicSelection.Call(Aggregate, true, true);
 // ������� ���� �������
 f_FormState.Filter := nil;
//#UC END# *4AF92B09017F_4AE8831A02A5exec_impl*
end;//TPrimOldSituationSearchForm.SearchParameters_ClearQuery_Execute

procedure TPrimOldSituationSearchForm.SearchParameters_ClearQuery(const aParams: IvcmExecuteParams);
begin
 Self.SearchParameters_ClearQuery_Execute;
end;//TPrimOldSituationSearchForm.SearchParameters_ClearQuery

procedure TPrimOldSituationSearchForm.Cleanup;
 {* ������� ������� ����� �������. }
//#UC START# *479731C50290_4AE8831A02A5_var*
//#UC END# *479731C50290_4AE8831A02A5_var*
begin
//#UC START# *479731C50290_4AE8831A02A5_impl*
 f_FormState := nil;
 inherited;
//#UC END# *479731C50290_4AE8831A02A5_impl*
end;//TPrimOldSituationSearchForm.Cleanup

procedure TPrimOldSituationSearchForm.InitFields;
//#UC START# *47A042E100E2_4AE8831A02A5_var*
var
 l_FormState : TnsQueryFormState;
//#UC END# *47A042E100E2_4AE8831A02A5_var*
begin
//#UC START# *47A042E100E2_4AE8831A02A5_impl*
 inherited;
 ContextFilter.Images := dmStdRes.SmallImageList;
 l_FormState := TnsQueryFormState.Create;
 try
  Supports(l_FormState, InsQueryFormState, f_FormState);
 finally
  vcmFree(l_FormState);
 end;
//#UC END# *47A042E100E2_4AE8831A02A5_impl*
end;//TPrimOldSituationSearchForm.InitFields

function TPrimOldSituationSearchForm.DoSaveState(out theState: IvcmBase;
 aStateType: TvcmStateType;
 aForClone: Boolean): Boolean;
 {* ��������� ��������� �����. ��� ���������� � �������� }
//#UC START# *49806ED503D5_4AE8831A02A5_var*
//#UC END# *49806ED503D5_4AE8831A02A5_var*
begin
//#UC START# *49806ED503D5_4AE8831A02A5_impl*
 if aStateType = vcm_stContent then
  theState := f_FormState as IvcmBase;
//#UC END# *49806ED503D5_4AE8831A02A5_impl*
end;//TPrimOldSituationSearchForm.DoSaveState

function TPrimOldSituationSearchForm.DoLoadState(const aState: IvcmBase;
 aStateType: TvcmStateType;
 aClone: Boolean): Boolean;
 {* ��������� ��������� �����. ��� ���������� � �������� }
//#UC START# *49807428008C_4AE8831A02A5_var*
//#UC END# *49807428008C_4AE8831A02A5_var*
begin
//#UC START# *49807428008C_4AE8831A02A5_impl*
 if aStateType = vcm_stContent then
  if not l3BQueryInterface(aState, InsQueryFormState, f_FormState) then
   Assert(False);
//#UC END# *49807428008C_4AE8831A02A5_impl*
end;//TPrimOldSituationSearchForm.DoLoadState

procedure TPrimOldSituationSearchForm.InitControls;
 {* ��������� ������������� ���������. ��� ���������� � �������� }
//#UC START# *4A8E8F2E0195_4AE8831A02A5_var*
//#UC END# *4A8E8F2E0195_4AE8831A02A5_var*
begin
//#UC START# *4A8E8F2E0195_4AE8831A02A5_impl*
 ActiveControl := MainZone;
 Scaled := False;
 with BackgroundPanel do
 begin
  Align := alClient;
  BevelOuter := bvNone;
  TabOrder := 0;
 end;
 with ContextFilter do
 begin
  ImageIndex := 77;
  OnChange := ContextFilterChange;
  OnWrongContext := ContextFilterWrongContext;
 end;
 with InnerBackgroundPanel do
 begin
  TabOrder := 1;
 end;
 with BotomPanel do
 begin
  ResizeAreaWidth := 5;
  SizeableSides := [szTop];
  SplitterBevel := bvRaised;
  Align := alBottom;
  BevelOuter := bvNone;
  TabOrder := 0;
 end;
 with ParentZone do
 begin
  Align := alClient;
  BevelOuter := bvNone;
  TabOrder := 0;
 end;
 with ZoneContainer do
 begin
  BevelOuter := bvNone;
  TabOrder := 1;
 end;
 with ChildZone do
 begin
  Align := alClient;
  BevelOuter := bvNone;
  TabOrder := 1;
 end;
 with MainZone do
 begin
  ResizeAreaWidth := 5;
  SizeableSides := [szRight];
  SplitterBevel := bvRaised;
  Align := alLeft;
  BevelOuter := bvNone;
  TabOrder := 0;
 end;
//#UC END# *4A8E8F2E0195_4AE8831A02A5_impl*
end;//TPrimOldSituationSearchForm.InitControls

procedure TPrimOldSituationSearchForm.FormInsertedIntoContainer;
//#UC START# *4F7C65380244_4AE8831A02A5_var*
//#UC END# *4F7C65380244_4AE8831A02A5_var*
begin
//#UC START# *4F7C65380244_4AE8831A02A5_impl*
 // http://mdp.garant.ru/pages/viewpage.action?pageId=271749118&focusedCommentId=290954110&#comment-290954110
 PostMessage(Handle, CM_AFTER_INIT, 0, 0);
//#UC END# *4F7C65380244_4AE8831A02A5_impl*
end;//TPrimOldSituationSearchForm.FormInsertedIntoContainer

procedure TPrimOldSituationSearchForm.ClearFields;
begin
 f_FormState := nil;
 inherited;
end;//TPrimOldSituationSearchForm.ClearFields

procedure TPrimOldSituationSearchForm.InitEntities;
 {* �������������� �������� �� �� dfm.
             ����� ��� ���������� ��������� ��� �������� VCM �� ������ }
begin
 inherited;
 with Entities.Entities do
 begin
  PublishFormEntity(en_Edit, nil);
  PublishFormEntity(en_SearchParameters, nil);
  PublishFormEntity(en_ContextParams, nil);
  PublishOpWithResult(en_SearchParameters, op_IsQueryEmpty, SearchParameters_IsQueryEmpty, nil, nil);
  PublishOpWithResult(en_SearchParameters, op_GetQuery, SearchParameters_GetQuery, nil, nil);
  PublishOpWithResult(en_SearchParameters, op_IsQuerySaved, SearchParameters_IsQuerySaved, nil, nil);
  PublishOpWithResult(en_SearchParameters, op_SetQuery, SearchParameters_SetQuery, nil, nil);
  PublishOpWithResult(en_ContextParams, op_ContextChanged, ContextParams_ContextChanged, nil, nil);
  PublishOpWithResult(en_SearchParameters, op_ClearQuery, SearchParameters_ClearQuery, nil, nil);
 end;//with Entities.Entities
end;//TPrimOldSituationSearchForm.InitEntities

procedure TPrimOldSituationSearchForm.MakeControls;
begin
 inherited;
 with AddUsertype(cutOldKeyWordName,
  str_cutOldKeyWordCaption,
  str_cutOldKeyWordSettingsCaption,
  False,
  -1,
  -1,
  '',
  nil,
  nil,
  nil,
  vcm_ccNone) do
 begin
 end;//with AddUsertype(cutOldKeyWordName
 f_BackgroundPanel := TvtPanel.Create(Self);
 f_BackgroundPanel.Name := 'BackgroundPanel';
 f_BackgroundPanel.Parent := Self;
 f_ContextFilter := TnscContextFilter.Create(Self);
 f_ContextFilter.Name := 'ContextFilter';
 f_ContextFilter.Parent := BackgroundPanel;
 f_InnerBackgroundPanel := TvtProportionalPanel.Create(Self);
 f_InnerBackgroundPanel.Name := 'InnerBackgroundPanel';
 f_InnerBackgroundPanel.Parent := BackgroundPanel;
 f_BotomPanel := TvtSizeablePanel.Create(Self);
 f_BotomPanel.Name := 'BotomPanel';
 f_BotomPanel.Parent := InnerBackgroundPanel;
 f_ParentZone := TvtPanel.Create(Self);
 f_ParentZone.Name := 'ParentZone';
 f_ParentZone.Parent := BotomPanel;
 with DefineZone(vcm_ztParent, ParentZone) do
 begin
  FormStyle.Toolbars.Bottom.MergeWithContainer := vcm_bTrue;
 end;//with DefineZone(vcm_ztParent
 f_ZoneContainer := TvtProportionalPanel.Create(Self);
 f_ZoneContainer.Name := 'ZoneContainer';
 f_ZoneContainer.Parent := InnerBackgroundPanel;
 f_ChildZone := TvtPanel.Create(Self);
 f_ChildZone.Name := 'ChildZone';
 f_ChildZone.Parent := ZoneContainer;
 with DefineZone(vcm_ztChild, ChildZone) do
 begin
 end;//with DefineZone(vcm_ztChild
 f_MainZone := TvtSizeablePanel.Create(Self);
 f_MainZone.Name := 'MainZone';
 f_MainZone.Parent := ZoneContainer;
 with DefineZone(vcm_ztMain, MainZone) do
 begin
 end;//with DefineZone(vcm_ztMain
end;//TPrimOldSituationSearchForm.MakeControls

initialization
{$If NOT Defined(NoScripts)}
 TtfwClassRef.Register(TPrimOldSituationSearchForm);
 {* ����������� PrimOldSituationSearch }
{$IfEnd} // NOT Defined(NoScripts)
{$IfEnd} // NOT Defined(NoVCM)

{$IfEnd} // NOT Defined(Admin) AND NOT Defined(Monitorings)
end.
