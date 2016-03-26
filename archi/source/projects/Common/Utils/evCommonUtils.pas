unit evCommonUtils;
 {* ��������� ����� ��� �������� � ����. }

// ������: "w:\archi\source\projects\Common\Utils\evCommonUtils.pas"
// ���������: "UtilityPack"
// ������� ������: "evCommonUtils" MUID: (4F5755FB0362)

{$Include w:\archi\source\projects\Common\arCommon.inc}

interface

uses
 l3IntfUses
 , nevGUIInterfaces
 , evCustomEditor
 , l3Variant
 , nevInternalInterfaces
 , evCustomEditorWindow
 , evCommonTypes
 , nevTools
 , arCommonTypes
 , Classes
 , dt_Types
 , vtLister
 , l3Types
;

type
 TevSetSubParam = record
  rEditor: TevCustomEditor;
  rSubType: TSubType;
  rCodePage: Integer;
  rAutoMode: Boolean;
  rWithConfirm: Boolean;
  rSubNumFormula: AnsiString;
  rUserType: TUserType;
  rCanStylizeBlocks: Boolean;
 end;//TevSetSubParam

 TevSubEditParam = record
  rEditor: TevCustomEditor;
  rSubID: TSubID;
  rUserType: TUserType;
  rCanStylizeBlocks: Boolean;
  rIsDocEditor: Boolean;
  rSubList: TvtDStringLister;
  rFamilyID: TFamilyID;
  rDocID: TDocID;
 end;//TevSubEditParam

 TevSubEditParamEX = record
  rEditor: TevCustomEditor;
  rSubID: TSubID;
  rSubName: Tl3PCharLen;
  rStyleID: Integer;
  rViewKind: Integer;
  rIsDocEditor: Boolean;
  rSubList: TvtDStringLister;
  rFamilyID: TFamilyID;
  rDocID: TDocID;
 end;//TevSubEditParamEX

function cnvDate2Text(var aStr: PAnsiChar;
 var aLength: LongInt;
 aData: Pointer): Boolean;
function evEditPicture(const aHotSpot: IevHotSpot;
 const aEditor: TevCustomEditor;
 var aNeedAsyncLoop: Boolean): Boolean;
function evEditFormula(const aHotSpot: IevHotSpot;
 const aEditor: TevCustomEditor;
 var aNeedAsyncLoop: Boolean): Boolean;
function evIsFormula(const aHotSpot: IevHotSpot;
 out theFormula: Tl3Tag): Boolean;
function evIsPicture(const aHotSpot: IevHotSpot;
 out thePicture: Tl3Tag): Boolean;
procedure evInsertFormula(const aEditor: TevCustomEditor);
procedure evAlignCellsBoundary(const aEditor: TevCustomEditor);
procedure evCopyWidthOfCells(const anEditor: TevCustomEditor);
procedure evApplyWidthOfCells(const anEditor: TevCustomEditor);
procedure evLinkTableFilters(var aGen: Tk2TagGenerator;
 aNeedInit: Boolean);
function evSetTableStyle(const anEditor: TevCustomEditorWindow): Boolean;
 {* ���������� ����� �� �������. }
function evSetSubPrim(const aParam: TevSetSubParam;
 out aChangeDocData: Boolean;
 const aBlock: IevCommonDataObject = nil): Integer;
procedure evSubNameEdit(const aParam: TevSubEditParam;
 out aNeedRefresh: Boolean);
 {* ����� ����� �������������� ����. }
procedure evEditSubPrim(const aParam: TevSubEditParamEX;
 const aSub: IevSub;
 out aNeedRefresh: Boolean;
 const aCheckTypeBlok: IarCheckLeftOrRightBlock = nil);
procedure evSetStyleByName(const anEditor: TevCustomEditorWindow;
 const anItems: TStrings;
 const aText: AnsiString;
 anExpired: Boolean);
procedure evSetExpiredStyle(const anEditor: TevCustomEditorWindow;
 aStyleID: Integer);

{$If Defined(nsTest)}
var g_DisableMergeCellFilter: Boolean = False;
{$IfEnd} // Defined(nsTest)

implementation

uses
 l3ImplUses
 {$If Defined(k2ForEditor)}
 , evTableCellUtils
 {$IfEnd} // Defined(k2ForEditor)
 , DateUtils
 , SysUtils
 , l3DateSt
 , l3Date
 , l3Chars
 , nevBase
 , D_PicSizeEdit
 , evConst
 , evBitmapParaBitmapContainer
 , evFacadeGUI
 , afwInterfaces
 , ObjectSegment_Const
 , BitmapPara_Const
 , k2Tags
 , ExprEditForm
 {$If NOT Defined(NoVCL)}
 , Controls
 {$IfEnd} // NOT Defined(NoVCL)
 , l3Base
 , Formula_Const
 , l3Interfaces
 , evTableTools
 , evCopyTableCellWidth
 , evTabStopsFilter
 , evdEmptyRowFilter
 , evTableFilter
 , evMergedCellFilter
 , evTextInTableCorrector
 , evdStyles
 , evOp
 {$If Defined(k2ForEditor)}
 , evParaTools
 {$IfEnd} // Defined(k2ForEditor)
 , Table_Const
 , evFacadeSelection
 {$If NOT Defined(Nemesis)}
 , vtDialogs
 {$IfEnd} // NOT Defined(Nemesis)
 , evCommonRes
 {$If NOT Defined(NoVCL)}
 , Dialogs
 {$IfEnd} // NOT Defined(NoVCL)
 , evFacadeSub
 , d_edMSub
 , l3String
 , evMsgCode
 , arTextUtils
 , l3SimpleCalc
 , dt_Const
 , evdTypes
 {$If Defined(Archi) AND NOT Defined(Nemesis)}
 , dt_LinkServ
 {$IfEnd} // Defined(Archi) AND NOT Defined(Nemesis)
 , evEditorInterfaces
;

function cnvDate2Text(var aStr: PAnsiChar;
 var aLength: LongInt;
 aData: Pointer): Boolean;
//#UC START# *4F57565E01C1_4F5755FB0362_var*
var
 l_Index    : Integer;
 l_IntValue : Integer;
 l_Str      : string[8];

 procedure lp_GetNumeric;
 begin
  while (l_Index <= aLength) and not (aStr[l_Index] in cc_Digits) do
   Inc(l_Index);
  if (l_Index > aLength) then Abort;
  l_Str := '';
  while (l_Index <= aLength) and (aStr[l_Index] in cc_Digits) do
  begin
   l_Str := l_Str + aStr[l_Index];
   Inc(l_Index);
  end;
  if (l_Index > aLength) then Abort;
 end;

var
 l_ResStr : string[30];
//#UC END# *4F57565E01C1_4F5755FB0362_var*
begin
//#UC START# *4F57565E01C1_4F5755FB0362_impl*
 try
  l_Index := 0;
  lp_GetNumeric;
  l_ResStr := l_Str + ' ';
  lp_GetNumeric;
  l_IntValue := StrToInt(l_Str);
  if l_IntValue > MonthsPerYear then Abort;
  l_ResStr := l_ResStr + GetMonthNameR(l_IntValue) + ' ';
  try
   lp_GetNumeric;
   l_Str := IntToStr(ExpandYear(StrToInt(l_Str)));
   l_ResStr := l_ResStr + l_Str + ' �.';
  except
  end;
  PShortString(aData)^ := ANSILowerCase(l_ResStr);
  aStr := PAnsiChar(aData) + 1;
  aLength := Length(l_ResStr);
 except
  aStr := nil;
 end;
 Result := True;
//#UC END# *4F57565E01C1_4F5755FB0362_impl*
end;//cnvDate2Text

function evEditPicture(const aHotSpot: IevHotSpot;
 const aEditor: TevCustomEditor;
 var aNeedAsyncLoop: Boolean): Boolean;
//#UC START# *4F5756B50357_4F5755FB0362_var*
var
 l_Op         : InevOp;
 l_PSD        : TPicSizeEditDlg;
 l_Cont       : Tl3Variant;
 l_Picture    : Tl3Variant;
 l_BitmapCont : TevBitmapParaBitmapContainer;
//#UC END# *4F5756B50357_4F5755FB0362_var*
begin
//#UC START# *4F5756B50357_4F5755FB0362_impl*
 if evIsPicture(aHotSpot, l_Picture) then
 begin
  aNeedAsyncLoop := False;
  Result := True;
  l_PSD := TPicSizeEditDlg.Create(nil);
  try
   l_PSD.PicWidth  := l_Picture.IntA[k2_tiWidth] * evCmPerInch / evInchMul;
   l_PSD.PicHeight := l_Picture.IntA[k2_tiHeight] * evCmPerInch / evInchMul;
   l_Cont := l_Picture.Attr[k2_tiObject];
   if l_Cont.IsValid then
    try
     l_BitmapCont := (l_Cont.AsObject As TevBitmapParaBitmapContainer);
     l_PSD.PicDPI := l_BitmapCont.DPI;
     with aEditor.TextSource.Document do
      l_PSD.PageWidth := (IntA[k2_tiWidth] - IntA[k2_tiLeftIndent] - IntA[k2_tiRightIndent]) * evCmPerInch / evInchMul;
     l_PSD.FixProportion;
     if (l_PSD.ShowModal = mrOK) then
     begin
      l_Op := aEditor.TextSource.StartOp;
      try
       if l_BitmapCont.DPI <> l_PSD.PicDPI then
       begin
        l_BitmapCont.DPI := l_PSD.PicDPI;
        l_Picture.IntW[k2_tiDPI, l_Op] := l_PSD.PicDPI;
        l_Picture.AttrW[k2_tiWidth, l_Op]  := nil;
        l_Picture.AttrW[k2_tiHeight, l_Op] := nil;
       end//l_Cont.AsObject As TevBitmapParaBitmapContainer).DPI <> l_PSD.PicDPI
       else
       begin
        l_Picture.IntW[k2_tiWidth, l_Op]  := Round(l_PSD.PicWidth * evInchMul / evCmPerInch);
        l_Picture.IntW[k2_tiHeight, l_Op] := Round(l_PSD.PicHeight * evInchMul / evCmPerInch);
       end;//l_Cont.AsObject As TevBitmapParaBitmapContainer).DPI <> l_PSD.PicDPI
       if not evInvalidatePara(l_Picture.AsObject) then
        (aEditor.TextSource.DocumentContainer As IafwStyleTableSpy).StyleTableChanged;
        // - ��� ��� �������� ������ ����������
       l_Op.MarkModified(l_Picture);
      finally
       l_Op := nil;
      end;//try..finally
     end;//l_PSD.ShowModal = mrOK
    finally
     l_Cont := nil;
    end//try..finally
   else
    Result := False;
  finally
   l3Free(l_PSD);
  end;
 end
 else
  Result := False;
//#UC END# *4F5756B50357_4F5755FB0362_impl*
end;//evEditPicture

function evEditFormula(const aHotSpot: IevHotSpot;
 const aEditor: TevCustomEditor;
 var aNeedAsyncLoop: Boolean): Boolean;
//#UC START# *4F5756E10027_4F5755FB0362_var*
var
 l_EE      : TExprEditor;
 l_Answer  : Integer;
 l_Formula : Tl3Variant;
//#UC END# *4F5756E10027_4F5755FB0362_var*
begin
//#UC START# *4F5756E10027_4F5755FB0362_impl*
 if evIsFormula(aHotSpot, l_Formula) then
 begin
  aNeedAsyncLoop := False;
  Result := True;
  l_EE := TExprEditor.Create(aEditor);
  try
   l_EE.Formula := l_Formula.StrA[k2_tiText];
   l_Answer := l_EE.ShowModal;
   if (l_Answer = mrOk) then
   begin
    l_Formula.StrW[k2_tiText, aEditor.TextSource.StartOp] := l_EE.Formula;
    aEditor.Selection.Cursor.MostInner.Obj.Invalidate([nev_spSegments]);
   end;//l_EE.ShowModal = mrOk
  finally
   l3Free(l_EE);
  end;//try..finally
 end//evIsFormula()
 else
  Result := False;
//#UC END# *4F5756E10027_4F5755FB0362_impl*
end;//evEditFormula

function evIsFormula(const aHotSpot: IevHotSpot;
 out theFormula: Tl3Tag): Boolean;
//#UC START# *4F57571402D8_4F5755FB0362_var*
var
 l_Tag : Il3TagRef;
//#UC END# *4F57571402D8_4F5755FB0362_var*
begin
//#UC START# *4F57571402D8_4F5755FB0362_impl*
 Result := false;
 if Supports(aHotSpot, Il3TagRef, l_Tag) then
  try
   if l_Tag.AsObject.IsKindOf(k2_typObjectSegment) then
   begin
    theFormula := l_Tag.AsObject.Child[0];
    Result := theFormula.IsKindOf(k2_typFormula);
   end;//l_Tag.IsKindOf(k2_typObjectSegment)
  finally
   l_Tag := nil;
  end;//try..finally
//#UC END# *4F57571402D8_4F5755FB0362_impl*
end;//evIsFormula

function evIsPicture(const aHotSpot: IevHotSpot;
 out thePicture: Tl3Tag): Boolean;
//#UC START# *4F57573E01FA_4F5755FB0362_var*
var
 l_Tag : Il3TagRef;
//#UC END# *4F57573E01FA_4F5755FB0362_var*
begin
//#UC START# *4F57573E01FA_4F5755FB0362_impl*
 Result := false;
 thePicture := nil;
 if Supports(aHotSpot, Il3TagRef, l_Tag) then
  try
   if l_Tag.AsObject.IsKindOf(k2_typObjectSegment) then
   begin
    thePicture := l_Tag.AsObject.Child[0];
    Result := thePicture.IsKindOf(k2_typBitmapPara);
   end;//l_Tag.IsKindOf(k2_typObjectSegment)
  finally
   l_Tag := nil;
  end;//try..finally
//#UC END# *4F57573E01FA_4F5755FB0362_impl*
end;//evIsPicture

procedure evInsertFormula(const aEditor: TevCustomEditor);
//#UC START# *4F57575F0146_4F5755FB0362_var*
var
 l_EE : TExprEditor;
//#UC END# *4F57575F0146_4F5755FB0362_var*
begin
//#UC START# *4F57575F0146_4F5755FB0362_impl*
 l_EE := TExprEditor.Create(aEditor);
 try
  if (l_EE.ShowModal = mrOk) then
   aEditor.InsertFormula(l_EE.Formula);
 finally
  l3Free(l_EE);
 end;//try..finally
//#UC END# *4F57575F0146_4F5755FB0362_impl*
end;//evInsertFormula

procedure evAlignCellsBoundary(const aEditor: TevCustomEditor);
//#UC START# *4FC712940276_4F5755FB0362_var*
var
 l_Progress : Il3Progress;
//#UC END# *4FC712940276_4F5755FB0362_var*
begin
//#UC START# *4FC712940276_4F5755FB0362_impl*
 Supports(aEditor, Il3Progress, l_Progress);
 try
  InevSelection(aEditor.Selection).Unselect;
  evMakeTableRegular(aEditor.Range, l_Progress);
 finally
  l_Progress := nil;
 end;
//#UC END# *4FC712940276_4F5755FB0362_impl*
end;//evAlignCellsBoundary

procedure evCopyWidthOfCells(const anEditor: TevCustomEditor);
//#UC START# *50926C5802E1_4F5755FB0362_var*
//#UC END# *50926C5802E1_4F5755FB0362_var*
begin
//#UC START# *50926C5802E1_4F5755FB0362_impl*
 InevSelection(anEditor.Selection).Unselect;
 TevCopyTableCellWidth.Instance.RememberWidths(anEditor.Range);
//#UC END# *50926C5802E1_4F5755FB0362_impl*
end;//evCopyWidthOfCells

procedure evApplyWidthOfCells(const anEditor: TevCustomEditor);
//#UC START# *50926CE4004C_4F5755FB0362_var*
var
 l_Progress : Il3Progress;
//#UC END# *50926CE4004C_4F5755FB0362_var*
begin
//#UC START# *50926CE4004C_4F5755FB0362_impl*
 Supports(anEditor, Il3Progress, l_Progress);
 try
  InevSelection(anEditor.Selection).Unselect;
  TevCopyTableCellWidth.Instance.ApplyWidths(anEditor.Range, l_Progress);
 finally
  l_Progress := nil;
 end;
//#UC END# *50926CE4004C_4F5755FB0362_impl*
end;//evApplyWidthOfCells

procedure evLinkTableFilters(var aGen: Tk2TagGenerator;
 aNeedInit: Boolean);
//#UC START# *517F693A03DF_4F5755FB0362_var*
//#UC END# *517F693A03DF_4F5755FB0362_var*
begin
//#UC START# *517F693A03DF_4F5755FB0362_impl*
 if aNeedInit then
  aGen := nil;
 TevdEmptyRowFilter.SetTo(aGen);
 TevTableFilter.SetTo(aGen);
 {$IFDEF nsTest}
 if not g_DisableMergeCellFilter then
 {$ENDIF nsTest}
  TevMergedCellFilter.SetTo(aGen);
 {$IFDEF nsTest}
 g_DisableMergeCellFilter := False;
 {$ENDIF nsTest}
 TevTabStopsFilter.SetTo(aGen);
 TevTextInTableCorrector.SetTo(aGen);
//#UC END# *517F693A03DF_4F5755FB0362_impl*
end;//evLinkTableFilters

function evSetTableStyle(const anEditor: TevCustomEditorWindow): Boolean;
 {* ���������� ����� �� �������. }
//#UC START# *52B44C960040_4F5755FB0362_var*
var
 l_MI     : InevBasePoint;
 l_StyleID: Integer;
//#UC END# *52B44C960040_4F5755FB0362_var*
begin
//#UC START# *52B44C960040_4F5755FB0362_impl*
 Result := False;
 l_MI := anEditor.Selection.Cursor.MostInner;
 if EvIsPointTextInCell(l_MI) then
 begin
  l_MI := l_MI.PointToTypedParent(k2_typTable);
  if EvHasOwnStyle(l_MI.Obj^) then
   l_StyleID := ev_saEmpty
  else
   l_StyleID := ev_saTwoColorTable;
  evSetStyle2Table(l_MI.Obj^.AsObject, anEditor.StartOp(ev_ocUser + 100), l_StyleID);
  Result := True;
 end; // if EvIsPointTextInCell(l_MI) then
//#UC END# *52B44C960040_4F5755FB0362_impl*
end;//evSetTableStyle

function evSetSubPrim(const aParam: TevSetSubParam;
 out aChangeDocData: Boolean;
 const aBlock: IevCommonDataObject = nil): Integer;
//#UC START# *52E78F2D0266_4F5755FB0362_var*
var
 l_BC           : InevCommonPoint;
 l_VK           : TevBlockViewKind; 
 l_Sub          : IevSub;
 lPack          : InevOp;
 lFlags         : Integer;
 lBlock         : IevCommonDataObject;
 l_Block        : IevDocumentPart;
 l_IsAAK        : Boolean;
 lNameStr       : AnsiString;
 l_StyleID      : Integer;
 lNewSubID      : TSubID;
 lFoundStr      : AnsiString;
 lDlgResult     : Word;
 l_ViewKind     : Integer;
 lMoveSubOnly   : Boolean;
 lSaveReadOnly  : Boolean;
 lBlockFromSub  : Boolean;
 l_CheckTypeBlok: IarCheckLeftOrRightBlock;
//#UC END# *52E78F2D0266_4F5755FB0362_var*
begin
//#UC START# *52E78F2D0266_4F5755FB0362_impl*
 aChangeDocData := False;
 lBlockFromSub := False;
 lMoveSubOnly := False;
 Result := mrNo;
 lNewSubID := 0;
 l_IsAAK := False;
 l_ViewKind := -1;
 l_StyleID := 0;
 l_CheckTypeBlok := nil;

 lBlock := aBlock;
 try
  if aParam.rSubType = stBlock then
  begin
   lBlock := nil;
   lBlock := evGetSel(aParam.rEditor).Data;
   if lBlock = nil then
    Exit;
   (*if evCheckInTable(lBlock, CurEditor) then
   begin
    vtMessageDlg(l3CStr(@sidBlockInTableDeny), mtError);
    Exit;
   end;*)
  end;

  l_BC := evMostInnerFromBlock(lBlock, aParam.rEditor);
  if not Supports(l_BC, IevSub, l_Sub) then
   Exit;

  if (l_Sub.ID >= 0) then
   if (aParam.rSubType = stBlock) then
   begin
    lDlgResult := vtMessageDlg(str_sidChangeSubToBlock.AsCStr, mtWarning, mbYesNoCancel);
    case lDlgResult of
     mrYes: lBlockFromSub := True;
     mrNo: ;
     mrCancel: Exit;
    end;
   end
   else
    Exit;

  if lBlockFromSub then
  begin
   lSaveReadOnly := aParam.rEditor.ReadOnly;
   try
    aParam.rEditor.ReadOnly := False;
    lPack := aParam.rEditor.StartOp(ev_msgInsertPara);
    try
     lNewSubID := l_Sub.ID;
     lNameStr := l_Sub.Name.S;
     lFlags := l_Sub.Flags;

     evDeleteSub(aParam.rEditor, l_Sub);

     l_Sub.ID := lNewSubID;
     try
      l_Block := aParam.rEditor.InsertBlock(lNewSubID);
      aParam.rEditor.TextSource.Modified := True;

      l_Block.Name := l3PCharLen(lNameStr);
      l_Block.Flags := lFlags;
     finally
      l_Block := nil;
     end;
    finally
     lPack := nil;
    end;
   finally
    aParam.rEditor.ReadOnly := lSaveReadOnly;
   end;
  end
  else
  begin
   lNameStr := arMakeNameStr(aParam.rEditor, l_BC, aParam.rCodePage);  //������ ���������� lNameStr
   // ���������� ID �� ������ ���������.
   if aParam.rAutoMode and (lBlock <> nil) then
   begin
    lFoundStr := l3Str(evAsString(lBlock, cf_Text));
    lNewSubID := GetNumberFromStr(lFoundStr);
    if Length(aParam.rSubNumFormula) > 0 then
    begin
     try
      lNewSubID := l3Calc(l3PCharLen(aParam.rSubNumFormula), lNewSubID);
     except
     end;
    end;

    if (lNewSubID <= 0) or evGetSubList(aParam.rEditor.TextSource).Sub[lNewSubID].Exists then
     lNewSubID := 0;
   end;
   //

   //if lNewSubID <= 0 then
   // lNewSubID := evGetSubList(aParam.rEditor.TextSource).NewSub.ID;

   if aParam.rWithConfirm then
    with TNewSubDlg.Create(nil) do
     try
      Editor := aParam.rEditor;
      CurSubID := lNewSubID;

      edtSubName.Buffer := l3PCharLen(lNameStr, aParam.rCodePage);

      edtSubName.Modified := False;
      edtSubNum.Modified := False;

      l_IsAAK := (aParam.rSubType = stBlock) and (aParam.rUserType in [utAAK_Cont, utAAK_Doc]);

      if l_IsAAK then
      begin
       if Supports(aParam.rEditor.TextSource.DocumentContainer, IarCheckLeftOrRightBlock, l_CheckTypeBlok) then
       begin
        HasLeftBlock := l_CheckTypeBlok.HasAACBlock(True);
        HasRightBlock := l_CheckTypeBlok.HasAACBlock(False);
        IgnoreRight := aParam.rUserType = utAAK_Cont;
       end; // if Supports(aParam.rEditor.TextSource.DocumentContainer, IarCheckLeftOrRightBlock, l_CheckTypeBlok)
       NeedTypes;
      end; // if l_IsAAK then

      if l_IsAAK or aParam.rCanStylizeBlocks then
       NeedStyles(aParam.rEditor.TextPara.Style.GetStylesForBlock.Items);

      Result := Execute(aParam.rAutoMode);
      if Result in [mrOk, mrAll] then
      begin
       if not NumberIsUniq then
        lMoveSubOnly := True;
       lNewSubID := edtSubNum.AsInteger;

       lNameStr := l3DeleteDoubleSpace(l3Trim(l3ReplaceNonReadable(l3Str(edtSubName.Buffer)), cc_WhiteSpaceExt));
       if l_IsAAK or aParam.rCanStylizeBlocks then
        if cbStyle.ItemIndex > 0 then
         l_StyleID := (cbStyle.Items.Objects[cbStyle.ItemIndex] As Tl3Tag).IntA[k2_tiHandle]
        else
         l_StyleID := 0;
       if l_IsAAK then
        l_ViewKind := cbPosition.ItemIndex;
      end;
     finally
      Free;
     end
   else
    Result := mrOk;

   if not (Result in [mrOk, mrAll]) then
    Exit;

   if lNewSubID <= 0 then
    lNewSubID := evGetSubList(aParam.rEditor.TextSource).NewSub.ID;

   if lNewSubID <= cMaxBlockID then
   begin
    lSaveReadOnly := aParam.rEditor.ReadOnly;
    try
     aParam.rEditor.ReadOnly := False;
     lPack := aParam.rEditor.StartOp(ev_msgInsertPara);
     try
      if aParam.rEditor.TextSource.Modified then
       aChangeDocData := True;

      case aParam.rSubType of
       stSub:
       begin
        l_Sub.ID := lNewSubID;
        l_Sub.SetTo(l_BC.Obj^.AsObject);
       end;
       stBlock:
       begin
        l_Sub := aParam.rEditor.InsertBlock(lNewSubID);
       end;
      end;

      aParam.rEditor.TextSource.Modified := True;

      if (not lMoveSubOnly) then
      begin

       if (Length(lNameStr) > 0) then
       begin
        l_Sub.Name := l3PCharLen(lNameStr, aParam.rCodePage); {edtSubName.Buffer;}
        l_Sub.Flags := l_Sub.Flags or sfExpName;
       end;

       if (l_IsAAK or aParam.rCanStylizeBlocks) and Supports(l_Sub, IevDocumentPart, l_Block) then
       begin
        if (l_StyleID <> 0) or (l_ViewKind > 0) then
        begin
         lPack := aParam.rEditor.StartOp(ev_ocUser + 100);
         try
          if l_StyleID <> 0 then
           EvSetStyle2Block(l_Block.SubInstance.AsObject, lPack, l_StyleID);
          case l_ViewKind of
           0: l_VK := ev_bvkNone;
           1: l_VK := ev_bvkLeft;
           2: l_VK := ev_bvkRight;
          end;
          if l_VK <> ev_bvkNone then
          begin
           l_Block.SubInstance.IntW[k2_tiViewKind, lPack] := Ord(l_VK);
           l_CheckTypeBlok.SetBlockKind(lNewSubID, lNewSubID, l_VK);
          end;
         finally
          lPack := nil;
         end;
        end;
       end;
      end;
     finally
      lPack := nil;
     end;
    finally
     aParam.rEditor.ReadOnly := lSaveReadOnly;
    end;
   end
   else
   begin
    vtMessageDlg(l3CStr(Format('����� ����� %d �� ����� ��������� %d', [lNewSubID, cMaxBlockID])), mtError);
    // ��� ����� �������� ����� �����
   end;
  end;
 finally
  lBlock := nil;
 end;{try..finally}
//#UC END# *52E78F2D0266_4F5755FB0362_impl*
end;//evSetSubPrim

procedure evSubNameEdit(const aParam: TevSubEditParam;
 out aNeedRefresh: Boolean);
 {* ����� ����� �������������� ����. }
//#UC START# *52E8A0960362_4F5755FB0362_var*
var
 I               : Integer;
 l_VK            : TevBlockViewKind;
 l_Sub           : IevSub;
 l_Tag           : Tl3Tag;
 l_Part          : IevDocumentPart;
 l_Param         : TevSubEditParamEX;
 l_SubID         : TSubID;
 l_IsAAK         : Boolean;
 l_IsBlock       : Boolean;
 l_SubName       : Tl3PCharLen;
 l_StyleID       : Integer;
 l_ViewKind      : Integer;
 l_CheckTypeBlock: IarCheckLeftOrRightBlock;

//#UC END# *52E8A0960362_4F5755FB0362_var*
begin
//#UC START# *52E8A0960362_4F5755FB0362_impl*
 with TNewSubDlg.Create(nil) do
  try
   Caption := '��������� �����';

   l_Sub := evGetSubList(aParam.rEditor.TextSource).Sub[aParam.rSubID];
   try
    Editor := aParam.rEditor;
    edtSubName.Buffer := l_Sub.Name;
    CurSubID := aParam.rSubID;
    edtSubName.Modified := False;
    l_CheckTypeBlock := nil;

    l_IsBlock := Supports(l_Sub, IevDocumentPart, l_Part);
    l_IsAAK := (aParam.rUserType in [utAAK_Cont, utAAK_Doc]);

    if l_IsBlock then
    begin
     if l_IsAAK then
     begin
      NeedTypes;
      if Supports(aParam.rEditor.TextSource.DocumentContainer, IarCheckLeftOrRightBlock, l_CheckTypeBlock) then
      begin
       HasLeftBlock := l_CheckTypeBlock.HasAACBlock(True);
       HasRightBlock := l_CheckTypeBlock.HasAACBlock(False);
       IgnoreRight := aParam.rUserType = utAAK_Cont;
      end; // if Supports(aParam.rEditor.TextSource.DocumentContainer, IarCheckLeftOrRightBlock, l_CheckTypeBlock)
      if l_Part.SubInstance.Attr[k2_tiViewKind].IsValid then
      begin
       l_VK := TevBlockViewKind(l_Part.SubInstance.IntA[k2_tiViewKind]);
       case l_VK of
        ev_bvkNone : cbPosition.ItemIndex := 0;
        ev_bvkLeft : cbPosition.ItemIndex := 1;
        ev_bvkRight: cbPosition.ItemIndex := 2;
       end;
      end; // if l_Part.SubInstance.Attr[k2_tiViewKind].IsValid then
     end; // if l_IsAAK then

     if aParam.rCanStylizeBlocks then // ��� ���� � ���
     begin
      NeedStyles(aParam.rEditor.TextPara.Style.GetStylesForBlock.Items);
      if l_Part.SubInstance.Attr[k2_tiStyle].IsValid then
      begin
       l_StyleID := l_Part.SubInstance.IntA[k2_tiStyle];
       for I := 1 to cbStyle.Items.Count - 1 do
       begin
        l_Tag := cbStyle.Items.Objects[I] As Tl3Tag;
        if l_Tag.IntA[k2_tiHandle] = l_StyleID then
        begin
         cbStyle.ItemIndex := I;
         Break;
        end; // if (cbStyle.Items.Objects[I] as Tl3PrimString).StringID = l_StyleID then
       end;
      end; // if l_Part.SubInstance.Attr[k2_tiStyle].IsValid then
     end; // if f_CanStylizeBlocks then // ��� ���� � ���
    end; // if l_IsBlock then

    if (Execute = mrOk) and (edtSubName.Modified or edtSubNum.Modified or (l_IsBlock and aParam.rCanStylizeBlocks)) then
    begin
     if edtSubName.Modified then
      l_SubName := l3PCharLen(l3DeleteDoubleSpace(l3Trim(l3ReplaceNonReadable(l3Str(edtSubName.Buffer)), cc_WhiteSpaceExt)))
     else
      l_SubName := Tl3PCharLen(cc_UnAssignedStr);

     if edtSubNum.Modified then
      l_SubID := edtSubNum.AsInteger
     else
      l_SubID := -1;

     l_StyleID := 0;
     l_ViewKind := -1;

     if l_IsBlock then
     begin
      if aParam.rCanStylizeBlocks and (cbStyle.ItemIndex > 0) then
      begin
       l_Tag := cbStyle.Items.Objects[cbStyle.ItemIndex] As Tl3Tag;
       l_StyleID := l_Tag.IntA[k2_tiHandle];
      end;

      if l_IsAAK then
       l_ViewKind := cbPosition.ItemIndex;
     end; //if l_IsBlock then

     l_Param.rEditor := aParam.rEditor;
     l_Param.rSubID := l_SubID;
     l_Param.rSubName := l_SubName;
     l_Param.rStyleID := l_StyleID;
     l_Param.rViewKind := l_ViewKind;
     l_Param.rIsDocEditor := aParam.rIsDocEditor;
     l_Param.rSubList := aParam.rSubList;
     l_Param.rFamilyID := aParam.rFamilyID;
     l_Param.rDocID := aParam.rDocID;
     evEditSubPrim(l_Param, l_Sub, aNeedRefresh, l_CheckTypeBlock);
    end;
   finally
    l_Sub := nil;
   end;
  finally
   Free;
  end;
//#UC END# *52E8A0960362_4F5755FB0362_impl*
end;//evSubNameEdit

procedure evEditSubPrim(const aParam: TevSubEditParamEX;
 const aSub: IevSub;
 out aNeedRefresh: Boolean;
 const aCheckTypeBlok: IarCheckLeftOrRightBlock = nil);
//#UC START# *52E8A1AD03A9_4F5755FB0362_var*
var
 l_ViewKind  : TevBlockViewKind;
 l_SaveSubID : TSubID;

 procedure lp_NotifyBlockKindChange;
 var
  l_NewSubID : TSubID;
 begin
  if aCheckTypeBlok <> nil then
  begin
   l_NewSubID := aParam.rSubID;
   if l_NewSubID = -1 then
    l_NewSubID := aSub.ID;
   aCheckTypeBlok.SetBlockKind(l_SaveSubID, l_NewSubID, l_ViewKind);
  end; // if aCheckTypeBlok <> nil then
 end;

var
 lPack      : InevOp;
 l_Part     : IevDocumentPart;
 lModify    : Boolean;
 lSaveNAS   : Boolean;
 lItemIndex : Integer;
//#UC END# *52E8A1AD03A9_4F5755FB0362_var*
begin
//#UC START# *52E8A1AD03A9_4F5755FB0362_impl*
 lModify := False;
 l_SaveSubID := aSub.ID;
 aNeedRefresh := False;
 if not aParam.rSubName.EQ(cc_UnAssignedStr) then
 begin
  lModify := True;
  with aSub do
  begin
   Name := aParam.rSubName;
   aParam.rEditor.TextSource.Modified := True;
   if aParam.rSubName.SLen = 0 then
    Flags := Flags and not sfExpName
   else
    Flags := Flags or sfExpName;
  end; // with aSub do
 end; // if not aParam.rSubName.EQ(cc_UnAssignedStr) then

 if aParam.rSubID > -1 then
 begin
  lModify := True;
  {$IFDEF Archi}
  LinkServer(aParam.rFamilyID).SubTbl.ChangeSubID(aParam.rDocID, aSub.ID, aParam.rSubID); // ������� ��-�� ��������� SUBID � ������������
  {$ENDIF Archi}
  aSub.ID := aParam.rSubID;
 end; // if aParam.rSubID > -1 then

 if aParam.rIsDocEditor then
 begin
  lItemIndex := aParam.rSubList.Items.IndexOfData(l_SaveSubID, SizeOf(TSubID), 0);

  if lItemIndex > -1 then
  begin
   if not aParam.rSubName.EQ(cc_UnAssignedStr) then
   begin
    lSaveNAS := aParam.rSubList.Items.NeedAllocStr;
    aParam.rSubList.Items.NeedAllocStr := True;
    try
     aParam.rSubList.Items[lItemIndex] := aParam.rSubName.S;
    finally
     aParam.rSubList.Items.NeedAllocStr := lSaveNAS;
    end;
   end; // if not aSubName.EQ(cc_UnAssignedStr) then
   if aParam.rSubID > -1 then
    aParam.rSubList.Items.DataInt[lItemIndex] := aParam.rSubID;
   aParam.rSubList.InvalidateItem(lItemIndex);
   aNeedRefresh := True;
  end; // if lItemIndex > -1 then
 end; // if aParam.rIsDocEditor then

 if Supports(aSub, IevDocumentPart, l_Part) then
 begin
  lPack := aParam.rEditor.StartOp(ev_ocUser + 100);
  try
   evSetStyle2Block(l_Part.SubInstance.AsObject, lPack, aParam.rStyleID);
   if aParam.rViewKind >= 0 then
   begin
    case aParam.rViewKind of
     0: l_ViewKind := ev_bvkNone;
     1: l_ViewKind := ev_bvkLeft;
     2: l_ViewKind := ev_bvkRight;
    end;
    l_Part.SubInstance.IntW[k2_tiViewKind, lPack] := Ord(l_ViewKind);
    lp_NotifyBlockKindChange;
    aParam.rEditor.TextSource.Modified := True;
   end; // if aViewKind >= 0 then
  finally
   lPack := nil;
  end;
 end; // if Supports(aSub, IevDocumentPart, l_Part) then
//#UC END# *52E8A1AD03A9_4F5755FB0362_impl*
end;//evEditSubPrim

procedure evSetStyleByName(const anEditor: TevCustomEditorWindow;
 const anItems: TStrings;
 const aText: AnsiString;
 anExpired: Boolean);
//#UC START# *5332DB3201C3_4F5755FB0362_var*
var
 l_ID    : Integer;
 l_Tag   : Tl3Tag;
 l_Index : Integer;
//#UC END# *5332DB3201C3_4F5755FB0362_var*
begin
//#UC START# *5332DB3201C3_4F5755FB0362_impl*
 l_Index := anItems.IndexOf(aText);
 if l_Index >= 0 then
 begin
  l_Tag := anItems.Objects[l_Index] As Tl3Tag;
  l_ID := l_Tag.IntA[k2_tiHandle];
  if (l_ID = ev_saTwoColorTable) then
   evSetTableStyle(anEditor)
  else
  if anExpired and (l_ID = ev_saTxtOutOfDate) or (l_ID = ev_saNotApplied) then
   evSetExpiredStyle(anEditor, l_ID)
  else
   anEditor.TextPara.Style.ID := l_ID;
  if not anEditor.View.IsCaretVisible then
   anEditor.ScrollToCursor(anEditor.Selection.Cursor);
 end; // if l_Index >= 0 then
//#UC END# *5332DB3201C3_4F5755FB0362_impl*
end;//evSetStyleByName

procedure evSetExpiredStyle(const anEditor: TevCustomEditorWindow;
 aStyleID: Integer);
//#UC START# *5332E025004C_4F5755FB0362_var*

 function IterFunc(const aLeafParagraph: IedLeafParagraph): Boolean;
 begin
  Result := true;
  with aLeafParagraph.Style do
   if (ID <> ev_saTxtComment) and
      (ID <> ev_saTechComment) and
      (ID <> ev_saVersionInfo) then
    ID := aStyleID;
 end;

//#UC END# *5332E025004C_4F5755FB0362_var*
begin
//#UC START# *5332E025004C_4F5755FB0362_impl*
 if (anEditor <> nil) then
  with anEditor do
   Range.IterateLeafParagraphsF(L2IedRangeIterateLeafParagraphsAction(@IterFunc), TextSource);
//#UC END# *5332E025004C_4F5755FB0362_impl*
end;//evSetExpiredStyle

end.
