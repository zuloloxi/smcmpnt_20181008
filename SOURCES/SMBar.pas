{ Copyright (C) 1998-2018, written by Shkolnik Mike, Scalabium Software
  E-Mail:  mshkolnik@scalabium.com
           mshkolnik@yahoo.com
  WEB: http://www.scalabium.com

  This component is an extended TStatusBar with posibilities
  to define a list of fixed panels with automatic refresing
  information about system:
   pmGDIResource
   pmSystemResource
   pmUserResource
   pmTotalPageFile
   pmAvailPageFile
   pmTotalVirtual
   pmAvailVirtual
   pmTotalMemory
   pmAvailMemory
   pmMemoryInUse
   pmKeyStatus
   pmDate
   pmTime

}
unit SMBar;

interface

{$I SMVersion.inc}

uses
  Windows, Messages, Classes, Graphics, Controls;

const
  BevelWidth = 1;
  Offset = 2;

type
  TPanelAlignment = (paLeft, paRight);
  TPanelMode = (pmGDIResource, pmSystemResource, pmUserResource,
                pmTotalPageFile, pmAvailPageFile,
                pmTotalVirtual, pmAvailVirtual,
                pmTotalMemory, pmAvailMemory, pmMemoryInUse,
                pmKeyStatus, pmDate, pmTime);
  TPanelModes = set of TPanelMode;
  TPanels = array[TPanelMode] of string;
  TPanelBevel = (pbNone, pbLowered, pbRaised);

const
  KeyCaption: array[1..3] of string[4] = ('NUM', 'CAPS', 'SCRL');
  PanelsCaption: TPanels = ('GDI: ', 'SYSTEM: ', 'USER: ',
                            'TotalPageFile: ', 'AvailPageFile: ',
                            'TotalVirtual: ', 'AvailVirtual: ',
                            'Memory: ', 'AvailMemory: ', 'MemoryInUse: ',
                            '', '', '');

type
  TSystembar = class;

  TDrawPanelEvent = procedure(StatusBar: TSystemBar; Panel: TPanelMode; const Rect: TRect) of object;

  TSMPanelPos = record
                  Left: Integer;
                  Width: Integer;
                end;

  {$IFDEF SM_ADD_ComponentPlatformsAttribute}
  [ComponentPlatformsAttribute(pidWin32 or pidWin64)]
  {$ENDIF}
  TSystembar = class(TCustomControl)
  private
    { Private declarations }
    FAutoHint: Boolean;
    FFormatTime: string;
    FFormatDate: string;

    FSimpleText: string;
    FPanels: TPanels;
    FPanelsPos: array[TPanelMode] of TSMPanelPos;

    FPanelModes: TPanelModes;
    FAlignment: TPanelAlignment;
    FPanelBevel: TPanelBevel;
    FOnDrawPanel: TDrawPanelEvent;
    FOnResize: TNotifyEvent;
{$IFDEF SMForDelphi5}
    FOnHint: TNotifyEvent;
{$ENDIF}

    procedure SetPanelBevel(Value: TPanelBevel);
    procedure SetSimpleText(Value: string);
    procedure SetFormatTime(Value: string);
    procedure SetFormatDate(Value: string);
    procedure SetPanelModes(Value: TPanelModes);
    procedure SetAlignment(Value: TPanelAlignment);
    procedure Frame3D(Canvas: TCanvas; Rect: TRect; TopColor, BottomColor: TColor; Width: Integer);
    procedure CalcPanelsWidth;
    procedure WMSize(var Message: TWMSize); message WM_SIZE;
  protected
    { Protected declarations }
    FHintText: string;

    procedure Paint; override;
    procedure Resize; {$IFDEF SMForDelphi5}
                        override;
                      {$ELSE}
                        dynamic;
                      {$ENDIF}
    procedure WMDestroy(var Msg: TMsg); message WM_Destroy;
    procedure WMCreate(var Msg: TMsg); message WM_Create;
    procedure WMTimer(var Msg: TMsg); message WM_Timer;
{$IFDEF SMForDelphi5}
    function DoHint: Boolean; virtual;
{$ENDIF}
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
{$IFDEF SMForDelphi5}
    function ExecuteAction(Action: TBasicAction): Boolean; override;
{$ENDIF}

    property Canvas;
  published
    { Published declarations }
    property AutoHint: Boolean read FAutoHint write FAutoHint default False;
    property Alignment: TPanelAlignment read FAlignment write SetAlignment;
    property PanelBevel: TPanelBevel read FPanelBevel write SetPanelBevel;
    property FormatDate: string read FFormatDate write SetFormatDate;
    property FormatTime: string read FFormatTime write SetFormatTime;
    property PanelModes: TPanelModes read FPanelModes write SetPanelModes;
    property SimpleText: string read FSimpleText write SetSimpleText;

    property Align;
    property DragCursor;
    property DragMode;
    property Enabled;
    property Font;
    property HelpContext;
    property Hint;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property ShowHint;
    property Visible;

    property OnClick;
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnDrawPanel: TDrawPanelEvent read FOnDrawPanel write FOnDrawPanel;
    property OnEndDrag;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnResize: TNotifyEvent read FOnResize write FOnResize;
    property OnStartDrag;
{$IFDEF SMForDelphi5}
    property OnHint: TNotifyEvent read FOnHint write FOnHint;
{$ENDIF}
  end;

procedure Register;

implementation
uses SysUtils
{$IFDEF SMForDelphi5}
  , StdActns
{$ENDIF}
;

procedure Register;
begin
  RegisterComponents('SMComponents', [TSystembar]);
end;

function Min(X, Y: Integer): Integer;
begin
  if (X < Y) then
    Result := X
  else
    Result := Y;
end;

constructor TSystembar.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  FFormatDate := 'ddd dd-mmm-yyyy'; //'dddd dd/mmmm/yyyy';
  FFormatTime := 'hh:nn'; //'hh:nn:ss'

  FPanelModes := [pmTotalMemory, pmAvailMemory,
                  pmKeyStatus, pmDate, pmTime];

  FAlignment := paRight;
  FPanelBevel := pbLowered;
  Align := alBottom;
  Height := 19;
end;

procedure TSystembar.SetSimpleText(Value: string);
begin
  if (FSimpleText <> Value) then
  begin
    FSimpleText := Value;
    Invalidate;
  end;
end;

procedure TSystembar.SetPanelBevel(Value: TPanelBevel);
begin
  if (FPanelBevel <> Value) then
  begin
    FPanelBevel := Value;
    Invalidate;
  end;
end;

procedure TSystembar.SetFormatTime(Value: string);
begin
  if (Value <> FFormatTime) then
  begin
    FFormatTime := Value;
    Invalidate
  end;
end;

procedure TSystembar.SetFormatDate(Value: string);
begin
  if (Value <> FFormatDate) then
  begin
    FFormatDate := Value;
    Invalidate
  end;
end;

procedure TSystembar.SetPanelModes(Value: TPanelModes);
var Msg: TMsg;
begin
  FPanels := PanelsCaption;
  if (FPanelModes <> Value) then
  begin
    FPanelModes := Value;
    WMTimer(Msg);
  end;
end;

procedure TSystembar.SetAlignment(Value: TPanelAlignment);
begin
  if (Value <> FAlignment) then
  begin
    FAlignment := Value;
    Invalidate
  end;
end;

procedure TSystembar.WMDestroy(var Msg: TMsg);
begin
  KillTimer(Handle, 1);
  inherited
end;

procedure TSystembar.WMCreate(var Msg: TMsg);
begin
  SetTimer(Handle, 1, 200, nil);
  inherited;
end;

procedure TSystembar.WMTimer(var Msg: TMsg);
var MemStatus: TMemoryStatus;
    boolNeedRepaint: Boolean;
    s: string;
begin
  boolNeedRepaint := False;

  if (pmTime in PanelModes) then
  begin
    if (FPanels[pmTime] <> PanelsCaption[pmTime] + FormatDateTime(FFormatTime, Now)) then
    begin
      FPanels[pmTime] := PanelsCaption[pmTime] + FormatDateTime(FFormatTime, Now);
      boolNeedRepaint := True
    end
  end
  else
    FPanels[pmTime] := '';

  if (pmDate in PanelModes) then
  begin
    if (FPanels[pmDate] <> PanelsCaption[pmDate] + FormatDateTime(FFormatDate, Date)) then
    begin
      FPanels[pmDate] := PanelsCaption[pmDate] + FormatDateTime(FFormatDate, Date);
      boolNeedRepaint := True
    end
  end
  else
    FPanels[pmDate] := '';

  if (pmKeyStatus in PanelModes) then
  begin
    if (GetKeyState(VK_NUMLOCK) and $01) <> 0 then
      s := 'NUM'
    else
      s := '   ';
    if (GetKeyState(VK_CAPITAL) and $01) <> 0 then
      s := s + ' CAPS'
    else
      s := s + '     ';
    if (GetKeyState(VK_SCROLL) and $01) <> 0 then
      s := s + ' SCRL'
    else
      s := s + '     ';
    if (FPanels[pmKeyStatus] <> s) then
    begin
      FPanels[pmKeyStatus] := s;
      boolNeedRepaint := True
    end;
  end
  else
    FPanels[pmKeyStatus] := '';

  MemStatus.dwLength := SizeOf(TMemoryStatus);
  GlobalMemoryStatus(MemStatus);

  if (pmGDIResource in PanelModes) then
  begin
//    GetFreeSystemResources(GFSR_GDIResources);
    if (FPanels[pmGDIResource] <> (PanelsCaption[pmGDIResource] + '%')) then
    begin
      FPanels[pmGDIResource] := (PanelsCaption[pmGDIResource] + '%');
      boolNeedRepaint := True
    end
  end
  else
    FPanels[pmGDIResource] := '';

  if (pmUserResource in PanelModes) then
  begin
//    GetFreeSystemResources(GFSR_UserResources);
    if (FPanels[pmUserResource] <> (PanelsCaption[pmUserResource] + '%')) then
    begin
      FPanels[pmUserResource] := (PanelsCaption[pmUserResource] + '%');
      boolNeedRepaint := True
    end
  end
  else
    FPanels[pmUserResource] := '';

  if (pmSystemResource in PanelModes) then
  begin
//    GetFreeSystemResources(GFSR_SYSTEMRESOURCES);
    if (FPanels[pmSystemResource] <> PanelsCaption[pmSystemResource] + '%') then
    begin
      FPanels[pmSystemResource] := PanelsCaption[pmSystemResource] + '%';
      boolNeedRepaint := True
    end
  end
  else
    FPanels[pmSystemResource] := '';

  if (pmTotalPageFile in PanelModes) then
  begin
    if (FPanels[pmTotalPageFile] <> (PanelsCaption[pmTotalPageFile] + IntToStr(MemStatus.dwTotalPageFile div 1024) + 'Kb')) then
    begin
      FPanels[pmTotalPageFile] := (PanelsCaption[pmTotalPageFile] + IntToStr(MemStatus.dwTotalPageFile div 1024) + 'Kb');
      boolNeedRepaint := True
    end
  end
  else
    FPanels[pmTotalPageFile] := '';

  if (pmAvailPageFile in PanelModes) then
  begin
    if (FPanels[pmAvailPageFile] <> (PanelsCaption[pmAvailPageFile] + IntToStr(MemStatus.dwAvailPageFile div 1024) + 'Kb')) then
    begin
      FPanels[pmAvailPageFile] := (PanelsCaption[pmAvailPageFile] + IntToStr(MemStatus.dwAvailPageFile div 1024) + 'Kb');
      boolNeedRepaint := True
    end
  end
  else
    FPanels[pmAvailPageFile] := '';

  if (pmTotalVirtual in PanelModes) then
  begin
    if (FPanels[pmTotalVirtual] <> (PanelsCaption[pmTotalVirtual] + IntToStr(MemStatus.dwTotalVirtual div 1024) + 'Kb')) then
    begin
      FPanels[pmTotalVirtual] := (PanelsCaption[pmTotalVirtual] + IntToStr(MemStatus.dwTotalVirtual div 1024) + 'Kb');
      boolNeedRepaint := True
    end
  end
  else
    FPanels[pmTotalVirtual] := '';

  if (pmAvailVirtual in PanelModes) then
  begin
    if (FPanels[pmAvailVirtual] <> (PanelsCaption[pmAvailVirtual] + IntToStr(MemStatus.dwAvailVirtual div 1024) + 'Kb')) then
    begin
      FPanels[pmAvailVirtual] := (PanelsCaption[pmAvailVirtual] + IntToStr(MemStatus.dwAvailVirtual div 1024) + 'Kb');
      boolNeedRepaint := True
    end
  end
  else
    FPanels[pmAvailVirtual] := '';

  if (pmTotalMemory in PanelModes) then
  begin
    if (FPanels[pmTotalMemory] <> (PanelsCaption[pmTotalMemory] + IntToStr(MemStatus.dwTotalPhys div 1024) + 'Kb')) then
    begin
      FPanels[pmTotalMemory] := (PanelsCaption[pmTotalMemory] + IntToStr(MemStatus.dwTotalPhys div 1024) + 'Kb');
      boolNeedRepaint := True
    end
  end
  else
    FPanels[pmTotalMemory] := '';

  if (pmAvailMemory in PanelModes) then
  begin
    if (FPanels[pmAvailMemory] <> (PanelsCaption[pmAvailMemory] + IntToStr(MemStatus.dwAvailPhys div 1024) + 'Kb')) then
    begin
      FPanels[pmAvailMemory] := (PanelsCaption[pmAvailMemory] + IntToStr(MemStatus.dwAvailPhys div 1024) + 'Kb');
      boolNeedRepaint := True
    end
  end
  else
    FPanels[pmAvailMemory] := '';

  if (pmMemoryInUse in PanelModes) then
  begin
    if (FPanels[pmMemoryInUse] <> (PanelsCaption[pmMemoryInUse] + IntToStr(MemStatus.dwMemoryLoad) + '%')) then
    begin
      FPanels[pmMemoryInUse] := (PanelsCaption[pmMemoryInUse] + IntToStr(MemStatus.dwMemoryLoad) + '%');
      boolNeedRepaint := True
    end
  end
  else
    FPanels[pmMemoryInUse] := '';

  if boolNeedRepaint then
    Paint;

  inherited;
end;

procedure TSystembar.CalcPanelsWidth;
var i: TPanelMode;
    intOffset: Integer;
    s: string;
begin
  if (FAlignment = paLeft) then
  begin
    intOffset := 0;
    for i := pmGDIResource to pmTime do
    begin
      FPanelsPos[i].Left := intOffset;
      if (i = pmKeyStatus) and (i in FPanelModes) then
        s := 'NUM CAPS SCRL'
      else
        s := FPanels[i];
      FPanelsPos[i].Width := Canvas.TextWidth(s);
      if FPanelsPos[i].Width <> 0 then
        Inc(intOffset, FPanelsPos[i].Width + 2*BevelWidth + 2*Offset);
    end;
  end
  else
  begin
    intOffset := ClientRect.Right;
    for i := pmTime downto pmGDIResource do
    begin
      if (i = pmKeyStatus) and (i in FPanelModes) then
        s := 'NUM CAPS SCRL'
      else
        s := FPanels[i];
      FPanelsPos[i].Width := Canvas.TextWidth(s);
      if FPanelsPos[i].Width <> 0 then
        Dec(intOffset, FPanelsPos[i].Width + 2*BevelWidth + 2*Offset);
      FPanelsPos[i].Left := intOffset;
    end;
  end
end;

procedure TSystembar.Frame3D(Canvas: TCanvas; Rect: TRect;
                             TopColor, BottomColor: TColor; Width: Integer);

  procedure DoRect;
  var TopRight, BottomLeft: TPoint;
  begin
    with Canvas, Rect do
    begin
      TopRight.X := Right;
      TopRight.Y := Top;
      BottomLeft.X := Left;
      BottomLeft.Y := Bottom;
      Pen.Color := TopColor;
      PolyLine([BottomLeft, TopLeft, TopRight]);
      Pen.Color := BottomColor;
      Dec(BottomLeft.X);
      PolyLine([TopRight, BottomRight, BottomLeft]);
    end;
  end;

begin
  Canvas.Pen.Width := 1;
  Dec(Rect.Bottom);
  Dec(Rect.Right);
  while Width > 0 do
  begin
    Dec(Width);
    DoRect;
    InflateRect(Rect, -1, -1);
  end;
  Inc(Rect.Bottom);
  Inc(Rect.Right);
end;

procedure TSystembar.Paint;
var StatusRect: TRect;
    i: TPanelMode;
    TopColor, BottomColor: TColor;
begin
//  inherited Paint;

  {calculate widths for all panels}
  CalcPanelsWidth;

  Canvas.Font := Self.Font;
  TopColor := clBtnShadow;
  BottomColor := clBtnHighlight;
  StatusRect := ClientRect;

  Canvas.Brush.Color := Self.Color;
  Canvas.FillRect(StatusRect);

  for i := pmGDIResource to pmTime do
  begin
    StatusRect.Left := FPanelsPos[i].Left + Offset;
    StatusRect.Right := FPanelsPos[i].Left + FPanelsPos[i].Width + 2*BevelWidth + 2*Offset;

    if Assigned(FOnDrawPanel) then
      FOnDrawPanel(Self, i, StatusRect);

    if (FPanels[i] <> '') then
    begin
      case FPanelBevel of
        pbLowered: Frame3D(Canvas, StatusRect, TopColor, BottomColor, BevelWidth);
        pbRaised: Frame3D(Canvas, StatusRect, BottomColor, TopColor, BevelWidth);
      else// pbNone
      end;
      DrawText(Canvas.Handle, PChar(FPanels[i]), Length(FPanels[i]), StatusRect,
               DT_CENTER or DT_VCENTER or DT_SINGLELINE)
    end;
  end;

  if (FAlignment = paLeft) then
  begin
    StatusRect.Left := FPanelsPos[pmTime].Left + FPanelsPos[pmTime].Width + 2*BevelWidth + 2*Offset + 2;
    StatusRect.Right := ClientRect.Right - 2;
  end
  else
  begin
    StatusRect.Left := ClientRect.Left + 2;
    StatusRect.Right := FPanelsPos[pmGDIResource].Left - BevelWidth - 2;
  end;
  if Assigned(FOnDrawPanel) then
    FOnDrawPanel(Self, TPanelMode(0), StatusRect);

  if (FSimpleText <> '') then
    DrawText(Canvas.Handle, PChar(FSimpleText), Length(FSimpleText), StatusRect,
               DT_LEFT or DT_VCENTER or DT_SINGLELINE)
  else
  if (FHintText <> '') then
    DrawText(Canvas.Handle, PChar(FHintText), Length(FHintText), StatusRect,
               DT_LEFT or DT_VCENTER or DT_SINGLELINE)
end;

procedure TSystembar.WMSize(var Message: TWMSize);
begin
  { Eat WM_SIZE message to prevent control from doing alignment }
  if not (csLoading in ComponentState) then Resize;
  Repaint;
end;

{$IFDEF SMForDelphi5}
function TSystembar.ExecuteAction(Action: TBasicAction): Boolean;
begin
  if AutoHint and (Action is THintAction) and not DoHint then
  begin
    FHintText := THintAction(Action).Hint;
    Result := True;
  end
  else
    Result := inherited ExecuteAction(Action);
end;
{$ENDIF}

procedure TSystembar.Resize;
begin
  if Assigned(FOnResize) then FOnResize(Self);
end;

{$IFDEF SMForDelphi5}
function TSystembar.DoHint: Boolean;
begin
  if Assigned(FOnHint) then
  begin
    FOnHint(Self);
    Result := True;
  end
  else
    Result := False;
end;
{$ENDIF}

end.
