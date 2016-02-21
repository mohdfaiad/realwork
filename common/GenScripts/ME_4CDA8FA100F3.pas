unit K238420863;
 {* [$238420863] }

// ������: "w:\common\components\rtl\Garant\Daily\K238420863.pas"
// ���������: "TestCase"

{$Include w:\common\components\rtl\Garant\Daily\TestDefine.inc.pas}

interface

{$If Defined(nsTest) AND NOT Defined(NoScripts)}
uses
 l3IntfUses
 , PreviewTestBefore235875079WithRowCmp
;

type
 TK238420863 = class(TPreviewTestBefore235875079WithRowCmp)
  {* [$238420863] }
  protected
   function GetFolder: AnsiString; override;
    {* ����� � ������� ������ ���� }
   function GetModelElementGUID: AnsiString; override;
    {* ������������� �������� ������, ������� ��������� ���� }
   {$If Defined(XE) AND NOT Defined(NotTunedDUnit)}
   function EtalonNeedsXE: Boolean; override;
   {$IfEnd} // Defined(XE) AND NOT Defined(NotTunedDUnit)
 end;//TK238420863
{$IfEnd} // Defined(nsTest) AND NOT Defined(NoScripts)

implementation

{$If Defined(nsTest) AND NOT Defined(NoScripts)}
uses
 l3ImplUses
 , TestFrameWork
 , PrintRowHeightsSpy
 {$If NOT Defined(NoVCM)}
 , vcmBase
 {$IfEnd} // NOT Defined(NoVCM)
 , SysUtils
 {$If NOT Defined(NoVCL)}
 , Forms
 {$IfEnd} // NOT Defined(NoVCL)
 , l3Base
;

function TK238420863.GetFolder: AnsiString;
 {* ����� � ������� ������ ���� }
begin
 Result := '7.6';
end;//TK238420863.GetFolder

function TK238420863.GetModelElementGUID: AnsiString;
 {* ������������� �������� ������, ������� ��������� ���� }
begin
 Result := '4CDA8FA100F3';
end;//TK238420863.GetModelElementGUID

{$If Defined(XE) AND NOT Defined(NotTunedDUnit)}
function TK238420863.EtalonNeedsXE: Boolean;
//#UC START# *51AF49E5001B_4CDA8FA100F3_var*
//#UC END# *51AF49E5001B_4CDA8FA100F3_var*
begin
//#UC START# *51AF49E5001B_4CDA8FA100F3_impl*
 Result := true;
//#UC END# *51AF49E5001B_4CDA8FA100F3_impl*
end;//TK238420863.EtalonNeedsXE
{$IfEnd} // Defined(XE) AND NOT Defined(NotTunedDUnit)

initialization
 TestFramework.RegisterTest(TK238420863.Suite);
{$IfEnd} // Defined(nsTest) AND NOT Defined(NoScripts)

end.
