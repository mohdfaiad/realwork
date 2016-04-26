unit ListKeywordsPack;
 {* ����� ���� ������� ��� ������� � ����������� ��������� ����� List }

// ������: "w:\garant6x\implementation\Garant\GbaNemesis\View\List\ListKeywordsPack.pas"
// ���������: "ScriptKeywordsPack"
// ������� ������: "ListKeywordsPack" MUID: (0F9EB2C7D445)

{$Include w:\garant6x\implementation\Garant\nsDefine.inc}

interface

{$If NOT Defined(Admin) AND NOT Defined(Monitorings) AND NOT Defined(NoScripts)}
uses
 l3IntfUses
 {$If Defined(Nemesis)}
 , nscRemindersLine
 {$IfEnd} // Defined(Nemesis)
 {$If Defined(Nemesis)}
 , nscReminder
 {$IfEnd} // Defined(Nemesis)
 {$If Defined(Nemesis)}
 , nscEditor
 {$IfEnd} // Defined(Nemesis)
 , vtPanel
 , nscDocumentListTreeView
 {$If Defined(Nemesis)}
 , nscContextFilter
 {$IfEnd} // Defined(Nemesis)
 , vtFocusLabel
 , bsTypes
 , l3TreeInterfaces
;
{$IfEnd} // NOT Defined(Admin) AND NOT Defined(Monitorings) AND NOT Defined(NoScripts)

implementation

{$If NOT Defined(Admin) AND NOT Defined(Monitorings) AND NOT Defined(NoScripts)}
uses
 l3ImplUses
 , List_Form
 , tfwControlString
 {$If NOT Defined(NoVCL)}
 , kwBynameControlPush
 {$IfEnd} // NOT Defined(NoVCL)
 , tfwScriptingInterfaces
 , tfwPropertyLike
 , tfwTypeInfo
 , TypInfo
 , TtfwClassRef_Proxy
 , SysUtils
 , tfwTypeRegistrator
 , tfwScriptingTypes
;

type
 Tkw_Form_List = {final} class(TtfwControlString)
  {* ����� ������� ��� �������������� ����� List
----
*������ �������������*:
[code]
'aControl' �����::List TryFocus ASSERT
[code] }
  protected
   function GetString: AnsiString; override;
   class function GetWordNameForRegister: AnsiString; override;
 end;//Tkw_Form_List

 Tkw_List_Control_RemindersLine = {final} class(TtfwControlString)
  {* ����� ������� ��� �������������� �������� RemindersLine
----
*������ �������������*:
[code]
�������::RemindersLine TryFocus ASSERT
[code] }
  protected
   function GetString: AnsiString; override;
   class procedure RegisterInEngine; override;
   class function GetWordNameForRegister: AnsiString; override;
 end;//Tkw_List_Control_RemindersLine

 Tkw_List_Control_RemindersLine_Push = {final} class({$If NOT Defined(NoVCL)}
 TkwBynameControlPush
 {$IfEnd} // NOT Defined(NoVCL)
 )
  {* ����� ������� ��� �������� RemindersLine
----
*������ �������������*:
[code]
�������::RemindersLine:push pop:control:SetFocus ASSERT
[code] }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
 end;//Tkw_List_Control_RemindersLine_Push

 Tkw_List_Control_remListFiltered = {final} class(TtfwControlString)
  {* ����� ������� ��� �������������� �������� remListFiltered
----
*������ �������������*:
[code]
�������::remListFiltered TryFocus ASSERT
[code] }
  protected
   function GetString: AnsiString; override;
   class procedure RegisterInEngine; override;
   class function GetWordNameForRegister: AnsiString; override;
 end;//Tkw_List_Control_remListFiltered

 Tkw_List_Control_remListFiltered_Push = {final} class({$If NOT Defined(NoVCL)}
 TkwBynameControlPush
 {$IfEnd} // NOT Defined(NoVCL)
 )
  {* ����� ������� ��� �������� remListFiltered
----
*������ �������������*:
[code]
�������::remListFiltered:push pop:control:SetFocus ASSERT
[code] }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
 end;//Tkw_List_Control_remListFiltered_Push

 Tkw_List_Control_remListModified = {final} class(TtfwControlString)
  {* ����� ������� ��� �������������� �������� remListModified
----
*������ �������������*:
[code]
�������::remListModified TryFocus ASSERT
[code] }
  protected
   function GetString: AnsiString; override;
   class procedure RegisterInEngine; override;
   class function GetWordNameForRegister: AnsiString; override;
 end;//Tkw_List_Control_remListModified

 Tkw_List_Control_remListModified_Push = {final} class({$If NOT Defined(NoVCL)}
 TkwBynameControlPush
 {$IfEnd} // NOT Defined(NoVCL)
 )
  {* ����� ������� ��� �������� remListModified
----
*������ �������������*:
[code]
�������::remListModified:push pop:control:SetFocus ASSERT
[code] }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
 end;//Tkw_List_Control_remListModified_Push

 Tkw_List_Control_remTimeMachineWarning = {final} class(TtfwControlString)
  {* ����� ������� ��� �������������� �������� remTimeMachineWarning
----
*������ �������������*:
[code]
�������::remTimeMachineWarning TryFocus ASSERT
[code] }
  protected
   function GetString: AnsiString; override;
   class procedure RegisterInEngine; override;
   class function GetWordNameForRegister: AnsiString; override;
 end;//Tkw_List_Control_remTimeMachineWarning

 Tkw_List_Control_remTimeMachineWarning_Push = {final} class({$If NOT Defined(NoVCL)}
 TkwBynameControlPush
 {$IfEnd} // NOT Defined(NoVCL)
 )
  {* ����� ������� ��� �������� remTimeMachineWarning
----
*������ �������������*:
[code]
�������::remTimeMachineWarning:push pop:control:SetFocus ASSERT
[code] }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
 end;//Tkw_List_Control_remTimeMachineWarning_Push

 Tkw_List_Control_EmptyListEditor = {final} class(TtfwControlString)
  {* ����� ������� ��� �������������� �������� EmptyListEditor
----
*������ �������������*:
[code]
�������::EmptyListEditor TryFocus ASSERT
[code] }
  protected
   function GetString: AnsiString; override;
   class procedure RegisterInEngine; override;
   class function GetWordNameForRegister: AnsiString; override;
 end;//Tkw_List_Control_EmptyListEditor

 Tkw_List_Control_EmptyListEditor_Push = {final} class({$If NOT Defined(NoVCL)}
 TkwBynameControlPush
 {$IfEnd} // NOT Defined(NoVCL)
 )
  {* ����� ������� ��� �������� EmptyListEditor
----
*������ �������������*:
[code]
�������::EmptyListEditor:push pop:control:SetFocus ASSERT
[code] }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
 end;//Tkw_List_Control_EmptyListEditor_Push

 Tkw_List_Control_ListPanel = {final} class(TtfwControlString)
  {* ����� ������� ��� �������������� �������� ListPanel
----
*������ �������������*:
[code]
�������::ListPanel TryFocus ASSERT
[code] }
  protected
   function GetString: AnsiString; override;
   class procedure RegisterInEngine; override;
   class function GetWordNameForRegister: AnsiString; override;
 end;//Tkw_List_Control_ListPanel

 Tkw_List_Control_ListPanel_Push = {final} class({$If NOT Defined(NoVCL)}
 TkwBynameControlPush
 {$IfEnd} // NOT Defined(NoVCL)
 )
  {* ����� ������� ��� �������� ListPanel
----
*������ �������������*:
[code]
�������::ListPanel:push pop:control:SetFocus ASSERT
[code] }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
 end;//Tkw_List_Control_ListPanel_Push

 Tkw_List_Control_tvList = {final} class(TtfwControlString)
  {* ����� ������� ��� �������������� �������� tvList
----
*������ �������������*:
[code]
�������::tvList TryFocus ASSERT
[code] }
  protected
   function GetString: AnsiString; override;
   class procedure RegisterInEngine; override;
   class function GetWordNameForRegister: AnsiString; override;
 end;//Tkw_List_Control_tvList

 Tkw_List_Control_tvList_Push = {final} class({$If NOT Defined(NoVCL)}
 TkwBynameControlPush
 {$IfEnd} // NOT Defined(NoVCL)
 )
  {* ����� ������� ��� �������� tvList
----
*������ �������������*:
[code]
�������::tvList:push pop:control:SetFocus ASSERT
[code] }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
 end;//Tkw_List_Control_tvList_Push

 Tkw_List_Control_cfList = {final} class(TtfwControlString)
  {* ����� ������� ��� �������������� �������� cfList
----
*������ �������������*:
[code]
�������::cfList TryFocus ASSERT
[code] }
  protected
   function GetString: AnsiString; override;
   class procedure RegisterInEngine; override;
   class function GetWordNameForRegister: AnsiString; override;
 end;//Tkw_List_Control_cfList

 Tkw_List_Control_cfList_Push = {final} class({$If NOT Defined(NoVCL)}
 TkwBynameControlPush
 {$IfEnd} // NOT Defined(NoVCL)
 )
  {* ����� ������� ��� �������� cfList
----
*������ �������������*:
[code]
�������::cfList:push pop:control:SetFocus ASSERT
[code] }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
 end;//Tkw_List_Control_cfList_Push

 Tkw_List_Control_ExSearchPanel = {final} class(TtfwControlString)
  {* ����� ������� ��� �������������� �������� ExSearchPanel
----
*������ �������������*:
[code]
�������::ExSearchPanel TryFocus ASSERT
[code] }
  protected
   function GetString: AnsiString; override;
   class procedure RegisterInEngine; override;
   class function GetWordNameForRegister: AnsiString; override;
 end;//Tkw_List_Control_ExSearchPanel

 Tkw_List_Control_ExSearchPanel_Push = {final} class({$If NOT Defined(NoVCL)}
 TkwBynameControlPush
 {$IfEnd} // NOT Defined(NoVCL)
 )
  {* ����� ������� ��� �������� ExSearchPanel
----
*������ �������������*:
[code]
�������::ExSearchPanel:push pop:control:SetFocus ASSERT
[code] }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
 end;//Tkw_List_Control_ExSearchPanel_Push

 Tkw_List_Control_ExSearchLabel = {final} class(TtfwControlString)
  {* ����� ������� ��� �������������� �������� ExSearchLabel
----
*������ �������������*:
[code]
�������::ExSearchLabel TryFocus ASSERT
[code] }
  protected
   function GetString: AnsiString; override;
   class procedure RegisterInEngine; override;
   class function GetWordNameForRegister: AnsiString; override;
 end;//Tkw_List_Control_ExSearchLabel

 Tkw_List_Control_ExSearchLabel_Push = {final} class({$If NOT Defined(NoVCL)}
 TkwBynameControlPush
 {$IfEnd} // NOT Defined(NoVCL)
 )
  {* ����� ������� ��� �������� ExSearchLabel
----
*������ �������������*:
[code]
�������::ExSearchLabel:push pop:control:SetFocus ASSERT
[code] }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
 end;//Tkw_List_Control_ExSearchLabel_Push

 TkwEfListRemindersLine = {final} class(TtfwPropertyLike)
  {* ����� ������� .TefList.RemindersLine
[panel]������� RemindersLine ����� TefList[panel]
*��� ����������:* TnscRemindersLine
*������:*
[code]
OBJECT VAR l_TnscRemindersLine
 aefList .TefList.RemindersLine >>> l_TnscRemindersLine
[code]  }
  private
   function RemindersLine(const aCtx: TtfwContext;
    aefList: TefList): TnscRemindersLine;
    {* ���������� ����� ������� .TefList.RemindersLine }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
  public
   procedure SetValuePrim(const aValue: TtfwStackValue;
    const aCtx: TtfwContext); override;
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
 end;//TkwEfListRemindersLine

 TkwEfListRemListFiltered = {final} class(TtfwPropertyLike)
  {* ����� ������� .TefList.remListFiltered
[panel]������� remListFiltered ����� TefList[panel]
*��� ����������:* TnscReminder
*������:*
[code]
OBJECT VAR l_TnscReminder
 aefList .TefList.remListFiltered >>> l_TnscReminder
[code]  }
  private
   function remListFiltered(const aCtx: TtfwContext;
    aefList: TefList): TnscReminder;
    {* ���������� ����� ������� .TefList.remListFiltered }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
  public
   procedure SetValuePrim(const aValue: TtfwStackValue;
    const aCtx: TtfwContext); override;
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
 end;//TkwEfListRemListFiltered

 TkwEfListRemListModified = {final} class(TtfwPropertyLike)
  {* ����� ������� .TefList.remListModified
[panel]������� remListModified ����� TefList[panel]
*��� ����������:* TnscReminder
*������:*
[code]
OBJECT VAR l_TnscReminder
 aefList .TefList.remListModified >>> l_TnscReminder
[code]  }
  private
   function remListModified(const aCtx: TtfwContext;
    aefList: TefList): TnscReminder;
    {* ���������� ����� ������� .TefList.remListModified }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
  public
   procedure SetValuePrim(const aValue: TtfwStackValue;
    const aCtx: TtfwContext); override;
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
 end;//TkwEfListRemListModified

 TkwEfListRemTimeMachineWarning = {final} class(TtfwPropertyLike)
  {* ����� ������� .TefList.remTimeMachineWarning
[panel]������� remTimeMachineWarning ����� TefList[panel]
*��� ����������:* TnscReminder
*������:*
[code]
OBJECT VAR l_TnscReminder
 aefList .TefList.remTimeMachineWarning >>> l_TnscReminder
[code]  }
  private
   function remTimeMachineWarning(const aCtx: TtfwContext;
    aefList: TefList): TnscReminder;
    {* ���������� ����� ������� .TefList.remTimeMachineWarning }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
  public
   procedure SetValuePrim(const aValue: TtfwStackValue;
    const aCtx: TtfwContext); override;
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
 end;//TkwEfListRemTimeMachineWarning

 TkwEfListEmptyListEditor = {final} class(TtfwPropertyLike)
  {* ����� ������� .TefList.EmptyListEditor
[panel]������� EmptyListEditor ����� TefList[panel]
*��� ����������:* TnscEditor
*������:*
[code]
OBJECT VAR l_TnscEditor
 aefList .TefList.EmptyListEditor >>> l_TnscEditor
[code]  }
  private
   function EmptyListEditor(const aCtx: TtfwContext;
    aefList: TefList): TnscEditor;
    {* ���������� ����� ������� .TefList.EmptyListEditor }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
  public
   procedure SetValuePrim(const aValue: TtfwStackValue;
    const aCtx: TtfwContext); override;
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
 end;//TkwEfListEmptyListEditor

 TkwEfListListPanel = {final} class(TtfwPropertyLike)
  {* ����� ������� .TefList.ListPanel
[panel]������� ListPanel ����� TefList[panel]
*��� ����������:* TvtPanel
*������:*
[code]
OBJECT VAR l_TvtPanel
 aefList .TefList.ListPanel >>> l_TvtPanel
[code]  }
  private
   function ListPanel(const aCtx: TtfwContext;
    aefList: TefList): TvtPanel;
    {* ���������� ����� ������� .TefList.ListPanel }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
  public
   procedure SetValuePrim(const aValue: TtfwStackValue;
    const aCtx: TtfwContext); override;
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
 end;//TkwEfListListPanel

 TkwEfListTvList = {final} class(TtfwPropertyLike)
  {* ����� ������� .TefList.tvList
[panel]������� tvList ����� TefList[panel]
*��� ����������:* TnscDocumentListTreeView
*������:*
[code]
OBJECT VAR l_TnscDocumentListTreeView
 aefList .TefList.tvList >>> l_TnscDocumentListTreeView
[code]  }
  private
   function tvList(const aCtx: TtfwContext;
    aefList: TefList): TnscDocumentListTreeView;
    {* ���������� ����� ������� .TefList.tvList }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
  public
   procedure SetValuePrim(const aValue: TtfwStackValue;
    const aCtx: TtfwContext); override;
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
 end;//TkwEfListTvList

 TkwEfListCfList = {final} class(TtfwPropertyLike)
  {* ����� ������� .TefList.cfList
[panel]������� cfList ����� TefList[panel]
*��� ����������:* TnscContextFilter
*������:*
[code]
OBJECT VAR l_TnscContextFilter
 aefList .TefList.cfList >>> l_TnscContextFilter
[code]  }
  private
   function cfList(const aCtx: TtfwContext;
    aefList: TefList): TnscContextFilter;
    {* ���������� ����� ������� .TefList.cfList }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
  public
   procedure SetValuePrim(const aValue: TtfwStackValue;
    const aCtx: TtfwContext); override;
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
 end;//TkwEfListCfList

 TkwEfListExSearchPanel = {final} class(TtfwPropertyLike)
  {* ����� ������� .TefList.ExSearchPanel
[panel]������� ExSearchPanel ����� TefList[panel]
*��� ����������:* TvtPanel
*������:*
[code]
OBJECT VAR l_TvtPanel
 aefList .TefList.ExSearchPanel >>> l_TvtPanel
[code]  }
  private
   function ExSearchPanel(const aCtx: TtfwContext;
    aefList: TefList): TvtPanel;
    {* ���������� ����� ������� .TefList.ExSearchPanel }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
  public
   procedure SetValuePrim(const aValue: TtfwStackValue;
    const aCtx: TtfwContext); override;
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
 end;//TkwEfListExSearchPanel

 TkwEfListExSearchLabel = {final} class(TtfwPropertyLike)
  {* ����� ������� .TefList.ExSearchLabel
[panel]������� ExSearchLabel ����� TefList[panel]
*��� ����������:* TvtFocusLabel
*������:*
[code]
OBJECT VAR l_TvtFocusLabel
 aefList .TefList.ExSearchLabel >>> l_TvtFocusLabel
[code]  }
  private
   function ExSearchLabel(const aCtx: TtfwContext;
    aefList: TefList): TvtFocusLabel;
    {* ���������� ����� ������� .TefList.ExSearchLabel }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
  public
   procedure SetValuePrim(const aValue: TtfwStackValue;
    const aCtx: TtfwContext); override;
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
 end;//TkwEfListExSearchLabel

function Tkw_Form_List.GetString: AnsiString;
begin
 Result := 'efList';
end;//Tkw_Form_List.GetString

class function Tkw_Form_List.GetWordNameForRegister: AnsiString;
begin
 Result := '�����::List';
end;//Tkw_Form_List.GetWordNameForRegister

function Tkw_List_Control_RemindersLine.GetString: AnsiString;
begin
 Result := 'RemindersLine';
end;//Tkw_List_Control_RemindersLine.GetString

class procedure Tkw_List_Control_RemindersLine.RegisterInEngine;
begin
 inherited;
 TtfwClassRef.Register(TnscRemindersLine);
end;//Tkw_List_Control_RemindersLine.RegisterInEngine

class function Tkw_List_Control_RemindersLine.GetWordNameForRegister: AnsiString;
begin
 Result := '�������::RemindersLine';
end;//Tkw_List_Control_RemindersLine.GetWordNameForRegister

procedure Tkw_List_Control_RemindersLine_Push.DoDoIt(const aCtx: TtfwContext);
begin
 aCtx.rEngine.PushString('RemindersLine');
 inherited;
end;//Tkw_List_Control_RemindersLine_Push.DoDoIt

class function Tkw_List_Control_RemindersLine_Push.GetWordNameForRegister: AnsiString;
begin
 Result := '�������::RemindersLine:push';
end;//Tkw_List_Control_RemindersLine_Push.GetWordNameForRegister

function Tkw_List_Control_remListFiltered.GetString: AnsiString;
begin
 Result := 'remListFiltered';
end;//Tkw_List_Control_remListFiltered.GetString

class procedure Tkw_List_Control_remListFiltered.RegisterInEngine;
begin
 inherited;
 TtfwClassRef.Register(TnscReminder);
end;//Tkw_List_Control_remListFiltered.RegisterInEngine

class function Tkw_List_Control_remListFiltered.GetWordNameForRegister: AnsiString;
begin
 Result := '�������::remListFiltered';
end;//Tkw_List_Control_remListFiltered.GetWordNameForRegister

procedure Tkw_List_Control_remListFiltered_Push.DoDoIt(const aCtx: TtfwContext);
begin
 aCtx.rEngine.PushString('remListFiltered');
 inherited;
end;//Tkw_List_Control_remListFiltered_Push.DoDoIt

class function Tkw_List_Control_remListFiltered_Push.GetWordNameForRegister: AnsiString;
begin
 Result := '�������::remListFiltered:push';
end;//Tkw_List_Control_remListFiltered_Push.GetWordNameForRegister

function Tkw_List_Control_remListModified.GetString: AnsiString;
begin
 Result := 'remListModified';
end;//Tkw_List_Control_remListModified.GetString

class procedure Tkw_List_Control_remListModified.RegisterInEngine;
begin
 inherited;
 TtfwClassRef.Register(TnscReminder);
end;//Tkw_List_Control_remListModified.RegisterInEngine

class function Tkw_List_Control_remListModified.GetWordNameForRegister: AnsiString;
begin
 Result := '�������::remListModified';
end;//Tkw_List_Control_remListModified.GetWordNameForRegister

procedure Tkw_List_Control_remListModified_Push.DoDoIt(const aCtx: TtfwContext);
begin
 aCtx.rEngine.PushString('remListModified');
 inherited;
end;//Tkw_List_Control_remListModified_Push.DoDoIt

class function Tkw_List_Control_remListModified_Push.GetWordNameForRegister: AnsiString;
begin
 Result := '�������::remListModified:push';
end;//Tkw_List_Control_remListModified_Push.GetWordNameForRegister

function Tkw_List_Control_remTimeMachineWarning.GetString: AnsiString;
begin
 Result := 'remTimeMachineWarning';
end;//Tkw_List_Control_remTimeMachineWarning.GetString

class procedure Tkw_List_Control_remTimeMachineWarning.RegisterInEngine;
begin
 inherited;
 TtfwClassRef.Register(TnscReminder);
end;//Tkw_List_Control_remTimeMachineWarning.RegisterInEngine

class function Tkw_List_Control_remTimeMachineWarning.GetWordNameForRegister: AnsiString;
begin
 Result := '�������::remTimeMachineWarning';
end;//Tkw_List_Control_remTimeMachineWarning.GetWordNameForRegister

procedure Tkw_List_Control_remTimeMachineWarning_Push.DoDoIt(const aCtx: TtfwContext);
begin
 aCtx.rEngine.PushString('remTimeMachineWarning');
 inherited;
end;//Tkw_List_Control_remTimeMachineWarning_Push.DoDoIt

class function Tkw_List_Control_remTimeMachineWarning_Push.GetWordNameForRegister: AnsiString;
begin
 Result := '�������::remTimeMachineWarning:push';
end;//Tkw_List_Control_remTimeMachineWarning_Push.GetWordNameForRegister

function Tkw_List_Control_EmptyListEditor.GetString: AnsiString;
begin
 Result := 'EmptyListEditor';
end;//Tkw_List_Control_EmptyListEditor.GetString

class procedure Tkw_List_Control_EmptyListEditor.RegisterInEngine;
begin
 inherited;
 TtfwClassRef.Register(TnscEditor);
end;//Tkw_List_Control_EmptyListEditor.RegisterInEngine

class function Tkw_List_Control_EmptyListEditor.GetWordNameForRegister: AnsiString;
begin
 Result := '�������::EmptyListEditor';
end;//Tkw_List_Control_EmptyListEditor.GetWordNameForRegister

procedure Tkw_List_Control_EmptyListEditor_Push.DoDoIt(const aCtx: TtfwContext);
begin
 aCtx.rEngine.PushString('EmptyListEditor');
 inherited;
end;//Tkw_List_Control_EmptyListEditor_Push.DoDoIt

class function Tkw_List_Control_EmptyListEditor_Push.GetWordNameForRegister: AnsiString;
begin
 Result := '�������::EmptyListEditor:push';
end;//Tkw_List_Control_EmptyListEditor_Push.GetWordNameForRegister

function Tkw_List_Control_ListPanel.GetString: AnsiString;
begin
 Result := 'ListPanel';
end;//Tkw_List_Control_ListPanel.GetString

class procedure Tkw_List_Control_ListPanel.RegisterInEngine;
begin
 inherited;
 TtfwClassRef.Register(TvtPanel);
end;//Tkw_List_Control_ListPanel.RegisterInEngine

class function Tkw_List_Control_ListPanel.GetWordNameForRegister: AnsiString;
begin
 Result := '�������::ListPanel';
end;//Tkw_List_Control_ListPanel.GetWordNameForRegister

procedure Tkw_List_Control_ListPanel_Push.DoDoIt(const aCtx: TtfwContext);
begin
 aCtx.rEngine.PushString('ListPanel');
 inherited;
end;//Tkw_List_Control_ListPanel_Push.DoDoIt

class function Tkw_List_Control_ListPanel_Push.GetWordNameForRegister: AnsiString;
begin
 Result := '�������::ListPanel:push';
end;//Tkw_List_Control_ListPanel_Push.GetWordNameForRegister

function Tkw_List_Control_tvList.GetString: AnsiString;
begin
 Result := 'tvList';
end;//Tkw_List_Control_tvList.GetString

class procedure Tkw_List_Control_tvList.RegisterInEngine;
begin
 inherited;
 TtfwClassRef.Register(TnscDocumentListTreeView);
end;//Tkw_List_Control_tvList.RegisterInEngine

class function Tkw_List_Control_tvList.GetWordNameForRegister: AnsiString;
begin
 Result := '�������::tvList';
end;//Tkw_List_Control_tvList.GetWordNameForRegister

procedure Tkw_List_Control_tvList_Push.DoDoIt(const aCtx: TtfwContext);
begin
 aCtx.rEngine.PushString('tvList');
 inherited;
end;//Tkw_List_Control_tvList_Push.DoDoIt

class function Tkw_List_Control_tvList_Push.GetWordNameForRegister: AnsiString;
begin
 Result := '�������::tvList:push';
end;//Tkw_List_Control_tvList_Push.GetWordNameForRegister

function Tkw_List_Control_cfList.GetString: AnsiString;
begin
 Result := 'cfList';
end;//Tkw_List_Control_cfList.GetString

class procedure Tkw_List_Control_cfList.RegisterInEngine;
begin
 inherited;
 TtfwClassRef.Register(TnscContextFilter);
end;//Tkw_List_Control_cfList.RegisterInEngine

class function Tkw_List_Control_cfList.GetWordNameForRegister: AnsiString;
begin
 Result := '�������::cfList';
end;//Tkw_List_Control_cfList.GetWordNameForRegister

procedure Tkw_List_Control_cfList_Push.DoDoIt(const aCtx: TtfwContext);
begin
 aCtx.rEngine.PushString('cfList');
 inherited;
end;//Tkw_List_Control_cfList_Push.DoDoIt

class function Tkw_List_Control_cfList_Push.GetWordNameForRegister: AnsiString;
begin
 Result := '�������::cfList:push';
end;//Tkw_List_Control_cfList_Push.GetWordNameForRegister

function Tkw_List_Control_ExSearchPanel.GetString: AnsiString;
begin
 Result := 'ExSearchPanel';
end;//Tkw_List_Control_ExSearchPanel.GetString

class procedure Tkw_List_Control_ExSearchPanel.RegisterInEngine;
begin
 inherited;
 TtfwClassRef.Register(TvtPanel);
end;//Tkw_List_Control_ExSearchPanel.RegisterInEngine

class function Tkw_List_Control_ExSearchPanel.GetWordNameForRegister: AnsiString;
begin
 Result := '�������::ExSearchPanel';
end;//Tkw_List_Control_ExSearchPanel.GetWordNameForRegister

procedure Tkw_List_Control_ExSearchPanel_Push.DoDoIt(const aCtx: TtfwContext);
begin
 aCtx.rEngine.PushString('ExSearchPanel');
 inherited;
end;//Tkw_List_Control_ExSearchPanel_Push.DoDoIt

class function Tkw_List_Control_ExSearchPanel_Push.GetWordNameForRegister: AnsiString;
begin
 Result := '�������::ExSearchPanel:push';
end;//Tkw_List_Control_ExSearchPanel_Push.GetWordNameForRegister

function Tkw_List_Control_ExSearchLabel.GetString: AnsiString;
begin
 Result := 'ExSearchLabel';
end;//Tkw_List_Control_ExSearchLabel.GetString

class procedure Tkw_List_Control_ExSearchLabel.RegisterInEngine;
begin
 inherited;
 TtfwClassRef.Register(TvtFocusLabel);
end;//Tkw_List_Control_ExSearchLabel.RegisterInEngine

class function Tkw_List_Control_ExSearchLabel.GetWordNameForRegister: AnsiString;
begin
 Result := '�������::ExSearchLabel';
end;//Tkw_List_Control_ExSearchLabel.GetWordNameForRegister

procedure Tkw_List_Control_ExSearchLabel_Push.DoDoIt(const aCtx: TtfwContext);
begin
 aCtx.rEngine.PushString('ExSearchLabel');
 inherited;
end;//Tkw_List_Control_ExSearchLabel_Push.DoDoIt

class function Tkw_List_Control_ExSearchLabel_Push.GetWordNameForRegister: AnsiString;
begin
 Result := '�������::ExSearchLabel:push';
end;//Tkw_List_Control_ExSearchLabel_Push.GetWordNameForRegister

function TkwEfListRemindersLine.RemindersLine(const aCtx: TtfwContext;
 aefList: TefList): TnscRemindersLine;
 {* ���������� ����� ������� .TefList.RemindersLine }
begin
 Result := aefList.RemindersLine;
end;//TkwEfListRemindersLine.RemindersLine

procedure TkwEfListRemindersLine.DoDoIt(const aCtx: TtfwContext);
var l_aefList: TefList;
begin
 try
  l_aefList := TefList(aCtx.rEngine.PopObjAs(TefList));
 except
  on E: Exception do
  begin
   RunnerError('������ ��� ��������� ��������� aefList: TefList : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushObj(RemindersLine(aCtx, l_aefList));
end;//TkwEfListRemindersLine.DoDoIt

procedure TkwEfListRemindersLine.SetValuePrim(const aValue: TtfwStackValue;
 const aCtx: TtfwContext);
begin
 RunnerError('������ ����������� �������� readonly �������� RemindersLine', aCtx);
end;//TkwEfListRemindersLine.SetValuePrim

function TkwEfListRemindersLine.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
begin
 Result := TypeInfo(TnscRemindersLine);
end;//TkwEfListRemindersLine.GetResultTypeInfo

function TkwEfListRemindersLine.GetAllParamsCount(const aCtx: TtfwContext): Integer;
begin
 Result := 1;
end;//TkwEfListRemindersLine.GetAllParamsCount

function TkwEfListRemindersLine.ParamsTypes: PTypeInfoArray;
begin
 Result := OpenTypesToTypes([TypeInfo(TefList)]);
end;//TkwEfListRemindersLine.ParamsTypes

class function TkwEfListRemindersLine.GetWordNameForRegister: AnsiString;
begin
 Result := '.TefList.RemindersLine';
end;//TkwEfListRemindersLine.GetWordNameForRegister

function TkwEfListRemListFiltered.remListFiltered(const aCtx: TtfwContext;
 aefList: TefList): TnscReminder;
 {* ���������� ����� ������� .TefList.remListFiltered }
begin
 Result := aefList.remListFiltered;
end;//TkwEfListRemListFiltered.remListFiltered

procedure TkwEfListRemListFiltered.DoDoIt(const aCtx: TtfwContext);
var l_aefList: TefList;
begin
 try
  l_aefList := TefList(aCtx.rEngine.PopObjAs(TefList));
 except
  on E: Exception do
  begin
   RunnerError('������ ��� ��������� ��������� aefList: TefList : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushObj(remListFiltered(aCtx, l_aefList));
end;//TkwEfListRemListFiltered.DoDoIt

procedure TkwEfListRemListFiltered.SetValuePrim(const aValue: TtfwStackValue;
 const aCtx: TtfwContext);
begin
 RunnerError('������ ����������� �������� readonly �������� remListFiltered', aCtx);
end;//TkwEfListRemListFiltered.SetValuePrim

function TkwEfListRemListFiltered.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
begin
 Result := TypeInfo(TnscReminder);
end;//TkwEfListRemListFiltered.GetResultTypeInfo

function TkwEfListRemListFiltered.GetAllParamsCount(const aCtx: TtfwContext): Integer;
begin
 Result := 1;
end;//TkwEfListRemListFiltered.GetAllParamsCount

function TkwEfListRemListFiltered.ParamsTypes: PTypeInfoArray;
begin
 Result := OpenTypesToTypes([TypeInfo(TefList)]);
end;//TkwEfListRemListFiltered.ParamsTypes

class function TkwEfListRemListFiltered.GetWordNameForRegister: AnsiString;
begin
 Result := '.TefList.remListFiltered';
end;//TkwEfListRemListFiltered.GetWordNameForRegister

function TkwEfListRemListModified.remListModified(const aCtx: TtfwContext;
 aefList: TefList): TnscReminder;
 {* ���������� ����� ������� .TefList.remListModified }
begin
 Result := aefList.remListModified;
end;//TkwEfListRemListModified.remListModified

procedure TkwEfListRemListModified.DoDoIt(const aCtx: TtfwContext);
var l_aefList: TefList;
begin
 try
  l_aefList := TefList(aCtx.rEngine.PopObjAs(TefList));
 except
  on E: Exception do
  begin
   RunnerError('������ ��� ��������� ��������� aefList: TefList : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushObj(remListModified(aCtx, l_aefList));
end;//TkwEfListRemListModified.DoDoIt

procedure TkwEfListRemListModified.SetValuePrim(const aValue: TtfwStackValue;
 const aCtx: TtfwContext);
begin
 RunnerError('������ ����������� �������� readonly �������� remListModified', aCtx);
end;//TkwEfListRemListModified.SetValuePrim

function TkwEfListRemListModified.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
begin
 Result := TypeInfo(TnscReminder);
end;//TkwEfListRemListModified.GetResultTypeInfo

function TkwEfListRemListModified.GetAllParamsCount(const aCtx: TtfwContext): Integer;
begin
 Result := 1;
end;//TkwEfListRemListModified.GetAllParamsCount

function TkwEfListRemListModified.ParamsTypes: PTypeInfoArray;
begin
 Result := OpenTypesToTypes([TypeInfo(TefList)]);
end;//TkwEfListRemListModified.ParamsTypes

class function TkwEfListRemListModified.GetWordNameForRegister: AnsiString;
begin
 Result := '.TefList.remListModified';
end;//TkwEfListRemListModified.GetWordNameForRegister

function TkwEfListRemTimeMachineWarning.remTimeMachineWarning(const aCtx: TtfwContext;
 aefList: TefList): TnscReminder;
 {* ���������� ����� ������� .TefList.remTimeMachineWarning }
begin
 Result := aefList.remTimeMachineWarning;
end;//TkwEfListRemTimeMachineWarning.remTimeMachineWarning

procedure TkwEfListRemTimeMachineWarning.DoDoIt(const aCtx: TtfwContext);
var l_aefList: TefList;
begin
 try
  l_aefList := TefList(aCtx.rEngine.PopObjAs(TefList));
 except
  on E: Exception do
  begin
   RunnerError('������ ��� ��������� ��������� aefList: TefList : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushObj(remTimeMachineWarning(aCtx, l_aefList));
end;//TkwEfListRemTimeMachineWarning.DoDoIt

procedure TkwEfListRemTimeMachineWarning.SetValuePrim(const aValue: TtfwStackValue;
 const aCtx: TtfwContext);
begin
 RunnerError('������ ����������� �������� readonly �������� remTimeMachineWarning', aCtx);
end;//TkwEfListRemTimeMachineWarning.SetValuePrim

function TkwEfListRemTimeMachineWarning.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
begin
 Result := TypeInfo(TnscReminder);
end;//TkwEfListRemTimeMachineWarning.GetResultTypeInfo

function TkwEfListRemTimeMachineWarning.GetAllParamsCount(const aCtx: TtfwContext): Integer;
begin
 Result := 1;
end;//TkwEfListRemTimeMachineWarning.GetAllParamsCount

function TkwEfListRemTimeMachineWarning.ParamsTypes: PTypeInfoArray;
begin
 Result := OpenTypesToTypes([TypeInfo(TefList)]);
end;//TkwEfListRemTimeMachineWarning.ParamsTypes

class function TkwEfListRemTimeMachineWarning.GetWordNameForRegister: AnsiString;
begin
 Result := '.TefList.remTimeMachineWarning';
end;//TkwEfListRemTimeMachineWarning.GetWordNameForRegister

function TkwEfListEmptyListEditor.EmptyListEditor(const aCtx: TtfwContext;
 aefList: TefList): TnscEditor;
 {* ���������� ����� ������� .TefList.EmptyListEditor }
begin
 Result := aefList.EmptyListEditor;
end;//TkwEfListEmptyListEditor.EmptyListEditor

procedure TkwEfListEmptyListEditor.DoDoIt(const aCtx: TtfwContext);
var l_aefList: TefList;
begin
 try
  l_aefList := TefList(aCtx.rEngine.PopObjAs(TefList));
 except
  on E: Exception do
  begin
   RunnerError('������ ��� ��������� ��������� aefList: TefList : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushObj(EmptyListEditor(aCtx, l_aefList));
end;//TkwEfListEmptyListEditor.DoDoIt

procedure TkwEfListEmptyListEditor.SetValuePrim(const aValue: TtfwStackValue;
 const aCtx: TtfwContext);
begin
 RunnerError('������ ����������� �������� readonly �������� EmptyListEditor', aCtx);
end;//TkwEfListEmptyListEditor.SetValuePrim

function TkwEfListEmptyListEditor.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
begin
 Result := TypeInfo(TnscEditor);
end;//TkwEfListEmptyListEditor.GetResultTypeInfo

function TkwEfListEmptyListEditor.GetAllParamsCount(const aCtx: TtfwContext): Integer;
begin
 Result := 1;
end;//TkwEfListEmptyListEditor.GetAllParamsCount

function TkwEfListEmptyListEditor.ParamsTypes: PTypeInfoArray;
begin
 Result := OpenTypesToTypes([TypeInfo(TefList)]);
end;//TkwEfListEmptyListEditor.ParamsTypes

class function TkwEfListEmptyListEditor.GetWordNameForRegister: AnsiString;
begin
 Result := '.TefList.EmptyListEditor';
end;//TkwEfListEmptyListEditor.GetWordNameForRegister

function TkwEfListListPanel.ListPanel(const aCtx: TtfwContext;
 aefList: TefList): TvtPanel;
 {* ���������� ����� ������� .TefList.ListPanel }
begin
 Result := aefList.ListPanel;
end;//TkwEfListListPanel.ListPanel

procedure TkwEfListListPanel.DoDoIt(const aCtx: TtfwContext);
var l_aefList: TefList;
begin
 try
  l_aefList := TefList(aCtx.rEngine.PopObjAs(TefList));
 except
  on E: Exception do
  begin
   RunnerError('������ ��� ��������� ��������� aefList: TefList : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushObj(ListPanel(aCtx, l_aefList));
end;//TkwEfListListPanel.DoDoIt

procedure TkwEfListListPanel.SetValuePrim(const aValue: TtfwStackValue;
 const aCtx: TtfwContext);
begin
 RunnerError('������ ����������� �������� readonly �������� ListPanel', aCtx);
end;//TkwEfListListPanel.SetValuePrim

function TkwEfListListPanel.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
begin
 Result := TypeInfo(TvtPanel);
end;//TkwEfListListPanel.GetResultTypeInfo

function TkwEfListListPanel.GetAllParamsCount(const aCtx: TtfwContext): Integer;
begin
 Result := 1;
end;//TkwEfListListPanel.GetAllParamsCount

function TkwEfListListPanel.ParamsTypes: PTypeInfoArray;
begin
 Result := OpenTypesToTypes([TypeInfo(TefList)]);
end;//TkwEfListListPanel.ParamsTypes

class function TkwEfListListPanel.GetWordNameForRegister: AnsiString;
begin
 Result := '.TefList.ListPanel';
end;//TkwEfListListPanel.GetWordNameForRegister

function TkwEfListTvList.tvList(const aCtx: TtfwContext;
 aefList: TefList): TnscDocumentListTreeView;
 {* ���������� ����� ������� .TefList.tvList }
begin
 Result := aefList.tvList;
end;//TkwEfListTvList.tvList

procedure TkwEfListTvList.DoDoIt(const aCtx: TtfwContext);
var l_aefList: TefList;
begin
 try
  l_aefList := TefList(aCtx.rEngine.PopObjAs(TefList));
 except
  on E: Exception do
  begin
   RunnerError('������ ��� ��������� ��������� aefList: TefList : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushObj(tvList(aCtx, l_aefList));
end;//TkwEfListTvList.DoDoIt

procedure TkwEfListTvList.SetValuePrim(const aValue: TtfwStackValue;
 const aCtx: TtfwContext);
begin
 RunnerError('������ ����������� �������� readonly �������� tvList', aCtx);
end;//TkwEfListTvList.SetValuePrim

function TkwEfListTvList.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
begin
 Result := TypeInfo(TnscDocumentListTreeView);
end;//TkwEfListTvList.GetResultTypeInfo

function TkwEfListTvList.GetAllParamsCount(const aCtx: TtfwContext): Integer;
begin
 Result := 1;
end;//TkwEfListTvList.GetAllParamsCount

function TkwEfListTvList.ParamsTypes: PTypeInfoArray;
begin
 Result := OpenTypesToTypes([TypeInfo(TefList)]);
end;//TkwEfListTvList.ParamsTypes

class function TkwEfListTvList.GetWordNameForRegister: AnsiString;
begin
 Result := '.TefList.tvList';
end;//TkwEfListTvList.GetWordNameForRegister

function TkwEfListCfList.cfList(const aCtx: TtfwContext;
 aefList: TefList): TnscContextFilter;
 {* ���������� ����� ������� .TefList.cfList }
begin
 Result := aefList.cfList;
end;//TkwEfListCfList.cfList

procedure TkwEfListCfList.DoDoIt(const aCtx: TtfwContext);
var l_aefList: TefList;
begin
 try
  l_aefList := TefList(aCtx.rEngine.PopObjAs(TefList));
 except
  on E: Exception do
  begin
   RunnerError('������ ��� ��������� ��������� aefList: TefList : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushObj(cfList(aCtx, l_aefList));
end;//TkwEfListCfList.DoDoIt

procedure TkwEfListCfList.SetValuePrim(const aValue: TtfwStackValue;
 const aCtx: TtfwContext);
begin
 RunnerError('������ ����������� �������� readonly �������� cfList', aCtx);
end;//TkwEfListCfList.SetValuePrim

function TkwEfListCfList.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
begin
 Result := TypeInfo(TnscContextFilter);
end;//TkwEfListCfList.GetResultTypeInfo

function TkwEfListCfList.GetAllParamsCount(const aCtx: TtfwContext): Integer;
begin
 Result := 1;
end;//TkwEfListCfList.GetAllParamsCount

function TkwEfListCfList.ParamsTypes: PTypeInfoArray;
begin
 Result := OpenTypesToTypes([TypeInfo(TefList)]);
end;//TkwEfListCfList.ParamsTypes

class function TkwEfListCfList.GetWordNameForRegister: AnsiString;
begin
 Result := '.TefList.cfList';
end;//TkwEfListCfList.GetWordNameForRegister

function TkwEfListExSearchPanel.ExSearchPanel(const aCtx: TtfwContext;
 aefList: TefList): TvtPanel;
 {* ���������� ����� ������� .TefList.ExSearchPanel }
begin
 Result := aefList.ExSearchPanel;
end;//TkwEfListExSearchPanel.ExSearchPanel

procedure TkwEfListExSearchPanel.DoDoIt(const aCtx: TtfwContext);
var l_aefList: TefList;
begin
 try
  l_aefList := TefList(aCtx.rEngine.PopObjAs(TefList));
 except
  on E: Exception do
  begin
   RunnerError('������ ��� ��������� ��������� aefList: TefList : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushObj(ExSearchPanel(aCtx, l_aefList));
end;//TkwEfListExSearchPanel.DoDoIt

procedure TkwEfListExSearchPanel.SetValuePrim(const aValue: TtfwStackValue;
 const aCtx: TtfwContext);
begin
 RunnerError('������ ����������� �������� readonly �������� ExSearchPanel', aCtx);
end;//TkwEfListExSearchPanel.SetValuePrim

function TkwEfListExSearchPanel.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
begin
 Result := TypeInfo(TvtPanel);
end;//TkwEfListExSearchPanel.GetResultTypeInfo

function TkwEfListExSearchPanel.GetAllParamsCount(const aCtx: TtfwContext): Integer;
begin
 Result := 1;
end;//TkwEfListExSearchPanel.GetAllParamsCount

function TkwEfListExSearchPanel.ParamsTypes: PTypeInfoArray;
begin
 Result := OpenTypesToTypes([TypeInfo(TefList)]);
end;//TkwEfListExSearchPanel.ParamsTypes

class function TkwEfListExSearchPanel.GetWordNameForRegister: AnsiString;
begin
 Result := '.TefList.ExSearchPanel';
end;//TkwEfListExSearchPanel.GetWordNameForRegister

function TkwEfListExSearchLabel.ExSearchLabel(const aCtx: TtfwContext;
 aefList: TefList): TvtFocusLabel;
 {* ���������� ����� ������� .TefList.ExSearchLabel }
begin
 Result := aefList.ExSearchLabel;
end;//TkwEfListExSearchLabel.ExSearchLabel

procedure TkwEfListExSearchLabel.DoDoIt(const aCtx: TtfwContext);
var l_aefList: TefList;
begin
 try
  l_aefList := TefList(aCtx.rEngine.PopObjAs(TefList));
 except
  on E: Exception do
  begin
   RunnerError('������ ��� ��������� ��������� aefList: TefList : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushObj(ExSearchLabel(aCtx, l_aefList));
end;//TkwEfListExSearchLabel.DoDoIt

procedure TkwEfListExSearchLabel.SetValuePrim(const aValue: TtfwStackValue;
 const aCtx: TtfwContext);
begin
 RunnerError('������ ����������� �������� readonly �������� ExSearchLabel', aCtx);
end;//TkwEfListExSearchLabel.SetValuePrim

function TkwEfListExSearchLabel.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
begin
 Result := TypeInfo(TvtFocusLabel);
end;//TkwEfListExSearchLabel.GetResultTypeInfo

function TkwEfListExSearchLabel.GetAllParamsCount(const aCtx: TtfwContext): Integer;
begin
 Result := 1;
end;//TkwEfListExSearchLabel.GetAllParamsCount

function TkwEfListExSearchLabel.ParamsTypes: PTypeInfoArray;
begin
 Result := OpenTypesToTypes([TypeInfo(TefList)]);
end;//TkwEfListExSearchLabel.ParamsTypes

class function TkwEfListExSearchLabel.GetWordNameForRegister: AnsiString;
begin
 Result := '.TefList.ExSearchLabel';
end;//TkwEfListExSearchLabel.GetWordNameForRegister

initialization
 Tkw_Form_List.RegisterInEngine;
 {* ����������� Tkw_Form_List }
 Tkw_List_Control_RemindersLine.RegisterInEngine;
 {* ����������� Tkw_List_Control_RemindersLine }
 Tkw_List_Control_RemindersLine_Push.RegisterInEngine;
 {* ����������� Tkw_List_Control_RemindersLine_Push }
 Tkw_List_Control_remListFiltered.RegisterInEngine;
 {* ����������� Tkw_List_Control_remListFiltered }
 Tkw_List_Control_remListFiltered_Push.RegisterInEngine;
 {* ����������� Tkw_List_Control_remListFiltered_Push }
 Tkw_List_Control_remListModified.RegisterInEngine;
 {* ����������� Tkw_List_Control_remListModified }
 Tkw_List_Control_remListModified_Push.RegisterInEngine;
 {* ����������� Tkw_List_Control_remListModified_Push }
 Tkw_List_Control_remTimeMachineWarning.RegisterInEngine;
 {* ����������� Tkw_List_Control_remTimeMachineWarning }
 Tkw_List_Control_remTimeMachineWarning_Push.RegisterInEngine;
 {* ����������� Tkw_List_Control_remTimeMachineWarning_Push }
 Tkw_List_Control_EmptyListEditor.RegisterInEngine;
 {* ����������� Tkw_List_Control_EmptyListEditor }
 Tkw_List_Control_EmptyListEditor_Push.RegisterInEngine;
 {* ����������� Tkw_List_Control_EmptyListEditor_Push }
 Tkw_List_Control_ListPanel.RegisterInEngine;
 {* ����������� Tkw_List_Control_ListPanel }
 Tkw_List_Control_ListPanel_Push.RegisterInEngine;
 {* ����������� Tkw_List_Control_ListPanel_Push }
 Tkw_List_Control_tvList.RegisterInEngine;
 {* ����������� Tkw_List_Control_tvList }
 Tkw_List_Control_tvList_Push.RegisterInEngine;
 {* ����������� Tkw_List_Control_tvList_Push }
 Tkw_List_Control_cfList.RegisterInEngine;
 {* ����������� Tkw_List_Control_cfList }
 Tkw_List_Control_cfList_Push.RegisterInEngine;
 {* ����������� Tkw_List_Control_cfList_Push }
 Tkw_List_Control_ExSearchPanel.RegisterInEngine;
 {* ����������� Tkw_List_Control_ExSearchPanel }
 Tkw_List_Control_ExSearchPanel_Push.RegisterInEngine;
 {* ����������� Tkw_List_Control_ExSearchPanel_Push }
 Tkw_List_Control_ExSearchLabel.RegisterInEngine;
 {* ����������� Tkw_List_Control_ExSearchLabel }
 Tkw_List_Control_ExSearchLabel_Push.RegisterInEngine;
 {* ����������� Tkw_List_Control_ExSearchLabel_Push }
 TkwEfListRemindersLine.RegisterInEngine;
 {* ����������� efList_RemindersLine }
 TkwEfListRemListFiltered.RegisterInEngine;
 {* ����������� efList_remListFiltered }
 TkwEfListRemListModified.RegisterInEngine;
 {* ����������� efList_remListModified }
 TkwEfListRemTimeMachineWarning.RegisterInEngine;
 {* ����������� efList_remTimeMachineWarning }
 TkwEfListEmptyListEditor.RegisterInEngine;
 {* ����������� efList_EmptyListEditor }
 TkwEfListListPanel.RegisterInEngine;
 {* ����������� efList_ListPanel }
 TkwEfListTvList.RegisterInEngine;
 {* ����������� efList_tvList }
 TkwEfListCfList.RegisterInEngine;
 {* ����������� efList_cfList }
 TkwEfListExSearchPanel.RegisterInEngine;
 {* ����������� efList_ExSearchPanel }
 TkwEfListExSearchLabel.RegisterInEngine;
 {* ����������� efList_ExSearchLabel }
 TtfwTypeRegistrator.RegisterType(@tfw_tiStruct);
 {* ����������� ���� TtfwContext }
 TtfwTypeRegistrator.RegisterType(TypeInfo(TefList));
 {* ����������� ���� List }
 TtfwTypeRegistrator.RegisterType(TypeInfo(TnscRemindersLine));
 {* ����������� ���� TnscRemindersLine }
 TtfwTypeRegistrator.RegisterType(TypeInfo(TnscReminder));
 {* ����������� ���� TnscReminder }
 TtfwTypeRegistrator.RegisterType(TypeInfo(TnscEditor));
 {* ����������� ���� TnscEditor }
 TtfwTypeRegistrator.RegisterType(TypeInfo(TvtPanel));
 {* ����������� ���� TvtPanel }
 TtfwTypeRegistrator.RegisterType(TypeInfo(TnscDocumentListTreeView));
 {* ����������� ���� TnscDocumentListTreeView }
 TtfwTypeRegistrator.RegisterType(TypeInfo(TnscContextFilter));
 {* ����������� ���� TnscContextFilter }
 TtfwTypeRegistrator.RegisterType(TypeInfo(TvtFocusLabel));
 {* ����������� ���� TvtFocusLabel }
{$IfEnd} // NOT Defined(Admin) AND NOT Defined(Monitorings) AND NOT Defined(NoScripts)

end.
