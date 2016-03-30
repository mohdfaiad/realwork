unit NOT_COMPLETED_nsQuestions;

// ������: "w:\garant6x\implementation\Garant\GbaNemesis\Data\NOT_COMPLETED_nsQuestions.pas"
// ���������: "UtilityPack"
// ������� ������: "nsQuestions" MUID: (4F9A9C6803D4)

{$Include w:\garant6x\implementation\Garant\nsDefine.inc}

interface

uses
 l3IntfUses
 , l3MessageID
 , l3StringIDEx
;

const
 {* ������������ ������ Asks }
 str_DocumentEMailSelection: Tl3MessageID = (rS : -1; rLocalized : false; rKey : 'DocumentEMailSelection'; rValue : '��������� �� E-mail:');
  {* '��������� �� E-mail:' }
 str_ListEMailSelection: Tl3MessageID = (rS : -1; rLocalized : false; rKey : 'ListEMailSelection'; rValue : '��������� �� EMail');
  {* '��������� �� EMail' }
 str_ListPrintSelectedConfirmation: Tl3MessageID = (rS : -1; rLocalized : false; rKey : 'ListPrintSelectedConfirmation'; rValue : '��������:');
  {* '��������:' }
 str_PrintSelectedConfirmation: Tl3MessageID = (rS : -1; rLocalized : false; rKey : 'PrintSelectedConfirmation'; rValue : '��������:');
  {* '��������:' }
 str_ExportSelectionToWord: Tl3MessageID = (rS : -1; rLocalized : false; rKey : 'ExportSelectionToWord'; rValue : '�������������� � MS-Word');
  {* '�������������� � MS-Word' }
 str_ListExportSelectionToWord: Tl3MessageID = (rS : -1; rLocalized : false; rKey : 'ListExportSelectionToWord'; rValue : '�������������� � MS-Word:');
  {* '�������������� � MS-Word:' }
 str_ConsultDocumentsNotFound: Tl3MessageID = (rS : -1; rLocalized : false; rKey : 'ConsultDocumentsNotFound'; rValue : '���������� �� ������� ������� ����������� � ������������� � ��� ���������.');
  {* '���������� �� ������� ������� ����������� � ������������� � ��� ���������.' }
 str_ConsultDocumentsNotFoundNoSpec: Tl3MessageID = (rS : -1; rLocalized : false; rKey : 'ConsultDocumentsNotFoundNoSpec'; rValue : '���������� �� ������� ������� ����������� � ������������� � ��� ���������.');
  {* '���������� �� ������� ������� ����������� � ������������� � ��� ���������.' }
 str_DocumentEMailSelection_CheckCaption: Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'DocumentEMailSelection_CheckCaption'; rValue : '������ ���������� ���������� ��������');
 str_DocumentEMailSelection_SettingsCaption: Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'DocumentEMailSelection_SettingsCaption'; rValue : '��������� �� EMail');
 str_DocumentEMailSelection_LongHint: Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'DocumentEMailSelection_LongHint'; rValue : '������������� ��� ��������� ����������� ���������');
 str_ListEMailSelection_CheckCaption: Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'ListEMailSelection_CheckCaption'; rValue : '������ ���������� ���������� �������� ');
 str_ListEMailSelection_SettingsCaption: Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'ListEMailSelection_SettingsCaption'; rValue : '��������� �� EMail');
 str_ListEMailSelection_LongHint: Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'ListEMailSelection_LongHint'; rValue : '������������� ��� ��������� ���������� ���������');
 str_ListPrintSelectedConfirmation_CheckCaption: Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'ListPrintSelectedConfirmation_CheckCaption'; rValue : '������ �������� ���������� ��������');
 str_ListPrintSelectedConfirmation_SettingsCaption: Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'ListPrintSelectedConfirmation_SettingsCaption'; rValue : '������');
 str_ListPrintSelectedConfirmation_LongHint: Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'ListPrintSelectedConfirmation_LongHint'; rValue : '������������� ��� ������ ���������� ���������');
 str_PrintSelectedConfirmation_CheckCaption: Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'PrintSelectedConfirmation_CheckCaption'; rValue : '������ �������� ���������� ��������');
 str_PrintSelectedConfirmation_SettingsCaption: Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'PrintSelectedConfirmation_SettingsCaption'; rValue : '������');
 str_PrintSelectedConfirmation_LongHint: Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'PrintSelectedConfirmation_LongHint'; rValue : '������������� ��� ������ ����������� ���������');
 str_ExportSelectionToWord_CheckCaption: Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'ExportSelectionToWord_CheckCaption'; rValue : '������ �������������� ���������� ��������');
 str_ExportSelectionToWord_SettingsCaption: Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'ExportSelectionToWord_SettingsCaption'; rValue : '������� � MS-Word');
 str_ExportSelectionToWord_LongHint: Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'ExportSelectionToWord_LongHint'; rValue : '������������� ��� �������� � MS-Word ����������� ���������');
 str_ListExportSelectionToWord_CheckCaption: Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'ListExportSelectionToWord_CheckCaption'; rValue : '������ �������������� ���������� ��������');
 str_ListExportSelectionToWord_SettingsCaption: Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'ListExportSelectionToWord_SettingsCaption'; rValue : '������� � MS-Word');
 str_ListExportSelectionToWord_LongHint: Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'ListExportSelectionToWord_LongHint'; rValue : '������������� ��� �������� � MS-Word ���������� ���������');

implementation

uses
 l3ImplUses
 {$If NOT Defined(NoVCL)}
 , Dialogs
 {$IfEnd} // NOT Defined(NoVCL)
;

const
 {* �������� ������ ��� ������� DocumentEMailSelection }
 str_DocumentEMailSelection_Choice_Selection: Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'DocumentEMailSelection_Choice_Selection'; rValue : '���������� ��������');
  {* '���������� ��������' }
 str_DocumentEMailSelection_Choice_WholeDocument: Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'DocumentEMailSelection_Choice_WholeDocument'; rValue : '�������� �������');
  {* '�������� �������' }
 {* �������� ������ ��� ������� ListEMailSelection }
 str_ListEMailSelection_Choice_Selected: Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'ListEMailSelection_Choice_Selected'; rValue : '���������� ��������');
  {* '���������� ��������' }
 str_ListEMailSelection_Choice_WholeList: Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'ListEMailSelection_Choice_WholeList'; rValue : '������ �������');
  {* '������ �������' }
 {* �������� ������ ��� ������� ListPrintSelectedConfirmation }
 str_ListPrintSelectedConfirmation_Choice_Selected: Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'ListPrintSelectedConfirmation_Choice_Selected'; rValue : '���������� ��������');
  {* '���������� ��������' }
 str_ListPrintSelectedConfirmation_Choice_WholeList: Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'ListPrintSelectedConfirmation_Choice_WholeList'; rValue : '������ �������');
  {* '������ �������' }
 {* �������� ������ ��� ������� PrintSelectedConfirmation }
 str_PrintSelectedConfirmation_Choice_Selected: Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'PrintSelectedConfirmation_Choice_Selected'; rValue : '���������� ��������');
  {* '���������� ��������' }
 str_PrintSelectedConfirmation_Choice_WholeDocument: Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'PrintSelectedConfirmation_Choice_WholeDocument'; rValue : '�������� �������');
  {* '�������� �������' }
 {* �������� ������ ��� ������� ExportSelectionToWord }
 str_ExportSelectionToWord_Choice_Selected: Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'ExportSelectionToWord_Choice_Selected'; rValue : '���������� ��������');
  {* '���������� ��������' }
 str_ExportSelectionToWord_Choice_WholeDocument: Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'ExportSelectionToWord_Choice_WholeDocument'; rValue : '�������� �������');
  {* '�������� �������' }
 {* �������� ������ ��� ������� ListExportSelectionToWord }
 str_ListExportSelectionToWord_Choice_Selected: Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'ListExportSelectionToWord_Choice_Selected'; rValue : '���������� ��������');
  {* '���������� ��������' }
 str_ListExportSelectionToWord_Choice_WholeList: Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'ListExportSelectionToWord_Choice_WholeList'; rValue : '������ �������');
  {* '������ �������' }
 {* �������� ������ ��� ������� ConsultDocumentsNotFound }
 str_ConsultDocumentsNotFound_Choice_Spec: Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'ConsultDocumentsNotFound_Choice_Spec'; rValue : '���������� � ������������ �������� ��������� ������');
  {* '���������� � ������������ �������� ��������� ������' }
 str_ConsultDocumentsNotFound_Choice_Back: Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'ConsultDocumentsNotFound_Choice_Back'; rValue : '��������� � �������� � �������� ������� �������');
  {* '��������� � �������� � �������� ������� �������' }
 {* �������� ������ ��� ������� ConsultDocumentsNotFoundNoSpec }
 str_ConsultDocumentsNotFoundNoSpec_Choice_Back: Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'ConsultDocumentsNotFoundNoSpec_Choice_Back'; rValue : '��������� � �������� � �������� ������� �������');
  {* '��������� � �������� � �������� ������� �������' }

initialization
 str_DocumentEMailSelection_Choice_Selection.Init;
 {* ������������� str_DocumentEMailSelection_Choice_Selection }
 str_DocumentEMailSelection_Choice_WholeDocument.Init;
 {* ������������� str_DocumentEMailSelection_Choice_WholeDocument }
 str_ListEMailSelection_Choice_Selected.Init;
 {* ������������� str_ListEMailSelection_Choice_Selected }
 str_ListEMailSelection_Choice_WholeList.Init;
 {* ������������� str_ListEMailSelection_Choice_WholeList }
 str_ListPrintSelectedConfirmation_Choice_Selected.Init;
 {* ������������� str_ListPrintSelectedConfirmation_Choice_Selected }
 str_ListPrintSelectedConfirmation_Choice_WholeList.Init;
 {* ������������� str_ListPrintSelectedConfirmation_Choice_WholeList }
 str_PrintSelectedConfirmation_Choice_Selected.Init;
 {* ������������� str_PrintSelectedConfirmation_Choice_Selected }
 str_PrintSelectedConfirmation_Choice_WholeDocument.Init;
 {* ������������� str_PrintSelectedConfirmation_Choice_WholeDocument }
 str_ExportSelectionToWord_Choice_Selected.Init;
 {* ������������� str_ExportSelectionToWord_Choice_Selected }
 str_ExportSelectionToWord_Choice_WholeDocument.Init;
 {* ������������� str_ExportSelectionToWord_Choice_WholeDocument }
 str_ListExportSelectionToWord_Choice_Selected.Init;
 {* ������������� str_ListExportSelectionToWord_Choice_Selected }
 str_ListExportSelectionToWord_Choice_WholeList.Init;
 {* ������������� str_ListExportSelectionToWord_Choice_WholeList }
 str_ConsultDocumentsNotFound_Choice_Spec.Init;
 {* ������������� str_ConsultDocumentsNotFound_Choice_Spec }
 str_ConsultDocumentsNotFound_Choice_Back.Init;
 {* ������������� str_ConsultDocumentsNotFound_Choice_Back }
 str_ConsultDocumentsNotFoundNoSpec_Choice_Back.Init;
 {* ������������� str_ConsultDocumentsNotFoundNoSpec_Choice_Back }
 str_DocumentEMailSelection.Init;
!!! Lost Message ini !!!
 {* ������������� str_DocumentEMailSelection }
 str_ListEMailSelection.Init;
!!! Lost Message ini !!!
 {* ������������� str_ListEMailSelection }
 str_ListPrintSelectedConfirmation.Init;
!!! Lost Message ini !!!
 {* ������������� str_ListPrintSelectedConfirmation }
 str_PrintSelectedConfirmation.Init;
!!! Lost Message ini !!!
 {* ������������� str_PrintSelectedConfirmation }
 str_ExportSelectionToWord.Init;
!!! Lost Message ini !!!
 {* ������������� str_ExportSelectionToWord }
 str_ListExportSelectionToWord.Init;
!!! Lost Message ini !!!
 {* ������������� str_ListExportSelectionToWord }
 str_ConsultDocumentsNotFound.Init;
!!! Lost Message ini !!!
 {* ������������� str_ConsultDocumentsNotFound }
 str_ConsultDocumentsNotFoundNoSpec.Init;
!!! Lost Message ini !!!
 {* ������������� str_ConsultDocumentsNotFoundNoSpec }
 str_DocumentEMailSelection_CheckCaption.Init;
 {* ������������� str_DocumentEMailSelection_CheckCaption }
 str_DocumentEMailSelection_SettingsCaption.Init;
 {* ������������� str_DocumentEMailSelection_SettingsCaption }
 str_DocumentEMailSelection_LongHint.Init;
 {* ������������� str_DocumentEMailSelection_LongHint }
 str_ListEMailSelection_CheckCaption.Init;
 {* ������������� str_ListEMailSelection_CheckCaption }
 str_ListEMailSelection_SettingsCaption.Init;
 {* ������������� str_ListEMailSelection_SettingsCaption }
 str_ListEMailSelection_LongHint.Init;
 {* ������������� str_ListEMailSelection_LongHint }
 str_ListPrintSelectedConfirmation_CheckCaption.Init;
 {* ������������� str_ListPrintSelectedConfirmation_CheckCaption }
 str_ListPrintSelectedConfirmation_SettingsCaption.Init;
 {* ������������� str_ListPrintSelectedConfirmation_SettingsCaption }
 str_ListPrintSelectedConfirmation_LongHint.Init;
 {* ������������� str_ListPrintSelectedConfirmation_LongHint }
 str_PrintSelectedConfirmation_CheckCaption.Init;
 {* ������������� str_PrintSelectedConfirmation_CheckCaption }
 str_PrintSelectedConfirmation_SettingsCaption.Init;
 {* ������������� str_PrintSelectedConfirmation_SettingsCaption }
 str_PrintSelectedConfirmation_LongHint.Init;
 {* ������������� str_PrintSelectedConfirmation_LongHint }
 str_ExportSelectionToWord_CheckCaption.Init;
 {* ������������� str_ExportSelectionToWord_CheckCaption }
 str_ExportSelectionToWord_SettingsCaption.Init;
 {* ������������� str_ExportSelectionToWord_SettingsCaption }
 str_ExportSelectionToWord_LongHint.Init;
 {* ������������� str_ExportSelectionToWord_LongHint }
 str_ListExportSelectionToWord_CheckCaption.Init;
 {* ������������� str_ListExportSelectionToWord_CheckCaption }
 str_ListExportSelectionToWord_SettingsCaption.Init;
 {* ������������� str_ListExportSelectionToWord_SettingsCaption }
 str_ListExportSelectionToWord_LongHint.Init;
 {* ������������� str_ListExportSelectionToWord_LongHint }

end.
