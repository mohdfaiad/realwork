unit edCellTypesList;
 {* ������ ��� �������� ����� ����������� �����. }

// ������: "w:\common\components\gui\Garant\Everest\edCellTypesList.pas"
// ���������: "SimpleClass"

{$Include evDefine.inc}

interface

uses
 l3IntfUses
 , l3SimpleDataContainer
 , evEditorInterfaces
 , l3Memory
 , l3Types
 , l3Interfaces
 , l3Core
 , l3Except
 , Classes
;

type
 _ItemType_ = TedCellType;
 _l3EnumList_Parent_ = Tl3SimpleDataContainer;
 {$Define l3Items_IsProto}
 {$Include l3EnumList.imp.pas}
 TedCellTypesList = class(_l3EnumList_)
  {* ������ ��� �������� ����� ����������� �����. }
 end;//TedCellTypesList

implementation

uses
 l3ImplUses
 , l3Base
 , l3MinMax
 , RTLConsts
 , SysUtils
;

type _Instance_R_ = TedCellTypesList;

{$Include l3EnumList.imp.pas}

end.
