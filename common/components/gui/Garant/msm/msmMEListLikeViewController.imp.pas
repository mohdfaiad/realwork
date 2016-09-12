{$IfNDef msmMEListLikeViewController_imp}

// ������: "w:\common\components\gui\Garant\msm\msmMEListLikeViewController.imp.pas"
// ���������: "Impurity"
// ������� ������: "msmMEListLikeViewController" MUID: (57C977AE0264)
// ��� ����: "_msmMEListLikeViewController_"

{$Define msmMEListLikeViewController_imp}

 _msmMEListLikeViewController_ = {abstract} class(_msmMEListLikeViewController_Parent_)
  protected
   procedure DoGetItemFont(Sender: TObject;
    Index: LongInt;
    const aFont: Il3Font); override;
 end;//_msmMEListLikeViewController_

{$Else msmMEListLikeViewController_imp}

{$IfNDef msmMEListLikeViewController_imp_impl}

{$Define msmMEListLikeViewController_imp_impl}

procedure _msmMEListLikeViewController_.DoGetItemFont(Sender: TObject;
 Index: LongInt;
 const aFont: Il3Font);
//#UC START# *57B47A2102DE_57C977AE0264_var*
//#UC END# *57B47A2102DE_57C977AE0264_var*
begin
//#UC START# *57B47A2102DE_57C977AE0264_impl*
 with Self.Model.List[Index] do
 begin
  aFont.Italic := BoolProp['IsSummoned'];
  aFont.Strikeout := not BoolProp['IsFinished'];
  aFont.ForeColor := IntProp['msm:View:ForeColor'];
 end;//with Self.Model.List[Index]
//#UC END# *57B47A2102DE_57C977AE0264_impl*
end;//_msmMEListLikeViewController_.DoGetItemFont

{$EndIf msmMEListLikeViewController_imp_impl}

{$EndIf msmMEListLikeViewController_imp}

