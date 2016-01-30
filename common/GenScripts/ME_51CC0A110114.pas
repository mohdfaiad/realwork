unit K465700807;

// ������: "w:\archi\source\projects\ImportExportTest\K465700807.pas"
// ���������: "TestCase"

{$Include ImportExportTest.inc}

interface

{$If Defined(nsTest)}
uses
 l3IntfUses
 , ietBaseTest
 , evdDTTypes
;

type
 TK465700807 = class(TietBaseTest)
  protected
   function GetFolder: AnsiString; override;
    {* ����� � ������� ������ ���� }
   function GetModelElementGUID: AnsiString; override;
    {* ������������� �������� ������, ������� ��������� ���� }
   function GetOutputFormat: TepSupportFileType; override;
 end;//TK465700807
{$IfEnd} // Defined(nsTest)

implementation

{$If Defined(nsTest)}
uses
 l3ImplUses
 , TestFrameWork
;

function TK465700807.GetFolder: AnsiString;
 {* ����� � ������� ������ ���� }
begin
 Result := 'ImportExport';
end;//TK465700807.GetFolder

function TK465700807.GetModelElementGUID: AnsiString;
 {* ������������� �������� ������, ������� ��������� ���� }
begin
 Result := '51CC0A110114';
end;//TK465700807.GetModelElementGUID

function TK465700807.GetOutputFormat: TepSupportFileType;
//#UC START# *51CBE62E006B_51CC0A110114_var*
//#UC END# *51CBE62E006B_51CC0A110114_var*
begin
//#UC START# *51CBE62E006B_51CC0A110114_impl*
 Result := outNSRC;
//#UC END# *51CBE62E006B_51CC0A110114_impl*
end;//TK465700807.GetOutputFormat

initialization
 TestFramework.RegisterTest(TK465700807.Suite);
{$IfEnd} // Defined(nsTest)

end.
