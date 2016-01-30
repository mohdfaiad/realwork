unit K235052899;
 {* [RequestLink:235052899]. }

// ������: "w:\common\components\rtl\Garant\Daily\K235052899.pas"
// ���������: "TestCase"

{$Include TestDefine.inc.pas}

interface

{$If Defined(nsTest) AND NOT Defined(NoScripts)}
uses
 l3IntfUses
 , EVDwithFormulasToRTFWriterTest
;

type
 TK235052899 = class(TEVDwithFormulasToRTFWriterTest)
  {* [RequestLink:235052899]. }
  protected
   function GetFolder: AnsiString; override;
    {* ����� � ������� ������ ���� }
   function GetModelElementGUID: AnsiString; override;
    {* ������������� �������� ������, ������� ��������� ���� }
   {$If Defined(XE) AND NOT Defined(NotTunedDUnit)}
   function EtalonNeedsXE: Boolean; override;
   {$IfEnd} // Defined(XE) AND NOT Defined(NotTunedDUnit)
 end;//TK235052899
{$IfEnd} // Defined(nsTest) AND NOT Defined(NoScripts)

implementation

{$If Defined(nsTest) AND NOT Defined(NoScripts)}
uses
 l3ImplUses
 , TestFrameWork
;

function TK235052899.GetFolder: AnsiString;
 {* ����� � ������� ������ ���� }
begin
 Result := '7.6';
end;//TK235052899.GetFolder

function TK235052899.GetModelElementGUID: AnsiString;
 {* ������������� �������� ������, ������� ��������� ���� }
begin
 Result := '4C9395B90345';
end;//TK235052899.GetModelElementGUID

{$If Defined(XE) AND NOT Defined(NotTunedDUnit)}
function TK235052899.EtalonNeedsXE: Boolean;
//#UC START# *51AF49E5001B_4C9395B90345_var*
//#UC END# *51AF49E5001B_4C9395B90345_var*
begin
//#UC START# *51AF49E5001B_4C9395B90345_impl*
 Result := true;
//#UC END# *51AF49E5001B_4C9395B90345_impl*
end;//TK235052899.EtalonNeedsXE
{$IfEnd} // Defined(XE) AND NOT Defined(NotTunedDUnit)

initialization
 TestFramework.RegisterTest(TK235052899.Suite);
{$IfEnd} // Defined(nsTest) AND NOT Defined(NoScripts)

end.
