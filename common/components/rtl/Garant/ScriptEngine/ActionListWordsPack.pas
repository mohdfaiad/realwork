unit ActionListWordsPack;

// ������: "w:\common\components\rtl\Garant\ScriptEngine\ActionListWordsPack.pas"
// ���������: "ScriptKeywordsPack"
// ������� ������: "ActionListWordsPack" MUID: (55B8E44302B1)

{$Include w:\common\components\rtl\Garant\ScriptEngine\seDefine.inc}

interface

{$If NOT Defined(NoScripts) AND NOT Defined(NoVCL)}
uses
 l3IntfUses
 //#UC START# *55B8E44302B1intf_uses*
 //#UC END# *55B8E44302B1intf_uses*
;
{$IfEnd} // NOT Defined(NoScripts) AND NOT Defined(NoVCL)

implementation

{$If NOT Defined(NoScripts) AND NOT Defined(NoVCL)}
uses
 l3ImplUses
 , ActnList
 , tfwClassLike
 , tfwScriptingInterfaces
 , TypInfo
 , ContainedActionsWordspack
 , SysUtils
 , TtfwTypeRegistrator_Proxy
 , tfwScriptingTypes
 //#UC START# *55B8E44302B1impl_uses*
 //#UC END# *55B8E44302B1impl_uses*
;

type
 TkwPopActionListFindAction = {final} class(TtfwClassLike)
  {* ����� ������� pop:ActionList:FindAction }
  private
   function FindAction(const aCtx: TtfwContext;
    aActionList: TActionList;
    const anActionName: AnsiString): TContainedAction;
    {* ���������� ����� ������� pop:ActionList:FindAction }
  protected
   class function GetWordNameForRegister: AnsiString; override;
   procedure DoDoIt(const aCtx: TtfwContext); override;
  public
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
 end;//TkwPopActionListFindAction

function TkwPopActionListFindAction.FindAction(const aCtx: TtfwContext;
 aActionList: TActionList;
 const anActionName: AnsiString): TContainedAction;
 {* ���������� ����� ������� pop:ActionList:FindAction }
//#UC START# *55B8E46F00AF_55B8E46F00AF_4EF32DDB0235_Word_var*
var
 l_Index : Integer;
//#UC END# *55B8E46F00AF_55B8E46F00AF_4EF32DDB0235_Word_var*
begin
//#UC START# *55B8E46F00AF_55B8E46F00AF_4EF32DDB0235_Word_impl*
 Result := nil;
 for l_Index := 0 to aActionList.ActionCount - 1 do
 begin
  Result := aActionList.Actions[l_Index];
  if (Result.Name = anActionName) then
   Break
  else
   Result := nil;
 end; // for i := 0 to l_ActList.ActionCount - 1 do
//#UC END# *55B8E46F00AF_55B8E46F00AF_4EF32DDB0235_Word_impl*
end;//TkwPopActionListFindAction.FindAction

class function TkwPopActionListFindAction.GetWordNameForRegister: AnsiString;
begin
 Result := 'pop:ActionList:FindAction';
end;//TkwPopActionListFindAction.GetWordNameForRegister

function TkwPopActionListFindAction.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
begin
 Result := TypeInfo(TContainedAction);
end;//TkwPopActionListFindAction.GetResultTypeInfo

function TkwPopActionListFindAction.GetAllParamsCount(const aCtx: TtfwContext): Integer;
begin
 Result := 2;
end;//TkwPopActionListFindAction.GetAllParamsCount

function TkwPopActionListFindAction.ParamsTypes: PTypeInfoArray;
begin
 Result := OpenTypesToTypes([TypeInfo(TActionList), @tfw_tiString]);
end;//TkwPopActionListFindAction.ParamsTypes

procedure TkwPopActionListFindAction.DoDoIt(const aCtx: TtfwContext);
var l_aActionList: TActionList;
var l_anActionName: AnsiString;
begin
 try
  l_aActionList := TActionList(aCtx.rEngine.PopObjAs(TActionList));
 except
  on E: Exception do
  begin
   RunnerError('������ ��� ��������� ��������� aActionList: TActionList : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_anActionName := aCtx.rEngine.PopDelphiString;
 except
  on E: Exception do
  begin
   RunnerError('������ ��� ��������� ��������� anActionName: AnsiString : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushObj(FindAction(aCtx, l_aActionList, l_anActionName));
end;//TkwPopActionListFindAction.DoDoIt

initialization
 TkwPopActionListFindAction.RegisterInEngine;
 {* ����������� pop_ActionList_FindAction }
 TtfwTypeRegistrator.RegisterType(TypeInfo(TActionList));
 {* ����������� ���� TActionList }
 TtfwTypeRegistrator.RegisterType(TypeInfo(TContainedAction));
 {* ����������� ���� TContainedAction }
 TtfwTypeRegistrator.RegisterType(@tfw_tiString);
 {* ����������� ���� AnsiString }
{$IfEnd} // NOT Defined(NoScripts) AND NOT Defined(NoVCL)

end.
