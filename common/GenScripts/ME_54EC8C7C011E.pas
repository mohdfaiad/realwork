unit vtComboBoxWordsPack;

// ������: "w:\common\components\rtl\Garant\ScriptEngine\vtComboBoxWordsPack.pas"
// ���������: "ScriptKeywordsPack"

{$Include seDefine.inc}

interface

{$If NOT Defined(NoScripts)}
uses
 l3IntfUses
 {$If NOT Defined(NoVCL)}
 , StdCtrls
 {$IfEnd} // NOT Defined(NoVCL)
 , vtComboTree
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
 , tfwAxiomaticsResNameGetters
 , vtComboBoxQS
 , l3TreeInterfaces
 , l3Filer
 , l3Types
 , l3Interfaces
 , SysUtils
 , tfwScriptingTypes
 , tfwTypeRegistrator
;

type
 //#UC START# *D1FD416FEE23ci*
 //#UC END# *D1FD416FEE23ci*
 //#UC START# *D1FD416FEE23cit*
 //#UC END# *D1FD416FEE23cit*
 TvtComboBoxWordsPackResNameGetter = {final} class(TtfwAxiomaticsResNameGetter)
  {* ����������� ������������ ����������� }
  public
   class function ResName: AnsiString; override;
 //#UC START# *D1FD416FEE23publ*
 //#UC END# *D1FD416FEE23publ*
 end;//TvtComboBoxWordsPackResNameGetter

 TCustomComboBoxFriend = {abstract} class(TCustomComboBox)
  {* ���� ��� TCustomComboBox }
 end;//TCustomComboBoxFriend

 TkwPopComboBoxDropDown = {final} class(TtfwClassLike)
  {* ����� ������� pop:ComboBox:DropDown
*������:*
[code]
 aValue aComboBox pop:ComboBox:DropDown
[code]  }
  private
   procedure DropDown(const aCtx: TtfwContext;
    aComboBox: TCustomComboBox;
    aValue: Boolean);
    {* ���������� ����� ������� pop:ComboBox:DropDown }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
  public
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
 end;//TkwPopComboBoxDropDown

 TkwPopComboBoxGetItemIndex = {final} class(TtfwClassLike)
  {* ����� ������� pop:ComboBox:GetItemIndex
*��� ����������:* Integer
*������:*
[code]
INTEGER VAR l_Integer
 aComboBox pop:ComboBox:GetItemIndex >>> l_Integer
[code]  }
  private
   function GetItemIndex(const aCtx: TtfwContext;
    aComboBox: TCustomComboBox): Integer;
    {* ���������� ����� ������� pop:ComboBox:GetItemIndex }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
  public
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
 end;//TkwPopComboBoxGetItemIndex

 TkwPopComboBoxIndexOf = {final} class(TtfwClassLike)
  {* ����� ������� pop:ComboBox:IndexOf
*��� ����������:* Integer
*������:*
[code]
INTEGER VAR l_Integer
 aString aComboBox pop:ComboBox:IndexOf >>> l_Integer
[code]  }
  private
   function IndexOf(const aCtx: TtfwContext;
    aComboBox: TCustomComboBox;
    const aString: AnsiString): Integer;
    {* ���������� ����� ������� pop:ComboBox:IndexOf }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
  public
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
 end;//TkwPopComboBoxIndexOf

 TkwPopComboBoxSelectItem = {final} class(TtfwClassLike)
  {* ����� ������� pop:ComboBox:SelectItem
*������:*
[code]
 aString aComboBox pop:ComboBox:SelectItem
[code]  }
  private
   procedure SelectItem(const aCtx: TtfwContext;
    aComboBox: TCustomComboBox;
    const aString: AnsiString);
    {* ���������� ����� ������� pop:ComboBox:SelectItem }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
  public
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
 end;//TkwPopComboBoxSelectItem

 TkwPopComboBoxSetItemIndex = {final} class(TtfwClassLike)
  {* ����� ������� pop:ComboBox:SetItemIndex
*������:*
[code]
 anIndex aComboBox pop:ComboBox:SetItemIndex
[code]  }
  private
   procedure SetItemIndex(const aCtx: TtfwContext;
    aComboBox: TCustomComboBox;
    anIndex: Integer);
    {* ���������� ����� ������� pop:ComboBox:SetItemIndex }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
  public
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
 end;//TkwPopComboBoxSetItemIndex

 TkwPopComboBoxSaveItems = {final} class(TtfwClassLike)
  {* ����� ������� pop:ComboBox:SaveItems
[panel]*������:* ���_�����  ������� pop:ComboBox:SaveItems 
*��������:* ��������� ��� ������ ����������� ������ (�������� ���������� �������) � ���� (�������� ���������� ���_�����)  � ���������� � ��������.
*������:*
[code]
'MyList.cmbx' 'StyleComboBox' byname:control:push pop:ComboBox:SaveItems
[code] 
*���������:* ��������� ���������� ���������� 'StyleComboBox' �  ����  'MyList.cmbx' � ���������� � ��������.[panel]
*������:*
[code]
 aFileName aComboBox pop:ComboBox:SaveItems
[code]  }
  private
   procedure SaveItems(const aCtx: TtfwContext;
    aComboBox: TCustomComboBox;
    const aFileName: AnsiString);
    {* ���������� ����� ������� pop:ComboBox:SaveItems }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
  public
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
 end;//TkwPopComboBoxSaveItems

 TkwPopComboTreeDropDown = {final} class(TtfwClassLike)
  {* ����� ������� pop:ComboTree:DropDown
*������:*
[code]
 aValue aComboTree pop:ComboTree:DropDown
[code]  }
  private
   procedure DropDown(const aCtx: TtfwContext;
    aComboTree: TvtComboTree;
    aValue: Boolean);
    {* ���������� ����� ������� pop:ComboTree:DropDown }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
  public
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
 end;//TkwPopComboTreeDropDown

 TkwPopComboTreeGetItemIndex = {final} class(TtfwClassLike)
  {* ����� ������� pop:ComboTree:GetItemIndex
*��� ����������:* Integer
*������:*
[code]
INTEGER VAR l_Integer
 aComboTree pop:ComboTree:GetItemIndex >>> l_Integer
[code]  }
  private
   function GetItemIndex(const aCtx: TtfwContext;
    aComboTree: TvtComboTree): Integer;
    {* ���������� ����� ������� pop:ComboTree:GetItemIndex }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
  public
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
 end;//TkwPopComboTreeGetItemIndex

 TkwPopComboTreeIndexOf = {final} class(TtfwClassLike)
  {* ����� ������� pop:ComboTree:IndexOf
*��� ����������:* Integer
*������:*
[code]
INTEGER VAR l_Integer
 aString aComboTree pop:ComboTree:IndexOf >>> l_Integer
[code]  }
  private
   function IndexOf(const aCtx: TtfwContext;
    aComboTree: TvtComboTree;
    const aString: AnsiString): Integer;
    {* ���������� ����� ������� pop:ComboTree:IndexOf }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
  public
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
 end;//TkwPopComboTreeIndexOf

 TkwPopComboTreeSelectItem = {final} class(TtfwClassLike)
  {* ����� ������� pop:ComboTree:SelectItem
*������:*
[code]
 aString aComboTree pop:ComboTree:SelectItem
[code]  }
  private
   procedure SelectItem(const aCtx: TtfwContext;
    aComboTree: TvtComboTree;
    const aString: AnsiString);
    {* ���������� ����� ������� pop:ComboTree:SelectItem }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
  public
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
 end;//TkwPopComboTreeSelectItem

 TkwPopComboTreeSetItemIndex = {final} class(TtfwClassLike)
  {* ����� ������� pop:ComboTree:SetItemIndex
*������:*
[code]
 anIndex aComboTree pop:ComboTree:SetItemIndex
[code]  }
  private
   procedure SetItemIndex(const aCtx: TtfwContext;
    aComboTree: TvtComboTree;
    anIndex: Integer);
    {* ���������� ����� ������� pop:ComboTree:SetItemIndex }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
  public
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
 end;//TkwPopComboTreeSetItemIndex

 TkwPopComboTreeSaveItems = {final} class(TtfwClassLike)
  {* ����� ������� pop:ComboTree:SaveItems
[panel]*������:* ���_�����  ������� pop:ComboBox:SaveItems 
*��������:* ��������� ��� ������ ����������� ������ (�������� ���������� �������) � ���� (�������� ���������� ���_�����)  � ���������� � ��������.
*������:*
[code]
'MyList.cmbx' 'StyleComboBox' byname:control:push pop:ComboBox:SaveItems
[code] 
*���������:* ��������� ���������� ���������� 'StyleComboBox' �  ����  'MyList.cmbx' � ���������� � ��������.[panel]
*������:*
[code]
 aFileName aComboTree pop:ComboTree:SaveItems
[code]  }
  private
   procedure SaveItems(const aCtx: TtfwContext;
    aComboTree: TvtComboTree;
    const aFileName: AnsiString);
    {* ���������� ����� ������� pop:ComboTree:SaveItems }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
  public
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
 end;//TkwPopComboTreeSaveItems

class function TvtComboBoxWordsPackResNameGetter.ResName: AnsiString;
begin
  Result := 'vtComboBoxWordsPack';
end;//TvtComboBoxWordsPackResNameGetter.ResName

 {$R vtComboBoxWordsPack.res}

procedure TkwPopComboBoxDropDown.DropDown(const aCtx: TtfwContext;
 aComboBox: TCustomComboBox;
 aValue: Boolean);
 {* ���������� ����� ������� pop:ComboBox:DropDown }
//#UC START# *D4660B294082_B7676CD1AAB3_var*
//#UC END# *D4660B294082_B7676CD1AAB3_var*
begin
//#UC START# *D4660B294082_B7676CD1AAB3_impl*
 aCombobox.DroppedDown := aValue;
//#UC END# *D4660B294082_B7676CD1AAB3_impl*
end;//TkwPopComboBoxDropDown.DropDown

procedure TkwPopComboBoxDropDown.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_B7676CD1AAB3_var*
//#UC END# *4DAEEDE10285_B7676CD1AAB3_var*
begin
//#UC START# *4DAEEDE10285_B7676CD1AAB3_impl*
 !!! Needs to be implemented !!!
//#UC END# *4DAEEDE10285_B7676CD1AAB3_impl*
end;//TkwPopComboBoxDropDown.DoDoIt

class function TkwPopComboBoxDropDown.GetWordNameForRegister: AnsiString;
begin
 Result := 'pop:ComboBox:DropDown';
end;//TkwPopComboBoxDropDown.GetWordNameForRegister

function TkwPopComboBoxDropDown.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
//#UC START# *551544E2001A_B7676CD1AAB3_var*
//#UC END# *551544E2001A_B7676CD1AAB3_var*
begin
//#UC START# *551544E2001A_B7676CD1AAB3_impl*
 !!! Needs to be implemented !!!
//#UC END# *551544E2001A_B7676CD1AAB3_impl*
end;//TkwPopComboBoxDropDown.GetResultTypeInfo

function TkwPopComboBoxDropDown.GetAllParamsCount(const aCtx: TtfwContext): Integer;
//#UC START# *559687E6025A_B7676CD1AAB3_var*
//#UC END# *559687E6025A_B7676CD1AAB3_var*
begin
//#UC START# *559687E6025A_B7676CD1AAB3_impl*
 !!! Needs to be implemented !!!
//#UC END# *559687E6025A_B7676CD1AAB3_impl*
end;//TkwPopComboBoxDropDown.GetAllParamsCount

function TkwPopComboBoxDropDown.ParamsTypes: PTypeInfoArray;
//#UC START# *5617F4D00243_B7676CD1AAB3_var*
//#UC END# *5617F4D00243_B7676CD1AAB3_var*
begin
//#UC START# *5617F4D00243_B7676CD1AAB3_impl*
 !!! Needs to be implemented !!!
//#UC END# *5617F4D00243_B7676CD1AAB3_impl*
end;//TkwPopComboBoxDropDown.ParamsTypes

function TkwPopComboBoxGetItemIndex.GetItemIndex(const aCtx: TtfwContext;
 aComboBox: TCustomComboBox): Integer;
 {* ���������� ����� ������� pop:ComboBox:GetItemIndex }
//#UC START# *0DE7BD329B92_731890DC5F90_var*
//#UC END# *0DE7BD329B92_731890DC5F90_var*
begin
//#UC START# *0DE7BD329B92_731890DC5F90_impl*
 Result := aCombobox.ItemIndex;
//#UC END# *0DE7BD329B92_731890DC5F90_impl*
end;//TkwPopComboBoxGetItemIndex.GetItemIndex

procedure TkwPopComboBoxGetItemIndex.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_731890DC5F90_var*
//#UC END# *4DAEEDE10285_731890DC5F90_var*
begin
//#UC START# *4DAEEDE10285_731890DC5F90_impl*
 !!! Needs to be implemented !!!
//#UC END# *4DAEEDE10285_731890DC5F90_impl*
end;//TkwPopComboBoxGetItemIndex.DoDoIt

class function TkwPopComboBoxGetItemIndex.GetWordNameForRegister: AnsiString;
begin
 Result := 'pop:ComboBox:GetItemIndex';
end;//TkwPopComboBoxGetItemIndex.GetWordNameForRegister

function TkwPopComboBoxGetItemIndex.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
//#UC START# *551544E2001A_731890DC5F90_var*
//#UC END# *551544E2001A_731890DC5F90_var*
begin
//#UC START# *551544E2001A_731890DC5F90_impl*
 !!! Needs to be implemented !!!
//#UC END# *551544E2001A_731890DC5F90_impl*
end;//TkwPopComboBoxGetItemIndex.GetResultTypeInfo

function TkwPopComboBoxGetItemIndex.GetAllParamsCount(const aCtx: TtfwContext): Integer;
//#UC START# *559687E6025A_731890DC5F90_var*
//#UC END# *559687E6025A_731890DC5F90_var*
begin
//#UC START# *559687E6025A_731890DC5F90_impl*
 !!! Needs to be implemented !!!
//#UC END# *559687E6025A_731890DC5F90_impl*
end;//TkwPopComboBoxGetItemIndex.GetAllParamsCount

function TkwPopComboBoxGetItemIndex.ParamsTypes: PTypeInfoArray;
//#UC START# *5617F4D00243_731890DC5F90_var*
//#UC END# *5617F4D00243_731890DC5F90_var*
begin
//#UC START# *5617F4D00243_731890DC5F90_impl*
 !!! Needs to be implemented !!!
//#UC END# *5617F4D00243_731890DC5F90_impl*
end;//TkwPopComboBoxGetItemIndex.ParamsTypes

function TkwPopComboBoxIndexOf.IndexOf(const aCtx: TtfwContext;
 aComboBox: TCustomComboBox;
 const aString: AnsiString): Integer;
 {* ���������� ����� ������� pop:ComboBox:IndexOf }
//#UC START# *56A99D643C95_697C86093610_var*
//#UC END# *56A99D643C95_697C86093610_var*
begin
//#UC START# *56A99D643C95_697C86093610_impl*
 Result := aCombobox.Items.IndexOf(aString);
//#UC END# *56A99D643C95_697C86093610_impl*
end;//TkwPopComboBoxIndexOf.IndexOf

procedure TkwPopComboBoxIndexOf.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_697C86093610_var*
//#UC END# *4DAEEDE10285_697C86093610_var*
begin
//#UC START# *4DAEEDE10285_697C86093610_impl*
 !!! Needs to be implemented !!!
//#UC END# *4DAEEDE10285_697C86093610_impl*
end;//TkwPopComboBoxIndexOf.DoDoIt

class function TkwPopComboBoxIndexOf.GetWordNameForRegister: AnsiString;
begin
 Result := 'pop:ComboBox:IndexOf';
end;//TkwPopComboBoxIndexOf.GetWordNameForRegister

function TkwPopComboBoxIndexOf.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
//#UC START# *551544E2001A_697C86093610_var*
//#UC END# *551544E2001A_697C86093610_var*
begin
//#UC START# *551544E2001A_697C86093610_impl*
 !!! Needs to be implemented !!!
//#UC END# *551544E2001A_697C86093610_impl*
end;//TkwPopComboBoxIndexOf.GetResultTypeInfo

function TkwPopComboBoxIndexOf.GetAllParamsCount(const aCtx: TtfwContext): Integer;
//#UC START# *559687E6025A_697C86093610_var*
//#UC END# *559687E6025A_697C86093610_var*
begin
//#UC START# *559687E6025A_697C86093610_impl*
 !!! Needs to be implemented !!!
//#UC END# *559687E6025A_697C86093610_impl*
end;//TkwPopComboBoxIndexOf.GetAllParamsCount

function TkwPopComboBoxIndexOf.ParamsTypes: PTypeInfoArray;
//#UC START# *5617F4D00243_697C86093610_var*
//#UC END# *5617F4D00243_697C86093610_var*
begin
//#UC START# *5617F4D00243_697C86093610_impl*
 !!! Needs to be implemented !!!
//#UC END# *5617F4D00243_697C86093610_impl*
end;//TkwPopComboBoxIndexOf.ParamsTypes

procedure TkwPopComboBoxSelectItem.SelectItem(const aCtx: TtfwContext;
 aComboBox: TCustomComboBox;
 const aString: AnsiString);
 {* ���������� ����� ������� pop:ComboBox:SelectItem }
//#UC START# *BC0BF0E96B69_E94AE4FC3D32_var*
//#UC END# *BC0BF0E96B69_E94AE4FC3D32_var*
begin
//#UC START# *BC0BF0E96B69_E94AE4FC3D32_impl*
 TCustomComboBoxFriend(aCombobox).SelectItem(aString);
//#UC END# *BC0BF0E96B69_E94AE4FC3D32_impl*
end;//TkwPopComboBoxSelectItem.SelectItem

procedure TkwPopComboBoxSelectItem.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_E94AE4FC3D32_var*
//#UC END# *4DAEEDE10285_E94AE4FC3D32_var*
begin
//#UC START# *4DAEEDE10285_E94AE4FC3D32_impl*
 !!! Needs to be implemented !!!
//#UC END# *4DAEEDE10285_E94AE4FC3D32_impl*
end;//TkwPopComboBoxSelectItem.DoDoIt

class function TkwPopComboBoxSelectItem.GetWordNameForRegister: AnsiString;
begin
 Result := 'pop:ComboBox:SelectItem';
end;//TkwPopComboBoxSelectItem.GetWordNameForRegister

function TkwPopComboBoxSelectItem.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
//#UC START# *551544E2001A_E94AE4FC3D32_var*
//#UC END# *551544E2001A_E94AE4FC3D32_var*
begin
//#UC START# *551544E2001A_E94AE4FC3D32_impl*
 !!! Needs to be implemented !!!
//#UC END# *551544E2001A_E94AE4FC3D32_impl*
end;//TkwPopComboBoxSelectItem.GetResultTypeInfo

function TkwPopComboBoxSelectItem.GetAllParamsCount(const aCtx: TtfwContext): Integer;
//#UC START# *559687E6025A_E94AE4FC3D32_var*
//#UC END# *559687E6025A_E94AE4FC3D32_var*
begin
//#UC START# *559687E6025A_E94AE4FC3D32_impl*
 !!! Needs to be implemented !!!
//#UC END# *559687E6025A_E94AE4FC3D32_impl*
end;//TkwPopComboBoxSelectItem.GetAllParamsCount

function TkwPopComboBoxSelectItem.ParamsTypes: PTypeInfoArray;
//#UC START# *5617F4D00243_E94AE4FC3D32_var*
//#UC END# *5617F4D00243_E94AE4FC3D32_var*
begin
//#UC START# *5617F4D00243_E94AE4FC3D32_impl*
 !!! Needs to be implemented !!!
//#UC END# *5617F4D00243_E94AE4FC3D32_impl*
end;//TkwPopComboBoxSelectItem.ParamsTypes

procedure TkwPopComboBoxSetItemIndex.SetItemIndex(const aCtx: TtfwContext;
 aComboBox: TCustomComboBox;
 anIndex: Integer);
 {* ���������� ����� ������� pop:ComboBox:SetItemIndex }
//#UC START# *589DC0B1C0D3_DF10F6F55A61_var*
//#UC END# *589DC0B1C0D3_DF10F6F55A61_var*
begin
//#UC START# *589DC0B1C0D3_DF10F6F55A61_impl*
 aCombobox.ItemIndex := anIndex;
 TCustomComboBoxFriend(aCombobox).Select;
//#UC END# *589DC0B1C0D3_DF10F6F55A61_impl*
end;//TkwPopComboBoxSetItemIndex.SetItemIndex

procedure TkwPopComboBoxSetItemIndex.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_DF10F6F55A61_var*
//#UC END# *4DAEEDE10285_DF10F6F55A61_var*
begin
//#UC START# *4DAEEDE10285_DF10F6F55A61_impl*
 !!! Needs to be implemented !!!
//#UC END# *4DAEEDE10285_DF10F6F55A61_impl*
end;//TkwPopComboBoxSetItemIndex.DoDoIt

class function TkwPopComboBoxSetItemIndex.GetWordNameForRegister: AnsiString;
begin
 Result := 'pop:ComboBox:SetItemIndex';
end;//TkwPopComboBoxSetItemIndex.GetWordNameForRegister

function TkwPopComboBoxSetItemIndex.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
//#UC START# *551544E2001A_DF10F6F55A61_var*
//#UC END# *551544E2001A_DF10F6F55A61_var*
begin
//#UC START# *551544E2001A_DF10F6F55A61_impl*
 !!! Needs to be implemented !!!
//#UC END# *551544E2001A_DF10F6F55A61_impl*
end;//TkwPopComboBoxSetItemIndex.GetResultTypeInfo

function TkwPopComboBoxSetItemIndex.GetAllParamsCount(const aCtx: TtfwContext): Integer;
//#UC START# *559687E6025A_DF10F6F55A61_var*
//#UC END# *559687E6025A_DF10F6F55A61_var*
begin
//#UC START# *559687E6025A_DF10F6F55A61_impl*
 !!! Needs to be implemented !!!
//#UC END# *559687E6025A_DF10F6F55A61_impl*
end;//TkwPopComboBoxSetItemIndex.GetAllParamsCount

function TkwPopComboBoxSetItemIndex.ParamsTypes: PTypeInfoArray;
//#UC START# *5617F4D00243_DF10F6F55A61_var*
//#UC END# *5617F4D00243_DF10F6F55A61_var*
begin
//#UC START# *5617F4D00243_DF10F6F55A61_impl*
 !!! Needs to be implemented !!!
//#UC END# *5617F4D00243_DF10F6F55A61_impl*
end;//TkwPopComboBoxSetItemIndex.ParamsTypes

procedure TkwPopComboBoxSaveItems.SaveItems(const aCtx: TtfwContext;
 aComboBox: TCustomComboBox;
 const aFileName: AnsiString);
 {* ���������� ����� ������� pop:ComboBox:SaveItems }
//#UC START# *414096239FD4_F4F78563FAA5_var*
var
 l_S: AnsiString;
 l_Filer : Tl3CustomDosFiler;
 I: Integer;
 l_Count: Integer;
//#UC END# *414096239FD4_F4F78563FAA5_var*
begin
//#UC START# *414096239FD4_F4F78563FAA5_impl*
 l_S := aCtx.rCaller.ResolveOutputFilePath(aFileName);
 l_S := ChangeFileExt(l_S, '.cmbx');
 l_Filer := Tl3CustomDosFiler.Make(l_S, l3_fmWrite, false);
 try
  l_Filer.Open;
  try
   l_Count := aCombobox.Items.Count;
   for I := 0 to l_Count - 1 do
    l_Filer.WriteLn(aCombobox.Items[I]);
  finally
   l_Filer.Close;
  end;
 finally
  FreeAndNil(l_Filer);
 end;//try..finally
//#UC END# *414096239FD4_F4F78563FAA5_impl*
end;//TkwPopComboBoxSaveItems.SaveItems

procedure TkwPopComboBoxSaveItems.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_F4F78563FAA5_var*
//#UC END# *4DAEEDE10285_F4F78563FAA5_var*
begin
//#UC START# *4DAEEDE10285_F4F78563FAA5_impl*
 !!! Needs to be implemented !!!
//#UC END# *4DAEEDE10285_F4F78563FAA5_impl*
end;//TkwPopComboBoxSaveItems.DoDoIt

class function TkwPopComboBoxSaveItems.GetWordNameForRegister: AnsiString;
begin
 Result := 'pop:ComboBox:SaveItems';
end;//TkwPopComboBoxSaveItems.GetWordNameForRegister

function TkwPopComboBoxSaveItems.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
//#UC START# *551544E2001A_F4F78563FAA5_var*
//#UC END# *551544E2001A_F4F78563FAA5_var*
begin
//#UC START# *551544E2001A_F4F78563FAA5_impl*
 !!! Needs to be implemented !!!
//#UC END# *551544E2001A_F4F78563FAA5_impl*
end;//TkwPopComboBoxSaveItems.GetResultTypeInfo

function TkwPopComboBoxSaveItems.GetAllParamsCount(const aCtx: TtfwContext): Integer;
//#UC START# *559687E6025A_F4F78563FAA5_var*
//#UC END# *559687E6025A_F4F78563FAA5_var*
begin
//#UC START# *559687E6025A_F4F78563FAA5_impl*
 !!! Needs to be implemented !!!
//#UC END# *559687E6025A_F4F78563FAA5_impl*
end;//TkwPopComboBoxSaveItems.GetAllParamsCount

function TkwPopComboBoxSaveItems.ParamsTypes: PTypeInfoArray;
//#UC START# *5617F4D00243_F4F78563FAA5_var*
//#UC END# *5617F4D00243_F4F78563FAA5_var*
begin
//#UC START# *5617F4D00243_F4F78563FAA5_impl*
 !!! Needs to be implemented !!!
//#UC END# *5617F4D00243_F4F78563FAA5_impl*
end;//TkwPopComboBoxSaveItems.ParamsTypes

procedure TkwPopComboTreeDropDown.DropDown(const aCtx: TtfwContext;
 aComboTree: TvtComboTree;
 aValue: Boolean);
 {* ���������� ����� ������� pop:ComboTree:DropDown }
//#UC START# *BB9DD9C656EE_CBB40EABEDB6_var*
//#UC END# *BB9DD9C656EE_CBB40EABEDB6_var*
begin
//#UC START# *BB9DD9C656EE_CBB40EABEDB6_impl*
 aComboTree.Dropped := aValue;
//#UC END# *BB9DD9C656EE_CBB40EABEDB6_impl*
end;//TkwPopComboTreeDropDown.DropDown

procedure TkwPopComboTreeDropDown.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_CBB40EABEDB6_var*
//#UC END# *4DAEEDE10285_CBB40EABEDB6_var*
begin
//#UC START# *4DAEEDE10285_CBB40EABEDB6_impl*
 !!! Needs to be implemented !!!
//#UC END# *4DAEEDE10285_CBB40EABEDB6_impl*
end;//TkwPopComboTreeDropDown.DoDoIt

class function TkwPopComboTreeDropDown.GetWordNameForRegister: AnsiString;
begin
 Result := 'pop:ComboTree:DropDown';
end;//TkwPopComboTreeDropDown.GetWordNameForRegister

function TkwPopComboTreeDropDown.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
//#UC START# *551544E2001A_CBB40EABEDB6_var*
//#UC END# *551544E2001A_CBB40EABEDB6_var*
begin
//#UC START# *551544E2001A_CBB40EABEDB6_impl*
 !!! Needs to be implemented !!!
//#UC END# *551544E2001A_CBB40EABEDB6_impl*
end;//TkwPopComboTreeDropDown.GetResultTypeInfo

function TkwPopComboTreeDropDown.GetAllParamsCount(const aCtx: TtfwContext): Integer;
//#UC START# *559687E6025A_CBB40EABEDB6_var*
//#UC END# *559687E6025A_CBB40EABEDB6_var*
begin
//#UC START# *559687E6025A_CBB40EABEDB6_impl*
 !!! Needs to be implemented !!!
//#UC END# *559687E6025A_CBB40EABEDB6_impl*
end;//TkwPopComboTreeDropDown.GetAllParamsCount

function TkwPopComboTreeDropDown.ParamsTypes: PTypeInfoArray;
//#UC START# *5617F4D00243_CBB40EABEDB6_var*
//#UC END# *5617F4D00243_CBB40EABEDB6_var*
begin
//#UC START# *5617F4D00243_CBB40EABEDB6_impl*
 !!! Needs to be implemented !!!
//#UC END# *5617F4D00243_CBB40EABEDB6_impl*
end;//TkwPopComboTreeDropDown.ParamsTypes

function TkwPopComboTreeGetItemIndex.GetItemIndex(const aCtx: TtfwContext;
 aComboTree: TvtComboTree): Integer;
 {* ���������� ����� ������� pop:ComboTree:GetItemIndex }
//#UC START# *1C4FCF6402FE_FDB2008A1DAA_var*
//#UC END# *1C4FCF6402FE_FDB2008A1DAA_var*
begin
//#UC START# *1C4FCF6402FE_FDB2008A1DAA_impl*
 if Assigned(aComboTree.ChoosenValue) then
  Result := aComboTree.FindIndexOf(aComboTree.ChoosenValue)
 else
  Result := aComboTree.ItemIndex;
//#UC END# *1C4FCF6402FE_FDB2008A1DAA_impl*
end;//TkwPopComboTreeGetItemIndex.GetItemIndex

procedure TkwPopComboTreeGetItemIndex.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_FDB2008A1DAA_var*
//#UC END# *4DAEEDE10285_FDB2008A1DAA_var*
begin
//#UC START# *4DAEEDE10285_FDB2008A1DAA_impl*
 !!! Needs to be implemented !!!
//#UC END# *4DAEEDE10285_FDB2008A1DAA_impl*
end;//TkwPopComboTreeGetItemIndex.DoDoIt

class function TkwPopComboTreeGetItemIndex.GetWordNameForRegister: AnsiString;
begin
 Result := 'pop:ComboTree:GetItemIndex';
end;//TkwPopComboTreeGetItemIndex.GetWordNameForRegister

function TkwPopComboTreeGetItemIndex.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
//#UC START# *551544E2001A_FDB2008A1DAA_var*
//#UC END# *551544E2001A_FDB2008A1DAA_var*
begin
//#UC START# *551544E2001A_FDB2008A1DAA_impl*
 !!! Needs to be implemented !!!
//#UC END# *551544E2001A_FDB2008A1DAA_impl*
end;//TkwPopComboTreeGetItemIndex.GetResultTypeInfo

function TkwPopComboTreeGetItemIndex.GetAllParamsCount(const aCtx: TtfwContext): Integer;
//#UC START# *559687E6025A_FDB2008A1DAA_var*
//#UC END# *559687E6025A_FDB2008A1DAA_var*
begin
//#UC START# *559687E6025A_FDB2008A1DAA_impl*
 !!! Needs to be implemented !!!
//#UC END# *559687E6025A_FDB2008A1DAA_impl*
end;//TkwPopComboTreeGetItemIndex.GetAllParamsCount

function TkwPopComboTreeGetItemIndex.ParamsTypes: PTypeInfoArray;
//#UC START# *5617F4D00243_FDB2008A1DAA_var*
//#UC END# *5617F4D00243_FDB2008A1DAA_var*
begin
//#UC START# *5617F4D00243_FDB2008A1DAA_impl*
 !!! Needs to be implemented !!!
//#UC END# *5617F4D00243_FDB2008A1DAA_impl*
end;//TkwPopComboTreeGetItemIndex.ParamsTypes

function TkwPopComboTreeIndexOf.IndexOf(const aCtx: TtfwContext;
 aComboTree: TvtComboTree;
 const aString: AnsiString): Integer;
 {* ���������� ����� ������� pop:ComboTree:IndexOf }
//#UC START# *6E676C6B7B53_C0C842FB1A8C_var*
//#UC END# *6E676C6B7B53_C0C842FB1A8C_var*
begin
//#UC START# *6E676C6B7B53_C0C842FB1A8C_impl*
 Result := aComboTree.Items.IndexOf(aString);
//#UC END# *6E676C6B7B53_C0C842FB1A8C_impl*
end;//TkwPopComboTreeIndexOf.IndexOf

procedure TkwPopComboTreeIndexOf.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_C0C842FB1A8C_var*
//#UC END# *4DAEEDE10285_C0C842FB1A8C_var*
begin
//#UC START# *4DAEEDE10285_C0C842FB1A8C_impl*
 !!! Needs to be implemented !!!
//#UC END# *4DAEEDE10285_C0C842FB1A8C_impl*
end;//TkwPopComboTreeIndexOf.DoDoIt

class function TkwPopComboTreeIndexOf.GetWordNameForRegister: AnsiString;
begin
 Result := 'pop:ComboTree:IndexOf';
end;//TkwPopComboTreeIndexOf.GetWordNameForRegister

function TkwPopComboTreeIndexOf.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
//#UC START# *551544E2001A_C0C842FB1A8C_var*
//#UC END# *551544E2001A_C0C842FB1A8C_var*
begin
//#UC START# *551544E2001A_C0C842FB1A8C_impl*
 !!! Needs to be implemented !!!
//#UC END# *551544E2001A_C0C842FB1A8C_impl*
end;//TkwPopComboTreeIndexOf.GetResultTypeInfo

function TkwPopComboTreeIndexOf.GetAllParamsCount(const aCtx: TtfwContext): Integer;
//#UC START# *559687E6025A_C0C842FB1A8C_var*
//#UC END# *559687E6025A_C0C842FB1A8C_var*
begin
//#UC START# *559687E6025A_C0C842FB1A8C_impl*
 !!! Needs to be implemented !!!
//#UC END# *559687E6025A_C0C842FB1A8C_impl*
end;//TkwPopComboTreeIndexOf.GetAllParamsCount

function TkwPopComboTreeIndexOf.ParamsTypes: PTypeInfoArray;
//#UC START# *5617F4D00243_C0C842FB1A8C_var*
//#UC END# *5617F4D00243_C0C842FB1A8C_var*
begin
//#UC START# *5617F4D00243_C0C842FB1A8C_impl*
 !!! Needs to be implemented !!!
//#UC END# *5617F4D00243_C0C842FB1A8C_impl*
end;//TkwPopComboTreeIndexOf.ParamsTypes

procedure TkwPopComboTreeSelectItem.SelectItem(const aCtx: TtfwContext;
 aComboTree: TvtComboTree;
 const aString: AnsiString);
 {* ���������� ����� ������� pop:ComboTree:SelectItem }
//#UC START# *8E1C1B564723_B5A21C7BEE37_var*
//#UC END# *8E1C1B564723_B5A21C7BEE37_var*
begin
//#UC START# *8E1C1B564723_B5A21C7BEE37_impl*
 aComboTree.ItemIndex := aComboTree.Items.IndexOf(aString);
//#UC END# *8E1C1B564723_B5A21C7BEE37_impl*
end;//TkwPopComboTreeSelectItem.SelectItem

procedure TkwPopComboTreeSelectItem.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_B5A21C7BEE37_var*
//#UC END# *4DAEEDE10285_B5A21C7BEE37_var*
begin
//#UC START# *4DAEEDE10285_B5A21C7BEE37_impl*
 !!! Needs to be implemented !!!
//#UC END# *4DAEEDE10285_B5A21C7BEE37_impl*
end;//TkwPopComboTreeSelectItem.DoDoIt

class function TkwPopComboTreeSelectItem.GetWordNameForRegister: AnsiString;
begin
 Result := 'pop:ComboTree:SelectItem';
end;//TkwPopComboTreeSelectItem.GetWordNameForRegister

function TkwPopComboTreeSelectItem.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
//#UC START# *551544E2001A_B5A21C7BEE37_var*
//#UC END# *551544E2001A_B5A21C7BEE37_var*
begin
//#UC START# *551544E2001A_B5A21C7BEE37_impl*
 !!! Needs to be implemented !!!
//#UC END# *551544E2001A_B5A21C7BEE37_impl*
end;//TkwPopComboTreeSelectItem.GetResultTypeInfo

function TkwPopComboTreeSelectItem.GetAllParamsCount(const aCtx: TtfwContext): Integer;
//#UC START# *559687E6025A_B5A21C7BEE37_var*
//#UC END# *559687E6025A_B5A21C7BEE37_var*
begin
//#UC START# *559687E6025A_B5A21C7BEE37_impl*
 !!! Needs to be implemented !!!
//#UC END# *559687E6025A_B5A21C7BEE37_impl*
end;//TkwPopComboTreeSelectItem.GetAllParamsCount

function TkwPopComboTreeSelectItem.ParamsTypes: PTypeInfoArray;
//#UC START# *5617F4D00243_B5A21C7BEE37_var*
//#UC END# *5617F4D00243_B5A21C7BEE37_var*
begin
//#UC START# *5617F4D00243_B5A21C7BEE37_impl*
 !!! Needs to be implemented !!!
//#UC END# *5617F4D00243_B5A21C7BEE37_impl*
end;//TkwPopComboTreeSelectItem.ParamsTypes

procedure TkwPopComboTreeSetItemIndex.SetItemIndex(const aCtx: TtfwContext;
 aComboTree: TvtComboTree;
 anIndex: Integer);
 {* ���������� ����� ������� pop:ComboTree:SetItemIndex }
//#UC START# *6A72CBA7686D_8C448529271A_var*
var
 l_Node: Il3SimpleNode;
//#UC END# *6A72CBA7686D_8C448529271A_var*
begin
//#UC START# *6A72CBA7686D_8C448529271A_impl*
 if (aComboTree is TvtComboBoxQS) then //561950536
  aComboTree.ItemIndex := anIndex
 else
 begin
  l_Node := aComboTree.Tree.GetNode(anIndex);
  aComboTree.Tree.GotoOnNode(l_Node);
  aComboTree.ShowNode(l_Node, True);
 end;//aComboTree is TvtComboBoxQS
//#UC END# *6A72CBA7686D_8C448529271A_impl*
end;//TkwPopComboTreeSetItemIndex.SetItemIndex

procedure TkwPopComboTreeSetItemIndex.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_8C448529271A_var*
//#UC END# *4DAEEDE10285_8C448529271A_var*
begin
//#UC START# *4DAEEDE10285_8C448529271A_impl*
 !!! Needs to be implemented !!!
//#UC END# *4DAEEDE10285_8C448529271A_impl*
end;//TkwPopComboTreeSetItemIndex.DoDoIt

class function TkwPopComboTreeSetItemIndex.GetWordNameForRegister: AnsiString;
begin
 Result := 'pop:ComboTree:SetItemIndex';
end;//TkwPopComboTreeSetItemIndex.GetWordNameForRegister

function TkwPopComboTreeSetItemIndex.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
//#UC START# *551544E2001A_8C448529271A_var*
//#UC END# *551544E2001A_8C448529271A_var*
begin
//#UC START# *551544E2001A_8C448529271A_impl*
 !!! Needs to be implemented !!!
//#UC END# *551544E2001A_8C448529271A_impl*
end;//TkwPopComboTreeSetItemIndex.GetResultTypeInfo

function TkwPopComboTreeSetItemIndex.GetAllParamsCount(const aCtx: TtfwContext): Integer;
//#UC START# *559687E6025A_8C448529271A_var*
//#UC END# *559687E6025A_8C448529271A_var*
begin
//#UC START# *559687E6025A_8C448529271A_impl*
 !!! Needs to be implemented !!!
//#UC END# *559687E6025A_8C448529271A_impl*
end;//TkwPopComboTreeSetItemIndex.GetAllParamsCount

function TkwPopComboTreeSetItemIndex.ParamsTypes: PTypeInfoArray;
//#UC START# *5617F4D00243_8C448529271A_var*
//#UC END# *5617F4D00243_8C448529271A_var*
begin
//#UC START# *5617F4D00243_8C448529271A_impl*
 !!! Needs to be implemented !!!
//#UC END# *5617F4D00243_8C448529271A_impl*
end;//TkwPopComboTreeSetItemIndex.ParamsTypes

procedure TkwPopComboTreeSaveItems.SaveItems(const aCtx: TtfwContext;
 aComboTree: TvtComboTree;
 const aFileName: AnsiString);
 {* ���������� ����� ������� pop:ComboTree:SaveItems }
//#UC START# *1F4D33D465E4_957FA5E0E3AB_var*
var
 l_S: AnsiString;
 l_Filer : Tl3CustomDosFiler;
//#UC END# *1F4D33D465E4_957FA5E0E3AB_var*
begin
//#UC START# *1F4D33D465E4_957FA5E0E3AB_impl*
 l_S := aCtx.rCaller.ResolveOutputFilePath(aFileName);
 l_S := ChangeFileExt(l_S, '.cmbx');
 l_Filer := Tl3CustomDosFiler.Make(l_S, l3_fmWrite, false);
 try
  l_Filer.Open;
  try
   l_Filer.WriteLn((aComboTree.Items as Il3Strings).Items.Text);
  finally
   l_Filer.Close;
  end;
 finally
  FreeAndNil(l_Filer);
 end;//try..finally
//#UC END# *1F4D33D465E4_957FA5E0E3AB_impl*
end;//TkwPopComboTreeSaveItems.SaveItems

procedure TkwPopComboTreeSaveItems.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_957FA5E0E3AB_var*
//#UC END# *4DAEEDE10285_957FA5E0E3AB_var*
begin
//#UC START# *4DAEEDE10285_957FA5E0E3AB_impl*
 !!! Needs to be implemented !!!
//#UC END# *4DAEEDE10285_957FA5E0E3AB_impl*
end;//TkwPopComboTreeSaveItems.DoDoIt

class function TkwPopComboTreeSaveItems.GetWordNameForRegister: AnsiString;
begin
 Result := 'pop:ComboTree:SaveItems';
end;//TkwPopComboTreeSaveItems.GetWordNameForRegister

function TkwPopComboTreeSaveItems.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
//#UC START# *551544E2001A_957FA5E0E3AB_var*
//#UC END# *551544E2001A_957FA5E0E3AB_var*
begin
//#UC START# *551544E2001A_957FA5E0E3AB_impl*
 !!! Needs to be implemented !!!
//#UC END# *551544E2001A_957FA5E0E3AB_impl*
end;//TkwPopComboTreeSaveItems.GetResultTypeInfo

function TkwPopComboTreeSaveItems.GetAllParamsCount(const aCtx: TtfwContext): Integer;
//#UC START# *559687E6025A_957FA5E0E3AB_var*
//#UC END# *559687E6025A_957FA5E0E3AB_var*
begin
//#UC START# *559687E6025A_957FA5E0E3AB_impl*
 !!! Needs to be implemented !!!
//#UC END# *559687E6025A_957FA5E0E3AB_impl*
end;//TkwPopComboTreeSaveItems.GetAllParamsCount

function TkwPopComboTreeSaveItems.ParamsTypes: PTypeInfoArray;
//#UC START# *5617F4D00243_957FA5E0E3AB_var*
//#UC END# *5617F4D00243_957FA5E0E3AB_var*
begin
//#UC START# *5617F4D00243_957FA5E0E3AB_impl*
 !!! Needs to be implemented !!!
//#UC END# *5617F4D00243_957FA5E0E3AB_impl*
end;//TkwPopComboTreeSaveItems.ParamsTypes

initialization
 TvtComboBoxWordsPackResNameGetter.Register;
 {* ����������� ������������ ����������� }
 TkwPopComboBoxDropDown.RegisterInEngine;
 {* ����������� pop_ComboBox_DropDown }
 TkwPopComboBoxGetItemIndex.RegisterInEngine;
 {* ����������� pop_ComboBox_GetItemIndex }
 TkwPopComboBoxIndexOf.RegisterInEngine;
 {* ����������� pop_ComboBox_IndexOf }
 TkwPopComboBoxSelectItem.RegisterInEngine;
 {* ����������� pop_ComboBox_SelectItem }
 TkwPopComboBoxSetItemIndex.RegisterInEngine;
 {* ����������� pop_ComboBox_SetItemIndex }
 TkwPopComboBoxSaveItems.RegisterInEngine;
 {* ����������� pop_ComboBox_SaveItems }
 TkwPopComboTreeDropDown.RegisterInEngine;
 {* ����������� pop_ComboTree_DropDown }
 TkwPopComboTreeGetItemIndex.RegisterInEngine;
 {* ����������� pop_ComboTree_GetItemIndex }
 TkwPopComboTreeIndexOf.RegisterInEngine;
 {* ����������� pop_ComboTree_IndexOf }
 TkwPopComboTreeSelectItem.RegisterInEngine;
 {* ����������� pop_ComboTree_SelectItem }
 TkwPopComboTreeSetItemIndex.RegisterInEngine;
 {* ����������� pop_ComboTree_SetItemIndex }
 TkwPopComboTreeSaveItems.RegisterInEngine;
 {* ����������� pop_ComboTree_SaveItems }
 TtfwTypeRegistrator.RegisterType(@tfw_tiStruct);
 {* ����������� ���� TtfwContext }
 TtfwTypeRegistrator.RegisterType(TypeInfo(TCustomComboBox));
 {* ����������� ���� TCustomComboBox }
 TtfwTypeRegistrator.RegisterType(TypeInfo(Boolean));
 {* ����������� ���� Boolean }
 TtfwTypeRegistrator.RegisterType(TypeInfo(Integer));
 {* ����������� ���� Integer }
 TtfwTypeRegistrator.RegisterType(@tfw_tiString);
 {* ����������� ���� String }
 TtfwTypeRegistrator.RegisterType(TypeInfo(TvtComboTree));
 {* ����������� ���� TvtComboTree }
{$IfEnd} // NOT Defined(NoScripts)

end.
