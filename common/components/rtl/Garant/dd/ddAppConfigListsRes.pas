unit ddAppConfigListsRes;

// ������: "w:\common\components\rtl\Garant\dd\ddAppConfigListsRes.pas"
// ���������: "UtilityPack"
// ������� ������: "ddAppConfigListsRes" MUID: (4B9E5E09030C)

{$Include w:\common\components\rtl\Garant\dd\ddDefine.inc}

interface

uses
 l3IntfUses
 , l3StringIDEx
;

const
 {* ������������ ������ ConfigMessages }
 str_ddcmAddConfigValue: Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'ddcmAddConfigValue'; rValue : '��������');
  {* '��������' }
 str_ddcmChangeConfigValue: Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'ddcmChangeConfigValue'; rValue : '���������');
  {* '���������' }
 str_ddcmDeleteConfigValue: Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'ddcmDeleteConfigValue'; rValue : '�������');
  {* '�������' }
 str_ddcmConfirmDeleteConfigValue: Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'ddcmConfirmDeleteConfigValue'; rValue : '�� ������������� ������ ������� ������� "%s"?');
  {* '�� ������������� ������ ������� ������� "%s"?' }

implementation

uses
 l3ImplUses
 //#UC START# *4B9E5E09030Cimpl_uses*
 //#UC END# *4B9E5E09030Cimpl_uses*
;

initialization
 str_ddcmAddConfigValue.Init;
 {* ������������� str_ddcmAddConfigValue }
 str_ddcmChangeConfigValue.Init;
 {* ������������� str_ddcmChangeConfigValue }
 str_ddcmDeleteConfigValue.Init;
 {* ������������� str_ddcmDeleteConfigValue }
 str_ddcmConfirmDeleteConfigValue.Init;
 {* ������������� str_ddcmConfirmDeleteConfigValue }

end.
