unit ddHyperlinkTarget;

// ������: "w:\common\components\rtl\Garant\dd\ddHyperlinkTarget.pas"
// ���������: "SimpleClass"

{$Include ddDefine.inc}

interface

uses
 l3IntfUses
 , ddBaseObject
 , k2Interfaces
;

type
 TddHyperlinkTarget = class(TddBaseObject)
  private
   f_DocID: LongInt;
    {* ���� ��� �������� DocID }
   f_SubID: LongInt;
    {* ���� ��� �������� SubID }
   f_TypeID: LongInt;
    {* ���� ��� �������� TypeID }
  public
   constructor Create(aTypeID: Integer;
    aDocID: Integer;
    aSubID: Integer); reintroduce;
   procedure Write2Generator(const Generator: Ik2TagGenerator;
    aLiteVersion: Boolean); override;
   procedure Assign(anObject: TddBaseObject); override;
  public
   property DocID: LongInt
    read f_DocID
    write f_DocID;
   property SubID: LongInt
    read f_SubID;
   property TypeID: LongInt
    read f_TypeID;
 end;//TddHyperlinkTarget

implementation

uses
 l3ImplUses
;

constructor TddHyperlinkTarget.Create(aTypeID: Integer;
 aDocID: Integer;
 aSubID: Integer);
//#UC START# *542540630026_525D26AF0039_var*
//#UC END# *542540630026_525D26AF0039_var*
begin
//#UC START# *542540630026_525D26AF0039_impl*
 inherited Create;
 f_DocID := aDocID;
 f_SubID := aSubID;
 f_TypeID := aTypeID;
//#UC END# *542540630026_525D26AF0039_impl*
end;//TddHyperlinkTarget.Create

procedure TddHyperlinkTarget.Write2Generator(const Generator: Ik2TagGenerator;
 aLiteVersion: Boolean);
//#UC START# *54DC9795018B_525D26AF0039_var*
//#UC END# *54DC9795018B_525D26AF0039_var*
begin
//#UC START# *54DC9795018B_525D26AF0039_impl*
 if (DocID <> 0) or (SubID <> 0) then
 begin
  StartAddress(Generator);
  try
   Generator.AddIntegerAtom(k2_tiDocID, DocID);
   if (SubID <> 0) then
    Generator.AddIntegerAtom(k2_tiSubID, SubID);
  finally
   Generator.Finish;
  end; // idAddress
 end; // if (l_Target.DocID <> 0) or (l_Target.SubID <> 0) then
//#UC END# *54DC9795018B_525D26AF0039_impl*
end;//TddHyperlinkTarget.Write2Generator

procedure TddHyperlinkTarget.Assign(anObject: TddBaseObject);
//#UC START# *52BACF8A01A9_525D26AF0039_var*
//#UC END# *52BACF8A01A9_525D26AF0039_var*
begin
//#UC START# *52BACF8A01A9_525D26AF0039_impl*
 if anObject is TddHyperlinkTarget then
 begin
  f_DocID := TddHyperlinkTarget(anObject).DocID;
  f_SubID := TddHyperlinkTarget(anObject).SubID;
 end
 else
  inherited;
//#UC END# *52BACF8A01A9_525D26AF0039_impl*
end;//TddHyperlinkTarget.Assign

end.
