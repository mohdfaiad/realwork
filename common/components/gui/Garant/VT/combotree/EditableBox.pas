unit EditableBox;
 {* ������ ���������� }

// ������: "w:\common\components\gui\Garant\VT\ComboTree\EditableBox.pas"
// ���������: "GuiControl"
// ������� ������: "TEditableBox" MUID: (48315948025E)

{$Include w:\common\components\gui\Garant\VT\vtDefine.inc}

interface

uses
 l3IntfUses
 , DropDownTree
 , Classes
 , ctTypes
 , l3TreeInterfaces
 , l3VCLStrings
 , l3Interfaces
 {$If NOT Defined(NoVCL)}
 , Controls
 {$IfEnd} // NOT Defined(NoVCL)
 , Messages
 {$If NOT Defined(NoVCM)}
 , vcmExternalInterfaces
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCL)}
 , StdCtrls
 {$IfEnd} // NOT Defined(NoVCL)
 //#UC START# *48315948025Eintf_uses*
 //#UC END# *48315948025Eintf_uses*
;

type
 TEditableState = (
  esNone
  , esSemiCompleted
  , esCompleted
  , esWrong
 );//TEditableState

 //#UC START# *48315948025Eci*
 //#UC END# *48315948025Eci*
 //#UC START# *48315948025Ecit*
 //#UC END# *48315948025Ecit*
 TEditableBox = class(TDropDownTree)
  {* ������ ���������� }
  private
   f_OnClear: TNotifyEvent;
   f_AutoWidth: TAutoWidthMode;
   f_ProcessServerTreeNotification: Boolean;
   {$If NOT Defined(DesignTimeLibrary)}
   f_RootNode: Il3SimpleNode;
   {$IfEnd} // NOT Defined(DesignTimeLibrary)
   f_AfterCompletion: TNotifyEvent;
   f_State: TEditableState;
  protected
   {$If NOT Defined(DesignTimeLibrary)}
   f_TempObjectCompleted: Il3SimpleNode;
   {$IfEnd} // NOT Defined(DesignTimeLibrary)
   f_Border: Integer;
   f_NeedDropFiltering: Boolean;
   f_NeedGotoNode: Boolean;
   f_FiltCount: Integer;
   f_NarrowSearch: Boolean;
   f_SaveNode: Il3SimpleNode;
   f_SaveBorder: Integer;
   f_SaveHint: AnsiString;
   f_HintSaved: Boolean;
   f_RestrictHintChanging: Boolean;
    {* ��������� HintChanged }
   f_Items: Tl3Strings;
   f_ItemIndex: Integer;
   f_TreeIsFiltered: Boolean;
    {* ������ ���� ������������� (����� �� ������ ������ ��� Deselect Hidden) }
  private
   procedure CMEnabledChanged(var Msg: TMessage); message CM_ENABLEDCHANGED;
  protected
   function pm_GetFullWidth: Integer;
   procedure pm_SetAutoWidth(aValue: TAutoWidthMode);
   {$If NOT Defined(DesignTimeLibrary)}
   procedure pm_SetRootNode(const aValue: Il3SimpleNode);
   {$IfEnd} // NOT Defined(DesignTimeLibrary)
   procedure pm_SetState(aValue: TEditableState);
   {$If NOT Defined(DesignTimeLibrary)}
   procedure SaveState;
   {$IfEnd} // NOT Defined(DesignTimeLibrary)
   {$If NOT Defined(DesignTimeLibrary)}
   procedure RestoreState;
   {$IfEnd} // NOT Defined(DesignTimeLibrary)
   procedure TriggerClearEvent;
   procedure InternalSetText(const aStr: Il3CString;
    aBorder: Integer = -1);
   {$If NOT Defined(NoVCM)}
   function vcmSetRoot(const aRoot: IvcmNodes): Boolean;
   {$IfEnd} // NOT Defined(NoVCM)
   {$If NOT Defined(DesignTimeLibrary)}
   procedure vcmSetCurrent(const aCurrent: Il3SimpleNode);
   {$IfEnd} // NOT Defined(DesignTimeLibrary)
   {$If NOT Defined(DesignTimeLibrary)}
   procedure SetRoot(const aRoot: Il3SimpleNode);
   {$IfEnd} // NOT Defined(DesignTimeLibrary)
   function IsSimpleTree: Boolean;
   procedure ChangeUnsimpleTree; virtual;
   function AutoWidthStored: Boolean;
    {* ������� ������������, ��� �������� AutoWidth ����������� }
   procedure Cleanup; override;
    {* ������� ������� ����� �������. }
   procedure InitFields; override;
   function QueryInterface(const IID: TGUID;
    out Obj): HResult; override;
   procedure Change; override;
   procedure TriggerCaretXChangedEvent(var Value: Integer;
    var Allow: Boolean); override;
   procedure AdjustWidth; override;
   procedure pm_SetComboStyle(aValue: TComboStyle); override;
   function pm_GetStyle: TComboBoxStyle; override;
   procedure pm_SetStyle(aValue: TComboBoxStyle); override;
   procedure EscapePressed; override;
   procedure RecreateTreeIfNeeded(aValue: TComboStyle); override;
   function pm_GetCurrentNode: Il3SimpleNode; override;
   procedure pm_SetCurrentNode(const aValue: Il3SimpleNode); override;
   procedure TreeChangedNotification; override;
   function pm_GetIsList: Boolean; override;
   function IsReadOnly: Boolean; override;
   {$If Defined(l3HackedVCL) AND NOT Defined(NoVCL) AND NOT Defined(DesignTimeLibrary)}
   function HintChanged(const aHint: AnsiString): Boolean; override;
   {$IfEnd} // Defined(l3HackedVCL) AND NOT Defined(NoVCL) AND NOT Defined(DesignTimeLibrary)
   procedure ClearFields; override;
  public
   function MakeNodesFromItems: Boolean;
   procedure Clear;
   procedure DropDownCompletion;
   {$If NOT Defined(DesignTimeLibrary)}
   function GetFullPath(const aNode: Il3SimpleNode): Il3CString;
   {$IfEnd} // NOT Defined(DesignTimeLibrary)
   constructor Create(AOwner: TComponent); override;
   procedure CustomDoEnter; override;
  protected
   property State: TEditableState
    read f_State
    write pm_SetState;
  public
   property OnClear: TNotifyEvent
    read f_OnClear
    write f_OnClear;
   property FullWidth: Integer
    read pm_GetFullWidth;
    {* ������ ����������� edit-� ��� ����������� ���� ������. }
   property AutoWidth: TAutoWidthMode
    read f_AutoWidth
    write pm_SetAutoWidth
    stored AutoWidthStored;
   property ProcessServerTreeNotification: Boolean
    read f_ProcessServerTreeNotification
    write f_ProcessServerTreeNotification;
   {$If NOT Defined(DesignTimeLibrary)}
   property RootNode: Il3SimpleNode
    read f_RootNode
    write pm_SetRootNode;
   {$IfEnd} // NOT Defined(DesignTimeLibrary)
   property AfterCompletion: TNotifyEvent
    read f_AfterCompletion
    write f_AfterCompletion;
 //#UC START# *48315948025Epubl*
   property ComboStyle;
   property Style stored false;
   property OnKeyPress;
   property ShowRoot;
 //#UC END# *48315948025Epubl*
 end;//TEditableBox

implementation

uses
 l3ImplUses
 , SysUtils
 {$If NOT Defined(NoVCL)}
 , Forms
 {$IfEnd} // NOT Defined(NoVCL)
 , vtOutliner
 , l3SimpleTree
 , l3InternalInterfaces
 , l3ScreenIC
 , l3Base
 , l3String
 , l3Tree_TLB
 , l3ControlsTypes
 , l3Nodes
 , l3MinMax
 , l3Units
 , l3InterfacesMisc
 {$If NOT Defined(NoScripts)}
 , TtfwClassRef_Proxy
 {$IfEnd} // NOT Defined(NoScripts)
 //#UC START# *48315948025Eimpl_uses*
 //#UC END# *48315948025Eimpl_uses*
;

function TEditableBox.pm_GetFullWidth: Integer;
//#UC START# *53F349D30104_48315948025Eget_var*
var
 l_BtnWidth: Integer;
 l_Temp: Integer;
 l_IC: Il3InfoCanvas;
//#UC END# *53F349D30104_48315948025Eget_var*
begin
//#UC START# *53F349D30104_48315948025Eget_impl*
 // �����
 // http://mdp.garant.ru/pages/viewpage.action?pageId=502978335
 if HandleAllocated then
 begin
  Canvas.Canvas.Font := Self.Font;
  Canvas.Canvas.TextWidth('W');
 end;
 // - ��� ���, ����� ������� ������-�� ������� :-( // <hack>
 l_IC := l3CrtIC;
 l_IC.Font.AssignFont(Self.Font);
 // ��������� ������ ������
 if Button.Visible then
  l_BtnWidth := Button.Width
 else
  l_BtnWidth := 0;
 // ������
 with l_IC do
 begin
  l_Temp := Max(TextExtent(Buffer).X,
                TextExtent(l3PCharLen(CEmptyHint)).X);
  l_Temp := Max(l_Temp, TextExtent(l3PCharLen('W')).X);
  Result := LP2DP(l3PointX(l_Temp)).X + l_BtnWidth + 12;
 end;//l_IC
//#UC END# *53F349D30104_48315948025Eget_impl*
end;//TEditableBox.pm_GetFullWidth

procedure TEditableBox.pm_SetAutoWidth(aValue: TAutoWidthMode);
//#UC START# *53F34A490058_48315948025Eset_var*
//#UC END# *53F34A490058_48315948025Eset_var*
begin
//#UC START# *53F34A490058_48315948025Eset_impl*
 if (aValue <> f_AutoWidth) then
  f_AutoWidth := aValue;
//#UC END# *53F34A490058_48315948025Eset_impl*
end;//TEditableBox.pm_SetAutoWidth

{$If NOT Defined(DesignTimeLibrary)}
procedure TEditableBox.pm_SetRootNode(const aValue: Il3SimpleNode);
//#UC START# *53F34AEC0368_48315948025Eset_var*
var
 l_Wake: Il3Wake;
//#UC END# *53F34AEC0368_48315948025Eset_var*
begin
//#UC START# *53F34AEC0368_48315948025Eset_impl*
 if (aValue <> nil) and not aValue.IsSame(f_RootNode) then
 begin
  f_RootNode := aValue;
  SetRoot(aValue);

  DropWidth := Width;
  Tree.Width := DropWidth;
  if Supports(f_RootNode, Il3Wake, l_Wake) then
   l_Wake.Wake;
  DropHeight := EstimateTreeHeight(Tree.GetMinSizeY, Tree.GetMaxSizeY);
  Tree.Height := Dropheight;
  DropHeight := DropHeight + Tree.getBorderSize;

  Dropped := False;
 end;//aValue <> nil
//#UC END# *53F34AEC0368_48315948025Eset_impl*
end;//TEditableBox.pm_SetRootNode
{$IfEnd} // NOT Defined(DesignTimeLibrary)

procedure TEditableBox.pm_SetState(aValue: TEditableState);
//#UC START# *53F34F840161_48315948025Eset_var*
//#UC END# *53F34F840161_48315948025Eset_var*
begin
//#UC START# *53F34F840161_48315948025Eset_impl*
 if (f_State <> aValue) then
 begin
  f_State := aValue;
  Invalidate;
 end;//f_State <> aValue
//#UC END# *53F34F840161_48315948025Eset_impl*
end;//TEditableBox.pm_SetState

{$If NOT Defined(DesignTimeLibrary)}
procedure TEditableBox.SaveState;
//#UC START# *53F3517202BB_48315948025E_var*
//#UC END# *53F3517202BB_48315948025E_var*
begin
//#UC START# *53F3517202BB_48315948025E_impl*
 if not (cmAppNotActive in CurrentMode) then
 begin
  f_SaveNode := f_TempObjectCompleted;
  f_SaveBorder := f_Border;
 end;//not (cmAppNotActive in CurrentMode)
//#UC END# *53F3517202BB_48315948025E_impl*
end;//TEditableBox.SaveState
{$IfEnd} // NOT Defined(DesignTimeLibrary)

{$If NOT Defined(DesignTimeLibrary)}
procedure TEditableBox.RestoreState;
//#UC START# *53F3518A008C_48315948025E_var*
//#UC END# *53F3518A008C_48315948025E_var*
begin
//#UC START# *53F3518A008C_48315948025E_impl*
 if not (cmAppNotActive in CurrentMode) then
 begin
  if (ComboStyle <> ct_cbEdit) and (ComboStyle <> ct_cbDropDownList) then
  begin
   Paras.ParagraphStrings[0] := GetFullPath(f_SaveNode);
   f_TempObjectCompleted := f_SaveNode;
   if (f_SaveNode <> nil) then
    State := esCompleted
   else
    State := esNone;
   f_Border := f_SaveBorder;
   DoSelect(f_Border, TextLen);
   DoMoveCursor(f_Border);
   f_NeedDropFiltering := True;
   f_NeedGotoNode := True;
   Repaint;
  end;//ComboStyle <> cbEdit..
 end;//not (cmAppNotActive in CurrentMode)
//#UC END# *53F3518A008C_48315948025E_impl*
end;//TEditableBox.RestoreState
{$IfEnd} // NOT Defined(DesignTimeLibrary)

procedure TEditableBox.TriggerClearEvent;
//#UC START# *53F351A602B4_48315948025E_var*
//#UC END# *53F351A602B4_48315948025E_var*
begin
//#UC START# *53F351A602B4_48315948025E_impl*
 {$IfNDef DesignTimeLibrary}
 CurrentMode := CurrentMode + [cmClear];
 try
  f_TempObjectCompleted := nil;
  if (ComboStyle <> ct_cbEdit) then
   ProcessTreeSelect(False, False);
 finally
  CurrentMode := CurrentMode - [cmClear];
 end;//try..finally 
 {$EndIf DesignTimeLibrary}
 if Assigned(f_OnClear) then
  f_OnClear(Self);
//#UC END# *53F351A602B4_48315948025E_impl*
end;//TEditableBox.TriggerClearEvent

procedure TEditableBox.InternalSetText(const aStr: Il3CString;
 aBorder: Integer = -1);
//#UC START# *53F351B70032_48315948025E_var*
var
 l_IC: Il3InfoCanvas;                                       
//#UC END# *53F351B70032_48315948025E_var*
begin
//#UC START# *53F351B70032_48315948025E_impl*
 Inc(FRestrictOnTextChange);
 try
  if HandleAllocated then
  begin
   f_RestrictHintChanging := True;
   try
    l_IC := l3CrtIC;
    l_IC.Font.AssignFont(Self.Font);
    if (l_IC.LP2DP(l_IC.TextExtent(l3PCharLen(aStr))).X + Button.Width + 7 > Width) then
    begin
     if not f_HintSaved then
     begin
      f_SaveHint := Hint;
      f_HintSaved := True;
     end;//not f_HintSaved
     Button.Hint := f_SaveHint;
     Hint := l3Str(aStr);
    end//l_IC.LP2DP(l_IC.TextExtent(l3PCharLen(aStr))).X + Button.Width + 7 > Width
    else
    begin
     if f_HintSaved then
     begin
      Hint := f_SaveHint;
      f_HintSaved := False;
     end;//f_HintSaved
     Button.Hint := '';
    end;//l_IC.LP2DP(l_IC.TextExtent(l3PCharLen(aStr))).X + Button.Width + 7 > Width
   finally
    f_RestrictHintChanging := False;
   end;//try..finally 
  end;//HandleAllocated

  Paras.ParagraphStrings[0] := aStr;
  if (aBorder = -1) then
  begin
   // � �������(Readonly) � ������������ ����������� �������� ����� ������
   case ComboStyle of
    ct_cbDropDown{, cbDropDownList}:
     f_Border := TextLen;
    else
     f_Border := 0;
   end;//case ComboStyle
  end//aBorder = -1
  else
   f_Border := aBorder;
  DoMoveCursor(f_Border);
 finally
  Dec(FRestrictOnTextChange);
 end;//try..finally 
//#UC END# *53F351B70032_48315948025E_impl*
end;//TEditableBox.InternalSetText

{$If NOT Defined(NoVCM)}
function TEditableBox.vcmSetRoot(const aRoot: IvcmNodes): Boolean;
//#UC START# *53F351DE025A_48315948025E_var*
//#UC END# *53F351DE025A_48315948025E_var*
begin
//#UC START# *53F351DE025A_48315948025E_impl*
 Result := False;
 if (aRoot <> nil) then
 begin
  if (aRoot.Tree <> nil) then
  begin
   if not l3IEQ(TreeStruct, aRoot.Tree) then
   begin
    ComboStyle := ct_cbDropDownList;
    f_Items.Clear;
    Tree.isShowLines := True;
    TreeStruct := aRoot.Tree;
   end;//not l3IEQ(TreeStruct, aRoot.Tree)
   Result := True;
  end//aRoot.Tree <> nil
  else
  if (aRoot.Count = 1) then
  begin
   ComboStyle := ct_cbDropDownList;
   f_Items.Clear;
   Tree.isShowLines := True;
   {$IfNDef DesignTimeLibrary}
   pm_SetRootNode(aRoot[0]);
   {$EndIf  DesignTimeLibrary}
   Result := True;
  end;//aRoot.Count = 1
 end;//aRoot <> nil
//#UC END# *53F351DE025A_48315948025E_impl*
end;//TEditableBox.vcmSetRoot
{$IfEnd} // NOT Defined(NoVCM)

{$If NOT Defined(DesignTimeLibrary)}
procedure TEditableBox.vcmSetCurrent(const aCurrent: Il3SimpleNode);
//#UC START# *53F352370117_48315948025E_var*
 procedure DoSet;
 begin
  CurrentMode := CurrentMode + [cmVcmExecute];
  try
   CurrentNode := aCurrent;
  finally
   CurrentMode := CurrentMode - [cmVcmExecute];
  end;//try..finally
 end;
//#UC END# *53F352370117_48315948025E_var*
begin
//#UC START# *53F352370117_48315948025E_impl*
 if (f_Items.Count = 0) then
 begin
  if (cmWMSetText in CurrentMode) then
   DoSet
  else
  if (aCurrent = nil) then
   DoSet
  else
  (*if aCurrent.IsSame(aCurrent) then
  // - ����� �� �������� ��������� � OnTest
  // �������� ��� ������ "���������" � http://mdp.garant.ru/pages/viewpage.action?pageId=98337580
   Exit
  else*)
  // - ��� ���� ���������������, �.�. ���������� ������ ��������� ����������
  if not aCurrent.IsSame(CurrentNode) then
   DoSet;
 end;//f_Items.Count = 0
//#UC END# *53F352370117_48315948025E_impl*
end;//TEditableBox.vcmSetCurrent
{$IfEnd} // NOT Defined(DesignTimeLibrary)

{$If NOT Defined(DesignTimeLibrary)}
procedure TEditableBox.SetRoot(const aRoot: Il3SimpleNode);
//#UC START# *53F3527902A3_48315948025E_var*
//#UC END# *53F3527902A3_48315948025E_var*
begin
//#UC START# *53F3527902A3_48315948025E_impl*
 if not Tree.TreeStruct.RootNode.IsSame(aRoot) then
 begin
  DropSessionSettings;
  Tree.SetTreeRoot(aRoot);
  f_TreeIsFiltered := False;
  f_ItemIndex := -1;
 end;//not Tree.TreeStruct.RootNode.IsSame(aRoot)
//#UC END# *53F3527902A3_48315948025E_impl*
end;//TEditableBox.SetRoot
{$IfEnd} // NOT Defined(DesignTimeLibrary)

function TEditableBox.IsSimpleTree: Boolean;
//#UC START# *53F352FD0111_48315948025E_var*
//#UC END# *53F352FD0111_48315948025E_var*
begin
//#UC START# *53F352FD0111_48315948025E_impl*
 Result := (Tree = nil) or Supports(Tree.TreeStruct, Il3Tree);
//#UC END# *53F352FD0111_48315948025E_impl*
end;//TEditableBox.IsSimpleTree

procedure TEditableBox.ChangeUnsimpleTree;
//#UC START# *53F3531702B5_48315948025E_var*
//#UC END# *53F3531702B5_48315948025E_var*
begin
//#UC START# *53F3531702B5_48315948025E_impl*
//#UC END# *53F3531702B5_48315948025E_impl*
end;//TEditableBox.ChangeUnsimpleTree

function TEditableBox.MakeNodesFromItems: Boolean;
//#UC START# *53F3535A02BD_48315948025E_var*
{$IfNDef DesignTimeLibrary}
var
 l_Node: Il3SimpleRootNode;
{$EndIf DesignTimeLibrary}
//#UC END# *53F3535A02BD_48315948025E_var*
begin
//#UC START# *53F3535A02BD_48315948025E_impl*
 Result := False;
 {$IfNDef DesignTimeLibrary}
 if (f_Items.Count > 0) then
 begin
  if Supports(f_Items, Il3SimpleRootNode, l_Node) then
   try
    if not l_Node.IsSame(f_RootNode) then
    begin
     f_RootNode := l_Node;
     Tree.TreeStruct := Tl3SimpleTree.Make(l_Node);
     Tree.ViewOptions := Tree.ViewOptions - [voShowOpenChip];
     Tree.IsShowLines := False
    end;//not l_Node.IsSame(f_RootNode)
   finally
    l_Node := nil;
   end;//try..finally
 end;//f_Items.Count > 0
 {$EndIf DesignTimeLibrary}
//#UC END# *53F3535A02BD_48315948025E_impl*
end;//TEditableBox.MakeNodesFromItems

procedure TEditableBox.Clear;
//#UC START# *53F353780395_48315948025E_var*
//#UC END# *53F353780395_48315948025E_var*
begin
//#UC START# *53F353780395_48315948025E_impl*
 {$IfNDef DesignTimeLibrary}
 CurrentMode := CurrentMode + [cmClear];
 f_TempObjectCompleted := nil;
 if ComboStyle <> ct_cbEdit then
  ProcessTreeSelect(False, False)
 else
  Text := nil;
 CurrentMode := CurrentMode - [cmClear];
 {$EndIf DesignTimeLibrary}
//#UC END# *53F353780395_48315948025E_impl*
end;//TEditableBox.Clear

procedure TEditableBox.DropDownCompletion;
//#UC START# *53F35386025E_48315948025E_var*
var
 l_Str: Il3CString;
 l_CurLen: Integer;

 function FindNode(const aNode: Il3SimpleNode): Boolean;
   {-}
 begin
  Result := (l3CommonPartLen(l3CStr(aNode), l_Str, True) = l_CurLen);
 end;

var
 l_Node: Il3SimpleNode;
 l_NewLen: Integer;
//#UC END# *53F35386025E_48315948025E_var*
begin
//#UC START# *53F35386025E_48315948025E_impl*
 if IsList then
 begin
  l_Str := Text;
  l_CurLen := l3Len(l_Str);
  MakeNodesFromItems;
  l_Node := Tree.TreeStruct.SimpleIterateF(l3L2SNA(@FindNode), imCheckResult);
  if (l_Node <> nil) then
  begin
   l_NewLen := l_Node.Text.SLen;
   if (l_NewLen > l_CurLen) then
   begin
    Inc(FRestrictOnTextChange);
    try
     Text := l3Cat([Text, l3Copy(l3CStr(l_Node), l_CurLen, l_NewLen - l_CurLen)]);
    finally
     Dec(FRestrictOnTextChange);
    end;//try..finally
    DoMoveCursor(l_NewLen);
    DoSelect(l_CurLen, l_NewLen);
    Dropped := True;
    if Assigned(f_AfterCompletion) then
     f_AfterCompletion(Self);
   end//l_NewLen > l_CurLen
   else
    Dropped := False;
  end//l_Node <> nil
  else
   Dropped := False;
 end;//IsList
//#UC END# *53F35386025E_48315948025E_impl*
end;//TEditableBox.DropDownCompletion

{$If NOT Defined(DesignTimeLibrary)}
function TEditableBox.GetFullPath(const aNode: Il3SimpleNode): Il3CString;
//#UC START# *53F353B801E4_48315948025E_var*
 function GetPath(const aNode: Il3SimpleNode): Il3CString;
 begin//GetPath
  Result := nil;
  if (aNode.Parent <> nil) and not aNode.IsSame(RootNode) then
  begin
   Result := GetPath(aNode.Parent);
   if not l3IsNil(Result) then
    Result := l3Cat(Result, '\');
   Result := l3Cat([Result, l3CStr(aNode)]);
  end;
 end;//GetPath
//#UC END# *53F353B801E4_48315948025E_var*
begin
//#UC START# *53F353B801E4_48315948025E_impl*
 if (aNode = nil) then
  Result := nil
 else
 { ���� �������� ������� ���� - ���������� ����� ������ ���� ��� ������� ���� (��� � ��������) }
 if (Tree.ShowRoot) and (aNode.Parent = nil) then
  Result := l3CStr(aNode)
 else
  Result := GetPath(aNode);
//#UC END# *53F353B801E4_48315948025E_impl*
end;//TEditableBox.GetFullPath
{$IfEnd} // NOT Defined(DesignTimeLibrary)

procedure TEditableBox.CMEnabledChanged(var Msg: TMessage);
//#UC START# *53F352C803D9_48315948025E_var*
//#UC END# *53F352C803D9_48315948025E_var*
begin
//#UC START# *53F352C803D9_48315948025E_impl*
 inherited;
 NoCaret := not Enabled or (ComboStyle in ReadOnlyComboStyles);
//#UC END# *53F352C803D9_48315948025E_impl*
end;//TEditableBox.CMEnabledChanged

function TEditableBox.AutoWidthStored: Boolean;
 {* ������� ������������, ��� �������� AutoWidth ����������� }
//#UC START# *53F34A490058Stored_48315948025E_var*
//#UC END# *53F34A490058Stored_48315948025E_var*
begin
//#UC START# *53F34A490058Stored_48315948025E_impl*
 Result := False;
//#UC END# *53F34A490058Stored_48315948025E_impl*
end;//TEditableBox.AutoWidthStored

procedure TEditableBox.Cleanup;
 {* ������� ������� ����� �������. }
//#UC START# *479731C50290_48315948025E_var*
//#UC END# *479731C50290_48315948025E_var*
begin
//#UC START# *479731C50290_48315948025E_impl*
 {$IfNDef DesignTimeLibrary}
 f_TempObjectCompleted := nil;
 {$EndIf DesignTimeLibrary}
 f_SaveNode := nil;
 inherited;
 {$IfNDef DesignTimeLibrary}
 f_RootNode := nil;
 {$EndIf  DesignTimeLibrary}
//#UC END# *479731C50290_48315948025E_impl*
end;//TEditableBox.Cleanup

procedure TEditableBox.InitFields;
//#UC START# *47A042E100E2_48315948025E_var*
//#UC END# *47A042E100E2_48315948025E_var*
begin
//#UC START# *47A042E100E2_48315948025E_impl*
 inherited;
 State := esNone;
 f_Border := 0;
 f_SaveHint := '';
 f_HintSaved := False;
//#UC END# *47A042E100E2_48315948025E_impl*
end;//TEditableBox.InitFields

constructor TEditableBox.Create(AOwner: TComponent);
//#UC START# *47D1602000C6_48315948025E_var*
//#UC END# *47D1602000C6_48315948025E_var*
begin
//#UC START# *47D1602000C6_48315948025E_impl*
 inherited;
 ShowGripper := True;
 SizeableTree := True;
 f_SaveNode := nil;
 f_SaveBorder := 0;
 f_FiltCount := 0;
 f_AutoWidth := awNone;
 f_ItemIndex := -1;
 f_ProcessServerTreeNotification := False;
//#UC END# *47D1602000C6_48315948025E_impl*
end;//TEditableBox.Create

function TEditableBox.QueryInterface(const IID: TGUID;
 out Obj): HResult;
//#UC START# *47D160620295_48315948025E_var*
//#UC END# *47D160620295_48315948025E_var*
begin
//#UC START# *47D160620295_48315948025E_impl*
 {$IfNDef DesignTimeLibrary}
 if IsEqualGUID(Il3SimpleNode, IID) then
 begin
  if (CurrentNode <> nil) then
  begin
   Result := CurrentNode.QueryInterface(IID, Obj);
   Exit;
  end;//CurrentNode <> nil
 end;//IsEqualGUID(Il3SimpleNode, IID)
 if IsEqualGUID(Il3Node, IID) then
 begin
  if (CurrentNode <> nil) then
  begin
   Result := CurrentNode.QueryInterface(IID, Obj);
   Exit;
  end;//CurrentNode <> nil
 end;
 if IsEqualGUID(Il3RootNode, IID) then
 begin
  if (RootNode <> nil) then
  begin
   Result := RootNode.QueryInterface(IID, Obj);
   Exit;
  end;//RootNode <> nil
 end;//IsEqualGUID(Il3RootNode, IID)
 {$EndIf DesignTimeLibrary}
 Result := inherited QueryInterface(IID, Obj);
//#UC END# *47D160620295_48315948025E_impl*
end;//TEditableBox.QueryInterface

procedure TEditableBox.Change;
//#UC START# *482AE42802AE_48315948025E_var*
//#UC END# *482AE42802AE_48315948025E_var*
begin
//#UC START# *482AE42802AE_48315948025E_impl*
 {$IfNDef DesignTimeLibrary}
 (* ������� ���������������� ������� *)
 if IsSimpleTree then
 begin
  f_NeedDropFiltering := False;
  f_NeedGotoNode := False;
 end//IsSimpleTree
 else
  ChangeUnsimpleTree;
 inherited;
 if (TextLen <= 0) then
 //if l3IsNil(Text) then
  TriggerClearEvent;
 {$EndIf DesignTimeLibrary}
//#UC END# *482AE42802AE_48315948025E_impl*
end;//TEditableBox.Change

procedure TEditableBox.TriggerCaretXChangedEvent(var Value: Integer;
 var Allow: Boolean);
//#UC START# *482C0BBD01CF_48315948025E_var*
//#UC END# *482C0BBD01CF_48315948025E_var*
begin
//#UC START# *482C0BBD01CF_48315948025E_impl*
 Allow := (Tree <> nil) and Supports(Tree.TreeStruct, Il3Tree);
//#UC END# *482C0BBD01CF_48315948025E_impl*
end;//TEditableBox.TriggerCaretXChangedEvent

procedure TEditableBox.AdjustWidth;
//#UC START# *4F2AA6F20181_48315948025E_var*
{$IfNDef DesignTimeLibrary}
 function GetMaxWidth(aTree: TvtCustomOutliner): Integer;
 var
  l_MaxWidth: Integer;

  function findWidth(const aNode: Il3Node): Boolean;
  var
   lX: Integer;
  begin//findWidth
   Result := True;
   lX := aTree.GetItemDim(aTree.TreeStruct.GetIndex(aNode)).X;
   if (lX > l_MaxWidth) then
    l_MaxWidth := lX;
  end;//findWidth

 begin
  l_MaxWidth := 0;
  aTree.IterateF(l3L2NA(@findWidth), imOneLevel);
  Result := l_MaxWidth;
 end;

var
 l_Width: Integer;
{$EndIf DesignTimeLibrary}
//#UC END# *4F2AA6F20181_48315948025E_var*
begin
//#UC START# *4F2AA6F20181_48315948025E_impl*
{$IfNDef DesignTimeLibrary}
 if (f_AutoWidth <> awNone) then
 begin
  if (f_AutoWidth = awCurrent) then
  begin
   l_Width := FullWidth;
   if (Width <> l_Width) then
    Width := l_Width
  end;//f_AutoWidth = awCurrent
  if (f_AutoWidth = awMax) then
  begin
   l_Width := GetMaxWidth(Tree) + 10;
    if (l_Width <> Width) then
     Width := l_Width;
  end;//f_AutoWidth = awMax
 end;//f_AutoWidth <> awNone
{$EndIf DesignTimeLibrary}
//#UC END# *4F2AA6F20181_48315948025E_impl*
end;//TEditableBox.AdjustWidth

procedure TEditableBox.pm_SetComboStyle(aValue: TComboStyle);
//#UC START# *53ECCEC9013B_48315948025Eset_var*
//#UC END# *53ECCEC9013B_48315948025Eset_var*
begin
//#UC START# *53ECCEC9013B_48315948025Eset_impl*
 if (aValue <> ComboStyle) then
 begin
  RecreateTreeIfNeeded(aValue);
  InternalSetText(Text); // ? ���� �� ? ��� ���������� ������\�����
 end;//aValue <> ComboStyle
 inherited;
{$IfNDef DesignTimeLibrary}
 FArrowsSelect := True;

 NoCaret := not Enabled or (aValue in ReadOnlyComboStyles);

 Button.Visible := (aValue <> ct_cbEdit) ;

{$EndIf DesignTimeLibrary}
//#UC END# *53ECCEC9013B_48315948025Eset_impl*
end;//TEditableBox.pm_SetComboStyle

function TEditableBox.pm_GetStyle: TComboBoxStyle;
//#UC START# *53ECCF9101EF_48315948025Eget_var*
//#UC END# *53ECCF9101EF_48315948025Eget_var*
begin
//#UC START# *53ECCF9101EF_48315948025Eget_impl*
 if (ComboStyle = ct_cbDropDown) then
  Result := csDropDown
 else
 if (ComboStyle = ct_cbDropDownList) then
  Result := csDropDownList
 else
  Result := csSimple;
//#UC END# *53ECCF9101EF_48315948025Eget_impl*
end;//TEditableBox.pm_GetStyle

procedure TEditableBox.pm_SetStyle(aValue: TComboBoxStyle);
//#UC START# *53ECCF9101EF_48315948025Eset_var*
//#UC END# *53ECCF9101EF_48315948025Eset_var*
begin
//#UC START# *53ECCF9101EF_48315948025Eset_impl*
 if (aValue = csDropDown) then
  ComboStyle := ct_cbDropDown
 else
 if (aValue = csDropDownList) then
  ComboStyle := ct_cbDropDownList
 else
  Assert(False);
//#UC END# *53ECCF9101EF_48315948025Eset_impl*
end;//TEditableBox.pm_SetStyle

procedure TEditableBox.EscapePressed;
//#UC START# *53EDCF6F0223_48315948025E_var*
//#UC END# *53EDCF6F0223_48315948025E_var*
begin
//#UC START# *53EDCF6F0223_48315948025E_impl*
 inherited;
 {$IfNDef DesignTimeLibrary}
 RestoreState;
 {$EndIf  DesignTimeLibrary}
//#UC END# *53EDCF6F0223_48315948025E_impl*
end;//TEditableBox.EscapePressed

procedure TEditableBox.RecreateTreeIfNeeded(aValue: TComboStyle);
//#UC START# *53EE012C0211_48315948025E_var*
//#UC END# *53EE012C0211_48315948025E_var*
begin
//#UC START# *53EE012C0211_48315948025E_impl*
 inherited;
{$IfNDef DesignTimeLibrary}
 if (aValue <> ct_cbEdit) then
 begin
  with Tree do
  begin
   ControlStyle := ControlStyle - [csCaptureMouse];
   Visible := False;
   BorderStyle := bsSingle;
   Align := alNone;
   OnActionElement := ActionElementHandler;
   Font := Self.Font;
   ActionElementMode := l3_amSingleClick;
   OnGetItemImage := GetItemImageHandler;
   isShowLines := True;
  end;//with Tree
  ShowIcons := False;
 end;//aValue <> cbEdit
{$EndIf DesignTimeLibrary}
//#UC END# *53EE012C0211_48315948025E_impl*
end;//TEditableBox.RecreateTreeIfNeeded

function TEditableBox.pm_GetCurrentNode: Il3SimpleNode;
//#UC START# *53EE02C3009D_48315948025Eget_var*
//#UC END# *53EE02C3009D_48315948025Eget_var*
begin
//#UC START# *53EE02C3009D_48315948025Eget_impl*
 Result := inherited pm_GetCurrentNode;
//#UC END# *53EE02C3009D_48315948025Eget_impl*
end;//TEditableBox.pm_GetCurrentNode

procedure TEditableBox.pm_SetCurrentNode(const aValue: Il3SimpleNode);
//#UC START# *53EE02C3009D_48315948025Eset_var*
//#UC END# *53EE02C3009D_48315948025Eset_var*
begin
//#UC START# *53EE02C3009D_48315948025Eset_impl*
 {$IfNDef DesignTimeLibrary}
 if (aValue <> f_TempObjectCompleted) then
 begin
  (*=============================*)
  // http://mdp.garant.ru/pages/viewpage.action?pageId=93264987
  // http://mdp.garant.ru/pages/viewpage.action?pageId=98337580
  if (ComboStyle <> ct_cbEdit) then
   if (aValue <> nil) and not aValue.IsSame(f_TempObjectCompleted) then
   // - ����� ������ �������� - http://mdp.garant.ru/pages/viewpage.action?pageId=120719160
    f_ItemIndex := Tree.GotoOnNode(aValue);
  (*=============================*)
  f_TempObjectCompleted := aValue;
  CurrentMode := CurrentMode + [cmSetCurrent];
  try
   ProcessTreeSelect(False, False);
  finally
   CurrentMode := CurrentMode - [cmSetCurrent];
  end;//try..finally
 end;//aValue <> f_TempObjectCompleted
 {$EndIf DesignTimeLibrary}
 CurrentMode := CurrentMode - [cmWMSetText];
//#UC END# *53EE02C3009D_48315948025Eset_impl*
end;//TEditableBox.pm_SetCurrentNode

procedure TEditableBox.TreeChangedNotification;
//#UC START# *53EE0A3D023F_48315948025E_var*
//#UC END# *53EE0A3D023F_48315948025E_var*
begin
//#UC START# *53EE0A3D023F_48315948025E_impl*
 inherited;
{$IfNDef DesignTimeLibrary}
 if ProcessServerTreeNotification and Assigned(f_TempObjectCompleted) then
  if (Tree.TreeStruct.GetIndex(f_TempObjectCompleted) <> -1) then
   Paras.ParagraphStrings[0] := getFullPath(f_TempObjectCompleted)
  else
  begin
   Dropped := False;
   // ���� ����� ���� ��������� ��� ���� �����
  end;//Tree.TreeStruct.GetIndex(f_TempObjectCompleted) <> -1
 // ������ ���������� ����� �������� ���������� �������:
 if (f_TempObjectCompleted <> nil)  and
   not f_TempObjectCompleted.IsSame(Tree.GetCurrentNode) then
  ActionElementHandler(Tree, Tree.Current);
{$EndIf DesignTimeLibrary}
//#UC END# *53EE0A3D023F_48315948025E_impl*
end;//TEditableBox.TreeChangedNotification

function TEditableBox.pm_GetIsList: Boolean;
//#UC START# *53F1D483009C_48315948025Eget_var*
//#UC END# *53F1D483009C_48315948025Eget_var*
begin
//#UC START# *53F1D483009C_48315948025Eget_impl*
 Result := (f_Items.Count > 0); 
//#UC END# *53F1D483009C_48315948025Eget_impl*
end;//TEditableBox.pm_GetIsList

procedure TEditableBox.CustomDoEnter;
//#UC START# *53F1DB47024C_48315948025E_var*
//#UC END# *53F1DB47024C_48315948025E_var*
begin
//#UC START# *53F1DB47024C_48315948025E_impl*
 inherited;
 {$IfNDef DesignTimeLibrary}
 if ComboStyle <> ct_cbEdit then
  SaveState;
 {$EndIf  DesignTimeLibrary} 
//#UC END# *53F1DB47024C_48315948025E_impl*
end;//TEditableBox.CustomDoEnter

function TEditableBox.IsReadOnly: Boolean;
//#UC START# *53F34C2A025E_48315948025E_var*
//#UC END# *53F34C2A025E_48315948025E_var*
begin
//#UC START# *53F34C2A025E_48315948025E_impl*
 Result := (ComboStyle in ReadOnlyComboStyles) or not Enabled or
           inherited IsReadOnly;
//#UC END# *53F34C2A025E_48315948025E_impl*
end;//TEditableBox.IsReadOnly

{$If Defined(l3HackedVCL) AND NOT Defined(NoVCL) AND NOT Defined(DesignTimeLibrary)}
function TEditableBox.HintChanged(const aHint: AnsiString): Boolean;
//#UC START# *53F34DE200C9_48315948025E_var*
//#UC END# *53F34DE200C9_48315948025E_var*
begin
//#UC START# *53F34DE200C9_48315948025E_impl*
{$IfNDef DesignTimeLibrary}
{$IfDef l3HackedVCL}
 Result := True;
 if f_HintSaved and not f_RestrictHintChanging then
 begin
  f_SaveHint := aHint;
  Result := False;
 end;//f_HintSaved
 Exit;
{$EndIf l3HackedVCL}
{$EndIf DesignTimeLibrary}
 Result := inherited HintChanged(aHint);
//#UC END# *53F34DE200C9_48315948025E_impl*
end;//TEditableBox.HintChanged
{$IfEnd} // Defined(l3HackedVCL) AND NOT Defined(NoVCL) AND NOT Defined(DesignTimeLibrary)

procedure TEditableBox.ClearFields;
begin
{$If NOT Defined(DesignTimeLibrary)}
 RootNode := nil;
{$IfEnd} // NOT Defined(DesignTimeLibrary)
 inherited;
end;//TEditableBox.ClearFields

//#UC START# *48315948025Eimpl*
//#UC END# *48315948025Eimpl*

initialization
{$If NOT Defined(NoScripts)}
 TtfwClassRef.Register(TEditableBox);
 {* ����������� TEditableBox }
{$IfEnd} // NOT Defined(NoScripts)

end.
