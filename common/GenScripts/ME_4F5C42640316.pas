unit K336663851;
 {* [RequestLink:336663851] }

// ������: "w:\common\components\rtl\Garant\Daily\K336663851.pas"
// ���������: "TestCase"

{$Include TestDefine.inc.pas}

interface

{$If Defined(nsTest) AND NOT Defined(NoScripts)}
uses
 l3IntfUses
 {$If NOT Defined(NoVCM)}
 , PreviewTest
 {$IfEnd} // NOT Defined(NoVCM)
;

type
 TK336663851 = class(TPreviewTest)
  {* [RequestLink:336663851] }
  protected
   function GetFolder: AnsiString; override;
    {* ����� � ������� ������ ���� }
   function GetModelElementGUID: AnsiString; override;
    {* ������������� �������� ������, ������� ��������� ���� }
 end;//TK336663851
{$IfEnd} // Defined(nsTest) AND NOT Defined(NoScripts)

implementation

{$If Defined(nsTest) AND NOT Defined(NoScripts)}
uses
 l3ImplUses
 , TestFrameWork
;

function TK336663851.GetFolder: AnsiString;
 {* ����� � ������� ������ ���� }
begin
 Result := '7.7 Lulin';
end;//TK336663851.GetFolder

function TK336663851.GetModelElementGUID: AnsiString;
 {* ������������� �������� ������, ������� ��������� ���� }
begin
 Result := '4F5C42640316';
end;//TK336663851.GetModelElementGUID

initialization
 TestFramework.RegisterTest(TK336663851.Suite);
{$IfEnd} // Defined(nsTest) AND NOT Defined(NoScripts)

end.
