{ Copyright (C) 1998-2018, written by Shkolnik Mike, Scalabium Software
  E-Mail:  mshkolnik@scalabium.com
           mshkolnik@yahoo.com
  WEB: http://www.scalabium.com

  CAPTCHA component with several properties to customize (kind, set of characters, length, font, background etc)
}
unit smcaptcha;

interface

{$I SMVersion.inc}

uses Windows, Classes, Controls, Graphics;

type
  TSMCaptchaKind = (ckDefault{TODO:, ckMathEquition});

  {$IFDEF SM_ADD_ComponentPlatformsAttribute}
  [ComponentPlatformsAttribute(pidWin32 or pidWin64)]
  {$ENDIF}
  TSMCaptcha = class(TGraphicControl)
  private
    { Private declarations }
    FAvailableCharacters: string;
    FCaseSensetive: Boolean;
    FLength: Integer;

    FKind: TSMCaptchaKind;
  protected
    { Protected declarations }
    FGeneratedImage: TBitmap;
    FCaptchaValue: string;

    procedure DoDrawText(FAngle: Integer; Rect: TRect; AText: string);
    procedure Paint; override;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    procedure Initialize;
    function ValidateValue(const AValue: string): Boolean;
  published
    { Published declarations }
    property AvailableCharacters: string read FAvailableCharacters write FAvailableCharacters;
    property Length: Integer read FLength write FLength default 5;
    property Kind: TSMCaptchaKind read FKind write FKind default ckDefault;
    property CaseSensetive: Boolean read FCaseSensetive write FCaseSensetive default False;

    property Align;
{$IFDEF SMForDelphi4}
    property Anchors;
{$ENDIF}
    property Color;
    property DragCursor;
    property DragMode;
    property Enabled;
    property Font;
    property ParentColor;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property ShowHint;
    property Visible;
    property OnClick;
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDrag;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnStartDrag;
  end;

procedure Register;

implementation
uses SysUtils;

procedure Register;
begin
  RegisterComponents('SMComponents', [TSMCaptcha]);
end;

{ TSMCaptcha }
constructor TSMCaptcha.Create(AOwner: TComponent);
var
  i: Integer;
begin
  inherited Create(AOwner);

  FGeneratedImage := TBitmap.Create;

  FAvailableCharacters := '';
  for i := Ord('A') to Ord('Z') do
    FAvailableCharacters := FAvailableCharacters + Chr(i);
  for i := Ord('a') to Ord('z') do
    FAvailableCharacters := FAvailableCharacters + Chr(i);
  FAvailableCharacters := FAvailableCharacters + '0123456789';

  FLength := 5;
  FKind := ckDefault;
  FCaseSensetive := False;

  Font.Name := 'Arial';
  Font.Size := 14;

  Width := 100;
  Height := 50;

  Initialize;
end;

destructor TSMCaptcha.Destroy;
begin
  FGeneratedImage.Free;
  FGeneratedImage := nil;

  inherited;
end;

procedure TSMCaptcha.Initialize;
var
  i, intLen, Angle: Integer;
  r: TRect;
begin
  {generate string}
  FCaptchaValue := '';
  if (AvailableCharacters <> '') then
  begin
    intLen := System.Length(AvailableCharacters);
    for i := 0 to Length-1 do
      FCaptchaValue := FCaptchaValue + AvailableCharacters[Random(intLen-1)+1];
  end;

  {generate the image}
  FGeneratedImage.Width := ClientRect.Right-ClientRect.Left;
  FGeneratedImage.Height := ClientRect.Bottom-ClientRect.Top;
  FGeneratedImage.Canvas.Brush.Color := clWhite;
  FGeneratedImage.Canvas.FillRect(FGeneratedImage.Canvas.ClipRect);

  {1. draw the random lines with random colors}
  for i := 0 to Length do
  begin
    FGeneratedImage.Canvas.Pen.Color := Random($02FFFFFF);
    FGeneratedImage.Canvas.MoveTo(Random(5), Random(FGeneratedImage.Height)-Random(5));
    FGeneratedImage.Canvas.LineTo(FGeneratedImage.Width-Random(5), Random(FGeneratedImage.Height)-Random(5));
  end;

  {2. draw the characters with random colors}
  for i := 1 to System.Length(FCaptchaValue) do
  begin
    r := ClientRect;
    r.Left := r.Left + (Width div Length)*(i-1);
    r.Right := r.Left + (Width div Length);
    r.Top := r.Top + Random(Height-ABS(Font.Height));
    if (i mod 2 = 0) then
      Angle := Random(20)
    else
      Angle := 360-Random(20);
    DoDrawText(Angle, r, FCaptchaValue[i]);
  end;

  Invalidate;
end;

procedure TSMCaptcha.DoDrawText(FAngle: Integer; Rect: TRect; AText: string);
var
  LogRec: TLogFont;
  OldFontHandle, NewFontHandle: hFont;
  fDegToRad, fCosAngle, fSinAngle: Double;
  H, W, X, Y: Integer;
  BRect: TRect;
begin
  fDegToRad := PI / 180;
  fCosAngle := cos(FAngle * fDegToRad);
  fSinAngle := sin(FAngle * fDegToRad);
  with FGeneratedImage.Canvas do
  begin
    Font := Self.Font;
    Font.Color := Random($02FFFFFF);
    Brush.Style := bsClear;

    {-create a rotated font based on the font object Font}
    GetObject(Font.Handle, SizeOf(LogRec), Addr(LogRec));
    LogRec.lfEscapement := FAngle*10;
    LogRec.lfOrientation := FAngle*10;
    LogRec.lfOutPrecision := OUT_DEFAULT_PRECIS;
    LogRec.lfClipPrecision := OUT_DEFAULT_PRECIS;
    NewFontHandle := CreateFontIndirect(LogRec);

    W := TextWidth(AText);
    H := TextHeight(AText);
    X := 0;
    case FAngle of
      91..180: X := X - Trunc(W*fCosAngle);
      181..270: X := X - Trunc(W*fCosAngle) - Trunc(H*fSinAngle);
      271..359: X := X - Trunc(H*fSinAngle);
    end;
    if X > (Rect.Right-Rect.Left) then X := Rect.Right-Rect.Left;

    Y := 0;
    case FAngle of
         0..90: Y := Y + Trunc(W*fSinAngle);
       91..180: Y := Y + Trunc(W*fSinAngle) - Trunc(H*fCosAngle);
      181..270: Y := Y - Trunc(H*fCosAngle);
    end;
    if Y > (Rect.Bottom-Rect.Top) then Y := Rect.Bottom-Rect.Top;

    OldFontHandle := SelectObject(Handle, NewFontHandle);
    with BRect do
    begin
      Left := Rect.Left + X;
      Top := Rect.Top + Y;
      Right := Rect.Right;
      Bottom := Rect.Bottom;
    end;
    FGeneratedImage.Canvas.TextOut(BRect.Left, BRect.Top, AText);

    NewFontHandle := SelectObject(FGeneratedImage.Canvas.Handle, OldFontHandle);
    DeleteObject(NewFontHandle);
  end;
end;

procedure TSMCaptcha.Paint;
begin
  inherited;

  Canvas.StretchDraw(ClientRect, FGeneratedImage);
end;

function TSMCaptcha.ValidateValue(const AValue: string): Boolean;
begin
  if CaseSensetive then
    Result := (CompareStr(AValue, FCaptchaValue) = 0)
  else
    Result := (CompareText(AValue, FCaptchaValue) = 0);
end;

end.
