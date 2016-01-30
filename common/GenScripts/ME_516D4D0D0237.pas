{$IfNDef UnknownImpl_imp}

// ������: "w:\common\components\rtl\Garant\L3\UnknownImpl.imp.pas"
// ���������: "Impurity"

{$Define UnknownImpl_imp}

 _RefCounted_Parent_ = _UnknownImpl_Parent_;
 {$Include RefCounted.imp.pas}
 _UnknownImpl_ = class(_RefCounted_)
  public
   function __AddRef: Integer; stdcall;
    {* ����������� ������� ������. }
   function __Release: Integer; stdcall;
    {* ��������� ������� ������. }
   function QueryInterface(const IID: TGUID;
    out Obj): HResult; stdcall;
    {* �������� ������� ��������� � ��������������, ���� ��� ��������. }
 end;//_UnknownImpl_

{$Else UnknownImpl_imp}

{$IfNDef UnknownImpl_imp_impl}

{$Define UnknownImpl_imp_impl}

{$Include RefCounted.imp.pas}

function _UnknownImpl_.__AddRef: Integer;
 {* ����������� ������� ������. }
//#UC START# *47913C24007F_516D4D0D0237_var*
//#UC END# *47913C24007F_516D4D0D0237_var*
begin
//#UC START# *47913C24007F_516D4D0D0237_impl*
 Use;
 Result := RefCount;
 // - ��� ���� �������� � ����������������
//#UC END# *47913C24007F_516D4D0D0237_impl*
end;//_UnknownImpl_.__AddRef

function _UnknownImpl_.__Release: Integer;
 {* ��������� ������� ������. }
//#UC START# *47913C5301A1_516D4D0D0237_var*
var
 l_RC : Integer;
//#UC END# *47913C5301A1_516D4D0D0237_var*
begin
//#UC START# *47913C5301A1_516D4D0D0237_impl*
 l_RC := RefCount - 1;
 Free;
 Result := l_RC;
 // - ��� ���� �������� � ����������������
//#UC END# *47913C5301A1_516D4D0D0237_impl*
end;//_UnknownImpl_.__Release

function _UnknownImpl_.QueryInterface(const IID: TGUID;
 out Obj): HResult;
 {* �������� ������� ��������� � ��������������, ���� ��� ��������. }
//#UC START# *47913CBF0265_516D4D0D0237_var*
//#UC END# *47913CBF0265_516D4D0D0237_var*
begin
//#UC START# *47913CBF0265_516D4D0D0237_impl*
 if TObject(Self).GetInterface(IID, Obj) then
  Result := S_Ok
 else
  Result := E_NoInterface;
//#UC END# *47913CBF0265_516D4D0D0237_impl*
end;//_UnknownImpl_.QueryInterface

{$EndIf UnknownImpl_imp_impl}

{$EndIf UnknownImpl_imp}

