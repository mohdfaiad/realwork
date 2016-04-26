unit StatusBarWords;

// ������: "w:\common\components\rtl\Garant\ScriptEngine\StatusBarWords.pas"
// ���������: "ScriptKeywordsPack"
// ������� ������: "StatusBarWords" MUID: (505C855C024A)

{$Include w:\common\components\rtl\Garant\ScriptEngine\seDefine.inc}

interface

{$If Defined(Nemesis) AND NOT Defined(NoScripts)}
uses
 l3IntfUses
;
{$IfEnd} // Defined(Nemesis) AND NOT Defined(NoScripts)

implementation

{$If Defined(Nemesis) AND NOT Defined(NoScripts)}
uses
 l3ImplUses
 , nscStatusBar
 , tfwAxiomaticsResNameGetter
 , tfwClassLike
 {$If NOT Defined(NoVCL)}
 , Controls
 {$IfEnd} // NOT Defined(NoVCL)
 , tfwScriptingInterfaces
 , TypInfo
 , SysUtils
 , tfwTypeRegistrator
 , tfwScriptingTypes
;

type
 //#UC START# *98311E435825ci*
 //#UC END# *98311E435825ci*
 //#UC START# *98311E435825cit*
 //#UC END# *98311E435825cit*
 TStatusBarWordsResNameGetter = {final} class(TtfwAxiomaticsResNameGetter)
  {* ����������� ������������ ����������� }
  public
   class function ResName: AnsiString; override;
 //#UC START# *98311E435825publ*
 //#UC END# *98311E435825publ*
 end;//TStatusBarWordsResNameGetter

 TkwStatusBarOrderedControl = {final} class(TtfwClassLike)
  {* ����� ������� StatusBar:OrderedControl
*��� ����������:* TControl
*������:*
[code]
OBJECT VAR l_TControl
 anIndex aStatusBar StatusBar:OrderedControl >>> l_TControl
[code]  }
  private
   function OrderedControl(const aCtx: TtfwContext;
    aStatusBar: TnscStatusBar;
    anIndex: Integer): TControl;
    {* ���������� ����� ������� StatusBar:OrderedControl }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
  public
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
 end;//TkwStatusBarOrderedControl

 TkwStatusBarOrderedControlsCount = {final} class(TtfwClassLike)
  {* ����� ������� StatusBar:OrderedControlsCount
*��� ����������:* Integer
*������:*
[code]
INTEGER VAR l_Integer
 aStatusBar StatusBar:OrderedControlsCount >>> l_Integer
[code]  }
  private
   function OrderedControlsCount(const aCtx: TtfwContext;
    aStatusBar: TnscStatusBar): Integer;
    {* ���������� ����� ������� StatusBar:OrderedControlsCount }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
  public
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
 end;//TkwStatusBarOrderedControlsCount

 TkwStatusBarOrderIndex = {final} class(TtfwClassLike)
  {* ����� ������� StatusBar:OrderIndex
*��� ����������:* Integer
*������:*
[code]
INTEGER VAR l_Integer
 aControl aStatusBar StatusBar:OrderIndex >>> l_Integer
[code]  }
  private
   function OrderIndex(const aCtx: TtfwContext;
    aStatusBar: TnscStatusBar;
    aControl: TControl): Integer;
    {* ���������� ����� ������� StatusBar:OrderIndex }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
  public
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
 end;//TkwStatusBarOrderIndex

class function TStatusBarWordsResNameGetter.ResName: AnsiString;
begin
  Result := 'StatusBarWords';
end;//TStatusBarWordsResNameGetter.ResName

 {$R StatusBarWords.res}

function TkwStatusBarOrderedControl.OrderedControl(const aCtx: TtfwContext;
 aStatusBar: TnscStatusBar;
 anIndex: Integer): TControl;
 {* ���������� ����� ������� StatusBar:OrderedControl }
//#UC START# *FE371E175914_6A3FD2C52DF9_var*
//#UC END# *FE371E175914_6A3FD2C52DF9_var*
begin
//#UC START# *FE371E175914_6A3FD2C52DF9_impl*
 Result := aStatusBar.OrderedControls[anIndex];
//#UC END# *FE371E175914_6A3FD2C52DF9_impl*
end;//TkwStatusBarOrderedControl.OrderedControl

procedure TkwStatusBarOrderedControl.DoDoIt(const aCtx: TtfwContext);
var l_aStatusBar: TnscStatusBar;
var l_anIndex: Integer;
begin
 try
  l_aStatusBar := TnscStatusBar(aCtx.rEngine.PopObjAs(TnscStatusBar));
 except
  on E: Exception do
  begin
   RunnerError('������ ��� ��������� ��������� aStatusBar: TnscStatusBar : ' + E.Message, aCtx);
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
 aCtx.rEngine.PushObj(OrderedControl(aCtx, l_aStatusBar, l_anIndex));
end;//TkwStatusBarOrderedControl.DoDoIt

function TkwStatusBarOrderedControl.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
begin
 Result := TypeInfo(TControl);
end;//TkwStatusBarOrderedControl.GetResultTypeInfo

function TkwStatusBarOrderedControl.GetAllParamsCount(const aCtx: TtfwContext): Integer;
begin
 Result := 2;
end;//TkwStatusBarOrderedControl.GetAllParamsCount

function TkwStatusBarOrderedControl.ParamsTypes: PTypeInfoArray;
begin
 Result := OpenTypesToTypes([TypeInfo(TnscStatusBar), TypeInfo(Integer)]);
end;//TkwStatusBarOrderedControl.ParamsTypes

class function TkwStatusBarOrderedControl.GetWordNameForRegister: AnsiString;
begin
 Result := 'StatusBar:OrderedControl';
end;//TkwStatusBarOrderedControl.GetWordNameForRegister

function TkwStatusBarOrderedControlsCount.OrderedControlsCount(const aCtx: TtfwContext;
 aStatusBar: TnscStatusBar): Integer;
 {* ���������� ����� ������� StatusBar:OrderedControlsCount }
//#UC START# *3F6B70526DE3_C8B065596342_var*
//#UC END# *3F6B70526DE3_C8B065596342_var*
begin
//#UC START# *3F6B70526DE3_C8B065596342_impl*
 Result := aStatusBar.OrderedControlsCount; 
//#UC END# *3F6B70526DE3_C8B065596342_impl*
end;//TkwStatusBarOrderedControlsCount.OrderedControlsCount

procedure TkwStatusBarOrderedControlsCount.DoDoIt(const aCtx: TtfwContext);
var l_aStatusBar: TnscStatusBar;
begin
 try
  l_aStatusBar := TnscStatusBar(aCtx.rEngine.PopObjAs(TnscStatusBar));
 except
  on E: Exception do
  begin
   RunnerError('������ ��� ��������� ��������� aStatusBar: TnscStatusBar : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushInt(OrderedControlsCount(aCtx, l_aStatusBar));
end;//TkwStatusBarOrderedControlsCount.DoDoIt

function TkwStatusBarOrderedControlsCount.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
begin
 Result := TypeInfo(Integer);
end;//TkwStatusBarOrderedControlsCount.GetResultTypeInfo

function TkwStatusBarOrderedControlsCount.GetAllParamsCount(const aCtx: TtfwContext): Integer;
begin
 Result := 1;
end;//TkwStatusBarOrderedControlsCount.GetAllParamsCount

function TkwStatusBarOrderedControlsCount.ParamsTypes: PTypeInfoArray;
begin
 Result := OpenTypesToTypes([TypeInfo(TnscStatusBar)]);
end;//TkwStatusBarOrderedControlsCount.ParamsTypes

class function TkwStatusBarOrderedControlsCount.GetWordNameForRegister: AnsiString;
begin
 Result := 'StatusBar:OrderedControlsCount';
end;//TkwStatusBarOrderedControlsCount.GetWordNameForRegister

function TkwStatusBarOrderIndex.OrderIndex(const aCtx: TtfwContext;
 aStatusBar: TnscStatusBar;
 aControl: TControl): Integer;
 {* ���������� ����� ������� StatusBar:OrderIndex }
//#UC START# *BD703176FDE6_F7D061E9FD6E_var*
//#UC END# *BD703176FDE6_F7D061E9FD6E_var*
begin
//#UC START# *BD703176FDE6_F7D061E9FD6E_impl*
 Result := aStatusBar.OrderIndex[aControl];
//#UC END# *BD703176FDE6_F7D061E9FD6E_impl*
end;//TkwStatusBarOrderIndex.OrderIndex

procedure TkwStatusBarOrderIndex.DoDoIt(const aCtx: TtfwContext);
var l_aStatusBar: TnscStatusBar;
var l_aControl: TControl;
begin
 try
  l_aStatusBar := TnscStatusBar(aCtx.rEngine.PopObjAs(TnscStatusBar));
 except
  on E: Exception do
  begin
   RunnerError('������ ��� ��������� ��������� aStatusBar: TnscStatusBar : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_aControl := TControl(aCtx.rEngine.PopObjAs(TControl));
 except
  on E: Exception do
  begin
   RunnerError('������ ��� ��������� ��������� aControl: TControl : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushInt(OrderIndex(aCtx, l_aStatusBar, l_aControl));
end;//TkwStatusBarOrderIndex.DoDoIt

function TkwStatusBarOrderIndex.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
begin
 Result := TypeInfo(Integer);
end;//TkwStatusBarOrderIndex.GetResultTypeInfo

function TkwStatusBarOrderIndex.GetAllParamsCount(const aCtx: TtfwContext): Integer;
begin
 Result := 2;
end;//TkwStatusBarOrderIndex.GetAllParamsCount

function TkwStatusBarOrderIndex.ParamsTypes: PTypeInfoArray;
begin
 Result := OpenTypesToTypes([TypeInfo(TnscStatusBar), TypeInfo(TControl)]);
end;//TkwStatusBarOrderIndex.ParamsTypes

class function TkwStatusBarOrderIndex.GetWordNameForRegister: AnsiString;
begin
 Result := 'StatusBar:OrderIndex';
end;//TkwStatusBarOrderIndex.GetWordNameForRegister

initialization
 TStatusBarWordsResNameGetter.Register;
 {* ����������� ������������ ����������� }
 TkwStatusBarOrderedControl.RegisterInEngine;
 {* ����������� StatusBar_OrderedControl }
 TkwStatusBarOrderedControlsCount.RegisterInEngine;
 {* ����������� StatusBar_OrderedControlsCount }
 TkwStatusBarOrderIndex.RegisterInEngine;
 {* ����������� StatusBar_OrderIndex }
 TtfwTypeRegistrator.RegisterType(@tfw_tiStruct);
 {* ����������� ���� TtfwContext }
 TtfwTypeRegistrator.RegisterType(TypeInfo(TnscStatusBar));
 {* ����������� ���� TnscStatusBar }
 TtfwTypeRegistrator.RegisterType(TypeInfo(Integer));
 {* ����������� ���� Integer }
 TtfwTypeRegistrator.RegisterType(TypeInfo(TControl));
 {* ����������� ���� TControl }
{$IfEnd} // Defined(Nemesis) AND NOT Defined(NoScripts)

end.
