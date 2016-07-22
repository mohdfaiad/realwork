unit PrimLongProcess_Form;
 {* ���������� }

// ������: "w:\garant6x\implementation\Garant\GbaNemesis\View\PrimCommon\Forms\PrimLongProcess_Form.pas"
// ���������: "VCMForm"
// ������� ������: "PrimLongProcess" MUID: (4A93DDAE0396)
// ��� ����: "TPrimLongProcessForm"

{$Include w:\garant6x\implementation\Garant\nsDefine.inc}

interface

uses
 l3IntfUses
 {$If NOT Defined(NoVCM)}
 , vcmEntityForm
 {$IfEnd} // NOT Defined(NoVCM)
 , vtPanel
 {$If NOT Defined(NoVCM)}
 , vcmInterfaces
 {$IfEnd} // NOT Defined(NoVCM)
 , vtLabel
 , vtGradientWaitbar
 {$If NOT Defined(NoVCL)}
 , ExtCtrls
 {$IfEnd} // NOT Defined(NoVCL)
 , vtButton
 , Messages
 {$If NOT Defined(NoVCL)}
 , Controls
 {$IfEnd} // NOT Defined(NoVCL)
 , l3Interfaces
 , nsTypes
 {$If NOT Defined(NoVCM)}
 , vcmExternalInterfaces
 {$IfEnd} // NOT Defined(NoVCM)
;

type
 TnsLongProcessData = {$IfDef XE4}record{$Else}object{$EndIf}
  public
   rMessage: Il3CString;
   rMessageType: TnsLongProcessType;
   rIconName: PAnsiChar;
 end;//TnsLongProcessData

 TPrimLongProcessForm = class({$If NOT Defined(NoVCM)}
 TvcmEntityForm
 {$IfEnd} // NOT Defined(NoVCM)
 )
  {* ���������� }
  private
   f_InLongProcess: Boolean;
   f_ClientPanel: TvtPanel;
   f_BottomPanel: TvtPanel;
   f_LeftPanel: TvtPanel;
   f_ButtonPanel: TvtPanel;
   f_MessageLabel: TvtLabel;
   f_ProgressBar: TvtGradientWaitbar;
   f_Image: TImage;
   f_btnExit: TvtButton;
    {* ����� }
  protected
   f_Data: TnsLongProcessData;
  private
   procedure Prepare;
    {* ���������� ����� � �������� �� ������ ������ f_Data }
   procedure btnExitClick(Sender: TObject);
   procedure vcmEntityFormCloseQuery(Sender: TObject;
    var CanClose: Boolean);
   procedure WMSysCommand(var Message: TWMSysCommand); message WM_SYSCOMMAND;
  protected
   procedure Cleanup; override;
    {* ������� ������� ����� �������. }
   {$If NOT Defined(NoVCL)}
   procedure CreateParams(var Params: TCreateParams); override;
   {$IfEnd} // NOT Defined(NoVCL)
   {$If NOT Defined(NoVCM)}
   procedure InitControls; override;
    {* ��������� ������������� ���������. ��� ���������� � �������� }
   {$IfEnd} // NOT Defined(NoVCM)
   {$If NOT Defined(NoVCM)}
   function HasFormFloatingZoneTypeAndVisible: Boolean; override;
   {$IfEnd} // NOT Defined(NoVCM)
   {$If NOT Defined(NoVCM)}
   procedure MakeControls; override;
   {$IfEnd} // NOT Defined(NoVCM)
  public
   constructor Create(const aData: TnsLongProcessData); reintroduce;
   class function Make(const aData: TnsLongProcessData;
    const aParams: IvcmMakeParams = nil;
    aZoneType: TvcmZoneType = vcm_ztAny;
    aUserType: TvcmEffectiveUserType = 0;
    const aDataSource: IvcmFormDataSource = nil): IvcmEntityForm; reintroduce;
   {$If NOT Defined(NoVCL)}
   function ShowModal: Integer; override;
   {$IfEnd} // NOT Defined(NoVCL)
  public
   property ClientPanel: TvtPanel
    read f_ClientPanel;
   property BottomPanel: TvtPanel
    read f_BottomPanel;
   property LeftPanel: TvtPanel
    read f_LeftPanel;
   property ButtonPanel: TvtPanel
    read f_ButtonPanel;
   property MessageLabel: TvtLabel
    read f_MessageLabel;
   property ProgressBar: TvtGradientWaitbar
    read f_ProgressBar;
   property Image: TImage
    read f_Image;
   property btnExit: TvtButton
    read f_btnExit;
    {* ����� }
 end;//TPrimLongProcessForm

function TnsLongProcessData_C(const aMessage: Il3CString;
 aMessageType: TnsLongProcessType;
 anIconName: PAnsiChar): TnsLongProcessData;

implementation

uses
 l3ImplUses
 , Windows
 , l3String
 , l3AsincMessageWindowRes
 , DataAdapter
 , afwFacade
 , Graphics
 {$If NOT Defined(NoVCM) AND NOT Defined(NoVGScene) AND NOT Defined(NoTabs)}
 , vcmTabbedContainerFormDispatcher
 {$IfEnd} // NOT Defined(NoVCM) AND NOT Defined(NoVGScene) AND NOT Defined(NoTabs)
 {$If NOT Defined(NoVCL)}
 , Forms
 {$IfEnd} // NOT Defined(NoVCL)
 , Classes
 {$If NOT Defined(NoVCM)}
 , vcmBase
 {$IfEnd} // NOT Defined(NoVCM)
 , l3Base
 {$If NOT Defined(NoScripts)}
 , TtfwClassRef_Proxy
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoVCM)}
 , StdRes
 {$IfEnd} // NOT Defined(NoVCM)
 //#UC START# *4A93DDAE0396impl_uses*
 //#UC END# *4A93DDAE0396impl_uses*
;

{$If NOT Defined(NoVCM)}
function TnsLongProcessData_C(const aMessage: Il3CString;
 aMessageType: TnsLongProcessType;
 anIconName: PAnsiChar): TnsLongProcessData;
//#UC START# *4B17B6FA024F_498C7D4301A5_var*
//#UC END# *4B17B6FA024F_498C7D4301A5_var*
begin
 Finalize(Result);
 System.FillChar(Result, SizeOf(Result), 0);
//#UC START# *4B17B6FA024F_498C7D4301A5_impl*
 Result.rMessage := aMessage;
 Result.rMessageType := aMessageType;
 Result.rIconName := anIconName;
//#UC END# *4B17B6FA024F_498C7D4301A5_impl*
end;//TnsLongProcessData_C

procedure TPrimLongProcessForm.Prepare;
 {* ���������� ����� � �������� �� ������ ������ f_Data }
//#UC START# *523ABFDC0014_4A93DDAE0396_var*
//#UC END# *523ABFDC0014_4A93DDAE0396_var*
begin
//#UC START# *523ABFDC0014_4A93DDAE0396_impl*
 //if f_Data <> nil then
 begin
  Image.Picture.Icon.Handle := LoadIconA(0, f_Data.rIconName);
  // � ���������� ����� ����� ���-�� �������� �� ������� �����
  ProgressBar.Active := True;
  FormStyle := fsNormal;
  f_InLongProcess := True;
  case f_Data.rMessageType of
   lptUpdate:
    begin
     CCaption := vcmCStr(str_lpUpdateCaption);
     MessageLabel.CCaption := l3Cat([vcmCStr(str_lpUpdateMessage), vcmCStr(str_lpExitMessage)]);
    end;
   lptProcessWithExit,
   lptProcessWithoutExit:
    begin
     if not l3IsNil(f_Data.rMessage) then
      MessageLabel.CCaption := l3Cat([f_Data.rMessage, vcmCStr(str_lpWaitMessage)])
     else
      MessageLabel.CCaption := l3Cat([str_l3mmLongOperation.AsCStr, vcmCStr(str_lpWaitMessage)]);
     if f_Data.rMessageType = lptProcessWithoutExit then
     begin
      ButtonPanel.Visible := False;
      Height := Height - ButtonPanel.Height;
     end
     else
      MessageLabel.CCaption := l3Cat([MessageLabel.CCaption, vcmCStr(str_lpExitMessage)]);
    end;
   else
    MessageLabel.CCaption := vcmCStr(str_lpWaitMessage);
  end;
 end;
//#UC END# *523ABFDC0014_4A93DDAE0396_impl*
end;//TPrimLongProcessForm.Prepare

constructor TPrimLongProcessForm.Create(const aData: TnsLongProcessData);
//#UC START# *523AC0C700E6_4A93DDAE0396_var*
//#UC END# *523AC0C700E6_4A93DDAE0396_var*
begin
//#UC START# *523AC0C700E6_4A93DDAE0396_impl*
 inherited Create(nil);
 f_Data := aData;
 Prepare;
//#UC END# *523AC0C700E6_4A93DDAE0396_impl*
end;//TPrimLongProcessForm.Create

procedure TPrimLongProcessForm.btnExitClick(Sender: TObject);
//#UC START# *523AC9A902C2_4A93DDAE0396_var*
//#UC END# *523AC9A902C2_4A93DDAE0396_var*
begin
//#UC START# *523AC9A902C2_4A93DDAE0396_impl*
 {$IfNDef nsWithoutLogin}
 if defDataAdapter.Authorization.IsServerAlive then
 {$EndIf nsWithoutLogin}
 begin
  Hide; // ������ ������� �����
  afw.ProcessMessages; // ������ ���, ����� ����� ����������, �.�. ����� ����� �� ��� �� ������� � ��������� Idle

  {$If not defined(NoTabs)}
  if TvcmTabbedContainerFormDispatcher.Instance.NeedUseTabs then
   TvcmTabbedContainerFormDispatcher.Instance.CloseAll
  else
  {$IfEnd}
   if Assigned(g_Dispatcher) then
    with g_Dispatcher do
    begin
     BeginCancelModal;
     try
      CloseAllWindows;
     finally
      EndCancelModal;
     end;
    end;
 end;//defDataAdapter.Authorization.IsServerAlive

 try
  try
   g_ShowFinalSplash := False;
   GlobalCrashCleanup;
  finally
   GlobalDone;
  end;
 finally
  TerminateProcess(GetCurrentProcess, 255);
 end;
//#UC END# *523AC9A902C2_4A93DDAE0396_impl*
end;//TPrimLongProcessForm.btnExitClick

procedure TPrimLongProcessForm.vcmEntityFormCloseQuery(Sender: TObject;
 var CanClose: Boolean);
//#UC START# *523ADA5A023D_4A93DDAE0396_var*
//#UC END# *523ADA5A023D_4A93DDAE0396_var*
begin
//#UC START# *523ADA5A023D_4A93DDAE0396_impl*
 {$IfDef l3HackedVCL}
 if f_InLongProcess 
    and
    NeedCancelModal then
  f_InLongProcess := false;
 {$EndIf l3HackedVCL} 

 if f_InLongProcess then
  CanClose := false;
//#UC END# *523ADA5A023D_4A93DDAE0396_impl*
end;//TPrimLongProcessForm.vcmEntityFormCloseQuery

class function TPrimLongProcessForm.Make(const aData: TnsLongProcessData;
 const aParams: IvcmMakeParams = nil;
 aZoneType: TvcmZoneType = vcm_ztAny;
 aUserType: TvcmEffectiveUserType = 0;
 const aDataSource: IvcmFormDataSource = nil): IvcmEntityForm;

 procedure AfterCreate(aForm : TPrimLongProcessForm);
 begin
  with aForm do
  begin
  //#UC START# *4AC4E25E0258_4A93DDAE0396_impl*
   f_Data := aData;
   //Assert(f_Data <> nil);
   Prepare;
  //#UC END# *4AC4E25E0258_4A93DDAE0396_impl*
  end;//with aForm
 end;

var
 l_AC : TvcmInitProc;
 l_ACHack : Pointer absolute l_AC;
begin
 l_AC := l3LocalStub(@AfterCreate);
 try
  Result := inherited Make(aParams, aZoneType, aUserType, nil, aDataSource, vcm_utAny, l_AC);
 finally
  l3FreeLocalStub(l_ACHack);
 end;//try..finally
end;//TPrimLongProcessForm.Make

procedure TPrimLongProcessForm.WMSysCommand(var Message: TWMSysCommand);
//#UC START# *523AC0AA0039_4A93DDAE0396_var*
//#UC END# *523AC0AA0039_4A93DDAE0396_var*
begin
//#UC START# *523AC0AA0039_4A93DDAE0396_impl*
 if not (csDesigning in ComponentState) then
 begin
  with Message do begin
   if (CmdType and $FFF0 = SC_MINIMIZE) then
    DefaultHandler(Message)
   else
    inherited;
  end;//with Message
 end
 else
  inherited;
//#UC END# *523AC0AA0039_4A93DDAE0396_impl*
end;//TPrimLongProcessForm.WMSysCommand

procedure TPrimLongProcessForm.Cleanup;
 {* ������� ������� ����� �������. }
//#UC START# *479731C50290_4A93DDAE0396_var*
//#UC END# *479731C50290_4A93DDAE0396_var*
begin
//#UC START# *479731C50290_4A93DDAE0396_impl*
 Finalize(f_Data);
 inherited;
//#UC END# *479731C50290_4A93DDAE0396_impl*
end;//TPrimLongProcessForm.Cleanup

{$If NOT Defined(NoVCL)}
procedure TPrimLongProcessForm.CreateParams(var Params: TCreateParams);
//#UC START# *48C7925A02E5_4A93DDAE0396_var*
var
 l_ExtendedStyle: Integer;
//#UC END# *48C7925A02E5_4A93DDAE0396_var*
begin
//#UC START# *48C7925A02E5_4A93DDAE0396_impl*
 inherited;
 if not (csDesigning in ComponentState) then
 begin
  with Params do
  begin
   ExStyle := ExStyle or WS_EX_APPWINDOW;
   WndParent := GetDesktopWindow;
  end;
  l_ExtendedStyle := GetWindowLong(Application.Handle, GWL_EXSTYLE);
  SetWindowLong(Application.Handle,
                GWL_EXSTYLE,
                l_ExtendedStyle or WS_EX_TOOLWINDOW {AND NOT WS_EX_APPWINDOW}); 
 end;
//#UC END# *48C7925A02E5_4A93DDAE0396_impl*
end;//TPrimLongProcessForm.CreateParams
{$IfEnd} // NOT Defined(NoVCL)

procedure TPrimLongProcessForm.InitControls;
 {* ��������� ������������� ���������. ��� ���������� � �������� }
//#UC START# *4A8E8F2E0195_4A93DDAE0396_var*
//#UC END# *4A8E8F2E0195_4A93DDAE0396_var*
begin
//#UC START# *4A8E8F2E0195_4A93DDAE0396_impl*
 BorderIcons := [];
 BorderStyle := bsDialog;
 ClientHeight := 143;
 ClientWidth := 362;
 Position := poScreenCenter;
 OnCloseQuery := vcmEntityFormCloseQuery;

 with ClientPanel do
 begin
  Align := alClient;
  BevelOuter := bvNone;
  BorderWidth := 4;
  TabOrder := 0;
 end;

 with MessageLabel do
 begin
  Align := alClient;
  WordWrap := True;
 end;

 with BottomPanel do
 begin
  Height := 26;
  Align := alBottom;
  BevelInner := bvLowered;
  BevelOuter := bvNone;
  TabOrder := 1;
 end;

 with ProgressBar do
 begin
  Left := 2;
  Top := 2;
  Width := 358;
  Height := 22;
  Active := False;
  Color1 := clSkyBlue;
  Color2 := clBlue;
  Anchors := [akLeft, akTop, akRight, akBottom];
 end;

 with LeftPanel do
 begin
  Width := 49;
  Align := alLeft;
  BevelOuter := bvNone;
  TabOrder := 2;
 end;

 with Image do
 begin
  Left := 8;
  Top := 8;
  Width := 32;
  Height := 32;
 end;

 with ButtonPanel do
 begin
  Height := 30;
  Align := alBottom;
  BevelOuter := bvNone;
  TabOrder := 3;
  Top := BottomPanel.Top - 1; // ButtonPanel ������ ���� ���� BottomPanel
 end;

 with btnExit do
 begin
  Left := 280;
  Top := 1;
  Width := 75;
  Height := 25;
  //Anchors := [akRight, akBottom];
  TabOrder := 0;
  OnClick := btnExitClick;
 end;
//#UC END# *4A8E8F2E0195_4A93DDAE0396_impl*
end;//TPrimLongProcessForm.InitControls

{$If NOT Defined(NoVCL)}
function TPrimLongProcessForm.ShowModal: Integer;
//#UC START# *520B42AF0115_4A93DDAE0396_var*
//#UC END# *520B42AF0115_4A93DDAE0396_var*
begin
//#UC START# *520B42AF0115_4A93DDAE0396_impl*
 {$IfDef InsiderTest}
 Inc(Self.g_AllowModal);
 try
 {$EndIf InsiderTest}
  Result := inherited ShowModal;
 {$IfDef InsiderTest}
 finally
  Dec(Self.g_AllowModal);
 end;//try..finally
 {$EndIf InsiderTest}
//#UC END# *520B42AF0115_4A93DDAE0396_impl*
end;//TPrimLongProcessForm.ShowModal
{$IfEnd} // NOT Defined(NoVCL)

function TPrimLongProcessForm.HasFormFloatingZoneTypeAndVisible: Boolean;
//#UC START# *523AC062006F_4A93DDAE0396_var*
//#UC END# *523AC062006F_4A93DDAE0396_var*
begin
//#UC START# *523AC062006F_4A93DDAE0396_impl*
 Result := False;
//#UC END# *523AC062006F_4A93DDAE0396_impl*
end;//TPrimLongProcessForm.HasFormFloatingZoneTypeAndVisible

procedure TPrimLongProcessForm.MakeControls;
begin
 inherited;
 f_ClientPanel := TvtPanel.Create(Self);
 f_ClientPanel.Name := 'ClientPanel';
 f_ClientPanel.Parent := Self;
 f_MessageLabel := TvtLabel.Create(Self);
 f_MessageLabel.Name := 'MessageLabel';
 f_MessageLabel.Parent := ClientPanel;
 f_BottomPanel := TvtPanel.Create(Self);
 f_BottomPanel.Name := 'BottomPanel';
 f_BottomPanel.Parent := Self;
 f_ProgressBar := TvtGradientWaitbar.Create(Self);
 f_ProgressBar.Name := 'ProgressBar';
 f_ProgressBar.Parent := BottomPanel;
 f_LeftPanel := TvtPanel.Create(Self);
 f_LeftPanel.Name := 'LeftPanel';
 f_LeftPanel.Parent := Self;
 f_Image := TImage.Create(Self);
 f_Image.Name := 'Image';
 f_Image.Parent := LeftPanel;
 f_ButtonPanel := TvtPanel.Create(Self);
 f_ButtonPanel.Name := 'ButtonPanel';
 f_ButtonPanel.Parent := Self;
 f_btnExit := TvtButton.Create(Self);
 f_btnExit.Name := 'btnExit';
 f_btnExit.Parent := ButtonPanel;
 f_btnExit.Caption := '�����';
end;//TPrimLongProcessForm.MakeControls

initialization
{$If NOT Defined(NoScripts)}
 TtfwClassRef.Register(TPrimLongProcessForm);
 {* ����������� PrimLongProcess }
{$IfEnd} // NOT Defined(NoScripts)
{$IfEnd} // NOT Defined(NoVCM)

end.
