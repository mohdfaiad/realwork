unit K234360974;
 {* [RequestLink:234360974]. }

// ������: "w:\common\components\rtl\Garant\Daily\K234360974.pas"
// ���������: "TestCase"

{$Include TestDefine.inc.pas}

interface

{$If Defined(nsTest) AND NOT Defined(NoScripts)}
uses
 l3IntfUses
 , MoveSubTest
;

type
 TK234360974 = class(TMoveSubTest)
  {* [RequestLink:234360974]. }
  protected
   function GetFolder: AnsiString; override;
    {* ����� � ������� ������ ���� }
   function GetModelElementGUID: AnsiString; override;
    {* ������������� �������� ������, ������� ��������� ���� }
 end;//TK234360974
{$IfEnd} // Defined(nsTest) AND NOT Defined(NoScripts)

implementation

{$If Defined(nsTest) AND NOT Defined(NoScripts)}
uses
 l3ImplUses
 , TestFrameWork
;

function TK234360974.GetFolder: AnsiString;
 {* ����� � ������� ������ ���� }
begin
 Result := '7.6';
end;//TK234360974.GetFolder

function TK234360974.GetModelElementGUID: AnsiString;
 {* ������������� �������� ������, ������� ��������� ���� }
begin
 Result := '4C920E240280';
end;//TK234360974.GetModelElementGUID

initialization
 TestFramework.RegisterTest(TK234360974.Suite);
{$IfEnd} // Defined(nsTest) AND NOT Defined(NoScripts)

end.
