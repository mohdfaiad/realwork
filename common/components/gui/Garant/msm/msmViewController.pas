unit msmViewController;

// ������: "w:\common\components\gui\Garant\msm\msmViewController.pas"
// ���������: "SimpleClass"
// ������� ������: "TmsmViewController" MUID: (57AB0A810292)

{$Include w:\common\components\msm.inc}

interface

uses
 l3IntfUses
 , msmController
 , msmControllers
 {$If NOT Defined(NoVCL)}
 , Menus
 {$IfEnd} // NOT Defined(NoVCL)
 , msmModels
;

type
 TmsmViewController = class(TmsmController, ImsmViewController)
  private
   f_PopupMenu: TPopupMenu;
   f_View: TmsmView;
  protected
   procedure Cleanup; override;
    {* ������� ������� ����� �������. }
   procedure InitFields; override;
   procedure DoActivated; override;
  public
   constructor Create(aView: TmsmView;
    const aModel: ImsmModel); reintroduce;
   class function Make(aView: TmsmView;
    const aModel: ImsmModel): ImsmViewController; reintroduce;
  protected
   property View: TmsmView
    read f_View;
 end;//TmsmViewController

implementation

uses
 l3ImplUses
 , msmOperations
 , Classes
 {$If NOT Defined(NoScripts)}
 , TtfwClassRef_Proxy
 {$IfEnd} // NOT Defined(NoScripts)
 //#UC START# *57AB0A810292impl_uses*
 , SysUtils
 //#UC END# *57AB0A810292impl_uses*
;

type
 TmsmOperationMenuItem = class({$If NOT Defined(NoVCL)}
 TMenuItem
 {$IfEnd} // NOT Defined(NoVCL)
 )
  private
   f_Operation: ImsmOperation;
  protected
   {$If NOT Defined(NoVCL)}
   procedure Click; override;
   {$IfEnd} // NOT Defined(NoVCL)
   {$If NOT Defined(NoVCL)}
   procedure InitiateAction; override;
   {$IfEnd} // NOT Defined(NoVCL)
  public
   constructor Create(anOwner: TComponent;
    const anOperation: ImsmOperation); reintroduce;
   destructor Destroy; override;
 end;//TmsmOperationMenuItem

 TmsmViewFriend = {abstract} class(TmsmView)
  {* ���� � ������ TmsmView }
 end;//TmsmViewFriend

constructor TmsmOperationMenuItem.Create(anOwner: TComponent;
 const anOperation: ImsmOperation);
//#UC START# *57CECAC202FB_57CECA080010_var*
//#UC END# *57CECAC202FB_57CECA080010_var*
begin
//#UC START# *57CECAC202FB_57CECA080010_impl*
 Assert(anOperation <> nil);
 inherited Create(anOwner);
 f_Operation := anOperation;
 Self.Action := f_Operation.Action;
 //Self.Caption := anOperation.Caption;
//#UC END# *57CECAC202FB_57CECA080010_impl*
end;//TmsmOperationMenuItem.Create

destructor TmsmOperationMenuItem.Destroy;
//#UC START# *48077504027E_57CECA080010_var*
//#UC END# *48077504027E_57CECA080010_var*
begin
//#UC START# *48077504027E_57CECA080010_impl*
 f_Operation := nil;
 inherited;
//#UC END# *48077504027E_57CECA080010_impl*
end;//TmsmOperationMenuItem.Destroy

{$If NOT Defined(NoVCL)}
procedure TmsmOperationMenuItem.Click;
//#UC START# *57CECDB70264_57CECA080010_var*
//#UC END# *57CECDB70264_57CECA080010_var*
begin
//#UC START# *57CECDB70264_57CECA080010_impl*
 inherited;
 //f_Operation.DoIt;
//#UC END# *57CECDB70264_57CECA080010_impl*
end;//TmsmOperationMenuItem.Click
{$IfEnd} // NOT Defined(NoVCL)

{$If NOT Defined(NoVCL)}
procedure TmsmOperationMenuItem.InitiateAction;
//#UC START# *57EB857E015E_57CECA080010_var*
var
 l_Popup : Boolean;
//#UC END# *57EB857E015E_57CECA080010_var*
begin
//#UC START# *57EB857E015E_57CECA080010_impl*
 l_Popup := (GetParentMenu Is TPopupMenu);
 inherited;
 // �� ���������� � ����������� ���� �� ��������� ��������. �������� �����
 // ����������� ����� inherited (Action.Update) ����� ��������� ������ ����
 // ������ ����������:
 if l_Popup then
 begin
  if Self.Enabled then
   Self.Visible := true
  else
   Self.Visible := false;
 end;//l_Popup
//#UC END# *57EB857E015E_57CECA080010_impl*
end;//TmsmOperationMenuItem.InitiateAction
{$IfEnd} // NOT Defined(NoVCL)

constructor TmsmViewController.Create(aView: TmsmView;
 const aModel: ImsmModel);
//#UC START# *57AB0AD803AD_57AB0A810292_var*
//#UC END# *57AB0AD803AD_57AB0A810292_var*
begin
//#UC START# *57AB0AD803AD_57AB0A810292_impl*
 Assert(aView <> nil);
 Assert(aModel <> nil);
 inherited Create(aModel);
 f_View := aView;
//#UC END# *57AB0AD803AD_57AB0A810292_impl*
end;//TmsmViewController.Create

class function TmsmViewController.Make(aView: TmsmView;
 const aModel: ImsmModel): ImsmViewController;
var
 l_Inst : TmsmViewController;
begin
 l_Inst := Create(aView, aModel);
 try
  Result := l_Inst;
 finally
  l_Inst.Free;
 end;//try..finally
end;//TmsmViewController.Make

procedure TmsmViewController.Cleanup;
 {* ������� ������� ����� �������. }
//#UC START# *479731C50290_57AB0A810292_var*
//#UC END# *479731C50290_57AB0A810292_var*
begin
//#UC START# *479731C50290_57AB0A810292_impl*
 inherited;
 if (f_PopupMenu = TmsmViewFriend(View).PopupMenu) then
  TmsmViewFriend(View).PopupMenu := nil;
 FreeAndNil(f_PopupMenu); 
 f_View := nil;
//#UC END# *479731C50290_57AB0A810292_impl*
end;//TmsmViewController.Cleanup

procedure TmsmViewController.InitFields;
//#UC START# *47A042E100E2_57AB0A810292_var*
//#UC END# *47A042E100E2_57AB0A810292_var*
begin
//#UC START# *47A042E100E2_57AB0A810292_impl*
 inherited;
//#UC END# *47A042E100E2_57AB0A810292_impl*
end;//TmsmViewController.InitFields

procedure TmsmViewController.DoActivated;
//#UC START# *57CEC64E0063_57AB0A810292_var*
var
 l_Item : TMenuItem;
 l_Index : Integer;
//#UC END# *57CEC64E0063_57AB0A810292_var*
begin
//#UC START# *57CEC64E0063_57AB0A810292_impl*
 inherited;
 if not OperationsList.Empty then
 begin
  f_PopupMenu := TPopupMenu.Create(nil{View});
  for l_Index := 0 to Pred(OperationsList.Count) do
  begin
   l_Item := TmsmOperationMenuItem.Create(f_PopupMenu, OperationsList[l_Index]);
   f_PopupMenu.Items.Add(l_Item);
  end;//for l_Index
  TmsmViewFriend(View).PopupMenu := f_PopupMenu;
 end;//not OperationsList.Empty
//#UC END# *57CEC64E0063_57AB0A810292_impl*
end;//TmsmViewController.DoActivated

initialization
{$If NOT Defined(NoScripts)}
 TtfwClassRef.Register(TmsmOperationMenuItem);
 {* ����������� TmsmOperationMenuItem }
{$IfEnd} // NOT Defined(NoScripts)

end.
