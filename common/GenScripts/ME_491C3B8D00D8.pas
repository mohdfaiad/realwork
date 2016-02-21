unit dsAutoreferat;
 {* ����������� }

// ������: "w:\garant6x\implementation\Garant\GbaNemesis\Autoreferat\dsAutoreferat.pas"
// ���������: "ViewAreaControllerImp"

{$Include w:\garant6x\implementation\Garant\nsDefine.inc}

interface

{$If NOT Defined(Admin) AND NOT Defined(Monitorings)}
uses
 l3IntfUses
 , nevTools
 , DocumentAndListInterfaces
 , l3Types
 , DocumentInterfaces
 , WorkWithListInterfaces
 , nsDocumentLikeStateHolder
 , afwInterfaces
 , l3Interfaces
 , bsTypes
 , FoldersDomainInterfaces
 , UnderControlUnit
 , DocumentUnit
 , bsTypesNew
 {$If NOT Defined(NoVCM)}
 , vcmExternalInterfaces
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , vcmInterfaces
 {$IfEnd} // NOT Defined(NoVCM)
 , l3ProtoObjectWithCOMQI
 {$If NOT Defined(NoVCM)}
 , vcmLocalInterfaces
 {$IfEnd} // NOT Defined(NoVCM)
 , l3NotifyPtrList
 , UnderControlInterfaces
;

type
 {$Include w:\garant6x\implementation\Garant\GbaNemesis\Business\Document\dsBaseDocument.imp.pas}
 TdsAutoreferat = class(_dsBaseDocument_)
  {* ����������� }
  protected
   function GetIsReadOnly: Boolean; override;
   function GetTimeMachineOff: Boolean; override;
    {* ��� ��������� ��������� ������ ������ ������� ����� ��������� }
   function MakeContainer: InevDocumentContainer; override;
    {* ������������ ��������� ��������� }
 end;//TdsAutoreferat
{$IfEnd} // NOT Defined(Admin) AND NOT Defined(Monitorings)

implementation

{$If NOT Defined(Admin) AND NOT Defined(Monitorings)}
uses
 l3ImplUses
 , nsAutoreferatDocumentContainer
 , l3Base
 , bsUtils
 , BaseTypesUnit
 , bsConvert
 , l3Utils
 , deDocInfo
 , nsTypes
 , nsDocInfoHAFMacroReplacer
 {$If NOT Defined(NoVCM)}
 , StdRes
 {$IfEnd} // NOT Defined(NoVCM)
 , nsFolderFilterInfo
 , l3InterfacesMisc
 , SysUtils
 , afwFacade
 , IOUnit
;

{$If not Declared(_FormDataSourceType_)}type _FormDataSourceType_ = IdsBaseDocument;{$IfEnd}

{$If not Declared(_InitDataType_)}type _InitDataType_ = IdeDocInfo;{$IfEnd}

{$If not Declared(_UseCaseControllerType_)}type _UseCaseControllerType_ = IvcmFormSetDataSource;{$IfEnd}

type _Instance_R_ = TdsAutoreferat;

{$Include w:\garant6x\implementation\Garant\GbaNemesis\Business\Document\dsBaseDocument.imp.pas}

function TdsAutoreferat.GetIsReadOnly: Boolean;
//#UC START# *491C263E03AF_491C3B8D00D8_var*
//#UC END# *491C263E03AF_491C3B8D00D8_var*
begin
//#UC START# *491C263E03AF_491C3B8D00D8_impl*
 Result := true;
//#UC END# *491C263E03AF_491C3B8D00D8_impl*
end;//TdsAutoreferat.GetIsReadOnly

function TdsAutoreferat.GetTimeMachineOff: Boolean;
 {* ��� ��������� ��������� ������ ������ ������� ����� ��������� }
//#UC START# *491C264C02C2_491C3B8D00D8_var*
//#UC END# *491C264C02C2_491C3B8D00D8_var*
begin
//#UC START# *491C264C02C2_491C3B8D00D8_impl*
 Result := true;
//#UC END# *491C264C02C2_491C3B8D00D8_impl*
end;//TdsAutoreferat.GetTimeMachineOff

function TdsAutoreferat.MakeContainer: InevDocumentContainer;
 {* ������������ ��������� ��������� }
//#UC START# *4C6AB38800F3_491C3B8D00D8_var*
//#UC END# *4C6AB38800F3_491C3B8D00D8_var*
begin
//#UC START# *4C6AB38800F3_491C3B8D00D8_impl*
 Result := TnsAutoreferatDocumentContainer.Make(DocInfo);
//#UC END# *4C6AB38800F3_491C3B8D00D8_impl*
end;//TdsAutoreferat.MakeContainer
{$IfEnd} // NOT Defined(Admin) AND NOT Defined(Monitorings)

end.
