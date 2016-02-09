unit ObjectFromstackWords;

// ������: "w:\common\components\rtl\Garant\ScriptEngine\ObjectFromstackWords.pas"
// ���������: "ScriptKeywordsPack"

{$Include seDefine.inc}

interface

{$If NOT Defined(NoScripts)}
uses
 l3IntfUses
 , tfwScriptingInterfaces
 , tfwAxiomaticsResNameGetter
 , tfwClassLike
 , TypInfo
;
{$IfEnd} // NOT Defined(NoScripts)

implementation

{$If NOT Defined(NoScripts)}
uses
 l3ImplUses
 , kwPopClassInherits
 , SysUtils
 , l3RTTI
 , tfwScriptingTypes
 , tfwTypeRegistrator
;

type
 //#UC START# *695731F3434Eci*
 //#UC END# *695731F3434Eci*
 //#UC START# *695731F3434Ecit*
 //#UC END# *695731F3434Ecit*
 TObjectFromstackWordsResNameGetter = {final} class(TtfwAxiomaticsResNameGetter)
  {* ����������� ������������ ����������� }
  public
   class function ResName: AnsiString; override;
 //#UC START# *695731F3434Epubl*
 //#UC END# *695731F3434Epubl*
 end;//TObjectFromstackWordsResNameGetter

 TkwPopObjectInherits = {final} class(TtfwClassLike)
  {* ����� ������� pop:Object:Inherits
*��� ����������:* Boolean
*������:*
[code]
BOOLEAN VAR l_Boolean
 aClass aObject pop:Object:Inherits >>> l_Boolean
[code]  }
  private
   function Inherits(const aCtx: TtfwContext;
    aObject: TObject;
    const aClass: TtfwStackValue): Boolean;
    {* ���������� ����� ������� pop:Object:Inherits }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
  public
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
 end;//TkwPopObjectInherits

 TkwPopObjectClassName = {final} class(TtfwClassLike)
  {* ����� ������� pop:Object:ClassName
*��� ����������:* String
*������:*
[code]
STRING VAR l_String
 aObject pop:Object:ClassName >>> l_String
[code]  }
  private
   function ClassName(const aCtx: TtfwContext;
    aObject: TObject): AnsiString;
    {* ���������� ����� ������� pop:Object:ClassName }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
  public
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
 end;//TkwPopObjectClassName

 TkwPopObjectGetFloatProp = {final} class(TtfwClassLike)
  {* ����� ������� pop:Object:GetFloatProp
*��� ����������:* Integer
*������:*
[code]
INTEGER VAR l_Integer
 aName aObject pop:Object:GetFloatProp >>> l_Integer
[code]  }
  private
   function GetFloatProp(const aCtx: TtfwContext;
    aObject: TObject;
    const aName: AnsiString): Integer;
    {* ���������� ����� ������� pop:Object:GetFloatProp }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
  public
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
 end;//TkwPopObjectGetFloatProp

 TkwPopObjectGetInterfaceProp = {final} class(TtfwClassLike)
  {* ����� ������� pop:Object:GetInterfaceProp
*��� ����������:* IUnknown
*������:*
[code]
INTERFACE VAR l_IUnknown
 aName aObject pop:Object:GetInterfaceProp >>> l_IUnknown
[code]  }
  private
   function GetInterfaceProp(const aCtx: TtfwContext;
    aObject: TObject;
    const aName: AnsiString): IUnknown;
    {* ���������� ����� ������� pop:Object:GetInterfaceProp }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
  public
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
 end;//TkwPopObjectGetInterfaceProp

 TkwPopObjectGetObjProp = {final} class(TtfwClassLike)
  {* ����� ������� pop:Object:GetObjProp
*��� ����������:* TObject
*������:*
[code]
OBJECT VAR l_TObject
 aName aObject pop:Object:GetObjProp >>> l_TObject
[code]  }
  private
   function GetObjProp(const aCtx: TtfwContext;
    aObject: TObject;
    const aName: AnsiString): TObject;
    {* ���������� ����� ������� pop:Object:GetObjProp }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
  public
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
 end;//TkwPopObjectGetObjProp

 TkwPopObjectGetOrdProp = {final} class(TtfwClassLike)
  {* ����� ������� pop:Object:GetOrdProp
*��� ����������:* Integer
*������:*
[code]
INTEGER VAR l_Integer
 aName aObject pop:Object:GetOrdProp >>> l_Integer
[code]  }
  private
   function GetOrdProp(const aCtx: TtfwContext;
    aObject: TObject;
    const aName: AnsiString): Integer;
    {* ���������� ����� ������� pop:Object:GetOrdProp }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
  public
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
 end;//TkwPopObjectGetOrdProp

 TkwPopObjectGetStrProp = {final} class(TtfwClassLike)
  {* ����� ������� pop:Object:GetStrProp
*��� ����������:* String
*������:*
[code]
STRING VAR l_String
 aName aObject pop:Object:GetStrProp >>> l_String
[code]  }
  private
   function GetStrProp(const aCtx: TtfwContext;
    aObject: TObject;
    const aName: AnsiString): AnsiString;
    {* ���������� ����� ������� pop:Object:GetStrProp }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
  public
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
 end;//TkwPopObjectGetStrProp

 TkwPopObjectHasProp = {final} class(TtfwClassLike)
  {* ����� ������� pop:Object:HasProp
*��� ����������:* Boolean
*������:*
[code]
BOOLEAN VAR l_Boolean
 aName aObject pop:Object:HasProp >>> l_Boolean
[code]  }
  private
   function HasProp(const aCtx: TtfwContext;
    aObject: TObject;
    const aName: AnsiString): Boolean;
    {* ���������� ����� ������� pop:Object:HasProp }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
  public
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
 end;//TkwPopObjectHasProp

 TkwPopObjectRTTIInfo = {final} class(TtfwClassLike)
  {* ����� ������� pop:Object:RTTIInfo
*��� ����������:* String
*������:*
[code]
STRING VAR l_String
 aObject pop:Object:RTTIInfo >>> l_String
[code]  }
  private
   function RTTIInfo(const aCtx: TtfwContext;
    aObject: TObject): AnsiString;
    {* ���������� ����� ������� pop:Object:RTTIInfo }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
  public
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
 end;//TkwPopObjectRTTIInfo

 TkwPopObjectSetFloatProp = {final} class(TtfwClassLike)
  {* ����� ������� pop:Object:SetFloatProp
*������:*
[code]
 aValue aName aObject pop:Object:SetFloatProp
[code]  }
  private
   procedure SetFloatProp(const aCtx: TtfwContext;
    aObject: TObject;
    const aName: AnsiString;
    aValue: Integer);
    {* ���������� ����� ������� pop:Object:SetFloatProp }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
  public
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
 end;//TkwPopObjectSetFloatProp

 TkwPopObjectSetOrdProp = {final} class(TtfwClassLike)
  {* ����� ������� pop:Object:SetOrdProp
*������:*
[code]
 aValue aName aObject pop:Object:SetOrdProp
[code]  }
  private
   procedure SetOrdProp(const aCtx: TtfwContext;
    aObject: TObject;
    const aName: AnsiString;
    aValue: Integer);
    {* ���������� ����� ������� pop:Object:SetOrdProp }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
  public
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
 end;//TkwPopObjectSetOrdProp

 TkwPopObjectSetStrProp = {final} class(TtfwClassLike)
  {* ����� ������� pop:Object:SetStrProp
*������:*
[code]
 aValue aName aObject pop:Object:SetStrProp
[code]  }
  private
   procedure SetStrProp(const aCtx: TtfwContext;
    aObject: TObject;
    const aName: AnsiString;
    const aValue: AnsiString);
    {* ���������� ����� ������� pop:Object:SetStrProp }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
  public
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
 end;//TkwPopObjectSetStrProp

class function TObjectFromstackWordsResNameGetter.ResName: AnsiString;
begin
  Result := 'ObjectFromstackWords';
end;//TObjectFromstackWordsResNameGetter.ResName

 {$R ObjectFromstackWords.res}

function TkwPopObjectInherits.Inherits(const aCtx: TtfwContext;
 aObject: TObject;
 const aClass: TtfwStackValue): Boolean;
 {* ���������� ����� ������� pop:Object:Inherits }
//#UC START# *8E2028C997CB_C6231F1FCA26_var*

 function IsInherits(anObject: TClass; const aClass: AnsiString): Boolean;
 begin//IsInherits
  if (anObject = nil) then
   Result := false
  else
  if AnsiSameText(anObject.ClassName, aClass) then
   Result := true
  else
   Result := IsInherits(anObject.ClassParent, aClass);
 end;//IsInherits

//#UC END# *8E2028C997CB_C6231F1FCA26_var*
begin
//#UC START# *8E2028C997CB_C6231F1FCA26_impl*
 Case aClass.rType of
  tfw_vtClass:
   if (aObject = nil) then
    Result := false
   else
    Result := aObject.ClassType.InheritsFrom(aClass.AsClass);
  tfw_vtStr:
   if (aObject = nil) then
    Result := false
   else
    Result := IsInherits(aObject.ClassType, aClass.AsDelphiString);
  else
  begin
   Result := false;
   BadValueType(aClass.rType, aCtx);
  end;//else
 end;//Case aClass.rType
//#UC END# *8E2028C997CB_C6231F1FCA26_impl*
end;//TkwPopObjectInherits.Inherits

procedure TkwPopObjectInherits.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_C6231F1FCA26_var*
//#UC END# *4DAEEDE10285_C6231F1FCA26_var*
begin
//#UC START# *4DAEEDE10285_C6231F1FCA26_impl*
 !!! Needs to be implemented !!!
//#UC END# *4DAEEDE10285_C6231F1FCA26_impl*
end;//TkwPopObjectInherits.DoDoIt

class function TkwPopObjectInherits.GetWordNameForRegister: AnsiString;
begin
 Result := 'pop:Object:Inherits';
end;//TkwPopObjectInherits.GetWordNameForRegister

function TkwPopObjectInherits.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
//#UC START# *551544E2001A_C6231F1FCA26_var*
//#UC END# *551544E2001A_C6231F1FCA26_var*
begin
//#UC START# *551544E2001A_C6231F1FCA26_impl*
 !!! Needs to be implemented !!!
//#UC END# *551544E2001A_C6231F1FCA26_impl*
end;//TkwPopObjectInherits.GetResultTypeInfo

function TkwPopObjectInherits.GetAllParamsCount(const aCtx: TtfwContext): Integer;
begin
 Result := 1;
end;//TkwPopObjectInherits.GetAllParamsCount

function TkwPopObjectInherits.ParamsTypes: PTypeInfoArray;
//#UC START# *5617F4D00243_C6231F1FCA26_var*
//#UC END# *5617F4D00243_C6231F1FCA26_var*
begin
//#UC START# *5617F4D00243_C6231F1FCA26_impl*
 !!! Needs to be implemented !!!
//#UC END# *5617F4D00243_C6231F1FCA26_impl*
end;//TkwPopObjectInherits.ParamsTypes

function TkwPopObjectClassName.ClassName(const aCtx: TtfwContext;
 aObject: TObject): AnsiString;
 {* ���������� ����� ������� pop:Object:ClassName }
//#UC START# *DB3E01510FFF_7B6D4B0B5715_var*
//#UC END# *DB3E01510FFF_7B6D4B0B5715_var*
begin
//#UC START# *DB3E01510FFF_7B6D4B0B5715_impl*
 if (aObject = nil) then
  Result := '��������� ��� ������ � nil'
 else
  Result := aObject.ClassName;
//#UC END# *DB3E01510FFF_7B6D4B0B5715_impl*
end;//TkwPopObjectClassName.ClassName

procedure TkwPopObjectClassName.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_7B6D4B0B5715_var*
//#UC END# *4DAEEDE10285_7B6D4B0B5715_var*
begin
//#UC START# *4DAEEDE10285_7B6D4B0B5715_impl*
 !!! Needs to be implemented !!!
//#UC END# *4DAEEDE10285_7B6D4B0B5715_impl*
end;//TkwPopObjectClassName.DoDoIt

class function TkwPopObjectClassName.GetWordNameForRegister: AnsiString;
begin
 Result := 'pop:Object:ClassName';
end;//TkwPopObjectClassName.GetWordNameForRegister

function TkwPopObjectClassName.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
//#UC START# *551544E2001A_7B6D4B0B5715_var*
//#UC END# *551544E2001A_7B6D4B0B5715_var*
begin
//#UC START# *551544E2001A_7B6D4B0B5715_impl*
 !!! Needs to be implemented !!!
//#UC END# *551544E2001A_7B6D4B0B5715_impl*
end;//TkwPopObjectClassName.GetResultTypeInfo

function TkwPopObjectClassName.GetAllParamsCount(const aCtx: TtfwContext): Integer;
begin
 Result := 0;
end;//TkwPopObjectClassName.GetAllParamsCount

function TkwPopObjectClassName.ParamsTypes: PTypeInfoArray;
//#UC START# *5617F4D00243_7B6D4B0B5715_var*
//#UC END# *5617F4D00243_7B6D4B0B5715_var*
begin
//#UC START# *5617F4D00243_7B6D4B0B5715_impl*
 !!! Needs to be implemented !!!
//#UC END# *5617F4D00243_7B6D4B0B5715_impl*
end;//TkwPopObjectClassName.ParamsTypes

function TkwPopObjectGetFloatProp.GetFloatProp(const aCtx: TtfwContext;
 aObject: TObject;
 const aName: AnsiString): Integer;
 {* ���������� ����� ������� pop:Object:GetFloatProp }
//#UC START# *B092970B7218_EDA57987A3B6_var*
//#UC END# *B092970B7218_EDA57987A3B6_var*
begin
//#UC START# *B092970B7218_EDA57987A3B6_impl*
 Result := Trunc(TypInfo.GetFloatProp(aObject, aName));
//#UC END# *B092970B7218_EDA57987A3B6_impl*
end;//TkwPopObjectGetFloatProp.GetFloatProp

procedure TkwPopObjectGetFloatProp.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_EDA57987A3B6_var*
//#UC END# *4DAEEDE10285_EDA57987A3B6_var*
begin
//#UC START# *4DAEEDE10285_EDA57987A3B6_impl*
 !!! Needs to be implemented !!!
//#UC END# *4DAEEDE10285_EDA57987A3B6_impl*
end;//TkwPopObjectGetFloatProp.DoDoIt

class function TkwPopObjectGetFloatProp.GetWordNameForRegister: AnsiString;
begin
 Result := 'pop:Object:GetFloatProp';
end;//TkwPopObjectGetFloatProp.GetWordNameForRegister

function TkwPopObjectGetFloatProp.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
//#UC START# *551544E2001A_EDA57987A3B6_var*
//#UC END# *551544E2001A_EDA57987A3B6_var*
begin
//#UC START# *551544E2001A_EDA57987A3B6_impl*
 !!! Needs to be implemented !!!
//#UC END# *551544E2001A_EDA57987A3B6_impl*
end;//TkwPopObjectGetFloatProp.GetResultTypeInfo

function TkwPopObjectGetFloatProp.GetAllParamsCount(const aCtx: TtfwContext): Integer;
begin
 Result := 1;
end;//TkwPopObjectGetFloatProp.GetAllParamsCount

function TkwPopObjectGetFloatProp.ParamsTypes: PTypeInfoArray;
//#UC START# *5617F4D00243_EDA57987A3B6_var*
//#UC END# *5617F4D00243_EDA57987A3B6_var*
begin
//#UC START# *5617F4D00243_EDA57987A3B6_impl*
 !!! Needs to be implemented !!!
//#UC END# *5617F4D00243_EDA57987A3B6_impl*
end;//TkwPopObjectGetFloatProp.ParamsTypes

function TkwPopObjectGetInterfaceProp.GetInterfaceProp(const aCtx: TtfwContext;
 aObject: TObject;
 const aName: AnsiString): IUnknown;
 {* ���������� ����� ������� pop:Object:GetInterfaceProp }
//#UC START# *A6C646A9D4FA_AB78BA187455_var*
//#UC END# *A6C646A9D4FA_AB78BA187455_var*
begin
//#UC START# *A6C646A9D4FA_AB78BA187455_impl*
 Result := TypInfo.GetInterfaceProp(aObject, aName);
//#UC END# *A6C646A9D4FA_AB78BA187455_impl*
end;//TkwPopObjectGetInterfaceProp.GetInterfaceProp

procedure TkwPopObjectGetInterfaceProp.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_AB78BA187455_var*
//#UC END# *4DAEEDE10285_AB78BA187455_var*
begin
//#UC START# *4DAEEDE10285_AB78BA187455_impl*
 !!! Needs to be implemented !!!
//#UC END# *4DAEEDE10285_AB78BA187455_impl*
end;//TkwPopObjectGetInterfaceProp.DoDoIt

class function TkwPopObjectGetInterfaceProp.GetWordNameForRegister: AnsiString;
begin
 Result := 'pop:Object:GetInterfaceProp';
end;//TkwPopObjectGetInterfaceProp.GetWordNameForRegister

function TkwPopObjectGetInterfaceProp.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
//#UC START# *551544E2001A_AB78BA187455_var*
//#UC END# *551544E2001A_AB78BA187455_var*
begin
//#UC START# *551544E2001A_AB78BA187455_impl*
 !!! Needs to be implemented !!!
//#UC END# *551544E2001A_AB78BA187455_impl*
end;//TkwPopObjectGetInterfaceProp.GetResultTypeInfo

function TkwPopObjectGetInterfaceProp.GetAllParamsCount(const aCtx: TtfwContext): Integer;
begin
 Result := 1;
end;//TkwPopObjectGetInterfaceProp.GetAllParamsCount

function TkwPopObjectGetInterfaceProp.ParamsTypes: PTypeInfoArray;
//#UC START# *5617F4D00243_AB78BA187455_var*
//#UC END# *5617F4D00243_AB78BA187455_var*
begin
//#UC START# *5617F4D00243_AB78BA187455_impl*
 !!! Needs to be implemented !!!
//#UC END# *5617F4D00243_AB78BA187455_impl*
end;//TkwPopObjectGetInterfaceProp.ParamsTypes

function TkwPopObjectGetObjProp.GetObjProp(const aCtx: TtfwContext;
 aObject: TObject;
 const aName: AnsiString): TObject;
 {* ���������� ����� ������� pop:Object:GetObjProp }
//#UC START# *C3A777545BCF_BA0E0748BC5D_var*
//#UC END# *C3A777545BCF_BA0E0748BC5D_var*
begin
//#UC START# *C3A777545BCF_BA0E0748BC5D_impl*
 Result := TypInfo.GetObjectProp(aObject, aName);
//#UC END# *C3A777545BCF_BA0E0748BC5D_impl*
end;//TkwPopObjectGetObjProp.GetObjProp

procedure TkwPopObjectGetObjProp.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_BA0E0748BC5D_var*
//#UC END# *4DAEEDE10285_BA0E0748BC5D_var*
begin
//#UC START# *4DAEEDE10285_BA0E0748BC5D_impl*
 !!! Needs to be implemented !!!
//#UC END# *4DAEEDE10285_BA0E0748BC5D_impl*
end;//TkwPopObjectGetObjProp.DoDoIt

class function TkwPopObjectGetObjProp.GetWordNameForRegister: AnsiString;
begin
 Result := 'pop:Object:GetObjProp';
end;//TkwPopObjectGetObjProp.GetWordNameForRegister

function TkwPopObjectGetObjProp.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
//#UC START# *551544E2001A_BA0E0748BC5D_var*
//#UC END# *551544E2001A_BA0E0748BC5D_var*
begin
//#UC START# *551544E2001A_BA0E0748BC5D_impl*
 !!! Needs to be implemented !!!
//#UC END# *551544E2001A_BA0E0748BC5D_impl*
end;//TkwPopObjectGetObjProp.GetResultTypeInfo

function TkwPopObjectGetObjProp.GetAllParamsCount(const aCtx: TtfwContext): Integer;
begin
 Result := 1;
end;//TkwPopObjectGetObjProp.GetAllParamsCount

function TkwPopObjectGetObjProp.ParamsTypes: PTypeInfoArray;
//#UC START# *5617F4D00243_BA0E0748BC5D_var*
//#UC END# *5617F4D00243_BA0E0748BC5D_var*
begin
//#UC START# *5617F4D00243_BA0E0748BC5D_impl*
 !!! Needs to be implemented !!!
//#UC END# *5617F4D00243_BA0E0748BC5D_impl*
end;//TkwPopObjectGetObjProp.ParamsTypes

function TkwPopObjectGetOrdProp.GetOrdProp(const aCtx: TtfwContext;
 aObject: TObject;
 const aName: AnsiString): Integer;
 {* ���������� ����� ������� pop:Object:GetOrdProp }
//#UC START# *902589FCB14D_AB11F1E6DB9D_var*
//#UC END# *902589FCB14D_AB11F1E6DB9D_var*
begin
//#UC START# *902589FCB14D_AB11F1E6DB9D_impl*
 Result := TypInfo.GetOrdProp(aObject, aName);
//#UC END# *902589FCB14D_AB11F1E6DB9D_impl*
end;//TkwPopObjectGetOrdProp.GetOrdProp

procedure TkwPopObjectGetOrdProp.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_AB11F1E6DB9D_var*
//#UC END# *4DAEEDE10285_AB11F1E6DB9D_var*
begin
//#UC START# *4DAEEDE10285_AB11F1E6DB9D_impl*
 !!! Needs to be implemented !!!
//#UC END# *4DAEEDE10285_AB11F1E6DB9D_impl*
end;//TkwPopObjectGetOrdProp.DoDoIt

class function TkwPopObjectGetOrdProp.GetWordNameForRegister: AnsiString;
begin
 Result := 'pop:Object:GetOrdProp';
end;//TkwPopObjectGetOrdProp.GetWordNameForRegister

function TkwPopObjectGetOrdProp.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
//#UC START# *551544E2001A_AB11F1E6DB9D_var*
//#UC END# *551544E2001A_AB11F1E6DB9D_var*
begin
//#UC START# *551544E2001A_AB11F1E6DB9D_impl*
 !!! Needs to be implemented !!!
//#UC END# *551544E2001A_AB11F1E6DB9D_impl*
end;//TkwPopObjectGetOrdProp.GetResultTypeInfo

function TkwPopObjectGetOrdProp.GetAllParamsCount(const aCtx: TtfwContext): Integer;
begin
 Result := 1;
end;//TkwPopObjectGetOrdProp.GetAllParamsCount

function TkwPopObjectGetOrdProp.ParamsTypes: PTypeInfoArray;
//#UC START# *5617F4D00243_AB11F1E6DB9D_var*
//#UC END# *5617F4D00243_AB11F1E6DB9D_var*
begin
//#UC START# *5617F4D00243_AB11F1E6DB9D_impl*
 !!! Needs to be implemented !!!
//#UC END# *5617F4D00243_AB11F1E6DB9D_impl*
end;//TkwPopObjectGetOrdProp.ParamsTypes

function TkwPopObjectGetStrProp.GetStrProp(const aCtx: TtfwContext;
 aObject: TObject;
 const aName: AnsiString): AnsiString;
 {* ���������� ����� ������� pop:Object:GetStrProp }
//#UC START# *FA828528EED2_B3D2E54183FE_var*
//#UC END# *FA828528EED2_B3D2E54183FE_var*
begin
//#UC START# *FA828528EED2_B3D2E54183FE_impl*
 Result := TypInfo.GetStrProp(aObject, aName);
//#UC END# *FA828528EED2_B3D2E54183FE_impl*
end;//TkwPopObjectGetStrProp.GetStrProp

procedure TkwPopObjectGetStrProp.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_B3D2E54183FE_var*
//#UC END# *4DAEEDE10285_B3D2E54183FE_var*
begin
//#UC START# *4DAEEDE10285_B3D2E54183FE_impl*
 !!! Needs to be implemented !!!
//#UC END# *4DAEEDE10285_B3D2E54183FE_impl*
end;//TkwPopObjectGetStrProp.DoDoIt

class function TkwPopObjectGetStrProp.GetWordNameForRegister: AnsiString;
begin
 Result := 'pop:Object:GetStrProp';
end;//TkwPopObjectGetStrProp.GetWordNameForRegister

function TkwPopObjectGetStrProp.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
//#UC START# *551544E2001A_B3D2E54183FE_var*
//#UC END# *551544E2001A_B3D2E54183FE_var*
begin
//#UC START# *551544E2001A_B3D2E54183FE_impl*
 !!! Needs to be implemented !!!
//#UC END# *551544E2001A_B3D2E54183FE_impl*
end;//TkwPopObjectGetStrProp.GetResultTypeInfo

function TkwPopObjectGetStrProp.GetAllParamsCount(const aCtx: TtfwContext): Integer;
begin
 Result := 1;
end;//TkwPopObjectGetStrProp.GetAllParamsCount

function TkwPopObjectGetStrProp.ParamsTypes: PTypeInfoArray;
//#UC START# *5617F4D00243_B3D2E54183FE_var*
//#UC END# *5617F4D00243_B3D2E54183FE_var*
begin
//#UC START# *5617F4D00243_B3D2E54183FE_impl*
 !!! Needs to be implemented !!!
//#UC END# *5617F4D00243_B3D2E54183FE_impl*
end;//TkwPopObjectGetStrProp.ParamsTypes

function TkwPopObjectHasProp.HasProp(const aCtx: TtfwContext;
 aObject: TObject;
 const aName: AnsiString): Boolean;
 {* ���������� ����� ������� pop:Object:HasProp }
//#UC START# *C4DA28B83595_6EBCA1F985F5_var*
//#UC END# *C4DA28B83595_6EBCA1F985F5_var*
begin
//#UC START# *C4DA28B83595_6EBCA1F985F5_impl*
 Result := TypInfo.IsPublishedProp(aObject, aName);
//#UC END# *C4DA28B83595_6EBCA1F985F5_impl*
end;//TkwPopObjectHasProp.HasProp

procedure TkwPopObjectHasProp.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_6EBCA1F985F5_var*
//#UC END# *4DAEEDE10285_6EBCA1F985F5_var*
begin
//#UC START# *4DAEEDE10285_6EBCA1F985F5_impl*
 !!! Needs to be implemented !!!
//#UC END# *4DAEEDE10285_6EBCA1F985F5_impl*
end;//TkwPopObjectHasProp.DoDoIt

class function TkwPopObjectHasProp.GetWordNameForRegister: AnsiString;
begin
 Result := 'pop:Object:HasProp';
end;//TkwPopObjectHasProp.GetWordNameForRegister

function TkwPopObjectHasProp.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
//#UC START# *551544E2001A_6EBCA1F985F5_var*
//#UC END# *551544E2001A_6EBCA1F985F5_var*
begin
//#UC START# *551544E2001A_6EBCA1F985F5_impl*
 !!! Needs to be implemented !!!
//#UC END# *551544E2001A_6EBCA1F985F5_impl*
end;//TkwPopObjectHasProp.GetResultTypeInfo

function TkwPopObjectHasProp.GetAllParamsCount(const aCtx: TtfwContext): Integer;
begin
 Result := 1;
end;//TkwPopObjectHasProp.GetAllParamsCount

function TkwPopObjectHasProp.ParamsTypes: PTypeInfoArray;
//#UC START# *5617F4D00243_6EBCA1F985F5_var*
//#UC END# *5617F4D00243_6EBCA1F985F5_var*
begin
//#UC START# *5617F4D00243_6EBCA1F985F5_impl*
 !!! Needs to be implemented !!!
//#UC END# *5617F4D00243_6EBCA1F985F5_impl*
end;//TkwPopObjectHasProp.ParamsTypes

function TkwPopObjectRTTIInfo.RTTIInfo(const aCtx: TtfwContext;
 aObject: TObject): AnsiString;
 {* ���������� ����� ������� pop:Object:RTTIInfo }
//#UC START# *C6405BCAA6A5_0725EE68AD3B_var*
//#UC END# *C6405BCAA6A5_0725EE68AD3B_var*
begin
//#UC START# *C6405BCAA6A5_0725EE68AD3B_impl*
 Result := l3FormatRTTIInfo(aObject);
//#UC END# *C6405BCAA6A5_0725EE68AD3B_impl*
end;//TkwPopObjectRTTIInfo.RTTIInfo

procedure TkwPopObjectRTTIInfo.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_0725EE68AD3B_var*
//#UC END# *4DAEEDE10285_0725EE68AD3B_var*
begin
//#UC START# *4DAEEDE10285_0725EE68AD3B_impl*
 !!! Needs to be implemented !!!
//#UC END# *4DAEEDE10285_0725EE68AD3B_impl*
end;//TkwPopObjectRTTIInfo.DoDoIt

class function TkwPopObjectRTTIInfo.GetWordNameForRegister: AnsiString;
begin
 Result := 'pop:Object:RTTIInfo';
end;//TkwPopObjectRTTIInfo.GetWordNameForRegister

function TkwPopObjectRTTIInfo.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
//#UC START# *551544E2001A_0725EE68AD3B_var*
//#UC END# *551544E2001A_0725EE68AD3B_var*
begin
//#UC START# *551544E2001A_0725EE68AD3B_impl*
 !!! Needs to be implemented !!!
//#UC END# *551544E2001A_0725EE68AD3B_impl*
end;//TkwPopObjectRTTIInfo.GetResultTypeInfo

function TkwPopObjectRTTIInfo.GetAllParamsCount(const aCtx: TtfwContext): Integer;
begin
 Result := 0;
end;//TkwPopObjectRTTIInfo.GetAllParamsCount

function TkwPopObjectRTTIInfo.ParamsTypes: PTypeInfoArray;
//#UC START# *5617F4D00243_0725EE68AD3B_var*
//#UC END# *5617F4D00243_0725EE68AD3B_var*
begin
//#UC START# *5617F4D00243_0725EE68AD3B_impl*
 !!! Needs to be implemented !!!
//#UC END# *5617F4D00243_0725EE68AD3B_impl*
end;//TkwPopObjectRTTIInfo.ParamsTypes

procedure TkwPopObjectSetFloatProp.SetFloatProp(const aCtx: TtfwContext;
 aObject: TObject;
 const aName: AnsiString;
 aValue: Integer);
 {* ���������� ����� ������� pop:Object:SetFloatProp }
//#UC START# *4D07D0C5DD70_529CD18EA056_var*
//#UC END# *4D07D0C5DD70_529CD18EA056_var*
begin
//#UC START# *4D07D0C5DD70_529CD18EA056_impl*
 TypInfo.SetFloatProp(aObject, aName, aValue);
//#UC END# *4D07D0C5DD70_529CD18EA056_impl*
end;//TkwPopObjectSetFloatProp.SetFloatProp

procedure TkwPopObjectSetFloatProp.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_529CD18EA056_var*
//#UC END# *4DAEEDE10285_529CD18EA056_var*
begin
//#UC START# *4DAEEDE10285_529CD18EA056_impl*
 !!! Needs to be implemented !!!
//#UC END# *4DAEEDE10285_529CD18EA056_impl*
end;//TkwPopObjectSetFloatProp.DoDoIt

class function TkwPopObjectSetFloatProp.GetWordNameForRegister: AnsiString;
begin
 Result := 'pop:Object:SetFloatProp';
end;//TkwPopObjectSetFloatProp.GetWordNameForRegister

function TkwPopObjectSetFloatProp.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
//#UC START# *551544E2001A_529CD18EA056_var*
//#UC END# *551544E2001A_529CD18EA056_var*
begin
//#UC START# *551544E2001A_529CD18EA056_impl*
 !!! Needs to be implemented !!!
//#UC END# *551544E2001A_529CD18EA056_impl*
end;//TkwPopObjectSetFloatProp.GetResultTypeInfo

function TkwPopObjectSetFloatProp.GetAllParamsCount(const aCtx: TtfwContext): Integer;
begin
 Result := 2;
end;//TkwPopObjectSetFloatProp.GetAllParamsCount

function TkwPopObjectSetFloatProp.ParamsTypes: PTypeInfoArray;
//#UC START# *5617F4D00243_529CD18EA056_var*
//#UC END# *5617F4D00243_529CD18EA056_var*
begin
//#UC START# *5617F4D00243_529CD18EA056_impl*
 !!! Needs to be implemented !!!
//#UC END# *5617F4D00243_529CD18EA056_impl*
end;//TkwPopObjectSetFloatProp.ParamsTypes

procedure TkwPopObjectSetOrdProp.SetOrdProp(const aCtx: TtfwContext;
 aObject: TObject;
 const aName: AnsiString;
 aValue: Integer);
 {* ���������� ����� ������� pop:Object:SetOrdProp }
//#UC START# *F069028D7CFF_A2938530A58A_var*
//#UC END# *F069028D7CFF_A2938530A58A_var*
begin
//#UC START# *F069028D7CFF_A2938530A58A_impl*
 TypInfo.SetOrdProp(aObject, aName, aValue);
//#UC END# *F069028D7CFF_A2938530A58A_impl*
end;//TkwPopObjectSetOrdProp.SetOrdProp

procedure TkwPopObjectSetOrdProp.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_A2938530A58A_var*
//#UC END# *4DAEEDE10285_A2938530A58A_var*
begin
//#UC START# *4DAEEDE10285_A2938530A58A_impl*
 !!! Needs to be implemented !!!
//#UC END# *4DAEEDE10285_A2938530A58A_impl*
end;//TkwPopObjectSetOrdProp.DoDoIt

class function TkwPopObjectSetOrdProp.GetWordNameForRegister: AnsiString;
begin
 Result := 'pop:Object:SetOrdProp';
end;//TkwPopObjectSetOrdProp.GetWordNameForRegister

function TkwPopObjectSetOrdProp.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
//#UC START# *551544E2001A_A2938530A58A_var*
//#UC END# *551544E2001A_A2938530A58A_var*
begin
//#UC START# *551544E2001A_A2938530A58A_impl*
 !!! Needs to be implemented !!!
//#UC END# *551544E2001A_A2938530A58A_impl*
end;//TkwPopObjectSetOrdProp.GetResultTypeInfo

function TkwPopObjectSetOrdProp.GetAllParamsCount(const aCtx: TtfwContext): Integer;
begin
 Result := 2;
end;//TkwPopObjectSetOrdProp.GetAllParamsCount

function TkwPopObjectSetOrdProp.ParamsTypes: PTypeInfoArray;
//#UC START# *5617F4D00243_A2938530A58A_var*
//#UC END# *5617F4D00243_A2938530A58A_var*
begin
//#UC START# *5617F4D00243_A2938530A58A_impl*
 !!! Needs to be implemented !!!
//#UC END# *5617F4D00243_A2938530A58A_impl*
end;//TkwPopObjectSetOrdProp.ParamsTypes

procedure TkwPopObjectSetStrProp.SetStrProp(const aCtx: TtfwContext;
 aObject: TObject;
 const aName: AnsiString;
 const aValue: AnsiString);
 {* ���������� ����� ������� pop:Object:SetStrProp }
//#UC START# *D79D3014F0CB_798893499F18_var*
//#UC END# *D79D3014F0CB_798893499F18_var*
begin
//#UC START# *D79D3014F0CB_798893499F18_impl*
 TypInfo.SetStrProp(aObject, aName, aValue);
//#UC END# *D79D3014F0CB_798893499F18_impl*
end;//TkwPopObjectSetStrProp.SetStrProp

procedure TkwPopObjectSetStrProp.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_798893499F18_var*
//#UC END# *4DAEEDE10285_798893499F18_var*
begin
//#UC START# *4DAEEDE10285_798893499F18_impl*
 !!! Needs to be implemented !!!
//#UC END# *4DAEEDE10285_798893499F18_impl*
end;//TkwPopObjectSetStrProp.DoDoIt

class function TkwPopObjectSetStrProp.GetWordNameForRegister: AnsiString;
begin
 Result := 'pop:Object:SetStrProp';
end;//TkwPopObjectSetStrProp.GetWordNameForRegister

function TkwPopObjectSetStrProp.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
//#UC START# *551544E2001A_798893499F18_var*
//#UC END# *551544E2001A_798893499F18_var*
begin
//#UC START# *551544E2001A_798893499F18_impl*
 !!! Needs to be implemented !!!
//#UC END# *551544E2001A_798893499F18_impl*
end;//TkwPopObjectSetStrProp.GetResultTypeInfo

function TkwPopObjectSetStrProp.GetAllParamsCount(const aCtx: TtfwContext): Integer;
begin
 Result := 2;
end;//TkwPopObjectSetStrProp.GetAllParamsCount

function TkwPopObjectSetStrProp.ParamsTypes: PTypeInfoArray;
//#UC START# *5617F4D00243_798893499F18_var*
//#UC END# *5617F4D00243_798893499F18_var*
begin
//#UC START# *5617F4D00243_798893499F18_impl*
 !!! Needs to be implemented !!!
//#UC END# *5617F4D00243_798893499F18_impl*
end;//TkwPopObjectSetStrProp.ParamsTypes

initialization
 TObjectFromstackWordsResNameGetter.Register;
 {* ����������� ������������ ����������� }
 TkwPopObjectInherits.RegisterInEngine;
 {* ����������� pop_Object_Inherits }
 TkwPopObjectClassName.RegisterInEngine;
 {* ����������� pop_Object_ClassName }
 TkwPopObjectGetFloatProp.RegisterInEngine;
 {* ����������� pop_Object_GetFloatProp }
 TkwPopObjectGetInterfaceProp.RegisterInEngine;
 {* ����������� pop_Object_GetInterfaceProp }
 TkwPopObjectGetObjProp.RegisterInEngine;
 {* ����������� pop_Object_GetObjProp }
 TkwPopObjectGetOrdProp.RegisterInEngine;
 {* ����������� pop_Object_GetOrdProp }
 TkwPopObjectGetStrProp.RegisterInEngine;
 {* ����������� pop_Object_GetStrProp }
 TkwPopObjectHasProp.RegisterInEngine;
 {* ����������� pop_Object_HasProp }
 TkwPopObjectRTTIInfo.RegisterInEngine;
 {* ����������� pop_Object_RTTIInfo }
 TkwPopObjectSetFloatProp.RegisterInEngine;
 {* ����������� pop_Object_SetFloatProp }
 TkwPopObjectSetOrdProp.RegisterInEngine;
 {* ����������� pop_Object_SetOrdProp }
 TkwPopObjectSetStrProp.RegisterInEngine;
 {* ����������� pop_Object_SetStrProp }
 TtfwTypeRegistrator.RegisterType(@tfw_tiStruct);
 {* ����������� ���� TtfwContext }
 TtfwTypeRegistrator.RegisterType(TypeInfo(TObject));
 {* ����������� ���� TObject }
 TtfwTypeRegistrator.RegisterType(@tfw_tiStruct);
 {* ����������� ���� TtfwStackValue }
 TtfwTypeRegistrator.RegisterType(TypeInfo(Boolean));
 {* ����������� ���� Boolean }
 TtfwTypeRegistrator.RegisterType(@tfw_tiString);
 {* ����������� ���� String }
 TtfwTypeRegistrator.RegisterType(TypeInfo(Integer));
 {* ����������� ���� Integer }
 TtfwTypeRegistrator.RegisterType(TypeInfo(IUnknown));
 {* ����������� ���� IUnknown }
{$IfEnd} // NOT Defined(NoScripts)

end.
