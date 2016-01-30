{$IfNDef nevBasePoint_imp}

// ������: "w:\common\components\gui\Garant\Everest\nevBasePoint.imp.pas"
// ���������: "Impurity"

{$Define nevBasePoint_imp}

{$If Defined(evUseVisibleCursors)}
 _nevParaTool_Parent_ = Tk2TagPointer;
 {$Include nevParaTool.imp.pas}
 _nevParentPointFactory_Parent_ = _nevParaTool_;
 {$Include nevParentPointFactory.imp.pas}
 _nevParentPointHolder_Parent_ = _nevParentPointFactory_;
 {$Include nevParentPointHolder.imp.pas}
 _nevMostInner_Parent_ = _nevParentPointHolder_;
 {$Include nevMostInner.imp.pas}
 _nevViewBounds_Parent_ = _nevMostInner_;
 {$Include nevViewBounds.imp.pas}
 _nevBasePoint_ = class(_nevViewBounds_)
  {* "����� �������" ����� }
  protected
   procedure Set_PositionW(aValue: TnevPosition);
   function Get_Obj: PInevObject;
  public
   function DoMove(const aView: InevView;
    aCode: Integer;
    const anOp: InevOp;
    aCount: Integer): TnevMoveResult;
   function Move(const aView: InevView;
    aCode: Cardinal;
    const anOp: InevOp = nil;
    aCount: Integer = 1): Boolean;
   procedure Refresh;
   procedure SetEntryPointPrim(Value: Integer;
    const Context: IevCursorContext = nil);
   procedure SetEntryPoint(Value: Integer;
    const Context: IevCursorContext = nil); overload;
   procedure SetEntryPoint(aValue: Integer;
    const aContext: InevOp); overload;
   function ToBottomChild(const aView: InevView): InevBasePoint;
   procedure SetAtEnd(const aView: InevView;
    aValue: Boolean);
   procedure SetAtStart(const aView: InevView;
    aValue: Boolean);
 end;//_nevBasePoint_

{$Else Defined(evUseVisibleCursors)}

_nevParaTool_Parent_ = Tk2TagPointer;
{$Include nevParaTool.imp.pas}
_nevParentPointFactory_Parent_ = _nevParaTool_;
{$Include nevParentPointFactory.imp.pas}
_nevParentPointHolder_Parent_ = _nevParentPointFactory_;
{$Include nevParentPointHolder.imp.pas}
_nevMostInner_Parent_ = _nevParentPointHolder_;
{$Include nevMostInner.imp.pas}
_nevViewBounds_Parent_ = _nevMostInner_;
{$Include nevViewBounds.imp.pas}
_nevBasePoint_ = _nevViewBounds_;

{$IfEnd} // Defined(evUseVisibleCursors)
{$Else nevBasePoint_imp}

{$IfNDef nevBasePoint_imp_impl}

{$Define nevBasePoint_imp_impl}

{$If Defined(evUseVisibleCursors)}
type _Instance_R_ = _nevBasePoint_;

{$Include nevParaTool.imp.pas}

{$Include nevParentPointFactory.imp.pas}

{$Include nevParentPointHolder.imp.pas}

{$Include nevMostInner.imp.pas}

{$Include nevViewBounds.imp.pas}

function _nevBasePoint_.DoMove(const aView: InevView;
 aCode: Integer;
 const anOp: InevOp;
 aCount: Integer): TnevMoveResult;
//#UC START# *47C689E90006_49DE374402D1_var*
//#UC END# *47C689E90006_49DE374402D1_var*
begin
//#UC START# *47C689E90006_49DE374402D1_impl*
 Result := ev_dcNotDone;
 Assert(false);
//#UC END# *47C689E90006_49DE374402D1_impl*
end;//_nevBasePoint_.DoMove

function _nevBasePoint_.Move(const aView: InevView;
 aCode: Cardinal;
 const anOp: InevOp = nil;
 aCount: Integer = 1): Boolean;
//#UC START# *47C68A010279_49DE374402D1_var*
//#UC END# *47C68A010279_49DE374402D1_var*
begin
//#UC START# *47C68A010279_49DE374402D1_impl*
 Result := false;
 Assert(false);
//#UC END# *47C68A010279_49DE374402D1_impl*
end;//_nevBasePoint_.Move

procedure _nevBasePoint_.Refresh;
//#UC START# *47C68A0E01E9_49DE374402D1_var*
//#UC END# *47C68A0E01E9_49DE374402D1_var*
begin
//#UC START# *47C68A0E01E9_49DE374402D1_impl*
 Assert(false);
//#UC END# *47C68A0E01E9_49DE374402D1_impl*
end;//_nevBasePoint_.Refresh

procedure _nevBasePoint_.SetEntryPointPrim(Value: Integer;
 const Context: IevCursorContext = nil);
//#UC START# *47C68A160190_49DE374402D1_var*
//#UC END# *47C68A160190_49DE374402D1_var*
begin
//#UC START# *47C68A160190_49DE374402D1_impl*
 Assert(false);
//#UC END# *47C68A160190_49DE374402D1_impl*
end;//_nevBasePoint_.SetEntryPointPrim

procedure _nevBasePoint_.SetEntryPoint(Value: Integer;
 const Context: IevCursorContext = nil);
//#UC START# *47C68A220200_49DE374402D1_var*
//#UC END# *47C68A220200_49DE374402D1_var*
begin
//#UC START# *47C68A220200_49DE374402D1_impl*
 Assert(false);
//#UC END# *47C68A220200_49DE374402D1_impl*
end;//_nevBasePoint_.SetEntryPoint

procedure _nevBasePoint_.SetEntryPoint(aValue: Integer;
 const aContext: InevOp);
//#UC START# *47C68A2E00EC_49DE374402D1_var*
//#UC END# *47C68A2E00EC_49DE374402D1_var*
begin
//#UC START# *47C68A2E00EC_49DE374402D1_impl*
 Assert(false);
//#UC END# *47C68A2E00EC_49DE374402D1_impl*
end;//_nevBasePoint_.SetEntryPoint

function _nevBasePoint_.ToBottomChild(const aView: InevView): InevBasePoint;
//#UC START# *47C68A42023A_49DE374402D1_var*
//#UC END# *47C68A42023A_49DE374402D1_var*
begin
//#UC START# *47C68A42023A_49DE374402D1_impl*
 Result := nil;
 Assert(false);
//#UC END# *47C68A42023A_49DE374402D1_impl*
end;//_nevBasePoint_.ToBottomChild

procedure _nevBasePoint_.Set_PositionW(aValue: TnevPosition);
//#UC START# *47C68A520059_49DE374402D1set_var*
//#UC END# *47C68A520059_49DE374402D1set_var*
begin
//#UC START# *47C68A520059_49DE374402D1set_impl*
 Assert(false);
//#UC END# *47C68A520059_49DE374402D1set_impl*
end;//_nevBasePoint_.Set_PositionW

procedure _nevBasePoint_.SetAtEnd(const aView: InevView;
 aValue: Boolean);
//#UC START# *4803044303DC_49DE374402D1_var*
//#UC END# *4803044303DC_49DE374402D1_var*
begin
//#UC START# *4803044303DC_49DE374402D1_impl*
 Assert(false);
//#UC END# *4803044303DC_49DE374402D1_impl*
end;//_nevBasePoint_.SetAtEnd

procedure _nevBasePoint_.SetAtStart(const aView: InevView;
 aValue: Boolean);
//#UC START# *4803045B0109_49DE374402D1_var*
//#UC END# *4803045B0109_49DE374402D1_var*
begin
//#UC START# *4803045B0109_49DE374402D1_impl*
 Assert(false);
//#UC END# *4803045B0109_49DE374402D1_impl*
end;//_nevBasePoint_.SetAtStart

function _nevBasePoint_.Get_Obj: PInevObject;
//#UC START# *49DDD02D00E3_49DE374402D1get_var*
//#UC END# *49DDD02D00E3_49DE374402D1get_var*
begin
//#UC START# *49DDD02D00E3_49DE374402D1get_impl*
 Result := @f_ParaX;
//#UC END# *49DDD02D00E3_49DE374402D1get_impl*
end;//_nevBasePoint_.Get_Obj
{$IfEnd} // Defined(evUseVisibleCursors)

{$EndIf nevBasePoint_imp_impl}

{$EndIf nevBasePoint_imp}

