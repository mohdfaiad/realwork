unit pgFunction;

// ������: "w:\common\components\rtl\Garant\PG\pgFunction.pas"
// ���������: "SimpleClass"
// ������� ������: "TpgFunction" MUID: (56616E840213)

{$Include w:\common\components\rtl\Garant\PG\pgDefine.inc}

interface

{$If Defined(UsePostgres)}
uses
 l3IntfUses
 , daQuery
 , daInterfaces
 , daParamList
 , daSelectFieldList
 , pgConnection
 , pgParamDecsriptionList
;

type
 TpgFunction = class(TdaQuery, IdaFunction)
  private
   f_SchemeName: AnsiString;
   f_FunctionName: AnsiString;
   f_CanReturnSet: Boolean;
   f_InParamList: TdaParamList;
   f_OutParamList: TdaParamList;
   f_SelectFields: TdaSelectFieldList;
   f_QueryName: AnsiString;
   f_Connection: TpgConnection;
  private
   function BuildParamList: AnsiString;
  protected
   function MakeResultSet(Unidirectional: Boolean): IdaResultSet; override;
   procedure PrepareQuery; override;
   procedure UnprepareQuery; override;
   procedure Execute;
   function DoBuildSQLValue(const aHelper: IdaParamListHelper): AnsiString; override;
   function Get_Name: AnsiString;
   procedure Cleanup; override;
    {* ������� ������� ����� �������. }
  public
   constructor Create(aConnection: TpgConnection;
    const aDataConverter: IdaDataConverter;
    const aSchemeName: AnsiString;
    const aFunctionName: AnsiString;
    aParamsDescription: TpgParamDecsriptionList;
    CanReturnSet: Boolean); reintroduce;
   class function Make(aConnection: TpgConnection;
    const aDataConverter: IdaDataConverter;
    const aSchemeName: AnsiString;
    const aFunctionName: AnsiString;
    aParamsDescription: TpgParamDecsriptionList;
    CanReturnSet: Boolean): IdaFunction; reintroduce;
 end;//TpgFunction
{$IfEnd} // Defined(UsePostgres)

implementation

{$If Defined(UsePostgres)}
uses
 l3ImplUses
 , daTypes
 , SysUtils
 , pgResultSet
 , pgFunctionSelectField
 , pgInterfaces
 , LibPQ
 , daScheme
 , pgUtils
;

constructor TpgFunction.Create(aConnection: TpgConnection;
 const aDataConverter: IdaDataConverter;
 const aSchemeName: AnsiString;
 const aFunctionName: AnsiString;
 aParamsDescription: TpgParamDecsriptionList;
 CanReturnSet: Boolean);
//#UC START# *5673D6990214_56616E840213_var*
var
 l_IDX: Integer;
//#UC END# *5673D6990214_56616E840213_var*
begin
//#UC START# *5673D6990214_56616E840213_impl*
 inherited Create(aDataConverter);
 aConnection.SetRefTo(f_Connection);
 f_SchemeName := aSchemeName;
 f_FunctionName := aFunctionName;
 f_CanReturnSet := CanReturnSet;
 f_InParamList := TdaParamList.Make;
 f_OutParamList := TdaParamList.Make;
 f_SelectFields := TdaSelectFieldList.Make;
 for l_IDX := 0 to aParamsDescription.Count - 1 do
 begin
  AddParam(aParamsDescription[l_IDX]);
  if aParamsDescription[l_IDX].ParamType in [da_ptInput, da_ptInOut] then
   f_InParamList.Add(Get_Param(aParamsDescription[l_IDX].Name));
  if aParamsDescription[l_IDX].ParamType in [da_ptOutput, da_ptInOut] then
  begin
   f_OutParamList.Add(Get_Param(aParamsDescription[l_IDX].Name));
   f_SelectFields.Add(TpgFunctionSelectField.Make(aParamsDescription[l_IDX]));
  end;
 end;
 PrepareQuery;
//#UC END# *5673D6990214_56616E840213_impl*
end;//TpgFunction.Create

function TpgFunction.BuildParamList: AnsiString;
//#UC START# *567BD1FA031C_56616E840213_var*
var
 l_IDX: Integer;
//#UC END# *567BD1FA031C_56616E840213_var*
begin
//#UC START# *567BD1FA031C_56616E840213_impl*
 Result := '';
 for l_IDX := 0 to f_InParamList.Count - 1 do
 begin
  if l_IDX > 0 then
   Result := Result + ', ';
  Result := Format('%s$%d', [Result, l_IDX + 1]);
 end;
 if Result <> '' then
  Result := Format('(%s)', [Result]);
//#UC END# *567BD1FA031C_56616E840213_impl*
end;//TpgFunction.BuildParamList

class function TpgFunction.Make(aConnection: TpgConnection;
 const aDataConverter: IdaDataConverter;
 const aSchemeName: AnsiString;
 const aFunctionName: AnsiString;
 aParamsDescription: TpgParamDecsriptionList;
 CanReturnSet: Boolean): IdaFunction;
var
 l_Inst : TpgFunction;
begin
 l_Inst := Create(aConnection, aDataConverter, aSchemeName, aFunctionName, aParamsDescription, CanReturnSet);
 try
  Result := l_Inst;
 finally
  l_Inst.Free;
 end;//try..finally
end;//TpgFunction.Make

function TpgFunction.MakeResultSet(Unidirectional: Boolean): IdaResultSet;
//#UC START# *56010A7801F2_56616E840213_var*
//#UC END# *56010A7801F2_56616E840213_var*
begin
//#UC START# *56010A7801F2_56616E840213_impl*
 Result := TpgResultSet.Make(f_Connection, DataConverter as IpgDataConverter, f_QueryName, f_InParamList, f_SelectFields, Unidirectional);
//#UC END# *56010A7801F2_56616E840213_impl*
end;//TpgFunction.MakeResultSet

procedure TpgFunction.PrepareQuery;
//#UC START# *56010AB70258_56616E840213_var*
var
 l_Result: PPGResult;
//#UC END# *56010AB70258_56616E840213_var*
begin
//#UC START# *56010AB70258_56616E840213_impl*
 f_QueryName := Format('Prc%p', [Pointer(Self)]);
 l_Result := PQprepare(f_Connection.Handle, PAnsiChar(f_QueryName),  PAnsiChar(BuildSQLValue(f_InParamList)), Params.Count, nil);
 try
  pgCheckStatus(l_Result);
 finally
  PQclear(l_Result);
 end;
//#UC END# *56010AB70258_56616E840213_impl*
end;//TpgFunction.PrepareQuery

procedure TpgFunction.UnprepareQuery;
//#UC START# *56010ACB00F0_56616E840213_var*
var
 l_Result: PPGResult;
//#UC END# *56010ACB00F0_56616E840213_var*
begin
//#UC START# *56010ACB00F0_56616E840213_impl*
 f_QueryName := '';
 exit;
 l_Result := PQExec(f_Connection.Handle, PAnsiChar(Format('DEALLOCATE %s', [f_QueryName])));
 try
  pgCheckStatus(l_Result);
  f_QueryName := '';
 finally
  PQClear(l_Result);
 end;
//#UC END# *56010ACB00F0_56616E840213_impl*
end;//TpgFunction.UnprepareQuery

procedure TpgFunction.Execute;
//#UC START# *5666D0EB0129_56616E840213_var*
var
 l_ResultSet: IdaResultSet;
 l_IDX: Integer;
//#UC END# *5666D0EB0129_56616E840213_var*
begin
//#UC START# *5666D0EB0129_56616E840213_impl*
 l_ResultSet := OpenResultSet;
 try
  if l_ResultSet.IsEmpty then
   Exit;
  for l_IDX := 0 to f_OutParamList.Count - 1 do
   f_OutParamList[l_IDX].AsString := l_ResultSet.Field[f_OutParamList[l_IDX].Name].AsString;
 finally
  l_ResultSet := nil;
 end;
//#UC END# *5666D0EB0129_56616E840213_impl*
end;//TpgFunction.Execute

function TpgFunction.DoBuildSQLValue(const aHelper: IdaParamListHelper): AnsiString;
//#UC START# *566A850001E5_56616E840213_var*
//#UC END# *566A850001E5_56616E840213_var*
begin
//#UC START# *566A850001E5_56616E840213_impl*
 Result := Format('select * from %s.%s%s', [TdaScheme.Instance.CheckScheme(f_SchemeName), f_FunctionName, BuildParamList]);
//#UC END# *566A850001E5_56616E840213_impl*
end;//TpgFunction.DoBuildSQLValue

function TpgFunction.Get_Name: AnsiString;
//#UC START# *57726BB403C3_56616E840213get_var*
//#UC END# *57726BB403C3_56616E840213get_var*
begin
//#UC START# *57726BB403C3_56616E840213get_impl*
 Result := f_FunctionName;
//#UC END# *57726BB403C3_56616E840213get_impl*
end;//TpgFunction.Get_Name

procedure TpgFunction.Cleanup;
 {* ������� ������� ����� �������. }
//#UC START# *479731C50290_56616E840213_var*
//#UC END# *479731C50290_56616E840213_var*
begin
//#UC START# *479731C50290_56616E840213_impl*
 Unprepare;
 FreeAndNil(f_SelectFields);
 FreeAndNil(f_InParamList);
 FreeAndNil(f_OutParamList);
 FreeAndNil(f_Connection);
 inherited;
//#UC END# *479731C50290_56616E840213_impl*
end;//TpgFunction.Cleanup
{$IfEnd} // Defined(UsePostgres)

end.
