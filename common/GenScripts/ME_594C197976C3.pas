unit UserCR1_WarningBaloonKeywordsPack;
 {* ����� ���� ������� ��� ������� � ����������� ��������� ����� UserCR1_WarningBaloon }

// ������: "w:\garant6x\implementation\Garant\GbaNemesis\View\Document\UserCR1_WarningBaloonKeywordsPack.pas"
// ���������: "ScriptKeywordsPack"
// ������� ������: "UserCR1_WarningBaloonKeywordsPack" MUID: (594C197976C3)

{$Include w:\garant6x\implementation\Garant\nsDefine.inc}

interface

{$If NOT Defined(Admin) AND NOT Defined(Monitorings) AND NOT Defined(NoScripts)}
uses
 l3IntfUses
 {$If Defined(Nemesis)}
 , nscEditor
 {$IfEnd} // Defined(Nemesis)
;
{$IfEnd} // NOT Defined(Admin) AND NOT Defined(Monitorings) AND NOT Defined(NoScripts)

implementation

{$If NOT Defined(Admin) AND NOT Defined(Monitorings) AND NOT Defined(NoScripts)}
uses
 l3ImplUses
 , UserCR1_WarningBaloon_Form
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
 Tkw_Form_UserCR1_WarningBaloon = {final} class(TtfwControlString)
  {* ����� ������� ��� �������������� ����� UserCR1_WarningBaloon
----
*������ �������������*:
[code]
'aControl' �����::UserCR1_WarningBaloon TryFocus ASSERT
[code] }
  protected
   function GetString: AnsiString; override;
   class function GetWordNameForRegister: AnsiString; override;
 end;//Tkw_Form_UserCR1_WarningBaloon

 Tkw_UserCR1_WarningBaloon_Control_Viewer = {final} class(TtfwControlString)
  {* ����� ������� ��� �������������� �������� Viewer
----
*������ �������������*:
[code]
�������::Viewer TryFocus ASSERT
[code] }
  protected
   function GetString: AnsiString; override;
   class procedure RegisterInEngine; override;
   class function GetWordNameForRegister: AnsiString; override;
 end;//Tkw_UserCR1_WarningBaloon_Control_Viewer

 Tkw_UserCR1_WarningBaloon_Control_Viewer_Push = {final} class({$If NOT Defined(NoVCL)}
 TkwBynameControlPush
 {$IfEnd} // NOT Defined(NoVCL)
 )
  {* ����� ������� ��� �������� Viewer
----
*������ �������������*:
[code]
�������::Viewer:push pop:control:SetFocus ASSERT
[code] }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
 end;//Tkw_UserCR1_WarningBaloon_Control_Viewer_Push

 TkwUserCR1WarningBaloonFormViewer = {final} class(TtfwPropertyLike)
  {* ����� ������� .TUserCR1_WarningBaloonForm.Viewer
[panel]������� Viewer ����� TUserCR1_WarningBaloonForm[panel]
*��� ����������:* TnscEditor
*������:*
[code]
OBJECT VAR l_TnscEditor
 aUserCR1_WarningBaloonForm .TUserCR1_WarningBaloonForm.Viewer >>> l_TnscEditor
[code]  }
  private
   function Viewer(const aCtx: TtfwContext;
    aUserCR1_WarningBaloonForm: TUserCR1_WarningBaloonForm): TnscEditor;
    {* ���������� ����� ������� .TUserCR1_WarningBaloonForm.Viewer }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
  public
   procedure SetValuePrim(const aValue: TtfwStackValue;
    const aCtx: TtfwContext); override;
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
 end;//TkwUserCR1WarningBaloonFormViewer

function Tkw_Form_UserCR1_WarningBaloon.GetString: AnsiString;
begin
 Result := 'UserCR1_WarningBaloonForm';
end;//Tkw_Form_UserCR1_WarningBaloon.GetString

class function Tkw_Form_UserCR1_WarningBaloon.GetWordNameForRegister: AnsiString;
begin
 Result := '�����::UserCR1_WarningBaloon';
end;//Tkw_Form_UserCR1_WarningBaloon.GetWordNameForRegister

function Tkw_UserCR1_WarningBaloon_Control_Viewer.GetString: AnsiString;
begin
 Result := 'Viewer';
end;//Tkw_UserCR1_WarningBaloon_Control_Viewer.GetString

class procedure Tkw_UserCR1_WarningBaloon_Control_Viewer.RegisterInEngine;
begin
 inherited;
 TtfwClassRef.Register(TnscEditor);
end;//Tkw_UserCR1_WarningBaloon_Control_Viewer.RegisterInEngine

class function Tkw_UserCR1_WarningBaloon_Control_Viewer.GetWordNameForRegister: AnsiString;
begin
 Result := '�������::Viewer';
end;//Tkw_UserCR1_WarningBaloon_Control_Viewer.GetWordNameForRegister

procedure Tkw_UserCR1_WarningBaloon_Control_Viewer_Push.DoDoIt(const aCtx: TtfwContext);
begin
 aCtx.rEngine.PushString('Viewer');
 inherited;
end;//Tkw_UserCR1_WarningBaloon_Control_Viewer_Push.DoDoIt

class function Tkw_UserCR1_WarningBaloon_Control_Viewer_Push.GetWordNameForRegister: AnsiString;
begin
 Result := '�������::Viewer:push';
end;//Tkw_UserCR1_WarningBaloon_Control_Viewer_Push.GetWordNameForRegister

function TkwUserCR1WarningBaloonFormViewer.Viewer(const aCtx: TtfwContext;
 aUserCR1_WarningBaloonForm: TUserCR1_WarningBaloonForm): TnscEditor;
 {* ���������� ����� ������� .TUserCR1_WarningBaloonForm.Viewer }
begin
 Result := aUserCR1_WarningBaloonForm.Viewer;
end;//TkwUserCR1WarningBaloonFormViewer.Viewer

procedure TkwUserCR1WarningBaloonFormViewer.DoDoIt(const aCtx: TtfwContext);
var l_aUserCR1_WarningBaloonForm: TUserCR1_WarningBaloonForm;
begin
 try
  l_aUserCR1_WarningBaloonForm := TUserCR1_WarningBaloonForm(aCtx.rEngine.PopObjAs(TUserCR1_WarningBaloonForm));
 except
  on E: Exception do
  begin
   RunnerError('������ ��� ��������� ��������� aUserCR1_WarningBaloonForm: TUserCR1_WarningBaloonForm : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushObj(Viewer(aCtx, l_aUserCR1_WarningBaloonForm));
end;//TkwUserCR1WarningBaloonFormViewer.DoDoIt

procedure TkwUserCR1WarningBaloonFormViewer.SetValuePrim(const aValue: TtfwStackValue;
 const aCtx: TtfwContext);
begin
 RunnerError('������ ����������� �������� readonly �������� Viewer', aCtx);
end;//TkwUserCR1WarningBaloonFormViewer.SetValuePrim

function TkwUserCR1WarningBaloonFormViewer.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
begin
 Result := TypeInfo(TnscEditor);
end;//TkwUserCR1WarningBaloonFormViewer.GetResultTypeInfo

function TkwUserCR1WarningBaloonFormViewer.GetAllParamsCount(const aCtx: TtfwContext): Integer;
begin
 Result := 1;
end;//TkwUserCR1WarningBaloonFormViewer.GetAllParamsCount

function TkwUserCR1WarningBaloonFormViewer.ParamsTypes: PTypeInfoArray;
begin
 Result := OpenTypesToTypes([TypeInfo(TUserCR1_WarningBaloonForm)]);
end;//TkwUserCR1WarningBaloonFormViewer.ParamsTypes

class function TkwUserCR1WarningBaloonFormViewer.GetWordNameForRegister: AnsiString;
begin
 Result := '.TUserCR1_WarningBaloonForm.Viewer';
end;//TkwUserCR1WarningBaloonFormViewer.GetWordNameForRegister

initialization
 Tkw_Form_UserCR1_WarningBaloon.RegisterInEngine;
 {* ����������� Tkw_Form_UserCR1_WarningBaloon }
 Tkw_UserCR1_WarningBaloon_Control_Viewer.RegisterInEngine;
 {* ����������� Tkw_UserCR1_WarningBaloon_Control_Viewer }
 Tkw_UserCR1_WarningBaloon_Control_Viewer_Push.RegisterInEngine;
 {* ����������� Tkw_UserCR1_WarningBaloon_Control_Viewer_Push }
 TkwUserCR1WarningBaloonFormViewer.RegisterInEngine;
 {* ����������� UserCR1_WarningBaloonForm_Viewer }
 TtfwTypeRegistrator.RegisterType(@tfw_tiStruct);
 {* ����������� ���� TtfwContext }
 TtfwTypeRegistrator.RegisterType(TypeInfo(TUserCR1_WarningBaloonForm));
 {* ����������� ���� UserCR1_WarningBaloon }
 TtfwTypeRegistrator.RegisterType(TypeInfo(TnscEditor));
 {* ����������� ���� TnscEditor }
{$IfEnd} // NOT Defined(Admin) AND NOT Defined(Monitorings) AND NOT Defined(NoScripts)

end.
