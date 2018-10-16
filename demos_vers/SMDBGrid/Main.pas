unit Main;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, SMDBGrid, ExtCtrls, Db, DBTables, ComCtrls,
  Menus;

type
  TfrmMain = class(TForm)
    pcMain: TPageControl;
    tsBoolean: TTabSheet;
    SMDBGridBoolean: TSMDBGrid;
    dSrcReservat: TDataSource;
    tblReservat: TTable;
    tsStandardPopup: TTabSheet;
    SMDBGridStandardPopup: TSMDBGrid;
    tsFixed: TTabSheet;
    SMDBGridFixed: TSMDBGrid;
    tsMultiSelect: TTabSheet;
    SMDBGridMultiSelect: TSMDBGrid;
    tsGlyph: TTabSheet;
    imgGlyph1: TImage;
    imgGlyph2: TImage;
    tsLookup: TTabSheet;
    SMDBGridLookup: TSMDBGrid;
    tblCustomer: TTable;
    tsGraphics: TTabSheet;
    tblBiolife: TTable;
    dSrcBiolife: TDataSource;
    tblBiolifeSpeciesNo: TFloatField;
    tblBiolifeCategory: TStringField;
    tblBiolifeCommon_Name: TStringField;
    tblBiolifeSpeciesName: TStringField;
    tblBiolifeLengthcm: TFloatField;
    tblBiolifeLength_In: TFloatField;
    tblBiolifeNotes: TMemoField;
    tblBiolifeGraphic: TGraphicField;
    SMDBGridGraphic1: TSMDBGrid;
    tsNoAppendDelete: TTabSheet;
    SMDBGridNoAppendDelete: TSMDBGrid;
    tsColors: TTabSheet;
    SMDBGridColors: TSMDBGrid;
    SMDBGridGlyph: TSMDBGrid;
    SMDBGridGraphic2: TSMDBGrid;
    Splitter1: TSplitter;
    tsSort: TTabSheet;
    SMDBGridSort: TSMDBGrid;
    tsEnterLikeTab: TTabSheet;
    SMDBGridEnterLikeTab: TSMDBGrid;
    tsMultilined: TTabSheet;
    SMDBGrid1: TSMDBGrid;
    procedure SMDBGridGlyphGetGlyph(Sender: TObject; var Bitmap: TBitmap);
    procedure SMDBGridColorsGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure pcMainChange(Sender: TObject);
    procedure SMDBGridSortTitleClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.DFM}
{$R winxp.res}

procedure TfrmMain.SMDBGridGlyphGetGlyph(Sender: TObject;
  var Bitmap: TBitmap);
begin
  Bitmap := TBitmap.Create;
  Bitmap.Transparent := True;
  if tblReservat.FieldByName('Paid').AsBoolean then
  begin
    Bitmap.TransparentColor := imgGlyph1.Picture.Bitmap.TransparentColor;
    Bitmap.Assign(imgGlyph1.Picture.Bitmap)
  end
  else
  begin
    Bitmap.TransparentColor := imgGlyph2.Picture.Bitmap.TransparentColor;
    Bitmap.Assign(imgGlyph2.Picture.Bitmap);
  end
end;

procedure TfrmMain.SMDBGridColorsGetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if tblReservat.RecNo mod 2 = 0 then
    Background := cl3DLight
end;

procedure TfrmMain.pcMainChange(Sender: TObject);
begin
  {mark columnwith CustNo field}
  with SMDBGridSort do
    (Columns[2] as TSMDBColumn).SortType := stAscending;
end;

procedure TfrmMain.SMDBGridSortTitleClick(Column: TColumn);
begin
  (Column.Grid as TSMDBGrid).ClearSort;
  if Column is TSMDBColumn then
    TSMDBColumn(Column).SortType := stAscending;

  {or
    (Column.Grid as TSMDBGrid).SetSortField(Column.Field, stAscending);
  }
end;

end.
