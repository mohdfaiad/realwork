unit atListener;

// ������: "w:\quality\test\garant6x\AdapterTest\CoreObjects\atListener.pas"
// ���������: "SimpleClass"
// ������� ������: "TatListener" MUID: (4807838102C9)

interface

uses
 l3IntfUses
 , atInterfaces
 , Classes
 , SyncObjs
;

type
 TatListener = class(TInterfacedObject, IatListener)
  private
   f_Notifiers: TInterfaceList;
   f_CS: TCriticalSection;
  private
   function IsListen(const notifier: IatNotifier): Boolean;
  protected
   procedure DoFire(sender: TObject;
    const notification: IatNotification); virtual; abstract;
   procedure StartListen(const notifier: IatNotifier);
   procedure StopListen; overload;
   procedure StopListen(const notifier: IatNotifier); overload;
   procedure Fire(sender: TObject;
    const notification: IatNotification);
  public
   constructor Create; reintroduce;
   destructor Destroy; override;
 end;//TatListener

implementation

uses
 l3ImplUses
 , SysUtils
 //#UC START# *4807838102C9impl_uses*
 //#UC END# *4807838102C9impl_uses*
;

function TatListener.IsListen(const notifier: IatNotifier): Boolean;
//#UC START# *480783E2019D_4807838102C9_var*
//#UC END# *480783E2019D_4807838102C9_var*
begin
//#UC START# *480783E2019D_4807838102C9_impl*
    Result := (f_Notifiers.IndexOf(notifier) <> -1);
//#UC END# *480783E2019D_4807838102C9_impl*
end;//TatListener.IsListen

constructor TatListener.Create;
//#UC START# *480783FD009B_4807838102C9_var*
//#UC END# *480783FD009B_4807838102C9_var*
begin
//#UC START# *480783FD009B_4807838102C9_impl*
    inherited;
    //
    f_Notifiers := TInterfaceList.Create;
    f_CS := TCriticalSection.Create;
//#UC END# *480783FD009B_4807838102C9_impl*
end;//TatListener.Create

procedure TatListener.StartListen(const notifier: IatNotifier);
//#UC START# *48077F3F01F9_4807838102C9_var*
//#UC END# *48077F3F01F9_4807838102C9_var*
begin
//#UC START# *48077F3F01F9_4807838102C9_impl*
    f_CS.Enter;
    try
      // ���������, ����� �� ��� ��� �������
      if IsListen(notifier) then Exit; // �������, ������ ������ �� ����
      // �� �������
      // ��������� � ������
      f_Notifiers.Add(notifier);
      // ������� �����������, ����� �� ����� ����������
      notifier.StartNotify(Self);
    finally
      f_CS.Leave;
    end;
//#UC END# *48077F3F01F9_4807838102C9_impl*
end;//TatListener.StartListen

procedure TatListener.StopListen;
//#UC START# *48077F4B02E8_4807838102C9_var*
    var
      notifier : IatNotifier;
//#UC END# *48077F4B02E8_4807838102C9_var*
begin
//#UC START# *48077F4B02E8_4807838102C9_impl*
    f_CS.Enter;
    try
      while (true) do begin
        if (f_Notifiers.Count = 0) then Exit; // � ��� ������ �� �������
        notifier := f_Notifiers.First as IatNotifier;
        StopListen(notifier);
      end;
    finally
      f_CS.Leave;
    end;
//#UC END# *48077F4B02E8_4807838102C9_impl*
end;//TatListener.StopListen

procedure TatListener.StopListen(const notifier: IatNotifier);
//#UC START# *48077F540156_4807838102C9_var*
//#UC END# *48077F540156_4807838102C9_var*
begin
//#UC START# *48077F540156_4807838102C9_impl*
    f_CS.Enter;
    try
      // ���������, ����� �� �� �������
      if NOT IsListen(notifier) then Exit; // �� �������, ������ ������ �� ����
      // �������
      // ������� �� ������
      f_Notifiers.Remove(notifier);
      // ������� �����������, ����� �������� ����������
      notifier.StopNotify(Self);
    finally
      f_CS.Leave;
    end;
//#UC END# *48077F540156_4807838102C9_impl*
end;//TatListener.StopListen

procedure TatListener.Fire(sender: TObject;
 const notification: IatNotification);
//#UC START# *48077F6101B4_4807838102C9_var*
//#UC END# *48077F6101B4_4807838102C9_var*
begin
//#UC START# *48077F6101B4_4807838102C9_impl*
 DoFire(sender, notification);
//#UC END# *48077F6101B4_4807838102C9_impl*
end;//TatListener.Fire

destructor TatListener.Destroy;
//#UC START# *48077504027E_4807838102C9_var*
//#UC END# *48077504027E_4807838102C9_var*
begin
//#UC START# *48077504027E_4807838102C9_impl*
    StopListen;
    FreeAndNil(f_Notifiers);
    FreeAndNil(f_CS);
    //
    inherited;
//#UC END# *48077504027E_4807838102C9_impl*
end;//TatListener.Destroy

end.
