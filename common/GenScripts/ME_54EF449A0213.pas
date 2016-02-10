unit l3NodesKeyWordsPack;

// ������: "w:\common\components\rtl\Garant\ScriptEngine\l3NodesKeyWordsPack.pas"
// ���������: "ScriptKeywordsPack"

{$Include seDefine.inc}

interface

{$If NOT Defined(NoScripts)}
uses
 l3IntfUses
 , l3TreeInterfaces
 , l3Interfaces
 , tfwAxiomaticsResNameGetter
 , tfwPropertyLike
 , tfwScriptingInterfaces
 , tfwTypeInfo
 , TypInfo
;
{$IfEnd} // NOT Defined(NoScripts)

implementation

{$If NOT Defined(NoScripts)}
uses
 l3ImplUses
 , tfwScriptingTypes
 , tfwTypeRegistrator
 , SysUtils
;

type
 //#UC START# *FCED2C4D2DBAci*
 //#UC END# *FCED2C4D2DBAci*
 //#UC START# *FCED2C4D2DBAcit*
 //#UC END# *FCED2C4D2DBAcit*
 Tl3NodesKeyWordsPackResNameGetter = {final} class(TtfwAxiomaticsResNameGetter)
  {* ����������� ������������ ����������� }
  public
   class function ResName: AnsiString; override;
 //#UC START# *FCED2C4D2DBApubl*
 //#UC END# *FCED2C4D2DBApubl*
 end;//Tl3NodesKeyWordsPackResNameGetter

 TkwNodeIsFirst = {final} class(TtfwPropertyLike)
  {* ����� ������� Node:IsFirst
[panel]���� ������?[panel]
*��� ����������:* Boolean
*������:*
[code]
BOOLEAN VAR l_Boolean
 aNode Node:IsFirst >>> l_Boolean
[code]  }
  private
   function IsFirst(const aCtx: TtfwContext;
    const aNode: Il3SimpleNode): Boolean;
    {* ���������� ����� ������� Node:IsFirst }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
  public
   procedure SetValuePrim(const aValue: TtfwStackValue;
    const aCtx: TtfwContext); override;
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
 end;//TkwNodeIsFirst

 TkwNodeIsLast = {final} class(TtfwPropertyLike)
  {* ����� ������� Node:IsLast
[panel]���� ���������?[panel]
*��� ����������:* Boolean
*������:*
[code]
BOOLEAN VAR l_Boolean
 aNode Node:IsLast >>> l_Boolean
[code]  }
  private
   function IsLast(const aCtx: TtfwContext;
    const aNode: Il3SimpleNode): Boolean;
    {* ���������� ����� ������� Node:IsLast }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
  public
   procedure SetValuePrim(const aValue: TtfwStackValue;
    const aCtx: TtfwContext); override;
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
 end;//TkwNodeIsLast

 TkwNodeFlags = {final} class(TtfwPropertyLike)
  {* ����� ������� Node:Flags
[panel]����� ����[panel]
*��� ����������:* Integer
*������:*
[code]
INTEGER VAR l_Integer
 aNode Node:Flags >>> l_Integer
[code]  }
  private
   function Flags(const aCtx: TtfwContext;
    const aNode: Il3SimpleNode): Integer;
    {* ���������� ����� ������� Node:Flags }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
  public
   procedure SetValuePrim(const aValue: TtfwStackValue;
    const aCtx: TtfwContext); override;
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
 end;//TkwNodeFlags

 TkwNodeText = {final} class(TtfwPropertyLike)
  {* ����� ������� Node:Text
[panel]����� ����[panel]
*��� ����������:* Tl3WString
*������:*
[code]
STRING VAR l_Tl3WString
 aNode Node:Text >>> l_Tl3WString
[code]  }
  private
   function Text(const aCtx: TtfwContext;
    const aNode: Il3SimpleNode): Tl3WString;
    {* ���������� ����� ������� Node:Text }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
  public
   procedure SetValuePrim(const aValue: TtfwStackValue;
    const aCtx: TtfwContext); override;
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
 end;//TkwNodeText

class function Tl3NodesKeyWordsPackResNameGetter.ResName: AnsiString;
begin
  Result := 'l3NodesKeyWordsPack';
end;//Tl3NodesKeyWordsPackResNameGetter.ResName

 {$R l3NodesKeyWordsPack.res}

function TkwNodeIsFirst.IsFirst(const aCtx: TtfwContext;
 const aNode: Il3SimpleNode): Boolean;
 {* ���������� ����� ������� Node:IsFirst }
//#UC START# *13DEAD421A35_45751BDD834B_var*
//#UC END# *13DEAD421A35_45751BDD834B_var*
begin
//#UC START# *13DEAD421A35_45751BDD834B_impl*
 !!! Needs to be implemented !!!
//#UC END# *13DEAD421A35_45751BDD834B_impl*
end;//TkwNodeIsFirst.IsFirst

procedure TkwNodeIsFirst.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_45751BDD834B_var*
//#UC END# *4DAEEDE10285_45751BDD834B_var*
begin
//#UC START# *4DAEEDE10285_45751BDD834B_impl*
 !!! Needs to be implemented !!!
//#UC END# *4DAEEDE10285_45751BDD834B_impl*
end;//TkwNodeIsFirst.DoDoIt

class function TkwNodeIsFirst.GetWordNameForRegister: AnsiString;
begin
 Result := 'Node:IsFirst';
end;//TkwNodeIsFirst.GetWordNameForRegister

procedure TkwNodeIsFirst.SetValuePrim(const aValue: TtfwStackValue;
 const aCtx: TtfwContext);
//#UC START# *52D00B00031A_45751BDD834B_var*
//#UC END# *52D00B00031A_45751BDD834B_var*
begin
//#UC START# *52D00B00031A_45751BDD834B_impl*
 !!! Needs to be implemented !!!
//#UC END# *52D00B00031A_45751BDD834B_impl*
end;//TkwNodeIsFirst.SetValuePrim

function TkwNodeIsFirst.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
begin
 Result := TypeInfo(Boolean);
end;//TkwNodeIsFirst.GetResultTypeInfo

function TkwNodeIsFirst.GetAllParamsCount(const aCtx: TtfwContext): Integer;
begin
 Result := 1;
end;//TkwNodeIsFirst.GetAllParamsCount

function TkwNodeIsFirst.ParamsTypes: PTypeInfoArray;
//#UC START# *5617F4D00243_45751BDD834B_var*
//#UC END# *5617F4D00243_45751BDD834B_var*
begin
//#UC START# *5617F4D00243_45751BDD834B_impl*
 !!! Needs to be implemented !!!
//#UC END# *5617F4D00243_45751BDD834B_impl*
end;//TkwNodeIsFirst.ParamsTypes

function TkwNodeIsLast.IsLast(const aCtx: TtfwContext;
 const aNode: Il3SimpleNode): Boolean;
 {* ���������� ����� ������� Node:IsLast }
//#UC START# *CED6FFACFE06_97BDCC1D1FFB_var*
//#UC END# *CED6FFACFE06_97BDCC1D1FFB_var*
begin
//#UC START# *CED6FFACFE06_97BDCC1D1FFB_impl*
 !!! Needs to be implemented !!!
//#UC END# *CED6FFACFE06_97BDCC1D1FFB_impl*
end;//TkwNodeIsLast.IsLast

procedure TkwNodeIsLast.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_97BDCC1D1FFB_var*
//#UC END# *4DAEEDE10285_97BDCC1D1FFB_var*
begin
//#UC START# *4DAEEDE10285_97BDCC1D1FFB_impl*
 !!! Needs to be implemented !!!
//#UC END# *4DAEEDE10285_97BDCC1D1FFB_impl*
end;//TkwNodeIsLast.DoDoIt

class function TkwNodeIsLast.GetWordNameForRegister: AnsiString;
begin
 Result := 'Node:IsLast';
end;//TkwNodeIsLast.GetWordNameForRegister

procedure TkwNodeIsLast.SetValuePrim(const aValue: TtfwStackValue;
 const aCtx: TtfwContext);
//#UC START# *52D00B00031A_97BDCC1D1FFB_var*
//#UC END# *52D00B00031A_97BDCC1D1FFB_var*
begin
//#UC START# *52D00B00031A_97BDCC1D1FFB_impl*
 !!! Needs to be implemented !!!
//#UC END# *52D00B00031A_97BDCC1D1FFB_impl*
end;//TkwNodeIsLast.SetValuePrim

function TkwNodeIsLast.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
begin
 Result := TypeInfo(Boolean);
end;//TkwNodeIsLast.GetResultTypeInfo

function TkwNodeIsLast.GetAllParamsCount(const aCtx: TtfwContext): Integer;
begin
 Result := 1;
end;//TkwNodeIsLast.GetAllParamsCount

function TkwNodeIsLast.ParamsTypes: PTypeInfoArray;
//#UC START# *5617F4D00243_97BDCC1D1FFB_var*
//#UC END# *5617F4D00243_97BDCC1D1FFB_var*
begin
//#UC START# *5617F4D00243_97BDCC1D1FFB_impl*
 !!! Needs to be implemented !!!
//#UC END# *5617F4D00243_97BDCC1D1FFB_impl*
end;//TkwNodeIsLast.ParamsTypes

function TkwNodeFlags.Flags(const aCtx: TtfwContext;
 const aNode: Il3SimpleNode): Integer;
 {* ���������� ����� ������� Node:Flags }
//#UC START# *5AC32421B6A5_DA2D728F699C_var*
//#UC END# *5AC32421B6A5_DA2D728F699C_var*
begin
//#UC START# *5AC32421B6A5_DA2D728F699C_impl*
 !!! Needs to be implemented !!!
//#UC END# *5AC32421B6A5_DA2D728F699C_impl*
end;//TkwNodeFlags.Flags

procedure TkwNodeFlags.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_DA2D728F699C_var*
//#UC END# *4DAEEDE10285_DA2D728F699C_var*
begin
//#UC START# *4DAEEDE10285_DA2D728F699C_impl*
 !!! Needs to be implemented !!!
//#UC END# *4DAEEDE10285_DA2D728F699C_impl*
end;//TkwNodeFlags.DoDoIt

class function TkwNodeFlags.GetWordNameForRegister: AnsiString;
begin
 Result := 'Node:Flags';
end;//TkwNodeFlags.GetWordNameForRegister

procedure TkwNodeFlags.SetValuePrim(const aValue: TtfwStackValue;
 const aCtx: TtfwContext);
//#UC START# *52D00B00031A_DA2D728F699C_var*
//#UC END# *52D00B00031A_DA2D728F699C_var*
begin
//#UC START# *52D00B00031A_DA2D728F699C_impl*
 !!! Needs to be implemented !!!
//#UC END# *52D00B00031A_DA2D728F699C_impl*
end;//TkwNodeFlags.SetValuePrim

function TkwNodeFlags.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
begin
 Result := TypeInfo(Integer);
end;//TkwNodeFlags.GetResultTypeInfo

function TkwNodeFlags.GetAllParamsCount(const aCtx: TtfwContext): Integer;
begin
 Result := 1;
end;//TkwNodeFlags.GetAllParamsCount

function TkwNodeFlags.ParamsTypes: PTypeInfoArray;
//#UC START# *5617F4D00243_DA2D728F699C_var*
//#UC END# *5617F4D00243_DA2D728F699C_var*
begin
//#UC START# *5617F4D00243_DA2D728F699C_impl*
 !!! Needs to be implemented !!!
//#UC END# *5617F4D00243_DA2D728F699C_impl*
end;//TkwNodeFlags.ParamsTypes

function TkwNodeText.Text(const aCtx: TtfwContext;
 const aNode: Il3SimpleNode): Tl3WString;
 {* ���������� ����� ������� Node:Text }
//#UC START# *64ACB0166C73_70C4D26A03EF_var*
//#UC END# *64ACB0166C73_70C4D26A03EF_var*
begin
//#UC START# *64ACB0166C73_70C4D26A03EF_impl*
 !!! Needs to be implemented !!!
//#UC END# *64ACB0166C73_70C4D26A03EF_impl*
end;//TkwNodeText.Text

procedure TkwNodeText.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_70C4D26A03EF_var*
//#UC END# *4DAEEDE10285_70C4D26A03EF_var*
begin
//#UC START# *4DAEEDE10285_70C4D26A03EF_impl*
 !!! Needs to be implemented !!!
//#UC END# *4DAEEDE10285_70C4D26A03EF_impl*
end;//TkwNodeText.DoDoIt

class function TkwNodeText.GetWordNameForRegister: AnsiString;
begin
 Result := 'Node:Text';
end;//TkwNodeText.GetWordNameForRegister

procedure TkwNodeText.SetValuePrim(const aValue: TtfwStackValue;
 const aCtx: TtfwContext);
//#UC START# *52D00B00031A_70C4D26A03EF_var*
//#UC END# *52D00B00031A_70C4D26A03EF_var*
begin
//#UC START# *52D00B00031A_70C4D26A03EF_impl*
 !!! Needs to be implemented !!!
//#UC END# *52D00B00031A_70C4D26A03EF_impl*
end;//TkwNodeText.SetValuePrim

function TkwNodeText.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
begin
 Result := @tfw_tiString;
end;//TkwNodeText.GetResultTypeInfo

function TkwNodeText.GetAllParamsCount(const aCtx: TtfwContext): Integer;
begin
 Result := 1;
end;//TkwNodeText.GetAllParamsCount

function TkwNodeText.ParamsTypes: PTypeInfoArray;
//#UC START# *5617F4D00243_70C4D26A03EF_var*
//#UC END# *5617F4D00243_70C4D26A03EF_var*
begin
//#UC START# *5617F4D00243_70C4D26A03EF_impl*
 !!! Needs to be implemented !!!
//#UC END# *5617F4D00243_70C4D26A03EF_impl*
end;//TkwNodeText.ParamsTypes

initialization
 Tl3NodesKeyWordsPackResNameGetter.Register;
 {* ����������� ������������ ����������� }
 TkwNodeIsFirst.RegisterInEngine;
 {* ����������� Node_IsFirst }
 TkwNodeIsLast.RegisterInEngine;
 {* ����������� Node_IsLast }
 TkwNodeFlags.RegisterInEngine;
 {* ����������� Node_Flags }
 TkwNodeText.RegisterInEngine;
 {* ����������� Node_Text }
 TtfwTypeRegistrator.RegisterType(@tfw_tiStruct);
 {* ����������� ���� TtfwContext }
 TtfwTypeRegistrator.RegisterType(TypeInfo(Il3SimpleNode));
 {* ����������� ���� Il3SimpleNode }
 TtfwTypeRegistrator.RegisterType(TypeInfo(Boolean));
 {* ����������� ���� Boolean }
 TtfwTypeRegistrator.RegisterType(TypeInfo(Integer));
 {* ����������� ���� Integer }
 TtfwTypeRegistrator.RegisterType(@tfw_tiString);
 {* ����������� ���� Tl3WString }
{$IfEnd} // NOT Defined(NoScripts)

end.
