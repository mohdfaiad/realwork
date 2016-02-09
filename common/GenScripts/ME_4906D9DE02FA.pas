unit nsBaseSearchPromptTree;
 {* ������ ���������. ��������� }

// ������: "w:\garant6x\implementation\Garant\GbaNemesis\View\nsBaseSearchPromptTree.pas"
// ���������: "SimpleClass"

{$Include nsDefine.inc}

interface

{$If NOT Defined(Admin) AND NOT Defined(Monitorings)}
uses
 l3IntfUses
 , nsBaseSearchPromptTreeBase
 , l3TreeInterfaces
;

type
 TnsBaseSearchPromptTree = class(TnsBaseSearchPromptTreeBase)
  {* ������ ���������. ��������� }
  public
   class function Make: Il3SimpleTree; reintroduce;
    {* ������ ������ ��������� }
   class function Exists: Boolean;
    {* ��������� ������ ��������� ���������� ��� ��� }
 end;//TnsBaseSearchPromptTree
{$IfEnd} // NOT Defined(Admin) AND NOT Defined(Monitorings)

implementation

{$If NOT Defined(Admin) AND NOT Defined(Monitorings)}
uses
 l3ImplUses
 , SysUtils
 , l3Base
;

var g_TnsBaseSearchPromptTree: Pointer = nil;
 {* ��������� ���������� TnsBaseSearchPromptTree }

procedure TnsBaseSearchPromptTreeFree;
 {* ����� ������������ ���������� ���������� TnsBaseSearchPromptTree }
begin
 IUnknown(g_TnsBaseSearchPromptTree) := nil;
end;//TnsBaseSearchPromptTreeFree

class function TnsBaseSearchPromptTree.Make: Il3SimpleTree;
 {* ������ ������ ��������� }
begin
 if (g_TnsBaseSearchPromptTree = nil) then
 begin
  l3System.AddExitProc(TnsBaseSearchPromptTreeFree);
  Il3SimpleTree(g_TnsBaseSearchPromptTree) := inherited Make;
 end;
 Result := Il3SimpleTree(g_TnsBaseSearchPromptTree);
end;//TnsBaseSearchPromptTree.Make

class function TnsBaseSearchPromptTree.Exists: Boolean;
 {* ��������� ������ ��������� ���������� ��� ��� }
begin
 Result := g_TnsBaseSearchPromptTree <> nil;
end;//TnsBaseSearchPromptTree.Exists
{$IfEnd} // NOT Defined(Admin) AND NOT Defined(Monitorings)

end.
