unit evFacadeSelection;

// ������: "w:\common\components\gui\Garant\EverestCommon\evFacadeSelection.pas"
// ���������: "UtilityPack"

{$Include evDefine.inc}

interface

uses
 l3IntfUses
 , evCommonTypes
 , nevTools
 , evCustomEditorWindow
 , evMemo
 , nevBase
 , evCustomEditor
 , k2TagGen
;

procedure evAssignSelection(aMemo: TevMemo;
 aPos: Integer;
 aLen: Integer); overload;
function evGetSel(anEditor: TevCustomEditorWindow): TnevIRange;
procedure evAssignSelection(aMemo: TevMemo;
 aPos: Integer;
 const aCurrStr: AnsiString); overload;
function evGetSelString(const aRange: TnevIRange): AnsiString;
function evDeleteBlockEX(const aView: InevView;
 const Container: InevOp;
 const aBlock: InevRange): Boolean;
procedure evSaveBlock(anEditor: TevCustomEditor;
 out aSaveBlock: TnevLocation;
 const aCheckCursor: TnevCursor = nil);
procedure evUnselect(anEditor: TevCustomEditorWindow);
procedure evFreeBlock(var aSaveBlock: TnevLocation);
function evMostInnerFromBlock(const aBlock: IevCommonDataObject;
 anEditor: TevCustomEditor): InevCommonPoint;
function evGetBottomChildBlock(const aBlock: TnevIRange;
 anEditor: TevCustomEditorWindow): InevRange;
procedure evRangeInsertFrom(anEditor: TevCustomEditorWindow;
 aFilter: Tk2TagGenerator);
function evGetMostInnerRange(anEditor: TevCustomEditor): InevTagSelection;
 {* ���������� InevRange ��� ������� ������ ������� ������ }

implementation

uses
 l3ImplUses
 , l3String
 {$If Defined(k2ForEditor)}
 , evParaTools
 {$IfEnd} // Defined(k2ForEditor)
 , SysUtils
 , evRange
 , TableCell_Const
 , evdTypes
 , evOp
 , k2Tags
;

procedure evAssignSelection(aMemo: TevMemo;
 aPos: Integer;
 aLen: Integer);
//#UC START# *5321D4830213_48EEF8240298_var*
var
 l_Block : TnevBlock;
//#UC END# *5321D4830213_48EEF8240298_var*
begin
//#UC START# *5321D4830213_48EEF8240298_impl*
 l_Block := aMemo.Selection.Cursor.MostInner.Obj.SubRange(aMemo.View, aPos, aPos + aLen);
 try
  InevSelection(aMemo.Selection).Select(l_Block, false);
 finally
  l_Block := nil;
 end;
//#UC END# *5321D4830213_48EEF8240298_impl*
end;//evAssignSelection

function evGetSel(anEditor: TevCustomEditorWindow): TnevIRange;
//#UC START# *48EEF86903A7_48EEF8240298_var*
//#UC END# *48EEF86903A7_48EEF8240298_var*
begin
//#UC START# *48EEF86903A7_48EEF8240298_impl*
 Result := InevSelection(anEditor.Selection).GetBlock;
//#UC END# *48EEF86903A7_48EEF8240298_impl*
end;//evGetSel

procedure evAssignSelection(aMemo: TevMemo;
 aPos: Integer;
 const aCurrStr: AnsiString);
//#UC START# *48EEF88901CE_48EEF8240298_var*
var
 l_Len: Integer;
//#UC END# *48EEF88901CE_48EEF8240298_var*
begin
//#UC START# *48EEF88901CE_48EEF8240298_impl*
 if aCurrStr = '' then
  l_Len := 1
 else
  l_Len := Length(aCurrStr);
 EvAssignSelection(aMemo, aPos, l_Len);
//#UC END# *48EEF88901CE_48EEF8240298_impl*
end;//evAssignSelection

function evGetSelString(const aRange: TnevIRange): AnsiString;
//#UC START# *48EEF8A0019A_48EEF8240298_var*
//#UC END# *48EEF8A0019A_48EEF8240298_var*
begin
//#UC START# *48EEF8A0019A_48EEF8240298_impl*
 Result := l3PCharLen2String(evAsString(aRange.Data).AsWStr);
//#UC END# *48EEF8A0019A_48EEF8240298_impl*
end;//evGetSelString

function evDeleteBlockEX(const aView: InevView;
 const Container: InevOp;
 const aBlock: InevRange): Boolean;
//#UC START# *48EEF92400B1_48EEF8240298_var*
var
 l_TmpBlock : InevRange;
//#UC END# *48EEF92400B1_48EEF8240298_var*
begin
//#UC START# *48EEF92400B1_48EEF8240298_impl*
 l_TmpBlock := aBlock.SolidBottomChildBlock(aView).ParentRange;
 l_TmpBlock.Modify.Delete(aView, Container);
 Result := True;
//#UC END# *48EEF92400B1_48EEF8240298_impl*
end;//evDeleteBlockEX

procedure evSaveBlock(anEditor: TevCustomEditor;
 out aSaveBlock: TnevLocation;
 const aCheckCursor: TnevCursor = nil);
//#UC START# *48EEFCF1031C_48EEF8240298_var*
//#UC END# *48EEFCF1031C_48EEF8240298_var*
begin
//#UC START# *48EEFCF1031C_48EEF8240298_impl*
  if anEditor.Selection.FoundBlock <> nil then
   IevRange(anEditor.Selection).AssignSel(anEditor.View, anEditor.Selection.FoundBlock);
  aSaveBlock := anEditor.Selection.SaveBlock(aCheckCursor);
//#UC END# *48EEFCF1031C_48EEF8240298_impl*
end;//evSaveBlock

procedure evUnselect(anEditor: TevCustomEditorWindow);
//#UC START# *48EEFCFD0192_48EEF8240298_var*
//#UC END# *48EEFCFD0192_48EEF8240298_var*
begin
//#UC START# *48EEFCFD0192_48EEF8240298_impl*
 InevSelection(anEditor.Selection).Unselect;
//#UC END# *48EEFCFD0192_48EEF8240298_impl*
end;//evUnselect

procedure evFreeBlock(var aSaveBlock: TnevLocation);
//#UC START# *48EEFD3B00D0_48EEF8240298_var*
//#UC END# *48EEFD3B00D0_48EEF8240298_var*
begin
//#UC START# *48EEFD3B00D0_48EEF8240298_impl*
 aSaveBlock := nil;
//#UC END# *48EEFD3B00D0_48EEF8240298_impl*
end;//evFreeBlock

function evMostInnerFromBlock(const aBlock: IevCommonDataObject;
 anEditor: TevCustomEditor): InevCommonPoint;
//#UC START# *48F2F0CA02E4_48EEF8240298_var*
var
 l_PID   : Integer;
 lStart  : InevCommonPoint;
 lFinish : InevCommonPoint;
 l_Inner : InevCommonPoint;
 l_Parent: InevCommonPoint;
//#UC END# *48F2F0CA02E4_48EEF8240298_var*
begin
//#UC START# *48F2F0CA02E4_48EEF8240298_impl*
 if aBlock = nil then
  if (anEditor.Selection <> nil) and (anEditor.Selection.Cursor <> nil) then
   Result := anEditor.Selection.Cursor.MostInner
  else
   Result := nil
 else // �������� l_Sub �� lBlock
 begin
  (aBlock As InevRange).GetBorderPoints(lStart, lFinish);
  Result := lStart.MostInner;
 end;
 if (Result <> nil) then
 begin
  l_PID := Result.Obj.PID;
  l_Parent := Result.ParentPoint;
  while (Result <> nil) and Result.AsObject.IsKindOf(k2_typTableCell) do
  begin
   Inc(l_PID);
   if l_PID >= l_Parent.AsObject.ChildrenCount then
   begin
    Result := nil;
    Break;
   end // if l_PID >= l_Parent.ChildrenCount then
   else
   begin
    l_Inner := l_Parent.Obj^.AsPara.AsList.Para[l_PID].MakePoint(l_Parent);
    l_Parent.Inner := l_Inner;
    l_Inner.Move(anEditor.View, ev_ocBottomRight);
   end;
   if TevMergeStatus(l_Inner.AsObject.IntA[k2_tiMergeStatus]) = ev_msContinue then
    Continue;
   Result := l_Inner.MostInner;
  end; // while (Result <> nil) and Result.IsKindOf(k2_typTableCell) do
 end; // if (Result <> nil) then
//#UC END# *48F2F0CA02E4_48EEF8240298_impl*
end;//evMostInnerFromBlock

function evGetBottomChildBlock(const aBlock: TnevIRange;
 anEditor: TevCustomEditorWindow): InevRange;
//#UC START# *49B0D2EC01FC_48EEF8240298_var*
//#UC END# *49B0D2EC01FC_48EEF8240298_var*
begin
//#UC START# *49B0D2EC01FC_48EEF8240298_impl*
 Result := aBlock.BottomChildBlock(anEditor.View);
//#UC END# *49B0D2EC01FC_48EEF8240298_impl*
end;//evGetBottomChildBlock

procedure evRangeInsertFrom(anEditor: TevCustomEditorWindow;
 aFilter: Tk2TagGenerator);
//#UC START# *4BEBBCE00119_48EEF8240298_var*
//#UC END# *4BEBBCE00119_48EEF8240298_var*
begin
//#UC START# *4BEBBCE00119_48EEF8240298_impl*
  TedRange.Make(anEditor.View, anEditor.Document.Range, anEditor.TextSource.Processor, anEditor.TextPara).InsertFrom(
    anEditor.TextSource.DocumentContainer.TagReader, aFilter);
 anEditor.TextSource.Modified := true;
//#UC END# *4BEBBCE00119_48EEF8240298_impl*
end;//evRangeInsertFrom

function evGetMostInnerRange(anEditor: TevCustomEditor): InevTagSelection;
 {* ���������� InevRange ��� ������� ������ ������� ������ }
//#UC START# *4C332D2F008B_48EEF8240298_var*
//#UC END# *4C332D2F008B_48EEF8240298_var*
begin
//#UC START# *4C332D2F008B_48EEF8240298_impl*
 Result := anEditor.Selection.Cursor.MostInner.Obj.Range;
//#UC END# *4C332D2F008B_48EEF8240298_impl*
end;//evGetMostInnerRange

end.
