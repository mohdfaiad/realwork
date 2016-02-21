unit SynchroView_WarningBaloonKeywordsPack;
 {* ����� ���� ������� ��� ������� � ����������� ��������� ����� SynchroView_WarningBaloon }

// ������: "w:\garant6x\implementation\Garant\GbaNemesis\View\Document\SynchroView_WarningBaloonKeywordsPack.pas"
// ���������: "ScriptKeywordsPack"

{$Include w:\garant6x\implementation\Garant\nsDefine.inc}

interface

{$If NOT Defined(Admin) AND NOT Defined(Monitorings) AND NOT Defined(NoScripts)}
uses
 l3IntfUses
 , Document_Module
 {$If Defined(Nemesis)}
 , nscEditor
 {$IfEnd} // Defined(Nemesis)
;
{$IfEnd} // NOT Defined(Admin) AND NOT Defined(Monitorings) AND NOT Defined(NoScripts)

implementation

{$If NOT Defined(Admin) AND NOT Defined(Monitorings) AND NOT Defined(NoScripts)}
uses
 l3ImplUses
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
 Tkw_Form_SynchroView_WarningBaloon = {final} class(TtfwControlString)
  {* ����� ������� ��� �������������� ����� SynchroView_WarningBaloon
----
*������ �������������*:
[code]
'aControl' �����::SynchroView_WarningBaloon TryFocus ASSERT
[code] }
  protected
   class function GetWordNameForRegister: AnsiString; override;
   function GetString: AnsiString; override;
 end;//Tkw_Form_SynchroView_WarningBaloon

 Tkw_SynchroView_WarningBaloon_Control_Viewer = {final} class(TtfwControlString)
  {* ����� ������� ��� �������������� �������� Viewer
----
*������ �������������*:
[code]
�������::Viewer TryFocus ASSERT
[code] }
  protected
   class function GetWordNameForRegister: AnsiString; override;
   function GetString: AnsiString; override;
   class procedure RegisterInEngine; override;
 end;//Tkw_SynchroView_WarningBaloon_Control_Viewer

 Tkw_SynchroView_WarningBaloon_Control_Viewer_Push = {final} class(TkwBynameControlPush)
  {* ����� ������� ��� �������� Viewer
----
*������ �������������*:
[code]
�������::Viewer:push pop:control:SetFocus ASSERT
[code] }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
 end;//Tkw_SynchroView_WarningBaloon_Control_Viewer_Push

 TkwSynchroViewWarningBaloonFormViewer = {final} class(TtfwPropertyLike)
  {* ����� ������� .TSynchroView_WarningBaloonForm.Viewer
[panel]������� Viewer ����� TSynchroView_WarningBaloonForm[panel]
*��� ����������:* TnscEditor
*������:*
[code]
OBJECT VAR l_TnscEditor
 aSynchroView_WarningBaloonForm .TSynchroView_WarningBaloonForm.Viewer >>> l_TnscEditor
[code]  }
  private
   function Viewer(const aCtx: TtfwContext;
    aSynchroView_WarningBaloonForm: TSynchroView_WarningBaloonForm): TnscEditor;
    {* ���������� ����� ������� .TSynchroView_WarningBaloonForm.Viewer }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
  public
   procedure SetValuePrim(const aValue: TtfwStackValue;
    const aCtx: TtfwContext); override;
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
 end;//TkwSynchroViewWarningBaloonFormViewer

class function Tkw_Form_SynchroView_WarningBaloon.GetWordNameForRegister: AnsiString;
begin
 Result := '�����::SynchroView_WarningBaloon';
end;//Tkw_Form_SynchroView_WarningBaloon.GetWordNameForRegister

function Tkw_Form_SynchroView_WarningBaloon.GetString: AnsiString;
begin
 Result := 'SynchroView_WarningBaloonForm';
end;//Tkw_Form_SynchroView_WarningBaloon.GetString

class function Tkw_SynchroView_WarningBaloon_Control_Viewer.GetWordNameForRegister: AnsiString;
begin
 Result := '�������::Viewer';
end;//Tkw_SynchroView_WarningBaloon_Control_Viewer.GetWordNameForRegister

function Tkw_SynchroView_WarningBaloon_Control_Viewer.GetString: AnsiString;
begin
 Result := 'Viewer';
end;//Tkw_SynchroView_WarningBaloon_Control_Viewer.GetString

class procedure Tkw_SynchroView_WarningBaloon_Control_Viewer.RegisterInEngine;
begin
 inherited;
 TtfwClassRef.Register(TnscEditor);
end;//Tkw_SynchroView_WarningBaloon_Control_Viewer.RegisterInEngine

procedure Tkw_SynchroView_WarningBaloon_Control_Viewer_Push.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_A1906895B120_var*
//#UC END# *4DAEEDE10285_A1906895B120_var*
begin
//#UC START# *4DAEEDE10285_A1906895B120_impl*
 !!! Needs to be implemented !!!
//#UC END# *4DAEEDE10285_A1906895B120_impl*
end;//Tkw_SynchroView_WarningBaloon_Control_Viewer_Push.DoDoIt

class function Tkw_SynchroView_WarningBaloon_Control_Viewer_Push.GetWordNameForRegister: AnsiString;
begin
 Result := '�������::Viewer:push';
end;//Tkw_SynchroView_WarningBaloon_Control_Viewer_Push.GetWordNameForRegister

function TkwSynchroViewWarningBaloonFormViewer.Viewer(const aCtx: TtfwContext;
 aSynchroView_WarningBaloonForm: TSynchroView_WarningBaloonForm): TnscEditor;
 {* ���������� ����� ������� .TSynchroView_WarningBaloonForm.Viewer }
begin
 Result := aSynchroView_WarningBaloonForm.Viewer;
end;//TkwSynchroViewWarningBaloonFormViewer.Viewer

procedure TkwSynchroViewWarningBaloonFormViewer.DoDoIt(const aCtx: TtfwContext);
var l_aSynchroView_WarningBaloonForm: TSynchroView_WarningBaloonForm;
begin
 try
  l_aSynchroView_WarningBaloonForm := TSynchroView_WarningBaloonForm(aCtx.rEngine.PopObjAs(TSynchroView_WarningBaloonForm));
 except
  on E: Exception do
  begin
   RunnerError('������ ��� ��������� ��������� aSynchroView_WarningBaloonForm: TSynchroView_WarningBaloonForm : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushObj(Viewer(aCtx, l_aSynchroView_WarningBaloonForm));
end;//TkwSynchroViewWarningBaloonFormViewer.DoDoIt

class function TkwSynchroViewWarningBaloonFormViewer.GetWordNameForRegister: AnsiString;
begin
 Result := '.TSynchroView_WarningBaloonForm.Viewer';
end;//TkwSynchroViewWarningBaloonFormViewer.GetWordNameForRegister

procedure TkwSynchroViewWarningBaloonFormViewer.SetValuePrim(const aValue: TtfwStackValue;
 const aCtx: TtfwContext);
begin
 RunnerError('������ ����������� �������� readonly �������� Viewer', aCtx);
end;//TkwSynchroViewWarningBaloonFormViewer.SetValuePrim

function TkwSynchroViewWarningBaloonFormViewer.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
begin
 Result := TypeInfo(TnscEditor);
end;//TkwSynchroViewWarningBaloonFormViewer.GetResultTypeInfo

function TkwSynchroViewWarningBaloonFormViewer.GetAllParamsCount(const aCtx: TtfwContext): Integer;
begin
 Result := 1;
end;//TkwSynchroViewWarningBaloonFormViewer.GetAllParamsCount

function TkwSynchroViewWarningBaloonFormViewer.ParamsTypes: PTypeInfoArray;
begin
 Result := OpenTypesToTypes([TypeInfo(TSynchroView_WarningBaloonForm)]);
end;//TkwSynchroViewWarningBaloonFormViewer.ParamsTypes

initialization
 Tkw_Form_SynchroView_WarningBaloon.RegisterInEngine;
 {* ����������� Tkw_Form_SynchroView_WarningBaloon }
 Tkw_SynchroView_WarningBaloon_Control_Viewer.RegisterInEngine;
 {* ����������� Tkw_SynchroView_WarningBaloon_Control_Viewer }
 Tkw_SynchroView_WarningBaloon_Control_Viewer_Push.RegisterInEngine;
 {* ����������� Tkw_SynchroView_WarningBaloon_Control_Viewer_Push }
 TkwSynchroViewWarningBaloonFormViewer.RegisterInEngine;
 {* ����������� SynchroView_WarningBaloonForm_Viewer }
 TtfwTypeRegistrator.RegisterType(@tfw_tiStruct);
 {* ����������� ���� TtfwContext }
 TtfwTypeRegistrator.RegisterType(TypeInfo(TSynchroView_WarningBaloonForm));
 {* ����������� ���� SynchroView_WarningBaloon }
 TtfwTypeRegistrator.RegisterType(TypeInfo(TnscEditor));
 {* ����������� ���� TnscEditor }
{$IfEnd} // NOT Defined(Admin) AND NOT Defined(Monitorings) AND NOT Defined(NoScripts)

end.
