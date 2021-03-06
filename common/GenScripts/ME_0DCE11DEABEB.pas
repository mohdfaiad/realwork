unit FromWithPanelKeywordsPack;
 {* ����� ���� ������� ��� ������� � ����������� ��������� ����� FromWithPanel }

// ������: "w:\common\components\gui\Garant\Daily\Forms\FromWithPanelKeywordsPack.pas"
// ���������: "ScriptKeywordsPack"
// ������� ������: "FromWithPanelKeywordsPack" MUID: (0DCE11DEABEB)

{$Include w:\common\components\gui\sdotDefine.inc}

interface

{$If Defined(nsTest) AND NOT Defined(NoVCM) AND NOT Defined(NoScripts)}
uses
 l3IntfUses
 , vtPanel
;
{$IfEnd} // Defined(nsTest) AND NOT Defined(NoVCM) AND NOT Defined(NoScripts)

implementation

{$If Defined(nsTest) AND NOT Defined(NoVCM) AND NOT Defined(NoScripts)}
uses
 l3ImplUses
 , FromWithPanel_Form
 , tfwControlString
 {$If NOT Defined(NoVCL)}
 , kwBynameControlPush
 {$IfEnd} // NOT Defined(NoVCL)
 , tfwScriptingInterfaces
 , tfwPropertyLike
 , TypInfo
 , tfwTypeInfo
 , TtfwClassRef_Proxy
 , SysUtils
 , TtfwTypeRegistrator_Proxy
 , tfwScriptingTypes
;

type
 Tkw_Form_FromWithPanel = {final} class(TtfwControlString)
  {* ����� ������� ��� �������������� ����� FromWithPanel
----
*������ �������������*:
[code]
'aControl' �����::FromWithPanel TryFocus ASSERT
[code] }
  protected
   function GetString: AnsiString; override;
   class function GetWordNameForRegister: AnsiString; override;
 end;//Tkw_Form_FromWithPanel

 Tkw_FromWithPanel_Control_WorkSpace = {final} class(TtfwControlString)
  {* ����� ������� ��� �������������� �������� WorkSpace
----
*������ �������������*:
[code]
�������::WorkSpace TryFocus ASSERT
[code] }
  protected
   function GetString: AnsiString; override;
   class procedure RegisterInEngine; override;
   class function GetWordNameForRegister: AnsiString; override;
 end;//Tkw_FromWithPanel_Control_WorkSpace

 Tkw_FromWithPanel_Control_WorkSpace_Push = {final} class({$If NOT Defined(NoVCL)}
 TkwBynameControlPush
 {$IfEnd} // NOT Defined(NoVCL)
 )
  {* ����� ������� ��� �������� WorkSpace
----
*������ �������������*:
[code]
�������::WorkSpace:push pop:control:SetFocus ASSERT
[code] }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
 end;//Tkw_FromWithPanel_Control_WorkSpace_Push

 TkwFromWithPanelFormWorkSpace = {final} class(TtfwPropertyLike)
  {* ����� ������� .TFromWithPanelForm.WorkSpace }
  private
   function WorkSpace(const aCtx: TtfwContext;
    aFromWithPanelForm: TFromWithPanelForm): TvtPanel;
    {* ���������� ����� ������� .TFromWithPanelForm.WorkSpace }
  protected
   class function GetWordNameForRegister: AnsiString; override;
   procedure DoDoIt(const aCtx: TtfwContext); override;
  public
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
   procedure SetValuePrim(const aValue: TtfwStackValue;
    const aCtx: TtfwContext); override;
 end;//TkwFromWithPanelFormWorkSpace

function Tkw_Form_FromWithPanel.GetString: AnsiString;
begin
 Result := 'FromWithPanelForm';
end;//Tkw_Form_FromWithPanel.GetString

class function Tkw_Form_FromWithPanel.GetWordNameForRegister: AnsiString;
begin
 Result := '�����::FromWithPanel';
end;//Tkw_Form_FromWithPanel.GetWordNameForRegister

function Tkw_FromWithPanel_Control_WorkSpace.GetString: AnsiString;
begin
 Result := 'WorkSpace';
end;//Tkw_FromWithPanel_Control_WorkSpace.GetString

class procedure Tkw_FromWithPanel_Control_WorkSpace.RegisterInEngine;
begin
 inherited;
 TtfwClassRef.Register(TvtPanel);
end;//Tkw_FromWithPanel_Control_WorkSpace.RegisterInEngine

class function Tkw_FromWithPanel_Control_WorkSpace.GetWordNameForRegister: AnsiString;
begin
 Result := '�������::WorkSpace';
end;//Tkw_FromWithPanel_Control_WorkSpace.GetWordNameForRegister

procedure Tkw_FromWithPanel_Control_WorkSpace_Push.DoDoIt(const aCtx: TtfwContext);
begin
 aCtx.rEngine.PushString('WorkSpace');
 inherited;
end;//Tkw_FromWithPanel_Control_WorkSpace_Push.DoDoIt

class function Tkw_FromWithPanel_Control_WorkSpace_Push.GetWordNameForRegister: AnsiString;
begin
 Result := '�������::WorkSpace:push';
end;//Tkw_FromWithPanel_Control_WorkSpace_Push.GetWordNameForRegister

function TkwFromWithPanelFormWorkSpace.WorkSpace(const aCtx: TtfwContext;
 aFromWithPanelForm: TFromWithPanelForm): TvtPanel;
 {* ���������� ����� ������� .TFromWithPanelForm.WorkSpace }
begin
 Result := aFromWithPanelForm.WorkSpace;
end;//TkwFromWithPanelFormWorkSpace.WorkSpace

class function TkwFromWithPanelFormWorkSpace.GetWordNameForRegister: AnsiString;
begin
 Result := '.TFromWithPanelForm.WorkSpace';
end;//TkwFromWithPanelFormWorkSpace.GetWordNameForRegister

function TkwFromWithPanelFormWorkSpace.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
begin
 Result := TypeInfo(TvtPanel);
end;//TkwFromWithPanelFormWorkSpace.GetResultTypeInfo

function TkwFromWithPanelFormWorkSpace.GetAllParamsCount(const aCtx: TtfwContext): Integer;
begin
 Result := 1;
end;//TkwFromWithPanelFormWorkSpace.GetAllParamsCount

function TkwFromWithPanelFormWorkSpace.ParamsTypes: PTypeInfoArray;
begin
 Result := OpenTypesToTypes([TypeInfo(TFromWithPanelForm)]);
end;//TkwFromWithPanelFormWorkSpace.ParamsTypes

procedure TkwFromWithPanelFormWorkSpace.SetValuePrim(const aValue: TtfwStackValue;
 const aCtx: TtfwContext);
begin
 RunnerError('������ ����������� �������� readonly �������� WorkSpace', aCtx);
end;//TkwFromWithPanelFormWorkSpace.SetValuePrim

procedure TkwFromWithPanelFormWorkSpace.DoDoIt(const aCtx: TtfwContext);
var l_aFromWithPanelForm: TFromWithPanelForm;
begin
 try
  l_aFromWithPanelForm := TFromWithPanelForm(aCtx.rEngine.PopObjAs(TFromWithPanelForm));
 except
  on E: Exception do
  begin
   RunnerError('������ ��� ��������� ��������� aFromWithPanelForm: TFromWithPanelForm : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushObj(WorkSpace(aCtx, l_aFromWithPanelForm));
end;//TkwFromWithPanelFormWorkSpace.DoDoIt

initialization
 Tkw_Form_FromWithPanel.RegisterInEngine;
 {* ����������� Tkw_Form_FromWithPanel }
 Tkw_FromWithPanel_Control_WorkSpace.RegisterInEngine;
 {* ����������� Tkw_FromWithPanel_Control_WorkSpace }
 Tkw_FromWithPanel_Control_WorkSpace_Push.RegisterInEngine;
 {* ����������� Tkw_FromWithPanel_Control_WorkSpace_Push }
 TkwFromWithPanelFormWorkSpace.RegisterInEngine;
 {* ����������� FromWithPanelForm_WorkSpace }
 TtfwTypeRegistrator.RegisterType(TypeInfo(TFromWithPanelForm));
 {* ����������� ���� TFromWithPanelForm }
 TtfwTypeRegistrator.RegisterType(TypeInfo(TvtPanel));
 {* ����������� ���� TvtPanel }
{$IfEnd} // Defined(nsTest) AND NOT Defined(NoVCM) AND NOT Defined(NoScripts)

end.
