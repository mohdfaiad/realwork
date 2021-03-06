unit ListInfoKeywordsPack;
 {* ����� ���� ������� ��� ������� � ����������� ��������� ����� ListInfo }

// ������: "w:\garant6x\implementation\Garant\GbaNemesis\View\List\ListInfoKeywordsPack.pas"
// ���������: "ScriptKeywordsPack"
// ������� ������: "ListInfoKeywordsPack" MUID: (67BD224FB2E7)

{$Include w:\garant6x\implementation\Garant\nsDefine.inc}

interface

{$If NOT Defined(Admin) AND NOT Defined(Monitorings) AND NOT Defined(NoScripts)}
uses
 l3IntfUses
 {$If Defined(Nemesis)}
 , nscEditor
 {$IfEnd} // Defined(Nemesis)
 {$If Defined(Nemesis)}
 , nscTextSource
 {$IfEnd} // Defined(Nemesis)
;
{$IfEnd} // NOT Defined(Admin) AND NOT Defined(Monitorings) AND NOT Defined(NoScripts)

implementation

{$If NOT Defined(Admin) AND NOT Defined(Monitorings) AND NOT Defined(NoScripts)}
uses
 l3ImplUses
 , ListInfo_Form
 , tfwControlString
 {$If NOT Defined(NoVCL)}
 , kwBynameControlPush
 {$IfEnd} // NOT Defined(NoVCL)
 , tfwScriptingInterfaces
 , tfwPropertyLike
 , TypInfo
 , tfwTypeInfo
 , TtfwClassRef_Proxy
 , SysUtils
 , TtfwTypeRegistrator_Proxy
 , tfwScriptingTypes
;

type
 Tkw_Form_ListInfo = {final} class(TtfwControlString)
  {* ����� ������� ��� �������������� ����� ListInfo
----
*������ �������������*:
[code]
'aControl' �����::ListInfo TryFocus ASSERT
[code] }
  protected
   function GetString: AnsiString; override;
   class function GetWordNameForRegister: AnsiString; override;
 end;//Tkw_Form_ListInfo

 Tkw_ListInfo_Control_ListInfoViewer = {final} class(TtfwControlString)
  {* ����� ������� ��� �������������� �������� ListInfoViewer
----
*������ �������������*:
[code]
�������::ListInfoViewer TryFocus ASSERT
[code] }
  protected
   function GetString: AnsiString; override;
   class procedure RegisterInEngine; override;
   class function GetWordNameForRegister: AnsiString; override;
 end;//Tkw_ListInfo_Control_ListInfoViewer

 Tkw_ListInfo_Control_ListInfoViewer_Push = {final} class({$If NOT Defined(NoVCL)}
 TkwBynameControlPush
 {$IfEnd} // NOT Defined(NoVCL)
 )
  {* ����� ������� ��� �������� ListInfoViewer
----
*������ �������������*:
[code]
�������::ListInfoViewer:push pop:control:SetFocus ASSERT
[code] }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
 end;//Tkw_ListInfo_Control_ListInfoViewer_Push

 Tkw_ListInfo_Component_TextSource = {final} class(TtfwControlString)
  {* ����� ������� ��� �������������� �������� TextSource
----
*������ �������������*:
[code]
���������::TextSource TryFocus ASSERT
[code] }
  protected
   function GetString: AnsiString; override;
   class procedure RegisterInEngine; override;
   class function GetWordNameForRegister: AnsiString; override;
 end;//Tkw_ListInfo_Component_TextSource

 TkwEfListInfoListInfoViewer = {final} class(TtfwPropertyLike)
  {* ����� ������� .TefListInfo.ListInfoViewer }
  private
   function ListInfoViewer(const aCtx: TtfwContext;
    aefListInfo: TefListInfo): TnscEditor;
    {* ���������� ����� ������� .TefListInfo.ListInfoViewer }
  protected
   class function GetWordNameForRegister: AnsiString; override;
   procedure DoDoIt(const aCtx: TtfwContext); override;
  public
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
   procedure SetValuePrim(const aValue: TtfwStackValue;
    const aCtx: TtfwContext); override;
 end;//TkwEfListInfoListInfoViewer

 TkwEfListInfoTextSource = {final} class(TtfwPropertyLike)
  {* ����� ������� .TefListInfo.TextSource }
  private
   function TextSource(const aCtx: TtfwContext;
    aefListInfo: TefListInfo): TnscTextSource;
    {* ���������� ����� ������� .TefListInfo.TextSource }
  protected
   class function GetWordNameForRegister: AnsiString; override;
   procedure DoDoIt(const aCtx: TtfwContext); override;
  public
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
   procedure SetValuePrim(const aValue: TtfwStackValue;
    const aCtx: TtfwContext); override;
 end;//TkwEfListInfoTextSource

function Tkw_Form_ListInfo.GetString: AnsiString;
begin
 Result := 'efListInfo';
end;//Tkw_Form_ListInfo.GetString

class function Tkw_Form_ListInfo.GetWordNameForRegister: AnsiString;
begin
 Result := '�����::ListInfo';
end;//Tkw_Form_ListInfo.GetWordNameForRegister

function Tkw_ListInfo_Control_ListInfoViewer.GetString: AnsiString;
begin
 Result := 'ListInfoViewer';
end;//Tkw_ListInfo_Control_ListInfoViewer.GetString

class procedure Tkw_ListInfo_Control_ListInfoViewer.RegisterInEngine;
begin
 inherited;
 TtfwClassRef.Register(TnscEditor);
end;//Tkw_ListInfo_Control_ListInfoViewer.RegisterInEngine

class function Tkw_ListInfo_Control_ListInfoViewer.GetWordNameForRegister: AnsiString;
begin
 Result := '�������::ListInfoViewer';
end;//Tkw_ListInfo_Control_ListInfoViewer.GetWordNameForRegister

procedure Tkw_ListInfo_Control_ListInfoViewer_Push.DoDoIt(const aCtx: TtfwContext);
begin
 aCtx.rEngine.PushString('ListInfoViewer');
 inherited;
end;//Tkw_ListInfo_Control_ListInfoViewer_Push.DoDoIt

class function Tkw_ListInfo_Control_ListInfoViewer_Push.GetWordNameForRegister: AnsiString;
begin
 Result := '�������::ListInfoViewer:push';
end;//Tkw_ListInfo_Control_ListInfoViewer_Push.GetWordNameForRegister

function Tkw_ListInfo_Component_TextSource.GetString: AnsiString;
begin
 Result := 'TextSource';
end;//Tkw_ListInfo_Component_TextSource.GetString

class procedure Tkw_ListInfo_Component_TextSource.RegisterInEngine;
begin
 inherited;
 TtfwClassRef.Register(TnscTextSource);
end;//Tkw_ListInfo_Component_TextSource.RegisterInEngine

class function Tkw_ListInfo_Component_TextSource.GetWordNameForRegister: AnsiString;
begin
 Result := '���������::TextSource';
end;//Tkw_ListInfo_Component_TextSource.GetWordNameForRegister

function TkwEfListInfoListInfoViewer.ListInfoViewer(const aCtx: TtfwContext;
 aefListInfo: TefListInfo): TnscEditor;
 {* ���������� ����� ������� .TefListInfo.ListInfoViewer }
begin
 Result := aefListInfo.ListInfoViewer;
end;//TkwEfListInfoListInfoViewer.ListInfoViewer

class function TkwEfListInfoListInfoViewer.GetWordNameForRegister: AnsiString;
begin
 Result := '.TefListInfo.ListInfoViewer';
end;//TkwEfListInfoListInfoViewer.GetWordNameForRegister

function TkwEfListInfoListInfoViewer.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
begin
 Result := TypeInfo(TnscEditor);
end;//TkwEfListInfoListInfoViewer.GetResultTypeInfo

function TkwEfListInfoListInfoViewer.GetAllParamsCount(const aCtx: TtfwContext): Integer;
begin
 Result := 1;
end;//TkwEfListInfoListInfoViewer.GetAllParamsCount

function TkwEfListInfoListInfoViewer.ParamsTypes: PTypeInfoArray;
begin
 Result := OpenTypesToTypes([TypeInfo(TefListInfo)]);
end;//TkwEfListInfoListInfoViewer.ParamsTypes

procedure TkwEfListInfoListInfoViewer.SetValuePrim(const aValue: TtfwStackValue;
 const aCtx: TtfwContext);
begin
 RunnerError('������ ����������� �������� readonly �������� ListInfoViewer', aCtx);
end;//TkwEfListInfoListInfoViewer.SetValuePrim

procedure TkwEfListInfoListInfoViewer.DoDoIt(const aCtx: TtfwContext);
var l_aefListInfo: TefListInfo;
begin
 try
  l_aefListInfo := TefListInfo(aCtx.rEngine.PopObjAs(TefListInfo));
 except
  on E: Exception do
  begin
   RunnerError('������ ��� ��������� ��������� aefListInfo: TefListInfo : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushObj(ListInfoViewer(aCtx, l_aefListInfo));
end;//TkwEfListInfoListInfoViewer.DoDoIt

function TkwEfListInfoTextSource.TextSource(const aCtx: TtfwContext;
 aefListInfo: TefListInfo): TnscTextSource;
 {* ���������� ����� ������� .TefListInfo.TextSource }
begin
 Result := aefListInfo.TextSource;
end;//TkwEfListInfoTextSource.TextSource

class function TkwEfListInfoTextSource.GetWordNameForRegister: AnsiString;
begin
 Result := '.TefListInfo.TextSource';
end;//TkwEfListInfoTextSource.GetWordNameForRegister

function TkwEfListInfoTextSource.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
begin
 Result := TypeInfo(TnscTextSource);
end;//TkwEfListInfoTextSource.GetResultTypeInfo

function TkwEfListInfoTextSource.GetAllParamsCount(const aCtx: TtfwContext): Integer;
begin
 Result := 1;
end;//TkwEfListInfoTextSource.GetAllParamsCount

function TkwEfListInfoTextSource.ParamsTypes: PTypeInfoArray;
begin
 Result := OpenTypesToTypes([TypeInfo(TefListInfo)]);
end;//TkwEfListInfoTextSource.ParamsTypes

procedure TkwEfListInfoTextSource.SetValuePrim(const aValue: TtfwStackValue;
 const aCtx: TtfwContext);
begin
 RunnerError('������ ����������� �������� readonly �������� TextSource', aCtx);
end;//TkwEfListInfoTextSource.SetValuePrim

procedure TkwEfListInfoTextSource.DoDoIt(const aCtx: TtfwContext);
var l_aefListInfo: TefListInfo;
begin
 try
  l_aefListInfo := TefListInfo(aCtx.rEngine.PopObjAs(TefListInfo));
 except
  on E: Exception do
  begin
   RunnerError('������ ��� ��������� ��������� aefListInfo: TefListInfo : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushObj(TextSource(aCtx, l_aefListInfo));
end;//TkwEfListInfoTextSource.DoDoIt

initialization
 Tkw_Form_ListInfo.RegisterInEngine;
 {* ����������� Tkw_Form_ListInfo }
 Tkw_ListInfo_Control_ListInfoViewer.RegisterInEngine;
 {* ����������� Tkw_ListInfo_Control_ListInfoViewer }
 Tkw_ListInfo_Control_ListInfoViewer_Push.RegisterInEngine;
 {* ����������� Tkw_ListInfo_Control_ListInfoViewer_Push }
 Tkw_ListInfo_Component_TextSource.RegisterInEngine;
 {* ����������� Tkw_ListInfo_Component_TextSource }
 TkwEfListInfoListInfoViewer.RegisterInEngine;
 {* ����������� efListInfo_ListInfoViewer }
 TkwEfListInfoTextSource.RegisterInEngine;
 {* ����������� efListInfo_TextSource }
 TtfwTypeRegistrator.RegisterType(TypeInfo(TefListInfo));
 {* ����������� ���� TefListInfo }
 TtfwTypeRegistrator.RegisterType(TypeInfo(TnscEditor));
 {* ����������� ���� TnscEditor }
 TtfwTypeRegistrator.RegisterType(TypeInfo(TnscTextSource));
 {* ����������� ���� TnscTextSource }
{$IfEnd} // NOT Defined(Admin) AND NOT Defined(Monitorings) AND NOT Defined(NoScripts)

end.
