{
  $Project$
  $Workfile$
  $Revision: 1.3 $
  $DateUTC$
  $Id: IdAuthentication.pas,v 1.3 2015/06/16 12:31:45 lukyanets Exp $

  This file is part of the Indy (Internet Direct) project, and is offered
  under the dual-licensing agreement described on the Indy website.
  (http://www.indyproject.org/)

  Copyright:
   (c) 1993-2005, Chad Z. Hower and the Indy Pit Crew. All rights reserved.
}
{
  $Log: IdAuthentication.pas,v $
  Revision 1.3  2015/06/16 12:31:45  lukyanets
  ����� Indy 10

}
{
  Rev 1.5    10/26/2004 10:59:30 PM  JPMugaas
  Updated ref.

  Rev 1.4    2004.02.03 5:44:52 PM  czhower
  Name changes

  Rev 1.3    10/5/2003 5:01:34 PM  GGrieve
  fix to compile Under DotNet

  Rev 1.2    10/4/2003 9:09:28 PM  GGrieve
  DotNet fixes

  Rev 1.1    10/3/2003 11:40:38 PM  GGrieve
  move InfyGetHostName here

  Rev 1.0    11/14/2002 02:12:52 PM  JPMugaas

  2001-Sep-11 : DSiders
    Corrected spelling for EIdAlreadyRegisteredAuthenticationMethod
}

unit IdAuthentication;

{
  Implementation of the Basic authentication as specified in RFC 2616
  Copyright: (c) Chad Z. Hower and The Winshoes Working Group.
  Author: Doychin Bondzhev (doychin@dsoft-bg.com)
}

interface

{$i IdCompilerDefines.inc}

uses
  Classes,
  IdHeaderList,
  IdGlobal,
  IdException;

type
  TIdAuthenticationSchemes = (asBasic, asDigest, asNTLM, asUnknown);
  TIdAuthSchemeSet = set of TIdAuthenticationSchemes;

  TIdAuthWhatsNext = (wnAskTheProgram, wnDoRequest, wnFail);

  TIdAuthentication = class(TPersistent)
  protected
    FCurrentStep: Integer;
    FParams: TIdHeaderList;
    FAuthParams: TIdHeaderList;

    function ReadAuthInfo(AuthName: String): String;
    function DoNext: TIdAuthWhatsNext; virtual; abstract;
    procedure SetAuthParams(AValue: TIdHeaderList);
    function GetPassword: String;
    function GetUserName: String;
    function GetSteps: Integer; virtual;
    procedure SetPassword(const Value: String); virtual;
    procedure SetUserName(const Value: String); virtual;
  public
    constructor Create; virtual;
    destructor Destroy; override;

    procedure Reset; virtual;
    procedure SetRequest(const AMethod, AUri: String); virtual;

    function Authentication: String; virtual; abstract;
    function KeepAlive: Boolean; virtual;
    function Next: TIdAuthWhatsNext;

    property AuthParams: TIdHeaderList read FAuthParams write SetAuthParams;
    property Params: TIdHeaderList read FParams;
    property Username: String read GetUserName write SetUserName;
    property Password: String read GetPassword write SetPassword;
    property Steps: Integer read GetSteps;
    property CurrentStep: Integer read FCurrentStep;
  end;

  TIdAuthenticationClass = class of TIdAuthentication;

  TIdBasicAuthentication = class(TIdAuthentication)
  protected
    FRealm: String;
    function DoNext: TIdAuthWhatsNext; override;
    function GetSteps: Integer; override;  // this function determines the number of steps that this
                                           // Authtentication needs take to suceed;
  public
    function Authentication: String; override;

    property Realm: String read FRealm write FRealm;
  end;

  EIdAlreadyRegisteredAuthenticationMethod = class(EIdException);

  { Support functions }
  procedure RegisterAuthenticationMethod(const MethodName: String; const AuthClass: TIdAuthenticationClass);
  procedure UnregisterAuthenticationMethod(const MethodName: String);
  function FindAuthClass(const AuthName: String): TIdAuthenticationClass;

implementation

uses
  IdCoderMIME, IdGlobalProtocols, IdResourceStringsProtocols,
  {$IFDEF HAS_UNIT_Generics_Collections}
  System.Generics.Collections,
  {$ENDIF}
  {$IFDEF HAS_UNIT_Generics_Defaults}
  System.Generics.Defaults,
  {$ENDIF}
  SysUtils;

var
  AuthList: {$IFDEF HAS_GENERICS_TDictionary}TDictionary<String, TIdAuthenticationClass>{$ELSE}TStringList{$ENDIF} = nil;

procedure RegisterAuthenticationMethod(const MethodName: String; const AuthClass: TIdAuthenticationClass);
{$IFNDEF HAS_GENERICS_TDictionary}
var
  I: Integer;
{$ENDIF}
begin
  if not Assigned(AuthList) then begin
    {$IFDEF HAS_GENERICS_TDictionary}
    AuthList := TDictionary<String, TIdAuthenticationClass>.Create(TIStringComparer.Ordinal);
    {$ELSE}
    AuthList := TStringList.Create;
    {$ENDIF}
  end;
  {$IFDEF HAS_GENERICS_TDictionary}
  if not AuthList.ContainsKey(MethodName) then begin
    AuthList.Add(MethodName, AuthClass);
  end else begin
    //raise EIdAlreadyRegisteredAuthenticationMethod.CreateFmt(RSHTTPAuthAlreadyRegistered, [AuthClass.ClassName]);
    AuthList.Items[MethodName] := AuthClass;
  end;
  {$ELSE}
  I := AuthList.IndexOf(MethodName);
  if I < 0 then begin
    AuthList.AddObject(MethodName, TObject(AuthClass));
  end else begin
    //raise EIdAlreadyRegisteredAuthenticationMethod.CreateFmt(RSHTTPAuthAlreadyRegistered, [AuthClass.ClassName]);
    AuthList.Objects[I] := TObject(AuthClass);
  end;
  {$ENDIF}
end;

procedure UnregisterAuthenticationMethod(const MethodName: String);
{$IFNDEF HAS_GENERICS_TDictionary}
var
  I: Integer;
{$ENDIF}
begin
  if Assigned(AuthList) then begin
    {$IFDEF HAS_GENERICS_TDictionary}
    if AuthList.ContainsKey(MethodName) then begin
      AuthList.Remove(MethodName);
    end;
    {$ELSE}
    I := AuthList.IndexOf(MethodName);
    if I > 0 then begin
      AuthList.Delete(I);
    end;
    {$ENDIF}
  end;
end;

function FindAuthClass(const AuthName: String): TIdAuthenticationClass;
{$IFNDEF HAS_GENERICS_TDictionary}
var
  I: Integer;
{$ENDIF}
begin
  Result := nil;
  {$IFDEF HAS_GENERICS_TDictionary}
  if AuthList.ContainsKey(AuthName) then begin
    Result := AuthList.Items[AuthName];
  end;
  {$ELSE}
  I := AuthList.IndexOf(AuthName);
  if I > -1 then begin
    Result := TIdAuthenticationClass(AuthList.Objects[I]);
  end;
  {$ENDIF}
end;

{ TIdAuthentication }

constructor TIdAuthentication.Create;
begin
  inherited Create;
  FAuthParams := TIdHeaderList.Create(QuoteHTTP);
  FParams := TIdHeaderList.Create(QuoteHTTP);
  FCurrentStep := 0;
end;

destructor TIdAuthentication.Destroy;
begin
  FreeAndNil(FAuthParams);
  FreeAndNil(FParams);
  inherited Destroy;
end;

procedure TIdAuthentication.SetAuthParams(AValue: TIdHeaderList);
begin
  FAuthParams.Assign(AValue);
end;

function TIdAuthentication.ReadAuthInfo(AuthName: String): String;
Var
  i: Integer;
begin
  for i := 0 to FAuthParams.Count - 1 do begin
    if TextStartsWith(FAuthParams[i], AuthName) then begin
      Result := FAuthParams[i];
      Exit;
    end;
  end;
  Result := '';  {Do not Localize}
end;

function TIdAuthentication.KeepAlive: Boolean;
begin
  Result := False;
end;

function TIdAuthentication.Next: TIdAuthWhatsNext;
begin
  Result := DoNext;
end;

procedure TIdAuthentication.Reset;
begin
  FCurrentStep := 0;
end;

procedure TIdAuthentication.SetRequest(const AMethod, AUri: String);
begin
  // empty here, descendants can override as needed...
end;

function TIdAuthentication.GetPassword: String;
begin
  Result := Params.Values['Password'];    {Do not Localize}
end;

function TIdAuthentication.GetUserName: String;
begin
  Result := Params.Values['Username'];  {Do not Localize}
end;

procedure TIdAuthentication.SetPassword(const Value: String);
begin
  Params.Values['Password'] := Value;   {Do not Localize}
end;

procedure TIdAuthentication.SetUserName(const Value: String);
begin
  Params.Values['Username'] := Value;     {Do not Localize}
end;

function TIdAuthentication.GetSteps: Integer;
begin
  Result := 0;
end;

{ TIdBasicAuthentication }

function TIdBasicAuthentication.Authentication: String;
var
  LEncoder: TIdEncoderMIME;
begin
  LEncoder := TIdEncoderMIME.Create;
  try
    Result := 'Basic ' + LEncoder.Encode(Username + ':' + Password); {do not localize}
  finally
    LEncoder.Free;
  end;
end;

function TIdBasicAuthentication.DoNext: TIdAuthWhatsNext;
var
  S: String;
begin
  S := ReadAuthInfo('Basic');        {Do not Localize}
  Fetch(S);

  while Length(S) > 0 do begin
    // realm have 'realm="SomeRealmValue"' format    {Do not Localize}
    // FRealm never assigned without StringReplace
    Params.Add(ReplaceOnlyFirst(Fetch(S, ', '), '=', Params.NameValueSeparator));  {do not localize}
  end;

  FRealm := Copy(Params.Values['realm'], 2, Length(Params.Values['realm']) - 2);   {Do not Localize}

  if FCurrentStep = 0 then
  begin
    if Length(Username) > 0 then begin
      Result := wnDoRequest;
    end else begin
      Result := wnAskTheProgram;
    end;
  end else begin
    Result := wnFail;
  end;
end;

function TIdBasicAuthentication.GetSteps: Integer;
begin
  Result := 1;
end;

initialization
  RegisterAuthenticationMethod('Basic', TIdBasicAuthentication);  {Do not Localize}
finalization
  // UnregisterAuthenticationMethod('Basic') does not need to be called
  // in this case because AuthList is freed.
  FreeAndNil(AuthList);

end.

