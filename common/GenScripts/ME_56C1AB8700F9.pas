unit HTMLtoEVDWithApplyTextCorrections;

// ������: "w:\common\components\rtl\Garant\Daily\HTMLtoEVDWithApplyTextCorrections.pas"
// ���������: "TestCase"

{$Include w:\common\components\rtl\Garant\Daily\TestDefine.inc.pas}

interface

{$If Defined(nsTest) AND NOT Defined(NoScripts)}
uses
 l3IntfUses
 , HTMLtoEVDWithURLTest
 , ddHTMLReader
;

type
 THTMLtoEVDWithApplyTextCorrections = {abstract} class(THTMLtoEVDWithURLTest)
  protected
   function GetFolder: AnsiString; override;
    {* ����� � ������� ������ ���� }
   function GetModelElementGUID: AnsiString; override;
    {* ������������� �������� ������, ������� ��������� ���� }
   procedure TuningReader(aHTMLReader: TddHTMLReader); override;
 end;//THTMLtoEVDWithApplyTextCorrections
{$IfEnd} // Defined(nsTest) AND NOT Defined(NoScripts)

implementation

{$If Defined(nsTest) AND NOT Defined(NoScripts)}
uses
 l3ImplUses
 , TestFrameWork
;

function THTMLtoEVDWithApplyTextCorrections.GetFolder: AnsiString;
 {* ����� � ������� ������ ���� }
begin
 Result := 'HTML';
end;//THTMLtoEVDWithApplyTextCorrections.GetFolder

function THTMLtoEVDWithApplyTextCorrections.GetModelElementGUID: AnsiString;
 {* ������������� �������� ������, ������� ��������� ���� }
begin
 Result := '56C1AB8700F9';
end;//THTMLtoEVDWithApplyTextCorrections.GetModelElementGUID

procedure THTMLtoEVDWithApplyTextCorrections.TuningReader(aHTMLReader: TddHTMLReader);
//#UC START# *56A613A30375_56C1AB8700F9_var*
//#UC END# *56A613A30375_56C1AB8700F9_var*
begin
//#UC START# *56A613A30375_56C1AB8700F9_impl*
 inherited TuningReader(aHTMLReader);
 aHTMLReader.ApplyTextCorrections := True;
//#UC END# *56A613A30375_56C1AB8700F9_impl*
end;//THTMLtoEVDWithApplyTextCorrections.TuningReader
{$IfEnd} // Defined(nsTest) AND NOT Defined(NoScripts)

end.
