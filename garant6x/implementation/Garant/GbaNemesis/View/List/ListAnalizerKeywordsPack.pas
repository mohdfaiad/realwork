unit ListAnalizerKeywordsPack;
 {* ����� ���� ������� ��� ������� � ����������� ��������� ����� ListAnalizer }

// ������: "w:\garant6x\implementation\Garant\GbaNemesis\View\List\ListAnalizerKeywordsPack.pas"
// ���������: "ScriptKeywordsPack"

{$Include w:\garant6x\implementation\Garant\nsDefine.inc}

interface

{$If NOT Defined(Admin) AND NOT Defined(Monitorings) AND NOT Defined(NoScripts)}
uses
 l3IntfUses
 , vtPanel
 , eeTreeView
;
{$IfEnd} // NOT Defined(Admin) AND NOT Defined(Monitorings) AND NOT Defined(NoScripts)

implementation

{$If NOT Defined(Admin) AND NOT Defined(Monitorings) AND NOT Defined(NoScripts)}
uses
 l3ImplUses
 , ListAnalizer_Form
 , tfwControlString
 {$If NOT Defined(NoVCL)}
 , kwBynameControlPush
 {$IfEnd} // NOT Defined(NoVCL)
 , tfwScriptingInterfaces
 , tfwPropertyLike
 , tfwTypeInfo
 , TypInfo
 , tfwScriptingTypes
 , tfwTypeRegistrator
 , TtfwClassRef_Proxy
 , SysUtils
;

type
 Tkw_Form_ListAnalizer = {final} class(TtfwControlString)
  {* ����� ������� ��� �������������� ����� ListAnalizer
----
*������ �������������*:
[code]
'aControl' �����::ListAnalizer TryFocus ASSERT
[code] }
  protected
   class function GetWordNameForRegister: AnsiString; override;
   function GetString: AnsiString; override;
 end;//Tkw_Form_ListAnalizer

 Tkw_ListAnalizer_Control_BackgroundPanel = {final} class(TtfwControlString)
  {* ����� ������� ��� �������������� �������� BackgroundPanel
----
*������ �������������*:
[code]
�������::BackgroundPanel TryFocus ASSERT
[code] }
  protected
   class function GetWordNameForRegister: AnsiString; override;
   function GetString: AnsiString; override;
   class procedure RegisterInEngine; override;
 end;//Tkw_ListAnalizer_Control_BackgroundPanel

 Tkw_ListAnalizer_Control_BackgroundPanel_Push = {final} class(TkwBynameControlPush)
  {* ����� ������� ��� �������� BackgroundPanel
----
*������ �������������*:
[code]
�������::BackgroundPanel:push pop:control:SetFocus ASSERT
[code] }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
 end;//Tkw_ListAnalizer_Control_BackgroundPanel_Push

 Tkw_ListAnalizer_Control_ListTree = {final} class(TtfwControlString)
  {* ����� ������� ��� �������������� �������� ListTree
----
*������ �������������*:
[code]
�������::ListTree TryFocus ASSERT
[code] }
  protected
   class function GetWordNameForRegister: AnsiString; override;
   function GetString: AnsiString; override;
   class procedure RegisterInEngine; override;
 end;//Tkw_ListAnalizer_Control_ListTree

 Tkw_ListAnalizer_Control_ListTree_Push = {final} class(TkwBynameControlPush)
  {* ����� ������� ��� �������� ListTree
----
*������ �������������*:
[code]
�������::ListTree:push pop:control:SetFocus ASSERT
[code] }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
 end;//Tkw_ListAnalizer_Control_ListTree_Push

 TkwListAnalizerFormBackgroundPanel = {final} class(TtfwPropertyLike)
  {* ����� ������� .TListAnalizerForm.BackgroundPanel
[panel]������� BackgroundPanel ����� TListAnalizerForm[panel]
*��� ����������:* TvtPanel
*������:*
[code]
OBJECT VAR l_TvtPanel
 aListAnalizerForm .TListAnalizerForm.BackgroundPanel >>> l_TvtPanel
[code]  }
  private
   function BackgroundPanel(const aCtx: TtfwContext;
    aListAnalizerForm: TListAnalizerForm): TvtPanel;
    {* ���������� ����� ������� .TListAnalizerForm.BackgroundPanel }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
  public
   procedure SetValuePrim(const aValue: TtfwStackValue;
    const aCtx: TtfwContext); override;
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
 end;//TkwListAnalizerFormBackgroundPanel

 TkwListAnalizerFormListTree = {final} class(TtfwPropertyLike)
  {* ����� ������� .TListAnalizerForm.ListTree
[panel]������� ListTree ����� TListAnalizerForm[panel]
*��� ����������:* TeeTreeView
*������:*
[code]
OBJECT VAR l_TeeTreeView
 aListAnalizerForm .TListAnalizerForm.ListTree >>> l_TeeTreeView
[code]  }
  private
   function ListTree(const aCtx: TtfwContext;
    aListAnalizerForm: TListAnalizerForm): TeeTreeView;
    {* ���������� ����� ������� .TListAnalizerForm.ListTree }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
  public
   procedure SetValuePrim(const aValue: TtfwStackValue;
    const aCtx: TtfwContext); override;
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
 end;//TkwListAnalizerFormListTree

class function Tkw_Form_ListAnalizer.GetWordNameForRegister: AnsiString;
begin
 Result := '�����::ListAnalizer';
end;//Tkw_Form_ListAnalizer.GetWordNameForRegister

function Tkw_Form_ListAnalizer.GetString: AnsiString;
begin
 Result := 'ListAnalizerForm';
end;//Tkw_Form_ListAnalizer.GetString

class function Tkw_ListAnalizer_Control_BackgroundPanel.GetWordNameForRegister: AnsiString;
begin
 Result := '�������::BackgroundPanel';
end;//Tkw_ListAnalizer_Control_BackgroundPanel.GetWordNameForRegister

function Tkw_ListAnalizer_Control_BackgroundPanel.GetString: AnsiString;
begin
 Result := 'BackgroundPanel';
end;//Tkw_ListAnalizer_Control_BackgroundPanel.GetString

class procedure Tkw_ListAnalizer_Control_BackgroundPanel.RegisterInEngine;
begin
 inherited;
 TtfwClassRef.Register(TvtPanel);
end;//Tkw_ListAnalizer_Control_BackgroundPanel.RegisterInEngine

procedure Tkw_ListAnalizer_Control_BackgroundPanel_Push.DoDoIt(const aCtx: TtfwContext);
begin
 aCtx.rEngine.PushString('BackgroundPanel');
 inherited;
end;//Tkw_ListAnalizer_Control_BackgroundPanel_Push.DoDoIt

class function Tkw_ListAnalizer_Control_BackgroundPanel_Push.GetWordNameForRegister: AnsiString;
begin
 Result := '�������::BackgroundPanel:push';
end;//Tkw_ListAnalizer_Control_BackgroundPanel_Push.GetWordNameForRegister

class function Tkw_ListAnalizer_Control_ListTree.GetWordNameForRegister: AnsiString;
begin
 Result := '�������::ListTree';
end;//Tkw_ListAnalizer_Control_ListTree.GetWordNameForRegister

function Tkw_ListAnalizer_Control_ListTree.GetString: AnsiString;
begin
 Result := 'ListTree';
end;//Tkw_ListAnalizer_Control_ListTree.GetString

class procedure Tkw_ListAnalizer_Control_ListTree.RegisterInEngine;
begin
 inherited;
 TtfwClassRef.Register(TeeTreeView);
end;//Tkw_ListAnalizer_Control_ListTree.RegisterInEngine

procedure Tkw_ListAnalizer_Control_ListTree_Push.DoDoIt(const aCtx: TtfwContext);
begin
 aCtx.rEngine.PushString('ListTree');
 inherited;
end;//Tkw_ListAnalizer_Control_ListTree_Push.DoDoIt

class function Tkw_ListAnalizer_Control_ListTree_Push.GetWordNameForRegister: AnsiString;
begin
 Result := '�������::ListTree:push';
end;//Tkw_ListAnalizer_Control_ListTree_Push.GetWordNameForRegister

function TkwListAnalizerFormBackgroundPanel.BackgroundPanel(const aCtx: TtfwContext;
 aListAnalizerForm: TListAnalizerForm): TvtPanel;
 {* ���������� ����� ������� .TListAnalizerForm.BackgroundPanel }
begin
 Result := aListAnalizerForm.BackgroundPanel;
end;//TkwListAnalizerFormBackgroundPanel.BackgroundPanel

procedure TkwListAnalizerFormBackgroundPanel.DoDoIt(const aCtx: TtfwContext);
var l_aListAnalizerForm: TListAnalizerForm;
begin
 try
  l_aListAnalizerForm := TListAnalizerForm(aCtx.rEngine.PopObjAs(TListAnalizerForm));
 except
  on E: Exception do
  begin
   RunnerError('������ ��� ��������� ��������� aListAnalizerForm: TListAnalizerForm : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushObj(BackgroundPanel(aCtx, l_aListAnalizerForm));
end;//TkwListAnalizerFormBackgroundPanel.DoDoIt

class function TkwListAnalizerFormBackgroundPanel.GetWordNameForRegister: AnsiString;
begin
 Result := '.TListAnalizerForm.BackgroundPanel';
end;//TkwListAnalizerFormBackgroundPanel.GetWordNameForRegister

procedure TkwListAnalizerFormBackgroundPanel.SetValuePrim(const aValue: TtfwStackValue;
 const aCtx: TtfwContext);
begin
 RunnerError('������ ����������� �������� readonly �������� BackgroundPanel', aCtx);
end;//TkwListAnalizerFormBackgroundPanel.SetValuePrim

function TkwListAnalizerFormBackgroundPanel.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
begin
 Result := TypeInfo(TvtPanel);
end;//TkwListAnalizerFormBackgroundPanel.GetResultTypeInfo

function TkwListAnalizerFormBackgroundPanel.GetAllParamsCount(const aCtx: TtfwContext): Integer;
begin
 Result := 1;
end;//TkwListAnalizerFormBackgroundPanel.GetAllParamsCount

function TkwListAnalizerFormBackgroundPanel.ParamsTypes: PTypeInfoArray;
begin
 Result := OpenTypesToTypes([TypeInfo(TListAnalizerForm)]);
end;//TkwListAnalizerFormBackgroundPanel.ParamsTypes

function TkwListAnalizerFormListTree.ListTree(const aCtx: TtfwContext;
 aListAnalizerForm: TListAnalizerForm): TeeTreeView;
 {* ���������� ����� ������� .TListAnalizerForm.ListTree }
begin
 Result := aListAnalizerForm.ListTree;
end;//TkwListAnalizerFormListTree.ListTree

procedure TkwListAnalizerFormListTree.DoDoIt(const aCtx: TtfwContext);
var l_aListAnalizerForm: TListAnalizerForm;
begin
 try
  l_aListAnalizerForm := TListAnalizerForm(aCtx.rEngine.PopObjAs(TListAnalizerForm));
 except
  on E: Exception do
  begin
   RunnerError('������ ��� ��������� ��������� aListAnalizerForm: TListAnalizerForm : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushObj(ListTree(aCtx, l_aListAnalizerForm));
end;//TkwListAnalizerFormListTree.DoDoIt

class function TkwListAnalizerFormListTree.GetWordNameForRegister: AnsiString;
begin
 Result := '.TListAnalizerForm.ListTree';
end;//TkwListAnalizerFormListTree.GetWordNameForRegister

procedure TkwListAnalizerFormListTree.SetValuePrim(const aValue: TtfwStackValue;
 const aCtx: TtfwContext);
begin
 RunnerError('������ ����������� �������� readonly �������� ListTree', aCtx);
end;//TkwListAnalizerFormListTree.SetValuePrim

function TkwListAnalizerFormListTree.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
begin
 Result := TypeInfo(TeeTreeView);
end;//TkwListAnalizerFormListTree.GetResultTypeInfo

function TkwListAnalizerFormListTree.GetAllParamsCount(const aCtx: TtfwContext): Integer;
begin
 Result := 1;
end;//TkwListAnalizerFormListTree.GetAllParamsCount

function TkwListAnalizerFormListTree.ParamsTypes: PTypeInfoArray;
begin
 Result := OpenTypesToTypes([TypeInfo(TListAnalizerForm)]);
end;//TkwListAnalizerFormListTree.ParamsTypes

initialization
 Tkw_Form_ListAnalizer.RegisterInEngine;
 {* ����������� Tkw_Form_ListAnalizer }
 Tkw_ListAnalizer_Control_BackgroundPanel.RegisterInEngine;
 {* ����������� Tkw_ListAnalizer_Control_BackgroundPanel }
 Tkw_ListAnalizer_Control_BackgroundPanel_Push.RegisterInEngine;
 {* ����������� Tkw_ListAnalizer_Control_BackgroundPanel_Push }
 Tkw_ListAnalizer_Control_ListTree.RegisterInEngine;
 {* ����������� Tkw_ListAnalizer_Control_ListTree }
 Tkw_ListAnalizer_Control_ListTree_Push.RegisterInEngine;
 {* ����������� Tkw_ListAnalizer_Control_ListTree_Push }
 TkwListAnalizerFormBackgroundPanel.RegisterInEngine;
 {* ����������� ListAnalizerForm_BackgroundPanel }
 TkwListAnalizerFormListTree.RegisterInEngine;
 {* ����������� ListAnalizerForm_ListTree }
 TtfwTypeRegistrator.RegisterType(@tfw_tiStruct);
 {* ����������� ���� TtfwContext }
 TtfwTypeRegistrator.RegisterType(TypeInfo(TListAnalizerForm));
 {* ����������� ���� ListAnalizer }
 TtfwTypeRegistrator.RegisterType(TypeInfo(TvtPanel));
 {* ����������� ���� TvtPanel }
 TtfwTypeRegistrator.RegisterType(TypeInfo(TeeTreeView));
 {* ����������� ���� TeeTreeView }
{$IfEnd} // NOT Defined(Admin) AND NOT Defined(Monitorings) AND NOT Defined(NoScripts)

end.
