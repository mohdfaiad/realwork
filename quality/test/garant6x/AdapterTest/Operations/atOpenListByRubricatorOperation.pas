unit atOpenListByRubricatorOperation;

// ������: "w:\quality\test\garant6x\AdapterTest\Operations\atOpenListByRubricatorOperation.pas"
// ���������: "SimpleClass"
// ������� ������: "TatOpenListByRubricatorOperation" MUID: (4B97918002C8)

interface

uses
 l3IntfUses
 , atOperationBase
;

type
 TatOpenListByRubricatorOperation = class(TatOperationBase)
  protected
   procedure ExecuteSelf; override;
   procedure InitParamList; override;
 end;//TatOpenListByRubricatorOperation

implementation

uses
 l3ImplUses
 , atNodeHelper
 , atListHelper
 , DynamicDocListUnit
 , DynamicTreeUnit
 , BaseTypesUnit
 , atLogger
 , SysUtils
 , Classes
 //#UC START# *4B97918002C8impl_uses*
 //#UC END# *4B97918002C8impl_uses*
;

procedure TatOpenListByRubricatorOperation.ExecuteSelf;
//#UC START# *48089F460352_4B97918002C8_var*
  var
    l_PathStr : String;
    l_Node, l_ListRoot : INodeBase;
    l_Entity : IEntityBase;
    l_DynList : IDynList;
//#UC END# *48089F460352_4B97918002C8_var*
begin
//#UC START# *48089F460352_4B97918002C8_impl*
  inherited;
  //
  l_PathStr := Parameters['path'].AsStr;
  //
  Logger.Info('���������� ������� ������ � ����������� �� ���� "%s"', [l_PathStr]);

  // ���� ����
  l_Node := TatNodeHelper.FindNodeByPath(
    ExecutionContext.GblAdapterWorker.MainMenuRoot,
    l_PathStr,
    '\',
    true
  );
  if (l_Node = nil) then
  begin
    Logger.Error('��������� ���� �� ����������!');
    Exit;
  end;

  // �������� ������
  try
    l_Node.GetEntity(l_Entity);
  except
    on ex : ENoEntity do
    begin
      Logger.Error('������ �� ���������!');
      Exit;
    end;
  end;
  // ��������� ������
  if Supports(l_Entity, IDynList, l_DynList) then
  begin
    TatListHelper.LoadList(l_DynList, 20);
    //
    l_DynList.GetRoot(l_ListRoot);
    Assert(l_ListRoot <> nil, 'l_ListRoot <> nil');
    Logger.Info('�������� ������. � ��� %d ����������', [l_ListRoot.GetChildCount]);
    ExecutionContext.UserWorkContext.AddListToHistory(l_DynList);
  end
  else
    Logger.Error('�� ���� �������� IDynList');
//#UC END# *48089F460352_4B97918002C8_impl*
end;//TatOpenListByRubricatorOperation.ExecuteSelf

procedure TatOpenListByRubricatorOperation.InitParamList;
//#UC START# *48089F3701B4_4B97918002C8_var*
//#UC END# *48089F3701B4_4B97918002C8_var*
begin
//#UC START# *48089F3701B4_4B97918002C8_impl*
  inherited;
  //
  with f_ParamList do
  begin
    Add( ParamType.Create('path') );
  end;
//#UC END# *48089F3701B4_4B97918002C8_impl*
end;//TatOpenListByRubricatorOperation.InitParamList

end.
