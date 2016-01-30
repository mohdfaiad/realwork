unit dBaseDocument;
 {* ������ ������ ��������� }

// ������: "w:\garant6x\implementation\Garant\GbaNemesis\Business\Document\dBaseDocument.pas"
// ���������: "SimpleClass"

{$Include nsDefine.inc}

interface

{$If NOT Defined(Admin) AND NOT Defined(Monitorings)}
uses
 l3IntfUses
 , DocumentAndListInterfaces
 {$If NOT Defined(NoVCM)}
 , vcmControllers
 {$IfEnd} // NOT Defined(NoVCM)
 , l3Types
 , DocumentInterfaces
 , l3ProtoObject
 {$If NOT Defined(NoVCM)}
 , vcmInterfaces
 {$IfEnd} // NOT Defined(NoVCM)
;

type
 _IvcmRealData_ = IdBaseDocument;
 {$Include dBaseDocument.imp.pas}
 TdBaseDocument = class(_dBaseDocument_)
  {* ������ ������ ��������� }
  public
   class function Make: IdBaseDocument; reintroduce;
 end;//TdBaseDocument
{$IfEnd} // NOT Defined(Admin) AND NOT Defined(Monitorings)

implementation

{$If NOT Defined(Admin) AND NOT Defined(Monitorings)}
uses
 l3ImplUses
 {$If NOT Defined(NoVCM)}
 , vcmFormDataSourceRef
 {$IfEnd} // NOT Defined(NoVCM)
 , SysUtils
;

type _Instance_R_ = TdBaseDocument;

{$Include dBaseDocument.imp.pas}

class function TdBaseDocument.Make: IdBaseDocument;
var
 l_Inst : TdBaseDocument;
begin
 l_Inst := Create;
 try
  Result := l_Inst;
 finally
  l_Inst.Free;
 end;//try..finally
end;//TdBaseDocument.Make
{$IfEnd} // NOT Defined(Admin) AND NOT Defined(Monitorings)

end.
