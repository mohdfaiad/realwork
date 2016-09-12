{$IfNDef msmListLikeModel_imp}

// ������: "w:\common\components\gui\Garant\msm\msmListLikeModel.imp.pas"
// ���������: "Impurity"
// ������� ������: "msmListLikeModel" MUID: (57B57EDB003F)
// ��� ����: "_msmListLikeModel_"

{$Define msmListLikeModel_imp}

 _msmListLikeModel_ = {abstract} class(TmsmModel, ImsmListLikeModel)
  private
   f_ElementView: TmsmModelElementView;
   f_ElementToAction: ImsmModelElement;
   f_CurrentElement: ImsmModelElement;
  protected
   function DoGetList: ImsmModelElementStringList; virtual; abstract;
   procedure DoShowElementAsList(const anElement: ImsmModelElement); virtual; abstract;
   procedure ShowElementAsList(const anElement: ImsmModelElement);
   function Get_ElementToAction: ImsmModelElement;
   procedure Set_ElementToAction(const aValue: ImsmModelElement);
   function Get_CurrentElement: ImsmModelElement;
   procedure Set_CurrentElement(const aValue: ImsmModelElement);
   function Get_Caption: AnsiString;
   function Get_List: ImsmModelElementStringList;
   procedure ClearFields; override;
 end;//_msmListLikeModel_

{$Else msmListLikeModel_imp}

{$IfNDef msmListLikeModel_imp_impl}

{$Define msmListLikeModel_imp_impl}

procedure _msmListLikeModel_.ShowElementAsList(const anElement: ImsmModelElement);
//#UC START# *57B1A3DA0382_57B57EDB003F_var*
//#UC END# *57B1A3DA0382_57B57EDB003F_var*
begin
//#UC START# *57B1A3DA0382_57B57EDB003F_impl*
 DoShowElementAsList(anElement);
//#UC END# *57B1A3DA0382_57B57EDB003F_impl*
end;//_msmListLikeModel_.ShowElementAsList

function _msmListLikeModel_.Get_ElementToAction: ImsmModelElement;
//#UC START# *57B2B019009C_57B57EDB003Fget_var*
//#UC END# *57B2B019009C_57B57EDB003Fget_var*
begin
//#UC START# *57B2B019009C_57B57EDB003Fget_impl*
 Result := f_ElementToAction;
//#UC END# *57B2B019009C_57B57EDB003Fget_impl*
end;//_msmListLikeModel_.Get_ElementToAction

procedure _msmListLikeModel_.Set_ElementToAction(const aValue: ImsmModelElement);
//#UC START# *57B2B019009C_57B57EDB003Fset_var*
//#UC END# *57B2B019009C_57B57EDB003Fset_var*
begin
//#UC START# *57B2B019009C_57B57EDB003Fset_impl*
 f_ElementToAction := aValue;
 Fire(ActionElementEvent.Instance);
//#UC END# *57B2B019009C_57B57EDB003Fset_impl*
end;//_msmListLikeModel_.Set_ElementToAction

function _msmListLikeModel_.Get_CurrentElement: ImsmModelElement;
//#UC START# *57B31CF301D2_57B57EDB003Fget_var*
//#UC END# *57B31CF301D2_57B57EDB003Fget_var*
begin
//#UC START# *57B31CF301D2_57B57EDB003Fget_impl*
 Result := f_CurrentElement;
//#UC END# *57B31CF301D2_57B57EDB003Fget_impl*
end;//_msmListLikeModel_.Get_CurrentElement

procedure _msmListLikeModel_.Set_CurrentElement(const aValue: ImsmModelElement);
//#UC START# *57B31CF301D2_57B57EDB003Fset_var*
//#UC END# *57B31CF301D2_57B57EDB003Fset_var*
begin
//#UC START# *57B31CF301D2_57B57EDB003Fset_impl*
 f_CurrentElement := aValue;
 Fire(CurrentElementChangedEvent.Instance);
//#UC END# *57B31CF301D2_57B57EDB003Fset_impl*
end;//_msmListLikeModel_.Set_CurrentElement

function _msmListLikeModel_.Get_Caption: AnsiString;
//#UC START# *57B49A8201E1_57B57EDB003Fget_var*
//#UC END# *57B49A8201E1_57B57EDB003Fget_var*
begin
//#UC START# *57B49A8201E1_57B57EDB003Fget_impl*
 Result := f_ElementView.rListName;
 if (Result = 'SelfList') then
  Result := f_ElementView.rTextName;
 if (Result = 'DocumentationNotEmpty') then
  Result := 'Doc';
//#UC END# *57B49A8201E1_57B57EDB003Fget_impl*
end;//_msmListLikeModel_.Get_Caption

function _msmListLikeModel_.Get_List: ImsmModelElementStringList;
//#UC START# *57B6A4550271_57B57EDB003Fget_var*
//#UC END# *57B6A4550271_57B57EDB003Fget_var*
begin
//#UC START# *57B6A4550271_57B57EDB003Fget_impl*
 Result := DoGetList;
//#UC END# *57B6A4550271_57B57EDB003Fget_impl*
end;//_msmListLikeModel_.Get_List

procedure _msmListLikeModel_.ClearFields;
begin
 Finalize(f_ElementView);
 f_ElementToAction := nil;
 f_CurrentElement := nil;
 inherited;
end;//_msmListLikeModel_.ClearFields

{$EndIf msmListLikeModel_imp_impl}

{$EndIf msmListLikeModel_imp}

