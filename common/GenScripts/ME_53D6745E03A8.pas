unit nevTableIevChangeParamToolMapper;

// ������: "w:\common\components\gui\Garant\Everest\new\nevTableIevChangeParamToolMapper.pas"
// ���������: "SimpleClass"

{$Include evDefine.inc}

interface

{$If Defined(k2ForEditor) AND Defined(evNeedHotSpot)}
uses
 l3IntfUses
 , k2InterfaceMapper
 , l3Variant
 , l3IID
;

type
 TnevTableIevChangeParamToolMapper = class(Tk2InterfaceMapper)
  public
   class function Make(aTag: Tl3Variant;
    const IID: Tl3GUID;
    out Tool;
    const aProcessor: Ik2Processor): Boolean; override;
 end;//TnevTableIevChangeParamToolMapper
{$IfEnd} // Defined(k2ForEditor) AND Defined(evNeedHotSpot)

implementation

{$If Defined(k2ForEditor) AND Defined(evNeedHotSpot)}
uses
 l3ImplUses
 , nevTools
 , SysUtils
;

class function TnevTableIevChangeParamToolMapper.Make(aTag: Tl3Variant;
 const IID: Tl3GUID;
 out Tool;
 const aProcessor: Ik2Processor): Boolean;
//#UC START# *53D639B601D7_53D6745E03A8_var*
var
 l_Obj : InevObject;
//#UC END# *53D639B601D7_53D6745E03A8_var*
begin
//#UC START# *53D639B601D7_53D6745E03A8_impl*
 Result := true;
 if aTag.QT(InevObject, l_Obj, aProcessor) then
  try
   if not Supports(l_Obj.MakePoint, IID.IID, Tool) then
    Result := false;
  finally
   l_Obj := nil;
  end//try..finally
 else
  Result := false;
//#UC END# *53D639B601D7_53D6745E03A8_impl*
end;//TnevTableIevChangeParamToolMapper.Make
{$IfEnd} // Defined(k2ForEditor) AND Defined(evNeedHotSpot)

end.
