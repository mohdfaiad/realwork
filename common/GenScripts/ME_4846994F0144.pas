unit atCreateFoldersOperation;
 {* ������� �����. }

// ������: "w:\quality\test\garant6x\AdapterTest\Operations\atCreateFoldersOperation.pas"
// ���������: "SimpleClass"

interface

uses
 l3IntfUses
 , atOperationBase
 , FoldersUnit
;

type
 TatCreateFoldersOperation = class(TatOperationBase)
  {* ������� �����. }
  private
   f_TotalFoldersAdded: Integer;
    {* ������� ����� ����� ��� �������. }
   f_MaxFoldersCount: Integer;
    {* ������� ����� ���� ������� ����� }
   f_NamePrefix: AnsiString;
  private
   function CreateAsNTree(const aRootNode: IFoldersNode;
    aMaxFoldersCount: Integer;
    aN: Integer): Integer; virtual;
    {* ������� ������ ����� - � ����� ������� aN �����, � ������ ����� ��� aN � �.�., ���� � ����� ��������� �� ��������� aMaxFoldersCount �����.
���� ����� ��� ����� �� ����� ������, ��, ��������, ���� ����� aN >= aMaxFoldersCount. }
   procedure FolderHasBeenAdded(const aFolder: IFoldersNode); virtual;
    {* ����� ���������� ��� ���������� �����. }
  protected
   procedure ExecuteSelf; override;
   procedure InitParamList; override;
   procedure ExecuteChilds; override;
 end;//TatCreateFoldersOperation

implementation

uses
 l3ImplUses
 , atFoldersHelper
 , atLogger
 , BaseTreeSupportUnit
 , SysUtils
 , Math
 , atCommon
;

function TatCreateFoldersOperation.CreateAsNTree(const aRootNode: IFoldersNode;
 aMaxFoldersCount: Integer;
 aN: Integer): Integer;
 {* ������� ������ ����� - � ����� ������� aN �����, � ������ ����� ��� aN � �.�., ���� � ����� ��������� �� ��������� aMaxFoldersCount �����.
���� ����� ��� ����� �� ����� ������, ��, ��������, ���� ����� aN >= aMaxFoldersCount. }
//#UC START# *48469BEB00C7_4846994F0144_var*
  var
    l_SubNodes : array of INode;
    l_Name, l_Comment : String;
    i, l_ChildNodesCount, l_MaxChildNodesCount, l_NodesAdded : Integer;
//#UC END# *48469BEB00C7_4846994F0144_var*
begin
//#UC START# *48469BEB00C7_4846994F0144_impl*
  Assert(aRootNode <> nil, 'aRootNode <> nil');
  Assert(aN > 0, 'aN > 0');

  Result := 0;
  l_NodesAdded := 0;
  l_MaxChildNodesCount := 1 + ((aMaxFoldersCount - aN) div aN);
  SetLength(l_SubNodes, aN);
  // ������� ��������� ����� � �������
  for i := Low(l_SubNodes) to High(l_SubNodes) do
    if (l_NodesAdded < aMaxFoldersCount) then
    begin
      if (f_NamePrefix <> '') then
        l_Name := f_NamePrefix + IntToStr(i)
      else
        l_Name := '����� ��������� ' + GetTimeStamp;
      l_Comment := '����������� � �����';
      TatFoldersHelper.CreateFolder(aRootNode, l_Name, l_Comment, l_SubNodes[i]);
      Inc(l_NodesAdded);
      FolderHasBeenAdded(l_SubNodes[i] as IFoldersNode);
    end
    else
      break;

  // � ������, ���� ��� ���� ���� ���������, �� ��������� ����� � ������ �� �����������
  for i := Low(l_SubNodes) to High(l_SubNodes) do
    if (l_NodesAdded < aMaxFoldersCount) then
    begin
      // ����� �������� ��� ���������� ��� ������� ����� ����������� ��������� � ��� ������� ��� ����� ��������
      l_ChildNodesCount := Min(l_MaxChildNodesCount, aMaxFoldersCount - l_NodesAdded);
      // ��������� �������� �����
      Inc(l_NodesAdded, CreateAsNTree(l_SubNodes[i] as IFoldersNode, l_ChildNodesCount, aN) );
      //
      l_SubNodes[i] := nil;
    end
    else
      break;

  Result := l_NodesAdded;
//#UC END# *48469BEB00C7_4846994F0144_impl*
end;//TatCreateFoldersOperation.CreateAsNTree

procedure TatCreateFoldersOperation.FolderHasBeenAdded(const aFolder: IFoldersNode);
 {* ����� ���������� ��� ���������� �����. }
//#UC START# *484A715B032F_4846994F0144_var*
  const
    PARTN = 5;
//#UC END# *484A715B032F_4846994F0144_var*
begin
//#UC START# *484A715B032F_4846994F0144_impl*
  Assert(aFolder <> nil, 'aFolder <> nil');
  //
  Inc(f_TotalFoldersAdded);
  // ������ ����������� ����� �������
  ExecutionContext.UserWorkContext.CurrFolder := aFolder;
  // ����� ��������� � ��� ���� ����
  if ( ((f_TotalFoldersAdded mod (Max(PARTN, f_MaxFoldersCount) div PARTN)) = 0) // ���� ��������� ��������� PARTN-� ����� �� ������ ���������� �����
        OR (f_TotalFoldersAdded = f_MaxFoldersCount) ) // ��� ��������� ��������� �����
  then
    Logger.Info('��������� �����: %d. ��������: %d.', [f_TotalFoldersAdded, f_MaxFoldersCount - f_TotalFoldersAdded]);
  // �������� �������� ��������...
  inherited ExecuteChilds;
//#UC END# *484A715B032F_4846994F0144_impl*
end;//TatCreateFoldersOperation.FolderHasBeenAdded

procedure TatCreateFoldersOperation.ExecuteSelf;
//#UC START# *48089F460352_4846994F0144_var*
  var
    l_FoldersCount, l_NOrder : Integer;
    l_MyDocs : IFoldersNode;
//#UC END# *48089F460352_4846994F0144_var*
begin
//#UC START# *48089F460352_4846994F0144_impl*
  f_TotalFoldersAdded := 0;
  l_FoldersCount := Parameters['folders_count'].AsInt;
  l_NOrder := Parameters['n_order'].AsInt;
  f_NamePrefix := Parameters['name_prefix'].AsStr;
  //
  if (l_NOrder = -1) then
    l_NOrder := l_FoldersCount; // ��� ����� �������� ��� ����� �� ���� ������� � "��� ���������"
  // �������� ����� ��� ���������
  l_MyDocs := TatFoldersHelper.GetMyDocuments;
  Assert(l_MyDocs <> nil, 'l_MyDocs <> nil');
  // ��������� � ��� �����
  f_MaxFoldersCount := l_FoldersCount;
  CreateAsNTree(l_MyDocs, l_FoldersCount, l_NOrder);
//#UC END# *48089F460352_4846994F0144_impl*
end;//TatCreateFoldersOperation.ExecuteSelf

procedure TatCreateFoldersOperation.InitParamList;
//#UC START# *48089F3701B4_4846994F0144_var*
//#UC END# *48089F3701B4_4846994F0144_var*
begin
//#UC START# *48089F3701B4_4846994F0144_impl*
  inherited;
  with f_ParamList do
  begin
    Add( ParamType.Create('folders_count', '������������ ���������� �����', '1') );
    Add( ParamType.Create('name_prefix', '������� ����� �����', '') ); // ��� ����� ������������ ��� ������� + �����, ���� ������� ����, �� ������������ �������� �������
    Add( ParamType.Create('n_order', '����� �� ������ ������', '-1') );
  end;
//#UC END# *48089F3701B4_4846994F0144_impl*
end;//TatCreateFoldersOperation.InitParamList

procedure TatCreateFoldersOperation.ExecuteChilds;
//#UC START# *48089F660238_4846994F0144_var*
//#UC END# *48089F660238_4846994F0144_var*
begin
//#UC START# *48089F660238_4846994F0144_impl*
  // ������ �� ������. �������� �������� ����� ���� ����������� � FolderHasBeenAdded ����� ���������� ������ �����
//#UC END# *48089F660238_4846994F0144_impl*
end;//TatCreateFoldersOperation.ExecuteChilds

end.
