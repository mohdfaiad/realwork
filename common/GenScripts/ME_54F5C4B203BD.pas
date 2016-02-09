unit WinControlsProcessingPack;

// ������: "w:\common\components\rtl\Garant\ScriptEngine\WinControlsProcessingPack.pas"
// ���������: "ScriptKeywordsPack"

{$Include seDefine.inc}

interface

{$If NOT Defined(NoScripts) AND NOT Defined(NoVCL)}
uses
 l3IntfUses
 , Controls
 , Classes
 , Types
 , tfwClassLike
 , tfwScriptingInterfaces
 , TypInfo
 , tfwPropertyLike
 , tfwTypeInfo
;
{$IfEnd} // NOT Defined(NoScripts) AND NOT Defined(NoVCL)

implementation

{$If NOT Defined(NoScripts) AND NOT Defined(NoVCL)}
uses
 l3ImplUses
 , Messages
 , Windows
 , tfwScriptingTypes
 , tfwTypeRegistrator
 , SysUtils
;

type
 TkwPopControlMouseLeftClick = {final} class(TtfwClassLike)
  {* ����� ������� pop:Control:MouseLeftClick
*������:*
[code]
 aPoint aControl pop:Control:MouseLeftClick
[code]  }
  private
   procedure MouseLeftClick(const aCtx: TtfwContext;
    aControl: TWinControl;
    const aPoint: TPoint);
    {* ���������� ����� ������� pop:Control:MouseLeftClick }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
  public
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
 end;//TkwPopControlMouseLeftClick

 TkwPopControlMouseMiddleClick = {final} class(TtfwClassLike)
  {* ����� ������� pop:Control:MouseMiddleClick
*������:*
[code]
 aPoint aControl pop:Control:MouseMiddleClick
[code]  }
  private
   procedure MouseMiddleClick(const aCtx: TtfwContext;
    aControl: TWinControl;
    const aPoint: TPoint);
    {* ���������� ����� ������� pop:Control:MouseMiddleClick }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
  public
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
 end;//TkwPopControlMouseMiddleClick

 TkwPopControlMouseRightClick = {final} class(TtfwClassLike)
  {* ����� ������� pop:Control:MouseRightClick
*������:*
[code]
 aPoint aControl pop:Control:MouseRightClick
[code]  }
  private
   procedure MouseRightClick(const aCtx: TtfwContext;
    aControl: TWinControl;
    const aPoint: TPoint);
    {* ���������� ����� ������� pop:Control:MouseRightClick }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
  public
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
 end;//TkwPopControlMouseRightClick

 TkwPopControlFindControlByName = {final} class(TtfwClassLike)
  {* ����� ������� pop:Control:FindControlByName
*��� ����������:* TComponent
*������:*
[code]
OBJECT VAR l_TComponent
 aName aControl pop:Control:FindControlByName >>> l_TComponent
[code]  }
  private
   function FindControlByName(const aCtx: TtfwContext;
    aControl: TWinControl;
    const aName: AnsiString): TComponent;
    {* ���������� ����� ������� pop:Control:FindControlByName }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
  public
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
 end;//TkwPopControlFindControlByName

 TkwPopControlGetControl = {final} class(TtfwClassLike)
  {* ����� ������� pop:Control:GetControl
*��� ����������:* TControl
*������:*
[code]
OBJECT VAR l_TControl
 anIndex aControl pop:Control:GetControl >>> l_TControl
[code]  }
  private
   function GetControl(const aCtx: TtfwContext;
    aControl: TWinControl;
    anIndex: Integer): TControl;
    {* ���������� ����� ������� pop:Control:GetControl }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
  public
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
 end;//TkwPopControlGetControl

 TkwPopControlMouseWheelUp = {final} class(TtfwClassLike)
  {* ����� ������� pop:Control:MouseWheelUp
*������:*
[code]
 aControl pop:Control:MouseWheelUp
[code]  }
  private
   procedure MouseWheelUp(const aCtx: TtfwContext;
    aControl: TWinControl);
    {* ���������� ����� ������� pop:Control:MouseWheelUp }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
  public
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
 end;//TkwPopControlMouseWheelUp

 TkwPopControlMouseWheelDown = {final} class(TtfwClassLike)
  {* ����� ������� pop:Control:MouseWheelDown
*������:*
[code]
 aControl pop:Control:MouseWheelDown
[code]  }
  private
   procedure MouseWheelDown(const aCtx: TtfwContext;
    aControl: TWinControl);
    {* ���������� ����� ������� pop:Control:MouseWheelDown }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
  public
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
 end;//TkwPopControlMouseWheelDown

 TkwPopControlSetFocus = {final} class(TtfwClassLike)
  {* ����� ������� pop:Control:SetFocus
*��� ����������:* Boolean
*������:*
[code]
BOOLEAN VAR l_Boolean
 aControl pop:Control:SetFocus >>> l_Boolean
[code]  }
  private
   function SetFocus(const aCtx: TtfwContext;
    aControl: TWinControl): Boolean;
    {* ���������� ����� ������� pop:Control:SetFocus }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
  public
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
 end;//TkwPopControlSetFocus

 TkwPopControlMouseLeftDragAndDrop = {final} class(TtfwClassLike)
  {* ����� ������� pop:Control:MouseLeftDragAndDrop
*������:*
[code]
 aPoint aDelta aControl pop:Control:MouseLeftDragAndDrop
[code]  }
  private
   procedure MouseLeftDragAndDrop(const aCtx: TtfwContext;
    aControl: TWinControl;
    const aDelta: TPoint;
    const aPoint: TPoint);
    {* ���������� ����� ������� pop:Control:MouseLeftDragAndDrop }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
  public
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
 end;//TkwPopControlMouseLeftDragAndDrop

 TkwPopControlControlCount = {final} class(TtfwPropertyLike)
  {* ����� ������� pop:Control:ControlCount
*��� ����������:* Integer
*������:*
[code]
INTEGER VAR l_Integer
 aControl pop:Control:ControlCount >>> l_Integer
[code]  }
  private
   function ControlCount(const aCtx: TtfwContext;
    aControl: TWinControl): Integer;
    {* ���������� ����� ������� pop:Control:ControlCount }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
  public
   procedure SetValuePrim(const aValue: TtfwStackValue;
    const aCtx: TtfwContext); override;
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
 end;//TkwPopControlControlCount

 TkwPopControlHandle = {final} class(TtfwPropertyLike)
  {* ����� ������� pop:Control:Handle
*��� ����������:* Cardinal
*������:*
[code]
CARDINAL VAR l_Cardinal
 aControl pop:Control:Handle >>> l_Cardinal
[code]  }
  private
   function Handle(const aCtx: TtfwContext;
    aControl: TWinControl): Cardinal;
    {* ���������� ����� ������� pop:Control:Handle }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
  public
   procedure SetValuePrim(const aValue: TtfwStackValue;
    const aCtx: TtfwContext); override;
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
 end;//TkwPopControlHandle

 TkwPopControlFocused = {final} class(TtfwPropertyLike)
  {* ����� ������� pop:Control:Focused
*��� ����������:* Boolean
*������:*
[code]
BOOLEAN VAR l_Boolean
 aControl pop:Control:Focused >>> l_Boolean
[code]  }
  private
   function Focused(const aCtx: TtfwContext;
    aControl: TWinControl): Boolean;
    {* ���������� ����� ������� pop:Control:Focused }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
  public
   procedure SetValuePrim(const aValue: TtfwStackValue;
    const aCtx: TtfwContext); override;
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
 end;//TkwPopControlFocused

 TkwPopControlCanFocus = {final} class(TtfwPropertyLike)
  {* ����� ������� pop:Control:CanFocus
*��� ����������:* Boolean
*������:*
[code]
BOOLEAN VAR l_Boolean
 aControl pop:Control:CanFocus >>> l_Boolean
[code]  }
  private
   function CanFocus(const aCtx: TtfwContext;
    aControl: TWinControl): Boolean;
    {* ���������� ����� ������� pop:Control:CanFocus }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
  public
   procedure SetValuePrim(const aValue: TtfwStackValue;
    const aCtx: TtfwContext); override;
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
 end;//TkwPopControlCanFocus

procedure TkwPopControlMouseLeftClick.MouseLeftClick(const aCtx: TtfwContext;
 aControl: TWinControl;
 const aPoint: TPoint);
 {* ���������� ����� ������� pop:Control:MouseLeftClick }
//#UC START# *D86EEEFC03D7_207CDF6BFC46_var*
var
 l_Pos      : TPoint;
 l_MousePos : TSmallPoint;
//#UC END# *D86EEEFC03D7_207CDF6BFC46_var*
begin
//#UC START# *D86EEEFC03D7_207CDF6BFC46_impl*
 with aControl.BoundsRect do
  l_Pos := Point(Left + aPoint.X, Top + aPoint.Y);
 l_MousePos := PointToSmallPoint(l_Pos);

 SendMessage(aControl.Handle, WM_LBUTTONDOWN, 0, Longint(l_MousePos));
 SendMessage(aControl.Handle, WM_LBUTTONUP, 0, Longint(l_MousePos));
//#UC END# *D86EEEFC03D7_207CDF6BFC46_impl*
end;//TkwPopControlMouseLeftClick.MouseLeftClick

procedure TkwPopControlMouseLeftClick.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_207CDF6BFC46_var*
//#UC END# *4DAEEDE10285_207CDF6BFC46_var*
begin
//#UC START# *4DAEEDE10285_207CDF6BFC46_impl*
 !!! Needs to be implemented !!!
//#UC END# *4DAEEDE10285_207CDF6BFC46_impl*
end;//TkwPopControlMouseLeftClick.DoDoIt

class function TkwPopControlMouseLeftClick.GetWordNameForRegister: AnsiString;
begin
 Result := 'pop:Control:MouseLeftClick';
end;//TkwPopControlMouseLeftClick.GetWordNameForRegister

function TkwPopControlMouseLeftClick.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
//#UC START# *551544E2001A_207CDF6BFC46_var*
//#UC END# *551544E2001A_207CDF6BFC46_var*
begin
//#UC START# *551544E2001A_207CDF6BFC46_impl*
 !!! Needs to be implemented !!!
//#UC END# *551544E2001A_207CDF6BFC46_impl*
end;//TkwPopControlMouseLeftClick.GetResultTypeInfo

function TkwPopControlMouseLeftClick.GetAllParamsCount(const aCtx: TtfwContext): Integer;
begin
 Result := 1;
end;//TkwPopControlMouseLeftClick.GetAllParamsCount

function TkwPopControlMouseLeftClick.ParamsTypes: PTypeInfoArray;
//#UC START# *5617F4D00243_207CDF6BFC46_var*
//#UC END# *5617F4D00243_207CDF6BFC46_var*
begin
//#UC START# *5617F4D00243_207CDF6BFC46_impl*
 !!! Needs to be implemented !!!
//#UC END# *5617F4D00243_207CDF6BFC46_impl*
end;//TkwPopControlMouseLeftClick.ParamsTypes

procedure TkwPopControlMouseMiddleClick.MouseMiddleClick(const aCtx: TtfwContext;
 aControl: TWinControl;
 const aPoint: TPoint);
 {* ���������� ����� ������� pop:Control:MouseMiddleClick }
//#UC START# *0EBF330C06BD_652B805E6BDC_var*
var
 l_Pos      : TPoint;
 l_MousePos : TSmallPoint;
//#UC END# *0EBF330C06BD_652B805E6BDC_var*
begin
//#UC START# *0EBF330C06BD_652B805E6BDC_impl*
 with aControl.BoundsRect do
  l_Pos := Point(Left + aPoint.X, Top + aPoint.Y);
 l_MousePos := PointToSmallPoint(l_Pos);

 SendMessage(aControl.Handle, WM_MBUTTONDOWN, 0, Longint(l_MousePos));
 SendMessage(aControl.Handle, WM_MBUTTONUP, 0, Longint(l_MousePos));
//#UC END# *0EBF330C06BD_652B805E6BDC_impl*
end;//TkwPopControlMouseMiddleClick.MouseMiddleClick

procedure TkwPopControlMouseMiddleClick.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_652B805E6BDC_var*
//#UC END# *4DAEEDE10285_652B805E6BDC_var*
begin
//#UC START# *4DAEEDE10285_652B805E6BDC_impl*
 !!! Needs to be implemented !!!
//#UC END# *4DAEEDE10285_652B805E6BDC_impl*
end;//TkwPopControlMouseMiddleClick.DoDoIt

class function TkwPopControlMouseMiddleClick.GetWordNameForRegister: AnsiString;
begin
 Result := 'pop:Control:MouseMiddleClick';
end;//TkwPopControlMouseMiddleClick.GetWordNameForRegister

function TkwPopControlMouseMiddleClick.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
//#UC START# *551544E2001A_652B805E6BDC_var*
//#UC END# *551544E2001A_652B805E6BDC_var*
begin
//#UC START# *551544E2001A_652B805E6BDC_impl*
 !!! Needs to be implemented !!!
//#UC END# *551544E2001A_652B805E6BDC_impl*
end;//TkwPopControlMouseMiddleClick.GetResultTypeInfo

function TkwPopControlMouseMiddleClick.GetAllParamsCount(const aCtx: TtfwContext): Integer;
begin
 Result := 1;
end;//TkwPopControlMouseMiddleClick.GetAllParamsCount

function TkwPopControlMouseMiddleClick.ParamsTypes: PTypeInfoArray;
//#UC START# *5617F4D00243_652B805E6BDC_var*
//#UC END# *5617F4D00243_652B805E6BDC_var*
begin
//#UC START# *5617F4D00243_652B805E6BDC_impl*
 !!! Needs to be implemented !!!
//#UC END# *5617F4D00243_652B805E6BDC_impl*
end;//TkwPopControlMouseMiddleClick.ParamsTypes

procedure TkwPopControlMouseRightClick.MouseRightClick(const aCtx: TtfwContext;
 aControl: TWinControl;
 const aPoint: TPoint);
 {* ���������� ����� ������� pop:Control:MouseRightClick }
//#UC START# *700C331C0034_01A83C03B567_var*
var
 l_Pos      : TPoint;
 l_MousePos : TSmallPoint;
//#UC END# *700C331C0034_01A83C03B567_var*
begin
//#UC START# *700C331C0034_01A83C03B567_impl*
 with aControl.BoundsRect do
  l_Pos := Point(Left + aPoint.X, Top + aPoint.Y);
 l_MousePos := PointToSmallPoint(l_Pos);

 SendMessage(aControl.Handle, WM_RBUTTONDOWN, 0, Longint(l_MousePos));
 SendMessage(aControl.Handle, WM_RBUTTONUP, 0, Longint(l_MousePos));
//#UC END# *700C331C0034_01A83C03B567_impl*
end;//TkwPopControlMouseRightClick.MouseRightClick

procedure TkwPopControlMouseRightClick.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_01A83C03B567_var*
//#UC END# *4DAEEDE10285_01A83C03B567_var*
begin
//#UC START# *4DAEEDE10285_01A83C03B567_impl*
 !!! Needs to be implemented !!!
//#UC END# *4DAEEDE10285_01A83C03B567_impl*
end;//TkwPopControlMouseRightClick.DoDoIt

class function TkwPopControlMouseRightClick.GetWordNameForRegister: AnsiString;
begin
 Result := 'pop:Control:MouseRightClick';
end;//TkwPopControlMouseRightClick.GetWordNameForRegister

function TkwPopControlMouseRightClick.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
//#UC START# *551544E2001A_01A83C03B567_var*
//#UC END# *551544E2001A_01A83C03B567_var*
begin
//#UC START# *551544E2001A_01A83C03B567_impl*
 !!! Needs to be implemented !!!
//#UC END# *551544E2001A_01A83C03B567_impl*
end;//TkwPopControlMouseRightClick.GetResultTypeInfo

function TkwPopControlMouseRightClick.GetAllParamsCount(const aCtx: TtfwContext): Integer;
begin
 Result := 1;
end;//TkwPopControlMouseRightClick.GetAllParamsCount

function TkwPopControlMouseRightClick.ParamsTypes: PTypeInfoArray;
//#UC START# *5617F4D00243_01A83C03B567_var*
//#UC END# *5617F4D00243_01A83C03B567_var*
begin
//#UC START# *5617F4D00243_01A83C03B567_impl*
 !!! Needs to be implemented !!!
//#UC END# *5617F4D00243_01A83C03B567_impl*
end;//TkwPopControlMouseRightClick.ParamsTypes

function TkwPopControlFindControlByName.FindControlByName(const aCtx: TtfwContext;
 aControl: TWinControl;
 const aName: AnsiString): TComponent;
 {* ���������� ����� ������� pop:Control:FindControlByName }
//#UC START# *50D08C92A338_89E1228A3BE4_var*
 function DoFindControl(aControl: TWinControl): TComponent{TControl};
 var
  l_Index : Integer;
  l_C : TControl;
  l_Cmp : TComponent;
 begin//DoFindControl
  if (aControl.Name = aName) then
   Result := aControl
  else
  begin
   Result := nil;
   for l_Index := 0 to Pred(aControl.ControlCount) do
   begin
    l_C := aControl.Controls[l_Index];
    if (l_C.Name = aName) then
    begin
     Result := l_C;
     Exit;
    end//l_C.Name = l_Name
    else
    begin
     if (l_C Is TWinControl) then
     begin
      Result := DoFindControl(TWinControl(l_C));
      if (Result <> nil) then
       Exit;
     end;//l_C Is TWinControl
    end;//l_C.Name = l_Name
   end;//for l_Index
   if (Result = nil) then
    for l_Index := 0 to Pred(aControl.ComponentCount) do
    begin
     l_Cmp := aControl.Components[l_Index];
     if (l_Cmp Is TControl) AND (l_Cmp.Name = aName) then
     begin
      Result := {TControl}(l_Cmp);
      Exit;
     end//l_C.Name = aName
     else
     if (l_Cmp Is TWinControl) then
     begin
      Result := DoFindControl(TWinControl(l_Cmp));
      if (Result <> nil) then
       Exit;
     end;//l_C Is TWinControl
     Result := l_Cmp.FindComponent(aName);
     if (Result <> nil) then
      Exit;
     if (l_Cmp.Name = aName) then
     begin
      Result := l_Cmp;
      Exit;
     end;//l_C.Name = aName
    end;//for l_Index
  end;//aControl.Name = l_Name
 end;//DoFindControl
//#UC END# *50D08C92A338_89E1228A3BE4_var*
begin
//#UC START# *50D08C92A338_89E1228A3BE4_impl*
 Result := DoFindControl(aControl);
//#UC END# *50D08C92A338_89E1228A3BE4_impl*
end;//TkwPopControlFindControlByName.FindControlByName

procedure TkwPopControlFindControlByName.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_89E1228A3BE4_var*
//#UC END# *4DAEEDE10285_89E1228A3BE4_var*
begin
//#UC START# *4DAEEDE10285_89E1228A3BE4_impl*
 !!! Needs to be implemented !!!
//#UC END# *4DAEEDE10285_89E1228A3BE4_impl*
end;//TkwPopControlFindControlByName.DoDoIt

class function TkwPopControlFindControlByName.GetWordNameForRegister: AnsiString;
begin
 Result := 'pop:Control:FindControlByName';
end;//TkwPopControlFindControlByName.GetWordNameForRegister

function TkwPopControlFindControlByName.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
//#UC START# *551544E2001A_89E1228A3BE4_var*
//#UC END# *551544E2001A_89E1228A3BE4_var*
begin
//#UC START# *551544E2001A_89E1228A3BE4_impl*
 !!! Needs to be implemented !!!
//#UC END# *551544E2001A_89E1228A3BE4_impl*
end;//TkwPopControlFindControlByName.GetResultTypeInfo

function TkwPopControlFindControlByName.GetAllParamsCount(const aCtx: TtfwContext): Integer;
begin
 Result := 1;
end;//TkwPopControlFindControlByName.GetAllParamsCount

function TkwPopControlFindControlByName.ParamsTypes: PTypeInfoArray;
//#UC START# *5617F4D00243_89E1228A3BE4_var*
//#UC END# *5617F4D00243_89E1228A3BE4_var*
begin
//#UC START# *5617F4D00243_89E1228A3BE4_impl*
 !!! Needs to be implemented !!!
//#UC END# *5617F4D00243_89E1228A3BE4_impl*
end;//TkwPopControlFindControlByName.ParamsTypes

function TkwPopControlGetControl.GetControl(const aCtx: TtfwContext;
 aControl: TWinControl;
 anIndex: Integer): TControl;
 {* ���������� ����� ������� pop:Control:GetControl }
//#UC START# *F53158879374_0EDEBD14C685_var*
//#UC END# *F53158879374_0EDEBD14C685_var*
begin
//#UC START# *F53158879374_0EDEBD14C685_impl*
 Result := aControl.Controls[anIndex];
//#UC END# *F53158879374_0EDEBD14C685_impl*
end;//TkwPopControlGetControl.GetControl

procedure TkwPopControlGetControl.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_0EDEBD14C685_var*
//#UC END# *4DAEEDE10285_0EDEBD14C685_var*
begin
//#UC START# *4DAEEDE10285_0EDEBD14C685_impl*
 !!! Needs to be implemented !!!
//#UC END# *4DAEEDE10285_0EDEBD14C685_impl*
end;//TkwPopControlGetControl.DoDoIt

class function TkwPopControlGetControl.GetWordNameForRegister: AnsiString;
begin
 Result := 'pop:Control:GetControl';
end;//TkwPopControlGetControl.GetWordNameForRegister

function TkwPopControlGetControl.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
//#UC START# *551544E2001A_0EDEBD14C685_var*
//#UC END# *551544E2001A_0EDEBD14C685_var*
begin
//#UC START# *551544E2001A_0EDEBD14C685_impl*
 !!! Needs to be implemented !!!
//#UC END# *551544E2001A_0EDEBD14C685_impl*
end;//TkwPopControlGetControl.GetResultTypeInfo

function TkwPopControlGetControl.GetAllParamsCount(const aCtx: TtfwContext): Integer;
begin
 Result := 1;
end;//TkwPopControlGetControl.GetAllParamsCount

function TkwPopControlGetControl.ParamsTypes: PTypeInfoArray;
//#UC START# *5617F4D00243_0EDEBD14C685_var*
//#UC END# *5617F4D00243_0EDEBD14C685_var*
begin
//#UC START# *5617F4D00243_0EDEBD14C685_impl*
 !!! Needs to be implemented !!!
//#UC END# *5617F4D00243_0EDEBD14C685_impl*
end;//TkwPopControlGetControl.ParamsTypes

procedure TkwPopControlMouseWheelUp.MouseWheelUp(const aCtx: TtfwContext;
 aControl: TWinControl);
 {* ���������� ����� ������� pop:Control:MouseWheelUp }
//#UC START# *2F3D3440A024_60259FDDB2DC_var*
//#UC END# *2F3D3440A024_60259FDDB2DC_var*
begin
//#UC START# *2F3D3440A024_60259FDDB2DC_impl*
 SendMessage(aControl.Handle, WM_VSCROLL, MakeWParam(SB_LINEUP, 0), 0);
//#UC END# *2F3D3440A024_60259FDDB2DC_impl*
end;//TkwPopControlMouseWheelUp.MouseWheelUp

procedure TkwPopControlMouseWheelUp.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_60259FDDB2DC_var*
//#UC END# *4DAEEDE10285_60259FDDB2DC_var*
begin
//#UC START# *4DAEEDE10285_60259FDDB2DC_impl*
 !!! Needs to be implemented !!!
//#UC END# *4DAEEDE10285_60259FDDB2DC_impl*
end;//TkwPopControlMouseWheelUp.DoDoIt

class function TkwPopControlMouseWheelUp.GetWordNameForRegister: AnsiString;
begin
 Result := 'pop:Control:MouseWheelUp';
end;//TkwPopControlMouseWheelUp.GetWordNameForRegister

function TkwPopControlMouseWheelUp.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
//#UC START# *551544E2001A_60259FDDB2DC_var*
//#UC END# *551544E2001A_60259FDDB2DC_var*
begin
//#UC START# *551544E2001A_60259FDDB2DC_impl*
 !!! Needs to be implemented !!!
//#UC END# *551544E2001A_60259FDDB2DC_impl*
end;//TkwPopControlMouseWheelUp.GetResultTypeInfo

function TkwPopControlMouseWheelUp.GetAllParamsCount(const aCtx: TtfwContext): Integer;
begin
 Result := 1;
end;//TkwPopControlMouseWheelUp.GetAllParamsCount

function TkwPopControlMouseWheelUp.ParamsTypes: PTypeInfoArray;
//#UC START# *5617F4D00243_60259FDDB2DC_var*
//#UC END# *5617F4D00243_60259FDDB2DC_var*
begin
//#UC START# *5617F4D00243_60259FDDB2DC_impl*
 !!! Needs to be implemented !!!
//#UC END# *5617F4D00243_60259FDDB2DC_impl*
end;//TkwPopControlMouseWheelUp.ParamsTypes

procedure TkwPopControlMouseWheelDown.MouseWheelDown(const aCtx: TtfwContext;
 aControl: TWinControl);
 {* ���������� ����� ������� pop:Control:MouseWheelDown }
//#UC START# *31CD1215C543_5676987B6AD8_var*
//#UC END# *31CD1215C543_5676987B6AD8_var*
begin
//#UC START# *31CD1215C543_5676987B6AD8_impl*
 SendMessage(aControl.Handle, WM_VSCROLL, MakeWParam(SB_LINEDOWN, 0), 0);
//#UC END# *31CD1215C543_5676987B6AD8_impl*
end;//TkwPopControlMouseWheelDown.MouseWheelDown

procedure TkwPopControlMouseWheelDown.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_5676987B6AD8_var*
//#UC END# *4DAEEDE10285_5676987B6AD8_var*
begin
//#UC START# *4DAEEDE10285_5676987B6AD8_impl*
 !!! Needs to be implemented !!!
//#UC END# *4DAEEDE10285_5676987B6AD8_impl*
end;//TkwPopControlMouseWheelDown.DoDoIt

class function TkwPopControlMouseWheelDown.GetWordNameForRegister: AnsiString;
begin
 Result := 'pop:Control:MouseWheelDown';
end;//TkwPopControlMouseWheelDown.GetWordNameForRegister

function TkwPopControlMouseWheelDown.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
//#UC START# *551544E2001A_5676987B6AD8_var*
//#UC END# *551544E2001A_5676987B6AD8_var*
begin
//#UC START# *551544E2001A_5676987B6AD8_impl*
 !!! Needs to be implemented !!!
//#UC END# *551544E2001A_5676987B6AD8_impl*
end;//TkwPopControlMouseWheelDown.GetResultTypeInfo

function TkwPopControlMouseWheelDown.GetAllParamsCount(const aCtx: TtfwContext): Integer;
begin
 Result := 1;
end;//TkwPopControlMouseWheelDown.GetAllParamsCount

function TkwPopControlMouseWheelDown.ParamsTypes: PTypeInfoArray;
//#UC START# *5617F4D00243_5676987B6AD8_var*
//#UC END# *5617F4D00243_5676987B6AD8_var*
begin
//#UC START# *5617F4D00243_5676987B6AD8_impl*
 !!! Needs to be implemented !!!
//#UC END# *5617F4D00243_5676987B6AD8_impl*
end;//TkwPopControlMouseWheelDown.ParamsTypes

function TkwPopControlSetFocus.SetFocus(const aCtx: TtfwContext;
 aControl: TWinControl): Boolean;
 {* ���������� ����� ������� pop:Control:SetFocus }
//#UC START# *E30431C2D5CE_52E34524FDF7_var*
//#UC END# *E30431C2D5CE_52E34524FDF7_var*
begin
//#UC START# *E30431C2D5CE_52E34524FDF7_impl*
 if aControl.CanFocus then
  aControl.SetFocus;
 Result := aControl.Focused;
//#UC END# *E30431C2D5CE_52E34524FDF7_impl*
end;//TkwPopControlSetFocus.SetFocus

procedure TkwPopControlSetFocus.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_52E34524FDF7_var*
//#UC END# *4DAEEDE10285_52E34524FDF7_var*
begin
//#UC START# *4DAEEDE10285_52E34524FDF7_impl*
 !!! Needs to be implemented !!!
//#UC END# *4DAEEDE10285_52E34524FDF7_impl*
end;//TkwPopControlSetFocus.DoDoIt

class function TkwPopControlSetFocus.GetWordNameForRegister: AnsiString;
begin
 Result := 'pop:Control:SetFocus';
end;//TkwPopControlSetFocus.GetWordNameForRegister

function TkwPopControlSetFocus.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
//#UC START# *551544E2001A_52E34524FDF7_var*
//#UC END# *551544E2001A_52E34524FDF7_var*
begin
//#UC START# *551544E2001A_52E34524FDF7_impl*
 !!! Needs to be implemented !!!
//#UC END# *551544E2001A_52E34524FDF7_impl*
end;//TkwPopControlSetFocus.GetResultTypeInfo

function TkwPopControlSetFocus.GetAllParamsCount(const aCtx: TtfwContext): Integer;
begin
 Result := 1;
end;//TkwPopControlSetFocus.GetAllParamsCount

function TkwPopControlSetFocus.ParamsTypes: PTypeInfoArray;
//#UC START# *5617F4D00243_52E34524FDF7_var*
//#UC END# *5617F4D00243_52E34524FDF7_var*
begin
//#UC START# *5617F4D00243_52E34524FDF7_impl*
 !!! Needs to be implemented !!!
//#UC END# *5617F4D00243_52E34524FDF7_impl*
end;//TkwPopControlSetFocus.ParamsTypes

procedure TkwPopControlMouseLeftDragAndDrop.MouseLeftDragAndDrop(const aCtx: TtfwContext;
 aControl: TWinControl;
 const aDelta: TPoint;
 const aPoint: TPoint);
 {* ���������� ����� ������� pop:Control:MouseLeftDragAndDrop }
//#UC START# *E69FBA5A5B0F_7A8A3BB834BD_var*
var
 l_Pos       : TPoint;
 l_Pos1      : TPoint;
 l_MousePos  : TSmallPoint;
 l_MousePos1 : TSmallPoint;
//#UC END# *E69FBA5A5B0F_7A8A3BB834BD_var*
begin
//#UC START# *E69FBA5A5B0F_7A8A3BB834BD_impl*
 with aControl.BoundsRect do
 begin
  l_Pos := Point(Left + aPoint.X, Top + aPoint.Y);
  l_Pos1 := Point(l_Pos.X + aDelta.X, l_Pos.Y + aDelta.Y);
 end;//with aControl.BoundsRect 
 l_MousePos := PointToSmallPoint(l_Pos);
 l_MousePos1 := PointToSmallPoint(l_Pos1);

 SendMessage(aControl.Handle, WM_LBUTTONDOWN, 0, Longint(l_MousePos));
 SendMessage(aControl.Handle, WM_MOUSEMOVE, 0, Longint(l_MousePos1));
 SendMessage(aControl.Handle, WM_LBUTTONUP, 0, Longint(l_MousePos1));
//#UC END# *E69FBA5A5B0F_7A8A3BB834BD_impl*
end;//TkwPopControlMouseLeftDragAndDrop.MouseLeftDragAndDrop

procedure TkwPopControlMouseLeftDragAndDrop.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_7A8A3BB834BD_var*
//#UC END# *4DAEEDE10285_7A8A3BB834BD_var*
begin
//#UC START# *4DAEEDE10285_7A8A3BB834BD_impl*
 !!! Needs to be implemented !!!
//#UC END# *4DAEEDE10285_7A8A3BB834BD_impl*
end;//TkwPopControlMouseLeftDragAndDrop.DoDoIt

class function TkwPopControlMouseLeftDragAndDrop.GetWordNameForRegister: AnsiString;
begin
 Result := 'pop:Control:MouseLeftDragAndDrop';
end;//TkwPopControlMouseLeftDragAndDrop.GetWordNameForRegister

function TkwPopControlMouseLeftDragAndDrop.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
//#UC START# *551544E2001A_7A8A3BB834BD_var*
//#UC END# *551544E2001A_7A8A3BB834BD_var*
begin
//#UC START# *551544E2001A_7A8A3BB834BD_impl*
 !!! Needs to be implemented !!!
//#UC END# *551544E2001A_7A8A3BB834BD_impl*
end;//TkwPopControlMouseLeftDragAndDrop.GetResultTypeInfo

function TkwPopControlMouseLeftDragAndDrop.GetAllParamsCount(const aCtx: TtfwContext): Integer;
begin
 Result := 1;
end;//TkwPopControlMouseLeftDragAndDrop.GetAllParamsCount

function TkwPopControlMouseLeftDragAndDrop.ParamsTypes: PTypeInfoArray;
//#UC START# *5617F4D00243_7A8A3BB834BD_var*
//#UC END# *5617F4D00243_7A8A3BB834BD_var*
begin
//#UC START# *5617F4D00243_7A8A3BB834BD_impl*
 !!! Needs to be implemented !!!
//#UC END# *5617F4D00243_7A8A3BB834BD_impl*
end;//TkwPopControlMouseLeftDragAndDrop.ParamsTypes

function TkwPopControlControlCount.ControlCount(const aCtx: TtfwContext;
 aControl: TWinControl): Integer;
 {* ���������� ����� ������� pop:Control:ControlCount }
//#UC START# *15126CA3381C_8E3044782C31_var*
//#UC END# *15126CA3381C_8E3044782C31_var*
begin
//#UC START# *15126CA3381C_8E3044782C31_impl*
 !!! Needs to be implemented !!!
//#UC END# *15126CA3381C_8E3044782C31_impl*
end;//TkwPopControlControlCount.ControlCount

procedure TkwPopControlControlCount.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_8E3044782C31_var*
//#UC END# *4DAEEDE10285_8E3044782C31_var*
begin
//#UC START# *4DAEEDE10285_8E3044782C31_impl*
 !!! Needs to be implemented !!!
//#UC END# *4DAEEDE10285_8E3044782C31_impl*
end;//TkwPopControlControlCount.DoDoIt

class function TkwPopControlControlCount.GetWordNameForRegister: AnsiString;
begin
 Result := 'pop:Control:ControlCount';
end;//TkwPopControlControlCount.GetWordNameForRegister

procedure TkwPopControlControlCount.SetValuePrim(const aValue: TtfwStackValue;
 const aCtx: TtfwContext);
//#UC START# *52D00B00031A_8E3044782C31_var*
//#UC END# *52D00B00031A_8E3044782C31_var*
begin
//#UC START# *52D00B00031A_8E3044782C31_impl*
 !!! Needs to be implemented !!!
//#UC END# *52D00B00031A_8E3044782C31_impl*
end;//TkwPopControlControlCount.SetValuePrim

function TkwPopControlControlCount.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
//#UC START# *551544E2001A_8E3044782C31_var*
//#UC END# *551544E2001A_8E3044782C31_var*
begin
//#UC START# *551544E2001A_8E3044782C31_impl*
 !!! Needs to be implemented !!!
//#UC END# *551544E2001A_8E3044782C31_impl*
end;//TkwPopControlControlCount.GetResultTypeInfo

function TkwPopControlControlCount.GetAllParamsCount(const aCtx: TtfwContext): Integer;
begin
 Result := 1;
end;//TkwPopControlControlCount.GetAllParamsCount

function TkwPopControlControlCount.ParamsTypes: PTypeInfoArray;
//#UC START# *5617F4D00243_8E3044782C31_var*
//#UC END# *5617F4D00243_8E3044782C31_var*
begin
//#UC START# *5617F4D00243_8E3044782C31_impl*
 !!! Needs to be implemented !!!
//#UC END# *5617F4D00243_8E3044782C31_impl*
end;//TkwPopControlControlCount.ParamsTypes

function TkwPopControlHandle.Handle(const aCtx: TtfwContext;
 aControl: TWinControl): Cardinal;
 {* ���������� ����� ������� pop:Control:Handle }
//#UC START# *532C0148B0EB_3CF2D3C5A0DB_var*
//#UC END# *532C0148B0EB_3CF2D3C5A0DB_var*
begin
//#UC START# *532C0148B0EB_3CF2D3C5A0DB_impl*
 !!! Needs to be implemented !!!
//#UC END# *532C0148B0EB_3CF2D3C5A0DB_impl*
end;//TkwPopControlHandle.Handle

procedure TkwPopControlHandle.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_3CF2D3C5A0DB_var*
//#UC END# *4DAEEDE10285_3CF2D3C5A0DB_var*
begin
//#UC START# *4DAEEDE10285_3CF2D3C5A0DB_impl*
 !!! Needs to be implemented !!!
//#UC END# *4DAEEDE10285_3CF2D3C5A0DB_impl*
end;//TkwPopControlHandle.DoDoIt

class function TkwPopControlHandle.GetWordNameForRegister: AnsiString;
begin
 Result := 'pop:Control:Handle';
end;//TkwPopControlHandle.GetWordNameForRegister

procedure TkwPopControlHandle.SetValuePrim(const aValue: TtfwStackValue;
 const aCtx: TtfwContext);
//#UC START# *52D00B00031A_3CF2D3C5A0DB_var*
//#UC END# *52D00B00031A_3CF2D3C5A0DB_var*
begin
//#UC START# *52D00B00031A_3CF2D3C5A0DB_impl*
 !!! Needs to be implemented !!!
//#UC END# *52D00B00031A_3CF2D3C5A0DB_impl*
end;//TkwPopControlHandle.SetValuePrim

function TkwPopControlHandle.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
//#UC START# *551544E2001A_3CF2D3C5A0DB_var*
//#UC END# *551544E2001A_3CF2D3C5A0DB_var*
begin
//#UC START# *551544E2001A_3CF2D3C5A0DB_impl*
 !!! Needs to be implemented !!!
//#UC END# *551544E2001A_3CF2D3C5A0DB_impl*
end;//TkwPopControlHandle.GetResultTypeInfo

function TkwPopControlHandle.GetAllParamsCount(const aCtx: TtfwContext): Integer;
begin
 Result := 1;
end;//TkwPopControlHandle.GetAllParamsCount

function TkwPopControlHandle.ParamsTypes: PTypeInfoArray;
//#UC START# *5617F4D00243_3CF2D3C5A0DB_var*
//#UC END# *5617F4D00243_3CF2D3C5A0DB_var*
begin
//#UC START# *5617F4D00243_3CF2D3C5A0DB_impl*
 !!! Needs to be implemented !!!
//#UC END# *5617F4D00243_3CF2D3C5A0DB_impl*
end;//TkwPopControlHandle.ParamsTypes

function TkwPopControlFocused.Focused(const aCtx: TtfwContext;
 aControl: TWinControl): Boolean;
 {* ���������� ����� ������� pop:Control:Focused }
//#UC START# *5F41D8EA1D19_171FB83EF557_var*
//#UC END# *5F41D8EA1D19_171FB83EF557_var*
begin
//#UC START# *5F41D8EA1D19_171FB83EF557_impl*
 !!! Needs to be implemented !!!
//#UC END# *5F41D8EA1D19_171FB83EF557_impl*
end;//TkwPopControlFocused.Focused

procedure TkwPopControlFocused.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_171FB83EF557_var*
//#UC END# *4DAEEDE10285_171FB83EF557_var*
begin
//#UC START# *4DAEEDE10285_171FB83EF557_impl*
 !!! Needs to be implemented !!!
//#UC END# *4DAEEDE10285_171FB83EF557_impl*
end;//TkwPopControlFocused.DoDoIt

class function TkwPopControlFocused.GetWordNameForRegister: AnsiString;
begin
 Result := 'pop:Control:Focused';
end;//TkwPopControlFocused.GetWordNameForRegister

procedure TkwPopControlFocused.SetValuePrim(const aValue: TtfwStackValue;
 const aCtx: TtfwContext);
//#UC START# *52D00B00031A_171FB83EF557_var*
//#UC END# *52D00B00031A_171FB83EF557_var*
begin
//#UC START# *52D00B00031A_171FB83EF557_impl*
 !!! Needs to be implemented !!!
//#UC END# *52D00B00031A_171FB83EF557_impl*
end;//TkwPopControlFocused.SetValuePrim

function TkwPopControlFocused.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
//#UC START# *551544E2001A_171FB83EF557_var*
//#UC END# *551544E2001A_171FB83EF557_var*
begin
//#UC START# *551544E2001A_171FB83EF557_impl*
 !!! Needs to be implemented !!!
//#UC END# *551544E2001A_171FB83EF557_impl*
end;//TkwPopControlFocused.GetResultTypeInfo

function TkwPopControlFocused.GetAllParamsCount(const aCtx: TtfwContext): Integer;
begin
 Result := 1;
end;//TkwPopControlFocused.GetAllParamsCount

function TkwPopControlFocused.ParamsTypes: PTypeInfoArray;
//#UC START# *5617F4D00243_171FB83EF557_var*
//#UC END# *5617F4D00243_171FB83EF557_var*
begin
//#UC START# *5617F4D00243_171FB83EF557_impl*
 !!! Needs to be implemented !!!
//#UC END# *5617F4D00243_171FB83EF557_impl*
end;//TkwPopControlFocused.ParamsTypes

function TkwPopControlCanFocus.CanFocus(const aCtx: TtfwContext;
 aControl: TWinControl): Boolean;
 {* ���������� ����� ������� pop:Control:CanFocus }
//#UC START# *B0AD1D898340_8BEC198C8027_var*
//#UC END# *B0AD1D898340_8BEC198C8027_var*
begin
//#UC START# *B0AD1D898340_8BEC198C8027_impl*
 !!! Needs to be implemented !!!
//#UC END# *B0AD1D898340_8BEC198C8027_impl*
end;//TkwPopControlCanFocus.CanFocus

procedure TkwPopControlCanFocus.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_8BEC198C8027_var*
//#UC END# *4DAEEDE10285_8BEC198C8027_var*
begin
//#UC START# *4DAEEDE10285_8BEC198C8027_impl*
 !!! Needs to be implemented !!!
//#UC END# *4DAEEDE10285_8BEC198C8027_impl*
end;//TkwPopControlCanFocus.DoDoIt

class function TkwPopControlCanFocus.GetWordNameForRegister: AnsiString;
begin
 Result := 'pop:Control:CanFocus';
end;//TkwPopControlCanFocus.GetWordNameForRegister

procedure TkwPopControlCanFocus.SetValuePrim(const aValue: TtfwStackValue;
 const aCtx: TtfwContext);
//#UC START# *52D00B00031A_8BEC198C8027_var*
//#UC END# *52D00B00031A_8BEC198C8027_var*
begin
//#UC START# *52D00B00031A_8BEC198C8027_impl*
 !!! Needs to be implemented !!!
//#UC END# *52D00B00031A_8BEC198C8027_impl*
end;//TkwPopControlCanFocus.SetValuePrim

function TkwPopControlCanFocus.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
//#UC START# *551544E2001A_8BEC198C8027_var*
//#UC END# *551544E2001A_8BEC198C8027_var*
begin
//#UC START# *551544E2001A_8BEC198C8027_impl*
 !!! Needs to be implemented !!!
//#UC END# *551544E2001A_8BEC198C8027_impl*
end;//TkwPopControlCanFocus.GetResultTypeInfo

function TkwPopControlCanFocus.GetAllParamsCount(const aCtx: TtfwContext): Integer;
begin
 Result := 1;
end;//TkwPopControlCanFocus.GetAllParamsCount

function TkwPopControlCanFocus.ParamsTypes: PTypeInfoArray;
//#UC START# *5617F4D00243_8BEC198C8027_var*
//#UC END# *5617F4D00243_8BEC198C8027_var*
begin
//#UC START# *5617F4D00243_8BEC198C8027_impl*
 !!! Needs to be implemented !!!
//#UC END# *5617F4D00243_8BEC198C8027_impl*
end;//TkwPopControlCanFocus.ParamsTypes

initialization
 TkwPopControlMouseLeftClick.RegisterInEngine;
 {* ����������� pop_Control_MouseLeftClick }
 TkwPopControlMouseMiddleClick.RegisterInEngine;
 {* ����������� pop_Control_MouseMiddleClick }
 TkwPopControlMouseRightClick.RegisterInEngine;
 {* ����������� pop_Control_MouseRightClick }
 TkwPopControlFindControlByName.RegisterInEngine;
 {* ����������� pop_Control_FindControlByName }
 TkwPopControlGetControl.RegisterInEngine;
 {* ����������� pop_Control_GetControl }
 TkwPopControlMouseWheelUp.RegisterInEngine;
 {* ����������� pop_Control_MouseWheelUp }
 TkwPopControlMouseWheelDown.RegisterInEngine;
 {* ����������� pop_Control_MouseWheelDown }
 TkwPopControlSetFocus.RegisterInEngine;
 {* ����������� pop_Control_SetFocus }
 TkwPopControlMouseLeftDragAndDrop.RegisterInEngine;
 {* ����������� pop_Control_MouseLeftDragAndDrop }
 TkwPopControlControlCount.RegisterInEngine;
 {* ����������� pop_Control_ControlCount }
 TkwPopControlHandle.RegisterInEngine;
 {* ����������� pop_Control_Handle }
 TkwPopControlFocused.RegisterInEngine;
 {* ����������� pop_Control_Focused }
 TkwPopControlCanFocus.RegisterInEngine;
 {* ����������� pop_Control_CanFocus }
 TtfwTypeRegistrator.RegisterType(@tfw_tiStruct);
 {* ����������� ���� TtfwContext }
 TtfwTypeRegistrator.RegisterType(TypeInfo(TWinControl));
 {* ����������� ���� TWinControl }
 TtfwTypeRegistrator.RegisterType(@tfw_tiStruct);
 {* ����������� ���� TPoint }
 TtfwTypeRegistrator.RegisterType(@tfw_tiString);
 {* ����������� ���� String }
 TtfwTypeRegistrator.RegisterType(TypeInfo(TComponent));
 {* ����������� ���� TComponent }
 TtfwTypeRegistrator.RegisterType(TypeInfo(Integer));
 {* ����������� ���� Integer }
 TtfwTypeRegistrator.RegisterType(TypeInfo(TControl));
 {* ����������� ���� TControl }
 TtfwTypeRegistrator.RegisterType(TypeInfo(Boolean));
 {* ����������� ���� Boolean }
 TtfwTypeRegistrator.RegisterType(TypeInfo(Cardinal));
 {* ����������� ���� Cardinal }
{$IfEnd} // NOT Defined(NoScripts) AND NOT Defined(NoVCL)

end.
