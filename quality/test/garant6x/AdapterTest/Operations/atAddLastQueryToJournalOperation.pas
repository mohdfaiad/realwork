unit atAddLastQueryToJournalOperation;

// ������: "w:\quality\test\garant6x\AdapterTest\Operations\atAddLastQueryToJournalOperation.pas"
// ���������: "SimpleClass"
// ������� ������: "TatAddLastQueryToJournalOperation" MUID: (500D895D02A3)

interface

uses
 l3IntfUses
 , atOperationBase
;

type
 TatAddLastQueryToJournalOperation = class(TatOperationBase)
  protected
   procedure ExecuteSelf; override;
   procedure InitParamList; override;
 end;//TatAddLastQueryToJournalOperation

implementation

uses
 l3ImplUses
 , atUserJournalHelper
 , SearchUnit
 , atLogger
 , atQuery
 , atQueryTypeConverter
 , Contnrs
 , SysUtils
 //#UC START# *500D895D02A3impl_uses*
 //#UC END# *500D895D02A3impl_uses*
;

procedure TatAddLastQueryToJournalOperation.ExecuteSelf;
//#UC START# *48089F460352_500D895D02A3_var*
  var
    l_Count : Integer;
    l_Query, l_ClonedQuery : IQuery;
    l_Queries : TObjectList;
    l_QTStr : String;
    l_QT : TQueryType;
    i : Integer;
//#UC END# *48089F460352_500D895D02A3_var*
begin
//#UC START# *48089F460352_500D895D02A3_impl*
  l_Count := Parameters['count'].AsInt;
  l_QTStr := Parameters['query_type'].AsStr;
  try
    l_QT := TatQueryTypeConverter.Instance.ToValue(l_QTStr);
  except
    on EConvertError do
    begin
      Logger.Error('����������� ��� �������: %s', [l_QTStr]);
      Exit;
    end;
  end;
  //
  l_Queries := TatUserJournalHelper.GetQueryHistory(l_QT, 1);
  if Assigned(l_Queries) then
    try
      l_Query := (l_Queries.Items[0] as TatQuery).Query;
    finally
      FreeAndNil(l_Queries);
    end
  else
  begin
    Logger.Error('� ������� ������ �� ������� �������� ���� %s', [l_QTStr]);
    Exit;
  end;
  //
  for i := 1 to l_Count do
  begin
    l_Query.Clone(l_ClonedQuery);
    TatUserJournalHelper.AddQuery(l_ClonedQuery);
    if i mod 5000 = 0 then
      Logger.Info('� ������ ������ ��������� %d ���. ����� ������� c ����� "%s"...', [i div 1000, l_QTStr]);
  end;
  Logger.Info('� ������ ������ ��������� %d ����� ������� � ����� "%s"', [l_Count, l_QTStr]);
//#UC END# *48089F460352_500D895D02A3_impl*
end;//TatAddLastQueryToJournalOperation.ExecuteSelf

procedure TatAddLastQueryToJournalOperation.InitParamList;
//#UC START# *48089F3701B4_500D895D02A3_var*
//#UC END# *48089F3701B4_500D895D02A3_var*
begin
//#UC START# *48089F3701B4_500D895D02A3_impl*
  inherited;
  with f_ParamList do
  begin
    Add( ParamType.Create('count', '���������� ����������� ��������', '1') );
    Add( ParamType.Create('query_type', '��� �������', 'QT_BASE_SEARCH') );
  end;
//#UC END# *48089F3701B4_500D895D02A3_impl*
end;//TatAddLastQueryToJournalOperation.InitParamList

end.
