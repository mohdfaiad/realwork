unit UsersTree;
 {* ������  ������������� }

// ������: "w:\garant6x\implementation\Garant\tie\Garant\GblAdapterLib\UsersTree.pas"
// ���������: "SimpleClass"

{$Include nsDefine.inc}

interface

uses
 l3IntfUses
 , ree
 , SecurityUnit
;

type
 UsersTree = class
  {* ������  ������������� }
  public
   NodeType_: ;
   NodeDelegateType_: ;
  public
   constructor make(tree); reintroduce;
   procedure register_listener(var profile: IUserProfile); virtual;
 end;//UsersTree

implementation

uses
 l3ImplUses
;

constructor UsersTree.make(tree);
//#UC START# *49DF1C4A00F4_49DF198B015D_var*
//#UC END# *49DF1C4A00F4_49DF198B015D_var*
begin
//#UC START# *49DF1C4A00F4_49DF198B015D_impl*
 !!! Needs to be implemented !!!
//#UC END# *49DF1C4A00F4_49DF198B015D_impl*
end;//UsersTree.make

procedure UsersTree.register_listener(var profile: IUserProfile);
//#UC START# *49DF1C6501D3_49DF198B015D_var*
//#UC END# *49DF1C6501D3_49DF198B015D_var*
begin
//#UC START# *49DF1C6501D3_49DF198B015D_impl*
 !!! Needs to be implemented !!!
//#UC END# *49DF1C6501D3_49DF198B015D_impl*
end;//UsersTree.register_listener

end.
