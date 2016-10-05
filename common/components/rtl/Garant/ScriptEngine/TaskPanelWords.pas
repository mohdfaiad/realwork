unit TaskPanelWords;

// ������: "w:\common\components\rtl\Garant\ScriptEngine\TaskPanelWords.pas"
// ���������: "ScriptKeywordsPack"
// ������� ������: "TaskPanelWords" MUID: (5101345E0143)

{$Include w:\common\components\rtl\Garant\ScriptEngine\seDefine.inc}

interface

{$If NOT Defined(NoScripts) AND NOT Defined(NoVCM)}
uses
 l3IntfUses
;
{$IfEnd} // NOT Defined(NoScripts) AND NOT Defined(NoVCM)

implementation

{$If NOT Defined(NoScripts) AND NOT Defined(NoVCM)}
uses
 l3ImplUses
 {$If Defined(Nemesis)}
 , nscTasksPanelView
 {$IfEnd} // Defined(Nemesis)
 , tfwClassLike
 , tfwScriptingInterfaces
 , TypInfo
 , tfwPropertyLike
 , tfwTypeInfo
 , SysUtils
 , TtfwTypeRegistrator_Proxy
 , tfwScriptingTypes
 //#UC START# *5101345E0143impl_uses*
 //#UC END# *5101345E0143impl_uses*
;

type
 TkwPopTaskPanelGetHideField = {final} class(TtfwClassLike)
  {* ����� ������� pop:TaskPanel:GetHideField }
  private
   function GetHideField(const aCtx: TtfwContext;
    aTaskPanel: TnscTasksPanelView;
    anIndex: Integer): TnscTasksPanelHideField;
    {* ���������� ����� ������� pop:TaskPanel:GetHideField }
  protected
   class function GetWordNameForRegister: AnsiString; override;
   procedure DoDoIt(const aCtx: TtfwContext); override;
  public
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
 end;//TkwPopTaskPanelGetHideField

 TkwPopTaskPanelCount = {final} class(TtfwPropertyLike)
  {* ����� ������� pop:TaskPanel:Count }
  private
   function Count(const aCtx: TtfwContext;
    aTaskPanel: TnscTasksPanelView): Integer;
    {* ���������� ����� ������� pop:TaskPanel:Count }
  protected
   class function GetWordNameForRegister: AnsiString; override;
   procedure DoDoIt(const aCtx: TtfwContext); override;
  public
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
   procedure SetValuePrim(const aValue: TtfwStackValue;
    const aCtx: TtfwContext); override;
 end;//TkwPopTaskPanelCount

function TkwPopTaskPanelGetHideField.GetHideField(const aCtx: TtfwContext;
 aTaskPanel: TnscTasksPanelView;
 anIndex: Integer): TnscTasksPanelHideField;
 {* ���������� ����� ������� pop:TaskPanel:GetHideField }
//#UC START# *552FCA800230_552FCA800230_4D3424C203C2_Word_var*
//#UC END# *552FCA800230_552FCA800230_4D3424C203C2_Word_var*
begin
//#UC START# *552FCA800230_552FCA800230_4D3424C203C2_Word_impl*
 Result := aTaskPanel.HideField[anIndex];
//#UC END# *552FCA800230_552FCA800230_4D3424C203C2_Word_impl*
end;//TkwPopTaskPanelGetHideField.GetHideField

class function TkwPopTaskPanelGetHideField.GetWordNameForRegister: AnsiString;
begin
 Result := 'pop:TaskPanel:GetHideField';
end;//TkwPopTaskPanelGetHideField.GetWordNameForRegister

function TkwPopTaskPanelGetHideField.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
begin
 Result := TypeInfo(TnscTasksPanelHideField);
end;//TkwPopTaskPanelGetHideField.GetResultTypeInfo

function TkwPopTaskPanelGetHideField.GetAllParamsCount(const aCtx: TtfwContext): Integer;
begin
 Result := 2;
end;//TkwPopTaskPanelGetHideField.GetAllParamsCount

function TkwPopTaskPanelGetHideField.ParamsTypes: PTypeInfoArray;
begin
 Result := OpenTypesToTypes([TypeInfo(TnscTasksPanelView), TypeInfo(Integer)]);
end;//TkwPopTaskPanelGetHideField.ParamsTypes

procedure TkwPopTaskPanelGetHideField.DoDoIt(const aCtx: TtfwContext);
var l_aTaskPanel: TnscTasksPanelView;
var l_anIndex: Integer;
begin
 try
  l_aTaskPanel := TnscTasksPanelView(aCtx.rEngine.PopObjAs(TnscTasksPanelView));
 except
  on E: Exception do
  begin
   RunnerError('������ ��� ��������� ��������� aTaskPanel: TnscTasksPanelView : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_anIndex := aCtx.rEngine.PopInt;
 except
  on E: Exception do
  begin
   RunnerError('������ ��� ��������� ��������� anIndex: Integer : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushObj(GetHideField(aCtx, l_aTaskPanel, l_anIndex));
end;//TkwPopTaskPanelGetHideField.DoDoIt

function TkwPopTaskPanelCount.Count(const aCtx: TtfwContext;
 aTaskPanel: TnscTasksPanelView): Integer;
 {* ���������� ����� ������� pop:TaskPanel:Count }
begin
 Result := aTaskPanel.Count;
end;//TkwPopTaskPanelCount.Count

class function TkwPopTaskPanelCount.GetWordNameForRegister: AnsiString;
begin
 Result := 'pop:TaskPanel:Count';
end;//TkwPopTaskPanelCount.GetWordNameForRegister

function TkwPopTaskPanelCount.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
begin
 Result := TypeInfo(Integer);
end;//TkwPopTaskPanelCount.GetResultTypeInfo

function TkwPopTaskPanelCount.GetAllParamsCount(const aCtx: TtfwContext): Integer;
begin
 Result := 1;
end;//TkwPopTaskPanelCount.GetAllParamsCount

function TkwPopTaskPanelCount.ParamsTypes: PTypeInfoArray;
begin
 Result := OpenTypesToTypes([TypeInfo(TnscTasksPanelView)]);
end;//TkwPopTaskPanelCount.ParamsTypes

procedure TkwPopTaskPanelCount.SetValuePrim(const aValue: TtfwStackValue;
 const aCtx: TtfwContext);
begin
 RunnerError('������ ����������� �������� readonly �������� Count', aCtx);
end;//TkwPopTaskPanelCount.SetValuePrim

procedure TkwPopTaskPanelCount.DoDoIt(const aCtx: TtfwContext);
var l_aTaskPanel: TnscTasksPanelView;
begin
 try
  l_aTaskPanel := TnscTasksPanelView(aCtx.rEngine.PopObjAs(TnscTasksPanelView));
 except
  on E: Exception do
  begin
   RunnerError('������ ��� ��������� ��������� aTaskPanel: TnscTasksPanelView : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushInt(Count(aCtx, l_aTaskPanel));
end;//TkwPopTaskPanelCount.DoDoIt

initialization
 TkwPopTaskPanelGetHideField.RegisterInEngine;
 {* ����������� pop_TaskPanel_GetHideField }
 TkwPopTaskPanelCount.RegisterInEngine;
 {* ����������� pop_TaskPanel_Count }
{$If Defined(Nemesis)}
 TtfwTypeRegistrator.RegisterType(TypeInfo(TnscTasksPanelView));
 {* ����������� ���� TnscTasksPanelView }
{$IfEnd} // Defined(Nemesis)
{$If Defined(Nemesis)}
 TtfwTypeRegistrator.RegisterType(TypeInfo(TnscTasksPanelHideField));
 {* ����������� ���� TnscTasksPanelHideField }
{$IfEnd} // Defined(Nemesis)
 TtfwTypeRegistrator.RegisterType(TypeInfo(Integer));
 {* ����������� ���� Integer }
{$IfEnd} // NOT Defined(NoScripts) AND NOT Defined(NoVCM)

end.
