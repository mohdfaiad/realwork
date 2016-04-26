unit PrimMainMenuWithProfNews_Form;

// ������: "w:\garant6x\implementation\Garant\GbaNemesis\View\MainMenu\Forms\PrimMainMenuWithProfNews_Form.pas"
// ���������: "VCMContainer"
// ������� ������: "PrimMainMenuWithProfNews" MUID: (56FA889202B4)
// ��� ����: "TPrimMainMenuWithProfNewsForm"

{$Include w:\garant6x\implementation\Garant\nsDefine.inc}

interface

{$If NOT Defined(Admin) AND NOT Defined(Monitorings)}
uses
 l3IntfUses
 , PrimLegalMainMenu_Form
 , BannerUnit
 , vtPanel
 {$If NOT Defined(NoVCL)}
 , ExtCtrls
 {$IfEnd} // NOT Defined(NoVCL)
 {$If NOT Defined(NoImageEn)}
 , imageenview
 {$IfEnd} // NOT Defined(NoImageEn)
 {$If Defined(Nemesis)}
 , nscTreeViewHotTruck
 {$IfEnd} // Defined(Nemesis)
 {$If Defined(Nemesis)}
 , nscComboLabel
 {$IfEnd} // Defined(Nemesis)
 , vtLabel
 {$If Defined(Nemesis)}
 , nscFocusLabel
 {$IfEnd} // Defined(Nemesis)
 {$If NOT Defined(NoImageEn)}
 , imageenio
 {$IfEnd} // NOT Defined(NoImageEn)
 {$If Defined(Nemesis)}
 , nscInterfaces
 {$IfEnd} // Defined(Nemesis)
 {$If NOT Defined(NoVCM)}
 , vcmInterfaces
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , vcmExternalInterfaces
 {$IfEnd} // NOT Defined(NoVCM)
;

type
 // BaseSearchZone

 _vcmChromeLikeTabCaptionProvider_Parent_ = TPrimLegalMainMenuForm;
 {$Include w:\common\components\gui\Garant\VCM\implementation\Visual\ChromeLike\vcmChromeLikeTabCaptionProvider.imp.pas}
 _vcmChromeLikeTabIconUpdater_Parent_ = _vcmChromeLikeTabCaptionProvider_;
 {$Include w:\common\components\gui\Garant\VCM\implementation\Visual\ChromeLike\vcmChromeLikeTabIconUpdater.imp.pas}
 TPrimMainMenuWithProfNewsForm = class(_vcmChromeLikeTabIconUpdater_)
  private
   f_Banner: IBanner;
   f_IsInited: Boolean;
   f_pnlLeft: TvtPanel;
    {* ���� ��� �������� pnlLeft }
   f_bvlLeftTop: TBevel;
    {* ���� ��� �������� bvlLeftTop }
   f_pnlLogo: TvtPanel;
    {* ���� ��� �������� pnlLogo }
   f_pbLogo: TPaintBox;
    {* ���� ��� �������� pbLogo }
   f_pnlBanner: TvtPanel;
    {* ���� ��� �������� pnlBanner }
   f_ieBanner: TImageEnView;
    {* ���� ��� �������� ieBanner }
   f_pnlFeedback: TvtPanel;
    {* ���� ��� �������� pnlFeedback }
   f_pbFeedback: TPaintBox;
    {* ���� ��� �������� pbFeedback }
   f_pnlOnlineResources: TvtPanel;
    {* ���� ��� �������� pnlOnlineResources }
   f_pbOnlineResources: TPaintBox;
    {* ���� ��� �������� pbOnlineResources }
   f_pnlWebVersion: TvtPanel;
    {* ���� ��� �������� pnlWebVersion }
   f_pbWebVersion: TPaintBox;
    {* ���� ��� �������� pbWebVersion }
   f_pnlClient: TvtPanel;
    {* ���� ��� �������� pnlClient }
   f_pnlNews: TvtPanel;
    {* ���� ��� �������� pnlNews }
   f_tvProfNews: TnscTreeViewHotTruck;
    {* ���� ��� �������� tvProfNews }
   f_lblProfNews: TnscComboLabel;
    {* ���� ��� �������� lblProfNews }
   f_lblLawNews: TvtStyledLabel;
    {* ���� ��� �������� lblLawNews }
   f_pnlBaseSearch: TvtPanel;
    {* ���� ��� �������� pnlBaseSearch }
   f_pnlBaseSearchZone: TvtPanel;
    {* ���� ��� �������� pnlBaseSearchZone }
   f_pnlSearches: TvtPanel;
    {* ���� ��� �������� pnlSearches }
   f_flAttributeSearch: TnscFocusLabel;
    {* ���� ��� �������� flAttributeSearch }
   f_flDictionSearch: TnscFocusLabel;
    {* ���� ��� �������� flDictionSearch }
   f_flPublishedSourceSearch: TnscFocusLabel;
    {* ���� ��� �������� flPublishedSourceSearch }
   f_flSituationSearch: TnscFocusLabel;
    {* ���� ��� �������� flSituationSearch }
   f_pnlTrees: TvtPanel;
    {* ���� ��� �������� pnlTrees }
   f_tvTaxes: TnscTreeViewHotTruck;
    {* ���� ��� �������� tvTaxes }
   f_lblReferences: TvtStyledLabel;
    {* ���� ��� �������� lblReferences }
   f_lblTaxes: TnscComboLabel;
    {* ���� ��� �������� lblTaxes }
   f_pnlLastOpenDocs: TvtPanel;
    {* ���� ��� �������� pnlLastOpenDocs }
   f_lblLastOpenDocs: TvtStyledLabel;
    {* ���� ��� �������� lblLastOpenDocs }
   f_bvlLeft: TBevel;
    {* ���� ��� �������� bvlLeft }
   f_bvlRight: TBevel;
    {* ���� ��� �������� bvlRight }
   f_ieIO: TImageEnIO;
    {* ���� ��� �������� ieIO }
  private
   procedure UpdateReferencesAndLawNewsCaptions;
   procedure UpdateSearchLabels;
   procedure SearchClick(Sender: TObject);
   procedure ArrangeControls;
   procedure PaintLogo(Sender: TObject);
   procedure PaintButton(Sender: TObject);
   procedure PaintBoxClick(Sender: TObject);
   procedure BannerClick(Sender: TObject);
   procedure LoadBanner;
   procedure lblTaxesChange(Sender: TObject);
   procedure lblProfNewsChange(Sender: TObject);
  protected
   function DoBuildGrid: InscArrangeGrid; override;
   procedure Cleanup; override;
    {* ������� ������� ����� �������. }
   procedure InitFields; override;
   procedure FinishDataUpdate; override;
   {$If NOT Defined(NoVCM)}
   procedure DoInit(aFromHistory: Boolean); override;
    {* ������������� �����. ��� ���������� � �������� }
   {$IfEnd} // NOT Defined(NoVCM)
   {$If NOT Defined(NoVCM)}
   function DoSaveState(out theState: IvcmBase;
    aStateType: TvcmStateType;
    aForClone: Boolean): Boolean; override;
    {* ��������� ��������� �����. ��� ���������� � �������� }
   {$IfEnd} // NOT Defined(NoVCM)
   {$If NOT Defined(NoVCM)}
   function DoLoadState(const aState: IvcmBase;
    aStateType: TvcmStateType): Boolean; override;
    {* ��������� ��������� �����. ��� ���������� � �������� }
   {$IfEnd} // NOT Defined(NoVCM)
   {$If NOT Defined(DesignTimeLibrary)}
   procedure DoStyleTableChanged; override;
   {$IfEnd} // NOT Defined(DesignTimeLibrary)
   {$If NOT Defined(NoVCM)}
   procedure InitControls; override;
    {* ��������� ������������� ���������. ��� ���������� � �������� }
   {$IfEnd} // NOT Defined(NoVCM)
   procedure LoadLastOpenDocs; override;
   procedure LoadTrees; override;
   function pm_GetContainerForBaseSearch: IvcmContainer; override;
   function NewSchool: Boolean; override;
    {* ����������, ��� �������� ���� ���� 2009 - [$164601183] }
   procedure pnlMainResize(aSender: TObject); override;
   {$If NOT Defined(NoVCM)}
   procedure SetControlsResources; override;
    {* ���������� ��������� ������� ��� ������������������� }
   {$IfEnd} // NOT Defined(NoVCM)
   {$If NOT Defined(NoVCL)}
   procedure Resize; override;
   {$IfEnd} // NOT Defined(NoVCL)
   procedure ClearFields; override;
   {$If NOT Defined(NoVCM)}
   function DoGetTabCaption: IvcmCString; override;
   {$IfEnd} // NOT Defined(NoVCM)
   {$If NOT Defined(NoVCM) AND NOT Defined(NoVGScene) AND NOT Defined(NoTabs)}
   function DoGetFormSetTabCaption: IvcmCString; override;
   {$IfEnd} // NOT Defined(NoVCM) AND NOT Defined(NoVGScene) AND NOT Defined(NoTabs)
   {$If NOT Defined(NoVCM) AND NOT Defined(NoVGScene) AND NOT Defined(NoTabs)}
   function DoGetTabImageIndex: Integer; override;
   {$IfEnd} // NOT Defined(NoVCM) AND NOT Defined(NoVGScene) AND NOT Defined(NoTabs)
  public
   property ieIO: TImageEnIO
    read f_ieIO;
 end;//TPrimMainMenuWithProfNewsForm
{$IfEnd} // NOT Defined(Admin) AND NOT Defined(Monitorings)

implementation

{$If NOT Defined(Admin) AND NOT Defined(Monitorings)}
uses
 l3ImplUses
 , l3StringIDEx
 , PrimMainMenuWithProfNews_utMainMenuWithProfNews_UserType
 {$If NOT Defined(NoVCM)}
 , OfficeLike_Tree_Controls
 {$IfEnd} // NOT Defined(NoVCM)
 , l3ProtoObject
 , afwInterfaces
 , Graphics
 , nsLastOpenDocTree
 , nsTypes
 , l3String
 , IOUnit
 , Classes
 {$If NOT Defined(NoImageEn)}
 , hyiedefs
 {$IfEnd} // NOT Defined(NoImageEn)
 , SysUtils
 , nsExternalObjectPrim
 , ExternalObjectUnit
 , BaseTypesUnit
 , DataAdapter
 {$If NOT Defined(NoImageEn)}
 , iemview
 {$IfEnd} // NOT Defined(NoImageEn)
 , nsConst
 , nsTabbedInterfaceTypes
 {$If NOT Defined(NoVCM)}
 , vcmBase
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCL)}
 , Forms
 {$IfEnd} // NOT Defined(NoVCL)
 {$If NOT Defined(NoVCL)}
 , Controls
 {$IfEnd} // NOT Defined(NoVCL)
 , DocumentRes
 , MainMenuNewRes
 {$If Defined(Nemesis)}
 , f1TextStyle_Const
 {$IfEnd} // Defined(Nemesis)
 , l3ControlsTypes
 , l3MinMax
 , nsUtils
 , StartUnit
 {$If NOT Defined(NoImageEn)}
 , hyieutils
 {$IfEnd} // NOT Defined(NoImageEn)
 , bsTypesNew
 , evdTypes
 , smSectionTree
 , smMainMenuTree2016
 , nsQueryInterfaces
 , MainMenuUnit
 , l3MessageID
 {$If NOT Defined(NoScripts)}
 , TtfwClassRef_Proxy
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoVCM) AND NOT Defined(NoVGScene) AND NOT Defined(NoTabs)}
 , vcmTabbedContainerFormDispatcher
 {$IfEnd} // NOT Defined(NoVCM) AND NOT Defined(NoVGScene) AND NOT Defined(NoTabs)
 , afwFacade
 {$If NOT Defined(DesignTimeLibrary)}
 , evStyleTableSpy
 {$IfEnd} // NOT Defined(DesignTimeLibrary)
;

type
 // ExcludeTree

 IMainMenuWithProfNewsFormState = interface(IvcmBase)
  ['{6CF72EBE-CFF7-439A-8F12-9B556D710E4B}']
  function Get_TaxesTreeItemIndex: Integer;
  function Get_ProfNewsTreeItemIndex: Integer;
  function Get_InnerState: IvcmBase;
  property TaxesTreeItemIndex: Integer
   read Get_TaxesTreeItemIndex;
  property ProfNewsTreeItemIndex: Integer
   read Get_ProfNewsTreeItemIndex;
  property InnerState: IvcmBase
   read Get_InnerState;
 end;//IMainMenuWithProfNewsFormState

 _afwApplicationDataUpdate_Parent_ = Tl3ProtoObject;
 {$Include w:\common\components\gui\Garant\AFW\implementation\afwApplicationDataUpdate.imp.pas}
 TMainMenuWithProfNewsFormState = class(_afwApplicationDataUpdate_, IMainMenuWithProfNewsFormState)
  private
   f_InnerState: IvcmBase;
   f_ProfNewsTreeItemIndex: Integer;
   f_TaxesTreeItemIndex: Integer;
  protected
   function Get_TaxesTreeItemIndex: Integer;
   function Get_ProfNewsTreeItemIndex: Integer;
   function Get_InnerState: IvcmBase;
   procedure FinishDataUpdate; override;
  public
   constructor Create(const anInnerState: IvcmBase;
    aProfNewsIndex: Integer;
    aTaxesTreeIndex: Integer); reintroduce;
   class function Make(const anInnerState: IvcmBase;
    aProfNewsIndex: Integer;
    aTaxesTreeIndex: Integer): IMainMenuWithProfNewsFormState; reintroduce;
 end;//TMainMenuWithProfNewsFormState

const
 {* ������������ ������ utMainMenuWithProfNewsLocalConstants }
 str_utMainMenuWithProfNewsCaption: Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'utMainMenuWithProfNewsCaption'; rValue : '�������� ����');
  {* ��������� ����������������� ���� "�������� ����" }

{$Include w:\common\components\gui\Garant\AFW\implementation\afwApplicationDataUpdate.imp.pas}

constructor TMainMenuWithProfNewsFormState.Create(const anInnerState: IvcmBase;
 aProfNewsIndex: Integer;
 aTaxesTreeIndex: Integer);
//#UC START# *5714AA3A022F_5714A94A0015_var*
//#UC END# *5714AA3A022F_5714A94A0015_var*
begin
//#UC START# *5714AA3A022F_5714A94A0015_impl*
 f_InnerState := anInnerState;
 f_ProfNewsTreeItemIndex := aProfNewsIndex;
 f_TaxesTreeItemIndex := aTaxesTreeIndex;
//#UC END# *5714AA3A022F_5714A94A0015_impl*
end;//TMainMenuWithProfNewsFormState.Create

class function TMainMenuWithProfNewsFormState.Make(const anInnerState: IvcmBase;
 aProfNewsIndex: Integer;
 aTaxesTreeIndex: Integer): IMainMenuWithProfNewsFormState;
var
 l_Inst : TMainMenuWithProfNewsFormState;
begin
 l_Inst := Create(anInnerState, aProfNewsIndex, aTaxesTreeIndex);
 try
  Result := l_Inst;
 finally
  l_Inst.Free;
 end;//try..finally
end;//TMainMenuWithProfNewsFormState.Make

function TMainMenuWithProfNewsFormState.Get_TaxesTreeItemIndex: Integer;
//#UC START# *5714A8C101F2_5714A94A0015get_var*
//#UC END# *5714A8C101F2_5714A94A0015get_var*
begin
//#UC START# *5714A8C101F2_5714A94A0015get_impl*
 Result := f_TaxesTreeItemIndex;
//#UC END# *5714A8C101F2_5714A94A0015get_impl*
end;//TMainMenuWithProfNewsFormState.Get_TaxesTreeItemIndex

function TMainMenuWithProfNewsFormState.Get_ProfNewsTreeItemIndex: Integer;
//#UC START# *5714A8DC0258_5714A94A0015get_var*
//#UC END# *5714A8DC0258_5714A94A0015get_var*
begin
//#UC START# *5714A8DC0258_5714A94A0015get_impl*
 Result := f_ProfNewsTreeItemIndex;
//#UC END# *5714A8DC0258_5714A94A0015get_impl*
end;//TMainMenuWithProfNewsFormState.Get_ProfNewsTreeItemIndex

function TMainMenuWithProfNewsFormState.Get_InnerState: IvcmBase;
//#UC START# *5714A9230017_5714A94A0015get_var*
//#UC END# *5714A9230017_5714A94A0015get_var*
begin
//#UC START# *5714A9230017_5714A94A0015get_impl*
 Result := f_InnerState;
//#UC END# *5714A9230017_5714A94A0015get_impl*
end;//TMainMenuWithProfNewsFormState.Get_InnerState

procedure TMainMenuWithProfNewsFormState.FinishDataUpdate;
//#UC START# *47EA4E9002C6_5714A94A0015_var*
//#UC END# *47EA4E9002C6_5714A94A0015_var*
begin
//#UC START# *47EA4E9002C6_5714A94A0015_impl*
 f_ProfNewsTreeItemIndex := 0;
 f_TaxesTreeItemIndex := 0;
//#UC END# *47EA4E9002C6_5714A94A0015_impl*
end;//TMainMenuWithProfNewsFormState.FinishDataUpdate

type _Instance_R_ = TPrimMainMenuWithProfNewsForm;

{$Include w:\common\components\gui\Garant\VCM\implementation\Visual\ChromeLike\vcmChromeLikeTabCaptionProvider.imp.pas}

{$Include w:\common\components\gui\Garant\VCM\implementation\Visual\ChromeLike\vcmChromeLikeTabIconUpdater.imp.pas}

procedure TPrimMainMenuWithProfNewsForm.UpdateReferencesAndLawNewsCaptions;
//#UC START# *56FBC4350226_56FA889202B4_var*
 function lp_Caption(aSection: TSectionType): String;
 var
  l_Sect: ISection;
  l_S: IString;
 begin
  DefDataAdapter.NativeAdapter.MakeMainMenu.GetSection(aSection, l_Sect);
  l_Sect.GetCaption(l_S);
  Result := l3Str(nsCStr(l_S));
 end;
//#UC END# *56FBC4350226_56FA889202B4_var*
begin
//#UC START# *56FBC4350226_56FA889202B4_impl*
 lblReferences.Caption := lp_Caption(ST_BUSINESS_REFERENCES);
 lblLawNews.Caption := lp_Caption(ST_CHANGES_IN_LEGISLATION);
//#UC END# *56FBC4350226_56FA889202B4_impl*
end;//TPrimMainMenuWithProfNewsForm.UpdateReferencesAndLawNewsCaptions

procedure TPrimMainMenuWithProfNewsForm.UpdateSearchLabels;
//#UC START# *56FCF6290256_56FA889202B4_var*
const
  c_SearchLabelDistance = 18;
//#UC END# *56FCF6290256_56FA889202B4_var*
begin
//#UC START# *56FCF6290256_56FA889202B4_impl*
 flSituationSearch.Visible := Assigned(DefDataAdapter) and DefDataAdapter.IsExists_KeyWordTag;
 with flPublishedSourceSearch do
 begin
  if flSituationSearch.Visible then
   Left := c_SearchLabelDistance + flSituationSearch.Left + flSituationSearch.Width
  else
   Left := c_SearchLabelDistance + flAttributeSearch.Left + flAttributeSearch.Width;
  Visible := Assigned(DefDataAdapter) and DefDataAdapter.IsExists_PublishSourceTag;
 end;//flPublishedSourceSearch
 with flDictionSearch do
 begin
  if flPublishedSourceSearch.Visible then
   Left := c_SearchLabelDistance + flPublishedSourceSearch.Left + flPublishedSourceSearch.Width
  else
   if flSituationSearch.Visible then
    Left := c_SearchLabelDistance + flSituationSearch.Left + flSituationSearch.Width
   else
    Left := c_SearchLabelDistance + flAttributeSearch.Left + flAttributeSearch.Width;
  Visible := Assigned(DefDataAdapter) and DefDataAdapter.IsExplanatoryExists;
 end;//flDictionSearch
//#UC END# *56FCF6290256_56FA889202B4_impl*
end;//TPrimMainMenuWithProfNewsForm.UpdateSearchLabels

procedure TPrimMainMenuWithProfNewsForm.SearchClick(Sender: TObject);
//#UC START# *56FD0A30011C_56FA889202B4_var*
//#UC END# *56FD0A30011C_56FA889202B4_var*
begin
//#UC START# *56FD0A30011C_56FA889202B4_impl*
 if (Sender = flAttributeSearch) then
  TdmStdRes.OpenQuery(lg_qtAttribute, nil, nil)
 else
 if (Sender = flSituationSearch) then
  TdmStdRes.OpenQuery(lg_qtKeyWord, nil, nil)
 else
 if (Sender = flPublishedSourceSearch) then
  TdmStdRes.OpenQuery(lg_qtPublishedSource, nil, nil)
 else
 if (Sender = flDictionSearch) then
  TdmStdRes.OpenDictionary(nil, NativeMainForm)
 else
  Assert(False);
//#UC END# *56FD0A30011C_56FA889202B4_impl*
end;//TPrimMainMenuWithProfNewsForm.SearchClick

procedure TPrimMainMenuWithProfNewsForm.ArrangeControls;
//#UC START# *56FE6DC90398_56FA889202B4_var*
const
 c_lblTop = 10;
 c_LeftIndent = 5;
 c_RightIndent = 10;
 c_TopIndent = 10;
 c_BottomIndent = 20;
//#UC END# *56FE6DC90398_56FA889202B4_var*
begin
//#UC START# *56FE6DC90398_56FA889202B4_impl*
 bvlLeft.Left := 0;
 pnlMain.Width := Max(850, ClientWidth);

 pnlClient.Left := pnlLeft.Left + pnlLeft.Width;
 pnlClient.Width := pnlMain.ClientWidth - pnlLeft.Width;
                      
 pnlNews.Top := 0;
 //////
 tvLawNews.MultiStrokeItem := False;
 if tvLawNews.CalcFullWidth > (pnlNews.ClientWidth div 3) - c_LeftIndent - c_RightIndent then
 begin
  tvLawNews.MultiStrokeItem := True;
  tvLawNews.Width := pnlNews.ClientWidth div 3;
 end else
  tvLawNews.Width := tvLawNews.CalcFullWidth + c_RightIndent;

 lblLawNews.Width := tvLawNews.Width;

 tvLawNews.Top := lblLawNews.Top + lblLawNews.Height + c_TopIndent;
 tvLawNews.Left := pnlNews.ClientWidth - c_RightIndent - tvLawNews.Width;
 tvLawNews.Height := tvLawNews.CalcFullHeight; 

 lblLawNews.Top := c_lblTop;
 lblLawNews.Left := tvLawNews.Left;
 //
 lblProfNews.Top := c_lblTop;
 lblProfNews.Left := c_LeftIndent;
 lblProfNews.Width := tvLawNews.Left - c_LeftIndent * 2 - c_RightIndent;
 tvProfNews.Left := c_LeftIndent;
 tvProfNews.Top := lblProfNews.Top + lblProfNews.Height + c_TopIndent;
 tvProfNews.Width := tvLawNews.Left - c_LeftIndent * 2 - c_RightIndent;
 tvProfNews.Height := tvProfNews.CalcFullHeight;
 pnlNews.ClientHeight := Max(tvProfNews.Top + tvProfNews.Height, tvLawNews.Top + tvLawNews.Height) + c_BottomIndent;
 //////
 pnlBaseSearch.Height := 110;
 pnlBaseSearchZone.Height := 100;
 pnlSearches.Height := 20;
 pnlSearches.BringToFront;
 pnlBaseSearch.Top := pnlNews.Height;
 //////
 pnlTrees.Top := pnlBaseSearch.Top + pnlBaseSearch.Height;

 lblReferences.Top := c_lblTop;
 lblReferences.Left := c_LeftIndent;
 lblReferences.Width := pnlTrees.ClientWidth div 2 - c_LeftIndent - c_RightIndent;
 tvReferences.Left := c_LeftIndent;
 tvReferences.Top := lblReferences.Top + lblReferences.Height + c_TopIndent;
 tvReferences.Width := pnlTrees.ClientWidth div 2 - c_LeftIndent - c_RightIndent;
 tvReferences.Height := tvReferences.CalcFullHeight;  

 lblTaxes.Top := c_lblTop;
 lblTaxes.Left := pnlTrees.ClientWidth div 2 + c_LeftIndent;
 lblTaxes.Width := pnlTrees.ClientWidth div 2 - c_LeftIndent - c_RightIndent;
 tvTaxes.Left := lblTaxes.Left;
 tvTaxes.Top := lblTaxes.Top + lblTaxes.Height + c_TopIndent;
 tvTaxes.Width := pnlTrees.ClientWidth div 2 - c_LeftIndent - c_RightIndent;
 tvTaxes.Height := tvTaxes.CalcFullHeight;
 pnlTrees.ClientHeight := Max(tvReferences.Top + tvReferences.Height, tvTaxes.Top + tvTaxes.Height) + c_BottomIndent;
 //////
 pnlLastOpenDocs.Top := pnlTrees.Top + pnlTrees.Height;

 lblLastOpenDocs.Top := c_lblTop;
 lblLastOpenDocs.Left := c_LeftIndent;
 lblLastOpenDocs.Width := pnlLastOpenDocs.ClientWidth - c_LeftIndent - c_RightIndent;
 tvLastOpenDocs.Left := c_LeftIndent;
 tvLastOpenDocs.Top := lblLastOpenDocs.Top + lblLastOpenDocs.Height + c_TopIndent;
 tvLastOpenDocs.Width := pnlLastOpenDocs.ClientWidth - c_LeftIndent - c_RightIndent;
 tvLastOpenDocs.Height := tvLastOpenDocs.CalcFullHeight;

 pnlLastOpenDocs.ClientHeight := tvLastOpenDocs.Top + tvLastOpenDocs.Height + c_BottomIndent;
 //////
 pnlMain.ClientHeight := Max(pnlWebVersion.Top + pnlWebVersion.Height, pnlLastOpenDocs.Top + pnlLastOpenDocs.Height);
 pnlClient.Height := pnlMain.ClientHeight;

 bvlLeftTop.Top := 0;
 bvlLeftTop.Height := pnlBaseSearch.Top + 10;
 with pnlLogo do
 begin
  Height := 60;
  Top := bvlLeftTop.Height;
 end;
 with pnlBanner do
 begin
  Height := ieBanner.Height + 40;
  Top := pnlLogo.Top + pnlLogo.Height;
 end;
 ieBanner.Top := 20;

 pnlFeedback.Top := pnlBanner.Top + pnlBanner.Height;
 pnlOnlineResources.Top := pnlFeedback.Top + pnlFeedback.Height;
 pnlWebVersion.Top := pnlOnlineResources.Top + pnlOnlineResources.Height;

 if pnlMain.Height > ClientHeight
  then VertScrollBar.Range := pnlMain.Height
  else VertScrollBar.Range := 0;
 if pnlMain.Width > ClientWidth
  then HorzScrollBar.Range := pnlMain.Width
  else HorzScrollBar.Range := 0;
//#UC END# *56FE6DC90398_56FA889202B4_impl*
end;//TPrimMainMenuWithProfNewsForm.ArrangeControls

procedure TPrimMainMenuWithProfNewsForm.PaintLogo(Sender: TObject);
//#UC START# *56FE8B7B023E_56FA889202B4_var*
//#UC END# *56FE8B7B023E_56FA889202B4_var*
begin
//#UC START# *56FE8B7B023E_56FA889202B4_impl*
 nsPaintImage(dmStdRes.ilLogo, pbLogo);
//#UC END# *56FE8B7B023E_56FA889202B4_impl*
end;//TPrimMainMenuWithProfNewsForm.PaintLogo

procedure TPrimMainMenuWithProfNewsForm.PaintButton(Sender: TObject);
//#UC START# *56FE8B9303D1_56FA889202B4_var*
//#UC END# *56FE8B9303D1_56FA889202B4_var*
begin
//#UC START# *56FE8B9303D1_56FA889202B4_impl*
 if (Sender = pbFeedback) then
 begin
  if (afw.Application.LocaleInfo.Language = afw_lngEnglish) then
   nsPaintImage(dmMainMenuNew.ilButtonsNew, pbFeedback, 0, True)
  else
   nsPaintImage(dmMainMenuNew.ilButtonsNew, pbFeedback, 3, True);
 end//Sender = pbFeedback
 else
 if (Sender = pbOnLineResources) then
 begin
  if (afw.Application.LocaleInfo.Language = afw_lngEnglish) then
  begin
   if DefDataAdapter.IsInternetAgentEnabled then
    nsPaintImage(dmMainMenuNew.ilButtonsNew, pbOnLineResources, 1, True)
   else
    nsPaintImage(dmMainMenuNew.ilButtonsNew, pbOnLineResources, 1, True);
  end//afw.Application.LocaleInfo.Language = afw_lngEnglish
  else
  begin
   if DefDataAdapter.IsInternetAgentEnabled then
    nsPaintImage(dmMainMenuNew.ilButtonsNew, pbOnLineResources, 5, True)
   else
    nsPaintImage(dmMainMenuNew.ilButtonsNew, pbOnLineResources, 5, True);
  end;//afw.Application.LocaleInfo.Language = afw_lngEnglish
 end//Sender = pbOnLineResources
 else
 if (Sender = pbWebVersion) then
 begin
  if pbWebVersion.Visible then
  begin
   if (afw.Application.LocaleInfo.Language = afw_lngEnglish) then
   begin
    if DefDataAdapter.IsInternetAgentEnabled then
     nsPaintImage(dmMainMenuNew.ilButtonsNew, pbWebVersion, 2, True)
    else
     nsPaintImage(dmMainMenuNew.ilButtonsNew, pbWebVersion, 2, True);
   end//afw.Application.LocaleInfo.Language = afw_lngEnglish
   else
   begin
    if DefDataAdapter.IsInternetAgentEnabled then
     nsPaintImage(dmMainMenuNew.ilButtonsNew, pbWebVersion, 4, True)
    else
     nsPaintImage(dmMainMenuNew.ilButtonsNew, pbWebVersion, 4, True);
   end;//afw.Application.LocaleInfo.Language = afw_lngEnglish
  end;//pbWebVersion.Visible
 end;//Sender = pbWebVersion
//#UC END# *56FE8B9303D1_56FA889202B4_impl*
end;//TPrimMainMenuWithProfNewsForm.PaintButton

procedure TPrimMainMenuWithProfNewsForm.PaintBoxClick(Sender: TObject);
//#UC START# *57023AD501A4_56FA889202B4_var*
const
 c_OnlineResDocId = 57869919;
//#UC END# *57023AD501A4_56FA889202B4_var*
begin
//#UC START# *57023AD501A4_56FA889202B4_impl*
 if (Sender = pbFeedback) then
 begin
  TdmStdRes.OpenSendConsultation(nil);
 end//Sender = pbFeedback
 else
 if (Sender = pbOnLineResources) then
 begin
  vcmDispatcher.ModuleOperation(TdmStdRes.mod_opcode_InternetAgent_InternetAgent);
 end//Sender = pbOnLineResources
 else
 if (Sender = pbWebVersion) then
 begin
  if DefDataAdapter.IsInternetAgentEnabled then
  begin
   //http://mdp.garant.ru/pages/viewpage.action?pageId=431371899
   afw.BeginOp;
   try
    nsOpenDocumentByNumber(c_OnlineResDocId + c_InternalDocShift, 0, dptSub, True);
   finally
    afw.EndOp;
   end;//try..finally
  end;
 end;//Sender = pbWebVersion
//#UC END# *57023AD501A4_56FA889202B4_impl*
end;//TPrimMainMenuWithProfNewsForm.PaintBoxClick

procedure TPrimMainMenuWithProfNewsForm.BannerClick(Sender: TObject);
//#UC START# *57024AF70200_56FA889202B4_var*
var
 l_Link: IExternalLink;
 l_Entity: IEntityBase;
 l_Ref: IUnknown;
//#UC END# *57024AF70200_56FA889202B4_var*
begin
//#UC START# *57024AF70200_56FA889202B4_impl*
 if (f_Banner <> nil) then
 begin
  f_Banner.OpenLink(l_Ref);
  if (l_Ref <> nil) then
  begin
   if Supports(l_Ref, IExternalLink, l_Link) then
    try
     nsExecuteExternalLink(l_Link);
    finally
     l_Link := nil;
    end//try..finally
   else
   if Supports(l_Ref, IEntityBase, l_Entity) then
    try
     TdmStdRes.OpenEntityAsDocument(l_Entity, NativeMainForm);
    finally
     l_Entity := nil;
    end//try..finally
  end;//l_Ref <> nil
 end;//f_Banner <> nil
//#UC END# *57024AF70200_56FA889202B4_impl*
end;//TPrimMainMenuWithProfNewsForm.BannerClick

procedure TPrimMainMenuWithProfNewsForm.LoadBanner;
//#UC START# *57024B0D006F_56FA889202B4_var*
var
 l_EO: IExternalObject;
 l_Stream: TStream;
 l_Name: IString;
//#UC END# *57024B0D006F_56FA889202B4_var*
begin
//#UC START# *57024B0D006F_56FA889202B4_impl*
 with ieIO do
 begin
  Background := clWhite;
  AttachedImageEn := ieBanner;
 end;//ieIO
 try
  DefDataAdapter.CommonInterfaces.GetBanner(f_Banner);
 except
  on ECannotFindData do
  begin
   ieBanner.Cursor := crArrow;
   Exit;
  end;//on ECannotFindData
 end;//try..except
 if (f_Banner <> nil) then
 begin
  f_Banner.GetPicture(l_EO);
  if (l_EO <> nil) then
  begin
   l_Stream := TnsExternalObjectStream.Create(l_EO);
   try
    ieIO.LoadFromStream(l_Stream);
    ieBanner.AutoFit := (ieIO.Params.Width <> ieBanner.Width) or
                        (ieIO.Params.Height <> ieBanner.Height);
   finally
    FreeAndNil(l_Stream);
   end;//try..finally
   l_EO.GetName(l_Name);
   if (l_Name <> nil) then
   begin
    ieBanner.Hint := l3Str(nsCStr(l_Name));
    ieBanner.ShowHint := True;
   end//l_Name <> nil
   else
    ieBanner.Hint := '';
  end;//l_EO <> nil
 end;//f_Banner <> nil
//#UC END# *57024B0D006F_56FA889202B4_impl*
end;//TPrimMainMenuWithProfNewsForm.LoadBanner

procedure TPrimMainMenuWithProfNewsForm.lblTaxesChange(Sender: TObject);
//#UC START# *5707BB3A0018_56FA889202B4_var*
var
 l_Section: IMainMenuSection;
 l_NewsSection: Integer;
//#UC END# *5707BB3A0018_56FA889202B4_var*
begin
//#UC START# *5707BB3A0018_56FA889202B4_impl*
 if Supports(lblTaxes.TreeStruct.Nodes[lblTaxes.CurrentItem], IMainMenuSection, l_Section) then
 begin
  tvTaxes.TreeStruct := TsmMainMenuTree2016.Make(l_Section);
  if f_IsInited then
  begin
   l_NewsSection := l_Section.GetNewsSectionIndex;
   if (l_NewsSection >= 0) and (l_NewsSection <> lblProfNews.CurrentItem) then
    lblProfNews.CurrentItem := l_NewsSection;
  end;
 end;
 if f_IsInited then
 begin
  ArrangeControls;
  afw.Settings.SaveInteger(pi_MainMenu_TaxesSection, lblTaxes.CurrentItem);
 end;
//#UC END# *5707BB3A0018_56FA889202B4_impl*
end;//TPrimMainMenuWithProfNewsForm.lblTaxesChange

procedure TPrimMainMenuWithProfNewsForm.lblProfNewsChange(Sender: TObject);
//#UC START# *5707BB480178_56FA889202B4_var*
var
 l_Section: IMainMenuSection;
//#UC END# *5707BB480178_56FA889202B4_var*
begin
//#UC START# *5707BB480178_56FA889202B4_impl*
 if Supports(lblProfNews.TreeStruct.Nodes[lblProfNews.CurrentItem], IMainMenuSection, l_Section) then
  tvProfNews.TreeStruct := TsmMainMenuTree2016.Make(l_Section);
 if f_IsInited then
 begin
  ArrangeControls;
  afw.Settings.SaveInteger(pi_MainMenu_ProfNewsSection, lblProfNews.CurrentItem);
 end;
//#UC END# *5707BB480178_56FA889202B4_impl*
end;//TPrimMainMenuWithProfNewsForm.lblProfNewsChange

function TPrimMainMenuWithProfNewsForm.DoBuildGrid: InscArrangeGrid;
//#UC START# *4AC9B6D00250_56FA889202B4_var*
//#UC END# *4AC9B6D00250_56FA889202B4_var*
begin
//#UC START# *4AC9B6D00250_56FA889202B4_impl*
 Result := nil;
//#UC END# *4AC9B6D00250_56FA889202B4_impl*
end;//TPrimMainMenuWithProfNewsForm.DoBuildGrid

procedure TPrimMainMenuWithProfNewsForm.Cleanup;
 {* ������� ������� ����� �������. }
//#UC START# *479731C50290_56FA889202B4_var*
//#UC END# *479731C50290_56FA889202B4_var*
begin
//#UC START# *479731C50290_56FA889202B4_impl*
 f_Banner := nil;
 inherited;
//#UC END# *479731C50290_56FA889202B4_impl*
end;//TPrimMainMenuWithProfNewsForm.Cleanup

procedure TPrimMainMenuWithProfNewsForm.InitFields;
//#UC START# *47A042E100E2_56FA889202B4_var*
//#UC END# *47A042E100E2_56FA889202B4_var*
begin
//#UC START# *47A042E100E2_56FA889202B4_impl*
 inherited;
 f_IsInited := False;
//#UC END# *47A042E100E2_56FA889202B4_impl*
end;//TPrimMainMenuWithProfNewsForm.InitFields

procedure TPrimMainMenuWithProfNewsForm.FinishDataUpdate;
//#UC START# *47EA4E9002C6_56FA889202B4_var*
//#UC END# *47EA4E9002C6_56FA889202B4_var*
begin
//#UC START# *47EA4E9002C6_56FA889202B4_impl*
 inherited;
 LoadTrees;
 UpdateSearchLabels;
 UpdateReferencesAndLawNewsCaptions;
 ArrangeControls;
//#UC END# *47EA4E9002C6_56FA889202B4_impl*
end;//TPrimMainMenuWithProfNewsForm.FinishDataUpdate

{$If NOT Defined(NoVCM)}
procedure TPrimMainMenuWithProfNewsForm.DoInit(aFromHistory: Boolean);
 {* ������������� �����. ��� ���������� � �������� }
//#UC START# *49803F5503AA_56FA889202B4_var*
//#UC END# *49803F5503AA_56FA889202B4_var*
begin
//#UC START# *49803F5503AA_56FA889202B4_impl*
 inherited;
 LoadBanner;
 UpdateCaption;
 UpdateTabCaption(DoGetTabCaption);
 LoadTrees;
 UpdateReferencesAndLawNewsCaptions;
 ArrangeControls;
 f_IsInited := True;
//#UC END# *49803F5503AA_56FA889202B4_impl*
end;//TPrimMainMenuWithProfNewsForm.DoInit
{$IfEnd} // NOT Defined(NoVCM)

{$If NOT Defined(NoVCM)}
function TPrimMainMenuWithProfNewsForm.DoSaveState(out theState: IvcmBase;
 aStateType: TvcmStateType;
 aForClone: Boolean): Boolean;
 {* ��������� ��������� �����. ��� ���������� � �������� }
//#UC START# *49806ED503D5_56FA889202B4_var*
var
 l_InnerState: IvcmBase;
//#UC END# *49806ED503D5_56FA889202B4_var*
begin
//#UC START# *49806ED503D5_56FA889202B4_impl*
 l_InnerState := nil;
 Result := inherited DoSaveState(l_InnerState, aStateType, aForClone);
 theState := TMainMenuWithProfNewsFormState.Make(l_InnerState, lblProfNews.CurrentItem, lblTaxes.CurrentItem);
//#UC END# *49806ED503D5_56FA889202B4_impl*
end;//TPrimMainMenuWithProfNewsForm.DoSaveState
{$IfEnd} // NOT Defined(NoVCM)

{$If NOT Defined(NoVCM)}
function TPrimMainMenuWithProfNewsForm.DoLoadState(const aState: IvcmBase;
 aStateType: TvcmStateType): Boolean;
 {* ��������� ��������� �����. ��� ���������� � �������� }
//#UC START# *49807428008C_56FA889202B4_var*
var
 l_State: IMainMenuWithProfNewsFormState;
 l_InnerState: IvcmBase;
//#UC END# *49807428008C_56FA889202B4_var*
begin
//#UC START# *49807428008C_56FA889202B4_impl*
 if Supports(aState, IMainMenuWithProfNewsFormState, l_State) then
 begin
  l_InnerState := l_State.InnerState;
  lblProfNews.CurrentItem := l_State.ProfNewsTreeItemIndex;
  lblTaxes.CurrentItem := l_State.TaxesTreeItemIndex;
  Result := inherited DoLoadState(l_InnerState, aStateType);
 end else
  Result := inherited DoLoadState(aState, aStateType);
//#UC END# *49807428008C_56FA889202B4_impl*
end;//TPrimMainMenuWithProfNewsForm.DoLoadState
{$IfEnd} // NOT Defined(NoVCM)

{$If NOT Defined(DesignTimeLibrary)}
procedure TPrimMainMenuWithProfNewsForm.DoStyleTableChanged;
//#UC START# *4A485B710126_56FA889202B4_var*
//#UC END# *4A485B710126_56FA889202B4_var*
begin
//#UC START# *4A485B710126_56FA889202B4_impl*
 inherited;
 ArrangeControls;
//#UC END# *4A485B710126_56FA889202B4_impl*
end;//TPrimMainMenuWithProfNewsForm.DoStyleTableChanged
{$IfEnd} // NOT Defined(DesignTimeLibrary)

{$If NOT Defined(NoVCM)}
procedure TPrimMainMenuWithProfNewsForm.InitControls;
 {* ��������� ������������� ���������. ��� ���������� � �������� }
//#UC START# *4A8E8F2E0195_56FA889202B4_var*
 procedure lp_SetupButtons(const aControls: array of TControl);
 var
  I: Integer;
 begin
  for I := Low(aControls) to High(aControls) do
  begin
   if aControls[I] is TvtPanel then
    with aControls[I] as TvtPanel do
    begin
     BevelOuter := bvNone;
     Align := alTop;
     Color := clWhite;
     Height := dmMainMenuNew.ilButtonsNew.Height + 30;
    end
   else
   if aControls[I] is TPaintBox then
    with aControls[I] as TPaintBox do
    begin
     Top := 0;
     Left := 0;
     Height := dmMainMenuNew.ilButtonsNew.Height + 1;
     Width := dmMainMenuNew.ilButtonsNew.Width + 1;
     OnPaint := Self.PaintButton;
     OnClick := PaintBoxClick;
     Cursor := crHandPoint;
    end
   else
    Assert(False);
  end;

  pnlWebVersion.Visible := afw.Application.LocaleInfo.Language = afw_lngRussian;
 end; // lp_SetupButtons

 procedure lp_SetupTrees;
 var
  I: Integer;
 begin
  for I := 0 to Pred(ComponentCount) do
   if (Components[I] is TnscTreeViewHotTruck) then
   begin
    TnscTreeViewHotTruck(Components[I]).TreatDefaultColorAsWindowColor := False;
    TnscTreeViewHotTruck(Components[I]).StyleID := f1_saNewSchoolMainMenuConstPath;
    TnscTreeViewHotTruck(Components[I]).Color := clWhite;
    TnscTreeViewHotTruck(Components[I]).Align := alNone;
    TnscTreeViewHotTruck(Components[I]).InterRowIndent := 5;
   end;
 end; // lp_SetupTrees

const
 c_SearchLabelDistance = 18;
//#UC END# *4A8E8F2E0195_56FA889202B4_var*
begin
//#UC START# *4A8E8F2E0195_56FA889202B4_impl*
 inherited;

 //lblProfNews.Caption := '���������������� �������';

 Self.Color := clWhite;
 Self.Align := alClient;
 bvlLeft.Align := alLeft;
 bvlLeft.Width := 25;
 bvlLeft.Shape := bsSpacer;
 bvlRight.Align := alRight;
 bvlRight.Width := 25;
 bvlRight.Shape := bsSpacer;
 with pnlMain do
 begin
  Top := 0;
  Left := 0;
  BevelOuter := bvNone;
  Color := clWhite;
  TabOrder := 0;
 end;
 with pnlLeft do
 begin
  Align := alLeft;
  BevelOuter := bvNone;
  Color := clWhite;
  Width := 235;
 end;
 with pnlClient do
 begin
  Align := alClient;
  BevelOuter := bvNone;
  Color := clWhite;
 end;
 with pnlNews do
 begin
  Align := alTop;
  BevelOuter := bvNone;
  Color := clWhite;
 end;
 with pnlBaseSearch do
 begin
  BevelOuter := bvNone;
  Color := clWhite;
  Align := alTop;
  Height := 145;
 end;
  with pnlBaseSearchZone do
  begin
   Align := alTop;
   BevelOuter := bvNone;
   Color := clWhite;
  end;
  with pnlSearches do
  begin
   Align := alBottom;
   BevelOuter := bvNone;
   Color := clWhite;
   Height := 20;
   with flAttributeSearch do
   begin
    TabOrder := 0;
    Left := 15;
    AutoWidth := True;
    AllowTrucking := True;
    HighlightColor := c_MainMenuColor;
    TextColor := c_MainMenuColor;
    Cursor := crHandPoint;
    OnClick := SearchClick;
   end;//flAttributeSearch
   with flSituationSearch do
   begin
    TabOrder := 1;
    Left := c_SearchLabelDistance + flAttributeSearch.Left + flAttributeSearch.Width;
    AutoWidth := True;
    AllowTrucking := True;
    HighlightColor := c_MainMenuColor;
    TextColor := c_MainMenuColor;
    Cursor := crHandPoint;
    OnClick := SearchClick;
   end;//flSituationSearch
   with flPublishedSourceSearch do
   begin
    TabOrder := 2;
    Left := c_SearchLabelDistance + flSituationSearch.Left + flSituationSearch.Width;
    AutoWidth := True;
    AllowTrucking := True;
    HighlightColor := c_MainMenuColor;
    TextColor := c_MainMenuColor;
    Cursor := crHandPoint;
    OnClick := SearchClick;
   end;//flPublishedSourceSearch
   with flDictionSearch do
   begin
    TabOrder := 3;
    Left := c_SearchLabelDistance + flPublishedSourceSearch.Left + flPublishedSourceSearch.Width;
    AutoWidth := True;
    AllowTrucking := True;
    HighlightColor := c_MainMenuColor;
    TextColor := c_MainMenuColor;
    Cursor := crHandPoint;
    OnClick := SearchClick;
   end;//flDictionSearch
   UpdateSearchLabels;
  end;
 with pnlTrees do
 begin
  Align := alTop;
  BevelOuter := bvNone;
  Color := clWhite;
  Height := 200;
  Top := 401;
 end;

 bvlLeftTop.Align := alTop;
 bvlLeftTop.Shape := bsSpacer;

 with lblProfNews do
 begin
  WordWrap := True;
  AutoSize := True;
  Cursor := crHandPoint;
  ImageIndex := 2;
  ImageList := nsDocumentRes.MainMenuImageList;
  StyleId := f1_saNewSchoolMainMenuHeader;
  OnChange := lblProfNewsChange;
 end;
 with tvProfNews do
 begin
  AllowTrucking := True;
  BorderStyle := bsNone;
  TabOrder := 0;
  MultiStrokeItem := True;
  ActionElementMode := l3_amSingleClick;
  ViewOptions := [voShowInterRowSpace, voShowExpandable, voVariableItemHeight, voWithoutImages];
  ClearTreeStructOnSaveState := False;
 end;

 hfLastOpenDocs.Visible := False;
 with pnlLastOpenDocs do
 begin
  Align := alTop;
  BevelOuter := bvNone;
  Color := clWhite;
  Height := 200;
  Top := 601;
 end;
 with lblLastOpenDocs do
 begin
  WordWrap := True;
  AutoSize := True;
  StyleId := f1_saNewSchoolMainMenuHeader;
 end;
 with tvLastOpenDocs do
 begin
  AllowTrucking := True;
  BorderStyle := bsNone;
  TabOrder := 0;
  MultiStrokeItem := True;
  ActionElementMode := l3_amSingleClick;
  ViewOptions := [voShowInterRowSpace, voShowExpandable, voVariableItemHeight, voWithoutImages];
  ClearTreeStructOnSaveState := False;
 end;

 hfReferences.Visible := False;
 with lblReferences do
 begin
  WordWrap := True;
  AutoSize := True;
  StyleId := f1_saNewSchoolMainMenuHeader;
 end;
 with tvReferences do
 begin
  AllowTrucking := True;
  BorderStyle := bsNone;
  TabOrder := 0;
  MultiStrokeItem := True;
  ActionElementMode := l3_amSingleClick;
  ViewOptions := [voShowIcons, voShowExpandable, voWithoutImages];
  ClearTreeStructOnSaveState := False;
 end;

 hfLawNews.Visible := False;
 with lblLawNews do
 begin
  WordWrap := True;
  AutoSize := True;
  StyleId := f1_saNewSchoolMainMenuHeader;
 end;
 with tvLawNews do
 begin
  AllowTrucking := True;
  BorderStyle := bsNone;
  TabOrder := 1;
  MultiStrokeItem := True;
  ActionElementMode := l3_amSingleClick;
  ViewOptions := [voShowIcons, voShowExpandable, voWithoutImages];
  ClearTreeStructOnSaveState := False;
 end;

 with lblTaxes do
 begin
  WordWrap := True;
  AutoSize := True;
  Cursor := crHandPoint;
  ImageList := nsDocumentRes.MainMenuImageList;
  StyleId := f1_saNewSchoolMainMenuHeader;
  //if afw.Application.LocaleInfo.Language = afw_lngEnglish
  ImageIndex := 2;
  OnChange := lblTaxesChange;
 end;
 with tvTaxes do
 begin
  BorderStyle := bsNone;
  MultiStrokeItem := True;
  TabOrder := 1;
  ActionElementMode := l3_amSingleClick;
  ViewOptions := [voShowIcons, voShowExpandable, voWithoutImages];
  ClearTreeStructOnSaveState := False;
  AllowTrucking := True;
 end;//with tvTaxes

 with pnlLogo do
 begin
  BevelOuter := bvNone;
  Align := alTop;
  Color := clWhite;
 end;
 with pbLogo do
 begin
  Top := 0;
  Left := 0;
  Height := 59;
  Width := 200;
  OnPaint := Self.PaintLogo;
 end;

 with pnlBanner do
 begin
  Align := alTop;
  BevelOuter := bvNone;
  Color := clWhite;
 end;
  with ieBanner do
  begin
   Left := 10;
   Width := 155;
   Height := 200;
   Cursor := crHandPoint;
   BorderStyle := bsNone;
   LegacyBitmap := False;
   ZoomFilter := rfLanczos3;
   MouseInteract := [miScroll];
   DelayZoomFilter := True;
   AutoFit := false;
   OnClick := BannerClick;
   MouseWheelParams.Action := iemwNone;
  end;//ieBanner

 lp_SetupButtons([pnlFeedback,
                  pbFeedback,
                  pnlWebVersion,
                  pbWebVersion,
                  pnlOnlineResources,
                  pbOnLineResources]);

 lp_SetupTrees;
 ArrangeControls;
//#UC END# *4A8E8F2E0195_56FA889202B4_impl*
end;//TPrimMainMenuWithProfNewsForm.InitControls
{$IfEnd} // NOT Defined(NoVCM)

procedure TPrimMainMenuWithProfNewsForm.LoadLastOpenDocs;
//#UC START# *4AC9D12600E0_56FA889202B4_var*
var
 l_DocCount: Integer;
//#UC END# *4AC9D12600E0_56FA889202B4_var*
begin
//#UC START# *4AC9D12600E0_56FA889202B4_impl*
 l_DocCount := afw.Settings.LoadInteger(pi_RecentlyOpenDocumentsCount, dv_RecentlyOpenDocumentsCount);
 tvLastOpenDocs.TreeStruct := TnsLastOpenDocTree.Make(l_DocCount, False, True);
//#UC END# *4AC9D12600E0_56FA889202B4_impl*
end;//TPrimMainMenuWithProfNewsForm.LoadLastOpenDocs

procedure TPrimMainMenuWithProfNewsForm.LoadTrees;
//#UC START# *4AC9E9EC0064_56FA889202B4_var*
var
 l_ProfNewsSections,
 l_TaxesSections: IMainMenuSectionList;
 l_ProfNewsItem: Integer;
//#UC END# *4AC9E9EC0064_56FA889202B4_var*
begin
//#UC START# *4AC9E9EC0064_56FA889202B4_impl*
 inherited;

 DefDataAdapter.NativeAdapter.MakeMainMenu.GetProfessionSectionList(l_TaxesSections);
 if Assigned(l_TaxesSections) then
 begin
  lblTaxes.TreeStruct := TsmSectionTree.Make(l_TaxesSections);
 end else
 begin
  lblTaxes.Caption := '---';
  lblTaxes.Visible := False;
  tvTaxes.Visible := False;
 end;

 DefDataAdapter.NativeAdapter.MakeMainMenu.GetNewsSectionList(l_ProfNewsSections);
 if Assigned(l_ProfNewsSections) then
 begin
  lblProfNews.TreeStruct := TsmSectionTree.Make(l_ProfNewsSections);
 end else
 begin
  lblProfNews.Caption := '---';
  lblProfNews.Visible := False;
  tvProfNews.Visible := False;
 end;

 l_ProfNewsItem := afw.Settings.LoadInteger(pi_MainMenu_ProfNewsSection, dv_MainMenu_ProfNewsSection);
 lblTaxes.CurrentItem := afw.Settings.LoadInteger(pi_MainMenu_TaxesSection, dv_MainMenu_TaxesSection);
 lblProfNews.CurrentItem := l_ProfNewsItem;
//#UC END# *4AC9E9EC0064_56FA889202B4_impl*
end;//TPrimMainMenuWithProfNewsForm.LoadTrees

function TPrimMainMenuWithProfNewsForm.pm_GetContainerForBaseSearch: IvcmContainer;
//#UC START# *4ACA197F0147_56FA889202B4get_var*
//#UC END# *4ACA197F0147_56FA889202B4get_var*
begin
//#UC START# *4ACA197F0147_56FA889202B4get_impl*
 Result := Self;
//#UC END# *4ACA197F0147_56FA889202B4get_impl*
end;//TPrimMainMenuWithProfNewsForm.pm_GetContainerForBaseSearch

function TPrimMainMenuWithProfNewsForm.NewSchool: Boolean;
 {* ����������, ��� �������� ���� ���� 2009 - [$164601183] }
//#UC START# *4ACB2F98002B_56FA889202B4_var*
//#UC END# *4ACB2F98002B_56FA889202B4_var*
begin
//#UC START# *4ACB2F98002B_56FA889202B4_impl*
 Result := True;
//#UC END# *4ACB2F98002B_56FA889202B4_impl*
end;//TPrimMainMenuWithProfNewsForm.NewSchool

procedure TPrimMainMenuWithProfNewsForm.pnlMainResize(aSender: TObject);
//#UC START# *4ACC82D6017B_56FA889202B4_var*
//#UC END# *4ACC82D6017B_56FA889202B4_var*
begin
//#UC START# *4ACC82D6017B_56FA889202B4_impl*
 ArrangeControls;
//#UC END# *4ACC82D6017B_56FA889202B4_impl*
end;//TPrimMainMenuWithProfNewsForm.pnlMainResize

{$If NOT Defined(NoVCM)}
procedure TPrimMainMenuWithProfNewsForm.SetControlsResources;
 {* ���������� ��������� ������� ��� ������������������� }
//#UC START# *4B62D10B031B_56FA889202B4_var*
//#UC END# *4B62D10B031B_56FA889202B4_var*
begin
//#UC START# *4B62D10B031B_56FA889202B4_impl*
 inherited;
 flAttributeSearch.Hint := '������� �������� ������ �� ����������';
 flSituationSearch.Hint := '������� ������������ ��������';
 flPublishedSourceSearch.Hint := '������� ����� �� ��������� �������������';
 flDictionSearch.Hint := '������� �������� ������� �������� � ���������� ��������';

 flAttributeSearch.ShowHint := True;
 flSituationSearch.ShowHint := True;
 flPublishedSourceSearch.ShowHint := True;
 flDictionSearch.ShowHint := True;
//#UC END# *4B62D10B031B_56FA889202B4_impl*
end;//TPrimMainMenuWithProfNewsForm.SetControlsResources
{$IfEnd} // NOT Defined(NoVCM)

{$If NOT Defined(NoVCL)}
procedure TPrimMainMenuWithProfNewsForm.Resize;
//#UC START# *4CC8417A0288_56FA889202B4_var*
//#UC END# *4CC8417A0288_56FA889202B4_var*
begin
//#UC START# *4CC8417A0288_56FA889202B4_impl*
 inherited;
 ArrangeControls;
//#UC END# *4CC8417A0288_56FA889202B4_impl*
end;//TPrimMainMenuWithProfNewsForm.Resize
{$IfEnd} // NOT Defined(NoVCL)

procedure TPrimMainMenuWithProfNewsForm.ClearFields;
//#UC START# *5000565C019C_56FA889202B4_var*
//#UC END# *5000565C019C_56FA889202B4_var*
begin
//#UC START# *5000565C019C_56FA889202B4_impl*
 f_Banner := nil;
 inherited;
//#UC END# *5000565C019C_56FA889202B4_impl*
end;//TPrimMainMenuWithProfNewsForm.ClearFields

{$If NOT Defined(NoVCM)}
function TPrimMainMenuWithProfNewsForm.DoGetTabCaption: IvcmCString;
//#UC START# *53F1C6EF02C9_56FA889202B4_var*
//#UC END# *53F1C6EF02C9_56FA889202B4_var*
begin
//#UC START# *53F1C6EF02C9_56FA889202B4_impl*
 Result := vcmCStr(str_utMainMenuWithProfNewsCaption);
//#UC END# *53F1C6EF02C9_56FA889202B4_impl*
end;//TPrimMainMenuWithProfNewsForm.DoGetTabCaption
{$IfEnd} // NOT Defined(NoVCM)

{$If NOT Defined(NoVCM) AND NOT Defined(NoVGScene) AND NOT Defined(NoTabs)}
function TPrimMainMenuWithProfNewsForm.DoGetFormSetTabCaption: IvcmCString;
//#UC START# *54058CBC0182_56FA889202B4_var*
//#UC END# *54058CBC0182_56FA889202B4_var*
begin
//#UC START# *54058CBC0182_56FA889202B4_impl*
 Result := DoGetTabCaption;
//#UC END# *54058CBC0182_56FA889202B4_impl*
end;//TPrimMainMenuWithProfNewsForm.DoGetFormSetTabCaption
{$IfEnd} // NOT Defined(NoVCM) AND NOT Defined(NoVGScene) AND NOT Defined(NoTabs)

{$If NOT Defined(NoVCM) AND NOT Defined(NoVGScene) AND NOT Defined(NoTabs)}
function TPrimMainMenuWithProfNewsForm.DoGetTabImageIndex: Integer;
//#UC START# *543E3AA801D0_56FA889202B4_var*
//#UC END# *543E3AA801D0_56FA889202B4_var*
begin
//#UC START# *543E3AA801D0_56FA889202B4_impl*
 Result := nsTabIconIndex(titMain);
//#UC END# *543E3AA801D0_56FA889202B4_impl*
end;//TPrimMainMenuWithProfNewsForm.DoGetTabImageIndex
{$IfEnd} // NOT Defined(NoVCM) AND NOT Defined(NoVGScene) AND NOT Defined(NoTabs)

initialization
 str_utMainMenuWithProfNewsCaption.Init;
 {* ������������� str_utMainMenuWithProfNewsCaption }
{$If NOT Defined(NoScripts)}
 TtfwClassRef.Register(TPrimMainMenuWithProfNewsForm);
 {* ����������� PrimMainMenuWithProfNews }
{$IfEnd} // NOT Defined(NoScripts)
{$IfEnd} // NOT Defined(Admin) AND NOT Defined(Monitorings)

end.
