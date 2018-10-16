{ Copyright (C) 1998-2018, written by Mike Shkolnik, Scalabium Software
  E-Mail:  mshkolnik@scalabium.com
  WEB: http://www.scalabium.com
}
unit SendMail;

interface

{$I SMVersion.inc}

uses
  Classes, Dialogs;

type
  {$IFDEF SM_ADD_ComponentPlatformsAttribute}
  [ComponentPlatformsAttribute(pidWin32 or pidWin64)]
  {$ENDIF}
  TMAPIMail = class(TComponent)
  private
    { Private declarations }
    FLastError: Integer;

    FSubject: string;
    FBody: string;

    FSenderName: string;
    FSenderAddress: string;

    FRecipients: TStrings;
    FAttachments: TStrings;
    FAttachmentNames: TStrings;

    FEditDialog: Boolean;
    FResolveNames: Boolean;
    FRequestReceipt: Boolean;

    procedure SetRecipients(Value: TStrings);
    procedure SetAttachments(Value: TStrings);
    procedure SetAttachmentNames(Value: TStrings);
  protected
    { Protected declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    function Send: Boolean;

    property LastError: Integer read FLastError;
  published
    { Published declarations }
    property Subject: string read FSubject write FSubject;
    property Body: string read FBody write FBody;

    property Recipients: TStrings read FRecipients write SetRecipients;
    property Attachments: TStrings read FAttachments write SetAttachments;
    property AttachmentNames: TStrings read FAttachmentNames write SetAttachmentNames;

    property EditDialog: Boolean read FEditDialog write FEditDialog;
    property ResolveNames: Boolean read FResolveNames write FResolveNames;
    property RequestReceipt: Boolean read FRequestReceipt write FRequestReceipt;
    
    property SenderName: string read FSenderName write FSenderName;
    property SenderAddress: string read FSenderAddress write FSenderAddress;
  end;

function SendEMailByMAPI(SenderName, SenderAddress, Subject, Body: string; Recipients, Attachments, AttachmentNames: TStrings; WithOpenMessage, ResolveNames, NeedReceipt: Boolean; intMAPISession: Integer): Integer;
function MAPIErrorDescription(intErrorCode: Integer): string;

procedure Register;

implementation
uses Windows, SysUtils, MAPI, Registry, Forms;

procedure Register;
begin
  RegisterComponents('SMComponents', [TMAPIMail]);
end;

function MAPIErrorDescription(intErrorCode: Integer): string;
begin
   case intErrorCode of
     MAPI_E_USER_ABORT: Result := 'User cancelled request';
     MAPI_E_FAILURE: Result := 'General MAPI failure';
     MAPI_E_LOGON_FAILURE: Result := 'Logon failure';
     MAPI_E_DISK_FULL: Result := 'Disk full';
     MAPI_E_INSUFFICIENT_MEMORY: Result := 'Insufficient memory'; 
     MAPI_E_ACCESS_DENIED: Result := 'Access denied'; 
     MAPI_E_TOO_MANY_SESSIONS: Result := 'Too many sessions'; 
     MAPI_E_TOO_MANY_FILES: Result := 'Too many files open'; 
     MAPI_E_TOO_MANY_RECIPIENTS: Result := 'Too many recipients'; 
     MAPI_E_ATTACHMENT_NOT_FOUND: Result := 'Attachment not found'; 
     MAPI_E_ATTACHMENT_OPEN_FAILURE: Result := 'Failed to open attachment'; 
     MAPI_E_ATTACHMENT_WRITE_FAILURE: Result := 'Failed to write attachment';
     MAPI_E_UNKNOWN_RECIPIENT: Result := 'Unknown recipient'; 
     MAPI_E_BAD_RECIPTYPE: Result := 'Invalid recipient type'; 
     MAPI_E_NO_MESSAGES: Result := 'No messages'; 
     MAPI_E_INVALID_MESSAGE: Result := 'Invalid message'; 
     MAPI_E_TEXT_TOO_LARGE: Result := 'Text too large.';
     MAPI_E_INVALID_SESSION: Result := 'Invalid session'; 
     MAPI_E_TYPE_NOT_SUPPORTED: Result := 'Type not supported'; 
     MAPI_E_AMBIGUOUS_RECIPIENT: Result := 'Ambiguous recipient'; 
     MAPI_E_MESSAGE_IN_USE: Result := 'Message in use'; 
     MAPI_E_NETWORK_FAILURE: Result := 'Network failure'; 
     MAPI_E_INVALID_EDITFIELDS: Result := 'Invalid edit fields'; 
     MAPI_E_INVALID_RECIPS: Result := 'Invalid recipients'; 
     MAPI_E_NOT_SUPPORTED: Result := 'Not supported'; 
   else
     Result := 'Unknown Error Code: ' + IntToStr(intErrorCode);
   end; 
end; 

function GetDefaultLogon(var strDefaultLogon: string): Boolean;
const
  KEYNAME1 = 'Software\Microsoft\Windows Messaging Subsystem\Profiles';
  KEYNAME2 = 'Software\Microsoft\Windows NT\CurrentVersion\Windows Messaging Subsystem\Profiles';
  VALUESTR = 'DefaultProfile';
begin
  Result := False;
  strDefaultLogon := '';
  with TRegistry.Create do
    try
      RootKey := HKEY_CURRENT_USER;

      {$IFDEF SMForDelphi5}
      if OpenKeyReadOnly(KEYNAME1) then
      {$ELSE}
      if OpenKey(KEYNAME1, False) then
      {$ENDIF}
      begin
        try
          strDefaultLogon := ReadString(VALUESTR);
          Result := True;
        except
        end;
        CloseKey;
      end
      else
      {$IFDEF SMForDelphi5}
      if OpenKeyReadOnly(KEYNAME2) then
      {$ELSE}
      if OpenKey(KEYNAME2, False) then
      {$ENDIF}
      begin
        try
          strDefaultLogon := ReadString(VALUESTR);
          Result := True;
        except
        end;
        CloseKey;
      end
      else
    finally
      Free;
    end;
end;

function SendEMailByMAPI(SenderName, SenderAddress, Subject, Body: string; Recipients, Attachments, AttachmentNames: TStrings; WithOpenMessage, ResolveNames, NeedReceipt: Boolean; intMAPISession: Integer): Integer;
const
  RECIP_MAX  = MaxInt div SizeOf(TMapiRecipDesc);
  ATTACH_MAX = MaxInt div SizeOf(TMapiFileDesc);
type
  TRecipAccessArray = array [0..(RECIP_MAX - 1)] of TMapiRecipDesc;
  TlpRecipArray     = ^TRecipAccessArray;

  TAttachAccessArray = array [0..(ATTACH_MAX - 1)] of TMapiFileDesc;
  TlpAttachArray     = ^TAttachAccessArray;

  TszRecipName   = array[0..256] of AnsiChar;
  TlpszRecipName = ^TszRecipName;

  TszPathName   = array[0..256] of AnsiChar;
  TlpszPathname = ^TszPathname;

  TszFileName   = array[0..256] of AnsiChar;
  TlpszFileName = ^TszFileName;

var
  i: Integer;

  Message: TMapiMessage;
  lpRecipArray: TlpRecipArray;
  lpAttachArray: TlpAttachArray;


  function CheckRecipient(strRecipient: string; lpRecipient: TMapiRecipDesc): Integer;
  var
    lpRecip: PMapiRecipDesc;
    Flag: dWord;
  begin
    try
{      if (Win32MajorVersion >= 6) then
        Flag := 0
      else
}        Flag := MAPI_DIALOG;

      Result := MapiResolveName(0, 0, PAnsiChar(AnsiString(strRecipient)), 0, 0, lpRecip);
      if (Result in [MAPI_E_AMBIGUOUS_RECIPIENT,
                     MAPI_E_UNKNOWN_RECIPIENT]) then
        Result := MapiResolveName(0, 0, PAnsiChar(AnsiString(strRecipient)), Flag, 0, lpRecip);
      if Result = SUCCESS_SUCCESS then
      begin
        strRecipient := StrPas(lpRecip^.lpszName);
        with lpRecipient do
        begin
(*
          {$IFDEF SMForDelphi2009}
          lpszName := PAnsiChar(AnsiString(strRecipient));
          lpszAddress := PAnsiChar(AnsiString(strRecipient));
          {$ELSE}
*)
          lpszName := StrCopy(new(TlpszRecipName)^, lpRecip^.lpszName);
          if lpRecip^.lpszAddress = nil then
            lpszAddress := StrCopy(new(TlpszRecipName)^, lpRecip^.lpszName)
          else
            lpszAddress := StrCopy(new(TlpszRecipName)^, lpRecip^.lpszAddress);
(*
          {$ENDIF}
*)
          ulEIDSize := lpRecip^.ulEIDSize;
          lpEntryID := lpRecip^.lpEntryID;
          MapiFreeBuffer(lpRecip);
        end
      end
      else
      begin
(*        {$IFDEF SMForDelphi2009}
        lpRecipient.lpszName := PAnsiChar(AnsiString(strRecipient));
        lpRecipient.lpszAddress := PAnsiChar(AnsiString(strRecipient));
        {$ELSE}
 *)
        lpRecipient.lpszName := StrCopy(new(TlpszRecipName)^, PAnsiChar(strRecipient));
        lpRecipient.lpszAddress := StrCopy(new(TlpszRecipName)^, PAnsiChar(strRecipient));
 (*
        {$ENDIF}
*)
//        lpRecipient.ulRecipClass := MAPI_TO;
        lpRecipient.ulReserved := 0;
        lpRecipient.ulEIDSize := 0;
        lpRecipient.lpEntryID := nil;
      end;
    finally
    end;
  end;

  procedure FillRecipient(s: AnsiString; var lpRecipient: TMapiRecipDesc);
  begin
    if (UpperCase(Copy(s, 1, 3)) = 'CC:') then
    begin
      lpRecipient.ulRecipClass := MAPI_CC;
      Delete(s, 1, 3);
    end
    else
    if (UpperCase(Copy(s, 1, 4)) = 'BCC:') then
    begin
      lpRecipient.ulRecipClass := MAPI_BCC;
      Delete(s, 1, 4);
    end
    else
      lpRecipient.ulRecipClass := MAPI_TO;

    if {(Win32MajorVersion < 6) and }ResolveNames then
      CheckRecipient(s, lpRecipient)
    else
    begin
(*
      {$IFDEF SMForDelphi2009}
      lpRecipient.lpszName := PAnsiChar(AnsiString(s));
      lpRecipient.lpszAddress := PAnsiChar(AnsiString(s));
      {$ELSE}
*)
      lpRecipient.lpszName := StrCopy(new(TlpszRecipName)^, PAnsiChar(s));
      lpRecipient.lpszAddress := StrCopy(new(TlpszRecipName)^, PAnsiChar(s));
(*
      {$ENDIF}
*)
    end;
  end;

  function SendMess: Integer;
  const
    arrMAPIFlag: array[Boolean] of Word = (0, MAPI_DIALOG);
    arrReceipt: array[Boolean] of Word = (0, MAPI_RECEIPT_REQUESTED);
    arrLogon: array[Boolean] of Word = (0, MAPI_LOGON_UI or MAPI_NEW_SESSION);
  var
    Flag: dWord;

    SM: TFNMapiSendMail;
    MAPIModule: HModule;
  begin
    MAPIModule := LoadLibrary(PChar(MAPIDLL));
    if MAPIModule = 0 then
      Result := -1
    else
    begin
      try
        @SM := GetProcAddress(MAPIModule, 'MAPISendMail');
        if @SM <> nil then
        begin
{          if (Win32MajorVersion >= 6) then
            Flag := 0
          else
}
            Flag := arrReceipt[NeedReceipt] or
                      arrMAPIFlag[WithOpenMessage] or
                      MAPI_LOGON_UI {or MAPI_NEW_SESSION} or
                      arrLogon[{True}intMAPISession = 0];

          Result := SM(0, Application.Handle, Message, Flag, 0);
        end
        else
          Result := 1;
      finally
        FreeLibrary(MAPIModule);
      end;
    end;
  end;

var
  lpSender: TMapiRecipDesc;
  strDefaultProfile: string;
begin
  lpAttachArray := nil;
  Result := 0;

  intMAPISession := 0;
  strDefaultProfile := '';
  if //(Win32MajorVersion < 6) and
     GetDefaultLogon(strDefaultProfile) then
  begin
    try
      { try to logon with default profile }
      Result := MapiLogOn(0, PAnsiChar(AnsiString(strDefaultProfile)), nil, MAPI_LOGON_UI or MAPI_NEW_SESSION, 0, @intMAPISession);
    finally
      if (Result <> SUCCESS_SUCCESS) then
      begin
        intMAPISession := 0;

//        raise Exception.CreateFmt('MAPI Error %d: %s', [Result, MAPIErrorDescription(Result)]);
      end;
    end
  end;

  FillChar(Message, SizeOf(Message), 0);
  with Message do
  begin
    if (SenderAddress <> '') then
    begin
      lpSender.ulRecipClass := MAPI_ORIG;
      if (SenderName <> '') then
        lpSender.lpszName := PAnsiChar(AnsiString(SenderAddress))
      else
        lpSender.lpszName := PAnsiChar(AnsiString(SenderName));
      lpSender.lpszAddress := PAnsiChar(AnsiString(SenderAddress));
      lpSender.ulReserved := 0;
      lpSender.ulEIDSize := 0;
      lpSender.lpEntryID := nil;
      lpOriginator := @lpSender;
    end;

    if (Subject <> '') then
      lpszSubject := PAnsiChar(AnsiString(Subject));
    if (Body <> '') then
      lpszNoteText := PAnsiChar(AnsiString(Body));

    if Assigned(Attachments) and (Attachments.Count > 0) then
    begin
      nFileCount := Attachments.Count;

      lpAttachArray := TlpAttachArray(StrAlloc(nFileCount*SizeOf(TMapiFileDesc)));
      FillChar(lpAttachArray^, StrBufSize(PAnsiChar(lpAttachArray)), 0);
      for i := 0 to nFileCount-1 do
      begin
        lpAttachArray^[i].nPosition := Cardinal(-1); //Cardinal($FFFFFFFF); //ULONG(-1);
(*
        {$IFDEF SMForDelphi2009}
        lpAttachArray^[i].lpszPathName := PAnsiChar(AnsiString(Attachments[i]));
        if i < AttachmentNames.Count then
          lpAttachArray^[i].lpszFileName := PAnsiChar(AnsiString(AttachmentNames[i]))
        else
          lpAttachArray^[i].lpszFileName := PAnsiChar(AnsiString(ExtractFileName(Attachments[i])));
        {$ELSE}
*)
        lpAttachArray^[i].lpszPathName := StrPCopy(new(TlpszPathname)^, Attachments[i]);
        if i < AttachmentNames.Count then
          lpAttachArray^[i].lpszFileName := StrPCopy(new(TlpszFileName)^, AttachmentNames[i])
        else
          lpAttachArray^[i].lpszFileName := StrPCopy(new(TlpszFileName)^, ExtractFileName(Attachments[i]));
(*
        {$ENDIF}
*)
      end;
      lpFiles := @lpAttachArray^
    end
    else
      nFileCount := 0;
  end;


  if Assigned(Recipients) and (Recipients.Count > 0) then
  begin
    lpRecipArray := TlpRecipArray(StrAlloc(Recipients.Count*SizeOf(TMapiRecipDesc)));
    FillChar(lpRecipArray^, StrBufSize(PAnsiChar(lpRecipArray)), 0);
    for i := 0 to Recipients.Count-1 do
      FillRecipient(Recipients[i], lpRecipArray^[i]);
    Message.lpRecips := @lpRecipArray^;
    Message.nRecipCount := Recipients.Count;
  end
  else
    Message.nRecipCount := 0;

  Result := SendMess;

  if Assigned(Attachments) and (Message.nFileCount > 0) then
  begin
(*
    {$IFNDEF SMForDelphi2009}
*)
    for i := 0 to Message.nFileCount-1 do
    begin
      Dispose(lpAttachArray^[i].lpszPathname);
      Dispose(lpAttachArray^[i].lpszFileName);
    end;
(*
    {$ENDIF}
*)
    StrDispose(PChar(lpAttachArray));
  end;

  if Assigned(Recipients) and (Recipients.Count > 0) then
  begin
(*    {$IFNDEF SMForDelphi2009}
*)
    for i := 0 to Message.nRecipCount-1 do
    begin
      if Assigned(lpRecipArray^[i].lpszName) then
        Dispose(lpRecipArray^[i].lpszName);

      if Assigned(lpRecipArray^[i].lpszAddress) then
        Dispose(lpRecipArray^[i].lpszAddress);
    end;
(*    {$ENDIF}
*)
    StrDispose(PChar(lpRecipArray));
  end;

  if intMAPISession <> 0 then
    try
      MapiLogOff(intMAPISession, 0, 0, 0);
    except
    end;
end;


{ TMAPIMail }
constructor TMAPIMail.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  EditDialog := True;
  FRecipients := TStringList.Create;
  FAttachments := TStringList.Create;
  FAttachmentNames := TStringList.Create;
end;

destructor TMAPIMail.Destroy;
begin
  FRecipients.Free;
  Attachments.Free;
  AttachmentNames.Free;

  inherited Destroy;
end;

procedure TMAPIMail.SetRecipients(Value: TStrings);
begin
  FRecipients.Assign(Value)
end;

procedure TMAPIMail.SetAttachments(Value: TStrings);
begin
  Attachments.Assign(Value)
end;

procedure TMAPIMail.SetAttachmentNames(Value: TStrings);
begin
  AttachmentNames.Assign(Value)
end;

function TMAPIMail.Send: Boolean;
begin
  FLastError := SendEMailByMAPI(SenderName, SenderAddress, Subject, Body, Recipients, Attachments, AttachmentNames, EditDialog, ResolveNames, RequestReceipt, 0);

  Result := (LastError = SUCCESS_SUCCESS);
end;

end.
