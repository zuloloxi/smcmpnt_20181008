unit Main;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, SMDBGrid, Db, DBClient;

type
  TfrmMain = class(TForm)
    dSrcCountry: TDataSource;
    cdsCountry: TClientDataSet;
    SMDBGrid1: TSMDBGrid;
    procedure SMDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.DFM}

procedure TfrmMain.SMDBGrid1GetCellParams(Sender: TObject; Field: TField;
  AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if Assigned(Field) and
     (Field.FieldName = 'Capital') and (Pos('o', Field.AsString) > 0) then
    Background := clRed
end;

end.
