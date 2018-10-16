{ Copyright (C) 1999, written by Shkolnik Mike
  FIDOnet: 2:463/106.14
  E-Mail:  mike@woccu.freenet.kiev.ua
           mshkolnik@rs-ukraine.kiev.ua
  WEB: http://www.geocities.com/SiliconValley/Grid/3989
  tel: 380-/44/-552-10-29

  This component allow output a glyph on pages
  in TabControl component (Like component in D4).
}
unit SMTabCnt;
interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls;

type
  TSMCustomTabControl = class;

  TTabChangingEvent = procedure(Sender: TObject;
    var AllowChange: Boolean) of object;

  TSMTabPosition = (tpTop, tpBottom, tpLeft, tpRight);

  TSMTabStyle = (tsTabs, tsButtons, tsFlatButtons);

  TDrawTabEvent = procedure(Control: TSMCustomTabControl; TabIndex: Integer;
    const Rect: TRect; Active: Boolean) of object;
  TTabGetImageEvent = procedure(Sender: TObject; TabIndex: Integer;
    var ImageIndex: Integer) of object;

  TSMCustomTabControl = class(TWinControl)
  private
    FCanvas: TCanvas;
    FHotTrack: Boolean;
    FImageChangeLink: TChangeLink;
    FImages: TCustomImageList;
    FMultiLine: Boolean;
    FMultiSelect: Boolean;
    FOwnerDraw: Boolean;
    FRaggedRight: Boolean;
    FSaveTabIndex: Integer;
    FSaveTabs: TStringList;
    FScrollOpposite: Boolean;
    FStyle: TSMTabStyle;
    FTabPosition: TSMTabPosition;
    FTabs: TStrings;
    FTabSize: TSmallPoint;
    FUpdating: Boolean;
    FOnChange: TNotifyEvent;
    FOnChanging: TTabChangingEvent;
    FOnDrawTab: TDrawTabEvent;
    FOnGetImageIndex: TTabGetImageEvent;
    function GetDisplayRect: TRect;
    function GetTabIndex: Integer;
    procedure ImageListChange(Sender: TObject);
    function InternalSetMultiLine(Value: Boolean): Boolean;
    procedure SetHotTrack(Value: Boolean);
    procedure SetImages(Value: TCustomImageList);
    procedure SetMultiLine(Value: Boolean);
    procedure SetMultiSelect(Value: Boolean);
    procedure SetOwnerDraw(Value: Boolean);
    procedure SetRaggedRight(Value: Boolean);
    procedure SetScrollOpposite(Value: Boolean);
    procedure SetStyle(Value: TSMTabStyle);
    procedure SetTabHeight(Value: Smallint);
    procedure SetTabIndex(Value: Integer);
    procedure SetTabPosition(Value: TSMTabPosition);
    procedure SetTabs(Value: TStrings);
    procedure SetTabWidth(Value: Smallint);
    procedure TabsChanged;
    procedure UpdateTabSize;
    procedure CMFontChanged(var Message); message CM_FONTCHANGED;
    procedure CMSysColorChange(var Message: TMessage); message CM_SYSCOLORCHANGE;
    procedure CMTabStopChanged(var Message: TMessage); message CM_TABSTOPCHANGED;
    procedure CNNotify(var Message: TWMNotify); message CN_NOTIFY;
    procedure CMDialogChar(var Message: TCMDialogChar); message CM_DIALOGCHAR;
    procedure CNDrawItem(var Message: TWMDrawItem); message CN_DRAWITEM;
    procedure WMDestroy(var Message: TWMDestroy); message WM_DESTROY;
    procedure WMNotifyFormat(var Message: TMessage); message WM_NOTIFYFORMAT;
    procedure WMSize(var Message: TMessage); message WM_SIZE;
  protected
    procedure AdjustClientRect(var Rect: TRect); virtual;
    function CanChange: Boolean; dynamic;
    function CanShowTab(TabIndex: Integer): Boolean; virtual;
    procedure Change; dynamic;
    procedure CreateParams(var Params: TCreateParams); override;
    procedure CreateWnd; override;
    procedure DestroyWnd; override;
    procedure DrawTab(TabIndex: Integer; const Rect: TRect; Active: Boolean); virtual;
    function GetImageIndex(TabIndex: Integer): Integer; virtual;
    procedure Loaded; override;
    procedure UpdateTabImages;
    property DisplayRect: TRect read GetDisplayRect;
    property HotTrack: Boolean read FHotTrack write SetHotTrack default False;
    property Images: TCustomImageList read FImages write SetImages;
    property MultiLine: Boolean read FMultiLine write SetMultiLine default False;
    property MultiSelect: Boolean read FMultiSelect write SetMultiSelect default False;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    property OwnerDraw: Boolean read FOwnerDraw write SetOwnerDraw default False;
    property RaggedRight: Boolean read FRaggedRight write SetRaggedRight default False;
    property ScrollOpposite: Boolean read FScrollOpposite
      write SetScrollOpposite default False;
    property Style: TSMTabStyle read FStyle write SetStyle default tsTabs;
    property TabHeight: Smallint read FTabSize.Y write SetTabHeight default 0;
    property TabIndex: Integer read GetTabIndex write SetTabIndex default -1;
    property TabPosition: TSMTabPosition read FTabPosition write SetTabPosition
      default tpTop;
    property Tabs: TStrings read FTabs write SetTabs;
    property TabWidth: Smallint read FTabSize.X write SetTabWidth default 0;
    property OnChange: TNotifyEvent read FOnChange write FOnChange;
    property OnChanging: TTabChangingEvent read FOnChanging write FOnChanging;
    property OnDrawTab: TDrawTabEvent read FOnDrawTab write FOnDrawTab;
    property OnGetImageIndex: TTabGetImageEvent read FOnGetImageIndex write FOnGetImageIndex;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property Canvas: TCanvas read FCanvas;
    property TabStop default True;
  end;

  TSMTabControl = class(TSMCustomTabControl)
  public
    property DisplayRect;
  published
    property Align;
    property DragCursor;
    property DragMode;
    property Enabled;
    property Font;
    property HotTrack;
    property Images;
    property MultiLine;
    property MultiSelect;
    property OwnerDraw;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property RaggedRight;
    property ScrollOpposite;
    property ShowHint;
    property Style;
    property TabHeight;
    property TabOrder;
    property TabPosition;
    property Tabs;
    property TabIndex;  // must be after Tabs
    property TabStop;
    property TabWidth;
    property Visible;
    property OnChange;
    property OnChanging;
    property OnDragDrop;
    property OnDragOver;
    property OnDrawTab;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnGetImageIndex;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnStartDrag;
  end;

  TSMPageControl = class;

  TSMTabSheet = class(TWinControl)
  private
    FImageIndex: Integer;
    FPageControl: TSMPageControl;
    FTabVisible: Boolean;
    FTabShowing: Boolean;
    FOnHide: TNotifyEvent;
    FOnShow: TNotifyEvent;
    function GetPageIndex: Integer;
    function GetTabIndex: Integer;
    procedure SetImageIndex(Value: Integer);
    procedure SetPageControl(APageControl: TSMPageControl);
    procedure SetPageIndex(Value: Integer);
    procedure SetTabShowing(Value: Boolean);
    procedure SetTabVisible(Value: Boolean);
    procedure UpdateTabShowing;
    procedure CMTextChanged(var Message: TMessage); message CM_TEXTCHANGED;
    procedure CMShowingChanged(var Message: TMessage); message CM_SHOWINGCHANGED;
  protected
    procedure CreateParams(var Params: TCreateParams); override;
    procedure DoHide; dynamic;
    procedure DoShow; dynamic;
    procedure ReadState(Reader: TReader); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property PageControl: TSMPageControl read FPageControl write SetPageControl;
    property TabIndex: Integer read GetTabIndex;
  published
//    property BorderWidth;
    property Caption;
    property DragMode;
    property Enabled;
    property Font;
    property Height stored False;
    property ImageIndex: Integer read FImageIndex write SetImageIndex default 0;
    property Left stored False;
    property PageIndex: Integer read GetPageIndex write SetPageIndex stored False;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property ShowHint;
    property TabVisible: Boolean read FTabVisible write SetTabVisible default True;
    property Top stored False;
    property Visible stored False;
    property Width stored False;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnHide: TNotifyEvent read FOnHide write FOnHide;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnShow: TNotifyEvent read FOnShow write FOnShow;
    property OnStartDrag;
  end;

  TSMPageControl = class(TSMCustomTabControl)
  private
    FPages: TList;
    FActivePage: TSMTabSheet;
    procedure ChangeActivePage(Page: TSMTabSheet);
    procedure DeleteTab(Page: TSMTabSheet; Index: Integer);
    function GetPage(Index: Integer): TSMTabSheet;
    function GetPageCount: Integer;
    procedure InsertPage(Page: TSMTabSheet);
    procedure InsertTab(Page: TSMTabSheet);
    procedure MoveTab(CurIndex, NewIndex: Integer);
    procedure RemovePage(Page: TSMTabSheet);
    procedure SetActivePage(Page: TSMTabSheet);
    procedure UpdateTab(Page: TSMTabSheet);
    procedure UpdateActivePage;
    procedure CMDesignHitTest(var Message: TCMDesignHitTest); message CM_DESIGNHITTEST;
    procedure CMDialogKey(var Message: TCMDialogKey); message CM_DIALOGKEY;
  protected
    function CanShowTab(TabIndex: Integer): Boolean; override;
    procedure Change; override;
    procedure GetChildren(Proc: TGetChildProc; Root: TComponent); override;
    function GetImageIndex(TabIndex: Integer): Integer; override;
    procedure SetChildOrder(Child: TComponent; Order: Integer); override;
    procedure ShowControl(AControl: TControl); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function FindNextPage(CurPage: TSMTabSheet;
      GoForward, CheckTabVisible: Boolean): TSMTabSheet;
    procedure SelectNextPage(GoForward: Boolean);
    property PageCount: Integer read GetPageCount;
    property Pages[Index: Integer]: TSMTabSheet read GetPage;
  published
    property ActivePage: TSMTabSheet read FActivePage write SetActivePage;
    property Align;
    property DragCursor;
    property DragMode;
    property Enabled;
    property Font;
    property HotTrack;
    property Images;
    property MultiLine;
    property OwnerDraw;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property RaggedRight;
    property ScrollOpposite;
    property ShowHint;
    property Style;
    property TabHeight;
    property TabOrder;
    property TabPosition;
    property TabStop;
    property TabWidth;
    property Visible;
    property OnChange;
    property OnChanging;
    property OnDragDrop;
    property OnDragOver;
    property OnDrawTab;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnGetImageIndex;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnStartDrag;
  end;

procedure Register;

function InitCommonControl(CC: Integer): Boolean;
procedure CheckCommonControl(CC: Integer);

implementation
uses commctrl, consts;

procedure Register;
begin
  RegisterComponents('SMComponents', [TSMTabControl, TSMPageControl]);
end;

const
  SInvalidComCtl32 = 'SInvalidComCtl32';
  sTabFailClear = 'sTabFailClear';
  sTabFailDelete = 'sTabFailDelete';
  sTabFailRetrieve = 'sTabFailRetrieve';
  sTabFailGetObject = 'sTabFailGetObject';
  sTabFailSet = 'sTabFailSet';
  sTabFailSetObject = 'sTabFailSetObject';
  sTabMustBeMultiLine = 'sTabMustBeMultiLine';
  sInvalidTabStyle = 'SInvalidTabStyle';
  SInvalidTabPosition = 'SInvalidTabPosition';
  SPageIndexError = 'SPageIndexError';

const
  ShellDllName = 'shell32.dll';
  ComCtlDllName = 'comctl32.dll';

var
  ShellModule: THandle;
  ComCtlVersion: Integer;

function InitCommonControl(CC: Integer): Boolean;
var
  ICC: TInitCommonControlsEx;
begin
  ICC.dwSize := SizeOf(TInitCommonControlsEx);
  ICC.dwICC := CC;
  Result := InitCommonControlsEx(ICC);
  if not Result then InitCommonControls;
end;

procedure CheckCommonControl(CC: Integer);
begin
  if not InitCommonControl(CC) then
    raise EComponentError.Create(SInvalidComCtl32);
end;

function GetShellModule: THandle;
var
  OldError: Longint;
begin
  if ShellModule = 0 then
  begin
    OldError := SetErrorMode(SEM_NOOPENFILEERRORBOX);
    ShellModule := GetModuleHandle(ShellDllName);
    if ShellModule < HINSTANCE_ERROR then
      ShellModule := LoadLibrary(ShellDllName);
    if (ShellModule > 0) and (ShellModule < HINSTANCE_ERROR) then
      ShellModule := 0;
    SetErrorMode(OldError);
  end;
  Result := ShellModule;
end;

function GetComCtlVersion: Integer;
var
  FileName: string;
  InfoSize, Wnd: DWORD;
  VerBuf: Pointer;
  FI: PVSFixedFileInfo;
  VerSize: DWORD;
begin
  if ComCtlVersion = 0 then
  begin
    FileName := ComCtlDllName;
    InfoSize := GetFileVersionInfoSize(PChar(FileName), Wnd);
    if InfoSize <> 0 then
    begin
      GetMem(VerBuf, InfoSize);
      try
        if GetFileVersionInfo(PChar(FileName), Wnd, InfoSize, VerBuf) then
          if VerQueryValue(VerBuf, '\', Pointer(FI), VerSize) then
            ComCtlVersion := FI.dwFileVersionMS;
      finally
        FreeMem(VerBuf);
      end;
    end;
  end;
  Result := ComCtlVersion;
end;

procedure SetComCtlStyle(Ctl: TWinControl; Value: Integer; UseStyle: Boolean);
var
  Style: Integer;
begin
  if Ctl.HandleAllocated then
  begin
    Style := GetWindowLong(Ctl.Handle, GWL_STYLE);
    if not UseStyle then Style := Style and not Value
    else Style := Style or Value;
    SetWindowLong(Ctl.Handle, GWL_STYLE, Style);
  end;
end;

{ TTabStrings }

type
  TTabStrings = class(TStrings)
  private
    FTabControl: TSMCustomTabControl;
  protected
    function Get(Index: Integer): string; override;
    function GetCount: Integer; override;
    function GetObject(Index: Integer): TObject; override;
    procedure Put(Index: Integer; const S: string); override;
    procedure PutObject(Index: Integer; AObject: TObject); override;
    procedure SetUpdateState(Updating: Boolean); override;
  public
    procedure Clear; override;
    procedure Delete(Index: Integer); override;
    procedure Insert(Index: Integer; const S: string); override;
  end;

procedure TabControlError(const S: string);
begin
  raise EListError.Create(S);
end;

procedure TTabStrings.Clear;
begin
  if SendMessage(FTabControl.Handle, TCM_DELETEALLITEMS, 0, 0) = 0 then
    TabControlError(sTabFailClear);
  FTabControl.TabsChanged;
end;

procedure TTabStrings.Delete(Index: Integer);
begin
  if SendMessage(FTabControl.Handle, TCM_DELETEITEM, Index, 0) = 0 then
    TabControlError(Format(sTabFailDelete, [Index]));
  FTabControl.TabsChanged;
end;

function TTabStrings.Get(Index: Integer): string;
const
  RTL: array[Boolean] of LongInt = (0, TCIF_RTLREADING); 
var
  TCItem: TTCItem;
  Buffer: array[0..4095] of Char;
begin
  TCItem.mask := TCIF_TEXT; // or RTL[FTabControl.UseRightToLeftReading];
  TCItem.pszText := Buffer;
  TCItem.cchTextMax := SizeOf(Buffer);
  if SendMessage(FTabControl.Handle, TCM_GETITEM, Index,
    Longint(@TCItem)) = 0 then
    TabControlError(Format(sTabFailRetrieve, [Index]));
  Result := Buffer;
end;

function TTabStrings.GetCount: Integer;
begin
  Result := SendMessage(FTabControl.Handle, TCM_GETITEMCOUNT, 0, 0);
end;

function TTabStrings.GetObject(Index: Integer): TObject;
var
  TCItem: TTCItem;
begin
  TCItem.mask := TCIF_PARAM;
  if SendMessage(FTabControl.Handle, TCM_GETITEM, Index,
    Longint(@TCItem)) = 0 then
    TabControlError(Format(sTabFailGetObject, [Index]));
  Result := TObject(TCItem.lParam);
end;

procedure TTabStrings.Put(Index: Integer; const S: string);
const
  RTL: array[Boolean] of LongInt = (0, TCIF_RTLREADING);
var
  TCItem: TTCItem;
begin
  TCItem.mask := TCIF_TEXT or //RTL[FTabControl.UseRightToLeftReading] or
    TCIF_IMAGE;
  TCItem.pszText := PChar(S);
  TCItem.iImage := FTabControl.GetImageIndex(Index);
  if SendMessage(FTabControl.Handle, TCM_SETITEM, Index,
    Longint(@TCItem)) = 0 then
    TabControlError(Format(sTabFailSet, [S, Index]));
  FTabControl.TabsChanged;
end;

procedure TTabStrings.PutObject(Index: Integer; AObject: TObject);
var
  TCItem: TTCItem;
begin
  TCItem.mask := TCIF_PARAM;
  TCItem.lParam := Longint(AObject);
  if SendMessage(FTabControl.Handle, TCM_SETITEM, Index,
    Longint(@TCItem)) = 0 then
    TabControlError(Format(sTabFailSetObject, [Index]));
end;

procedure TTabStrings.Insert(Index: Integer; const S: string);
const
  RTL: array[Boolean] of LongInt = (0, TCIF_RTLREADING);
var
  TCItem: TTCItem;
begin
  TCItem.mask := TCIF_TEXT or //RTL[FTabControl.UseRightToLeftReading] or
    TCIF_IMAGE;
  TCItem.pszText := PChar(S);
  TCItem.iImage := FTabControl.GetImageIndex(Index);
  if SendMessage(FTabControl.Handle, TCM_INSERTITEM, Index,
    Longint(@TCItem)) < 0 then
    TabControlError(Format(sTabFailSet, [S, Index]));
  FTabControl.TabsChanged;
end;

procedure TTabStrings.SetUpdateState(Updating: Boolean);
begin
  FTabControl.FUpdating := Updating;
  SendMessage(FTabControl.Handle, WM_SETREDRAW, Ord(not Updating), 0);
  if not Updating then
  begin
    FTabControl.Invalidate;
    FTabControl.TabsChanged;
  end;
end;


{ TCustomTabControl }

constructor TSMCustomTabControl.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Width := 289;
  Height := 193;
  TabStop := True;
  ControlStyle := [csAcceptsControls, csDoubleClicks];
  FTabs := TTabStrings.Create;
  TTabStrings(FTabs).FTabControl := Self;
  FCanvas := TControlCanvas.Create;
  TControlCanvas(FCanvas).Control := Self;
  FImageChangeLink := TChangeLink.Create;
  FImageChangeLink.OnChange := ImageListChange;
end;

destructor TSMCustomTabControl.Destroy;
begin
  FCanvas.Free;
  FTabs.Free;
  FSaveTabs.Free;
  FImageChangeLink.Free;
  inherited Destroy;
end;

function TSMCustomTabControl.CanChange: Boolean;
begin
  Result := True;
  if Assigned(FOnChanging) then FOnChanging(Self, Result);
end;

function TSMCustomTabControl.CanShowTab(TabIndex: Integer): Boolean;
begin
  Result := True;
end;

procedure TSMCustomTabControl.Change;
begin
  if Assigned(FOnChange) then FOnChange(Self);
end;

procedure TSMCustomTabControl.CreateParams(var Params: TCreateParams);
const
  AlignStyles: array[Boolean, TSMTabPosition] of DWORD =
    ((0, TCS_BOTTOM, TCS_VERTICAL, TCS_VERTICAL or TCS_RIGHT),
     (0, TCS_BOTTOM, TCS_VERTICAL or TCS_RIGHT, TCS_VERTICAL));
  TabStyles: array[TSMTabStyle] of DWORD = (TCS_TABS, TCS_BUTTONS,
    TCS_BUTTONS {or TCS_FLATBUTTONS});
   RRStyles: array[Boolean] of DWORD = (0, TCS_RAGGEDRIGHT);
begin
  InitCommonControl(ICC_TAB_CLASSES);
  inherited CreateParams(Params);
  CreateSubClass(Params, WC_TABCONTROL);
  with Params do
  begin
    Style := Style or WS_CLIPCHILDREN or
      AlignStyles[False{UseRightToLeftAlignment}, FTabPosition] or
      TabStyles[FStyle] or RRStyles[FRaggedRight];
    if not TabStop then Style := Style or TCS_FOCUSNEVER;
    if FMultiLine then Style := Style or TCS_MULTILINE;
//    if FMultiSelect then Style := Style or TCS_MULTISELECT;
    if FOwnerDraw then Style := Style or TCS_OWNERDRAWFIXED;
    if FTabSize.X <> 0 then Style := Style or TCS_FIXEDWIDTH;
    if FHotTrack and (not (csDesigning in ComponentState)) then
      Style := Style or TCS_HOTTRACK;
    if FScrollOpposite then Style := Style or TCS_SCROLLOPPOSITE;
    WindowClass.style := WindowClass.style and not (CS_HREDRAW or CS_VREDRAW) or
      CS_DBLCLKS;
  end;
end;

procedure TSMCustomTabControl.CreateWnd;
begin
  inherited CreateWnd;
  if (Images <> nil) and Images.HandleAllocated then
    Perform(TCM_SETIMAGELIST, 0, Images.Handle);
  if Integer(FTabSize) <> 0 then UpdateTabSize;
  if FSaveTabs <> nil then
  begin
    FTabs.Assign(FSaveTabs);
    SetTabIndex(FSaveTabIndex);
    FSaveTabs.Free;
    FSaveTabs := nil;
  end;
end;

procedure TSMCustomTabControl.DestroyWnd;
begin
  if FTabs.Count > 0 then
  begin
    FSaveTabs := TStringList.Create;
    FSaveTabs.Assign(FTabs);
    FSaveTabIndex := GetTabIndex;
  end;
  inherited DestroyWnd;
end;

procedure TSMCustomTabControl.DrawTab(TabIndex: Integer; const Rect: TRect;
  Active: Boolean);
begin
  if Assigned(FOnDrawTab) then
    FOnDrawTab(Self, TabIndex, Rect, Active) else
    FCanvas.FillRect(Rect);
end;

function TSMCustomTabControl.GetDisplayRect: TRect;
begin
  Result := ClientRect;
  SendMessage(Handle, TCM_ADJUSTRECT, 0, Integer(@Result));
  Inc(Result.Top, 2);
end;

function TSMCustomTabControl.GetImageIndex(TabIndex: Integer): Integer;
begin
  Result := TabIndex;
  if Assigned(FOnGetImageIndex) then FOnGetImageIndex(Self, TabIndex, Result);
end;

function TSMCustomTabControl.GetTabIndex: Integer;
begin
  Result := SendMessage(Handle, TCM_GETCURSEL, 0, 0);
end;

procedure TSMCustomTabControl.Loaded;
begin
  inherited Loaded;
  if Images <> nil then UpdateTabImages;
end;

procedure TSMCustomTabControl.SetHotTrack(Value: Boolean);
begin
  if FHotTrack <> Value then
  begin
    FHotTrack := Value;
    RecreateWnd;
  end;
end;

procedure TSMCustomTabControl.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (Operation = opRemove) and (AComponent = Images) then
    Images := nil;
end;

procedure TSMCustomTabControl.SetImages(Value: TCustomImageList);
begin
  if Images <> nil then
    Images.UnRegisterChanges(FImageChangeLink);
  FImages := Value;
  if Images <> nil then
  begin
    Images.RegisterChanges(FImageChangeLink);
    Images.FreeNotification(Self);
    Perform(TCM_SETIMAGELIST, 0, Images.Handle);
  end
  else Perform(TCM_SETIMAGELIST, 0, 0);
end;

procedure TSMCustomTabControl.ImageListChange(Sender: TObject);
begin
  Perform(TCM_SETIMAGELIST, 0, TCustomImageList(Sender).Handle);
end;

function TSMCustomTabControl.InternalSetMultiLine(Value: Boolean): Boolean;
begin
  Result := FMultiLine <> Value;
  if Result then
  begin
    if not Value and ((TabPosition = tpLeft) or (TabPosition = tpRight)) then
      TabControlError(sTabMustBeMultiLine);
    FMultiLine := Value;
    if not Value then FScrollOpposite := False;
  end;
end;

procedure TSMCustomTabControl.SetMultiLine(Value: Boolean);
begin
  if InternalSetMultiLine(Value) then RecreateWnd;
end;

procedure TSMCustomTabControl.SetMultiSelect(Value: Boolean);
begin
  if FMultiSelect <> Value then
  begin
    FMultiSelect := Value;
    RecreateWnd;
  end;
end;

procedure TSMCustomTabControl.SetOwnerDraw(Value: Boolean);
begin
  if FOwnerDraw <> Value then
  begin
    FOwnerDraw := Value;
    RecreateWnd;
  end;
end;

procedure TSMCustomTabControl.SetRaggedRight(Value: Boolean);
begin
  if FRaggedRight <> Value then
  begin
    FRaggedRight := Value;
    SetComCtlStyle(Self, TCS_RAGGEDRIGHT, Value);
  end;
end;

procedure TSMCustomTabControl.SetScrollOpposite(Value: Boolean);
begin
  if FScrollOpposite <> Value then
  begin
    FScrollOpposite := Value;
    if Value then FMultiLine := Value;
    RecreateWnd;
  end;
end;

procedure TSMCustomTabControl.SetStyle(Value: TSMTabStyle);
begin
  if FStyle <> Value then
  begin
    if (Value <> tsTabs) and (TabPosition <> tpTop) then
      raise EInvalidOperation.Create(SInvalidTabStyle);
    FStyle := Value;
    RecreateWnd;
  end;
end;

procedure TSMCustomTabControl.SetTabHeight(Value: Smallint);
begin
  if FTabSize.Y <> Value then
  begin
    if Value < 0 then
      raise EInvalidOperation.CreateFmt(SPropertyOutOfRange, [Self.Classname]);
    FTabSize.Y := Value;
    UpdateTabSize;
  end;
end;

procedure TSMCustomTabControl.SetTabIndex(Value: Integer);
begin
  SendMessage(Handle, TCM_SETCURSEL, Value, 0);
end;

procedure TSMCustomTabControl.SetTabPosition(Value: TSMTabPosition);
const
  AlignStyles: array[TSMTabPosition] of Integer =
    (0, TCS_BOTTOM, TCS_VERTICAL, TCS_VERTICAL or TCS_RIGHT);
begin
  if FTabPosition <> Value then
  begin
    if (Value <> tpTop) and (Style <> tsTabs) then
      raise EInvalidOperation.Create(SInvalidTabPosition);
    FTabPosition := Value;
    if not MultiLine and ((Value = tpLeft) or (Value = tpRight)) then
      InternalSetMultiLine(True);
    RecreateWnd;
  end;
end;

procedure TSMCustomTabControl.SetTabs(Value: TStrings);
begin
  FTabs.Assign(Value);
end;

procedure TSMCustomTabControl.SetTabWidth(Value: Smallint);
var
  OldValue: Smallint;
begin
  if FTabSize.X <> Value then
  begin
    if Value < 0 then
      raise EInvalidOperation.CreateFmt(SPropertyOutOfRange, [Self.Classname]);
    OldValue := FTabSize.X;
    FTabSize.X := Value;
    if (OldValue = 0) or (Value = 0) then RecreateWnd
    else UpdateTabSize;
  end;
end;

procedure TSMCustomTabControl.TabsChanged;
begin
  if not FUpdating then
  begin
    if HandleAllocated then
      SendMessage(Handle, WM_SIZE, SIZE_RESTORED,
        Word(Width) or Word(Height) shl 16);
    Realign;
  end;
end;

procedure TSMCustomTabControl.UpdateTabSize;
begin
  SendMessage(Handle, TCM_SETITEMSIZE, 0, Integer(FTabSize));
  TabsChanged;
end;

procedure TSMCustomTabControl.UpdateTabImages;
var
  I: Integer;
  TCItem: TTCItem;
begin
  TCItem.mask := TCIF_IMAGE;
  for I := 0 to FTabs.Count - 1 do
  begin
    TCItem.iImage := GetImageIndex(I);
    if SendMessage(Handle, TCM_SETITEM, I,
      Longint(@TCItem)) = 0 then
      TabControlError(Format(sTabFailSet, [FTabs[I], I]));
  end;
  TabsChanged;
end;

procedure TSMCustomTabControl.CNDrawItem(var Message: TWMDrawItem);
var
  SaveIndex: Integer;
begin
  with Message.DrawItemStruct^ do
  begin
    SaveIndex := SaveDC(hDC);
    FCanvas.Handle := hDC;
    FCanvas.Font := Font;
    FCanvas.Brush := Brush;
    DrawTab(itemID, rcItem, itemState and ODS_SELECTED <> 0);
    FCanvas.Handle := 0;
    RestoreDC(hDC, SaveIndex);
  end;
  Message.Result := 1;
end;

procedure TSMCustomTabControl.WMDestroy(var Message: TWMDestroy);
var
  FocusHandle: HWnd;
begin
  FocusHandle := GetFocus;
  if (FocusHandle <> 0) and ((FocusHandle = Handle) or
    IsChild(Handle, FocusHandle)) then
    Windows.SetFocus(0);
  inherited;
end;

procedure TSMCustomTabControl.WMNotifyFormat(var Message: TMessage);
begin
  with Message do
    Result := DefWindowProc(Handle, Msg, WParam, LParam);
end;

procedure TSMCustomTabControl.WMSize(var Message: TMessage);
begin
  inherited;
  RedrawWindow(Handle, nil, 0, RDW_INVALIDATE or RDW_ERASE);
end;

procedure TSMCustomTabControl.CMFontChanged(var Message);
begin
  inherited;
  if HandleAllocated then Perform(WM_SIZE, 0, 0);
end;

procedure TSMCustomTabControl.CMSysColorChange(var Message: TMessage);
begin
  inherited;
  if not (csLoading in ComponentState) then
  begin
    Message.Msg := WM_SYSCOLORCHANGE;
    DefaultHandler(Message);
  end;
end;

procedure TSMCustomTabControl.CMTabStopChanged(var Message: TMessage);
begin
  if not (csDesigning in ComponentState) then RecreateWnd;
end;

procedure TSMCustomTabControl.CNNotify(var Message: TWMNotify);
begin
  with Message do
    case NMHdr^.code of
      TCN_SELCHANGE:
        Change;
      TCN_SELCHANGING:
        begin
          Result := 1;
          if CanChange then Result := 0;
        end;
    end;
end;

procedure TSMCustomTabControl.CMDialogChar(var Message: TCMDialogChar);
var
  I: Integer;
begin
  for I := 0 to FTabs.Count - 1 do
    if IsAccel(Message.CharCode, FTabs[I]) and CanShowTab(I) and CanFocus then
    begin
      TabIndex := I;
      Message.Result := 1;
      Change;
      Exit;
    end;
  inherited;
end;

procedure TSMCustomTabControl.AdjustClientRect(var Rect: TRect);
begin
  Rect := DisplayRect;
//  inherited AdjustClientRect(Rect);
end;

{ TSMTabSheet }

constructor TSMTabSheet.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Align := alClient;
  ControlStyle := ControlStyle + [csAcceptsControls, csNoDesignVisible];
  Visible := False;
  FTabVisible := True;
end;

destructor TSMTabSheet.Destroy;
begin
  if FPageControl <> nil then
  begin
    FPageControl.RemovePage(Self);
  end;
  inherited Destroy;
end;

procedure TSMTabSheet.DoHide;
begin
  if Assigned(FOnHide) then FOnHide(Self);
end;

procedure TSMTabSheet.DoShow;
begin
  if Assigned(FOnShow) then FOnShow(Self);
end;

function TSMTabSheet.GetPageIndex: Integer;
begin
  if FPageControl <> nil then
    Result := FPageControl.FPages.IndexOf(Self) else
    Result := -1;
end;

function TSMTabSheet.GetTabIndex: Integer;
var
  I: Integer;
begin
  Result := 0;
  if not FTabShowing then Dec(Result) else
    for I := 0 to PageIndex - 1 do
      if TSMTabSheet(FPageControl.FPages[I]).FTabShowing then
        Inc(Result);
end;

procedure TSMTabSheet.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  with Params.WindowClass do
    style := style and not (CS_HREDRAW or CS_VREDRAW);
end;

procedure TSMTabSheet.ReadState(Reader: TReader);
begin
  inherited ReadState(Reader);
  if Reader.Parent is TSMPageControl then
    PageControl := TSMPageControl(Reader.Parent);
end;

procedure TSMTabSheet.SetImageIndex(Value: Integer);
begin
  if FImageIndex <> Value then
  begin
    FImageIndex := Value;
    if FTabShowing then FPageControl.UpdateTab(Self);
  end;
end;

procedure TSMTabSheet.SetPageControl(APageControl: TSMPageControl);
begin
  if FPageControl <> APageControl then
  begin
    if FPageControl <> nil then FPageControl.RemovePage(Self);
    Parent := APageControl;
    if APageControl <> nil then APageControl.InsertPage(Self);
  end;
end;

procedure TSMTabSheet.SetPageIndex(Value: Integer);
var
  I, MaxPageIndex: Integer;
begin
  if FPageControl <> nil then
  begin
    MaxPageIndex := FPageControl.FPages.Count - 1;
    if Value > MaxPageIndex then
      raise EListError.CreateFmt(SPageIndexError, [Value, MaxPageIndex]);
    I := TabIndex;
    FPageControl.FPages.Move(PageIndex, Value);
    if I >= 0 then FPageControl.MoveTab(I, TabIndex);
  end;
end;

procedure TSMTabSheet.SetTabShowing(Value: Boolean);
var
  Index: Integer;
begin
  if FTabShowing <> Value then
    if Value then
    begin
      FTabShowing := True;
      FPageControl.InsertTab(Self);
    end else
    begin
      Index := TabIndex;
      FTabShowing := False;
      FPageControl.DeleteTab(Self, Index);
    end;
end;

procedure TSMTabSheet.SetTabVisible(Value: Boolean);
begin
  if FTabVisible <> Value then
  begin
    FTabVisible := Value;
    UpdateTabShowing;
  end;
end;

procedure TSMTabSheet.UpdateTabShowing;
begin
  SetTabShowing((FPageControl <> nil) and
    (FTabVisible or (csDesigning in ComponentState)));
end;

procedure TSMTabSheet.CMTextChanged(var Message: TMessage);
begin
  if FTabShowing then FPageControl.UpdateTab(Self);
end;

procedure TSMTabSheet.CMShowingChanged(var Message: TMessage);
begin
  inherited;
  if Showing then
  begin
    try
      DoShow
    except
      Application.HandleException(Self);
    end;
  end else if not Showing then
  begin
    try
      DoHide;
    except
      Application.HandleException(Self);
    end;
  end;
end;

{ TSMPageControl }

constructor TSMPageControl.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ControlStyle := [csDoubleClicks, csOpaque];
  FPages := TList.Create;
end;

destructor TSMPageControl.Destroy;
var
  I: Integer;
begin
  for I := 0 to FPages.Count - 1 do
    TSMTabSheet(FPages[I]).FPageControl := nil;
  FPages.Free;
  inherited Destroy;
end;

function TSMPageControl.CanShowTab(TabIndex: Integer): Boolean;
begin
  Result := TSMTabSheet(FPages[TabIndex]).Enabled;
end;

procedure TSMPageControl.Change;
var
  Form: TCustomForm;
begin
  UpdateActivePage;
  if csDesigning in ComponentState then
  begin
    Form := GetParentForm(Self);
    if (Form <> nil) and (Form.Designer <> nil) then Form.Designer.Modified;
  end;
  inherited Change;
end;

procedure TSMPageControl.ChangeActivePage(Page: TSMTabSheet);
var
  ParentForm: TCustomForm;
begin
  if FActivePage <> Page then
  begin
    ParentForm := GetParentForm(Self);
    if (ParentForm <> nil) and (FActivePage <> nil) and
      FActivePage.ContainsControl(ParentForm.ActiveControl) then
    begin
      ParentForm.ActiveControl := FActivePage;
      if ParentForm.ActiveControl <> FActivePage then
      begin
        TabIndex := FActivePage.TabIndex;
        Exit;
      end;
    end;
    if Page <> nil then
    begin
      Page.BringToFront;
      Page.Visible := True;
      if (ParentForm <> nil) and (FActivePage <> nil) and
        (ParentForm.ActiveControl = FActivePage) then
        if Page.CanFocus then
          ParentForm.ActiveControl := Page else
          ParentForm.ActiveControl := Self;
    end;
    if FActivePage <> nil then FActivePage.Visible := False;
    FActivePage := Page;
    if (ParentForm <> nil) and (FActivePage <> nil) and
      (ParentForm.ActiveControl = FActivePage) then
      FActivePage.SelectFirst;
  end;
end;

procedure TSMPageControl.DeleteTab(Page: TSMTabSheet; Index: Integer);
var
  UpdateIndex: Boolean;
begin
  UpdateIndex := Page = ActivePage;
  Tabs.Delete(Index);
  if UpdateIndex then
  begin
    if Index >= Tabs.Count then
      Index := Tabs.Count - 1;
    TabIndex := Index;
  end;
  UpdateActivePage;
end;

function TSMPageControl.FindNextPage(CurPage: TSMTabSheet;
  GoForward, CheckTabVisible: Boolean): TSMTabSheet;
var
  I, StartIndex: Integer;
begin
  if FPages.Count <> 0 then
  begin
    StartIndex := FPages.IndexOf(CurPage);
    if StartIndex = -1 then
      if GoForward then StartIndex := FPages.Count - 1 else StartIndex := 0;
    I := StartIndex;
    repeat
      if GoForward then
      begin
        Inc(I);
        if I = FPages.Count then I := 0;
      end else
      begin
        if I = 0 then I := FPages.Count;
        Dec(I);
      end;
      Result := FPages[I];
      if not CheckTabVisible or Result.TabVisible then Exit;
    until I = StartIndex;
  end;
  Result := nil;
end;

procedure TSMPageControl.GetChildren(Proc: TGetChildProc; Root: TComponent);
var
  I: Integer;
begin
  for I := 0 to FPages.Count - 1 do Proc(TComponent(FPages[I]));
end;

function TSMPageControl.GetImageIndex(TabIndex: Integer): Integer;
begin
  if Assigned(FOnGetImageIndex) then
    Result := inherited GetImageIndex(TabIndex) else
    Result := GetPage(TabIndex).ImageIndex;
end;

function TSMPageControl.GetPage(Index: Integer): TSMTabSheet;
begin
  Result := FPages[Index];
end;

function TSMPageControl.GetPageCount: Integer;
begin
  Result := FPages.Count;
end;

procedure TSMPageControl.InsertPage(Page: TSMTabSheet);
begin
  FPages.Add(Page);
  Page.FPageControl := Self;
  Page.UpdateTabShowing;
end;

procedure TSMPageControl.InsertTab(Page: TSMTabSheet);
begin
  Tabs.InsertObject(Page.TabIndex, Page.Caption, Page);
  UpdateActivePage;
end;

procedure TSMPageControl.MoveTab(CurIndex, NewIndex: Integer);
begin
  Tabs.Move(CurIndex, NewIndex);
end;

procedure TSMPageControl.RemovePage(Page: TSMTabSheet);
begin
  Page.SetTabShowing(False);
  Page.FPageControl := nil;
  FPages.Remove(Page);
end;

procedure TSMPageControl.SelectNextPage(GoForward: Boolean);
var
  Page: TSMTabSheet;
begin
  Page := FindNextPage(ActivePage, GoForward, True);
  if (Page <> nil) and (Page <> ActivePage) and CanChange then
  begin
    TabIndex := Page.TabIndex;
    Change;
  end;
end;

procedure TSMPageControl.SetActivePage(Page: TSMTabSheet);
begin
  if (Page <> nil) and (Page.PageControl <> Self) then Exit;
  ChangeActivePage(Page);
  if Page = nil then
    TabIndex := -1
  else if Page = FActivePage then
    TabIndex := Page.TabIndex;
end;

procedure TSMPageControl.SetChildOrder(Child: TComponent; Order: Integer);
begin
  TSMTabSheet(Child).PageIndex := Order;
end;

procedure TSMPageControl.ShowControl(AControl: TControl);
begin
  if (AControl is TSMTabSheet) and (TSMTabSheet(AControl).PageControl = Self) then
    SetActivePage(TSMTabSheet(AControl));
  inherited ShowControl(AControl);
end;

procedure TSMPageControl.UpdateTab(Page: TSMTabSheet);
begin
  Tabs[Page.TabIndex] := Page.Caption;
end;

procedure TSMPageControl.UpdateActivePage;
begin
  if TabIndex >= 0 then
    SetActivePage(TSMTabSheet(Tabs.Objects[TabIndex]));
end;

procedure TSMPageControl.CMDesignHitTest(var Message: TCMDesignHitTest);
var
  HitIndex: Integer;
  HitTestInfo: TTCHitTestInfo;
begin
  HitTestInfo.pt := SmallPointToPoint(Message.Pos);
  HitIndex := SendMessage(Handle, TCM_HITTEST, 0, Longint(@HitTestInfo));
  if (HitIndex >= 0) and (HitIndex <> TabIndex) then Message.Result := 1;
end;

procedure TSMPageControl.CMDialogKey(var Message: TCMDialogKey);
begin
  if (Message.CharCode = VK_TAB) and (GetKeyState(VK_CONTROL) < 0) then
  begin
    SelectNextPage(GetKeyState(VK_SHIFT) >= 0);
    Message.Result := 1;
  end else
    inherited;
end;

end.
