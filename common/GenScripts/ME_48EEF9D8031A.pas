unit evFacadeGUI;

// ������: "w:\common\components\gui\Garant\EverestCommon\evFacadeGUI.pas"
// ���������: "UtilityPack"

{$Include evDefine.inc}

interface

uses
 l3IntfUses
 , Types
 , l3Variant
 , evCommonTypes
 , evCustomEditorWindow
 , evCustomTextSource
 , evCustomEditor
;

function evInvalidatePara(aPara: Tl3Variant): Boolean;
function evCheckInTable(const aBlock: IevCommonDataObject;
 anEditor: TevCustomEditorWindow): Boolean;
procedure evUnformatAll(aTextSource: TevCustomTextSource);
function evMouseLP2DP(anEditor: TevCustomEditor): TPoint;

implementation

uses
 l3ImplUses
 , k2Tags
 , nevTools
 , Table_Const
 , nevBase
;

function evInvalidatePara(aPara: Tl3Variant): Boolean;
//#UC START# *48EEFA40027D_48EEF9D8031A_var*
var
 l_Para : InevPara;
//#UC END# *48EEFA40027D_48EEF9D8031A_var*
begin
//#UC START# *48EEFA40027D_48EEF9D8031A_impl*
 Result := true;
 if aPara.QT(InevPara, l_Para) then
 begin
  if (l_Para.DocumentContainer = nil) then
   Result := false
  else
   l_Para.Invalidate([nev_spExtent]);
 end;//aPara.QT(InevPara, l_Para)
//#UC END# *48EEFA40027D_48EEF9D8031A_impl*
end;//evInvalidatePara

function evCheckInTable(const aBlock: IevCommonDataObject;
 anEditor: TevCustomEditorWindow): Boolean;
//#UC START# *48EEFB7400DB_48EEF9D8031A_var*
var
 l_Start  : InevBasePoint;
 l_Finish : InevBasePoint;
//#UC END# *48EEFB7400DB_48EEF9D8031A_var*
begin
//#UC START# *48EEFB7400DB_48EEF9D8031A_impl*
 Result := (anEditor.Range.Table <> nil);
 (aBlock As InevRange).GetBorderPoints(l_Start, l_Finish);
 while l_Start <> nil do
 begin
  if l_Start.Obj.IsKindOf(k2_typTable) then
  begin
   Result := not l_Start.AtStart;
   if Result then
   begin
    l_Start.SetAtStart(anEditor.View, True);
    Result := not l_Start.AtStart;
    Break;
   end
   else
    Break;
  end;
  if l_Start.HasInner then
   l_Start := l_Start.Inner
  else
   l_Start := nil;
 end;
 while l_Finish <> nil do
 begin
  if l_Finish.Obj.IsKindOf(k2_typTable) then
  begin
   Result := not l_Finish.AtEnd(anEditor.View);
   if Result then
   begin
    l_Finish.SetAtEnd(anEditor.View, True);
    Result := not l_Finish.AtEnd(anEditor.View);
    Break;
   end
   else
    Break;
  end;
  if l_Finish.HasInner then
   l_Finish := l_Finish.Inner
  else
   l_Finish := nil;
 end;
//#UC END# *48EEFB7400DB_48EEF9D8031A_impl*
end;//evCheckInTable

procedure evUnformatAll(aTextSource: TevCustomTextSource);
//#UC START# *48EEFBCD02EA_48EEF9D8031A_var*
//#UC END# *48EEFBCD02EA_48EEF9D8031A_var*
begin
//#UC START# *48EEFBCD02EA_48EEF9D8031A_impl*
  aTextSource.DocumentContainer.TextSource.ViewArea.Update;
//#UC END# *48EEFBCD02EA_48EEF9D8031A_impl*
end;//evUnformatAll

function evMouseLP2DP(anEditor: TevCustomEditor): TPoint;
//#UC START# *48EEFCD2037C_48EEF9D8031A_var*
//#UC END# *48EEFCD2037C_48EEF9D8031A_var*
begin
//#UC START# *48EEFCD2037C_48EEF9D8031A_impl*
 with anEditor As InevControl do
  Result := LP2DP(View.MousePos, True);
//#UC END# *48EEFCD2037C_48EEF9D8031A_impl*
end;//evMouseLP2DP

end.
