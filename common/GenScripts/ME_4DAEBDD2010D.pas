unit l3VCLFormPtrList;
 {* ������ ���������� �� ����� VCL }

// ������: "w:\common\components\rtl\Garant\L3\l3VCLFormPtrList.pas"
// ���������: "SimpleClass"

{$Include l3Define.inc}

interface

uses
 l3IntfUses
 , l3ProtoDataContainer
 {$If NOT Defined(NoVCL)}
 , Forms
 {$IfEnd} // NOT Defined(NoVCL)
 , l3Memory
 , l3Types
 , l3Interfaces
 , l3Core
 , l3Except
 , Classes
;

type
 _ItemType_ = TCustomForm;
 _l3ObjectPtrList_Parent_ = Tl3ProtoDataContainer;
 {$Define l3Items_IsProto}
 {$Include l3ObjectPtrList.imp.pas}
 Tl3VCLFormPtrList = class(_l3ObjectPtrList_)
  {* ������ ���������� �� ����� VCL }
 end;//Tl3VCLFormPtrList

implementation

uses
 l3ImplUses
 , l3Base
 , l3MinMax
 , RTLConsts
 , SysUtils
;

type _Instance_R_ = Tl3VCLFormPtrList;

{$Include l3ObjectPtrList.imp.pas}

end.
