unit NOT_FINISHED_dt_DictConst;

// ������: "w:\common\components\rtl\Garant\DT\NOT_FINISHED_dt_DictConst.pas"
// ���������: "UtilityPack"

{$Include DtDefine.inc}

interface

{$If NOT Defined(Nemesis)}
uses
 l3IntfUses
;

const
 cPublInNumLen = 30;
 cSourceNameLen = 200;
 cSourceShortNameLen = 70;
 cSourceSynonimsLen = 800;
{$IfEnd} // NOT Defined(Nemesis)

implementation

{$If NOT Defined(Nemesis)}
uses
 l3ImplUses
;
{$IfEnd} // NOT Defined(Nemesis)

end.
