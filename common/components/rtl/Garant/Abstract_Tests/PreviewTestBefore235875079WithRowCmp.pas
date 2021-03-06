unit PreviewTestBefore235875079WithRowCmp;

// ������: "w:\common\components\rtl\Garant\Abstract_Tests\PreviewTestBefore235875079WithRowCmp.pas"
// ���������: "TestCase"
// ������� ������: "TPreviewTestBefore235875079WithRowCmp" MUID: (4DF88322024C)

{$Include w:\common\components\rtl\Garant\Abstract_Tests\TestDefine.inc.pas}

interface

{$If Defined(nsTest) AND NOT Defined(NoScripts)}
uses
 l3IntfUses
 {$If NOT Defined(NoVCM)}
 , PreviewTestBefore235875079
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , PrimTextLoad_Form
 {$IfEnd} // NOT Defined(NoVCM)
;

type
 _PrintRowCompare_Parent_ = TPreviewTestBefore235875079;
 {$Include w:\common\components\gui\Garant\Everest\EditorUsers\PrintRowCompare.imp.pas}
 TPreviewTestBefore235875079WithRowCmp = {abstract} class(_PrintRowCompare_)
  protected
   {$If NOT Defined(NoVCM)}
   procedure DoVisit(aForm: TPrimTextLoadForm); override;
    {* ���������� ����� }
   {$IfEnd} // NOT Defined(NoVCM)
   function GetFolder: AnsiString; override;
    {* ����� � ������� ������ ���� }
   function GetModelElementGUID: AnsiString; override;
    {* ������������� �������� ������, ������� ��������� ���� }
 end;//TPreviewTestBefore235875079WithRowCmp
{$IfEnd} // Defined(nsTest) AND NOT Defined(NoScripts)

implementation

{$If Defined(nsTest) AND NOT Defined(NoScripts)}
uses
 l3ImplUses
 , SysUtils
 , PrintRowHeightsSpy
 , TestFrameWork
 {$If NOT Defined(NoVCM)}
 , vcmBase
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCL)}
 , Forms
 {$IfEnd} // NOT Defined(NoVCL)
 , l3Base
 //#UC START# *4DF88322024Cimpl_uses*
 //#UC END# *4DF88322024Cimpl_uses*
;

{$If NOT Defined(NoVCM)}
{$Include w:\common\components\gui\Garant\Everest\EditorUsers\PrintRowCompare.imp.pas}

procedure TPreviewTestBefore235875079WithRowCmp.DoVisit(aForm: TPrimTextLoadForm);
 {* ���������� ����� }
//#UC START# *4BE419AF0217_4DF88322024C_var*
var
 l_OldName: string;
 l_LogName: string;
//#UC END# *4BE419AF0217_4DF88322024C_var*
begin
//#UC START# *4BE419AF0217_4DF88322024C_impl*
 l_LogName := OutputPath + KPage + '.rowh';
 TPrintRowHeightsSpy.Instance.StartLogging(l_LogName);
 try
  inherited DoVisit(aForm);
 finally
  TPrintRowHeightsSpy.Instance.StopLogging;
 end;
 l_OldName := f_CurrentOutput;
 try
  f_CurrentOutput := l_LogName;
  CheckOutputWithInput(ChangeFileExt(ExtractFileName(l_LogName), EtalonSuffix + '.rowh'));
 finally
  f_CurrentOutput := l_OldName;
 end;
//#UC END# *4BE419AF0217_4DF88322024C_impl*
end;//TPreviewTestBefore235875079WithRowCmp.DoVisit

function TPreviewTestBefore235875079WithRowCmp.GetFolder: AnsiString;
 {* ����� � ������� ������ ���� }
begin
 Result := 'EditorTests';
end;//TPreviewTestBefore235875079WithRowCmp.GetFolder

function TPreviewTestBefore235875079WithRowCmp.GetModelElementGUID: AnsiString;
 {* ������������� �������� ������, ������� ��������� ���� }
begin
 Result := '4DF88322024C';
end;//TPreviewTestBefore235875079WithRowCmp.GetModelElementGUID
{$IfEnd} // NOT Defined(NoVCM)

{$IfEnd} // Defined(nsTest) AND NOT Defined(NoScripts)
end.
