unit K226001213;
 {* [$226001213] }

// ������: "w:\common\components\rtl\Garant\Daily\K226001213.pas"
// ���������: "TestCase"

{$Include TestDefine.inc.pas}

interface

{$If Defined(nsTest) AND NOT Defined(NoScripts)}
uses
 l3IntfUses
 , ColumnAlignHorisontallyTest
;

type
 TK226001213 = class(TColumnAlignHorisontallyTest)
  {* [$226001213] }
  protected
   function GetFolder: AnsiString; override;
    {* ����� � ������� ������ ���� }
   function SelectColumn(var aColID: Integer): Boolean; override;
    {* �������� ������� aColID }
   function GetModelElementGUID: AnsiString; override;
    {* ������������� �������� ������, ������� ��������� ���� }
 end;//TK226001213
{$IfEnd} // Defined(nsTest) AND NOT Defined(NoScripts)

implementation

{$If Defined(nsTest) AND NOT Defined(NoScripts)}
uses
 l3ImplUses
 , TestFrameWork
;

function TK226001213.GetFolder: AnsiString;
 {* ����� � ������� ������ ���� }
begin
 Result := '7.6';
end;//TK226001213.GetFolder

function TK226001213.SelectColumn(var aColID: Integer): Boolean;
 {* �������� ������� aColID }
//#UC START# *4C9874060367_4C3C2D63027E_var*
//#UC END# *4C9874060367_4C3C2D63027E_var*
begin
//#UC START# *4C9874060367_4C3C2D63027E_impl*
 Result := True;
 aColID := 1;
//#UC END# *4C9874060367_4C3C2D63027E_impl*
end;//TK226001213.SelectColumn

function TK226001213.GetModelElementGUID: AnsiString;
 {* ������������� �������� ������, ������� ��������� ���� }
begin
 Result := '4C3C2D63027E';
end;//TK226001213.GetModelElementGUID

initialization
 TestFramework.RegisterTest(TK226001213.Suite);
{$IfEnd} // Defined(nsTest) AND NOT Defined(NoScripts)

end.
