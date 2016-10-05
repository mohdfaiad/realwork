unit l3MarshalledTypes;

// ������: "w:\common\components\rtl\Garant\L3\l3MarshalledTypes.pas"
// ���������: "Interfaces"
// ������� ������: "l3MarshalledTypes" MUID: (57BEAF780201)

{$Include w:\common\components\rtl\Garant\L3\l3Define.inc}

interface

uses
 l3IntfUses
;

type
 Tm3DocPartSelector = (
  m3_dsMain
   {* �������� ����� }
  , m3_dsAnno
   {* ��������� }
  , m3_dsInfo
   {* ���������� � ��������� }
  , m3_dsObject
   {* ������ � ��������� }
 );//Tm3DocPartSelector

 TDocPartSelector = (
  dpDoc
  , dpSpr
  , dpAnno
 );//TDocPartSelector

 TDocType = (
  dtNone
  , dtText
  , dtRelText
  , dtShortCut
  , dtObject
  , dtDictEntry
  , dtAnnotation
  , dtFlash
  , dtGroupOp
 );//TDocType

 TOperActionType = (
  atNone
  , atAdd
  , atDelete
  , atEdit
  , atMove
  , atJurEdit
 );//TOperActionType

 TarMultiOperation = (
  ar_moGroupTouch
  , ar_moTouchIZM
  , ar_moChangeKeywords
  , ar_moSetClonePublishedin
 );//TarMultiOperation

implementation

uses
 l3ImplUses
;

end.
