unit evSimpleTextPainter;
 {* ����� ��� ��������� ����� ������. ��� ������� �� ������. � ��� �������������� ������ � �������������. ��� ������� ������ [$91848978]. }

// ������: "w:\common\components\gui\Garant\Everest\evSimpleTextPainter.pas"
// ���������: "SimpleClass"
// ������� ������: "TevSimpleTextPainter" MUID: (4836C450038D)

{$Include w:\common\components\gui\Garant\Everest\evDefine.inc}

interface

uses
 l3IntfUses
 , evCustomTextFormatter
 , k2Base
 , k2DocumentGenerator
 , l3Variant
;

type
 TevSimpleTextPainter = class(TevCustomTextFormatter)
  {* ����� ��� ��������� ����� ������. ��� ������� �� ������. � ��� �������������� ������ � �������������. ��� ������� ������ [$91848978]. }
  private
   f_InCell: Integer;
   f_OldNSRC: Integer;
    {* ����� ������� � ������ ������� NSRC }
   f_TableType: Tk2Type;
    {* ��� ������� }
   f_Zoom: Integer;
    {* ������� }
   f_WasSoftEnter: Boolean;
  private
   function NeedTranslateToNext(const anAtom: Tk2StackAtom): Boolean;
  protected
   function OpenTableIfNeeded: Boolean;
   procedure Cleanup; override;
    {* ������� ������� ����� �������. }
   procedure DoStartAtom(var Atom: Tk2StackAtom); override;
   procedure DoFinishAtom(var anAtom: Tk2StackAtom); override;
   function DoBeforeFinishAtom(var Atom: Tk2StackAtom): Boolean; override;
   procedure DoAddAtom(const Atom: Tk2StackAtom;
    Prop: Integer;
    aSource: Tl3Variant); override;
   procedure AddAtom(AtomIndex: Integer;
    aValue: Tl3Variant); override;
   procedure StartChild(TypeID: Tl3Type); override;
   procedure StartTag(TagID: Integer); override;
   procedure CloseStructure(NeedUndo: Boolean); override;
    {* ���������� �� ������������� "������". ��� ���������� � ��������. }
   function NeedAddSpaces: Boolean; override;
 end;//TevSimpleTextPainter

implementation

uses
 l3ImplUses
 , k2Tags
 , TextPara_Const
 , Document_Const
 , ObjectSegment_Const
 , TableCell_Const
 , Table_Const
 {$If Defined(k2ForEditor)}
 , evParaTools
 {$IfEnd} // Defined(k2ForEditor)
 , k2Facade
 , l3CustomString
 , evNSRCConst
 , l3String
 , l3Chars
 , SBS_Const
 , k2Interfaces
 //#UC START# *4836C450038Dimpl_uses*
 //#UC END# *4836C450038Dimpl_uses*
;

function TevSimpleTextPainter.OpenTableIfNeeded: Boolean;
//#UC START# *4AFAD5860039_4836C450038D_var*
var
 l_TableType : Tk2Type;
//#UC END# *4AFAD5860039_4836C450038D_var*
begin
//#UC START# *4AFAD5860039_4836C450038D_impl*
 Result := (f_TableType <> nil);
 if Result then
 begin
  l_TableType := f_TableType;
  f_TableType := nil;
  inherited StartChild(l_TableType);
  if (f_Zoom <> 0) then
  begin
   Generator.AddIntegerAtom(k2_tiZoom, f_Zoom);
   f_Zoom := 0;
  end;//f_Zoom <> 0
 end;//Result
//#UC END# *4AFAD5860039_4836C450038D_impl*
end;//TevSimpleTextPainter.OpenTableIfNeeded

function TevSimpleTextPainter.NeedTranslateToNext(const anAtom: Tk2StackAtom): Boolean;
//#UC START# *4836E100028A_4836C450038D_var*
//#UC END# *4836E100028A_4836C450038D_var*
begin
//#UC START# *4836E100028A_4836C450038D_impl*
 if anAtom.IsKindOf(k2_typTextPara) then
 begin
  with anAtom do
   if ((Parent = nil) OR not Parent.IsKindOf(k2_typObjectSegment)) then
    Result := false
   else
    Result := true; 
 end
 else
  Result := true;
//#UC END# *4836E100028A_4836C450038D_impl*
end;//TevSimpleTextPainter.NeedTranslateToNext

procedure TevSimpleTextPainter.Cleanup;
 {* ������� ������� ����� �������. }
//#UC START# *479731C50290_4836C450038D_var*
//#UC END# *479731C50290_4836C450038D_var*
begin
//#UC START# *479731C50290_4836C450038D_impl*
 f_WasSoftEnter := false;
 f_InCell := 0;
 f_OldNSRC := 0;
 f_TableType := nil;
 f_Zoom := 0;
 inherited;
//#UC END# *479731C50290_4836C450038D_impl*
end;//TevSimpleTextPainter.Cleanup

procedure TevSimpleTextPainter.DoStartAtom(var Atom: Tk2StackAtom);
//#UC START# *4836B39C025E_4836C450038D_var*
//#UC END# *4836B39C025E_4836C450038D_var*
begin
//#UC START# *4836B39C025E_4836C450038D_impl*
 if (f_OldNSRC > 0) then
  inherited
 else
 begin
  if Atom.IsKindOf(k2_typTableCell) then
   Inc(f_InCell);
  if not f_InTextPara then
  begin
   if Atom.IsKindOf(k2_typDocument) then
   begin
    f_SectionWidth := CharsInLine;
    f_InCell := 0;
   end
   else
    f_InTextPara := not NeedTranslateToNext(Atom);
   if not f_InTextPara then
   begin
    if Atom.IsChild then
     Generator.StartChild(Atom.TagType)
    else
     Generator.StartTag(Atom.TagID);
   end;//not f_InTextPara
  end;//not f_InTextPara
 end;//f_OldNSRC
//#UC END# *4836B39C025E_4836C450038D_impl*
end;//TevSimpleTextPainter.DoStartAtom

procedure TevSimpleTextPainter.DoFinishAtom(var anAtom: Tk2StackAtom);
//#UC START# *4836B3A70291_4836C450038D_var*
//#UC END# *4836B3A70291_4836C450038D_var*
begin
//#UC START# *4836B3A70291_4836C450038D_impl*
 if (f_OldNSRC > 0) then
  inherited
 else
 begin
  if anAtom.IsKindOf(k2_typTableCell) then
   Dec(f_InCell);
  if not f_InTextPara AND NeedTranslateToNext(anAtom) then
   Generator.Finish;
 end;//f_OldNSRC
 if anAtom.IsKindOf(k2_typTextPara) then
  f_WasSoftEnter := false;
//#UC END# *4836B3A70291_4836C450038D_impl*
end;//TevSimpleTextPainter.DoFinishAtom

function TevSimpleTextPainter.DoBeforeFinishAtom(var Atom: Tk2StackAtom): Boolean;
//#UC START# *4836B3B80074_4836C450038D_var*
//#UC END# *4836B3B80074_4836C450038D_var*
begin
//#UC START# *4836B3B80074_4836C450038D_impl*
 if (f_OldNSRC > 0) then
  Result := inherited DoBeforeFinishAtom(Atom)
 else
 begin
  Result := NeedTranslateToNext(Atom);
  if not Result then
   DoFinishTextPara(Atom);
 end;//f_OldNSRC
//#UC END# *4836B3B80074_4836C450038D_impl*
end;//TevSimpleTextPainter.DoBeforeFinishAtom

procedure TevSimpleTextPainter.DoAddAtom(const Atom: Tk2StackAtom;
 Prop: Integer;
 aSource: Tl3Variant);
//#UC START# *4836B3DB01C9_4836C450038D_var*
//#UC END# *4836B3DB01C9_4836C450038D_var*
begin
//#UC START# *4836B3DB01C9_4836C450038D_impl*
 if (f_OldNSRC > 0) then
  inherited
 else
 if not f_InTextPara then
  Generator.AddAtom(Prop, aSource);
//#UC END# *4836B3DB01C9_4836C450038D_impl*
end;//TevSimpleTextPainter.DoAddAtom

procedure TevSimpleTextPainter.AddAtom(AtomIndex: Integer;
 aValue: Tl3Variant);
//#UC START# *4836D26F0055_4836C450038D_var*
var
 l_Text : Tl3CustomString;
//#UC END# *4836D26F0055_4836C450038D_var*
begin
//#UC START# *4836D26F0055_4836C450038D_impl*
 if (f_OldNSRC > 0) then
  inherited
 else
 begin
  if (AtomIndex = k2_tiOldNSRC) then
  begin
   if  (f_TableType <> nil) then
   begin
(*    Case TK of
     k2_tkObject :
     begin*)
      {$IFNDEF evOldNSRCTableOff}
      if (aValue.AsLong <> 0) then
       Inc(f_OldNSRC);
      {$ENDIF evOldNSRCTableOff}
(*     end;//k2_tkObject
     else
     begin
      Assert(TK in [k2_tkInteger, k2_tkBool]);
      {$IFNDEF evOldNSRCTableOff}
      if (Integer(Value) <> 0) then
       Inc(f_OldNSRC);
      {$ENDIF evOldNSRCTableOff}
     end;//else
    end;//Case TK of*)
    if (f_OldNSRC > 0) then
     OpenTableIfNeeded;
   end;//f_TableType <> nil
  end//AtomIndex = k2_tiOldNSRC
  else
  if (AtomIndex = k2_tiZoom) then
  begin
   if (f_TableType <> nil) then
   begin
(*    Case TK of
     k2_tkObject :*)
      f_Zoom := aValue.AsLong;
(*     else
     begin
      Assert(TK = k2_tkInteger);
      f_Zoom := Integer(Value);
     end;//else
    end;//Case TK of*)
   end;//f_TableType <> nil
  end//(AtomIndex = k2_tiZoom)
  else
  begin
   OpenTableIfNeeded;
   // - ����� ������ ���� ��������� ���������� �������
   if (AtomIndex = k2_tiData) then
   begin
   // - ����� �������� ������������ ������
    inherited;
    Exit;
   end//AtomIndex = k2_tiData
   else
   if (AtomIndex = k2_tiText) then
   begin
    if not (f_OldNSRC > 0)
       //AND (f_InCell > 0)
       then
    begin
//     Assert(TK = k2_tkObject);
     l_Text := aValue As Tl3CustomString;
     f_WasSoftEnter := l3HasChar(cc_SoftEnter, l_Text.AsWStr);
     if f_WasSoftEnter then
      l3Replace(l_Text.AsWStr, [cc_SoftEnter], ev_NSRCSoftEnter);
    end;//not f_OldNSRC AND (f_InCell > 0)
   end;//AtomIndex = k2_tiText
   if not f_InTextPara then
    Generator.AddAtom(AtomIndex, aValue)
   else
    AddAtomToDocument(AtomIndex, aValue);
  end;//AtomIndex = k2_tiOldNSRC
 end;//f_OldNSRC
//#UC END# *4836D26F0055_4836C450038D_impl*
end;//TevSimpleTextPainter.AddAtom

procedure TevSimpleTextPainter.StartChild(TypeID: Tl3Type);
//#UC START# *4836D4650177_4836C450038D_var*
//#UC END# *4836D4650177_4836C450038D_var*
begin
//#UC START# *4836D4650177_4836C450038D_impl*
 OpenTableIfNeeded;
 if TypeID.IsKindOf(k2_typTable) AND
    not TypeID.IsKindOf(k2_typSBS) then
 begin
  if not (f_OldNSRC > 0) then
  begin
   Assert(f_TableType = nil);
   f_TableType := Tk2TYpe(TypeID);
   Exit;
  end;//not (f_OldNSRC > 0)
 end;//k2.TypeTable[TypeID].IsKindOf(k2_typTable)
 inherited;
//#UC END# *4836D4650177_4836C450038D_impl*
end;//TevSimpleTextPainter.StartChild

procedure TevSimpleTextPainter.StartTag(TagID: Integer);
//#UC START# *4836D477022A_4836C450038D_var*
//#UC END# *4836D477022A_4836C450038D_var*
begin
//#UC START# *4836D477022A_4836C450038D_impl*
 OpenTableIfNeeded;
 inherited;
//#UC END# *4836D477022A_4836C450038D_impl*
end;//TevSimpleTextPainter.StartTag

procedure TevSimpleTextPainter.CloseStructure(NeedUndo: Boolean);
 {* ���������� �� ������������� "������". ��� ���������� � ��������. }
//#UC START# *4836D4C20059_4836C450038D_var*
var
 l_C : PevStackAtom;
 l_ClearOldNSRC : Boolean;
//#UC END# *4836D4C20059_4836C450038D_var*
begin
//#UC START# *4836D4C20059_4836C450038D_impl*
 l_ClearOldNSRC := false;
 if (f_OldNSRC > 0) then
 begin
  l_C := Tags.Top;
  if (l_C <> nil) then
   if l_C.IsKindOf(k2_typTable) then
//    if not evInPara(l_C.Parent.Box, k2_idTable) then
    if not evInPara(l_C.Parent.Box, k2_typTableCell) then
    // - ��������� �� ��������� �� ��� �������
     l_ClearOldNSRC := true;
 end;//f_OldNSRC
 if not (f_OldNSRC > 0) AND (f_TableType <> nil) then
 // - �������� ��� ������� ��� ����� ��� � http://mdp.garant.ru/pages/viewpage.action?pageId=224135562
 begin
  Assert(f_InCell = 0);
  f_TableType := nil;
  if (CurrentStartLevel = OpenStreamLevel) then
   Inc(f_Starts);
   // - ��� ���, �� ����� ������ �� ������ ������� � ������ ���������
  Exit;
 end;//not f_OldNSRC AND (f_TableType <> nil)
 inherited;
 if (f_OldNSRC > 0) AND l_ClearOldNSRC then
 begin
  PrevTable := nil;
  Dec(f_OldNSRC);
 end;//f_OldNSRC
//#UC END# *4836D4C20059_4836C450038D_impl*
end;//TevSimpleTextPainter.CloseStructure

function TevSimpleTextPainter.NeedAddSpaces: Boolean;
//#UC START# *4A116B45039B_4836C450038D_var*
//#UC END# *4A116B45039B_4836C450038D_var*
begin
//#UC START# *4A116B45039B_4836C450038D_impl*
 {$IfDef evOutDecorToNSRC}
 if (f_OldNSRC > 0) then
  Result := inherited NeedAddSpaces
 else
  Result := false;
 {$Else  evOutDecorToNSRC}
 if (f_OldNSRC > 0) then
  Result := inherited NeedAddSpaces
 else
  Result := (f_InCell = 0) AND not f_WasSoftEnter;
 {$EndIf evOutDecorToNSRC}
//#UC END# *4A116B45039B_4836C450038D_impl*
end;//TevSimpleTextPainter.NeedAddSpaces

end.
