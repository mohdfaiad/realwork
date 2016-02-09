unit K517789752;
 {* [RequestLink:517789752] }

// ������: "w:\archi\source\projects\PipeInAuto\Tests\Tasks\Import\K517789752.pas"
// ���������: "TestCase"

{$Include alcuDefine.inc}

interface

{$If Defined(AppServerSide) AND Defined(InsiderTest)}
uses
 l3IntfUses
 , alcuImportTest
;

type
 TK517789752 = class(TalcuImportTest)
  {* [RequestLink:517789752] }
  protected
   {$If Defined(nsTest)}
   function GetFolder: AnsiString; override;
    {* ����� � ������� ������ ���� }
   {$IfEnd} // Defined(nsTest)
   {$If Defined(nsTest)}
   function GetModelElementGUID: AnsiString; override;
    {* ������������� �������� ������, ������� ��������� ���� }
   {$IfEnd} // Defined(nsTest)
 end;//TK517789752
{$IfEnd} // Defined(AppServerSide) AND Defined(InsiderTest)

implementation

{$If Defined(AppServerSide) AND Defined(InsiderTest)}
uses
 l3ImplUses
 {$If Defined(nsTest)}
 , TestFrameWork
 {$IfEnd} // Defined(nsTest)
 , l3Filer
 , SysUtils
;

{$If Defined(nsTest)}
function TK517789752.GetFolder: AnsiString;
 {* ����� � ������� ������ ���� }
begin
 Result := 'ConcreteImportTasks';
end;//TK517789752.GetFolder
{$IfEnd} // Defined(nsTest)

{$If Defined(nsTest)}
function TK517789752.GetModelElementGUID: AnsiString;
 {* ������������� �������� ������, ������� ��������� ���� }
begin
 Result := '53736E900198';
end;//TK517789752.GetModelElementGUID
{$IfEnd} // Defined(nsTest)

initialization
 TestFramework.RegisterTest(TK517789752.Suite);
{$IfEnd} // Defined(AppServerSide) AND Defined(InsiderTest)

end.
