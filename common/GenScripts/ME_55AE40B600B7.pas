unit vcmTabsWordsPack;

// ������: "w:\common\components\gui\Garant\VCM\vcmTabsWordsPack.pas"
// ���������: "ScriptKeywordsPack"

{$Include vcmDefine.inc}

interface

{$If NOT Defined(NoVCM) AND NOT Defined(NoScripts) AND NOT Defined(NoTabs)}
uses
 l3IntfUses
 , tfwGlobalKeyWord
 , tfwScriptingInterfaces
 , TypInfo
;
{$IfEnd} // NOT Defined(NoVCM) AND NOT Defined(NoScripts) AND NOT Defined(NoTabs)

implementation

{$If NOT Defined(NoVCM) AND NOT Defined(NoScripts) AND NOT Defined(NoTabs)}
uses
 l3ImplUses
 , l3TabbedContainersDispatcher
 , tfwScriptingTypes
 , tfwTypeRegistrator
 , SysUtils
;

type
 TkwVcmTabsCloseCurrent = {final} class(TtfwGlobalKeyWord)
  {* ����� ������� vcm:tabs:CloseCurrent
[panel]������� ������� ������� � �������� ����. �� ��������� ���������.[panel]
*������:*
[code]
 vcm:tabs:CloseCurrent
[code]  }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
  public
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
 end;//TkwVcmTabsCloseCurrent

 TkwVcmTabsClose = {final} class(TtfwGlobalKeyWord)
  {* ����� ������� vcm:tabs:Close
[panel]������� ������� �� �������. ��������� � ����.[panel]
*������:*
[code]
 aTabIndex vcm:tabs:Close
[code]  }
  private
   procedure vcm_tabs_Close(const aCtx: TtfwContext;
    aTabIndex: Integer);
    {* ���������� ����� ������� vcm:tabs:Close }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
  public
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
 end;//TkwVcmTabsClose

 TkwVcmTabsCloseAllButCurrent = {final} class(TtfwGlobalKeyWord)
  {* ����� ������� vcm:tabs:CloseAllButCurrent
[panel]������� ��� ������� ����� ������� � �������� ����[panel]
*������:*
[code]
 vcm:tabs:CloseAllButCurrent
[code]  }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
  public
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
 end;//TkwVcmTabsCloseAllButCurrent

 TkwVcmTabsActive = {final} class(TtfwGlobalKeyWord)
  {* ����� ������� vcm:tabs:Active
[panel]����� �������� ������� � ������� ����. ��������� � ����.[panel]
*��� ����������:* Integer
*������:*
[code]
INTEGER VAR l_Integer
 vcm:tabs:Active >>> l_Integer
[code]  }
  private
   function vcm_tabs_Active(const aCtx: TtfwContext): Integer;
    {* ���������� ����� ������� vcm:tabs:Active }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
  public
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
 end;//TkwVcmTabsActive

 TkwVcmTabsSetActive = {final} class(TtfwGlobalKeyWord)
  {* ����� ������� vcm:tabs:SetActive
[panel]������� �� ������� � �������� ���� (��������� � ����)[panel]
*������:*
[code]
 aValue vcm:tabs:SetActive
[code]  }
  private
   procedure vcm_tabs_SetActive(const aCtx: TtfwContext;
    aValue: Integer);
    {* ���������� ����� ������� vcm:tabs:SetActive }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
  public
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
 end;//TkwVcmTabsSetActive

 TkwVcmTabsCount = {final} class(TtfwGlobalKeyWord)
  {* ����� ������� vcm:tabs:Count
[panel]���������� ������� � �������� ����[panel]
*��� ����������:* Integer
*������:*
[code]
INTEGER VAR l_Integer
 vcm:tabs:Count >>> l_Integer
[code]  }
  private
   function vcm_tabs_Count(const aCtx: TtfwContext): Integer;
    {* ���������� ����� ������� vcm:tabs:Count }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
  public
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
 end;//TkwVcmTabsCount

 TkwVcmTabsOpenNewTab = {final} class(TtfwGlobalKeyWord)
  {* ����� ������� vcm:tabs:OpenNewTab
[panel]������� ����� ������� � �������� ����[panel]
*������:*
[code]
 vcm:tabs:OpenNewTab
[code]  }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
  public
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
 end;//TkwVcmTabsOpenNewTab

 TkwVcmTabsCanOpenNewTab = {final} class(TtfwGlobalKeyWord)
  {* ����� ������� vcm:tabs:CanOpenNewTab
[panel]����� �� ������� ����� ������� � �������� ����[panel]
*��� ����������:* Boolean
*������:*
[code]
BOOLEAN VAR l_Boolean
 vcm:tabs:CanOpenNewTab >>> l_Boolean
[code]  }
  private
   function vcm_tabs_CanOpenNewTab(const aCtx: TtfwContext): Boolean;
    {* ���������� ����� ������� vcm:tabs:CanOpenNewTab }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
  public
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
 end;//TkwVcmTabsCanOpenNewTab

 TkwVcmTabsDuplicate = {final} class(TtfwGlobalKeyWord)
  {* ����� ������� vcm:tabs:Duplicate
[panel]����������� ������� � �������� ����[panel]
*������:*
[code]
 aTabIndex vcm:tabs:Duplicate
[code]  }
  private
   procedure vcm_tabs_Duplicate(const aCtx: TtfwContext;
    aTabIndex: Integer);
    {* ���������� ����� ������� vcm:tabs:Duplicate }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
  public
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
 end;//TkwVcmTabsDuplicate

 TkwVcmTabsCanDuplicate = {final} class(TtfwGlobalKeyWord)
  {* ����� ������� vcm:tabs:CanDuplicate
[panel]����� �� ����������� ������� � �������� ����[panel]
*��� ����������:* Boolean
*������:*
[code]
BOOLEAN VAR l_Boolean
 aTabIndex vcm:tabs:CanDuplicate >>> l_Boolean
[code]  }
  private
   function vcm_tabs_CanDuplicate(const aCtx: TtfwContext;
    aTabIndex: Integer): Boolean;
    {* ���������� ����� ������� vcm:tabs:CanDuplicate }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
  public
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
 end;//TkwVcmTabsCanDuplicate

 TkwVcmTabsReopen = {final} class(TtfwGlobalKeyWord)
  {* ����� ������� vcm:tabs:Reopen
[panel]������� �������� ������� � �������� ����[panel]
*������:*
[code]
 vcm:tabs:Reopen
[code]  }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
  public
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
 end;//TkwVcmTabsReopen

 TkwVcmTabsCanReopen = {final} class(TtfwGlobalKeyWord)
  {* ����� ������� vcm:tabs:CanReopen
[panel]����� �� ������� �������� ������� � �������� ����[panel]
*��� ����������:* Boolean
*������:*
[code]
BOOLEAN VAR l_Boolean
 vcm:tabs:CanReopen >>> l_Boolean
[code]  }
  private
   function vcm_tabs_CanReopen(const aCtx: TtfwContext): Boolean;
    {* ���������� ����� ������� vcm:tabs:CanReopen }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
  public
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
 end;//TkwVcmTabsCanReopen

 TkwVcmTabsGetIconIndex = {final} class(TtfwGlobalKeyWord)
  {* ����� ������� vcm:tabs:GetIconIndex
*��� ����������:* Integer
*������:*
[code]
INTEGER VAR l_Integer
 aTabIndex vcm:tabs:GetIconIndex >>> l_Integer
[code]  }
  private
   function vcm_tabs_GetIconIndex(const aCtx: TtfwContext;
    aTabIndex: Integer): Integer;
    {* ���������� ����� ������� vcm:tabs:GetIconIndex }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
  public
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
 end;//TkwVcmTabsGetIconIndex

 TkwVcmTabsGetCaption = {final} class(TtfwGlobalKeyWord)
  {* ����� ������� vcm:tabs:GetCaption
*��� ����������:* String
*������:*
[code]
STRING VAR l_String
 aTabIndex vcm:tabs:GetCaption >>> l_String
[code]  }
  private
   function vcm_tabs_GetCaption(const aCtx: TtfwContext;
    aTabIndex: Integer): AnsiString;
    {* ���������� ����� ������� vcm:tabs:GetCaption }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
  public
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
 end;//TkwVcmTabsGetCaption

 TkwVcmTabsCanUndock = {final} class(TtfwGlobalKeyWord)
  {* ����� ������� vcm:tabs:CanUndock
*��� ����������:* Boolean
*������:*
[code]
BOOLEAN VAR l_Boolean
 aTabIndex vcm:tabs:CanUndock >>> l_Boolean
[code]  }
  private
   function vcm_tabs_CanUndock(const aCtx: TtfwContext;
    aTabIndex: Integer): Boolean;
    {* ���������� ����� ������� vcm:tabs:CanUndock }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
  public
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
 end;//TkwVcmTabsCanUndock

 TkwVcmTabsUndock = {final} class(TtfwGlobalKeyWord)
  {* ����� ������� vcm:tabs:Undock
*������:*
[code]
 aTabIndex vcm:tabs:Undock
[code]  }
  private
   procedure vcm_tabs_Undock(const aCtx: TtfwContext;
    aTabIndex: Integer);
    {* ���������� ����� ������� vcm:tabs:Undock }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
  public
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
 end;//TkwVcmTabsUndock

procedure TkwVcmTabsCloseCurrent.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_137FD631C8A7_var*
//#UC END# *4DAEEDE10285_137FD631C8A7_var*
begin
//#UC START# *4DAEEDE10285_137FD631C8A7_impl*
 Tl3TabbedContainersDispatcher.Instance.GetActiveTabbedContainer.CloseSelectedTab;
//#UC END# *4DAEEDE10285_137FD631C8A7_impl*
end;//TkwVcmTabsCloseCurrent.DoDoIt

class function TkwVcmTabsCloseCurrent.GetWordNameForRegister: AnsiString;
begin
 Result := 'vcm:tabs:CloseCurrent';
end;//TkwVcmTabsCloseCurrent.GetWordNameForRegister

function TkwVcmTabsCloseCurrent.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
//#UC START# *551544E2001A_137FD631C8A7_var*
//#UC END# *551544E2001A_137FD631C8A7_var*
begin
//#UC START# *551544E2001A_137FD631C8A7_impl*
 !!! Needs to be implemented !!!
//#UC END# *551544E2001A_137FD631C8A7_impl*
end;//TkwVcmTabsCloseCurrent.GetResultTypeInfo

function TkwVcmTabsCloseCurrent.GetAllParamsCount(const aCtx: TtfwContext): Integer;
//#UC START# *559687E6025A_137FD631C8A7_var*
//#UC END# *559687E6025A_137FD631C8A7_var*
begin
//#UC START# *559687E6025A_137FD631C8A7_impl*
 !!! Needs to be implemented !!!
//#UC END# *559687E6025A_137FD631C8A7_impl*
end;//TkwVcmTabsCloseCurrent.GetAllParamsCount

procedure TkwVcmTabsClose.vcm_tabs_Close(const aCtx: TtfwContext;
 aTabIndex: Integer);
 {* ���������� ����� ������� vcm:tabs:Close }
//#UC START# *6AA735B1AFE9_12F6A6736B71_var*
//#UC END# *6AA735B1AFE9_12F6A6736B71_var*
begin
//#UC START# *6AA735B1AFE9_12F6A6736B71_impl*
 with Tl3TabbedContainersDispatcher.Instance.GetActiveTabbedContainer do
  CloseTab(Tabs[aTabIndex]);
//#UC END# *6AA735B1AFE9_12F6A6736B71_impl*
end;//TkwVcmTabsClose.vcm_tabs_Close

procedure TkwVcmTabsClose.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_12F6A6736B71_var*
//#UC END# *4DAEEDE10285_12F6A6736B71_var*
begin
//#UC START# *4DAEEDE10285_12F6A6736B71_impl*
 !!! Needs to be implemented !!!
//#UC END# *4DAEEDE10285_12F6A6736B71_impl*
end;//TkwVcmTabsClose.DoDoIt

class function TkwVcmTabsClose.GetWordNameForRegister: AnsiString;
begin
 Result := 'vcm:tabs:Close';
end;//TkwVcmTabsClose.GetWordNameForRegister

function TkwVcmTabsClose.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
//#UC START# *551544E2001A_12F6A6736B71_var*
//#UC END# *551544E2001A_12F6A6736B71_var*
begin
//#UC START# *551544E2001A_12F6A6736B71_impl*
 !!! Needs to be implemented !!!
//#UC END# *551544E2001A_12F6A6736B71_impl*
end;//TkwVcmTabsClose.GetResultTypeInfo

function TkwVcmTabsClose.GetAllParamsCount(const aCtx: TtfwContext): Integer;
//#UC START# *559687E6025A_12F6A6736B71_var*
//#UC END# *559687E6025A_12F6A6736B71_var*
begin
//#UC START# *559687E6025A_12F6A6736B71_impl*
 !!! Needs to be implemented !!!
//#UC END# *559687E6025A_12F6A6736B71_impl*
end;//TkwVcmTabsClose.GetAllParamsCount

function TkwVcmTabsClose.ParamsTypes: PTypeInfoArray;
//#UC START# *5617F4D00243_12F6A6736B71_var*
//#UC END# *5617F4D00243_12F6A6736B71_var*
begin
//#UC START# *5617F4D00243_12F6A6736B71_impl*
 !!! Needs to be implemented !!!
//#UC END# *5617F4D00243_12F6A6736B71_impl*
end;//TkwVcmTabsClose.ParamsTypes

procedure TkwVcmTabsCloseAllButCurrent.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_91294BF70EF7_var*
//#UC END# *4DAEEDE10285_91294BF70EF7_var*
begin
//#UC START# *4DAEEDE10285_91294BF70EF7_impl*
 Tl3TabbedContainersDispatcher.Instance.GetActiveTabbedContainer.CloseAllButActiveTab;
//#UC END# *4DAEEDE10285_91294BF70EF7_impl*
end;//TkwVcmTabsCloseAllButCurrent.DoDoIt

class function TkwVcmTabsCloseAllButCurrent.GetWordNameForRegister: AnsiString;
begin
 Result := 'vcm:tabs:CloseAllButCurrent';
end;//TkwVcmTabsCloseAllButCurrent.GetWordNameForRegister

function TkwVcmTabsCloseAllButCurrent.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
//#UC START# *551544E2001A_91294BF70EF7_var*
//#UC END# *551544E2001A_91294BF70EF7_var*
begin
//#UC START# *551544E2001A_91294BF70EF7_impl*
 !!! Needs to be implemented !!!
//#UC END# *551544E2001A_91294BF70EF7_impl*
end;//TkwVcmTabsCloseAllButCurrent.GetResultTypeInfo

function TkwVcmTabsCloseAllButCurrent.GetAllParamsCount(const aCtx: TtfwContext): Integer;
//#UC START# *559687E6025A_91294BF70EF7_var*
//#UC END# *559687E6025A_91294BF70EF7_var*
begin
//#UC START# *559687E6025A_91294BF70EF7_impl*
 !!! Needs to be implemented !!!
//#UC END# *559687E6025A_91294BF70EF7_impl*
end;//TkwVcmTabsCloseAllButCurrent.GetAllParamsCount

function TkwVcmTabsActive.vcm_tabs_Active(const aCtx: TtfwContext): Integer;
 {* ���������� ����� ������� vcm:tabs:Active }
//#UC START# *BFE28234E0FC_EA6F3BD4A5CA_var*
//#UC END# *BFE28234E0FC_EA6F3BD4A5CA_var*
begin
//#UC START# *BFE28234E0FC_EA6F3BD4A5CA_impl*
 Result := Tl3TabbedContainersDispatcher.Instance.GetActiveTabbedContainer.ActiveTab.VisibleIndex;
//#UC END# *BFE28234E0FC_EA6F3BD4A5CA_impl*
end;//TkwVcmTabsActive.vcm_tabs_Active

procedure TkwVcmTabsActive.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_EA6F3BD4A5CA_var*
//#UC END# *4DAEEDE10285_EA6F3BD4A5CA_var*
begin
//#UC START# *4DAEEDE10285_EA6F3BD4A5CA_impl*
 !!! Needs to be implemented !!!
//#UC END# *4DAEEDE10285_EA6F3BD4A5CA_impl*
end;//TkwVcmTabsActive.DoDoIt

class function TkwVcmTabsActive.GetWordNameForRegister: AnsiString;
begin
 Result := 'vcm:tabs:Active';
end;//TkwVcmTabsActive.GetWordNameForRegister

function TkwVcmTabsActive.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
//#UC START# *551544E2001A_EA6F3BD4A5CA_var*
//#UC END# *551544E2001A_EA6F3BD4A5CA_var*
begin
//#UC START# *551544E2001A_EA6F3BD4A5CA_impl*
 !!! Needs to be implemented !!!
//#UC END# *551544E2001A_EA6F3BD4A5CA_impl*
end;//TkwVcmTabsActive.GetResultTypeInfo

function TkwVcmTabsActive.GetAllParamsCount(const aCtx: TtfwContext): Integer;
//#UC START# *559687E6025A_EA6F3BD4A5CA_var*
//#UC END# *559687E6025A_EA6F3BD4A5CA_var*
begin
//#UC START# *559687E6025A_EA6F3BD4A5CA_impl*
 !!! Needs to be implemented !!!
//#UC END# *559687E6025A_EA6F3BD4A5CA_impl*
end;//TkwVcmTabsActive.GetAllParamsCount

function TkwVcmTabsActive.ParamsTypes: PTypeInfoArray;
//#UC START# *5617F4D00243_EA6F3BD4A5CA_var*
//#UC END# *5617F4D00243_EA6F3BD4A5CA_var*
begin
//#UC START# *5617F4D00243_EA6F3BD4A5CA_impl*
 !!! Needs to be implemented !!!
//#UC END# *5617F4D00243_EA6F3BD4A5CA_impl*
end;//TkwVcmTabsActive.ParamsTypes

procedure TkwVcmTabsSetActive.vcm_tabs_SetActive(const aCtx: TtfwContext;
 aValue: Integer);
 {* ���������� ����� ������� vcm:tabs:SetActive }
//#UC START# *4D8DA9C0F345_36E868893B0A_var*
//#UC END# *4D8DA9C0F345_36E868893B0A_var*
begin
//#UC START# *4D8DA9C0F345_36E868893B0A_impl*
 with Tl3TabbedContainersDispatcher.Instance.GetActiveTabbedContainer do
  ActiveTab := Tabs[aValue];
//#UC END# *4D8DA9C0F345_36E868893B0A_impl*
end;//TkwVcmTabsSetActive.vcm_tabs_SetActive

procedure TkwVcmTabsSetActive.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_36E868893B0A_var*
//#UC END# *4DAEEDE10285_36E868893B0A_var*
begin
//#UC START# *4DAEEDE10285_36E868893B0A_impl*
 !!! Needs to be implemented !!!
//#UC END# *4DAEEDE10285_36E868893B0A_impl*
end;//TkwVcmTabsSetActive.DoDoIt

class function TkwVcmTabsSetActive.GetWordNameForRegister: AnsiString;
begin
 Result := 'vcm:tabs:SetActive';
end;//TkwVcmTabsSetActive.GetWordNameForRegister

function TkwVcmTabsSetActive.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
//#UC START# *551544E2001A_36E868893B0A_var*
//#UC END# *551544E2001A_36E868893B0A_var*
begin
//#UC START# *551544E2001A_36E868893B0A_impl*
 !!! Needs to be implemented !!!
//#UC END# *551544E2001A_36E868893B0A_impl*
end;//TkwVcmTabsSetActive.GetResultTypeInfo

function TkwVcmTabsSetActive.GetAllParamsCount(const aCtx: TtfwContext): Integer;
//#UC START# *559687E6025A_36E868893B0A_var*
//#UC END# *559687E6025A_36E868893B0A_var*
begin
//#UC START# *559687E6025A_36E868893B0A_impl*
 !!! Needs to be implemented !!!
//#UC END# *559687E6025A_36E868893B0A_impl*
end;//TkwVcmTabsSetActive.GetAllParamsCount

function TkwVcmTabsSetActive.ParamsTypes: PTypeInfoArray;
//#UC START# *5617F4D00243_36E868893B0A_var*
//#UC END# *5617F4D00243_36E868893B0A_var*
begin
//#UC START# *5617F4D00243_36E868893B0A_impl*
 !!! Needs to be implemented !!!
//#UC END# *5617F4D00243_36E868893B0A_impl*
end;//TkwVcmTabsSetActive.ParamsTypes

function TkwVcmTabsCount.vcm_tabs_Count(const aCtx: TtfwContext): Integer;
 {* ���������� ����� ������� vcm:tabs:Count }
//#UC START# *D3D18ECCBD33_D1C0BD993D2F_var*
//#UC END# *D3D18ECCBD33_D1C0BD993D2F_var*
begin
//#UC START# *D3D18ECCBD33_D1C0BD993D2F_impl*
 Result := Tl3TabbedContainersDispatcher.Instance.GetActiveTabbedContainer.TabCount;
//#UC END# *D3D18ECCBD33_D1C0BD993D2F_impl*
end;//TkwVcmTabsCount.vcm_tabs_Count

procedure TkwVcmTabsCount.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_D1C0BD993D2F_var*
//#UC END# *4DAEEDE10285_D1C0BD993D2F_var*
begin
//#UC START# *4DAEEDE10285_D1C0BD993D2F_impl*
 !!! Needs to be implemented !!!
//#UC END# *4DAEEDE10285_D1C0BD993D2F_impl*
end;//TkwVcmTabsCount.DoDoIt

class function TkwVcmTabsCount.GetWordNameForRegister: AnsiString;
begin
 Result := 'vcm:tabs:Count';
end;//TkwVcmTabsCount.GetWordNameForRegister

function TkwVcmTabsCount.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
//#UC START# *551544E2001A_D1C0BD993D2F_var*
//#UC END# *551544E2001A_D1C0BD993D2F_var*
begin
//#UC START# *551544E2001A_D1C0BD993D2F_impl*
 !!! Needs to be implemented !!!
//#UC END# *551544E2001A_D1C0BD993D2F_impl*
end;//TkwVcmTabsCount.GetResultTypeInfo

function TkwVcmTabsCount.GetAllParamsCount(const aCtx: TtfwContext): Integer;
//#UC START# *559687E6025A_D1C0BD993D2F_var*
//#UC END# *559687E6025A_D1C0BD993D2F_var*
begin
//#UC START# *559687E6025A_D1C0BD993D2F_impl*
 !!! Needs to be implemented !!!
//#UC END# *559687E6025A_D1C0BD993D2F_impl*
end;//TkwVcmTabsCount.GetAllParamsCount

function TkwVcmTabsCount.ParamsTypes: PTypeInfoArray;
//#UC START# *5617F4D00243_D1C0BD993D2F_var*
//#UC END# *5617F4D00243_D1C0BD993D2F_var*
begin
//#UC START# *5617F4D00243_D1C0BD993D2F_impl*
 !!! Needs to be implemented !!!
//#UC END# *5617F4D00243_D1C0BD993D2F_impl*
end;//TkwVcmTabsCount.ParamsTypes

procedure TkwVcmTabsOpenNewTab.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_76B187B4575B_var*
//#UC END# *4DAEEDE10285_76B187B4575B_var*
begin
//#UC START# *4DAEEDE10285_76B187B4575B_impl*
 Tl3TabbedContainersDispatcher.Instance.GetActiveTabbedContainer.OpenNewTab;
//#UC END# *4DAEEDE10285_76B187B4575B_impl*
end;//TkwVcmTabsOpenNewTab.DoDoIt

class function TkwVcmTabsOpenNewTab.GetWordNameForRegister: AnsiString;
begin
 Result := 'vcm:tabs:OpenNewTab';
end;//TkwVcmTabsOpenNewTab.GetWordNameForRegister

function TkwVcmTabsOpenNewTab.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
//#UC START# *551544E2001A_76B187B4575B_var*
//#UC END# *551544E2001A_76B187B4575B_var*
begin
//#UC START# *551544E2001A_76B187B4575B_impl*
 !!! Needs to be implemented !!!
//#UC END# *551544E2001A_76B187B4575B_impl*
end;//TkwVcmTabsOpenNewTab.GetResultTypeInfo

function TkwVcmTabsOpenNewTab.GetAllParamsCount(const aCtx: TtfwContext): Integer;
//#UC START# *559687E6025A_76B187B4575B_var*
//#UC END# *559687E6025A_76B187B4575B_var*
begin
//#UC START# *559687E6025A_76B187B4575B_impl*
 !!! Needs to be implemented !!!
//#UC END# *559687E6025A_76B187B4575B_impl*
end;//TkwVcmTabsOpenNewTab.GetAllParamsCount

function TkwVcmTabsCanOpenNewTab.vcm_tabs_CanOpenNewTab(const aCtx: TtfwContext): Boolean;
 {* ���������� ����� ������� vcm:tabs:CanOpenNewTab }
//#UC START# *18CE39730151_D42D3E4F7AC2_var*
//#UC END# *18CE39730151_D42D3E4F7AC2_var*
begin
//#UC START# *18CE39730151_D42D3E4F7AC2_impl*
 Result := Tl3TabbedContainersDispatcher.Instance.GetActiveTabbedContainer.CanOpenNewTab;
//#UC END# *18CE39730151_D42D3E4F7AC2_impl*
end;//TkwVcmTabsCanOpenNewTab.vcm_tabs_CanOpenNewTab

procedure TkwVcmTabsCanOpenNewTab.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_D42D3E4F7AC2_var*
//#UC END# *4DAEEDE10285_D42D3E4F7AC2_var*
begin
//#UC START# *4DAEEDE10285_D42D3E4F7AC2_impl*
 !!! Needs to be implemented !!!
//#UC END# *4DAEEDE10285_D42D3E4F7AC2_impl*
end;//TkwVcmTabsCanOpenNewTab.DoDoIt

class function TkwVcmTabsCanOpenNewTab.GetWordNameForRegister: AnsiString;
begin
 Result := 'vcm:tabs:CanOpenNewTab';
end;//TkwVcmTabsCanOpenNewTab.GetWordNameForRegister

function TkwVcmTabsCanOpenNewTab.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
//#UC START# *551544E2001A_D42D3E4F7AC2_var*
//#UC END# *551544E2001A_D42D3E4F7AC2_var*
begin
//#UC START# *551544E2001A_D42D3E4F7AC2_impl*
 !!! Needs to be implemented !!!
//#UC END# *551544E2001A_D42D3E4F7AC2_impl*
end;//TkwVcmTabsCanOpenNewTab.GetResultTypeInfo

function TkwVcmTabsCanOpenNewTab.GetAllParamsCount(const aCtx: TtfwContext): Integer;
//#UC START# *559687E6025A_D42D3E4F7AC2_var*
//#UC END# *559687E6025A_D42D3E4F7AC2_var*
begin
//#UC START# *559687E6025A_D42D3E4F7AC2_impl*
 !!! Needs to be implemented !!!
//#UC END# *559687E6025A_D42D3E4F7AC2_impl*
end;//TkwVcmTabsCanOpenNewTab.GetAllParamsCount

function TkwVcmTabsCanOpenNewTab.ParamsTypes: PTypeInfoArray;
//#UC START# *5617F4D00243_D42D3E4F7AC2_var*
//#UC END# *5617F4D00243_D42D3E4F7AC2_var*
begin
//#UC START# *5617F4D00243_D42D3E4F7AC2_impl*
 !!! Needs to be implemented !!!
//#UC END# *5617F4D00243_D42D3E4F7AC2_impl*
end;//TkwVcmTabsCanOpenNewTab.ParamsTypes

procedure TkwVcmTabsDuplicate.vcm_tabs_Duplicate(const aCtx: TtfwContext;
 aTabIndex: Integer);
 {* ���������� ����� ������� vcm:tabs:Duplicate }
//#UC START# *A4A5C2458E8A_25BDB3DFEC33_var*
//#UC END# *A4A5C2458E8A_25BDB3DFEC33_var*
begin
//#UC START# *A4A5C2458E8A_25BDB3DFEC33_impl*
 with Tl3TabbedContainersDispatcher.Instance do
  CloneTab(GetActiveTabbedContainer.Tabs[aTabIndex]);
//#UC END# *A4A5C2458E8A_25BDB3DFEC33_impl*
end;//TkwVcmTabsDuplicate.vcm_tabs_Duplicate

procedure TkwVcmTabsDuplicate.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_25BDB3DFEC33_var*
//#UC END# *4DAEEDE10285_25BDB3DFEC33_var*
begin
//#UC START# *4DAEEDE10285_25BDB3DFEC33_impl*
 !!! Needs to be implemented !!!
//#UC END# *4DAEEDE10285_25BDB3DFEC33_impl*
end;//TkwVcmTabsDuplicate.DoDoIt

class function TkwVcmTabsDuplicate.GetWordNameForRegister: AnsiString;
begin
 Result := 'vcm:tabs:Duplicate';
end;//TkwVcmTabsDuplicate.GetWordNameForRegister

function TkwVcmTabsDuplicate.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
//#UC START# *551544E2001A_25BDB3DFEC33_var*
//#UC END# *551544E2001A_25BDB3DFEC33_var*
begin
//#UC START# *551544E2001A_25BDB3DFEC33_impl*
 !!! Needs to be implemented !!!
//#UC END# *551544E2001A_25BDB3DFEC33_impl*
end;//TkwVcmTabsDuplicate.GetResultTypeInfo

function TkwVcmTabsDuplicate.GetAllParamsCount(const aCtx: TtfwContext): Integer;
//#UC START# *559687E6025A_25BDB3DFEC33_var*
//#UC END# *559687E6025A_25BDB3DFEC33_var*
begin
//#UC START# *559687E6025A_25BDB3DFEC33_impl*
 !!! Needs to be implemented !!!
//#UC END# *559687E6025A_25BDB3DFEC33_impl*
end;//TkwVcmTabsDuplicate.GetAllParamsCount

function TkwVcmTabsDuplicate.ParamsTypes: PTypeInfoArray;
//#UC START# *5617F4D00243_25BDB3DFEC33_var*
//#UC END# *5617F4D00243_25BDB3DFEC33_var*
begin
//#UC START# *5617F4D00243_25BDB3DFEC33_impl*
 !!! Needs to be implemented !!!
//#UC END# *5617F4D00243_25BDB3DFEC33_impl*
end;//TkwVcmTabsDuplicate.ParamsTypes

function TkwVcmTabsCanDuplicate.vcm_tabs_CanDuplicate(const aCtx: TtfwContext;
 aTabIndex: Integer): Boolean;
 {* ���������� ����� ������� vcm:tabs:CanDuplicate }
//#UC START# *56B44CB5CD89_43C0563688C9_var*
//#UC END# *56B44CB5CD89_43C0563688C9_var*
begin
//#UC START# *56B44CB5CD89_43C0563688C9_impl*
 with Tl3TabbedContainersDispatcher.Instance do
  Result := CanCloneTab(GetActiveTabbedContainer.Tabs[aTabIndex]);
//#UC END# *56B44CB5CD89_43C0563688C9_impl*
end;//TkwVcmTabsCanDuplicate.vcm_tabs_CanDuplicate

procedure TkwVcmTabsCanDuplicate.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_43C0563688C9_var*
//#UC END# *4DAEEDE10285_43C0563688C9_var*
begin
//#UC START# *4DAEEDE10285_43C0563688C9_impl*
 !!! Needs to be implemented !!!
//#UC END# *4DAEEDE10285_43C0563688C9_impl*
end;//TkwVcmTabsCanDuplicate.DoDoIt

class function TkwVcmTabsCanDuplicate.GetWordNameForRegister: AnsiString;
begin
 Result := 'vcm:tabs:CanDuplicate';
end;//TkwVcmTabsCanDuplicate.GetWordNameForRegister

function TkwVcmTabsCanDuplicate.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
//#UC START# *551544E2001A_43C0563688C9_var*
//#UC END# *551544E2001A_43C0563688C9_var*
begin
//#UC START# *551544E2001A_43C0563688C9_impl*
 !!! Needs to be implemented !!!
//#UC END# *551544E2001A_43C0563688C9_impl*
end;//TkwVcmTabsCanDuplicate.GetResultTypeInfo

function TkwVcmTabsCanDuplicate.GetAllParamsCount(const aCtx: TtfwContext): Integer;
//#UC START# *559687E6025A_43C0563688C9_var*
//#UC END# *559687E6025A_43C0563688C9_var*
begin
//#UC START# *559687E6025A_43C0563688C9_impl*
 !!! Needs to be implemented !!!
//#UC END# *559687E6025A_43C0563688C9_impl*
end;//TkwVcmTabsCanDuplicate.GetAllParamsCount

function TkwVcmTabsCanDuplicate.ParamsTypes: PTypeInfoArray;
//#UC START# *5617F4D00243_43C0563688C9_var*
//#UC END# *5617F4D00243_43C0563688C9_var*
begin
//#UC START# *5617F4D00243_43C0563688C9_impl*
 !!! Needs to be implemented !!!
//#UC END# *5617F4D00243_43C0563688C9_impl*
end;//TkwVcmTabsCanDuplicate.ParamsTypes

procedure TkwVcmTabsReopen.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_C449AC698640_var*
//#UC END# *4DAEEDE10285_C449AC698640_var*
begin
//#UC START# *4DAEEDE10285_C449AC698640_impl*
 with Tl3TabbedContainersDispatcher.Instance do
  ReopenClosedTab(GetActiveTabbedContainer);
//#UC END# *4DAEEDE10285_C449AC698640_impl*
end;//TkwVcmTabsReopen.DoDoIt

class function TkwVcmTabsReopen.GetWordNameForRegister: AnsiString;
begin
 Result := 'vcm:tabs:Reopen';
end;//TkwVcmTabsReopen.GetWordNameForRegister

function TkwVcmTabsReopen.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
//#UC START# *551544E2001A_C449AC698640_var*
//#UC END# *551544E2001A_C449AC698640_var*
begin
//#UC START# *551544E2001A_C449AC698640_impl*
 !!! Needs to be implemented !!!
//#UC END# *551544E2001A_C449AC698640_impl*
end;//TkwVcmTabsReopen.GetResultTypeInfo

function TkwVcmTabsReopen.GetAllParamsCount(const aCtx: TtfwContext): Integer;
//#UC START# *559687E6025A_C449AC698640_var*
//#UC END# *559687E6025A_C449AC698640_var*
begin
//#UC START# *559687E6025A_C449AC698640_impl*
 !!! Needs to be implemented !!!
//#UC END# *559687E6025A_C449AC698640_impl*
end;//TkwVcmTabsReopen.GetAllParamsCount

function TkwVcmTabsCanReopen.vcm_tabs_CanReopen(const aCtx: TtfwContext): Boolean;
 {* ���������� ����� ������� vcm:tabs:CanReopen }
//#UC START# *6BFDCF32FEC5_B8D479345CBE_var*
//#UC END# *6BFDCF32FEC5_B8D479345CBE_var*
begin
//#UC START# *6BFDCF32FEC5_B8D479345CBE_impl*
 with Tl3TabbedContainersDispatcher.Instance do
  Result := CanReopenClosedTab(GetActiveTabbedContainer);
//#UC END# *6BFDCF32FEC5_B8D479345CBE_impl*
end;//TkwVcmTabsCanReopen.vcm_tabs_CanReopen

procedure TkwVcmTabsCanReopen.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_B8D479345CBE_var*
//#UC END# *4DAEEDE10285_B8D479345CBE_var*
begin
//#UC START# *4DAEEDE10285_B8D479345CBE_impl*
 !!! Needs to be implemented !!!
//#UC END# *4DAEEDE10285_B8D479345CBE_impl*
end;//TkwVcmTabsCanReopen.DoDoIt

class function TkwVcmTabsCanReopen.GetWordNameForRegister: AnsiString;
begin
 Result := 'vcm:tabs:CanReopen';
end;//TkwVcmTabsCanReopen.GetWordNameForRegister

function TkwVcmTabsCanReopen.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
//#UC START# *551544E2001A_B8D479345CBE_var*
//#UC END# *551544E2001A_B8D479345CBE_var*
begin
//#UC START# *551544E2001A_B8D479345CBE_impl*
 !!! Needs to be implemented !!!
//#UC END# *551544E2001A_B8D479345CBE_impl*
end;//TkwVcmTabsCanReopen.GetResultTypeInfo

function TkwVcmTabsCanReopen.GetAllParamsCount(const aCtx: TtfwContext): Integer;
//#UC START# *559687E6025A_B8D479345CBE_var*
//#UC END# *559687E6025A_B8D479345CBE_var*
begin
//#UC START# *559687E6025A_B8D479345CBE_impl*
 !!! Needs to be implemented !!!
//#UC END# *559687E6025A_B8D479345CBE_impl*
end;//TkwVcmTabsCanReopen.GetAllParamsCount

function TkwVcmTabsCanReopen.ParamsTypes: PTypeInfoArray;
//#UC START# *5617F4D00243_B8D479345CBE_var*
//#UC END# *5617F4D00243_B8D479345CBE_var*
begin
//#UC START# *5617F4D00243_B8D479345CBE_impl*
 !!! Needs to be implemented !!!
//#UC END# *5617F4D00243_B8D479345CBE_impl*
end;//TkwVcmTabsCanReopen.ParamsTypes

function TkwVcmTabsGetIconIndex.vcm_tabs_GetIconIndex(const aCtx: TtfwContext;
 aTabIndex: Integer): Integer;
 {* ���������� ����� ������� vcm:tabs:GetIconIndex }
//#UC START# *5F70A124CAC6_1F0AD0312C05_var*
//#UC END# *5F70A124CAC6_1F0AD0312C05_var*
begin
//#UC START# *5F70A124CAC6_1F0AD0312C05_impl*
 with Tl3TabbedContainersDispatcher.Instance do
  Result := GetTabIcon(GetActiveTabbedContainer.Tabs[aTabIndex]);
//#UC END# *5F70A124CAC6_1F0AD0312C05_impl*
end;//TkwVcmTabsGetIconIndex.vcm_tabs_GetIconIndex

procedure TkwVcmTabsGetIconIndex.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_1F0AD0312C05_var*
//#UC END# *4DAEEDE10285_1F0AD0312C05_var*
begin
//#UC START# *4DAEEDE10285_1F0AD0312C05_impl*
 !!! Needs to be implemented !!!
//#UC END# *4DAEEDE10285_1F0AD0312C05_impl*
end;//TkwVcmTabsGetIconIndex.DoDoIt

class function TkwVcmTabsGetIconIndex.GetWordNameForRegister: AnsiString;
begin
 Result := 'vcm:tabs:GetIconIndex';
end;//TkwVcmTabsGetIconIndex.GetWordNameForRegister

function TkwVcmTabsGetIconIndex.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
//#UC START# *551544E2001A_1F0AD0312C05_var*
//#UC END# *551544E2001A_1F0AD0312C05_var*
begin
//#UC START# *551544E2001A_1F0AD0312C05_impl*
 !!! Needs to be implemented !!!
//#UC END# *551544E2001A_1F0AD0312C05_impl*
end;//TkwVcmTabsGetIconIndex.GetResultTypeInfo

function TkwVcmTabsGetIconIndex.GetAllParamsCount(const aCtx: TtfwContext): Integer;
//#UC START# *559687E6025A_1F0AD0312C05_var*
//#UC END# *559687E6025A_1F0AD0312C05_var*
begin
//#UC START# *559687E6025A_1F0AD0312C05_impl*
 !!! Needs to be implemented !!!
//#UC END# *559687E6025A_1F0AD0312C05_impl*
end;//TkwVcmTabsGetIconIndex.GetAllParamsCount

function TkwVcmTabsGetIconIndex.ParamsTypes: PTypeInfoArray;
//#UC START# *5617F4D00243_1F0AD0312C05_var*
//#UC END# *5617F4D00243_1F0AD0312C05_var*
begin
//#UC START# *5617F4D00243_1F0AD0312C05_impl*
 !!! Needs to be implemented !!!
//#UC END# *5617F4D00243_1F0AD0312C05_impl*
end;//TkwVcmTabsGetIconIndex.ParamsTypes

function TkwVcmTabsGetCaption.vcm_tabs_GetCaption(const aCtx: TtfwContext;
 aTabIndex: Integer): AnsiString;
 {* ���������� ����� ������� vcm:tabs:GetCaption }
//#UC START# *8DA64904FF22_27CA2643776F_var*
//#UC END# *8DA64904FF22_27CA2643776F_var*
begin
//#UC START# *8DA64904FF22_27CA2643776F_impl*
 with Tl3TabbedContainersDispatcher.Instance do
  Result := GetTabCaption(GetActiveTabbedContainer.TabByVisibleIndex[aTabIndex]);
//#UC END# *8DA64904FF22_27CA2643776F_impl*
end;//TkwVcmTabsGetCaption.vcm_tabs_GetCaption

procedure TkwVcmTabsGetCaption.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_27CA2643776F_var*
//#UC END# *4DAEEDE10285_27CA2643776F_var*
begin
//#UC START# *4DAEEDE10285_27CA2643776F_impl*
 !!! Needs to be implemented !!!
//#UC END# *4DAEEDE10285_27CA2643776F_impl*
end;//TkwVcmTabsGetCaption.DoDoIt

class function TkwVcmTabsGetCaption.GetWordNameForRegister: AnsiString;
begin
 Result := 'vcm:tabs:GetCaption';
end;//TkwVcmTabsGetCaption.GetWordNameForRegister

function TkwVcmTabsGetCaption.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
//#UC START# *551544E2001A_27CA2643776F_var*
//#UC END# *551544E2001A_27CA2643776F_var*
begin
//#UC START# *551544E2001A_27CA2643776F_impl*
 !!! Needs to be implemented !!!
//#UC END# *551544E2001A_27CA2643776F_impl*
end;//TkwVcmTabsGetCaption.GetResultTypeInfo

function TkwVcmTabsGetCaption.GetAllParamsCount(const aCtx: TtfwContext): Integer;
//#UC START# *559687E6025A_27CA2643776F_var*
//#UC END# *559687E6025A_27CA2643776F_var*
begin
//#UC START# *559687E6025A_27CA2643776F_impl*
 !!! Needs to be implemented !!!
//#UC END# *559687E6025A_27CA2643776F_impl*
end;//TkwVcmTabsGetCaption.GetAllParamsCount

function TkwVcmTabsGetCaption.ParamsTypes: PTypeInfoArray;
//#UC START# *5617F4D00243_27CA2643776F_var*
//#UC END# *5617F4D00243_27CA2643776F_var*
begin
//#UC START# *5617F4D00243_27CA2643776F_impl*
 !!! Needs to be implemented !!!
//#UC END# *5617F4D00243_27CA2643776F_impl*
end;//TkwVcmTabsGetCaption.ParamsTypes

function TkwVcmTabsCanUndock.vcm_tabs_CanUndock(const aCtx: TtfwContext;
 aTabIndex: Integer): Boolean;
 {* ���������� ����� ������� vcm:tabs:CanUndock }
//#UC START# *4B3F5E37FD4C_C1A0F850A859_var*
//#UC END# *4B3F5E37FD4C_C1A0F850A859_var*
begin
//#UC START# *4B3F5E37FD4C_C1A0F850A859_impl*
 with Tl3TabbedContainersDispatcher.Instance.GetActiveTabbedContainer do
  Result := CanUndockFormFromTab(aTabIndex);
//#UC END# *4B3F5E37FD4C_C1A0F850A859_impl*
end;//TkwVcmTabsCanUndock.vcm_tabs_CanUndock

procedure TkwVcmTabsCanUndock.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_C1A0F850A859_var*
//#UC END# *4DAEEDE10285_C1A0F850A859_var*
begin
//#UC START# *4DAEEDE10285_C1A0F850A859_impl*
 !!! Needs to be implemented !!!
//#UC END# *4DAEEDE10285_C1A0F850A859_impl*
end;//TkwVcmTabsCanUndock.DoDoIt

class function TkwVcmTabsCanUndock.GetWordNameForRegister: AnsiString;
begin
 Result := 'vcm:tabs:CanUndock';
end;//TkwVcmTabsCanUndock.GetWordNameForRegister

function TkwVcmTabsCanUndock.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
//#UC START# *551544E2001A_C1A0F850A859_var*
//#UC END# *551544E2001A_C1A0F850A859_var*
begin
//#UC START# *551544E2001A_C1A0F850A859_impl*
 !!! Needs to be implemented !!!
//#UC END# *551544E2001A_C1A0F850A859_impl*
end;//TkwVcmTabsCanUndock.GetResultTypeInfo

function TkwVcmTabsCanUndock.GetAllParamsCount(const aCtx: TtfwContext): Integer;
//#UC START# *559687E6025A_C1A0F850A859_var*
//#UC END# *559687E6025A_C1A0F850A859_var*
begin
//#UC START# *559687E6025A_C1A0F850A859_impl*
 !!! Needs to be implemented !!!
//#UC END# *559687E6025A_C1A0F850A859_impl*
end;//TkwVcmTabsCanUndock.GetAllParamsCount

function TkwVcmTabsCanUndock.ParamsTypes: PTypeInfoArray;
//#UC START# *5617F4D00243_C1A0F850A859_var*
//#UC END# *5617F4D00243_C1A0F850A859_var*
begin
//#UC START# *5617F4D00243_C1A0F850A859_impl*
 !!! Needs to be implemented !!!
//#UC END# *5617F4D00243_C1A0F850A859_impl*
end;//TkwVcmTabsCanUndock.ParamsTypes

procedure TkwVcmTabsUndock.vcm_tabs_Undock(const aCtx: TtfwContext;
 aTabIndex: Integer);
 {* ���������� ����� ������� vcm:tabs:Undock }
//#UC START# *38AB4FF25C84_DB5208478590_var*
//#UC END# *38AB4FF25C84_DB5208478590_var*
begin
//#UC START# *38AB4FF25C84_DB5208478590_impl*
 with Tl3TabbedContainersDispatcher.Instance.GetActiveTabbedContainer do
  UndockFormFromTab(aTabIndex);
//#UC END# *38AB4FF25C84_DB5208478590_impl*
end;//TkwVcmTabsUndock.vcm_tabs_Undock

procedure TkwVcmTabsUndock.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_DB5208478590_var*
//#UC END# *4DAEEDE10285_DB5208478590_var*
begin
//#UC START# *4DAEEDE10285_DB5208478590_impl*
 !!! Needs to be implemented !!!
//#UC END# *4DAEEDE10285_DB5208478590_impl*
end;//TkwVcmTabsUndock.DoDoIt

class function TkwVcmTabsUndock.GetWordNameForRegister: AnsiString;
begin
 Result := 'vcm:tabs:Undock';
end;//TkwVcmTabsUndock.GetWordNameForRegister

function TkwVcmTabsUndock.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
//#UC START# *551544E2001A_DB5208478590_var*
//#UC END# *551544E2001A_DB5208478590_var*
begin
//#UC START# *551544E2001A_DB5208478590_impl*
 !!! Needs to be implemented !!!
//#UC END# *551544E2001A_DB5208478590_impl*
end;//TkwVcmTabsUndock.GetResultTypeInfo

function TkwVcmTabsUndock.GetAllParamsCount(const aCtx: TtfwContext): Integer;
//#UC START# *559687E6025A_DB5208478590_var*
//#UC END# *559687E6025A_DB5208478590_var*
begin
//#UC START# *559687E6025A_DB5208478590_impl*
 !!! Needs to be implemented !!!
//#UC END# *559687E6025A_DB5208478590_impl*
end;//TkwVcmTabsUndock.GetAllParamsCount

function TkwVcmTabsUndock.ParamsTypes: PTypeInfoArray;
//#UC START# *5617F4D00243_DB5208478590_var*
//#UC END# *5617F4D00243_DB5208478590_var*
begin
//#UC START# *5617F4D00243_DB5208478590_impl*
 !!! Needs to be implemented !!!
//#UC END# *5617F4D00243_DB5208478590_impl*
end;//TkwVcmTabsUndock.ParamsTypes

initialization
 TkwVcmTabsCloseCurrent.RegisterInEngine;
 {* ����������� vcm_tabs_CloseCurrent }
 TkwVcmTabsClose.RegisterInEngine;
 {* ����������� vcm_tabs_Close }
 TkwVcmTabsCloseAllButCurrent.RegisterInEngine;
 {* ����������� vcm_tabs_CloseAllButCurrent }
 TkwVcmTabsActive.RegisterInEngine;
 {* ����������� vcm_tabs_Active }
 TkwVcmTabsSetActive.RegisterInEngine;
 {* ����������� vcm_tabs_SetActive }
 TkwVcmTabsCount.RegisterInEngine;
 {* ����������� vcm_tabs_Count }
 TkwVcmTabsOpenNewTab.RegisterInEngine;
 {* ����������� vcm_tabs_OpenNewTab }
 TkwVcmTabsCanOpenNewTab.RegisterInEngine;
 {* ����������� vcm_tabs_CanOpenNewTab }
 TkwVcmTabsDuplicate.RegisterInEngine;
 {* ����������� vcm_tabs_Duplicate }
 TkwVcmTabsCanDuplicate.RegisterInEngine;
 {* ����������� vcm_tabs_CanDuplicate }
 TkwVcmTabsReopen.RegisterInEngine;
 {* ����������� vcm_tabs_Reopen }
 TkwVcmTabsCanReopen.RegisterInEngine;
 {* ����������� vcm_tabs_CanReopen }
 TkwVcmTabsGetIconIndex.RegisterInEngine;
 {* ����������� vcm_tabs_GetIconIndex }
 TkwVcmTabsGetCaption.RegisterInEngine;
 {* ����������� vcm_tabs_GetCaption }
 TkwVcmTabsCanUndock.RegisterInEngine;
 {* ����������� vcm_tabs_CanUndock }
 TkwVcmTabsUndock.RegisterInEngine;
 {* ����������� vcm_tabs_Undock }
 TtfwTypeRegistrator.RegisterType(@tfw_tiStruct);
 {* ����������� ���� TtfwContext }
 TtfwTypeRegistrator.RegisterType(TypeInfo(Integer));
 {* ����������� ���� Integer }
 TtfwTypeRegistrator.RegisterType(TypeInfo(Boolean));
 {* ����������� ���� Boolean }
 TtfwTypeRegistrator.RegisterType(@tfw_tiString);
 {* ����������� ���� String }
{$IfEnd} // NOT Defined(NoVCM) AND NOT Defined(NoScripts) AND NOT Defined(NoTabs)

end.
