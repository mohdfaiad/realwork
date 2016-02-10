unit tfwValueTypesWordsPack;

// ������: "w:\common\components\rtl\Garant\ScriptEngine\tfwValueTypesWordsPack.pas"
// ���������: "ScriptKeywordsPack"

{$Include seDefine.inc}

interface

{$If NOT Defined(NoScripts)}
uses
 l3IntfUses
 , tfwValueTypes
 , l3Interfaces
 , tfwScriptingInterfaces
 , tfwClassLike
 , TypInfo
 , tfwPropertyLike
 , tfwTypeInfo
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
 TkwPopValueTypesCompare = {final} class(TtfwClassLike)
  {* ����� ������� pop:ValueTypes:Compare
*��� ����������:* Integer
*������:*
[code]
INTEGER VAR l_Integer
 anOther aValueTypes pop:ValueTypes:Compare >>> l_Integer
[code]  }
  private
   function Compare(const aCtx: TtfwContext;
    aValueTypes: TtfwValueTypes;
    anOther: TtfwValueTypes): Integer;
    {* ���������� ����� ������� pop:ValueTypes:Compare }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
  public
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
 end;//TkwPopValueTypesCompare

 TkwPopValueTypesAcceptsValue = {final} class(TtfwClassLike)
  {* ����� ������� pop:ValueTypes:AcceptsValue
*��� ����������:* Boolean
*������:*
[code]
BOOLEAN VAR l_Boolean
 aValue aValueTypes pop:ValueTypes:AcceptsValue >>> l_Boolean
[code]  }
  private
   function AcceptsValue(const aCtx: TtfwContext;
    aValueTypes: TtfwValueTypes;
    const aValue: TtfwStackValue): Boolean;
    {* ���������� ����� ������� pop:ValueTypes:AcceptsValue }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
  public
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
 end;//TkwPopValueTypesAcceptsValue

 TkwPopValueTypesAdd = {final} class(TtfwClassLike)
  {* ����� ������� pop:ValueTypes:Add
*��� ����������:* TtfwValueTypes
*������:*
[code]
OBJECT VAR l_TtfwValueTypes
 anOther aValueTypes pop:ValueTypes:Add >>> l_TtfwValueTypes
[code]  }
  private
   function Add(const aCtx: TtfwContext;
    aValueTypes: TtfwValueTypes;
    anOther: TtfwValueTypes): TtfwValueTypes;
    {* ���������� ����� ������� pop:ValueTypes:Add }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
  public
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
 end;//TkwPopValueTypesAdd

 TkwPopValueTypesHas = {final} class(TtfwClassLike)
  {* ����� ������� pop:ValueTypes:Has
*��� ����������:* Boolean
*������:*
[code]
BOOLEAN VAR l_Boolean
 aType aValueTypes pop:ValueTypes:Has >>> l_Boolean
[code]  }
  private
   function Has(const aCtx: TtfwContext;
    aValueTypes: TtfwValueTypes;
    aType: TtfwValueType): Boolean;
    {* ���������� ����� ������� pop:ValueTypes:Has }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
  public
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
 end;//TkwPopValueTypesHas

 TkwPopValueTypesEQ = {final} class(TtfwClassLike)
  {* ����� ������� pop:ValueTypes:EQ
*��� ����������:* Boolean
*������:*
[code]
BOOLEAN VAR l_Boolean
 anOther aValueTypes pop:ValueTypes:EQ >>> l_Boolean
[code]  }
  private
   function EQ(const aCtx: TtfwContext;
    aValueTypes: TtfwValueTypes;
    anOther: TtfwValueTypes): Boolean;
    {* ���������� ����� ������� pop:ValueTypes:EQ }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
  public
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
 end;//TkwPopValueTypesEQ

 TkwPopValueTypesDefaultValue = {final} class(TtfwClassLike)
  {* ����� ������� pop:ValueTypes:DefaultValue
*��� ����������:* TtfwStackValue
*������:*
[code]
VAR l_TtfwStackValue
 aValueTypes pop:ValueTypes:DefaultValue >>> l_TtfwStackValue
[code]  }
  private
   function DefaultValue(const aCtx: TtfwContext;
    aValueTypes: TtfwValueTypes): TtfwStackValue;
    {* ���������� ����� ������� pop:ValueTypes:DefaultValue }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
  public
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
 end;//TkwPopValueTypesDefaultValue

 TkwPopValueTypesMakeCustomName = {final} class(TtfwClassLike)
  {* ����� ������� pop:ValueTypes:MakeCustomName
*��� ����������:* TtfwValueTypes
*������:*
[code]
OBJECT VAR l_TtfwValueTypes
 aName aValueTypes pop:ValueTypes:MakeCustomName >>> l_TtfwValueTypes
[code]  }
  private
   function MakeCustomName(const aCtx: TtfwContext;
    aValueTypes: TtfwValueTypes;
    const aName: Il3CString): TtfwValueTypes;
    {* ���������� ����� ������� pop:ValueTypes:MakeCustomName }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
  public
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
 end;//TkwPopValueTypesMakeCustomName

 TkwPopValueTypesAccepts = {final} class(TtfwClassLike)
  {* ����� ������� pop:ValueTypes:Accepts
*��� ����������:* TtfwValueTypesAccepts
*������:*
[code]
TtfwValueTypesAccepts VAR l_TtfwValueTypesAccepts
 anOther aValueTypes pop:ValueTypes:Accepts >>> l_TtfwValueTypesAccepts
[code]  }
  private
   function Accepts(const aCtx: TtfwContext;
    aValueTypes: TtfwValueTypes;
    anOther: TtfwValueTypes): TtfwValueTypesAccepts;
    {* ���������� ����� ������� pop:ValueTypes:Accepts }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
  public
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
 end;//TkwPopValueTypesAccepts

 TkwPopValueTypesName = {final} class(TtfwPropertyLike)
  {* ����� ������� pop:ValueTypes:Name
*��� ����������:* Il3CString
*������:*
[code]
STRING VAR l_Il3CString
 aValueTypes pop:ValueTypes:Name >>> l_Il3CString
[code]  }
  private
   function Name(const aCtx: TtfwContext;
    aValueTypes: TtfwValueTypes): Il3CString;
    {* ���������� ����� ������� pop:ValueTypes:Name }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
  public
   procedure SetValuePrim(const aValue: TtfwStackValue;
    const aCtx: TtfwContext); override;
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
 end;//TkwPopValueTypesName

function TkwPopValueTypesCompare.Compare(const aCtx: TtfwContext;
 aValueTypes: TtfwValueTypes;
 anOther: TtfwValueTypes): Integer;
 {* ���������� ����� ������� pop:ValueTypes:Compare }
//#UC START# *C636771AEA7F_B6B378D787FB_var*
//#UC END# *C636771AEA7F_B6B378D787FB_var*
begin
//#UC START# *C636771AEA7F_B6B378D787FB_impl*
 !!! Needs to be implemented !!!
//#UC END# *C636771AEA7F_B6B378D787FB_impl*
end;//TkwPopValueTypesCompare.Compare

procedure TkwPopValueTypesCompare.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_B6B378D787FB_var*
//#UC END# *4DAEEDE10285_B6B378D787FB_var*
begin
//#UC START# *4DAEEDE10285_B6B378D787FB_impl*
 !!! Needs to be implemented !!!
//#UC END# *4DAEEDE10285_B6B378D787FB_impl*
end;//TkwPopValueTypesCompare.DoDoIt

class function TkwPopValueTypesCompare.GetWordNameForRegister: AnsiString;
begin
 Result := 'pop:ValueTypes:Compare';
end;//TkwPopValueTypesCompare.GetWordNameForRegister

function TkwPopValueTypesCompare.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
begin
 Result := TypeInfo(Integer);
end;//TkwPopValueTypesCompare.GetResultTypeInfo

function TkwPopValueTypesCompare.GetAllParamsCount(const aCtx: TtfwContext): Integer;
begin
 Result := 2;
end;//TkwPopValueTypesCompare.GetAllParamsCount

function TkwPopValueTypesCompare.ParamsTypes: PTypeInfoArray;
//#UC START# *5617F4D00243_B6B378D787FB_var*
//#UC END# *5617F4D00243_B6B378D787FB_var*
begin
//#UC START# *5617F4D00243_B6B378D787FB_impl*
 !!! Needs to be implemented !!!
//#UC END# *5617F4D00243_B6B378D787FB_impl*
end;//TkwPopValueTypesCompare.ParamsTypes

function TkwPopValueTypesAcceptsValue.AcceptsValue(const aCtx: TtfwContext;
 aValueTypes: TtfwValueTypes;
 const aValue: TtfwStackValue): Boolean;
 {* ���������� ����� ������� pop:ValueTypes:AcceptsValue }
//#UC START# *5536E76EB9C0_677C9B87E711_var*
//#UC END# *5536E76EB9C0_677C9B87E711_var*
begin
//#UC START# *5536E76EB9C0_677C9B87E711_impl*
 !!! Needs to be implemented !!!
//#UC END# *5536E76EB9C0_677C9B87E711_impl*
end;//TkwPopValueTypesAcceptsValue.AcceptsValue

procedure TkwPopValueTypesAcceptsValue.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_677C9B87E711_var*
//#UC END# *4DAEEDE10285_677C9B87E711_var*
begin
//#UC START# *4DAEEDE10285_677C9B87E711_impl*
 !!! Needs to be implemented !!!
//#UC END# *4DAEEDE10285_677C9B87E711_impl*
end;//TkwPopValueTypesAcceptsValue.DoDoIt

class function TkwPopValueTypesAcceptsValue.GetWordNameForRegister: AnsiString;
begin
 Result := 'pop:ValueTypes:AcceptsValue';
end;//TkwPopValueTypesAcceptsValue.GetWordNameForRegister

function TkwPopValueTypesAcceptsValue.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
begin
 Result := TypeInfo(Boolean);
end;//TkwPopValueTypesAcceptsValue.GetResultTypeInfo

function TkwPopValueTypesAcceptsValue.GetAllParamsCount(const aCtx: TtfwContext): Integer;
begin
 Result := 2;
end;//TkwPopValueTypesAcceptsValue.GetAllParamsCount

function TkwPopValueTypesAcceptsValue.ParamsTypes: PTypeInfoArray;
//#UC START# *5617F4D00243_677C9B87E711_var*
//#UC END# *5617F4D00243_677C9B87E711_var*
begin
//#UC START# *5617F4D00243_677C9B87E711_impl*
 !!! Needs to be implemented !!!
//#UC END# *5617F4D00243_677C9B87E711_impl*
end;//TkwPopValueTypesAcceptsValue.ParamsTypes

function TkwPopValueTypesAdd.Add(const aCtx: TtfwContext;
 aValueTypes: TtfwValueTypes;
 anOther: TtfwValueTypes): TtfwValueTypes;
 {* ���������� ����� ������� pop:ValueTypes:Add }
//#UC START# *A69F1372BCB3_8B6319E2FC07_var*
//#UC END# *A69F1372BCB3_8B6319E2FC07_var*
begin
//#UC START# *A69F1372BCB3_8B6319E2FC07_impl*
 !!! Needs to be implemented !!!
//#UC END# *A69F1372BCB3_8B6319E2FC07_impl*
end;//TkwPopValueTypesAdd.Add

procedure TkwPopValueTypesAdd.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_8B6319E2FC07_var*
//#UC END# *4DAEEDE10285_8B6319E2FC07_var*
begin
//#UC START# *4DAEEDE10285_8B6319E2FC07_impl*
 !!! Needs to be implemented !!!
//#UC END# *4DAEEDE10285_8B6319E2FC07_impl*
end;//TkwPopValueTypesAdd.DoDoIt

class function TkwPopValueTypesAdd.GetWordNameForRegister: AnsiString;
begin
 Result := 'pop:ValueTypes:Add';
end;//TkwPopValueTypesAdd.GetWordNameForRegister

function TkwPopValueTypesAdd.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
begin
 Result := TypeInfo(TtfwValueTypes);
end;//TkwPopValueTypesAdd.GetResultTypeInfo

function TkwPopValueTypesAdd.GetAllParamsCount(const aCtx: TtfwContext): Integer;
begin
 Result := 2;
end;//TkwPopValueTypesAdd.GetAllParamsCount

function TkwPopValueTypesAdd.ParamsTypes: PTypeInfoArray;
//#UC START# *5617F4D00243_8B6319E2FC07_var*
//#UC END# *5617F4D00243_8B6319E2FC07_var*
begin
//#UC START# *5617F4D00243_8B6319E2FC07_impl*
 !!! Needs to be implemented !!!
//#UC END# *5617F4D00243_8B6319E2FC07_impl*
end;//TkwPopValueTypesAdd.ParamsTypes

function TkwPopValueTypesHas.Has(const aCtx: TtfwContext;
 aValueTypes: TtfwValueTypes;
 aType: TtfwValueType): Boolean;
 {* ���������� ����� ������� pop:ValueTypes:Has }
//#UC START# *C742B74FA29A_1C691DB5ECAC_var*
//#UC END# *C742B74FA29A_1C691DB5ECAC_var*
begin
//#UC START# *C742B74FA29A_1C691DB5ECAC_impl*
 !!! Needs to be implemented !!!
//#UC END# *C742B74FA29A_1C691DB5ECAC_impl*
end;//TkwPopValueTypesHas.Has

procedure TkwPopValueTypesHas.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_1C691DB5ECAC_var*
//#UC END# *4DAEEDE10285_1C691DB5ECAC_var*
begin
//#UC START# *4DAEEDE10285_1C691DB5ECAC_impl*
 !!! Needs to be implemented !!!
//#UC END# *4DAEEDE10285_1C691DB5ECAC_impl*
end;//TkwPopValueTypesHas.DoDoIt

class function TkwPopValueTypesHas.GetWordNameForRegister: AnsiString;
begin
 Result := 'pop:ValueTypes:Has';
end;//TkwPopValueTypesHas.GetWordNameForRegister

function TkwPopValueTypesHas.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
begin
 Result := TypeInfo(Boolean);
end;//TkwPopValueTypesHas.GetResultTypeInfo

function TkwPopValueTypesHas.GetAllParamsCount(const aCtx: TtfwContext): Integer;
begin
 Result := 2;
end;//TkwPopValueTypesHas.GetAllParamsCount

function TkwPopValueTypesHas.ParamsTypes: PTypeInfoArray;
//#UC START# *5617F4D00243_1C691DB5ECAC_var*
//#UC END# *5617F4D00243_1C691DB5ECAC_var*
begin
//#UC START# *5617F4D00243_1C691DB5ECAC_impl*
 !!! Needs to be implemented !!!
//#UC END# *5617F4D00243_1C691DB5ECAC_impl*
end;//TkwPopValueTypesHas.ParamsTypes

function TkwPopValueTypesEQ.EQ(const aCtx: TtfwContext;
 aValueTypes: TtfwValueTypes;
 anOther: TtfwValueTypes): Boolean;
 {* ���������� ����� ������� pop:ValueTypes:EQ }
//#UC START# *3652BF1196D7_B4D5F2A5070B_var*
//#UC END# *3652BF1196D7_B4D5F2A5070B_var*
begin
//#UC START# *3652BF1196D7_B4D5F2A5070B_impl*
 !!! Needs to be implemented !!!
//#UC END# *3652BF1196D7_B4D5F2A5070B_impl*
end;//TkwPopValueTypesEQ.EQ

procedure TkwPopValueTypesEQ.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_B4D5F2A5070B_var*
//#UC END# *4DAEEDE10285_B4D5F2A5070B_var*
begin
//#UC START# *4DAEEDE10285_B4D5F2A5070B_impl*
 !!! Needs to be implemented !!!
//#UC END# *4DAEEDE10285_B4D5F2A5070B_impl*
end;//TkwPopValueTypesEQ.DoDoIt

class function TkwPopValueTypesEQ.GetWordNameForRegister: AnsiString;
begin
 Result := 'pop:ValueTypes:EQ';
end;//TkwPopValueTypesEQ.GetWordNameForRegister

function TkwPopValueTypesEQ.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
begin
 Result := TypeInfo(Boolean);
end;//TkwPopValueTypesEQ.GetResultTypeInfo

function TkwPopValueTypesEQ.GetAllParamsCount(const aCtx: TtfwContext): Integer;
begin
 Result := 2;
end;//TkwPopValueTypesEQ.GetAllParamsCount

function TkwPopValueTypesEQ.ParamsTypes: PTypeInfoArray;
//#UC START# *5617F4D00243_B4D5F2A5070B_var*
//#UC END# *5617F4D00243_B4D5F2A5070B_var*
begin
//#UC START# *5617F4D00243_B4D5F2A5070B_impl*
 !!! Needs to be implemented !!!
//#UC END# *5617F4D00243_B4D5F2A5070B_impl*
end;//TkwPopValueTypesEQ.ParamsTypes

function TkwPopValueTypesDefaultValue.DefaultValue(const aCtx: TtfwContext;
 aValueTypes: TtfwValueTypes): TtfwStackValue;
 {* ���������� ����� ������� pop:ValueTypes:DefaultValue }
//#UC START# *094C61557ACA_4F7AC71868E2_var*
//#UC END# *094C61557ACA_4F7AC71868E2_var*
begin
//#UC START# *094C61557ACA_4F7AC71868E2_impl*
 !!! Needs to be implemented !!!
//#UC END# *094C61557ACA_4F7AC71868E2_impl*
end;//TkwPopValueTypesDefaultValue.DefaultValue

procedure TkwPopValueTypesDefaultValue.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4F7AC71868E2_var*
//#UC END# *4DAEEDE10285_4F7AC71868E2_var*
begin
//#UC START# *4DAEEDE10285_4F7AC71868E2_impl*
 !!! Needs to be implemented !!!
//#UC END# *4DAEEDE10285_4F7AC71868E2_impl*
end;//TkwPopValueTypesDefaultValue.DoDoIt

class function TkwPopValueTypesDefaultValue.GetWordNameForRegister: AnsiString;
begin
 Result := 'pop:ValueTypes:DefaultValue';
end;//TkwPopValueTypesDefaultValue.GetWordNameForRegister

function TkwPopValueTypesDefaultValue.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
begin
 Result := @tfw_tiStruct;
end;//TkwPopValueTypesDefaultValue.GetResultTypeInfo

function TkwPopValueTypesDefaultValue.GetAllParamsCount(const aCtx: TtfwContext): Integer;
begin
 Result := 1;
end;//TkwPopValueTypesDefaultValue.GetAllParamsCount

function TkwPopValueTypesDefaultValue.ParamsTypes: PTypeInfoArray;
//#UC START# *5617F4D00243_4F7AC71868E2_var*
//#UC END# *5617F4D00243_4F7AC71868E2_var*
begin
//#UC START# *5617F4D00243_4F7AC71868E2_impl*
 !!! Needs to be implemented !!!
//#UC END# *5617F4D00243_4F7AC71868E2_impl*
end;//TkwPopValueTypesDefaultValue.ParamsTypes

function TkwPopValueTypesMakeCustomName.MakeCustomName(const aCtx: TtfwContext;
 aValueTypes: TtfwValueTypes;
 const aName: Il3CString): TtfwValueTypes;
 {* ���������� ����� ������� pop:ValueTypes:MakeCustomName }
//#UC START# *F5EDA08C381E_2A110DF50AE7_var*
//#UC END# *F5EDA08C381E_2A110DF50AE7_var*
begin
//#UC START# *F5EDA08C381E_2A110DF50AE7_impl*
 Result := aValueTypes.MakeCustomName(aName);
//#UC END# *F5EDA08C381E_2A110DF50AE7_impl*
end;//TkwPopValueTypesMakeCustomName.MakeCustomName

procedure TkwPopValueTypesMakeCustomName.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_2A110DF50AE7_var*
//#UC END# *4DAEEDE10285_2A110DF50AE7_var*
begin
//#UC START# *4DAEEDE10285_2A110DF50AE7_impl*
 !!! Needs to be implemented !!!
//#UC END# *4DAEEDE10285_2A110DF50AE7_impl*
end;//TkwPopValueTypesMakeCustomName.DoDoIt

class function TkwPopValueTypesMakeCustomName.GetWordNameForRegister: AnsiString;
begin
 Result := 'pop:ValueTypes:MakeCustomName';
end;//TkwPopValueTypesMakeCustomName.GetWordNameForRegister

function TkwPopValueTypesMakeCustomName.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
begin
 Result := TypeInfo(TtfwValueTypes);
end;//TkwPopValueTypesMakeCustomName.GetResultTypeInfo

function TkwPopValueTypesMakeCustomName.GetAllParamsCount(const aCtx: TtfwContext): Integer;
begin
 Result := 2;
end;//TkwPopValueTypesMakeCustomName.GetAllParamsCount

function TkwPopValueTypesMakeCustomName.ParamsTypes: PTypeInfoArray;
//#UC START# *5617F4D00243_2A110DF50AE7_var*
//#UC END# *5617F4D00243_2A110DF50AE7_var*
begin
//#UC START# *5617F4D00243_2A110DF50AE7_impl*
 !!! Needs to be implemented !!!
//#UC END# *5617F4D00243_2A110DF50AE7_impl*
end;//TkwPopValueTypesMakeCustomName.ParamsTypes

function TkwPopValueTypesAccepts.Accepts(const aCtx: TtfwContext;
 aValueTypes: TtfwValueTypes;
 anOther: TtfwValueTypes): TtfwValueTypesAccepts;
 {* ���������� ����� ������� pop:ValueTypes:Accepts }
//#UC START# *E369C00B85CB_A6AA1D032B6D_var*
//#UC END# *E369C00B85CB_A6AA1D032B6D_var*
begin
//#UC START# *E369C00B85CB_A6AA1D032B6D_impl*
 Result := aValueTypes.Accepts(anOther);
//#UC END# *E369C00B85CB_A6AA1D032B6D_impl*
end;//TkwPopValueTypesAccepts.Accepts

procedure TkwPopValueTypesAccepts.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_A6AA1D032B6D_var*
//#UC END# *4DAEEDE10285_A6AA1D032B6D_var*
begin
//#UC START# *4DAEEDE10285_A6AA1D032B6D_impl*
 !!! Needs to be implemented !!!
//#UC END# *4DAEEDE10285_A6AA1D032B6D_impl*
end;//TkwPopValueTypesAccepts.DoDoIt

class function TkwPopValueTypesAccepts.GetWordNameForRegister: AnsiString;
begin
 Result := 'pop:ValueTypes:Accepts';
end;//TkwPopValueTypesAccepts.GetWordNameForRegister

function TkwPopValueTypesAccepts.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
begin
 Result := TypeInfo(TtfwValueTypesAccepts);
end;//TkwPopValueTypesAccepts.GetResultTypeInfo

function TkwPopValueTypesAccepts.GetAllParamsCount(const aCtx: TtfwContext): Integer;
begin
 Result := 2;
end;//TkwPopValueTypesAccepts.GetAllParamsCount

function TkwPopValueTypesAccepts.ParamsTypes: PTypeInfoArray;
//#UC START# *5617F4D00243_A6AA1D032B6D_var*
//#UC END# *5617F4D00243_A6AA1D032B6D_var*
begin
//#UC START# *5617F4D00243_A6AA1D032B6D_impl*
 !!! Needs to be implemented !!!
//#UC END# *5617F4D00243_A6AA1D032B6D_impl*
end;//TkwPopValueTypesAccepts.ParamsTypes

function TkwPopValueTypesName.Name(const aCtx: TtfwContext;
 aValueTypes: TtfwValueTypes): Il3CString;
 {* ���������� ����� ������� pop:ValueTypes:Name }
//#UC START# *A5FB98932E66_0180EF65E172_var*
//#UC END# *A5FB98932E66_0180EF65E172_var*
begin
//#UC START# *A5FB98932E66_0180EF65E172_impl*
 !!! Needs to be implemented !!!
//#UC END# *A5FB98932E66_0180EF65E172_impl*
end;//TkwPopValueTypesName.Name

procedure TkwPopValueTypesName.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_0180EF65E172_var*
//#UC END# *4DAEEDE10285_0180EF65E172_var*
begin
//#UC START# *4DAEEDE10285_0180EF65E172_impl*
 !!! Needs to be implemented !!!
//#UC END# *4DAEEDE10285_0180EF65E172_impl*
end;//TkwPopValueTypesName.DoDoIt

class function TkwPopValueTypesName.GetWordNameForRegister: AnsiString;
begin
 Result := 'pop:ValueTypes:Name';
end;//TkwPopValueTypesName.GetWordNameForRegister

procedure TkwPopValueTypesName.SetValuePrim(const aValue: TtfwStackValue;
 const aCtx: TtfwContext);
//#UC START# *52D00B00031A_0180EF65E172_var*
//#UC END# *52D00B00031A_0180EF65E172_var*
begin
//#UC START# *52D00B00031A_0180EF65E172_impl*
 !!! Needs to be implemented !!!
//#UC END# *52D00B00031A_0180EF65E172_impl*
end;//TkwPopValueTypesName.SetValuePrim

function TkwPopValueTypesName.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
begin
 Result := @tfw_tiString;
end;//TkwPopValueTypesName.GetResultTypeInfo

function TkwPopValueTypesName.GetAllParamsCount(const aCtx: TtfwContext): Integer;
begin
 Result := 1;
end;//TkwPopValueTypesName.GetAllParamsCount

function TkwPopValueTypesName.ParamsTypes: PTypeInfoArray;
//#UC START# *5617F4D00243_0180EF65E172_var*
//#UC END# *5617F4D00243_0180EF65E172_var*
begin
//#UC START# *5617F4D00243_0180EF65E172_impl*
 !!! Needs to be implemented !!!
//#UC END# *5617F4D00243_0180EF65E172_impl*
end;//TkwPopValueTypesName.ParamsTypes

initialization
 TkwPopValueTypesCompare.RegisterInEngine;
 {* ����������� pop_ValueTypes_Compare }
 TkwPopValueTypesAcceptsValue.RegisterInEngine;
 {* ����������� pop_ValueTypes_AcceptsValue }
 TkwPopValueTypesAdd.RegisterInEngine;
 {* ����������� pop_ValueTypes_Add }
 TkwPopValueTypesHas.RegisterInEngine;
 {* ����������� pop_ValueTypes_Has }
 TkwPopValueTypesEQ.RegisterInEngine;
 {* ����������� pop_ValueTypes_EQ }
 TkwPopValueTypesDefaultValue.RegisterInEngine;
 {* ����������� pop_ValueTypes_DefaultValue }
 TkwPopValueTypesMakeCustomName.RegisterInEngine;
 {* ����������� pop_ValueTypes_MakeCustomName }
 TkwPopValueTypesAccepts.RegisterInEngine;
 {* ����������� pop_ValueTypes_Accepts }
 TkwPopValueTypesName.RegisterInEngine;
 {* ����������� pop_ValueTypes_Name }
 TtfwTypeRegistrator.RegisterType(@tfw_tiStruct);
 {* ����������� ���� TtfwContext }
 TtfwTypeRegistrator.RegisterType(TypeInfo(TtfwValueTypes));
 {* ����������� ���� TtfwValueTypes }
 TtfwTypeRegistrator.RegisterType(TypeInfo(Integer));
 {* ����������� ���� Integer }
 TtfwTypeRegistrator.RegisterType(@tfw_tiStruct);
 {* ����������� ���� TtfwStackValue }
 TtfwTypeRegistrator.RegisterType(TypeInfo(Boolean));
 {* ����������� ���� Boolean }
 TtfwTypeRegistrator.RegisterType(TypeInfo(TtfwValueType));
 {* ����������� ���� TtfwValueType }
 TtfwTypeRegistrator.RegisterType(@tfw_tiString);
 {* ����������� ���� Il3CString }
 TtfwTypeRegistrator.RegisterType(TypeInfo(TtfwValueTypesAccepts));
 {* ����������� ���� TtfwValueTypesAccepts }
{$IfEnd} // NOT Defined(NoScripts)

end.
