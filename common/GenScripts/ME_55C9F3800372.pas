unit TTreeNodeForTestsWordsPack;

// ������: "w:\common\components\rtl\Garant\DUnit_Script_Support\TTreeNodeForTestsWordsPack.pas"
// ���������: "ScriptKeywordsPack"

{$Include dsDefine.inc}

interface

{$If Defined(nsTest) AND NOT Defined(NoScripts) AND NOT Defined(NoVCL)}
uses
 l3IntfUses
 , ComCtrls
 , tfwAxiomaticsResNameGetter
 , tfwClassLike
 , tfwScriptingInterfaces
 , TypInfo
;
{$IfEnd} // Defined(nsTest) AND NOT Defined(NoScripts) AND NOT Defined(NoVCL)

implementation

{$If Defined(nsTest) AND NOT Defined(NoScripts) AND NOT Defined(NoVCL)}
uses
 l3ImplUses
 , FolderSupport
 , tfwScriptingTypes
 , tfwTypeRegistrator
 , SysUtils
;

type
 //#UC START# *CE36BAE2E068ci*
 //#UC END# *CE36BAE2E068ci*
 //#UC START# *CE36BAE2E068cit*
 //#UC END# *CE36BAE2E068cit*
 TTTreeNodeForTestsWordsPackResNameGetter = {final} class(TtfwAxiomaticsResNameGetter)
  {* ����������� ������������ ����������� }
  public
   class function ResName: AnsiString; override;
 //#UC START# *CE36BAE2E068publ*
 //#UC END# *CE36BAE2E068publ*
 end;//TTTreeNodeForTestsWordsPackResNameGetter

 TkwPopTreeNodeIsNodeFolder = {final} class(TtfwClassLike)
  {* ����� ������� pop:TreeNode:IsNodeFolder
*��� ����������:* Boolean
*������:*
[code]
BOOLEAN VAR l_Boolean
 aTreeNode pop:TreeNode:IsNodeFolder >>> l_Boolean
[code]  }
  private
   function IsNodeFolder(const aCtx: TtfwContext;
    aTreeNode: TTreeNode): Boolean;
    {* ���������� ����� ������� pop:TreeNode:IsNodeFolder }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
  public
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
 end;//TkwPopTreeNodeIsNodeFolder

class function TTTreeNodeForTestsWordsPackResNameGetter.ResName: AnsiString;
begin
  Result := 'TTreeNodeForTestsWordsPack';
end;//TTTreeNodeForTestsWordsPackResNameGetter.ResName

 {$R TTreeNodeForTestsWordsPack.res}

function TkwPopTreeNodeIsNodeFolder.IsNodeFolder(const aCtx: TtfwContext;
 aTreeNode: TTreeNode): Boolean;
 {* ���������� ����� ������� pop:TreeNode:IsNodeFolder }
//#UC START# *B5879A320542_565CDF98FF94_var*
//#UC END# *B5879A320542_565CDF98FF94_var*
begin
//#UC START# *B5879A320542_565CDF98FF94_impl*
 Result := FolderSupport.IsNodeFolder(aTreeNode);
//#UC END# *B5879A320542_565CDF98FF94_impl*
end;//TkwPopTreeNodeIsNodeFolder.IsNodeFolder

procedure TkwPopTreeNodeIsNodeFolder.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_565CDF98FF94_var*
//#UC END# *4DAEEDE10285_565CDF98FF94_var*
begin
//#UC START# *4DAEEDE10285_565CDF98FF94_impl*
 !!! Needs to be implemented !!!
//#UC END# *4DAEEDE10285_565CDF98FF94_impl*
end;//TkwPopTreeNodeIsNodeFolder.DoDoIt

class function TkwPopTreeNodeIsNodeFolder.GetWordNameForRegister: AnsiString;
begin
 Result := 'pop:TreeNode:IsNodeFolder';
end;//TkwPopTreeNodeIsNodeFolder.GetWordNameForRegister

function TkwPopTreeNodeIsNodeFolder.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
//#UC START# *551544E2001A_565CDF98FF94_var*
//#UC END# *551544E2001A_565CDF98FF94_var*
begin
//#UC START# *551544E2001A_565CDF98FF94_impl*
 !!! Needs to be implemented !!!
//#UC END# *551544E2001A_565CDF98FF94_impl*
end;//TkwPopTreeNodeIsNodeFolder.GetResultTypeInfo

function TkwPopTreeNodeIsNodeFolder.GetAllParamsCount(const aCtx: TtfwContext): Integer;
//#UC START# *559687E6025A_565CDF98FF94_var*
//#UC END# *559687E6025A_565CDF98FF94_var*
begin
//#UC START# *559687E6025A_565CDF98FF94_impl*
 !!! Needs to be implemented !!!
//#UC END# *559687E6025A_565CDF98FF94_impl*
end;//TkwPopTreeNodeIsNodeFolder.GetAllParamsCount

function TkwPopTreeNodeIsNodeFolder.ParamsTypes: PTypeInfoArray;
//#UC START# *5617F4D00243_565CDF98FF94_var*
//#UC END# *5617F4D00243_565CDF98FF94_var*
begin
//#UC START# *5617F4D00243_565CDF98FF94_impl*
 !!! Needs to be implemented !!!
//#UC END# *5617F4D00243_565CDF98FF94_impl*
end;//TkwPopTreeNodeIsNodeFolder.ParamsTypes

initialization
 TTTreeNodeForTestsWordsPackResNameGetter.Register;
 {* ����������� ������������ ����������� }
 TkwPopTreeNodeIsNodeFolder.RegisterInEngine;
 {* ����������� pop_TreeNode_IsNodeFolder }
 TtfwTypeRegistrator.RegisterType(@tfw_tiStruct);
 {* ����������� ���� TtfwContext }
 TtfwTypeRegistrator.RegisterType(TypeInfo(TTreeNode));
 {* ����������� ���� TTreeNode }
 TtfwTypeRegistrator.RegisterType(TypeInfo(Boolean));
 {* ����������� ���� Boolean }
{$IfEnd} // Defined(nsTest) AND NOT Defined(NoScripts) AND NOT Defined(NoVCL)

end.
