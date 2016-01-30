unit K201493907;
 {* [RequestLink:201493907] }

// ������: "w:\common\components\rtl\Garant\Daily\K201493907.pas"
// ���������: "TestCase"

{$Include TestDefine.inc.pas}

interface

{$If Defined(nsTest) AND NOT Defined(NoScripts)}
uses
 l3IntfUses
 {$If NOT Defined(NoVCM)}
 , ScrollTest
 {$IfEnd} // NOT Defined(NoVCM)
;

type
 TK201493907 = class(TScrollTest)
  {* [RequestLink:201493907] }
  protected
   {$If NOT Defined(NoVCM)}
   function ScrollByPage: Boolean; override;
   {$IfEnd} // NOT Defined(NoVCM)
   {$If NOT Defined(NoVCM)}
   function GetNormalFontSize: Integer; override;
    {* ���������� ������ ������ ����� "����������". 0 - ��-��������� }
   {$IfEnd} // NOT Defined(NoVCM)
   function GetFolder: AnsiString; override;
    {* ����� � ������� ������ ���� }
   function GetModelElementGUID: AnsiString; override;
    {* ������������� �������� ������, ������� ��������� ���� }
 end;//TK201493907
{$IfEnd} // Defined(nsTest) AND NOT Defined(NoScripts)

implementation

{$If Defined(nsTest) AND NOT Defined(NoScripts)}
uses
 l3ImplUses
 , TestFrameWork
;

{$If NOT Defined(NoVCM)}
function TK201493907.ScrollByPage: Boolean;
//#UC START# *4BEBFE020080_4C07A89B0179_var*
//#UC END# *4BEBFE020080_4C07A89B0179_var*
begin
//#UC START# *4BEBFE020080_4C07A89B0179_impl*
 Result := false;
//#UC END# *4BEBFE020080_4C07A89B0179_impl*
end;//TK201493907.ScrollByPage
{$IfEnd} // NOT Defined(NoVCM)

{$If NOT Defined(NoVCM)}
function TK201493907.GetNormalFontSize: Integer;
 {* ���������� ������ ������ ����� "����������". 0 - ��-��������� }
//#UC START# *4C07AC6F036D_4C07A89B0179_var*
//#UC END# *4C07AC6F036D_4C07A89B0179_var*
begin
//#UC START# *4C07AC6F036D_4C07A89B0179_impl*
 Result := 12;
//#UC END# *4C07AC6F036D_4C07A89B0179_impl*
end;//TK201493907.GetNormalFontSize
{$IfEnd} // NOT Defined(NoVCM)

function TK201493907.GetFolder: AnsiString;
 {* ����� � ������� ������ ���� }
begin
 Result := '7.5';
end;//TK201493907.GetFolder

function TK201493907.GetModelElementGUID: AnsiString;
 {* ������������� �������� ������, ������� ��������� ���� }
begin
 Result := '4C07A89B0179';
end;//TK201493907.GetModelElementGUID

initialization
 TestFramework.RegisterTest(TK201493907.Suite);
{$IfEnd} // Defined(nsTest) AND NOT Defined(NoScripts)

end.
