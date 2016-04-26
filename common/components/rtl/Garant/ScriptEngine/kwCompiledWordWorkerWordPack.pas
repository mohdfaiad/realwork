unit kwCompiledWordWorkerWordPack;

// ������: "w:\common\components\rtl\Garant\ScriptEngine\kwCompiledWordWorkerWordPack.pas"
// ���������: "ScriptKeywordsPack"
// ������� ������: "kwCompiledWordWorkerWordPack" MUID: (559428430078)

{$Include w:\common\components\rtl\Garant\ScriptEngine\seDefine.inc}

interface

{$If NOT Defined(NoScripts)}
uses
 l3IntfUses
 , tfwScriptingInterfaces
;
{$IfEnd} // NOT Defined(NoScripts)

implementation

{$If NOT Defined(NoScripts)}
uses
 l3ImplUses
 , kwCompiledWordWorkerWord
 , tfwPropertyLike
 , tfwTypeInfo
 , TypInfo
 , SysUtils
 , tfwTypeRegistrator
 , tfwScriptingTypes
;

type
 TkwPopCompiledWordWorkerWordCompiled = {final} class(TtfwPropertyLike)
  {* ����� ������� pop:CompiledWordWorkerWord:Compiled
*��� ����������:* TtfwWord
*������:*
[code]
OBJECT VAR l_TtfwWord
 aCompiledWordWorkerWord pop:CompiledWordWorkerWord:Compiled >>> l_TtfwWord
[code]  }
  private
   function Compiled(const aCtx: TtfwContext;
    aCompiledWordWorkerWord: TkwCompiledWordWorkerWord): TtfwWord;
    {* ���������� ����� ������� pop:CompiledWordWorkerWord:Compiled }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
  public
   procedure SetValuePrim(const aValue: TtfwStackValue;
    const aCtx: TtfwContext); override;
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
 end;//TkwPopCompiledWordWorkerWordCompiled

function TkwPopCompiledWordWorkerWordCompiled.Compiled(const aCtx: TtfwContext;
 aCompiledWordWorkerWord: TkwCompiledWordWorkerWord): TtfwWord;
 {* ���������� ����� ������� pop:CompiledWordWorkerWord:Compiled }
begin
 Result := aCompiledWordWorkerWord.Compiled;
end;//TkwPopCompiledWordWorkerWordCompiled.Compiled

procedure TkwPopCompiledWordWorkerWordCompiled.DoDoIt(const aCtx: TtfwContext);
var l_aCompiledWordWorkerWord: TkwCompiledWordWorkerWord;
begin
 try
  l_aCompiledWordWorkerWord := TkwCompiledWordWorkerWord(aCtx.rEngine.PopObjAs(TkwCompiledWordWorkerWord));
 except
  on E: Exception do
  begin
   RunnerError('������ ��� ��������� ��������� aCompiledWordWorkerWord: TkwCompiledWordWorkerWord : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushObj(Compiled(aCtx, l_aCompiledWordWorkerWord));
end;//TkwPopCompiledWordWorkerWordCompiled.DoDoIt

procedure TkwPopCompiledWordWorkerWordCompiled.SetValuePrim(const aValue: TtfwStackValue;
 const aCtx: TtfwContext);
begin
 RunnerError('������ ����������� �������� readonly �������� Compiled', aCtx);
end;//TkwPopCompiledWordWorkerWordCompiled.SetValuePrim

function TkwPopCompiledWordWorkerWordCompiled.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
begin
 Result := TypeInfo(TtfwWord);
end;//TkwPopCompiledWordWorkerWordCompiled.GetResultTypeInfo

function TkwPopCompiledWordWorkerWordCompiled.GetAllParamsCount(const aCtx: TtfwContext): Integer;
begin
 Result := 1;
end;//TkwPopCompiledWordWorkerWordCompiled.GetAllParamsCount

function TkwPopCompiledWordWorkerWordCompiled.ParamsTypes: PTypeInfoArray;
begin
 Result := OpenTypesToTypes([TypeInfo(TkwCompiledWordWorkerWord)]);
end;//TkwPopCompiledWordWorkerWordCompiled.ParamsTypes

class function TkwPopCompiledWordWorkerWordCompiled.GetWordNameForRegister: AnsiString;
begin
 Result := 'pop:CompiledWordWorkerWord:Compiled';
end;//TkwPopCompiledWordWorkerWordCompiled.GetWordNameForRegister

initialization
 TkwPopCompiledWordWorkerWordCompiled.RegisterInEngine;
 {* ����������� pop_CompiledWordWorkerWord_Compiled }
 TtfwTypeRegistrator.RegisterType(@tfw_tiStruct);
 {* ����������� ���� TtfwContext }
 TtfwTypeRegistrator.RegisterType(TypeInfo(TkwCompiledWordWorkerWord));
 {* ����������� ���� TkwCompiledWordWorkerWord }
 TtfwTypeRegistrator.RegisterType(TypeInfo(TtfwWord));
 {* ����������� ���� TtfwWord }
{$IfEnd} // NOT Defined(NoScripts)

end.
