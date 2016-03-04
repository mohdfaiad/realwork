unit MedicListSynchroViewKeywordsPack;
 {* ����� ���� ������� ��� ������� � ����������� ��������� ����� MedicListSynchroView }

// ������: "w:\garant6x\implementation\Garant\GbaNemesis\View\Inpharm\MedicListSynchroViewKeywordsPack.pas"
// ���������: "ScriptKeywordsPack"

{$Include w:\garant6x\implementation\Garant\nsDefine.inc}

interface

{$If NOT Defined(Admin) AND NOT Defined(Monitorings) AND NOT Defined(NoScripts)}
uses
 l3IntfUses
 , vtPanel
;
{$IfEnd} // NOT Defined(Admin) AND NOT Defined(Monitorings) AND NOT Defined(NoScripts)

implementation

{$If NOT Defined(Admin) AND NOT Defined(Monitorings) AND NOT Defined(NoScripts)}
uses
 l3ImplUses
 , MedicListSynchroView_Form
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
 Tkw_Form_MedicListSynchroView = {final} class(TtfwControlString)
  {* ����� ������� ��� �������������� ����� MedicListSynchroView
----
*������ �������������*:
[code]
'aControl' �����::MedicListSynchroView TryFocus ASSERT
[code] }
  protected
   class function GetWordNameForRegister: AnsiString; override;
   function GetString: AnsiString; override;
 end;//Tkw_Form_MedicListSynchroView

 Tkw_MedicListSynchroView_Control_ztChild = {final} class(TtfwControlString)
  {* ����� ������� ��� �������������� �������� ztChild
----
*������ �������������*:
[code]
�������::ztChild TryFocus ASSERT
[code] }
  protected
   class function GetWordNameForRegister: AnsiString; override;
   function GetString: AnsiString; override;
   class procedure RegisterInEngine; override;
 end;//Tkw_MedicListSynchroView_Control_ztChild

 Tkw_MedicListSynchroView_Control_ztChild_Push = {final} class(TkwBynameControlPush)
  {* ����� ������� ��� �������� ztChild
----
*������ �������������*:
[code]
�������::ztChild:push pop:control:SetFocus ASSERT
[code] }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
 end;//Tkw_MedicListSynchroView_Control_ztChild_Push

 TkwEnMedicListSynchroViewZtChild = {final} class(TtfwPropertyLike)
  {* ����� ������� .Ten_MedicListSynchroView.ztChild
[panel]������� ztChild ����� Ten_MedicListSynchroView[panel]
*��� ����������:* TvtPanel
*������:*
[code]
OBJECT VAR l_TvtPanel
 aen_MedicListSynchroView .Ten_MedicListSynchroView.ztChild >>> l_TvtPanel
[code]  }
  private
   function ztChild(const aCtx: TtfwContext;
    aen_MedicListSynchroView: Ten_MedicListSynchroView): TvtPanel;
    {* ���������� ����� ������� .Ten_MedicListSynchroView.ztChild }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
  public
   procedure SetValuePrim(const aValue: TtfwStackValue;
    const aCtx: TtfwContext); override;
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
 end;//TkwEnMedicListSynchroViewZtChild

class function Tkw_Form_MedicListSynchroView.GetWordNameForRegister: AnsiString;
begin
 Result := '�����::MedicListSynchroView';
end;//Tkw_Form_MedicListSynchroView.GetWordNameForRegister

function Tkw_Form_MedicListSynchroView.GetString: AnsiString;
begin
 Result := 'en_MedicListSynchroView';
end;//Tkw_Form_MedicListSynchroView.GetString

class function Tkw_MedicListSynchroView_Control_ztChild.GetWordNameForRegister: AnsiString;
begin
 Result := '�������::ztChild';
end;//Tkw_MedicListSynchroView_Control_ztChild.GetWordNameForRegister

function Tkw_MedicListSynchroView_Control_ztChild.GetString: AnsiString;
begin
 Result := 'ztChild';
end;//Tkw_MedicListSynchroView_Control_ztChild.GetString

class procedure Tkw_MedicListSynchroView_Control_ztChild.RegisterInEngine;
begin
 inherited;
 TtfwClassRef.Register(TvtPanel);
end;//Tkw_MedicListSynchroView_Control_ztChild.RegisterInEngine

procedure Tkw_MedicListSynchroView_Control_ztChild_Push.DoDoIt(const aCtx: TtfwContext);
begin
 aCtx.rEngine.PushString('ztChild');
 inherited;
end;//Tkw_MedicListSynchroView_Control_ztChild_Push.DoDoIt

class function Tkw_MedicListSynchroView_Control_ztChild_Push.GetWordNameForRegister: AnsiString;
begin
 Result := '�������::ztChild:push';
end;//Tkw_MedicListSynchroView_Control_ztChild_Push.GetWordNameForRegister

function TkwEnMedicListSynchroViewZtChild.ztChild(const aCtx: TtfwContext;
 aen_MedicListSynchroView: Ten_MedicListSynchroView): TvtPanel;
 {* ���������� ����� ������� .Ten_MedicListSynchroView.ztChild }
begin
 Result := aen_MedicListSynchroView.ztChild;
end;//TkwEnMedicListSynchroViewZtChild.ztChild

procedure TkwEnMedicListSynchroViewZtChild.DoDoIt(const aCtx: TtfwContext);
var l_aen_MedicListSynchroView: Ten_MedicListSynchroView;
begin
 try
  l_aen_MedicListSynchroView := Ten_MedicListSynchroView(aCtx.rEngine.PopObjAs(Ten_MedicListSynchroView));
 except
  on E: Exception do
  begin
   RunnerError('������ ��� ��������� ��������� aen_MedicListSynchroView: Ten_MedicListSynchroView : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushObj(ztChild(aCtx, l_aen_MedicListSynchroView));
end;//TkwEnMedicListSynchroViewZtChild.DoDoIt

class function TkwEnMedicListSynchroViewZtChild.GetWordNameForRegister: AnsiString;
begin
 Result := '.Ten_MedicListSynchroView.ztChild';
end;//TkwEnMedicListSynchroViewZtChild.GetWordNameForRegister

procedure TkwEnMedicListSynchroViewZtChild.SetValuePrim(const aValue: TtfwStackValue;
 const aCtx: TtfwContext);
begin
 RunnerError('������ ����������� �������� readonly �������� ztChild', aCtx);
end;//TkwEnMedicListSynchroViewZtChild.SetValuePrim

function TkwEnMedicListSynchroViewZtChild.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
begin
 Result := TypeInfo(TvtPanel);
end;//TkwEnMedicListSynchroViewZtChild.GetResultTypeInfo

function TkwEnMedicListSynchroViewZtChild.GetAllParamsCount(const aCtx: TtfwContext): Integer;
begin
 Result := 1;
end;//TkwEnMedicListSynchroViewZtChild.GetAllParamsCount

function TkwEnMedicListSynchroViewZtChild.ParamsTypes: PTypeInfoArray;
begin
 Result := OpenTypesToTypes([TypeInfo(Ten_MedicListSynchroView)]);
end;//TkwEnMedicListSynchroViewZtChild.ParamsTypes

initialization
 Tkw_Form_MedicListSynchroView.RegisterInEngine;
 {* ����������� Tkw_Form_MedicListSynchroView }
 Tkw_MedicListSynchroView_Control_ztChild.RegisterInEngine;
 {* ����������� Tkw_MedicListSynchroView_Control_ztChild }
 Tkw_MedicListSynchroView_Control_ztChild_Push.RegisterInEngine;
 {* ����������� Tkw_MedicListSynchroView_Control_ztChild_Push }
 TkwEnMedicListSynchroViewZtChild.RegisterInEngine;
 {* ����������� en_MedicListSynchroView_ztChild }
 TtfwTypeRegistrator.RegisterType(@tfw_tiStruct);
 {* ����������� ���� TtfwContext }
 TtfwTypeRegistrator.RegisterType(TypeInfo(Ten_MedicListSynchroView));
 {* ����������� ���� MedicListSynchroView }
 TtfwTypeRegistrator.RegisterType(TypeInfo(TvtPanel));
 {* ����������� ���� TvtPanel }
{$IfEnd} // NOT Defined(Admin) AND NOT Defined(Monitorings) AND NOT Defined(NoScripts)

end.
