{$I ArchiGlobals.inc}
{$Define DebugRelease}
{$Define FlushTbl}  //dtDefine.inc
{.$Define EverestRelease}
{.$Define MonoUser}
{.$Define NOJOKE}
{$Define _m0DEBUG1}
{$Define _m0LOGSAV1}
{$Define _m0MSGBOX1} //���������� ��������� �� exception ������������
{$Define ddWriteGarantAttributes} //ddDefine.inc
{$Define DebugStackTrace}
{$Define l3OldRegExpOff}
{.$Define DisableNSRCOut} //����������� ����������� ������� � NSRC
{.$Define StackInExeption}
{$Define evDualSpell}
{$Define evNotUseTreePara}
{$Define k2NoTagTree}
{.$Define l3TraceAllocStub}
{$Define evNeedWaitHeight} //������������� ������������

{$Define ReadPropErrorToLog} //ReadProperty Error to write log and not Show
                             //������������ � Classes.pas, ��� ��� ����� ���������� ����

//{$Define VersionCommands}
{.$Define SilentAttrSet} // ��������� ������ � ��� �������� ��������� ����������
{.$Define m3UseForkStreamToOldBase} // �������� ���������� ���������� ���������� � ������ � ����� ���������
{.$Define m3UseOldBase}
{.$Define m3LogLocks} // ������ � ��� �������/������� � ����� ���������
{$Undef  l3TraceMemAllocStat} //���� ������, ������� ������ ����� ��������� � ���� ���� � ��� ����� ��������� �����
{$Undef  l3AssertSimpleMMCanFreeBlocks} //���� ������

{$Define evRealPaint} //��������� � ��������� ����� �����
{$Define l3RealPaint}

{$UnDef l3UseMMX} //������������� ��������� MMX ��� Move
{$Undef l3UseSSE} //������������� ��������� SSE ��� Move
{$Undef l3UseFPU}
{$Undef evStoreSubsIndex} //�� ���������� ������ ������������� ����� � ���, � �������� ��� ��� ������ =======
{$DEFINE l3CheckUnfreedResources}
{$DEFINE l3TraceClasses}
{$DEFINE NewPubDict}
{.$DEFINE RemoteDict} // ��������� �������������� ��������
{$DEFINE LoginEx} // ��� ���� ���������� � �����
{$DEFINE ddUseVTSpin}
{.$DEFINE evdCheckFrames}
{.$DEFINE HT_NEWDLL}

{.$Define DelLogTrace}

{$Define NoVGScene}
{$Define NoVCM}
{.$DEFINE ForRegion}

{$DEFINE evCalcSubFlags}
{$DEFINE arAttrInEVD} // ����� �������
{.$DEFINE evOldNSRCTableOff}

{$DEFINE DisableTimeDiff} // ������� �������� ������������� ������� � ��������

{$Define AppClientSide}
