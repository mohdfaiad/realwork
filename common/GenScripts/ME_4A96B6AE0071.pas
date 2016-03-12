unit PrimFolders_Form;
 {* ��� ��������� }

// ������: "w:\garant6x\implementation\Garant\GbaNemesis\View\Folders\Forms\PrimFolders_Form.pas"
// ���������: "VCMContainer"

{$Include w:\garant6x\implementation\Garant\nsDefine.inc}

interface

{$If NOT Defined(Admin) AND NOT Defined(Monitorings)}
uses
 l3IntfUses
 {$If NOT Defined(NoVCM)}
 , OfficeLike_Result_Controls
 {$IfEnd} // NOT Defined(NoVCM)
 , Base_Operations_Strange_Controls
 , Folders_Result_Controls
 , Folders_Strange_Controls
 , vtProportionalPanel
 , vtPanel
 , vtSizeablePanel
 , nsTypes
 , FoldersUnit
 , l3Interfaces
 {$If NOT Defined(NoVCL)}
 , Controls
 {$IfEnd} // NOT Defined(NoVCL)
;

type
 // ParentZone

 // ChildZone

 TPrimFoldersForm = class
  {* ��� ��������� }
  private
   f_IsInfoShown: Boolean;
   f_BackgroundPanel: TvtProportionalPanel;
    {* ���� ��� �������� BackgroundPanel }
   f_ParentZone: TvtPanel;
    {* ���� ��� �������� ParentZone }
   f_ChildZone: TvtSizeablePanel;
    {* ���� ��� �������� ChildZone }
  protected
   procedure utFoldersQueryClose(aSender: TObject);
    {* ���������� ������� utFolders.OnQueryClose }
   procedure FinishDataUpdate; override;
   {$If NOT Defined(NoVCM)}
   procedure DoInit(aFromHistory: Boolean); override;
    {* ������������� �����. ��� ���������� � �������� }
   {$IfEnd} // NOT Defined(NoVCM)
   {$If NOT Defined(NoVCM)}
   procedure InitControls; override;
    {* ��������� ������������� ���������. ��� ���������� � �������� }
   {$IfEnd} // NOT Defined(NoVCM)
   {$If NOT Defined(NoVCL)}
   procedure SetParent(AParent: TWinControl); override;
   {$IfEnd} // NOT Defined(NoVCL)
  public
   {$If NOT Defined(NoVCM)}
   procedure Result_Cancel_Test(const aParams: IvcmTestParamsPrim);
    {* ������ }
   {$IfEnd} // NOT Defined(NoVCM)
   {$If NOT Defined(NoVCM)}
   procedure Result_Cancel_Execute(const aParams: IvcmExecuteParamsPrim);
    {* ������ }
   {$IfEnd} // NOT Defined(NoVCM)
   procedure FoldersControl_EditElement_Execute(const aNode: IFoldersNode);
    {* ������ �������������� �������� }
   procedure FoldersControl_EditElement(const aParams: IvcmExecuteParamsPrim);
    {* ������ �������������� �������� }
   function FoldersControl_DeleteElement_Execute(const aNode: IFoldersNode): TnsDeleteResult;
    {* ������� ������� }
   procedure FoldersControl_DeleteElement(const aParams: IvcmExecuteParamsPrim);
    {* ������� ������� }
   {$If NOT Defined(NoVCM)}
   procedure Result_Ok_Test(const aParams: IvcmTestParamsPrim);
    {* OK }
   {$IfEnd} // NOT Defined(NoVCM)
   {$If NOT Defined(NoVCM)}
   procedure Result_Ok_Execute(const aParams: IvcmExecuteParamsPrim);
    {* OK }
   {$IfEnd} // NOT Defined(NoVCM)
   {$If NOT Defined(NoVCM)}
   procedure Result_Ok_GetState(var State: TvcmOperationStateIndex);
    {* OK }
   {$IfEnd} // NOT Defined(NoVCM)
   procedure Result_Append_Test(const aParams: IvcmTestParamsPrim);
    {* �������� }
   procedure Result_Append_Execute(const aParams: IvcmExecuteParamsPrim);
    {* �������� }
   procedure AdditionInfo_Show_Execute;
   procedure AdditionInfo_Show(const aParams: IvcmExecuteParamsPrim);
   procedure AdditionInfo_Hide_Execute;
   procedure AdditionInfo_Hide(const aParams: IvcmExecuteParamsPrim);
   procedure AdditionInfo_SetCaption_Execute(const aCaption: Il3CString);
   procedure AdditionInfo_SetCaption(const aParams: IvcmExecuteParamsPrim);
   procedure Switcher_BecomeActive_Execute;
   procedure Switcher_BecomeActive(const aParams: IvcmExecuteParamsPrim);
   procedure AdditionInfo_Close_Execute(aModalResult: Integer = mrCancel);
   procedure AdditionInfo_Close(const aParams: IvcmExecuteParamsPrim);
  public
   property BackgroundPanel: TvtProportionalPanel
    read f_BackgroundPanel;
 end;//TPrimFoldersForm
{$IfEnd} // NOT Defined(Admin) AND NOT Defined(Monitorings)

implementation

{$If NOT Defined(Admin) AND NOT Defined(Monitorings)}
uses
 l3ImplUses
 , l3StringIDEx
 {$If NOT Defined(NoVCM)}
 , vcmBase
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , vcmMessagesSupport
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCL)}
 , Forms
 {$IfEnd} // NOT Defined(NoVCL)
 , l3MessageID
 {$If NOT Defined(NoScripts)}
 , TtfwClassRef_Proxy
 {$IfEnd} // NOT Defined(NoScripts)
;

const
 {* ������������ ������ utFoldersLocalConstants }
 str_utFoldersCaption: Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'utFoldersCaption'; rValue : '��� ���������');
  {* ��������� ����������������� ���� "��� ���������" }

procedure TPrimFoldersForm.utFoldersQueryClose(aSender: TObject);
 {* ���������� ������� utFolders.OnQueryClose }
//#UC START# *1BA52F720139_4A96B6AE0071_var*
//#UC END# *1BA52F720139_4A96B6AE0071_var*
begin
//#UC START# *1BA52F720139_4A96B6AE0071_impl*
 SafeClose;
//#UC END# *1BA52F720139_4A96B6AE0071_impl*
end;//TPrimFoldersForm.utFoldersQueryClose

{$If NOT Defined(NoVCM)}
procedure TPrimFoldersForm.Result_Cancel_Test(const aParams: IvcmTestParamsPrim);
 {* ������ }
//#UC START# *4A8AD46D0226_4A96B6AE0071test_var*
//#UC END# *4A8AD46D0226_4A96B6AE0071test_var*
begin
//#UC START# *4A8AD46D0226_4A96B6AE0071test_impl*
 if f_IsInfoShown then
 begin
  aParams.Op.Flag[vcm_ofVisible] := True;
  aParams.Op.Flag[vcm_ofEnabled] := True;
 end
 else
 begin
  aParams.Op.Flag[vcm_ofVisible] := False;
  aParams.Op.Flag[vcm_ofEnabled] := False;
 end;
//#UC END# *4A8AD46D0226_4A96B6AE0071test_impl*
end;//TPrimFoldersForm.Result_Cancel_Test
{$IfEnd} // NOT Defined(NoVCM)

{$If NOT Defined(NoVCM)}
procedure TPrimFoldersForm.Result_Cancel_Execute(const aParams: IvcmExecuteParamsPrim);
 {* ������ }
//#UC START# *4A8AD46D0226_4A96B6AE0071exec_var*
var
 l_Form : IvcmEntityForm;
//#UC END# *4A8AD46D0226_4A96B6AE0071exec_var*
begin
//#UC START# *4A8AD46D0226_4A96B6AE0071exec_impl*
 if f_IsInfoShown and
    HasForm(vcm_ztChild, False, @l_Form) then
  try
   l_Form.Entity.Operation(TdmStdRes.opcode_ResultExt_Cancel, aParams As IvcmExecuteParams);
  finally
   l_Form := nil;
  end;
//#UC END# *4A8AD46D0226_4A96B6AE0071exec_impl*
end;//TPrimFoldersForm.Result_Cancel_Execute
{$IfEnd} // NOT Defined(NoVCM)

procedure TPrimFoldersForm.FoldersControl_EditElement_Execute(const aNode: IFoldersNode);
 {* ������ �������������� �������� }
//#UC START# *4A96A9BE011C_4A96B6AE0071exec_var*
//#UC END# *4A96A9BE011C_4A96B6AE0071exec_var*
begin
//#UC START# *4A96A9BE011C_4A96B6AE0071exec_impl*
 Op_FolderElement_InternalEditByFoldersNode.Call(Aggregate, aNode);
//#UC END# *4A96A9BE011C_4A96B6AE0071exec_impl*
end;//TPrimFoldersForm.FoldersControl_EditElement_Execute

procedure TPrimFoldersForm.FoldersControl_EditElement(const aParams: IvcmExecuteParamsPrim);
 {* ������ �������������� �������� }
begin
 with (aParams.Data As IFoldersControl_EditElement_Params) do
  Self.FoldersControl_EditElement_Execute(Node);
end;//TPrimFoldersForm.FoldersControl_EditElement

function TPrimFoldersForm.FoldersControl_DeleteElement_Execute(const aNode: IFoldersNode): TnsDeleteResult;
 {* ������� ������� }
//#UC START# *4A96A9D10023_4A96B6AE0071exec_var*
//#UC END# *4A96A9D10023_4A96B6AE0071exec_var*
begin
//#UC START# *4A96A9D10023_4A96B6AE0071exec_impl*
 Result := Op_FolderElement_InternalDelete.Call(Aggregate, aNode);
//#UC END# *4A96A9D10023_4A96B6AE0071exec_impl*
end;//TPrimFoldersForm.FoldersControl_DeleteElement_Execute

procedure TPrimFoldersForm.FoldersControl_DeleteElement(const aParams: IvcmExecuteParamsPrim);
 {* ������� ������� }
begin
 with (aParams.Data As IFoldersControl_DeleteElement_Params) do
  ResultValue := Self.FoldersControl_DeleteElement_Execute(Node);
end;//TPrimFoldersForm.FoldersControl_DeleteElement

{$If NOT Defined(NoVCM)}
procedure TPrimFoldersForm.Result_Ok_Test(const aParams: IvcmTestParamsPrim);
 {* OK }
//#UC START# *4A97EBE702F8_4A96B6AE0071test_var*
var
 l_Form : IvcmEntityForm;
//#UC END# *4A97EBE702F8_4A96B6AE0071test_var*
begin
//#UC START# *4A97EBE702F8_4A96B6AE0071test_impl*
 if f_IsInfoShown and
    HasForm(vcm_ztChild, False, @l_Form) then
  try
   l_Form.Entity.Operation(TdmStdRes.opcode_ResultExt_Ok, aParams As IvcmTestParams);
  finally
   l_Form := nil;
  end
 else
 begin
  aParams.Op.Flag[vcm_ofVisible] := False;
  aParams.Op.Flag[vcm_ofEnabled] := False;
 end;
//#UC END# *4A97EBE702F8_4A96B6AE0071test_impl*
end;//TPrimFoldersForm.Result_Ok_Test
{$IfEnd} // NOT Defined(NoVCM)

{$If NOT Defined(NoVCM)}
procedure TPrimFoldersForm.Result_Ok_Execute(const aParams: IvcmExecuteParamsPrim);
 {* OK }
//#UC START# *4A97EBE702F8_4A96B6AE0071exec_var*
var
 l_Form : IvcmEntityForm;
//#UC END# *4A97EBE702F8_4A96B6AE0071exec_var*
begin
//#UC START# *4A97EBE702F8_4A96B6AE0071exec_impl*
 if f_IsInfoShown and
    HasForm(vcm_ztChild, False, @l_Form) then
  try
   l_Form.Entity.Operation(TdmStdRes.opcode_ResultExt_Ok, aParams As IvcmExecuteParams);
  finally
   l_Form := nil;
  end;//try..finally
//#UC END# *4A97EBE702F8_4A96B6AE0071exec_impl*
end;//TPrimFoldersForm.Result_Ok_Execute
{$IfEnd} // NOT Defined(NoVCM)

{$If NOT Defined(NoVCM)}
procedure TPrimFoldersForm.Result_Ok_GetState(var State: TvcmOperationStateIndex);
 {* OK }
//#UC START# *4A97EBE702F8_4A96B6AE0071getstate_var*
//#UC END# *4A97EBE702F8_4A96B6AE0071getstate_var*
begin
//#UC START# *4A97EBE702F8_4A96B6AE0071getstate_impl*
 // Do nothing
//#UC END# *4A97EBE702F8_4A96B6AE0071getstate_impl*
end;//TPrimFoldersForm.Result_Ok_GetState
{$IfEnd} // NOT Defined(NoVCM)

procedure TPrimFoldersForm.Result_Append_Test(const aParams: IvcmTestParamsPrim);
 {* �������� }
//#UC START# *4A98000500BA_4A96B6AE0071test_var*
var
 l_Form : IvcmEntityForm;
//#UC END# *4A98000500BA_4A96B6AE0071test_var*
begin
//#UC START# *4A98000500BA_4A96B6AE0071test_impl*
 if f_IsInfoShown and
    HasForm(vcm_ztChild, False, @l_Form) then
  try
   l_Form.Entity.Operation(TdmStdRes.opcode_ResultExt_Append, aParams As IvcmTestParams);
  finally
   l_Form := nil;
  end
 else
 begin
  aParams.Op.Flag[vcm_ofVisible] := False;
  aParams.Op.Flag[vcm_ofEnabled] := False;
 end;
//#UC END# *4A98000500BA_4A96B6AE0071test_impl*
end;//TPrimFoldersForm.Result_Append_Test

procedure TPrimFoldersForm.Result_Append_Execute(const aParams: IvcmExecuteParamsPrim);
 {* �������� }
//#UC START# *4A98000500BA_4A96B6AE0071exec_var*
var
 l_Form : IvcmEntityForm;
//#UC END# *4A98000500BA_4A96B6AE0071exec_var*
begin
//#UC START# *4A98000500BA_4A96B6AE0071exec_impl*
 if f_IsInfoShown and
    HasForm(vcm_ztChild, False, @l_Form) then
  try
   l_Form.Entity.Operation(TdmStdRes.opcode_ResultExt_Append, aParams As IvcmExecuteParams);
  finally
   l_Form := nil;
  end;
//#UC END# *4A98000500BA_4A96B6AE0071exec_impl*
end;//TPrimFoldersForm.Result_Append_Execute

procedure TPrimFoldersForm.AdditionInfo_Show_Execute;
//#UC START# *4A980672034B_4A96B6AE0071exec_var*
//#UC END# *4A980672034B_4A96B6AE0071exec_var*
begin
//#UC START# *4A980672034B_4A96B6AE0071exec_impl*
 ChildZone.Show;
 f_IsInfoShown := True;
 ManualUpdateActions;
 //
 op_FolderElement_Redraw.Call(Aggregate);
 //
 if (ChildZone.Controls[0] is TvcmEntityForm) then
  TvcmEntityForm(ChildZone.Controls[0]).SetActiveControl;
//#UC END# *4A980672034B_4A96B6AE0071exec_impl*
end;//TPrimFoldersForm.AdditionInfo_Show_Execute

procedure TPrimFoldersForm.AdditionInfo_Show(const aParams: IvcmExecuteParamsPrim);
begin
 Self.AdditionInfo_Show_Execute;
end;//TPrimFoldersForm.AdditionInfo_Show

procedure TPrimFoldersForm.AdditionInfo_Hide_Execute;
//#UC START# *4A9806B600E8_4A96B6AE0071exec_var*
//#UC END# *4A9806B600E8_4A96B6AE0071exec_var*
begin
//#UC START# *4A9806B600E8_4A96B6AE0071exec_impl*
 if (ParentZone.Controls[0] is TvcmEntityForm) then
  TvcmEntityForm(ParentZone.Controls[0]).SetActiveControl;
 //
 ChildZone.Hide;
 f_IsInfoShown := False;
//#UC END# *4A9806B600E8_4A96B6AE0071exec_impl*
end;//TPrimFoldersForm.AdditionInfo_Hide_Execute

procedure TPrimFoldersForm.AdditionInfo_Hide(const aParams: IvcmExecuteParamsPrim);
begin
 Self.AdditionInfo_Hide_Execute;
end;//TPrimFoldersForm.AdditionInfo_Hide

procedure TPrimFoldersForm.AdditionInfo_SetCaption_Execute(const aCaption: Il3CString);
//#UC START# *4A9806D7038D_4A96B6AE0071exec_var*
//#UC END# *4A9806D7038D_4A96B6AE0071exec_var*
begin
//#UC START# *4A9806D7038D_4A96B6AE0071exec_impl*
 CCaption := vcmFmt(str_MyDocumentsCaption, [aCaption]);
//#UC END# *4A9806D7038D_4A96B6AE0071exec_impl*
end;//TPrimFoldersForm.AdditionInfo_SetCaption_Execute

procedure TPrimFoldersForm.AdditionInfo_SetCaption(const aParams: IvcmExecuteParamsPrim);
begin
 with (aParams.Data As IAdditionInfo_SetCaption_Params) do
  Self.AdditionInfo_SetCaption_Execute(Caption);
end;//TPrimFoldersForm.AdditionInfo_SetCaption

procedure TPrimFoldersForm.Switcher_BecomeActive_Execute;
//#UC START# *4A9807F801F9_4A96B6AE0071exec_var*
//#UC END# *4A9807F801F9_4A96B6AE0071exec_var*
begin
//#UC START# *4A9807F801F9_4A96B6AE0071exec_impl*
 SetActiveInParent;
//#UC END# *4A9807F801F9_4A96B6AE0071exec_impl*
end;//TPrimFoldersForm.Switcher_BecomeActive_Execute

procedure TPrimFoldersForm.Switcher_BecomeActive(const aParams: IvcmExecuteParamsPrim);
begin
 Self.Switcher_BecomeActive_Execute;
end;//TPrimFoldersForm.Switcher_BecomeActive

procedure TPrimFoldersForm.AdditionInfo_Close_Execute(aModalResult: Integer = mrCancel);
//#UC START# *4AE9BF890271_4A96B6AE0071exec_var*
//#UC END# *4AE9BF890271_4A96B6AE0071exec_var*
begin
//#UC START# *4AE9BF890271_4A96B6AE0071exec_impl*
 if (ZoneType = vcm_ztManualModal) then
  Self.ModalResult := aModalResult
 else
  SafeClose;
//#UC END# *4AE9BF890271_4A96B6AE0071exec_impl*
end;//TPrimFoldersForm.AdditionInfo_Close_Execute

procedure TPrimFoldersForm.AdditionInfo_Close(const aParams: IvcmExecuteParamsPrim);
begin
 with (aParams.Data As IAdditionInfo_Close_Params) do
  Self.AdditionInfo_Close_Execute(ModalResult);
end;//TPrimFoldersForm.AdditionInfo_Close

procedure TPrimFoldersForm.FinishDataUpdate;
//#UC START# *47EA4E9002C6_4A96B6AE0071_var*
//#UC END# *47EA4E9002C6_4A96B6AE0071_var*
begin
//#UC START# *47EA4E9002C6_4A96B6AE0071_impl*
 inherited;
 ModalResult := mrCancel; // http://mdp.garant.ru/pages/viewpage.action?pageId=316506551 
//#UC END# *47EA4E9002C6_4A96B6AE0071_impl*
end;//TPrimFoldersForm.FinishDataUpdate

{$If NOT Defined(NoVCM)}
procedure TPrimFoldersForm.DoInit(aFromHistory: Boolean);
 {* ������������� �����. ��� ���������� � �������� }
//#UC START# *49803F5503AA_4A96B6AE0071_var*
//#UC END# *49803F5503AA_4A96B6AE0071_var*
begin
//#UC START# *49803F5503AA_4A96B6AE0071_impl*
 inherited;
 ChildZone.Hide;
 f_IsInfoShown := False;
//#UC END# *49803F5503AA_4A96B6AE0071_impl*
end;//TPrimFoldersForm.DoInit
{$IfEnd} // NOT Defined(NoVCM)

{$If NOT Defined(NoVCM)}
procedure TPrimFoldersForm.InitControls;
 {* ��������� ������������� ���������. ��� ���������� � �������� }
//#UC START# *4A8E8F2E0195_4A96B6AE0071_var*
//#UC END# *4A8E8F2E0195_4A96B6AE0071_var*
begin
//#UC START# *4A8E8F2E0195_4A96B6AE0071_impl*
 Height := 531;
 ActiveControl := ParentZone;
 with BackgroundPanel do
 begin
  Align := alClient;
  BevelOuter := bvNone;
 end;
 with ParentZone do
 begin
  Align := alClient;
  BevelOuter := bvNone;
 end;
 with ChildZone do
 begin
  Height := 233;
  ResizeAreaWidth := 5;
  SizeableSides := [szTop];
  SplitterBevel := bvRaised;
  Align := alBottom;
  BevelOuter := bvNone;
 end;
//#UC END# *4A8E8F2E0195_4A96B6AE0071_impl*
end;//TPrimFoldersForm.InitControls
{$IfEnd} // NOT Defined(NoVCM)

{$If NOT Defined(NoVCL)}
procedure TPrimFoldersForm.SetParent(AParent: TWinControl);
//#UC START# *4A97E78202FC_4A96B6AE0071_var*
//#UC END# *4A97E78202FC_4A96B6AE0071_var*
begin
//#UC START# *4A97E78202FC_4A96B6AE0071_impl*
 inherited;
 // ��� ���������� �������� �� DblClick-� ��� �� ��������, ����� � childzone
 // ����� �������� ��� ������������, �.�. Align = alBottom ������� ����� ����
 // ��� ���
 if Assigned(aParent) and (Parent.ClientHeight > 0) and
   (ChildZone.Height > Parent.ClientHeight) then
  ChildZone.Height := Parent.ClientHeight div 2;
//#UC END# *4A97E78202FC_4A96B6AE0071_impl*
end;//TPrimFoldersForm.SetParent
{$IfEnd} // NOT Defined(NoVCL)

initialization
 str_utFoldersCaption.Init;
 {* ������������� str_utFoldersCaption }
{$If NOT Defined(NoScripts)}
 TtfwClassRef.Register(TPrimFoldersForm);
 {* ����������� PrimFolders }
{$IfEnd} // NOT Defined(NoScripts)
{$IfEnd} // NOT Defined(Admin) AND NOT Defined(Monitorings)

end.
