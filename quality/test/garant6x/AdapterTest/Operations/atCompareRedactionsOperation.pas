unit atCompareRedactionsOperation;

// ������: "w:\quality\test\garant6x\AdapterTest\Operations\atCompareRedactionsOperation.pas"
// ���������: "SimpleClass"
// ������� ������: "TatCompareRedactionsOperation" MUID: (4BAB7804006B)

interface

uses
 l3IntfUses
 , atOperationBase
;

type
 TatCompareRedactionsOperation = class(TatOperationBase)
  protected
   procedure ExecuteSelf; override;
   procedure InitParamList; override;
 end;//TatCompareRedactionsOperation

implementation

uses
 l3ImplUses
 , DocumentUnit
 , atLogger
 , atDocumentHelper
;

procedure TatCompareRedactionsOperation.ExecuteSelf;
//#UC START# *48089F460352_4BAB7804006B_var*
  var
    l_Document : IDocument;
    l_DocState : IDocumentState;
    l_PrevRedactionsList : IRedactionInfoList;
    l_RedactionInfo : TRedactionInfo;
    i, l_DiffsCount,  l_ComparedRedaction, l_MaxDiffsCount : Integer;
    l_DiffData : TDiffData;
    l_ParaNum : TParaNum;
    l_EP : TEntryPoint;
//#UC END# *48089F460352_4BAB7804006B_var*
begin
//#UC START# *48089F460352_4BAB7804006B_impl*
  inherited;
  //
  l_ComparedRedaction := Parameters['compared_redaction'].AsInt;
  l_MaxDiffsCount := Parameters['max_diffs_count'].AsInt;
  //
  l_Document := ExecutionContext.UserWorkContext.CurrDoc;
  if (l_Document = nil) then
  begin
    Logger.Error('��� ��������� ���������!');
    Exit;
  end;
  //
  l_Document.GetCurrentState(l_DocState);
  Assert(l_DocState <> nil);
  // �������� ������ ��������, � �������� ����� ���������� ��������
  l_DocState.GetPrevRedactionsList(l_PrevRedactionsList);
  if (l_PrevRedactionsList = nil) OR (l_PrevRedactionsList.Count = 0) then
  begin
    Logger.Info('� ��������� ��� ���������� ��������!');
    Exit;
  end;

  // ���������� ������ ��������
  for i := 0 to l_PrevRedactionsList.Count-1 do
  begin
    l_PrevRedactionsList.pm_GetItem(i, l_RedactionInfo);

    if (l_ComparedRedaction <> -1) AND (l_RedactionInfo.rId <> l_ComparedRedaction) then
      continue;

    if (NOT l_RedactionInfo.rIsComparable) then
    begin
      Logger.Warning('�������� %d �� �����������', [l_RedactionInfo.rId]);
      continue;
    end;

    Logger.Info('���������� �������� %d � ��������� %d', [l_Document.GetInternalId, l_RedactionInfo.rId]);
    // ����������
    l_DocState.DiffWithRedactionById(l_RedactionInfo.rId, l_DiffData);

    // �������� �� ���������
    l_DiffsCount := 0;
    while ((l_MaxDiffsCount = -1) OR (l_DiffsCount < l_MaxDiffsCount))
      AND l_DiffData.rDiffIterator.HasNext do
    begin
      l_ParaNum := l_DiffData.rDiffIterator.Next;
      //
      if TatDocumentHelper.FindPara(l_DiffData.rCur, l_ParaNum, l_EP) then
        TatDocumentHelper.ReadPara(l_DiffData.rCur, l_EP);
      if TatDocumentHelper.FindPara(l_DiffData.rPrev, l_ParaNum, l_EP) then
        TatDocumentHelper.ReadPara(l_DiffData.rPrev, l_EP);
      //
      Inc(l_DiffsCount);
    end;
  end;
//#UC END# *48089F460352_4BAB7804006B_impl*
end;//TatCompareRedactionsOperation.ExecuteSelf

procedure TatCompareRedactionsOperation.InitParamList;
//#UC START# *48089F3701B4_4BAB7804006B_var*
//#UC END# *48089F3701B4_4BAB7804006B_var*
begin
//#UC START# *48089F3701B4_4BAB7804006B_impl*
  inherited;
  with f_ParamList do
  begin
    Add( ParamType.Create('compared_redaction', '����� ������������ ��������', '-1') );
    Add( ParamType.Create('max_diffs_count', '������������� �� ����� ������� ��������', '-1') );
  end;
//#UC END# *48089F3701B4_4BAB7804006B_impl*
end;//TatCompareRedactionsOperation.InitParamList

end.
