unit InsertStreamTestWithImplementedNavigate;
 {* �� �� ��� � TInsertStreamTest, �� � ������ Navigate }

// ������: "w:\common\components\rtl\Garant\Daily\InsertStreamTestWithImplementedNavigate.pas"
// ���������: "TestCase"

{$Include TestDefine.inc.pas}

interface

{$If Defined(nsTest) AND NOT Defined(NoScripts)}
uses
 l3IntfUses
 , InsertStreamTest
 , evCustomEditorWindow
 , l3Variant
;

type
 TInsertStreamTestWithImplementedNavigate = {abstract} class(TInsertStreamTest)
  {* �� �� ��� � TInsertStreamTest, �� � ������ Navigate }
  protected
   procedure Navigate(aText: TevCustomEditorWindow;
    const anOp: Il3OpPack); override;
    {* ������������� ������ ��� ��������� }
   function GetFolder: AnsiString; override;
    {* ����� � ������� ������ ���� }
   function GetModelElementGUID: AnsiString; override;
    {* ������������� �������� ������, ������� ��������� ���� }
 end;//TInsertStreamTestWithImplementedNavigate
{$IfEnd} // Defined(nsTest) AND NOT Defined(NoScripts)

implementation

{$If Defined(nsTest) AND NOT Defined(NoScripts)}
uses
 l3ImplUses
 , TestFrameWork
;

procedure TInsertStreamTestWithImplementedNavigate.Navigate(aText: TevCustomEditorWindow;
 const anOp: Il3OpPack);
 {* ������������� ������ ��� ��������� }
//#UC START# *4C4FE56300FB_4C501582010E_var*
//#UC END# *4C4FE56300FB_4C501582010E_var*
begin
//#UC START# *4C4FE56300FB_4C501582010E_impl*
 // - ������ �� ������
//#UC END# *4C4FE56300FB_4C501582010E_impl*
end;//TInsertStreamTestWithImplementedNavigate.Navigate

function TInsertStreamTestWithImplementedNavigate.GetFolder: AnsiString;
 {* ����� � ������� ������ ���� }
begin
 Result := 'EditorTests';
end;//TInsertStreamTestWithImplementedNavigate.GetFolder

function TInsertStreamTestWithImplementedNavigate.GetModelElementGUID: AnsiString;
 {* ������������� �������� ������, ������� ��������� ���� }
begin
 Result := '4C501582010E';
end;//TInsertStreamTestWithImplementedNavigate.GetModelElementGUID
{$IfEnd} // Defined(nsTest) AND NOT Defined(NoScripts)

end.
