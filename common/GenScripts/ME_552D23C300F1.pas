unit CheckListBoxWordsPack;

// ������: "w:\common\components\rtl\Garant\ScriptEngine\CheckListBoxWordsPack.pas"
// ���������: "ScriptKeywordsPack"

{$Include seDefine.inc}

interface

{$If NOT Defined(NoScripts)}
uses
 l3IntfUses
 {$If NOT Defined(NoVCL)}
 , CheckLst
 {$IfEnd} // NOT Defined(NoVCL)
 , tfwClassLike
 , tfwScriptingInterfaces
 , TypInfo
;
{$IfEnd} // NOT Defined(NoScripts)

implementation

{$If NOT Defined(NoScripts)}
uses
 l3ImplUses
 , tfwScriptingTypes
 , tfwTypeRegistrator
 , SysUtils
;

type
 TkwPopCheckListBoxGetChecked = {final} class(TtfwClassLike)
  {* ����� ������� pop:CheckListBox:GetChecked
[panel]anIndex aCheckBoxList pop:CheckListBox:GetChecked
anIndex - ������ CheckBox'�
aCheckBoxList  - �������
���������� True, ���� ������� ������� � False - ���� ���.[panel]
*��� ����������:* Boolean
*������:*
[code]
BOOLEAN VAR l_Boolean
 anIndex aCheckListBox pop:CheckListBox:GetChecked >>> l_Boolean
[code]  }
  private
   function GetChecked(const aCtx: TtfwContext;
    aCheckListBox: TCheckListBox;
    anIndex: Integer): Boolean;
    {* ���������� ����� ������� pop:CheckListBox:GetChecked }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
  public
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
 end;//TkwPopCheckListBoxGetChecked

 TkwPopCheckListBoxSetChecked = {final} class(TtfwClassLike)
  {* ����� ������� pop:CheckListBox:SetChecked
[panel]aValue anIndex aCheckBoxList pop:CheckListBox:SetChecked
anIndex - ������ CheckBox'�
aCheckBoxList  - �������
�������� �������, ���� aValue = True � ���������� �������, ���� aValue = False[panel]
*������:*
[code]
 aValue anIndex aCheckListBox pop:CheckListBox:SetChecked
[code]  }
  private
   procedure SetChecked(const aCtx: TtfwContext;
    aCheckListBox: TCheckListBox;
    anIndex: Integer;
    aValue: Boolean);
    {* ���������� ����� ������� pop:CheckListBox:SetChecked }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
  public
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
 end;//TkwPopCheckListBoxSetChecked

 TkwPopCheckListBoxUncheckAll = {final} class(TtfwClassLike)
  {* ����� ������� pop:CheckListBox:UncheckAll
[panel]aCheckBoxList pop:CheckListBox:UncheckAll
��������� ������� � ���� ������� ��������.[panel]
*������:*
[code]
 aCheckListBox pop:CheckListBox:UncheckAll
[code]  }
  private
   procedure UncheckAll(const aCtx: TtfwContext;
    aCheckListBox: TCheckListBox);
    {* ���������� ����� ������� pop:CheckListBox:UncheckAll }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
  public
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
 end;//TkwPopCheckListBoxUncheckAll

function TkwPopCheckListBoxGetChecked.GetChecked(const aCtx: TtfwContext;
 aCheckListBox: TCheckListBox;
 anIndex: Integer): Boolean;
 {* ���������� ����� ������� pop:CheckListBox:GetChecked }
//#UC START# *5C7C4E6C6645_61EE94402745_var*
//#UC END# *5C7C4E6C6645_61EE94402745_var*
begin
//#UC START# *5C7C4E6C6645_61EE94402745_impl*
 Result := aCheckListBox.Checked[anIndex];
//#UC END# *5C7C4E6C6645_61EE94402745_impl*
end;//TkwPopCheckListBoxGetChecked.GetChecked

procedure TkwPopCheckListBoxGetChecked.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_61EE94402745_var*
//#UC END# *4DAEEDE10285_61EE94402745_var*
begin
//#UC START# *4DAEEDE10285_61EE94402745_impl*
 !!! Needs to be implemented !!!
//#UC END# *4DAEEDE10285_61EE94402745_impl*
end;//TkwPopCheckListBoxGetChecked.DoDoIt

class function TkwPopCheckListBoxGetChecked.GetWordNameForRegister: AnsiString;
begin
 Result := 'pop:CheckListBox:GetChecked';
end;//TkwPopCheckListBoxGetChecked.GetWordNameForRegister

function TkwPopCheckListBoxGetChecked.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
begin
 Result := TypeInfo(Boolean);
end;//TkwPopCheckListBoxGetChecked.GetResultTypeInfo

function TkwPopCheckListBoxGetChecked.GetAllParamsCount(const aCtx: TtfwContext): Integer;
begin
 Result := 2;
end;//TkwPopCheckListBoxGetChecked.GetAllParamsCount

function TkwPopCheckListBoxGetChecked.ParamsTypes: PTypeInfoArray;
//#UC START# *5617F4D00243_61EE94402745_var*
//#UC END# *5617F4D00243_61EE94402745_var*
begin
//#UC START# *5617F4D00243_61EE94402745_impl*
 !!! Needs to be implemented !!!
//#UC END# *5617F4D00243_61EE94402745_impl*
end;//TkwPopCheckListBoxGetChecked.ParamsTypes

procedure TkwPopCheckListBoxSetChecked.SetChecked(const aCtx: TtfwContext;
 aCheckListBox: TCheckListBox;
 anIndex: Integer;
 aValue: Boolean);
 {* ���������� ����� ������� pop:CheckListBox:SetChecked }
//#UC START# *AEDB5415872F_CA2863D28A34_var*
//#UC END# *AEDB5415872F_CA2863D28A34_var*
begin
//#UC START# *AEDB5415872F_CA2863D28A34_impl*
 aCheckListBox.Checked[anIndex] := aValue;
//#UC END# *AEDB5415872F_CA2863D28A34_impl*
end;//TkwPopCheckListBoxSetChecked.SetChecked

procedure TkwPopCheckListBoxSetChecked.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_CA2863D28A34_var*
//#UC END# *4DAEEDE10285_CA2863D28A34_var*
begin
//#UC START# *4DAEEDE10285_CA2863D28A34_impl*
 !!! Needs to be implemented !!!
//#UC END# *4DAEEDE10285_CA2863D28A34_impl*
end;//TkwPopCheckListBoxSetChecked.DoDoIt

class function TkwPopCheckListBoxSetChecked.GetWordNameForRegister: AnsiString;
begin
 Result := 'pop:CheckListBox:SetChecked';
end;//TkwPopCheckListBoxSetChecked.GetWordNameForRegister

function TkwPopCheckListBoxSetChecked.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
begin
 Result := @tfw_tiVoid;
end;//TkwPopCheckListBoxSetChecked.GetResultTypeInfo

function TkwPopCheckListBoxSetChecked.GetAllParamsCount(const aCtx: TtfwContext): Integer;
begin
 Result := 3;
end;//TkwPopCheckListBoxSetChecked.GetAllParamsCount

function TkwPopCheckListBoxSetChecked.ParamsTypes: PTypeInfoArray;
//#UC START# *5617F4D00243_CA2863D28A34_var*
//#UC END# *5617F4D00243_CA2863D28A34_var*
begin
//#UC START# *5617F4D00243_CA2863D28A34_impl*
 !!! Needs to be implemented !!!
//#UC END# *5617F4D00243_CA2863D28A34_impl*
end;//TkwPopCheckListBoxSetChecked.ParamsTypes

procedure TkwPopCheckListBoxUncheckAll.UncheckAll(const aCtx: TtfwContext;
 aCheckListBox: TCheckListBox);
 {* ���������� ����� ������� pop:CheckListBox:UncheckAll }
//#UC START# *9D7C5A3CC63F_CC902BB857AE_var*
var
 i: Integer;
//#UC END# *9D7C5A3CC63F_CC902BB857AE_var*
begin
//#UC START# *9D7C5A3CC63F_CC902BB857AE_impl*
 for i := 0 to aCheckListBox.Count - 1 do
  aCheckListBox.Checked[i] := False;
//#UC END# *9D7C5A3CC63F_CC902BB857AE_impl*
end;//TkwPopCheckListBoxUncheckAll.UncheckAll

procedure TkwPopCheckListBoxUncheckAll.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_CC902BB857AE_var*
//#UC END# *4DAEEDE10285_CC902BB857AE_var*
begin
//#UC START# *4DAEEDE10285_CC902BB857AE_impl*
 !!! Needs to be implemented !!!
//#UC END# *4DAEEDE10285_CC902BB857AE_impl*
end;//TkwPopCheckListBoxUncheckAll.DoDoIt

class function TkwPopCheckListBoxUncheckAll.GetWordNameForRegister: AnsiString;
begin
 Result := 'pop:CheckListBox:UncheckAll';
end;//TkwPopCheckListBoxUncheckAll.GetWordNameForRegister

function TkwPopCheckListBoxUncheckAll.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
begin
 Result := @tfw_tiVoid;
end;//TkwPopCheckListBoxUncheckAll.GetResultTypeInfo

function TkwPopCheckListBoxUncheckAll.GetAllParamsCount(const aCtx: TtfwContext): Integer;
begin
 Result := 1;
end;//TkwPopCheckListBoxUncheckAll.GetAllParamsCount

function TkwPopCheckListBoxUncheckAll.ParamsTypes: PTypeInfoArray;
//#UC START# *5617F4D00243_CC902BB857AE_var*
//#UC END# *5617F4D00243_CC902BB857AE_var*
begin
//#UC START# *5617F4D00243_CC902BB857AE_impl*
 !!! Needs to be implemented !!!
//#UC END# *5617F4D00243_CC902BB857AE_impl*
end;//TkwPopCheckListBoxUncheckAll.ParamsTypes

initialization
 TkwPopCheckListBoxGetChecked.RegisterInEngine;
 {* ����������� pop_CheckListBox_GetChecked }
 TkwPopCheckListBoxSetChecked.RegisterInEngine;
 {* ����������� pop_CheckListBox_SetChecked }
 TkwPopCheckListBoxUncheckAll.RegisterInEngine;
 {* ����������� pop_CheckListBox_UncheckAll }
 TtfwTypeRegistrator.RegisterType(@tfw_tiStruct);
 {* ����������� ���� TtfwContext }
 TtfwTypeRegistrator.RegisterType(TypeInfo(TCheckListBox));
 {* ����������� ���� TCheckListBox }
 TtfwTypeRegistrator.RegisterType(TypeInfo(Integer));
 {* ����������� ���� Integer }
 TtfwTypeRegistrator.RegisterType(TypeInfo(Boolean));
 {* ����������� ���� Boolean }
{$IfEnd} // NOT Defined(NoScripts)

end.
