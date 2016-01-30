unit K517772970_TDeleteDocsQuery;
 {* [RequestLink:517772970] }

// ������: "w:\archi\source\projects\PipeInAuto\Tests\Tasks\SaveLoad\K517772970_TDeleteDocsQuery.pas"
// ���������: "TestCase"

{$Include alcuDefine.inc}

interface

{$If Defined(AppServerSide) AND Defined(InsiderTest)}
uses
 l3IntfUses
 , K517772970_TddProcessTask
 {$If NOT Defined(Nemesis)}
 , ddServerTask
 {$IfEnd} // NOT Defined(Nemesis)
;

type
 TK517772970_TDeleteDocsQuery = class(TK517772970_TddProcessTask)
  {* [RequestLink:517772970] }
  protected
   {$If Defined(nsTest)}
   function GetFolder: AnsiString; override;
    {* ����� � ������� ������ ���� }
   {$IfEnd} // Defined(nsTest)
   {$If Defined(nsTest)}
   function GetModelElementGUID: AnsiString; override;
    {* ������������� �������� ������, ������� ��������� ���� }
   {$IfEnd} // Defined(nsTest)
   function TaskClass: TddTaskClass; override;
 end;//TK517772970_TDeleteDocsQuery
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

{$If Defined(nsTest)}
function TK517772970_TDeleteDocsQuery.GetFolder: AnsiString;
 {* ����� � ������� ������ ���� }
begin
 Result := 'TaskSaveLoad';
end;//TK517772970_TDeleteDocsQuery.GetFolder
{$IfEnd} // Defined(nsTest)

{$If Defined(nsTest)}
function TK517772970_TDeleteDocsQuery.GetModelElementGUID: AnsiString;
 {* ������������� �������� ������, ������� ��������� ���� }
begin
 Result := '532150340028';
end;//TK517772970_TDeleteDocsQuery.GetModelElementGUID
{$IfEnd} // Defined(nsTest)

function TK517772970_TDeleteDocsQuery.TaskClass: TddTaskClass;
//#UC START# *5320088202FB_532150340028_var*
//#UC END# *5320088202FB_532150340028_var*
begin
//#UC START# *5320088202FB_532150340028_impl*
 result := TDeleteDocsQuery;
//#UC END# *5320088202FB_532150340028_impl*
end;//TK517772970_TDeleteDocsQuery.TaskClass

initialization
 TestFramework.RegisterTest(TK517772970_TDeleteDocsQuery.Suite);
{$IfEnd} // Defined(AppServerSide) AND Defined(InsiderTest)

end.
