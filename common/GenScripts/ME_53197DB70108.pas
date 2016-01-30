unit K517772970_TDictEditQueryDefault;
 {* [RequestLink:517772970] }

// ������: "w:\archi\source\projects\PipeInAuto\Tests\Tasks\SaveLoadWithDefault\K517772970_TDictEditQueryDefault.pas"
// ���������: "TestCase"

{$Include alcuDefine.inc}

interface

{$If Defined(AppServerSide) AND Defined(InsiderTest)}
uses
 l3IntfUses
 , K517772970_TCheckSaveToStreamDefault
 {$If NOT Defined(Nemesis)}
 , ddServerTask
 {$IfEnd} // NOT Defined(Nemesis)
;

type
 TK517772970_TDictEditQueryDefault = class(TK517772970_TCheckSaveToStreamDefault)
  {* [RequestLink:517772970] }
  protected
   function GetTaskClass: TddTaskClass; override;
   {$If Defined(nsTest)}
   function GetFolder: AnsiString; override;
    {* ����� � ������� ������ ���� }
   {$IfEnd} // Defined(nsTest)
   {$If Defined(nsTest)}
   function GetModelElementGUID: AnsiString; override;
    {* ������������� �������� ������, ������� ��������� ���� }
   {$IfEnd} // Defined(nsTest)
 end;//TK517772970_TDictEditQueryDefault
{$IfEnd} // Defined(AppServerSide) AND Defined(InsiderTest)

implementation

{$If Defined(AppServerSide) AND Defined(InsiderTest)}
uses
 l3ImplUses
 {$If NOT Defined(Nemesis)}
 , csServerTaskTypes
 {$IfEnd} // NOT Defined(Nemesis)
 {$If Defined(nsTest)}
 , TestFrameWork
 {$IfEnd} // Defined(nsTest)
;

function TK517772970_TDictEditQueryDefault.GetTaskClass: TddTaskClass;
//#UC START# *53170E4100CF_53197DB70108_var*
//#UC END# *53170E4100CF_53197DB70108_var*
begin
//#UC START# *53170E4100CF_53197DB70108_impl*
 result := TDictEditQuery;
//#UC END# *53170E4100CF_53197DB70108_impl*
end;//TK517772970_TDictEditQueryDefault.GetTaskClass

{$If Defined(nsTest)}
function TK517772970_TDictEditQueryDefault.GetFolder: AnsiString;
 {* ����� � ������� ������ ���� }
begin
 Result := 'TasksSaveLoadWithDefault';
end;//TK517772970_TDictEditQueryDefault.GetFolder
{$IfEnd} // Defined(nsTest)

{$If Defined(nsTest)}
function TK517772970_TDictEditQueryDefault.GetModelElementGUID: AnsiString;
 {* ������������� �������� ������, ������� ��������� ���� }
begin
 Result := '53197DB70108';
end;//TK517772970_TDictEditQueryDefault.GetModelElementGUID
{$IfEnd} // Defined(nsTest)

initialization
 TestFramework.RegisterTest(TK517772970_TDictEditQueryDefault.Suite);
{$IfEnd} // Defined(AppServerSide) AND Defined(InsiderTest)

end.
