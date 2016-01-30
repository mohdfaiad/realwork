unit TevCustomEditorWordsPack;

// ������: "w:\common\components\rtl\Garant\ScriptEngine\TevCustomEditorWordsPack.pas"
// ���������: "ScriptKeywordsPack"

{$Include seDefine.inc}

interface

{$If NOT Defined(NoScripts)}
uses
 l3IntfUses
 , evCustomEditor
 , evEditorInterfaces
 , evdTypes
 , tfwAxiomaticsResNameGetter
 , tfwClassLike
 , tfwScriptingInterfaces
 , TypInfo
;
{$IfEnd} // NOT Defined(NoScripts)

implementation

{$If NOT Defined(NoScripts)}
uses
 l3ImplUses
 , l3Interfaces
 , IedRangeWordsPack
 , tfwScriptingTypes
 , tfwTypeRegistrator
 , SysUtils
;

type
 //#UC START# *D2EC9F607FB9ci*
 //#UC END# *D2EC9F607FB9ci*
 //#UC START# *D2EC9F607FB9cit*
 //#UC END# *D2EC9F607FB9cit*
 TTevCustomEditorWordsPackResNameGetter = {final} class(TtfwAxiomaticsResNameGetter)
  {* ����������� ������������ ����������� }
  public
   class function ResName: AnsiString; override;
 //#UC START# *D2EC9F607FB9publ*
 //#UC END# *D2EC9F607FB9publ*
 end;//TTevCustomEditorWordsPackResNameGetter

 TkwPopEditorInsertTable = {final} class(TtfwClassLike)
  {* ����� ������� pop:Editor:InsertTable
*������:*
[code]
 aColNum aRowNum aEditor pop:Editor:InsertTable
[code]  }
  private
   procedure InsertTable(const aCtx: TtfwContext;
    aEditor: TevCustomEditor;
    aRowNum: Integer;
    aColNum: Integer);
    {* ���������� ����� ������� pop:Editor:InsertTable }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
  public
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
 end;//TkwPopEditorInsertTable

 TkwPopEditorInsertRow = {final} class(TtfwClassLike)
  {* ����� ������� pop:Editor:InsertRow
*������:*
[code]
 aEditor pop:Editor:InsertRow
[code]  }
  private
   procedure InsertRow(const aCtx: TtfwContext;
    aEditor: TevCustomEditor);
    {* ���������� ����� ������� pop:Editor:InsertRow }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
  public
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
 end;//TkwPopEditorInsertRow

 TkwPopEditorDeleteRow = {final} class(TtfwClassLike)
  {* ����� ������� pop:Editor:DeleteRow
*������:*
[code]
 aEditor pop:Editor:DeleteRow
[code]  }
  private
   procedure DeleteRow(const aCtx: TtfwContext;
    aEditor: TevCustomEditor);
    {* ���������� ����� ������� pop:Editor:DeleteRow }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
  public
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
 end;//TkwPopEditorDeleteRow

 TkwPopEditorInsertColumn = {final} class(TtfwClassLike)
  {* ����� ������� pop:Editor:InsertColumn
*������:*
[code]
 aEditor pop:Editor:InsertColumn
[code]  }
  private
   procedure InsertColumn(const aCtx: TtfwContext;
    aEditor: TevCustomEditor);
    {* ���������� ����� ������� pop:Editor:InsertColumn }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
  public
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
 end;//TkwPopEditorInsertColumn

 TkwPopEditorDeleteColumn = {final} class(TtfwClassLike)
  {* ����� ������� pop:Editor:DeleteColumn
*������:*
[code]
 aEditor pop:Editor:DeleteColumn
[code]  }
  private
   procedure DeleteColumn(const aCtx: TtfwContext;
    aEditor: TevCustomEditor);
    {* ���������� ����� ������� pop:Editor:DeleteColumn }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
  public
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
 end;//TkwPopEditorDeleteColumn

 TkwPopEditorMergeCells = {final} class(TtfwClassLike)
  {* ����� ������� pop:Editor:MergeCells
*������:*
[code]
 anAlgorytm aEditor pop:Editor:MergeCells
[code]  }
  private
   procedure MergeCells(const aCtx: TtfwContext;
    aEditor: TevCustomEditor;
    anAlgorytm: TedMergeAlgorythm);
    {* ���������� ����� ������� pop:Editor:MergeCells }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
  public
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
 end;//TkwPopEditorMergeCells

 TkwPopEditorSplitCell = {final} class(TtfwClassLike)
  {* ����� ������� pop:Editor:SplitCell
*������:*
[code]
 aVert aEditor pop:Editor:SplitCell
[code]  }
  private
   procedure SplitCell(const aCtx: TtfwContext;
    aEditor: TevCustomEditor;
    aVert: Boolean);
    {* ���������� ����� ������� pop:Editor:SplitCell }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
  public
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
 end;//TkwPopEditorSplitCell

 TkwPopEditorSplitTable = {final} class(TtfwClassLike)
  {* ����� ������� pop:Editor:SplitTable
*������:*
[code]
 aEditor pop:Editor:SplitTable
[code]  }
  private
   procedure SplitTable(const aCtx: TtfwContext;
    aEditor: TevCustomEditor);
    {* ���������� ����� ������� pop:Editor:SplitTable }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
  public
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
 end;//TkwPopEditorSplitTable

 TkwPopEditorMergeTables = {final} class(TtfwClassLike)
  {* ����� ������� pop:Editor:MergeTables
*������:*
[code]
 aEditor pop:Editor:MergeTables
[code]  }
  private
   procedure MergeTables(const aCtx: TtfwContext;
    aEditor: TevCustomEditor);
    {* ���������� ����� ������� pop:Editor:MergeTables }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
  public
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
 end;//TkwPopEditorMergeTables

 TkwPopEditorInsertSectionBreak = {final} class(TtfwClassLike)
  {* ����� ������� pop:Editor:InsertSectionBreak
*������:*
[code]
 aPageOrientation aEditor pop:Editor:InsertSectionBreak
[code]  }
  private
   procedure InsertSectionBreak(const aCtx: TtfwContext;
    aEditor: TevCustomEditor;
    aPageOrientation: TevPageOrientation);
    {* ���������� ����� ������� pop:Editor:InsertSectionBreak }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
  public
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
 end;//TkwPopEditorInsertSectionBreak

 TkwPopEditorPrevHyperlink = {final} class(TtfwClassLike)
  {* ����� ������� pop:Editor:PrevHyperlink
*������:*
[code]
 aEditor pop:Editor:PrevHyperlink
[code]  }
  private
   procedure PrevHyperlink(const aCtx: TtfwContext;
    aEditor: TevCustomEditor);
    {* ���������� ����� ������� pop:Editor:PrevHyperlink }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
  public
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
 end;//TkwPopEditorPrevHyperlink

 TkwPopEditorNextHyperlink = {final} class(TtfwClassLike)
  {* ����� ������� pop:Editor:NextHyperlink
*������:*
[code]
 aEditor pop:Editor:NextHyperlink
[code]  }
  private
   procedure NextHyperlink(const aCtx: TtfwContext;
    aEditor: TevCustomEditor);
    {* ���������� ����� ������� pop:Editor:NextHyperlink }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
  public
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
 end;//TkwPopEditorNextHyperlink

 TkwPopEditorRange = {final} class(TtfwClassLike)
  {* ����� ������� pop:Editor:Range
*��� ����������:* IedRange
*������:*
[code]
INTERFACE VAR l_IedRange
 aEditor pop:Editor:Range >>> l_IedRange
[code]  }
  private
   function Range(const aCtx: TtfwContext;
    aEditor: TevCustomEditor): IedRange;
    {* ���������� ����� ������� pop:Editor:Range }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
  public
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
 end;//TkwPopEditorRange

class function TTevCustomEditorWordsPackResNameGetter.ResName: AnsiString;
begin
  Result := 'TevCustomEditorWordsPack';
end;//TTevCustomEditorWordsPackResNameGetter.ResName

 {$R TevCustomEditorWordsPack.res}

procedure TkwPopEditorInsertTable.InsertTable(const aCtx: TtfwContext;
 aEditor: TevCustomEditor;
 aRowNum: Integer;
 aColNum: Integer);
 {* ���������� ����� ������� pop:Editor:InsertTable }
//#UC START# *2A65ED70712B_A1BCB5D9397E_var*
//#UC END# *2A65ED70712B_A1BCB5D9397E_var*
begin
//#UC START# *2A65ED70712B_A1BCB5D9397E_impl*
 aEditor.InsertTable(aColNum, aRowNum);
//#UC END# *2A65ED70712B_A1BCB5D9397E_impl*
end;//TkwPopEditorInsertTable.InsertTable

procedure TkwPopEditorInsertTable.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_A1BCB5D9397E_var*
//#UC END# *4DAEEDE10285_A1BCB5D9397E_var*
begin
//#UC START# *4DAEEDE10285_A1BCB5D9397E_impl*
 !!! Needs to be implemented !!!
//#UC END# *4DAEEDE10285_A1BCB5D9397E_impl*
end;//TkwPopEditorInsertTable.DoDoIt

class function TkwPopEditorInsertTable.GetWordNameForRegister: AnsiString;
begin
 Result := 'pop:Editor:InsertTable';
end;//TkwPopEditorInsertTable.GetWordNameForRegister

function TkwPopEditorInsertTable.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
//#UC START# *551544E2001A_A1BCB5D9397E_var*
//#UC END# *551544E2001A_A1BCB5D9397E_var*
begin
//#UC START# *551544E2001A_A1BCB5D9397E_impl*
 !!! Needs to be implemented !!!
//#UC END# *551544E2001A_A1BCB5D9397E_impl*
end;//TkwPopEditorInsertTable.GetResultTypeInfo

function TkwPopEditorInsertTable.GetAllParamsCount(const aCtx: TtfwContext): Integer;
//#UC START# *559687E6025A_A1BCB5D9397E_var*
//#UC END# *559687E6025A_A1BCB5D9397E_var*
begin
//#UC START# *559687E6025A_A1BCB5D9397E_impl*
 !!! Needs to be implemented !!!
//#UC END# *559687E6025A_A1BCB5D9397E_impl*
end;//TkwPopEditorInsertTable.GetAllParamsCount

function TkwPopEditorInsertTable.ParamsTypes: PTypeInfoArray;
//#UC START# *5617F4D00243_A1BCB5D9397E_var*
//#UC END# *5617F4D00243_A1BCB5D9397E_var*
begin
//#UC START# *5617F4D00243_A1BCB5D9397E_impl*
 !!! Needs to be implemented !!!
//#UC END# *5617F4D00243_A1BCB5D9397E_impl*
end;//TkwPopEditorInsertTable.ParamsTypes

procedure TkwPopEditorInsertRow.InsertRow(const aCtx: TtfwContext;
 aEditor: TevCustomEditor);
 {* ���������� ����� ������� pop:Editor:InsertRow }
//#UC START# *2836BE44B1CE_FD58A4635AC9_var*
//#UC END# *2836BE44B1CE_FD58A4635AC9_var*
begin
//#UC START# *2836BE44B1CE_FD58A4635AC9_impl*
 !!! Needs to be implemented !!!
//#UC END# *2836BE44B1CE_FD58A4635AC9_impl*
end;//TkwPopEditorInsertRow.InsertRow

procedure TkwPopEditorInsertRow.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_FD58A4635AC9_var*
//#UC END# *4DAEEDE10285_FD58A4635AC9_var*
begin
//#UC START# *4DAEEDE10285_FD58A4635AC9_impl*
 !!! Needs to be implemented !!!
//#UC END# *4DAEEDE10285_FD58A4635AC9_impl*
end;//TkwPopEditorInsertRow.DoDoIt

class function TkwPopEditorInsertRow.GetWordNameForRegister: AnsiString;
begin
 Result := 'pop:Editor:InsertRow';
end;//TkwPopEditorInsertRow.GetWordNameForRegister

function TkwPopEditorInsertRow.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
//#UC START# *551544E2001A_FD58A4635AC9_var*
//#UC END# *551544E2001A_FD58A4635AC9_var*
begin
//#UC START# *551544E2001A_FD58A4635AC9_impl*
 !!! Needs to be implemented !!!
//#UC END# *551544E2001A_FD58A4635AC9_impl*
end;//TkwPopEditorInsertRow.GetResultTypeInfo

function TkwPopEditorInsertRow.GetAllParamsCount(const aCtx: TtfwContext): Integer;
//#UC START# *559687E6025A_FD58A4635AC9_var*
//#UC END# *559687E6025A_FD58A4635AC9_var*
begin
//#UC START# *559687E6025A_FD58A4635AC9_impl*
 !!! Needs to be implemented !!!
//#UC END# *559687E6025A_FD58A4635AC9_impl*
end;//TkwPopEditorInsertRow.GetAllParamsCount

function TkwPopEditorInsertRow.ParamsTypes: PTypeInfoArray;
//#UC START# *5617F4D00243_FD58A4635AC9_var*
//#UC END# *5617F4D00243_FD58A4635AC9_var*
begin
//#UC START# *5617F4D00243_FD58A4635AC9_impl*
 !!! Needs to be implemented !!!
//#UC END# *5617F4D00243_FD58A4635AC9_impl*
end;//TkwPopEditorInsertRow.ParamsTypes

procedure TkwPopEditorDeleteRow.DeleteRow(const aCtx: TtfwContext;
 aEditor: TevCustomEditor);
 {* ���������� ����� ������� pop:Editor:DeleteRow }
//#UC START# *BC172019E079_9A0327B85C97_var*
//#UC END# *BC172019E079_9A0327B85C97_var*
begin
//#UC START# *BC172019E079_9A0327B85C97_impl*
 !!! Needs to be implemented !!!
//#UC END# *BC172019E079_9A0327B85C97_impl*
end;//TkwPopEditorDeleteRow.DeleteRow

procedure TkwPopEditorDeleteRow.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_9A0327B85C97_var*
//#UC END# *4DAEEDE10285_9A0327B85C97_var*
begin
//#UC START# *4DAEEDE10285_9A0327B85C97_impl*
 !!! Needs to be implemented !!!
//#UC END# *4DAEEDE10285_9A0327B85C97_impl*
end;//TkwPopEditorDeleteRow.DoDoIt

class function TkwPopEditorDeleteRow.GetWordNameForRegister: AnsiString;
begin
 Result := 'pop:Editor:DeleteRow';
end;//TkwPopEditorDeleteRow.GetWordNameForRegister

function TkwPopEditorDeleteRow.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
//#UC START# *551544E2001A_9A0327B85C97_var*
//#UC END# *551544E2001A_9A0327B85C97_var*
begin
//#UC START# *551544E2001A_9A0327B85C97_impl*
 !!! Needs to be implemented !!!
//#UC END# *551544E2001A_9A0327B85C97_impl*
end;//TkwPopEditorDeleteRow.GetResultTypeInfo

function TkwPopEditorDeleteRow.GetAllParamsCount(const aCtx: TtfwContext): Integer;
//#UC START# *559687E6025A_9A0327B85C97_var*
//#UC END# *559687E6025A_9A0327B85C97_var*
begin
//#UC START# *559687E6025A_9A0327B85C97_impl*
 !!! Needs to be implemented !!!
//#UC END# *559687E6025A_9A0327B85C97_impl*
end;//TkwPopEditorDeleteRow.GetAllParamsCount

function TkwPopEditorDeleteRow.ParamsTypes: PTypeInfoArray;
//#UC START# *5617F4D00243_9A0327B85C97_var*
//#UC END# *5617F4D00243_9A0327B85C97_var*
begin
//#UC START# *5617F4D00243_9A0327B85C97_impl*
 !!! Needs to be implemented !!!
//#UC END# *5617F4D00243_9A0327B85C97_impl*
end;//TkwPopEditorDeleteRow.ParamsTypes

procedure TkwPopEditorInsertColumn.InsertColumn(const aCtx: TtfwContext;
 aEditor: TevCustomEditor);
 {* ���������� ����� ������� pop:Editor:InsertColumn }
//#UC START# *D4E991A7F4AE_16C269694050_var*
//#UC END# *D4E991A7F4AE_16C269694050_var*
begin
//#UC START# *D4E991A7F4AE_16C269694050_impl*
 !!! Needs to be implemented !!!
//#UC END# *D4E991A7F4AE_16C269694050_impl*
end;//TkwPopEditorInsertColumn.InsertColumn

procedure TkwPopEditorInsertColumn.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_16C269694050_var*
//#UC END# *4DAEEDE10285_16C269694050_var*
begin
//#UC START# *4DAEEDE10285_16C269694050_impl*
 !!! Needs to be implemented !!!
//#UC END# *4DAEEDE10285_16C269694050_impl*
end;//TkwPopEditorInsertColumn.DoDoIt

class function TkwPopEditorInsertColumn.GetWordNameForRegister: AnsiString;
begin
 Result := 'pop:Editor:InsertColumn';
end;//TkwPopEditorInsertColumn.GetWordNameForRegister

function TkwPopEditorInsertColumn.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
//#UC START# *551544E2001A_16C269694050_var*
//#UC END# *551544E2001A_16C269694050_var*
begin
//#UC START# *551544E2001A_16C269694050_impl*
 !!! Needs to be implemented !!!
//#UC END# *551544E2001A_16C269694050_impl*
end;//TkwPopEditorInsertColumn.GetResultTypeInfo

function TkwPopEditorInsertColumn.GetAllParamsCount(const aCtx: TtfwContext): Integer;
//#UC START# *559687E6025A_16C269694050_var*
//#UC END# *559687E6025A_16C269694050_var*
begin
//#UC START# *559687E6025A_16C269694050_impl*
 !!! Needs to be implemented !!!
//#UC END# *559687E6025A_16C269694050_impl*
end;//TkwPopEditorInsertColumn.GetAllParamsCount

function TkwPopEditorInsertColumn.ParamsTypes: PTypeInfoArray;
//#UC START# *5617F4D00243_16C269694050_var*
//#UC END# *5617F4D00243_16C269694050_var*
begin
//#UC START# *5617F4D00243_16C269694050_impl*
 !!! Needs to be implemented !!!
//#UC END# *5617F4D00243_16C269694050_impl*
end;//TkwPopEditorInsertColumn.ParamsTypes

procedure TkwPopEditorDeleteColumn.DeleteColumn(const aCtx: TtfwContext;
 aEditor: TevCustomEditor);
 {* ���������� ����� ������� pop:Editor:DeleteColumn }
//#UC START# *A069E18C5C66_2EA84891C677_var*
//#UC END# *A069E18C5C66_2EA84891C677_var*
begin
//#UC START# *A069E18C5C66_2EA84891C677_impl*
 !!! Needs to be implemented !!!
//#UC END# *A069E18C5C66_2EA84891C677_impl*
end;//TkwPopEditorDeleteColumn.DeleteColumn

procedure TkwPopEditorDeleteColumn.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_2EA84891C677_var*
//#UC END# *4DAEEDE10285_2EA84891C677_var*
begin
//#UC START# *4DAEEDE10285_2EA84891C677_impl*
 !!! Needs to be implemented !!!
//#UC END# *4DAEEDE10285_2EA84891C677_impl*
end;//TkwPopEditorDeleteColumn.DoDoIt

class function TkwPopEditorDeleteColumn.GetWordNameForRegister: AnsiString;
begin
 Result := 'pop:Editor:DeleteColumn';
end;//TkwPopEditorDeleteColumn.GetWordNameForRegister

function TkwPopEditorDeleteColumn.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
//#UC START# *551544E2001A_2EA84891C677_var*
//#UC END# *551544E2001A_2EA84891C677_var*
begin
//#UC START# *551544E2001A_2EA84891C677_impl*
 !!! Needs to be implemented !!!
//#UC END# *551544E2001A_2EA84891C677_impl*
end;//TkwPopEditorDeleteColumn.GetResultTypeInfo

function TkwPopEditorDeleteColumn.GetAllParamsCount(const aCtx: TtfwContext): Integer;
//#UC START# *559687E6025A_2EA84891C677_var*
//#UC END# *559687E6025A_2EA84891C677_var*
begin
//#UC START# *559687E6025A_2EA84891C677_impl*
 !!! Needs to be implemented !!!
//#UC END# *559687E6025A_2EA84891C677_impl*
end;//TkwPopEditorDeleteColumn.GetAllParamsCount

function TkwPopEditorDeleteColumn.ParamsTypes: PTypeInfoArray;
//#UC START# *5617F4D00243_2EA84891C677_var*
//#UC END# *5617F4D00243_2EA84891C677_var*
begin
//#UC START# *5617F4D00243_2EA84891C677_impl*
 !!! Needs to be implemented !!!
//#UC END# *5617F4D00243_2EA84891C677_impl*
end;//TkwPopEditorDeleteColumn.ParamsTypes

procedure TkwPopEditorMergeCells.MergeCells(const aCtx: TtfwContext;
 aEditor: TevCustomEditor;
 anAlgorytm: TedMergeAlgorythm);
 {* ���������� ����� ������� pop:Editor:MergeCells }
//#UC START# *1D5492E02FD7_A451D154F580_var*
var
 l_Table     : IedTable;
 l_Range     : IedRange;
 l_Cells     : IedCells;
//#UC END# *1D5492E02FD7_A451D154F580_var*
begin
//#UC START# *1D5492E02FD7_A451D154F580_impl*
 l_Range := aEditor.Range;
 if (l_Range = nil) then
  RunnerError('�� ������� �������� ���������.', aCtx);
 l_Table := l_Range.Table;
 if (l_Table = nil) then
  RunnerError('�� ������� �������� �������!', aCtx);
 l_Cells := l_Table.Cells;
 if (l_Cells = nil) then
  RunnerError('�� ������� �������� �������� �����!', aCtx);
 l_Cells.Merge(anAlgorytm);
//#UC END# *1D5492E02FD7_A451D154F580_impl*
end;//TkwPopEditorMergeCells.MergeCells

procedure TkwPopEditorMergeCells.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_A451D154F580_var*
//#UC END# *4DAEEDE10285_A451D154F580_var*
begin
//#UC START# *4DAEEDE10285_A451D154F580_impl*
 !!! Needs to be implemented !!!
//#UC END# *4DAEEDE10285_A451D154F580_impl*
end;//TkwPopEditorMergeCells.DoDoIt

class function TkwPopEditorMergeCells.GetWordNameForRegister: AnsiString;
begin
 Result := 'pop:Editor:MergeCells';
end;//TkwPopEditorMergeCells.GetWordNameForRegister

function TkwPopEditorMergeCells.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
//#UC START# *551544E2001A_A451D154F580_var*
//#UC END# *551544E2001A_A451D154F580_var*
begin
//#UC START# *551544E2001A_A451D154F580_impl*
 !!! Needs to be implemented !!!
//#UC END# *551544E2001A_A451D154F580_impl*
end;//TkwPopEditorMergeCells.GetResultTypeInfo

function TkwPopEditorMergeCells.GetAllParamsCount(const aCtx: TtfwContext): Integer;
//#UC START# *559687E6025A_A451D154F580_var*
//#UC END# *559687E6025A_A451D154F580_var*
begin
//#UC START# *559687E6025A_A451D154F580_impl*
 !!! Needs to be implemented !!!
//#UC END# *559687E6025A_A451D154F580_impl*
end;//TkwPopEditorMergeCells.GetAllParamsCount

function TkwPopEditorMergeCells.ParamsTypes: PTypeInfoArray;
//#UC START# *5617F4D00243_A451D154F580_var*
//#UC END# *5617F4D00243_A451D154F580_var*
begin
//#UC START# *5617F4D00243_A451D154F580_impl*
 !!! Needs to be implemented !!!
//#UC END# *5617F4D00243_A451D154F580_impl*
end;//TkwPopEditorMergeCells.ParamsTypes

procedure TkwPopEditorSplitCell.SplitCell(const aCtx: TtfwContext;
 aEditor: TevCustomEditor;
 aVert: Boolean);
 {* ���������� ����� ������� pop:Editor:SplitCell }
//#UC START# *FC2B610EC587_3AC5FB50949B_var*
var
 l_Cell : IedCell;
 l_Table: IedTable;
//#UC END# *FC2B610EC587_3AC5FB50949B_var*
begin
//#UC START# *FC2B610EC587_3AC5FB50949B_impl*
 l_Table := aEditor.Range.Table;
 if (l_Table <> nil) then
 begin
  l_Cell := l_Table.Cell;
  if (l_Cell <> nil) then
  begin
   if aVert then
    l_Cell.Split(ev_orVertical)
   else
    l_Cell.Split(ev_orHorizontal);
  end;//l_Cell <> nil
 end;//l_Table <> nil
//#UC END# *FC2B610EC587_3AC5FB50949B_impl*
end;//TkwPopEditorSplitCell.SplitCell

procedure TkwPopEditorSplitCell.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_3AC5FB50949B_var*
//#UC END# *4DAEEDE10285_3AC5FB50949B_var*
begin
//#UC START# *4DAEEDE10285_3AC5FB50949B_impl*
 !!! Needs to be implemented !!!
//#UC END# *4DAEEDE10285_3AC5FB50949B_impl*
end;//TkwPopEditorSplitCell.DoDoIt

class function TkwPopEditorSplitCell.GetWordNameForRegister: AnsiString;
begin
 Result := 'pop:Editor:SplitCell';
end;//TkwPopEditorSplitCell.GetWordNameForRegister

function TkwPopEditorSplitCell.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
//#UC START# *551544E2001A_3AC5FB50949B_var*
//#UC END# *551544E2001A_3AC5FB50949B_var*
begin
//#UC START# *551544E2001A_3AC5FB50949B_impl*
 !!! Needs to be implemented !!!
//#UC END# *551544E2001A_3AC5FB50949B_impl*
end;//TkwPopEditorSplitCell.GetResultTypeInfo

function TkwPopEditorSplitCell.GetAllParamsCount(const aCtx: TtfwContext): Integer;
//#UC START# *559687E6025A_3AC5FB50949B_var*
//#UC END# *559687E6025A_3AC5FB50949B_var*
begin
//#UC START# *559687E6025A_3AC5FB50949B_impl*
 !!! Needs to be implemented !!!
//#UC END# *559687E6025A_3AC5FB50949B_impl*
end;//TkwPopEditorSplitCell.GetAllParamsCount

function TkwPopEditorSplitCell.ParamsTypes: PTypeInfoArray;
//#UC START# *5617F4D00243_3AC5FB50949B_var*
//#UC END# *5617F4D00243_3AC5FB50949B_var*
begin
//#UC START# *5617F4D00243_3AC5FB50949B_impl*
 !!! Needs to be implemented !!!
//#UC END# *5617F4D00243_3AC5FB50949B_impl*
end;//TkwPopEditorSplitCell.ParamsTypes

procedure TkwPopEditorSplitTable.SplitTable(const aCtx: TtfwContext;
 aEditor: TevCustomEditor);
 {* ���������� ����� ������� pop:Editor:SplitTable }
//#UC START# *4F994DADAE61_AA4E45C58AA3_var*
var
 l_Table: IedTable;
//#UC END# *4F994DADAE61_AA4E45C58AA3_var*
begin
//#UC START# *4F994DADAE61_AA4E45C58AA3_impl*
 l_Table := aEditor.Range.Table;
 if (l_Table = nil) then
  RunnerError('������ �� ��������� � �������.', aCtx)
 else
  aCtx.rCaller.Check(l_Table.Split(aEditor.TextSource.Indicator), '���������� ������� ����������� ��������.')
//#UC END# *4F994DADAE61_AA4E45C58AA3_impl*
end;//TkwPopEditorSplitTable.SplitTable

procedure TkwPopEditorSplitTable.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_AA4E45C58AA3_var*
//#UC END# *4DAEEDE10285_AA4E45C58AA3_var*
begin
//#UC START# *4DAEEDE10285_AA4E45C58AA3_impl*
 !!! Needs to be implemented !!!
//#UC END# *4DAEEDE10285_AA4E45C58AA3_impl*
end;//TkwPopEditorSplitTable.DoDoIt

class function TkwPopEditorSplitTable.GetWordNameForRegister: AnsiString;
begin
 Result := 'pop:Editor:SplitTable';
end;//TkwPopEditorSplitTable.GetWordNameForRegister

function TkwPopEditorSplitTable.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
//#UC START# *551544E2001A_AA4E45C58AA3_var*
//#UC END# *551544E2001A_AA4E45C58AA3_var*
begin
//#UC START# *551544E2001A_AA4E45C58AA3_impl*
 !!! Needs to be implemented !!!
//#UC END# *551544E2001A_AA4E45C58AA3_impl*
end;//TkwPopEditorSplitTable.GetResultTypeInfo

function TkwPopEditorSplitTable.GetAllParamsCount(const aCtx: TtfwContext): Integer;
//#UC START# *559687E6025A_AA4E45C58AA3_var*
//#UC END# *559687E6025A_AA4E45C58AA3_var*
begin
//#UC START# *559687E6025A_AA4E45C58AA3_impl*
 !!! Needs to be implemented !!!
//#UC END# *559687E6025A_AA4E45C58AA3_impl*
end;//TkwPopEditorSplitTable.GetAllParamsCount

function TkwPopEditorSplitTable.ParamsTypes: PTypeInfoArray;
//#UC START# *5617F4D00243_AA4E45C58AA3_var*
//#UC END# *5617F4D00243_AA4E45C58AA3_var*
begin
//#UC START# *5617F4D00243_AA4E45C58AA3_impl*
 !!! Needs to be implemented !!!
//#UC END# *5617F4D00243_AA4E45C58AA3_impl*
end;//TkwPopEditorSplitTable.ParamsTypes

procedure TkwPopEditorMergeTables.MergeTables(const aCtx: TtfwContext;
 aEditor: TevCustomEditor);
 {* ���������� ����� ������� pop:Editor:MergeTables }
//#UC START# *7C77C501EF5C_E73997E799CF_var*
var
 l_Table: IedTable;
//#UC END# *7C77C501EF5C_E73997E799CF_var*
begin
//#UC START# *7C77C501EF5C_E73997E799CF_impl*
 l_Table := aEditor.Range.Table;
 if (l_Table = nil) then
  RunnerError('������ �� ��������� � �������.', aCtx)
 else
  aCtx.rCaller.Check(l_Table.Merge(aEditor.TextSource.Indicator), '����������� ������� ����������� ��������.')
//#UC END# *7C77C501EF5C_E73997E799CF_impl*
end;//TkwPopEditorMergeTables.MergeTables

procedure TkwPopEditorMergeTables.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_E73997E799CF_var*
//#UC END# *4DAEEDE10285_E73997E799CF_var*
begin
//#UC START# *4DAEEDE10285_E73997E799CF_impl*
 !!! Needs to be implemented !!!
//#UC END# *4DAEEDE10285_E73997E799CF_impl*
end;//TkwPopEditorMergeTables.DoDoIt

class function TkwPopEditorMergeTables.GetWordNameForRegister: AnsiString;
begin
 Result := 'pop:Editor:MergeTables';
end;//TkwPopEditorMergeTables.GetWordNameForRegister

function TkwPopEditorMergeTables.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
//#UC START# *551544E2001A_E73997E799CF_var*
//#UC END# *551544E2001A_E73997E799CF_var*
begin
//#UC START# *551544E2001A_E73997E799CF_impl*
 !!! Needs to be implemented !!!
//#UC END# *551544E2001A_E73997E799CF_impl*
end;//TkwPopEditorMergeTables.GetResultTypeInfo

function TkwPopEditorMergeTables.GetAllParamsCount(const aCtx: TtfwContext): Integer;
//#UC START# *559687E6025A_E73997E799CF_var*
//#UC END# *559687E6025A_E73997E799CF_var*
begin
//#UC START# *559687E6025A_E73997E799CF_impl*
 !!! Needs to be implemented !!!
//#UC END# *559687E6025A_E73997E799CF_impl*
end;//TkwPopEditorMergeTables.GetAllParamsCount

function TkwPopEditorMergeTables.ParamsTypes: PTypeInfoArray;
//#UC START# *5617F4D00243_E73997E799CF_var*
//#UC END# *5617F4D00243_E73997E799CF_var*
begin
//#UC START# *5617F4D00243_E73997E799CF_impl*
 !!! Needs to be implemented !!!
//#UC END# *5617F4D00243_E73997E799CF_impl*
end;//TkwPopEditorMergeTables.ParamsTypes

procedure TkwPopEditorInsertSectionBreak.InsertSectionBreak(const aCtx: TtfwContext;
 aEditor: TevCustomEditor;
 aPageOrientation: TevPageOrientation);
 {* ���������� ����� ������� pop:Editor:InsertSectionBreak }
//#UC START# *20D4E8106F99_5C1388B33B3A_var*
//#UC END# *20D4E8106F99_5C1388B33B3A_var*
begin
//#UC START# *20D4E8106F99_5C1388B33B3A_impl*
 aEditor.InsertPageBreak(True, aPageOrientation);
//#UC END# *20D4E8106F99_5C1388B33B3A_impl*
end;//TkwPopEditorInsertSectionBreak.InsertSectionBreak

procedure TkwPopEditorInsertSectionBreak.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_5C1388B33B3A_var*
//#UC END# *4DAEEDE10285_5C1388B33B3A_var*
begin
//#UC START# *4DAEEDE10285_5C1388B33B3A_impl*
 !!! Needs to be implemented !!!
//#UC END# *4DAEEDE10285_5C1388B33B3A_impl*
end;//TkwPopEditorInsertSectionBreak.DoDoIt

class function TkwPopEditorInsertSectionBreak.GetWordNameForRegister: AnsiString;
begin
 Result := 'pop:Editor:InsertSectionBreak';
end;//TkwPopEditorInsertSectionBreak.GetWordNameForRegister

function TkwPopEditorInsertSectionBreak.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
//#UC START# *551544E2001A_5C1388B33B3A_var*
//#UC END# *551544E2001A_5C1388B33B3A_var*
begin
//#UC START# *551544E2001A_5C1388B33B3A_impl*
 !!! Needs to be implemented !!!
//#UC END# *551544E2001A_5C1388B33B3A_impl*
end;//TkwPopEditorInsertSectionBreak.GetResultTypeInfo

function TkwPopEditorInsertSectionBreak.GetAllParamsCount(const aCtx: TtfwContext): Integer;
//#UC START# *559687E6025A_5C1388B33B3A_var*
//#UC END# *559687E6025A_5C1388B33B3A_var*
begin
//#UC START# *559687E6025A_5C1388B33B3A_impl*
 !!! Needs to be implemented !!!
//#UC END# *559687E6025A_5C1388B33B3A_impl*
end;//TkwPopEditorInsertSectionBreak.GetAllParamsCount

function TkwPopEditorInsertSectionBreak.ParamsTypes: PTypeInfoArray;
//#UC START# *5617F4D00243_5C1388B33B3A_var*
//#UC END# *5617F4D00243_5C1388B33B3A_var*
begin
//#UC START# *5617F4D00243_5C1388B33B3A_impl*
 !!! Needs to be implemented !!!
//#UC END# *5617F4D00243_5C1388B33B3A_impl*
end;//TkwPopEditorInsertSectionBreak.ParamsTypes

procedure TkwPopEditorPrevHyperlink.PrevHyperlink(const aCtx: TtfwContext;
 aEditor: TevCustomEditor);
 {* ���������� ����� ������� pop:Editor:PrevHyperlink }
//#UC START# *DB7F8A6A9D94_B77C574814C1_var*
//#UC END# *DB7F8A6A9D94_B77C574814C1_var*
begin
//#UC START# *DB7F8A6A9D94_B77C574814C1_impl*
 aEditor.PrevHyperlink(False);
//#UC END# *DB7F8A6A9D94_B77C574814C1_impl*
end;//TkwPopEditorPrevHyperlink.PrevHyperlink

procedure TkwPopEditorPrevHyperlink.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_B77C574814C1_var*
//#UC END# *4DAEEDE10285_B77C574814C1_var*
begin
//#UC START# *4DAEEDE10285_B77C574814C1_impl*
 !!! Needs to be implemented !!!
//#UC END# *4DAEEDE10285_B77C574814C1_impl*
end;//TkwPopEditorPrevHyperlink.DoDoIt

class function TkwPopEditorPrevHyperlink.GetWordNameForRegister: AnsiString;
begin
 Result := 'pop:Editor:PrevHyperlink';
end;//TkwPopEditorPrevHyperlink.GetWordNameForRegister

function TkwPopEditorPrevHyperlink.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
//#UC START# *551544E2001A_B77C574814C1_var*
//#UC END# *551544E2001A_B77C574814C1_var*
begin
//#UC START# *551544E2001A_B77C574814C1_impl*
 !!! Needs to be implemented !!!
//#UC END# *551544E2001A_B77C574814C1_impl*
end;//TkwPopEditorPrevHyperlink.GetResultTypeInfo

function TkwPopEditorPrevHyperlink.GetAllParamsCount(const aCtx: TtfwContext): Integer;
//#UC START# *559687E6025A_B77C574814C1_var*
//#UC END# *559687E6025A_B77C574814C1_var*
begin
//#UC START# *559687E6025A_B77C574814C1_impl*
 !!! Needs to be implemented !!!
//#UC END# *559687E6025A_B77C574814C1_impl*
end;//TkwPopEditorPrevHyperlink.GetAllParamsCount

function TkwPopEditorPrevHyperlink.ParamsTypes: PTypeInfoArray;
//#UC START# *5617F4D00243_B77C574814C1_var*
//#UC END# *5617F4D00243_B77C574814C1_var*
begin
//#UC START# *5617F4D00243_B77C574814C1_impl*
 !!! Needs to be implemented !!!
//#UC END# *5617F4D00243_B77C574814C1_impl*
end;//TkwPopEditorPrevHyperlink.ParamsTypes

procedure TkwPopEditorNextHyperlink.NextHyperlink(const aCtx: TtfwContext;
 aEditor: TevCustomEditor);
 {* ���������� ����� ������� pop:Editor:NextHyperlink }
//#UC START# *8C3D0835326B_F05E0D5E838A_var*
//#UC END# *8C3D0835326B_F05E0D5E838A_var*
begin
//#UC START# *8C3D0835326B_F05E0D5E838A_impl*
 aEditor.NextHyperlink(False);
//#UC END# *8C3D0835326B_F05E0D5E838A_impl*
end;//TkwPopEditorNextHyperlink.NextHyperlink

procedure TkwPopEditorNextHyperlink.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_F05E0D5E838A_var*
//#UC END# *4DAEEDE10285_F05E0D5E838A_var*
begin
//#UC START# *4DAEEDE10285_F05E0D5E838A_impl*
 !!! Needs to be implemented !!!
//#UC END# *4DAEEDE10285_F05E0D5E838A_impl*
end;//TkwPopEditorNextHyperlink.DoDoIt

class function TkwPopEditorNextHyperlink.GetWordNameForRegister: AnsiString;
begin
 Result := 'pop:Editor:NextHyperlink';
end;//TkwPopEditorNextHyperlink.GetWordNameForRegister

function TkwPopEditorNextHyperlink.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
//#UC START# *551544E2001A_F05E0D5E838A_var*
//#UC END# *551544E2001A_F05E0D5E838A_var*
begin
//#UC START# *551544E2001A_F05E0D5E838A_impl*
 !!! Needs to be implemented !!!
//#UC END# *551544E2001A_F05E0D5E838A_impl*
end;//TkwPopEditorNextHyperlink.GetResultTypeInfo

function TkwPopEditorNextHyperlink.GetAllParamsCount(const aCtx: TtfwContext): Integer;
//#UC START# *559687E6025A_F05E0D5E838A_var*
//#UC END# *559687E6025A_F05E0D5E838A_var*
begin
//#UC START# *559687E6025A_F05E0D5E838A_impl*
 !!! Needs to be implemented !!!
//#UC END# *559687E6025A_F05E0D5E838A_impl*
end;//TkwPopEditorNextHyperlink.GetAllParamsCount

function TkwPopEditorNextHyperlink.ParamsTypes: PTypeInfoArray;
//#UC START# *5617F4D00243_F05E0D5E838A_var*
//#UC END# *5617F4D00243_F05E0D5E838A_var*
begin
//#UC START# *5617F4D00243_F05E0D5E838A_impl*
 !!! Needs to be implemented !!!
//#UC END# *5617F4D00243_F05E0D5E838A_impl*
end;//TkwPopEditorNextHyperlink.ParamsTypes

function TkwPopEditorRange.Range(const aCtx: TtfwContext;
 aEditor: TevCustomEditor): IedRange;
 {* ���������� ����� ������� pop:Editor:Range }
//#UC START# *7884E20C97ED_47D4B4C536FD_var*
//#UC END# *7884E20C97ED_47D4B4C536FD_var*
begin
//#UC START# *7884E20C97ED_47D4B4C536FD_impl*
 Result := aEditor.Range;
//#UC END# *7884E20C97ED_47D4B4C536FD_impl*
end;//TkwPopEditorRange.Range

procedure TkwPopEditorRange.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_47D4B4C536FD_var*
//#UC END# *4DAEEDE10285_47D4B4C536FD_var*
begin
//#UC START# *4DAEEDE10285_47D4B4C536FD_impl*
 !!! Needs to be implemented !!!
//#UC END# *4DAEEDE10285_47D4B4C536FD_impl*
end;//TkwPopEditorRange.DoDoIt

class function TkwPopEditorRange.GetWordNameForRegister: AnsiString;
begin
 Result := 'pop:Editor:Range';
end;//TkwPopEditorRange.GetWordNameForRegister

function TkwPopEditorRange.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
//#UC START# *551544E2001A_47D4B4C536FD_var*
//#UC END# *551544E2001A_47D4B4C536FD_var*
begin
//#UC START# *551544E2001A_47D4B4C536FD_impl*
 !!! Needs to be implemented !!!
//#UC END# *551544E2001A_47D4B4C536FD_impl*
end;//TkwPopEditorRange.GetResultTypeInfo

function TkwPopEditorRange.GetAllParamsCount(const aCtx: TtfwContext): Integer;
//#UC START# *559687E6025A_47D4B4C536FD_var*
//#UC END# *559687E6025A_47D4B4C536FD_var*
begin
//#UC START# *559687E6025A_47D4B4C536FD_impl*
 !!! Needs to be implemented !!!
//#UC END# *559687E6025A_47D4B4C536FD_impl*
end;//TkwPopEditorRange.GetAllParamsCount

function TkwPopEditorRange.ParamsTypes: PTypeInfoArray;
//#UC START# *5617F4D00243_47D4B4C536FD_var*
//#UC END# *5617F4D00243_47D4B4C536FD_var*
begin
//#UC START# *5617F4D00243_47D4B4C536FD_impl*
 !!! Needs to be implemented !!!
//#UC END# *5617F4D00243_47D4B4C536FD_impl*
end;//TkwPopEditorRange.ParamsTypes

initialization
 TTevCustomEditorWordsPackResNameGetter.Register;
 {* ����������� ������������ ����������� }
 TkwPopEditorInsertTable.RegisterInEngine;
 {* ����������� pop_Editor_InsertTable }
 TkwPopEditorInsertRow.RegisterInEngine;
 {* ����������� pop_Editor_InsertRow }
 TkwPopEditorDeleteRow.RegisterInEngine;
 {* ����������� pop_Editor_DeleteRow }
 TkwPopEditorInsertColumn.RegisterInEngine;
 {* ����������� pop_Editor_InsertColumn }
 TkwPopEditorDeleteColumn.RegisterInEngine;
 {* ����������� pop_Editor_DeleteColumn }
 TkwPopEditorMergeCells.RegisterInEngine;
 {* ����������� pop_Editor_MergeCells }
 TkwPopEditorSplitCell.RegisterInEngine;
 {* ����������� pop_Editor_SplitCell }
 TkwPopEditorSplitTable.RegisterInEngine;
 {* ����������� pop_Editor_SplitTable }
 TkwPopEditorMergeTables.RegisterInEngine;
 {* ����������� pop_Editor_MergeTables }
 TkwPopEditorInsertSectionBreak.RegisterInEngine;
 {* ����������� pop_Editor_InsertSectionBreak }
 TkwPopEditorPrevHyperlink.RegisterInEngine;
 {* ����������� pop_Editor_PrevHyperlink }
 TkwPopEditorNextHyperlink.RegisterInEngine;
 {* ����������� pop_Editor_NextHyperlink }
 TkwPopEditorRange.RegisterInEngine;
 {* ����������� pop_Editor_Range }
 TtfwTypeRegistrator.RegisterType(@tfw_tiStruct);
 {* ����������� ���� TtfwContext }
 TtfwTypeRegistrator.RegisterType(TypeInfo(TevCustomEditor));
 {* ����������� ���� TevCustomEditor }
 TtfwTypeRegistrator.RegisterType(TypeInfo(Integer));
 {* ����������� ���� Integer }
 TtfwTypeRegistrator.RegisterType(TypeInfo(TedMergeAlgorythm));
 {* ����������� ���� TedMergeAlgorythm }
 TtfwTypeRegistrator.RegisterType(TypeInfo(Boolean));
 {* ����������� ���� Boolean }
 TtfwTypeRegistrator.RegisterType(TypeInfo(TevPageOrientation));
 {* ����������� ���� PageOrientation }
 TtfwTypeRegistrator.RegisterType(TypeInfo(IedRange));
 {* ����������� ���� IedRange }
{$IfEnd} // NOT Defined(NoScripts)

end.
