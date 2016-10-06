unit VCMFormsProcessingPack;

// ������: "w:\common\components\rtl\Garant\ScriptEngine\VCMFormsProcessingPack.pas"
// ���������: "ScriptKeywordsPack"
// ������� ������: "VCMFormsProcessingPack" MUID: (54DCB28C0273)

{$Include w:\common\components\rtl\Garant\ScriptEngine\vcmDefine.inc}

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
 , vcmEntityForm
 , tfwGlobalKeyWord
 , tfwScriptingInterfaces
 , vcmForm
 , TypInfo
 , tfwPropertyLike
 , tfwTypeInfo
 , SysUtils
 , TtfwTypeRegistrator_Proxy
 , tfwScriptingTypes
 //#UC START# *54DCB28C0273impl_uses*
 //#UC END# *54DCB28C0273impl_uses*
;

type
 TkwVcmFormManualUpdateActions = {final} class(TtfwGlobalKeyWord)
  {* ����� ������� vcm:Form:ManualUpdateActions }
  private
   procedure vcm_Form_ManualUpdateActions(const aCtx: TtfwContext;
    aForm: TvcmForm);
    {* ���������� ����� ������� vcm:Form:ManualUpdateActions }
  protected
   class function GetWordNameForRegister: AnsiString; override;
   procedure DoDoIt(const aCtx: TtfwContext); override;
  public
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
 end;//TkwVcmFormManualUpdateActions

 TkwVcmFormReloadToolbars = {final} class(TtfwGlobalKeyWord)
  {* ����� ������� vcm:Form:ReloadToolbars }
  private
   procedure vcm_Form_ReloadToolbars(const aCtx: TtfwContext;
    aForm: TvcmEntityForm);
    {* ���������� ����� ������� vcm:Form:ReloadToolbars }
  protected
   class function GetWordNameForRegister: AnsiString; override;
   procedure DoDoIt(const aCtx: TtfwContext); override;
  public
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
 end;//TkwVcmFormReloadToolbars

 TkwPopFormIsFloatingStateAndParentNotVisible = {final} class(TtfwPropertyLike)
  {* ����� ������� pop:Form:IsFloatingStateAndParentNotVisible }
  private
   function IsFloatingStateAndParentNotVisible(const aCtx: TtfwContext;
    aForm: TvcmEntityForm): Boolean;
    {* ���������� ����� ������� pop:Form:IsFloatingStateAndParentNotVisible }
  protected
   class function GetWordNameForRegister: AnsiString; override;
   procedure DoDoIt(const aCtx: TtfwContext); override;
  public
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
   procedure SetValuePrim(const aValue: TtfwStackValue;
    const aCtx: TtfwContext); override;
 end;//TkwPopFormIsFloatingStateAndParentNotVisible

 TkwPopFormIsFloatingState = {final} class(TtfwPropertyLike)
  {* ����� ������� pop:Form:IsFloatingState }
  private
   function IsFloatingState(const aCtx: TtfwContext;
    aForm: TvcmEntityForm): Boolean;
    {* ���������� ����� ������� pop:Form:IsFloatingState }
  protected
   class function GetWordNameForRegister: AnsiString; override;
   procedure DoDoIt(const aCtx: TtfwContext); override;
  public
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
   procedure SetValuePrim(const aValue: TtfwStackValue;
    const aCtx: TtfwContext); override;
 end;//TkwPopFormIsFloatingState

 TkwPopFormUserType = {final} class(TtfwPropertyLike)
  {* ����� ������� pop:Form:UserType }
  private
   function UserType(const aCtx: TtfwContext;
    aForm: TvcmEntityForm): Integer;
    {* ���������� ����� ������� pop:Form:UserType }
  protected
   class function GetWordNameForRegister: AnsiString; override;
   procedure DoDoIt(const aCtx: TtfwContext); override;
  public
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
   procedure SetValuePrim(const aValue: TtfwStackValue;
    const aCtx: TtfwContext); override;
 end;//TkwPopFormUserType

 TkwPopFormFormID = {final} class(TtfwPropertyLike)
  {* ����� ������� pop:Form:FormID }
  private
   function FormID(const aCtx: TtfwContext;
    aForm: TvcmEntityForm): AnsiString;
    {* ���������� ����� ������� pop:Form:FormID }
  protected
   class function GetWordNameForRegister: AnsiString; override;
   procedure DoDoIt(const aCtx: TtfwContext); override;
  public
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
   procedure SetValuePrim(const aValue: TtfwStackValue;
    const aCtx: TtfwContext); override;
 end;//TkwPopFormFormID

procedure TkwVcmFormManualUpdateActions.vcm_Form_ManualUpdateActions(const aCtx: TtfwContext;
 aForm: TvcmForm);
 {* ���������� ����� ������� vcm:Form:ManualUpdateActions }
//#UC START# *57BACF5E010C_57BACF5E010C_Word_var*
//#UC END# *57BACF5E010C_57BACF5E010C_Word_var*
begin
//#UC START# *57BACF5E010C_57BACF5E010C_Word_impl*
 aForm.ManualUpdateActions;
//#UC END# *57BACF5E010C_57BACF5E010C_Word_impl*
end;//TkwVcmFormManualUpdateActions.vcm_Form_ManualUpdateActions

class function TkwVcmFormManualUpdateActions.GetWordNameForRegister: AnsiString;
begin
 Result := 'vcm:Form:ManualUpdateActions';
end;//TkwVcmFormManualUpdateActions.GetWordNameForRegister

function TkwVcmFormManualUpdateActions.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
begin
 Result := @tfw_tiVoid;
end;//TkwVcmFormManualUpdateActions.GetResultTypeInfo

function TkwVcmFormManualUpdateActions.GetAllParamsCount(const aCtx: TtfwContext): Integer;
begin
 Result := 1;
end;//TkwVcmFormManualUpdateActions.GetAllParamsCount

function TkwVcmFormManualUpdateActions.ParamsTypes: PTypeInfoArray;
begin
 Result := OpenTypesToTypes([TypeInfo(TvcmForm)]);
end;//TkwVcmFormManualUpdateActions.ParamsTypes

procedure TkwVcmFormManualUpdateActions.DoDoIt(const aCtx: TtfwContext);
var l_aForm: TvcmForm;
begin
 try
  l_aForm := TvcmForm(aCtx.rEngine.PopObjAs(TvcmForm));
 except
  on E: Exception do
  begin
   RunnerError('������ ��� ��������� ��������� aForm: TvcmForm : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 vcm_Form_ManualUpdateActions(aCtx, l_aForm);
end;//TkwVcmFormManualUpdateActions.DoDoIt

procedure TkwVcmFormReloadToolbars.vcm_Form_ReloadToolbars(const aCtx: TtfwContext;
 aForm: TvcmEntityForm);
 {* ���������� ����� ������� vcm:Form:ReloadToolbars }
//#UC START# *57F365EB014D_57F365EB014D_Word_var*
//#UC END# *57F365EB014D_57F365EB014D_Word_var*
begin
//#UC START# *57F365EB014D_57F365EB014D_Word_impl*
 aForm.ReloadToolbars;
//#UC END# *57F365EB014D_57F365EB014D_Word_impl*
end;//TkwVcmFormReloadToolbars.vcm_Form_ReloadToolbars

class function TkwVcmFormReloadToolbars.GetWordNameForRegister: AnsiString;
begin
 Result := 'vcm:Form:ReloadToolbars';
end;//TkwVcmFormReloadToolbars.GetWordNameForRegister

function TkwVcmFormReloadToolbars.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
begin
 Result := @tfw_tiVoid;
end;//TkwVcmFormReloadToolbars.GetResultTypeInfo

function TkwVcmFormReloadToolbars.GetAllParamsCount(const aCtx: TtfwContext): Integer;
begin
 Result := 1;
end;//TkwVcmFormReloadToolbars.GetAllParamsCount

function TkwVcmFormReloadToolbars.ParamsTypes: PTypeInfoArray;
begin
 Result := OpenTypesToTypes([TypeInfo(TvcmEntityForm)]);
end;//TkwVcmFormReloadToolbars.ParamsTypes

procedure TkwVcmFormReloadToolbars.DoDoIt(const aCtx: TtfwContext);
var l_aForm: TvcmEntityForm;
begin
 try
  l_aForm := TvcmEntityForm(aCtx.rEngine.PopObjAs(TvcmEntityForm));
 except
  on E: Exception do
  begin
   RunnerError('������ ��� ��������� ��������� aForm: TvcmEntityForm : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 vcm_Form_ReloadToolbars(aCtx, l_aForm);
end;//TkwVcmFormReloadToolbars.DoDoIt

function TkwPopFormIsFloatingStateAndParentNotVisible.IsFloatingStateAndParentNotVisible(const aCtx: TtfwContext;
 aForm: TvcmEntityForm): Boolean;
 {* ���������� ����� ������� pop:Form:IsFloatingStateAndParentNotVisible }
begin
 Result := aForm.IsFloatingStateAndParentNotVisible;
end;//TkwPopFormIsFloatingStateAndParentNotVisible.IsFloatingStateAndParentNotVisible

class function TkwPopFormIsFloatingStateAndParentNotVisible.GetWordNameForRegister: AnsiString;
begin
 Result := 'pop:Form:IsFloatingStateAndParentNotVisible';
end;//TkwPopFormIsFloatingStateAndParentNotVisible.GetWordNameForRegister

function TkwPopFormIsFloatingStateAndParentNotVisible.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
begin
 Result := TypeInfo(Boolean);
end;//TkwPopFormIsFloatingStateAndParentNotVisible.GetResultTypeInfo

function TkwPopFormIsFloatingStateAndParentNotVisible.GetAllParamsCount(const aCtx: TtfwContext): Integer;
begin
 Result := 1;
end;//TkwPopFormIsFloatingStateAndParentNotVisible.GetAllParamsCount

function TkwPopFormIsFloatingStateAndParentNotVisible.ParamsTypes: PTypeInfoArray;
begin
 Result := OpenTypesToTypes([TypeInfo(TvcmEntityForm)]);
end;//TkwPopFormIsFloatingStateAndParentNotVisible.ParamsTypes

procedure TkwPopFormIsFloatingStateAndParentNotVisible.SetValuePrim(const aValue: TtfwStackValue;
 const aCtx: TtfwContext);
begin
 RunnerError('������ ����������� �������� readonly �������� IsFloatingStateAndParentNotVisible', aCtx);
end;//TkwPopFormIsFloatingStateAndParentNotVisible.SetValuePrim

procedure TkwPopFormIsFloatingStateAndParentNotVisible.DoDoIt(const aCtx: TtfwContext);
var l_aForm: TvcmEntityForm;
begin
 try
  l_aForm := TvcmEntityForm(aCtx.rEngine.PopObjAs(TvcmEntityForm));
 except
  on E: Exception do
  begin
   RunnerError('������ ��� ��������� ��������� aForm: TvcmEntityForm : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushBool(IsFloatingStateAndParentNotVisible(aCtx, l_aForm));
end;//TkwPopFormIsFloatingStateAndParentNotVisible.DoDoIt

function TkwPopFormIsFloatingState.IsFloatingState(const aCtx: TtfwContext;
 aForm: TvcmEntityForm): Boolean;
 {* ���������� ����� ������� pop:Form:IsFloatingState }
begin
 Result := aForm.IsFloatingState;
end;//TkwPopFormIsFloatingState.IsFloatingState

class function TkwPopFormIsFloatingState.GetWordNameForRegister: AnsiString;
begin
 Result := 'pop:Form:IsFloatingState';
end;//TkwPopFormIsFloatingState.GetWordNameForRegister

function TkwPopFormIsFloatingState.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
begin
 Result := TypeInfo(Boolean);
end;//TkwPopFormIsFloatingState.GetResultTypeInfo

function TkwPopFormIsFloatingState.GetAllParamsCount(const aCtx: TtfwContext): Integer;
begin
 Result := 1;
end;//TkwPopFormIsFloatingState.GetAllParamsCount

function TkwPopFormIsFloatingState.ParamsTypes: PTypeInfoArray;
begin
 Result := OpenTypesToTypes([TypeInfo(TvcmEntityForm)]);
end;//TkwPopFormIsFloatingState.ParamsTypes

procedure TkwPopFormIsFloatingState.SetValuePrim(const aValue: TtfwStackValue;
 const aCtx: TtfwContext);
begin
 RunnerError('������ ����������� �������� readonly �������� IsFloatingState', aCtx);
end;//TkwPopFormIsFloatingState.SetValuePrim

procedure TkwPopFormIsFloatingState.DoDoIt(const aCtx: TtfwContext);
var l_aForm: TvcmEntityForm;
begin
 try
  l_aForm := TvcmEntityForm(aCtx.rEngine.PopObjAs(TvcmEntityForm));
 except
  on E: Exception do
  begin
   RunnerError('������ ��� ��������� ��������� aForm: TvcmEntityForm : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushBool(IsFloatingState(aCtx, l_aForm));
end;//TkwPopFormIsFloatingState.DoDoIt

function TkwPopFormUserType.UserType(const aCtx: TtfwContext;
 aForm: TvcmEntityForm): Integer;
 {* ���������� ����� ������� pop:Form:UserType }
begin
 Result := aForm.UserType;
end;//TkwPopFormUserType.UserType

class function TkwPopFormUserType.GetWordNameForRegister: AnsiString;
begin
 Result := 'pop:Form:UserType';
end;//TkwPopFormUserType.GetWordNameForRegister

function TkwPopFormUserType.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
begin
 Result := TypeInfo(Integer);
end;//TkwPopFormUserType.GetResultTypeInfo

function TkwPopFormUserType.GetAllParamsCount(const aCtx: TtfwContext): Integer;
begin
 Result := 1;
end;//TkwPopFormUserType.GetAllParamsCount

function TkwPopFormUserType.ParamsTypes: PTypeInfoArray;
begin
 Result := OpenTypesToTypes([TypeInfo(TvcmEntityForm)]);
end;//TkwPopFormUserType.ParamsTypes

procedure TkwPopFormUserType.SetValuePrim(const aValue: TtfwStackValue;
 const aCtx: TtfwContext);
begin
 RunnerError('������ ����������� �������� readonly �������� UserType', aCtx);
end;//TkwPopFormUserType.SetValuePrim

procedure TkwPopFormUserType.DoDoIt(const aCtx: TtfwContext);
var l_aForm: TvcmEntityForm;
begin
 try
  l_aForm := TvcmEntityForm(aCtx.rEngine.PopObjAs(TvcmEntityForm));
 except
  on E: Exception do
  begin
   RunnerError('������ ��� ��������� ��������� aForm: TvcmEntityForm : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushInt(UserType(aCtx, l_aForm));
end;//TkwPopFormUserType.DoDoIt

function TkwPopFormFormID.FormID(const aCtx: TtfwContext;
 aForm: TvcmEntityForm): AnsiString;
 {* ���������� ����� ������� pop:Form:FormID }
//#UC START# *55003BED00FC_55003BED00FC_49525B34022A_Word_var*
//#UC END# *55003BED00FC_55003BED00FC_49525B34022A_Word_var*
begin
//#UC START# *55003BED00FC_55003BED00FC_49525B34022A_Word_impl*
 Result := aForm.FormID.rName;
//#UC END# *55003BED00FC_55003BED00FC_49525B34022A_Word_impl*
end;//TkwPopFormFormID.FormID

class function TkwPopFormFormID.GetWordNameForRegister: AnsiString;
begin
 Result := 'pop:Form:FormID';
end;//TkwPopFormFormID.GetWordNameForRegister

function TkwPopFormFormID.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
begin
 Result := @tfw_tiString;
end;//TkwPopFormFormID.GetResultTypeInfo

function TkwPopFormFormID.GetAllParamsCount(const aCtx: TtfwContext): Integer;
begin
 Result := 1;
end;//TkwPopFormFormID.GetAllParamsCount

function TkwPopFormFormID.ParamsTypes: PTypeInfoArray;
begin
 Result := OpenTypesToTypes([TypeInfo(TvcmEntityForm)]);
end;//TkwPopFormFormID.ParamsTypes

procedure TkwPopFormFormID.SetValuePrim(const aValue: TtfwStackValue;
 const aCtx: TtfwContext);
begin
 RunnerError('������ ����������� �������� readonly �������� FormID', aCtx);
end;//TkwPopFormFormID.SetValuePrim

procedure TkwPopFormFormID.DoDoIt(const aCtx: TtfwContext);
var l_aForm: TvcmEntityForm;
begin
 try
  l_aForm := TvcmEntityForm(aCtx.rEngine.PopObjAs(TvcmEntityForm));
 except
  on E: Exception do
  begin
   RunnerError('������ ��� ��������� ��������� aForm: TvcmEntityForm : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushString(FormID(aCtx, l_aForm));
end;//TkwPopFormFormID.DoDoIt

initialization
 TkwVcmFormManualUpdateActions.RegisterInEngine;
 {* ����������� vcm_Form_ManualUpdateActions }
 TkwVcmFormReloadToolbars.RegisterInEngine;
 {* ����������� vcm_Form_ReloadToolbars }
 TkwPopFormIsFloatingStateAndParentNotVisible.RegisterInEngine;
 {* ����������� pop_Form_IsFloatingStateAndParentNotVisible }
 TkwPopFormIsFloatingState.RegisterInEngine;
 {* ����������� pop_Form_IsFloatingState }
 TkwPopFormUserType.RegisterInEngine;
 {* ����������� pop_Form_UserType }
 TkwPopFormFormID.RegisterInEngine;
 {* ����������� pop_Form_FormID }
 TtfwTypeRegistrator.RegisterType(TypeInfo(TvcmEntityForm));
 {* ����������� ���� TvcmEntityForm }
 TtfwTypeRegistrator.RegisterType(TypeInfo(Boolean));
 {* ����������� ���� Boolean }
 TtfwTypeRegistrator.RegisterType(TypeInfo(Integer));
 {* ����������� ���� Integer }
 TtfwTypeRegistrator.RegisterType(@tfw_tiString);
 {* ����������� ���� AnsiString }
 TtfwTypeRegistrator.RegisterType(TypeInfo(TvcmForm));
 {* ����������� ���� TvcmForm }
{$IfEnd} // NOT Defined(NoScripts) AND NOT Defined(NoVCM)

end.
