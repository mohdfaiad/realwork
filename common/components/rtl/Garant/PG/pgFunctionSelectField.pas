unit pgFunctionSelectField;

// ������: "w:\common\components\rtl\Garant\PG\pgFunctionSelectField.pas"
// ���������: "SimpleClass"
// ������� ������: "TpgFunctionSelectField" MUID: (567A8BE7002D)

{$Include w:\common\components\rtl\Garant\PG\pgDefine.inc}

interface

{$If Defined(UsePostgres)}
uses
 l3IntfUses
 , l3ProtoObject
 , daInterfaces
;

type
 TpgFunctionSelectField = class(Tl3ProtoObject, IdaSelectField)
  private
   f_Description: IdaParamDescription;
  protected
   function Get_Alias: AnsiString;
   function BuildSQLValue(AddAlias: Boolean = True): AnsiString;
   procedure Cleanup; override;
    {* ������� ������� ����� �������. }
  public
   constructor Create(const aDescription: IdaParamDescription); reintroduce;
   class function Make(const aDescription: IdaParamDescription): IdaSelectField; reintroduce;
   procedure IterateTables(anAction: daSelectFieldIterator_IterateTables_Action); virtual;
   procedure IterateTablesF(anAction: daSelectFieldIterator_IterateTables_Action);
 end;//TpgFunctionSelectField
{$IfEnd} // Defined(UsePostgres)

implementation

{$If Defined(UsePostgres)}
uses
 l3ImplUses
 , l3Base
 //#UC START# *567A8BE7002Dimpl_uses*
 //#UC END# *567A8BE7002Dimpl_uses*
;

constructor TpgFunctionSelectField.Create(const aDescription: IdaParamDescription);
//#UC START# *567BB5780118_567A8BE7002D_var*
//#UC END# *567BB5780118_567A8BE7002D_var*
begin
//#UC START# *567BB5780118_567A8BE7002D_impl*
 inherited Create;
 f_Description := aDescription;
//#UC END# *567BB5780118_567A8BE7002D_impl*
end;//TpgFunctionSelectField.Create

class function TpgFunctionSelectField.Make(const aDescription: IdaParamDescription): IdaSelectField;
var
 l_Inst : TpgFunctionSelectField;
begin
 l_Inst := Create(aDescription);
 try
  Result := l_Inst;
 finally
  l_Inst.Free;
 end;//try..finally
end;//TpgFunctionSelectField.Make

function TpgFunctionSelectField.Get_Alias: AnsiString;
//#UC START# *555352070022_567A8BE7002Dget_var*
//#UC END# *555352070022_567A8BE7002Dget_var*
begin
//#UC START# *555352070022_567A8BE7002Dget_impl*
 Result := '';
//#UC END# *555352070022_567A8BE7002Dget_impl*
end;//TpgFunctionSelectField.Get_Alias

function TpgFunctionSelectField.BuildSQLValue(AddAlias: Boolean = True): AnsiString;
//#UC START# *5608E5A4025F_567A8BE7002D_var*
//#UC END# *5608E5A4025F_567A8BE7002D_var*
begin
//#UC START# *5608E5A4025F_567A8BE7002D_impl*
 Result := f_Description.Name;
//#UC END# *5608E5A4025F_567A8BE7002D_impl*
end;//TpgFunctionSelectField.BuildSQLValue

procedure TpgFunctionSelectField.IterateTables(anAction: daSelectFieldIterator_IterateTables_Action);
//#UC START# *5756AC9B0213_567A8BE7002D_var*
//#UC END# *5756AC9B0213_567A8BE7002D_var*
begin
//#UC START# *5756AC9B0213_567A8BE7002D_impl*
// Do nothing
//#UC END# *5756AC9B0213_567A8BE7002D_impl*
end;//TpgFunctionSelectField.IterateTables

procedure TpgFunctionSelectField.IterateTablesF(anAction: daSelectFieldIterator_IterateTables_Action);
var
 Hack : Pointer absolute anAction;
begin
 try
  IterateTables(anAction);
 finally
  l3FreeLocalStub(Hack);
 end;//try..finally
end;//TpgFunctionSelectField.IterateTablesF

procedure TpgFunctionSelectField.Cleanup;
 {* ������� ������� ����� �������. }
//#UC START# *479731C50290_567A8BE7002D_var*
//#UC END# *479731C50290_567A8BE7002D_var*
begin
//#UC START# *479731C50290_567A8BE7002D_impl*
 f_Description := nil;
 inherited;
//#UC END# *479731C50290_567A8BE7002D_impl*
end;//TpgFunctionSelectField.Cleanup
{$IfEnd} // Defined(UsePostgres)

end.
