unit NOT_FINISHED_evCustomTextSource;
 {* ���������� ��������� ���������. }

// ������: "w:\common\components\gui\Garant\Everest\NOT_FINISHED_evCustomTextSource.pas"
// ���������: "SimpleClass"

{$Include evDefine.inc}

interface

uses
 l3IntfUses
 , l3InterfacedComponent
 , nevTools
 , nevBase
 , l3Variant
;

type
 TevGetControlItemImgEvent = procedure(aSender: TObject;
  const aControl: TnevControlInfo;
  out theImageInfo: TnevControlImageInfo) of object;

 TevDocumentChangedEvent = procedure(aSender: TObject;
  anOldDocument: Tl3Tag;
  aNewDocument: Tl3Tag) of object;

 TevCustomTextSource = class(Tl3InterfacedComponent)
  {* ���������� ��������� ���������. }
  protected
   function DoMakeDocumentContainer: InevDocumentContainer; virtual;
 end;//TevCustomTextSource

implementation

uses
 l3ImplUses
;

function TevCustomTextSource.DoMakeDocumentContainer: InevDocumentContainer;
//#UC START# *482D9A030221_482BFB7C00B6_var*
//#UC END# *482D9A030221_482BFB7C00B6_var*
begin
//#UC START# *482D9A030221_482BFB7C00B6_impl*
 !!! Needs to be implemented !!!
//#UC END# *482D9A030221_482BFB7C00B6_impl*
end;//TevCustomTextSource.DoMakeDocumentContainer

end.
