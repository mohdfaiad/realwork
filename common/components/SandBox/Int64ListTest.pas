unit Int64ListTest;

// ������: "w:\common\components\SandBox\Int64ListTest.pas"
// ���������: "TestCase"
// ������� ������: "Int64ListTest" MUID: (51DEE8E9025A)
// ��� ����: "TInt64ListTest"

{$Include w:\common\components\SandBox\sbtDefine.inc}

interface

{$If Defined(nsTest)}
uses
 l3IntfUses
 , TestFrameWork
 , Int64List
;

type
 _ListType_ = TInt64List;
 {$Include w:\common\components\SandBox\AtomicListTest.imp.pas}
 TInt64ListTest = class(_AtomicListTest_)
 end;//TInt64ListTest
{$IfEnd} // Defined(nsTest)

implementation

{$If Defined(nsTest)}
uses
 l3ImplUses
 , SysUtils
 //#UC START# *51DEE8E9025Aimpl_uses*
 //#UC END# *51DEE8E9025Aimpl_uses*
;

{$Include w:\common\components\SandBox\AtomicListTest.imp.pas}

initialization
 TestFramework.RegisterTest(TInt64ListTest.Suite);
{$IfEnd} // Defined(nsTest)

end.
