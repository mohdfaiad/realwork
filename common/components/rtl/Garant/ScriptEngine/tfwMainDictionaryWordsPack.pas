unit tfwMainDictionaryWordsPack;

// ������: "w:\common\components\rtl\Garant\ScriptEngine\tfwMainDictionaryWordsPack.pas"
// ���������: "ScriptKeywordsPack"
// ������� ������: "tfwMainDictionaryWordsPack" MUID: (55ED48FA02A9)

{$Include w:\common\components\rtl\Garant\ScriptEngine\seDefine.inc}

interface

{$If NOT Defined(NoScripts)}
uses
 l3IntfUses
;
{$IfEnd} // NOT Defined(NoScripts)

implementation

{$If NOT Defined(NoScripts)}
uses
 l3ImplUses
 , tfwMainDictionary
 , tfwClassLike
 , tfwScriptingInterfaces
 , TypInfo
 , SysUtils
 , tfwTypeRegistrator
 , tfwScriptingTypes
;

type
 TkwPopMainDictionaryCompiledCode = {final} class(TtfwClassLike)
  {* ����� ������� pop:MainDictionary:CompiledCode
*��� ����������:* TtfwWord
*������:*
[code]
OBJECT VAR l_TtfwWord
 aMainDictionary pop:MainDictionary:CompiledCode >>> l_TtfwWord
[code]  }
  private
   function CompiledCode(const aCtx: TtfwContext;
    aMainDictionary: TtfwMainDictionary): TtfwWord;
    {* ���������� ����� ������� pop:MainDictionary:CompiledCode }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
  public
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
 end;//TkwPopMainDictionaryCompiledCode

function TkwPopMainDictionaryCompiledCode.CompiledCode(const aCtx: TtfwContext;
 aMainDictionary: TtfwMainDictionary): TtfwWord;
 {* ���������� ����� ������� pop:MainDictionary:CompiledCode }
//#UC START# *E184DB3F75A6_FA2C6FCB48FD_var*
//#UC END# *E184DB3F75A6_FA2C6FCB48FD_var*
begin
//#UC START# *E184DB3F75A6_FA2C6FCB48FD_impl*
 Result := aMainDictionary.CompiledCode;
//#UC END# *E184DB3F75A6_FA2C6FCB48FD_impl*
end;//TkwPopMainDictionaryCompiledCode.CompiledCode

procedure TkwPopMainDictionaryCompiledCode.DoDoIt(const aCtx: TtfwContext);
var l_aMainDictionary: TtfwMainDictionary;
begin
 try
  l_aMainDictionary := TtfwMainDictionary(aCtx.rEngine.PopObjAs(TtfwMainDictionary));
 except
  on E: Exception do
  begin
   RunnerError('������ ��� ��������� ��������� aMainDictionary: TtfwMainDictionary : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushObj(CompiledCode(aCtx, l_aMainDictionary));
end;//TkwPopMainDictionaryCompiledCode.DoDoIt

function TkwPopMainDictionaryCompiledCode.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
begin
 Result := TypeInfo(TtfwWord);
end;//TkwPopMainDictionaryCompiledCode.GetResultTypeInfo

function TkwPopMainDictionaryCompiledCode.GetAllParamsCount(const aCtx: TtfwContext): Integer;
begin
 Result := 1;
end;//TkwPopMainDictionaryCompiledCode.GetAllParamsCount

function TkwPopMainDictionaryCompiledCode.ParamsTypes: PTypeInfoArray;
begin
 Result := OpenTypesToTypes([TypeInfo(TtfwMainDictionary)]);
end;//TkwPopMainDictionaryCompiledCode.ParamsTypes

class function TkwPopMainDictionaryCompiledCode.GetWordNameForRegister: AnsiString;
begin
 Result := 'pop:MainDictionary:CompiledCode';
end;//TkwPopMainDictionaryCompiledCode.GetWordNameForRegister

initialization
 TkwPopMainDictionaryCompiledCode.RegisterInEngine;
 {* ����������� pop_MainDictionary_CompiledCode }
 TtfwTypeRegistrator.RegisterType(@tfw_tiStruct);
 {* ����������� ���� TtfwContext }
 TtfwTypeRegistrator.RegisterType(TypeInfo(TtfwMainDictionary));
 {* ����������� ���� TtfwMainDictionary }
 TtfwTypeRegistrator.RegisterType(TypeInfo(TtfwWord));
 {* ����������� ���� TtfwWord }
{$IfEnd} // NOT Defined(NoScripts)

end.
