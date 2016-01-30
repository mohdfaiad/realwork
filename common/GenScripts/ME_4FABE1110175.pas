unit kwPopEditorCursorCoordsToScreen;

// ������: "w:\common\components\rtl\Garant\ScriptEngine\kwPopEditorCursorCoordsToScreen.pas"
// ���������: "ScriptKeyword"

{$Include seDefine.inc}

interface

{$If NOT Defined(NoScripts)}
uses
 l3IntfUses
 , kwParaCoordsToScreen
 , evCustomEditorWindow
 , l3Units
 , nevTools
 , tfwScriptingInterfaces
 , nevControl
;

type
 TkwPopEditorCursorCoordsToScreen = {final} class(TkwParaCoordsToScreen)
  private
   f_Editor: TevCustomEditorWindow;
  protected
   procedure Cleanup; override;
    {* ������� ������� ����� �������. }
   function GetPoint(const aMap: InevMap): Tl3Point; override;
    {* ���������� �����, �� ������� ����� ������������������. }
   class function GetWordNameForRegister: AnsiString; override;
   procedure DoWithEditor(const aCtx: TtfwContext;
    anEditor: TevCustomEditorWindow); override;
 end;//TkwPopEditorCursorCoordsToScreen
{$IfEnd} // NOT Defined(NoScripts)

implementation

{$If NOT Defined(NoScripts)}
uses
 l3ImplUses
;

type
 TnevControlFriend = {abstract} class(TnevControl)
  {* ���� ��� TnevControl }
 end;//TnevControlFriend

procedure TkwPopEditorCursorCoordsToScreen.Cleanup;
 {* ������� ������� ����� �������. }
//#UC START# *479731C50290_4FABE1110175_var*
//#UC END# *479731C50290_4FABE1110175_var*
begin
//#UC START# *479731C50290_4FABE1110175_impl*
 f_Editor := nil;
 inherited;
//#UC END# *479731C50290_4FABE1110175_impl*
end;//TkwPopEditorCursorCoordsToScreen.Cleanup

function TkwPopEditorCursorCoordsToScreen.GetPoint(const aMap: InevMap): Tl3Point;
 {* ���������� �����, �� ������� ����� ������������������. }
//#UC START# *4C3C927B027E_4FABE1110175_var*
var
 l_DeltaX: Integer;
 l_DeltaY: Integer;
//#UC END# *4C3C927B027E_4FABE1110175_var*
begin
//#UC START# *4C3C927B027E_4FABE1110175_impl*
 l_DeltaX := f_Point.DeltaX(f_Editor.View, f_Editor.View.RootMap);
 l_DeltaY := f_Point.MostInner.AsLeaf.PaintOffsetY(f_Editor.View, aMap.FI);
 Result := l3Point(l_DeltaX, aMap.Bounds.Top + l_DeltaY);
//#UC END# *4C3C927B027E_4FABE1110175_impl*
end;//TkwPopEditorCursorCoordsToScreen.GetPoint

class function TkwPopEditorCursorCoordsToScreen.GetWordNameForRegister: AnsiString;
begin
 Result := 'pop:editor:CursorCoordsToScreen';
end;//TkwPopEditorCursorCoordsToScreen.GetWordNameForRegister

procedure TkwPopEditorCursorCoordsToScreen.DoWithEditor(const aCtx: TtfwContext;
 anEditor: TevCustomEditorWindow);
//#UC START# *4F4CB81200CA_4FABE1110175_var*
var
 l_l3Pt: Tl3Point;
 l_EditorCorner: TPoint;
//#UC END# *4F4CB81200CA_4FABE1110175_var*
begin
//#UC START# *4F4CB81200CA_4FABE1110175_impl*
 f_Editor := anEditor;
 
 f_Point := f_Editor.Selection.Cursor.ClonePoint(f_Editor.View);
 try
  l_EditorCorner := f_Editor.ClientToScreen(Point(0, 0));
 
  l_l3Pt := TranslatePara2Point(f_Editor);
  with TPoint(TnevControlFriend(f_Editor).LP2DP(l_l3Pt)) do
  begin
   aCtx.rEngine.PushInt(l_EditorCorner.X + X);
   aCtx.rEngine.PushInt(l_EditorCorner.Y + Y);
  end;
 finally
  f_Point := nil;
 end;
//#UC END# *4F4CB81200CA_4FABE1110175_impl*
end;//TkwPopEditorCursorCoordsToScreen.DoWithEditor

initialization
 TkwPopEditorCursorCoordsToScreen.RegisterInEngine;
 {* ����������� pop_editor_CursorCoordsToScreen }
{$IfEnd} // NOT Defined(NoScripts)

end.
