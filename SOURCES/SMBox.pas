{ Copyright (C) 1998-2018, written by Shkolnik Mike, Scalabium Software
  E-Mail:  mshkolnik@scalabium.com
           mshkolnik@yahoo.com
  WEB: http://www.scalabium.com

  This component is an extended panel with expand/collpase possibilities,
  (like component panel in the Microsoft Outlook)

  Windows XP theming supported for Application Bars style

  Original idea and part of code:
    Valera Svetlov 2:461/42.5 (FCPanel & FCPanelPage)
}
unit SMBox;

interface

{$I SMVersion.inc}

uses
  Classes, Windows, Graphics, Controls, StdCtrls, ExtCtrls, RXUtils, Forms;

type
  TSMPanel = class;
  THeaderStyle = (bsNone, bsPlusMinus, bsPicture, bsPlusMinusPicture);
  TSMPanelStyle = (spsStandard, spsWindowsXP);

  TSMPanelHeader = class(TPanel)
  private
    { Private declarations }
    FDirection: TSMGradientDirection;
    FStartColor, FEndColor: TColor;

    FOnPaint: TNotifyEvent;
  protected
    { Protected declarations }
    procedure Paint; override;
  public
    { Public declarations }
  published
    { Published declarations }
    property Direction: TSMGradientDirection read FDirection write FDirection;
    property StartColor: TColor read FStartColor write FStartColor;
    property EndColor: TColor read FEndColor write FEndColor;

    property OnPaint: TNotifyEvent read FOnPaint write FOnPaint;
  end;

  TSMRoundCorner = (rcLeftTop, rcRightTop, rcLeftBottom, rcRightBottom);
  TSMRoundCorners = set of TSMRoundCorner;

  {$IFDEF SM_ADD_ComponentPlatformsAttribute}
  [ComponentPlatformsAttribute(pidWin32 or pidWin64)]
  {$ENDIF}
  TSMBox = class(TScrollBox) //{TWinControl})
  private
    { Private declarations }
    FSMPanel: TSMPanel;

    FPageOpened: Boolean;

    FPicturePlus: TPicture;
    FPictureMinus: TPicture;
    FPicture: TPicture;

    FHeader: TSMPanelHeader;
    FHeaderFont: TFont;

    FAlignment: TAlignment;
    FCaption: TCaption;
    FPanelStyle: TSMPanelStyle;

    FHeaderColor: TColor;
    FHeaderStyle: THeaderStyle;
    FHeaderHeight: Integer;

    FRoundCorners: TSMRoundCorners;

    FHeight: Integer;
    FHorzScroll, FVertScroll: Boolean;

    procedure ButtonClick(Sender: TObject);

    procedure SetHeaderFont(Value: TFont);
    procedure SetSMPanel(InsertInPanel: TSMPanel);
    procedure SetHeaderColor(Value: TColor);
    procedure SetHeaderStyle(Value: THeaderStyle);
    procedure SetHeaderHeight(Value: Integer);
    procedure SetPageOpened(Value: Boolean);
    function GetPicture(Index: Integer): TPicture;
    procedure SetPicture(Index: Integer; Value: TPicture);

    procedure SetPanelStyle(Value: TSMPanelStyle);

    procedure HeaderDraw(Sender: TObject);
  protected
    { Protected declarations }
    procedure ApplyStandardStyle;
    procedure ApplyWindowsXPStyle;

    procedure ReadState(Reader: TReader); override;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property SMPanel: TSMPanel read FSMPanel write SetSMPanel;
    procedure MovePageUp;
    procedure MovePageDown;
  published
    { Published declarations }
    property HeaderColor: TColor read FHeaderColor write SetHeaderColor;
    property HeaderStyle: THeaderStyle read FHeaderStyle write SetHeaderStyle default bsPlusMinusPicture;
    property HeaderHeight: Integer read FHeaderHeight write SetHeaderHeight;
    property Caption: TCaption read FCaption write FCaption;
    property Alignment: TAlignment read FAlignment write FAlignment default taLeftJustify;
    property PageOpened: Boolean read FPageOpened write SetPageOpened;
    property HeaderFont: TFont read FHeaderFont write SetHeaderFont;

    property PicturePlus: TPicture index 0 read GetPicture write SetPicture;
    property PictureMinus: TPicture index 1 read GetPicture write SetPicture;
    property Picture: TPicture index 2 read GetPicture write SetPicture;

    property PanelStyle: TSMPanelStyle read FPanelStyle write SetPanelStyle default spsStandard;
    property RoundCorners: TSMRoundCorners read FRoundCorners write FRoundCorners default [rcLeftTop, rcRightTop];
  end;

  {$IFDEF SM_ADD_ComponentPlatformsAttribute}
  [ComponentPlatformsAttribute(pidWin32 or pidWin64)]
  {$ENDIF}
  TSMPanel = class(TScrollBox) //TCustomPanel)
  private
    { Private declarations }
    FPages: TList; {page list}
    FClosePagesBeforeOpen: Boolean;
    FStartTop: Integer;
    FVerticalGap: Integer;

    function GetPage(Index: Integer): TSMBox;
    function GetPagesCount: Integer;
    procedure SetClosePagesBeforeOpen(Value: Boolean);
    procedure SetStartTop(InStartTop: Integer);
    procedure AlignPages;
    procedure OnPanelResize(Sender: TObject);

    procedure SetVerticalGap(Value: Integer);
  protected
    { Protected declarations }
    procedure GetChildren(Proc: TGetChildProc; Root: TComponent); override;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure ClosePages;

    procedure InsertPage(AddPage: TSMBox);
    procedure RemovePage(AddPage: TSMBox);

    property PagesCount: integer read GetPagesCount;
    property Pages[index: integer]: TSMBox read GetPage;
  published
    { Published declarations }
//    property Align;
    property ClosePagesBeforeOpen: Boolean read FClosePagesBeforeOpen write SetClosePagesBeforeOpen;
    property StartTop: integer read FStartTop write SetStartTop;
    property VerticalGap: Integer read FVerticalGap write SetVerticalGap default 0;
  end;


implementation

{$R SMBOX.res}

var
  bmpOpenedChevron, bmpClosedChevron: TBitmap;
  XPBitmapsCreated: Boolean;

function GetXPBlendColor(ForeColor, BackColor: TColor; Alpha: Byte): TColor;
var
  ForeRed, ForeGreen, ForeBlue,
  BackRed, BackGreen, BackBlue,
  BlendRed, BlendGreen, BlendBlue: Byte;
  AlphaValue: Single;
begin
  AlphaValue := Alpha / 255;

  ForeColor := ColorToRGB(ForeColor);
  ForeRed   := GetRValue(ForeColor);
  ForeGreen := GetGValue(ForeColor);
  ForeBlue  := GetBValue(ForeColor);

  BackColor := ColorToRGB(BackColor);
  BackRed   := GetRValue(BackColor);
  BackGreen := GetGValue(BackColor);
  BackBlue  := GetBValue(BackColor);

  BlendRed := Round(AlphaValue*ForeRed + (1-AlphaValue)*BackRed);
  BlendGreen := Round(AlphaValue*ForeGreen + (1-AlphaValue)*BackGreen);
  BlendBlue := Round(AlphaValue*ForeBlue + (1-AlphaValue)*BackBlue);

  Result := RGB(BlendRed, BlendGreen, BlendBlue);
end;

procedure DrawXPChevronButton(Canvas: TCanvas; IsOpened: Boolean; Left, Top: Integer; BackgroundColor, ForegroundColor, LineColor, ChevronColor: TColor);
var
  OldPenColor: TColor;
begin
  {to draw the outer circle}
  Canvas.Pixels[Left+4, Top] := GetXPBlendColor(LineColor, Canvas.Pixels[Left+4, Top], 128);
  Canvas.Pixels[Left+5, Top] := LineColor;
  Canvas.Pixels[Left+6, Top] := LineColor;
  Canvas.Pixels[Left+7, Top] := LineColor;
  Canvas.Pixels[Left+8, Top] := LineColor;
  Canvas.Pixels[Left+9, Top] := LineColor;
  Canvas.Pixels[Left+10, Top] := GetXPBlendColor(LineColor, Canvas.Pixels[Left+ 0, Top], 128);

  Canvas.Pixels[Left+3, Top+1] := LineColor;
  Canvas.Pixels[Left+4, Top+1] := GetXPBlendColor(LineColor, BackgroundColor, 128);
  Canvas.Pixels[Left+10, Top+1] := GetXPBlendColor(LineColor, BackgroundColor, 128);
  Canvas.Pixels[Left+11, Top+1] := LineColor;

  Canvas.Pixels[Left+ 2, Top+2] := LineColor;
  Canvas.Pixels[Left+12, Top+2] := LineColor;

  Canvas.Pixels[Left+1, Top+3] := LineColor;
  Canvas.Pixels[Left+13, Top+3] := LineColor;
  Canvas.Pixels[Left+1, Top+4] := GetXPBlendColor(LineColor, BackgroundColor, 128);
  Canvas.Pixels[Left+13, Top+4] := GetXPBlendColor(LineColor, BackgroundColor, 128);
  Canvas.Pixels[Left+14, Top+4] := GetXPBlendColor(LineColor, Canvas.Pixels[Left+14, Top+4], 128);

  Canvas.Pixels[Left, Top+4] := GetXPBlendColor(LineColor, Canvas.Pixels[Left, Top+4], 128);
  Canvas.Pixels[Left, Top+5] := LineColor;
  Canvas.Pixels[Left+14, Top+5] := LineColor;
  Canvas.Pixels[Left, Top+6] := LineColor;
  Canvas.Pixels[Left+14, Top+6] := LineColor;
  Canvas.Pixels[Left, Top+7] := LineColor;
  Canvas.Pixels[Left+14, Top+7 ] := LineColor;
  Canvas.Pixels[Left, Top+8] := LineColor;
  Canvas.Pixels[Left+14, Top+8] := LineColor;
  Canvas.Pixels[Left, Top+9] := LineColor;
  Canvas.Pixels[Left+14, Top+9] := LineColor;

  Canvas.Pixels[Left, Top+10] := GetXPBlendColor(LineColor, Canvas.Pixels[Left, Top+10], 128);
  Canvas.Pixels[Left+1, Top+10] := GetXPBlendColor(LineColor, BackgroundColor, 128);
  Canvas.Pixels[Left+13, Top+10] := GetXPBlendColor(LineColor, BackgroundColor, 128);
  Canvas.Pixels[Left+1, Top+11] := LineColor;
  Canvas.Pixels[Left+13, Top+11] := LineColor;
  Canvas.Pixels[Left+14, Top+10] := GetXPBlendColor(LineColor, Canvas.Pixels[Left+14, Top+10], 128);

  Canvas.Pixels[Left+2, Top+12] := LineColor;
  Canvas.Pixels[Left+12, Top+12] := LineColor;

  Canvas.Pixels[Left+3, Top+13] := LineColor;
  Canvas.Pixels[Left+4, Top+13] := GetXPBlendColor(LineColor, BackgroundColor, 128);
  Canvas.Pixels[Left+10, Top+13] := GetXPBlendColor(LineColor, BackgroundColor, 128);
  Canvas.Pixels[Left+11, Top+13] := LineColor;

  Canvas.Pixels[Left+4, Top+14] := GetXPBlendColor(LineColor, Canvas.Pixels[Left+4, Top+14 ], 128);
  Canvas.Pixels[Left+5, Top+14] := LineColor;
  Canvas.Pixels[Left+6, Top+14] := LineColor;
  Canvas.Pixels[Left+7, Top+14] := LineColor;
  Canvas.Pixels[Left+8, Top+14] := LineColor;
  Canvas.Pixels[Left+9, Top+14] := LineColor;
  Canvas.Pixels[Left+10, Top+14] := GetXPBlendColor(LineColor, Canvas.Pixels[Left+10, Top+14], 128);

  { Fill Circle }
  OldPenColor := Canvas.Pen.Color;
  Canvas.Pen.Color := ForegroundColor;
  Canvas.MoveTo(Left+1, Top+5);
  Canvas.LineTo(Left+1, Top+10);
  Canvas.MoveTo(Left+2, Top+3);
  Canvas.LineTo(Left+2, Top+12);
  Canvas.MoveTo(Left+3, Top+2);
  Canvas.LineTo(Left+3, Top+13);
  Canvas.MoveTo(Left+4, Top+2);
  Canvas.LineTo(Left+4, Top+13);
  Canvas.MoveTo(Left+5, Top+1);
  Canvas.LineTo(Left+5, Top+14);
  Canvas.MoveTo(Left+6, Top+1);
  Canvas.LineTo(Left+6, Top+14);
  Canvas.MoveTo(Left+7, Top+1);
  Canvas.LineTo(Left+7, Top+14);
  Canvas.MoveTo(Left+8, Top+1);
  Canvas.LineTo(Left+8, Top+14);
  Canvas.MoveTo(Left+9, Top+1);
  Canvas.LineTo(Left+9, Top+14);
  Canvas.MoveTo(Left+10, Top+2);
  Canvas.LineTo(Left+10, Top+13);
  Canvas.MoveTo(Left+11, Top+2);
  Canvas.LineTo(Left+11, Top+13);
  Canvas.MoveTo(Left+12, Top+3);
  Canvas.LineTo(Left+12, Top+12);
  Canvas.MoveTo(Left+13, Top+5);
  Canvas.LineTo(Left+13, Top+10);
  Canvas.Pen.Color := OldPenColor;

  {to draw the Chevron}
  if IsOpened then
  begin
    Canvas.Pixels[Left+7, Top+3] := ChevronColor;
    Canvas.Pixels[Left+6, Top+4] := ChevronColor;
    Canvas.Pixels[Left+7, Top+4] := ChevronColor;
    Canvas.Pixels[Left+8, Top+4] := ChevronColor;
    Canvas.Pixels[Left+5, Top+5] := ChevronColor;
    Canvas.Pixels[Left+6, Top+5] := ChevronColor;
    Canvas.Pixels[Left+8, Top+5] := ChevronColor;
    Canvas.Pixels[Left+9, Top+5] := ChevronColor;
    Canvas.Pixels[Left+4, Top+6] := ChevronColor;
    Canvas.Pixels[Left+5, Top+6] := ChevronColor;
    Canvas.Pixels[Left+9, Top+6] := ChevronColor;
    Canvas.Pixels[Left+10, Top+6] := ChevronColor;

    Canvas.Pixels[Left+7, Top+7] := ChevronColor;
    Canvas.Pixels[Left+6, Top+8] := ChevronColor;
    Canvas.Pixels[Left+7, Top+8] := ChevronColor;
    Canvas.Pixels[Left+8, Top+8] := ChevronColor;
    Canvas.Pixels[Left+5, Top+9] := ChevronColor;
    Canvas.Pixels[Left+6, Top+9] := ChevronColor;
    Canvas.Pixels[Left+8, Top+9] := ChevronColor;
    Canvas.Pixels[Left+9, Top+9] := ChevronColor;
    Canvas.Pixels[Left+4, Top+10] := ChevronColor;
    Canvas.Pixels[Left+5, Top+10] := ChevronColor;
    Canvas.Pixels[Left+9, Top+10] := ChevronColor;
    Canvas.Pixels[Left+10, Top+10] := ChevronColor;
  end
  else
  begin
    Canvas.Pixels[Left+4, Top+4] := ChevronColor;
    Canvas.Pixels[Left+5, Top+4] := ChevronColor;
    Canvas.Pixels[Left+9, Top+4] := ChevronColor;
    Canvas.Pixels[Left+10, Top+4] := ChevronColor;
    Canvas.Pixels[Left+5, Top+5] := ChevronColor;
    Canvas.Pixels[Left+6, Top+5] := ChevronColor;
    Canvas.Pixels[Left+8, Top+5] := ChevronColor;
    Canvas.Pixels[Left+9, Top+5] := ChevronColor;
    Canvas.Pixels[Left+6, Top+6] := ChevronColor;
    Canvas.Pixels[Left+7, Top+6] := ChevronColor;
    Canvas.Pixels[Left+8, Top+6] := ChevronColor;
    Canvas.Pixels[Left+7, Top+7] := ChevronColor;

    Canvas.Pixels[Left+4, Top+8] := ChevronColor;
    Canvas.Pixels[Left+5, Top+8] := ChevronColor;
    Canvas.Pixels[Left+9, Top+8] := ChevronColor;
    Canvas.Pixels[Left+10, Top+8] := ChevronColor;
    Canvas.Pixels[Left+5, Top+9] := ChevronColor;
    Canvas.Pixels[Left+6, Top+9] := ChevronColor;
    Canvas.Pixels[Left+8, Top+9] := ChevronColor;
    Canvas.Pixels[Left+9, Top+9] := ChevronColor;
    Canvas.Pixels[Left+6, Top+10] := ChevronColor;
    Canvas.Pixels[Left+7, Top+10] := ChevronColor;
    Canvas.Pixels[Left+8, Top+10] := ChevronColor;
    Canvas.Pixels[Left+7, Top+11] := ChevronColor;
  end;
end;

procedure CreateXPBitmaps;
begin
  if XPBitmapsCreated then exit;

  bmpOpenedChevron := TBitmap.Create;
  bmpOpenedChevron.Width := 16;
  bmpOpenedChevron.Height := 16;
  DrawXPChevronButton(bmpOpenedChevron.Canvas, True, 0, 0, clWindow, clWindowText, $00FAE5D3, clWindow);

  bmpClosedChevron := TBitmap.Create;
  bmpClosedChevron.Width := 16;
  bmpClosedChevron.Height := 16;
  DrawXPChevronButton(bmpClosedChevron.Canvas, False, 0, 0, clWindow, clWindowText, $00FAE5D3, clWindow);

  XPBitmapsCreated := True;
end;

{ TSMPanelHeader }
procedure TSMPanelHeader.Paint;
var
  Rect: TRect;
begin
//  inherited;

  Rect := GetClientRect;

  Canvas.Brush.Color := Color;
  Canvas.FillRect(Rect);
  Canvas.Brush.Style := bsClear;

  if Assigned(OnPaint) then
    OnPaint(Self)
end;


{ TSMBox }
constructor TSMBox.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  FPanelStyle := spsStandard;

  FPicturePlus := TPicture.Create;
  FPictureMinus := TPicture.Create;
  FPicture := TPicture.Create;
  FPicture.Bitmap.Handle := LoadBitmap(hInstance, 'FOLDER');

  FRoundCorners := [rcLeftTop, rcRightTop];

  FHeaderHeight := 20;
  FHeader := TSMPanelHeader.Create(Self);
  with FHeader do
  begin
    Parent := Self;
    Align := alTop;
    Cursor := crHandPoint;

    OnPaint := HeaderDraw;
    OnClick := ButtonClick;
  end;

  FAlignment := taLeftJustify;

  FHorzScroll := HorzScrollBar.Visible;
  FVertScroll := VertScrollBar.Visible;
  FHeight := Height;
  FHeaderFont := TFont.Create;
  FHeaderFont.Style := [fsBold];

  ApplyStandardStyle;

  Caption := 'New Page';
  PageOpened := True;
end;

destructor TSMBox.Destroy;
begin
  FPicturePlus.Free;
  FPictureMinus.Free;
  FPicture.Free;

  FHeader.Free;
  FHeaderFont.Free;

  inherited Destroy;
end;

procedure TSMBox.SetHeaderFont(Value: TFont);
begin
  FHeaderFont.Assign(Value)
end;

procedure TSMBox.HeaderDraw(Sender: TObject);
const
  AlignFlags: array [TAlignment] of Integer =
     (DT_LEFT or DT_SINGLELINE {or DT_WORDBREAK }or DT_EXPANDTABS or DT_NOPREFIX or DT_VCENTER,
      DT_RIGHT or DT_SINGLELINE{or DT_WORDBREAK }or DT_EXPANDTABS or DT_NOPREFIX or DT_VCENTER,
      DT_CENTER or DT_SINGLELINE {or DT_WORDBREAK }or DT_EXPANDTABS or DT_NOPREFIX or DT_VCENTER);
var
  pic: TPicture;
  intPicLeftPos, intRightPos: Integer;
  r: TRect;
begin
  {draw gradient}
  SMDrawGradient(FHeader.Canvas, FHeader.ClientRect, FHeader.StartColor, FHeader.EndColor, FHeader.Direction, 255);

  {draw collapse/expand glyph}
  intPicLeftPos := 0;
  intRightPos := FHeader.ClientWidth - 5;
  if (FHeaderStyle in [bsPlusMinus, bsPlusMinusPicture]) then
  begin
    if PageOpened then
      pic := PictureMinus
    else
      pic := PicturePlus;
//    pic.Graphic.Transparent := True;
    if (PanelStyle = spsStandard) then
      intPicLeftPos := 2
    else
    begin
      intRightPos := intRightPos - pic.Width;
      intPicLeftPos := intRightPos;
    end;
    FHeader.Canvas.Draw(intPicLeftPos, (FHeader.Height - pic.Height) div 2, pic.Graphic);
    if (intPicLeftPos = 2) then
      intPicLeftPos := pic.Width + 2
    else
      intPicLeftPos := 2;
  end;

  {draw band image}
  if (FHeaderStyle in [bsPicture, bsPlusMinusPicture]) and
     not Picture.Graphic.Empty then
  begin
    Picture.Graphic.Transparent := True;
    FHeader.Canvas.Draw(intPicLeftPos, (FHeader.Height - Picture.Height) div 2, Picture.Graphic);
    Inc(intPicLeftPos, Picture.Width + 2);
  end;

  {draw caption}
  FHeader.Canvas.Font.Assign(HeaderFont);
  r := Bounds(intPicLeftPos+2, 0, intRightPos, FHeader.ClientHeight);
  DrawText(FHeader.Canvas.Handle, PChar(Caption), -1, r, AlignFlags[FAlignment]);

  {draw corners}
  if (rcLeftTop in FRoundCorners) then
  begin
    FHeader.Canvas.Pixels[0, 0] := Color;
    FHeader.Canvas.Pixels[1, 0] := Color;
    FHeader.Canvas.Pixels[0, 1] := Color;
  end;

  if (rcRightTop in FRoundCorners) then
  begin
    FHeader.Canvas.Pixels[FHeader.Width-1, 0] := Color;
    FHeader.Canvas.Pixels[FHeader.Width-2, 0] := Color;
    FHeader.Canvas.Pixels[FHeader.Width-1, 1] := Color;
  end;
end;

procedure TSMBox.ApplyStandardStyle;
begin
  PictureMinus.Bitmap.Handle := LoadBitmap(hInstance, 'MINUS');
  PicturePlus.Bitmap.Handle := LoadBitmap(hInstance, 'PLUS');

  FHeaderStyle := bsPlusMinusPicture;
  FHeaderColor := clGray;
  Color := clBtnFace;
  FHeaderFont.Color := clWindow;

  with FHeader do
  begin
    Direction := fdTopToBottom;
    StartColor := $00BBBBBB;//00DDDDDD;
    EndColor := $00EEEEEE;//clWhite;

    Height := FHeaderHeight;
    Color := FHeaderColor;
  end;
end;

procedure TSMBox.ApplyWindowsXPStyle;
begin
  CreateXPBitmaps;
  PicturePlus.Bitmap.Assign(bmpOpenedChevron);//LoadBitmap(hInstance, 'XPCOLLAPSE');
  PictureMinus.Bitmap.Assign(bmpClosedChevron);//LoadBitmap(hInstance, 'XPEXPAND');

  Color := $00F7DFD6;//$00FAE5D3;
  FHeaderFont.Color := $00C65D21;

  with FHeader do
  begin
    Direction := fdRightToLeft;
    StartColor := $00D97D67;
    EndColor := clWhite;

    Color := clWindow;
  end;
end;

procedure TSMBox.SetPanelStyle(Value: TSMPanelStyle);
begin
  if (Value <> FPanelStyle) then
  begin
    FPanelStyle := Value;

    case PanelStyle of
      spsWindowsXP: ApplyWindowsXPStyle;
    else//  spsStandard
      ApplyStandardStyle;
    end;

    Invalidate
  end;
end;

procedure TSMBox.ButtonClick(Sender: TObject);
begin
  PageOpened := not PageOpened;
end;

procedure TSMBox.SetSMPanel(InsertInPanel: TSMPanel);
begin
  if (FSMPanel <> nil) then
    FSMPanel.RemovePage(Self);

  Parent := InsertInPanel;

  if (InsertInPanel <> nil) then
    InsertInPanel.InsertPage(Self);
end;

procedure TSMBox.ReadState(Reader: TReader);
begin
  inherited ReadState(Reader);

  if Reader.Parent is TSMPanel then
    SMPanel := TSMPanel(Reader.Parent);
end;

procedure TSMBox.MovePageUp;
var
  p: Pointer;
  n: Integer;
begin
  if (SMPanel <> nil) then
  begin
    n := SMPanel.FPages.IndexOf(Self);
    if (n = -1) or (n = 0) then Exit;

    with SMPanel do
    begin
      p := FPages[n-1];
      FPages[n-1] := FPages[n];
      FPages[n] := p;
      AlignPages;
    end;
  end;
end;

procedure TSMBox.MovePageDown;
var
  p: Pointer;
  n: Integer;
begin
  if (SMPanel <> nil) then
  begin
    n := SMPanel.FPages.IndexOf(Self);
    if (n = -1) or (n = SMPanel.FPages.Count-1) then Exit;

    with SMPanel do
    begin
      p := FPages[n+1];
      FPages[n+1] := FPages[n];
      FPages[n] := p;
      AlignPages;
    end;
  end;
end;

procedure TSMBox.SetHeaderStyle(Value: THeaderStyle);
begin
  if (Value <> FHeaderStyle) then
  begin
    FHeaderStyle := Value;
    Invalidate
  end;
end;

procedure TSMBox.SetHeaderColor(Value: TColor);
begin
  if (Value <> FHeaderColor) then
  begin
    FHeaderColor := Value;
    FHeader.Color := Value;
  end;
end;

procedure TSMBox.SetHeaderHeight(Value: Integer);
begin
  if (Value <> FHeaderHeight) then
  begin
    FHeaderHeight := Value;
    FHeader.Height := Value;
  end;
end;

procedure TSMBox.SetPageOpened(Value: Boolean);
begin
  if (Value <> FPageOpened) then
  begin
    FPageOpened := Value;
    FHeader.Invalidate;

    if FPageOpened then
    begin
      HorzScrollBar.Visible := FHorzScroll;
      VertScrollBar.Visible := FVertScroll;
      Height := FHeight;
    end
    else
    begin
      FHeight := Height;
      FHorzScroll := HorzScrollBar.Visible;
      HorzScrollBar.Visible := False;

      FVertScroll := VertScrollBar.Visible;
      VertScrollBar.Visible := False;
      Height := FHeaderHeight+4;
    end;

    if (SMPanel <> nil) then
      SMPanel.AlignPages;
  end;
end;

function TSMBox.GetPicture(Index: Integer): TPicture;
begin
  case Index of
    0: Result := FPicturePlus;
    1: Result := FPictureMinus;
    2: Result := FPicture;
  else
    Result := nil
  end;
end;

procedure TSMBox.SetPicture(Index: Integer; Value: TPicture);
begin
  case Index of
    0: FPicturePlus.Assign(Value);
    1: FPictureMinus.Assign(Value);
    2: FPicture.Assign(Value);
  end;
  FHeader.Invalidate
end;

{ TSMPanel }
constructor TSMPanel.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  FStartTop := 0;
  Caption := ' ';
  Height := 200;
  FPages := TList.Create;
  FVerticalGap := 0;

  HorzScrollBar.Visible := False;
  OnResize := OnPanelResize;
end;

destructor TSMPanel.Destroy;
begin
  OnResize := nil;
  FPages.Free;

  inherited Destroy;
end;

function TSMPanel.GetPage(index: Integer): TSMBox;
begin
  if (FPages.Count > 0) then
    Result := FPages[index]
  else
    Result := nil;
end;

function TSMPanel.GetPagesCount: Integer;
begin
  Result := FPages.Count;
end;

procedure TSMPanel.SetClosePagesBeforeOpen(Value: Boolean);
begin
  if (FClosePagesBeforeOpen <> Value) then
  begin
    FClosePagesBeforeOpen := Value;
    AlignPages;
  end;
end;

procedure TSMPanel.SetStartTop(InStartTop: Integer);
begin
  if (FStartTop <> InStartTop) then
  begin
    FStartTop := InStartTop;
    AlignPages;
  end;
end;

procedure TSMPanel.GetChildren(Proc: TGetChildProc; Root: TComponent);
var
  i: Integer;
begin
  for i := 0 to FPages.Count-1 do
    Proc(TComponent(FPages[i]));
end;

procedure TSMPanel.ClosePages;
var
  i: Integer;
begin
  for i := 0 to GetPagesCount-1 do
    Pages[i].PageOpened := False;
end;

procedure TSMPanel.InsertPage(AddPage: TSMBox);
begin
  FPages.Add(AddPage);
  AddPage.FSMPanel := Self;
  AlignPages;
end;

procedure TSMPanel.RemovePage(AddPage: TSMBox);
var
  i: Integer;
begin
  i := FPages.IndexOf(AddPage);
  if (i <> -1) then
    FPages.Delete(i);
  AlignPages;
end;

procedure TSMPanel.SetVerticalGap(Value: Integer);
begin
  if (FVerticalGap <> Value) then
  begin
    FVerticalGap := Value;
    AlignPages
  end
end;

procedure TSMPanel.AlignPages;
var
  i, st: Integer;
begin
  if FClosePagesBeforeOpen then
    ClosePages;

  if (FStartTop > 0) then
    st := FStartTop
  else
    st := 0;
  for i := 0 to GetPagesCount-1 do
  begin
    Pages[i].Left := 0;
    Pages[i].Top := st;
    Pages[i].Width := Width;
    Inc(st, Pages[i].Height + FVerticalGap);
  end;
end;

procedure TSMPanel.OnPanelResize(Sender: TObject);
begin
  AlignPages;
end;

initialization
  XPBitmapsCreated := False;

finalization
  if XPBitmapsCreated then
  begin
    bmpOpenedChevron.Free;
    bmpClosedChevron.Free;
  end;

end.
