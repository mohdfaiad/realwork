unit vtOutlinerWithDragDropRes;
 {* ������� ��� TvtOutlinerWithDragDrop }

// ������: "w:\common\components\gui\Garant\VT\vtOutlinerWithDragDropRes.pas"
// ���������: "UtilityPack"

{$Include vtDefine.inc}

interface

uses
 l3IntfUses
 , l3StringIDEx
;

const
 {* ������������ ������ TreeViewMessages }
 str_nsc_MultiSelectDraggingText: Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'nsc_MultiSelectDraggingText'; rValue : '�����: %d');
  {* '�����: %d' }

implementation

uses
 l3ImplUses
 , l3MessageID
;

initialization
 str_nsc_MultiSelectDraggingText.Init;
 {* ������������� str_nsc_MultiSelectDraggingText }

end.
