unit CopyPasteTest;
 {* ���� �����������/������� ����� ����� ������ }

// ������: "w:\common\components\rtl\Garant\Daily\CopyPasteTest.pas"
// ���������: "TestCase"

{$Include TestDefine.inc.pas}

interface

{$If Defined(nsTest) AND NOT Defined(NoScripts)}
uses
 l3IntfUses
 {$If NOT Defined(NoVCM)}
 , TextViaEditorProcessor
 {$IfEnd} // NOT Defined(NoVCM)
 , nevTools
 , evCustomEditorWindow
 , l3Variant
 {$If NOT Defined(NoVCM)}
 , PrimTextLoad_Form
 {$IfEnd} // NOT Defined(NoVCM)
;

type
 _CursorMover_Parent_ = TTextViaEditorProcessor;
 {$Include CursorMover.imp.pas}
 _ClipboardOperations_Parent_ = _CursorMover_;
 {$Include ClipboardOperations.imp.pas}
 TCopyPasteTest = {abstract} class(_ClipboardOperations_)
  {* ���� �����������/������� ����� ����� ������ }
  protected
   function DoSelect(aText: TevCustomEditorWindow;
    const anOp: Il3OpPack): InevRange; virtual; abstract;
    {* �������� ����� � ��������� }
   {$If NOT Defined(NoVCM)}
   procedure Process(aForm: TPrimTextLoadForm); override;
    {* ���������� ������� ��������� ������ }
   {$IfEnd} // NOT Defined(NoVCM)
   function GetFolder: AnsiString; override;
    {* ����� � ������� ������ ���� }
   function GetModelElementGUID: AnsiString; override;
    {* ������������� �������� ������, ������� ��������� ���� }
 end;//TCopyPasteTest
{$IfEnd} // Defined(nsTest) AND NOT Defined(NoScripts)

implementation

{$If Defined(nsTest) AND NOT Defined(NoScripts)}
uses
 l3ImplUses
 , k2Prim
 , evTypes
 , TestFrameWork
 , evMsgCode
 , evOp
 , l3Base
 , l3InternalInterfaces
;

{$Include CursorMover.imp.pas}

{$Include ClipboardOperations.imp.pas}

{$If NOT Defined(NoVCM)}
procedure TCopyPasteTest.Process(aForm: TPrimTextLoadForm);
 {* ���������� ������� ��������� ������ }
//#UC START# *4BE13147032C_4C93529B018C_var*
var
 l_Op : Il3OpPack;
 l_Selection : InevSelection;
 l_Range : InevRange;
//#UC END# *4BE13147032C_4C93529B018C_var*
begin
//#UC START# *4BE13147032C_4C93529B018C_impl*
 with aForm.Text do
 begin
  l_Op := StartOp;
  try
   l_Selection := Selection;
   if (l_Selection <> nil) then
   begin
    l_Range := DoSelect(aForm.Text, l_Op);
    l_Selection.Select(l_Range, false);
    Assert(not aForm.Text.Selection.Collapsed);
    CopyToClipboard(aForm.Text);
    Select(ev_stDocument);
    Self.PasteFromClipboard(aForm.Text);
    ClearClipboard;
   end; // if (l_Selection <> nil) then
  finally
   l_Op := nil;
  end;//try..finally
 end;//aForm.Text
//#UC END# *4BE13147032C_4C93529B018C_impl*
end;//TCopyPasteTest.Process
{$IfEnd} // NOT Defined(NoVCM)

function TCopyPasteTest.GetFolder: AnsiString;
 {* ����� � ������� ������ ���� }
begin
 Result := 'EditorTests';
end;//TCopyPasteTest.GetFolder

function TCopyPasteTest.GetModelElementGUID: AnsiString;
 {* ������������� �������� ������, ������� ��������� ���� }
begin
 Result := '4C93529B018C';
end;//TCopyPasteTest.GetModelElementGUID
{$IfEnd} // Defined(nsTest) AND NOT Defined(NoScripts)

end.
