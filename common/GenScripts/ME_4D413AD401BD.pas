unit SelectionCellTest;
 {* ���� �� ��������� ������. }

// ������: "w:\common\components\rtl\Garant\Daily\SelectionCellTest.pas"
// ���������: "TestCase"

{$Include TestDefine.inc.pas}

interface

{$If Defined(nsTest) AND NOT Defined(NoScripts)}
uses
 l3IntfUses
 {$If NOT Defined(NoVCM)}
 , TextViaEditorProcessor
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , PrimTextLoad_Form
 {$IfEnd} // NOT Defined(NoVCM)
 , evCustomEditorWindow
;

type
 _CursorMover_Parent_ = TTextViaEditorProcessor;
 {$Include CursorMover.imp.pas}
 _ClipboardOperations_Parent_ = _CursorMover_;
 {$Include ClipboardOperations.imp.pas}
 _SelectOperation_Parent_ = _ClipboardOperations_;
 {$Include SelectOperation.imp.pas}
 TSelectionCellTest = {abstract} class(_SelectOperation_)
  {* ���� �� ��������� ������. }
  protected
   {$If NOT Defined(NoVCM)}
   procedure Process(aForm: TPrimTextLoadForm); override;
    {* ���������� ������� ��������� ������ }
   {$IfEnd} // NOT Defined(NoVCM)
   function GetFolder: AnsiString; override;
    {* ����� � ������� ������ ���� }
   function GetModelElementGUID: AnsiString; override;
    {* ������������� �������� ������, ������� ��������� ���� }
 end;//TSelectionCellTest
{$IfEnd} // Defined(nsTest) AND NOT Defined(NoScripts)

implementation

{$If Defined(nsTest) AND NOT Defined(NoScripts)}
uses
 l3ImplUses
 , TestFrameWork
 , evMsgCode
 , evOp
 , l3Base
 , l3InternalInterfaces
 , evTypes
;

{$Include CursorMover.imp.pas}

{$Include ClipboardOperations.imp.pas}

{$Include SelectOperation.imp.pas}

{$If NOT Defined(NoVCM)}
procedure TSelectionCellTest.Process(aForm: TPrimTextLoadForm);
 {* ���������� ������� ��������� ������ }
//#UC START# *4BE13147032C_4D413AD401BD_var*
//#UC END# *4BE13147032C_4D413AD401BD_var*
begin
//#UC START# *4BE13147032C_4D413AD401BD_impl*
 aForm.Text.Selection.Cursor.Move(aForm.Text.View, ev_ocParaDown);
 SelectPara(aForm.Text);
 CopyAndPaste2DocumentBottom(aForm.Text);
//#UC END# *4BE13147032C_4D413AD401BD_impl*
end;//TSelectionCellTest.Process
{$IfEnd} // NOT Defined(NoVCM)

function TSelectionCellTest.GetFolder: AnsiString;
 {* ����� � ������� ������ ���� }
begin
 Result := 'EditorTests';
end;//TSelectionCellTest.GetFolder

function TSelectionCellTest.GetModelElementGUID: AnsiString;
 {* ������������� �������� ������, ������� ��������� ���� }
begin
 Result := '4D413AD401BD';
end;//TSelectionCellTest.GetModelElementGUID
{$IfEnd} // Defined(nsTest) AND NOT Defined(NoScripts)

end.
