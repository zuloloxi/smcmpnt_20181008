unit Main;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, Grids, DBGrids, SMDBGrid;

type
  TfrmMain = class(TForm)
    smdbgClient: TSMDBGrid;
    dSrcClient: TDataSource;
    tblClient: TTable;
    procedure FormCreate(Sender: TObject);
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

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  smdbgClient.ExOptions := smdbgClient.ExOptions + [eoTitleWordWrap, eoRowHeightAutofit, eoCellWordWrap];
end;

end.
