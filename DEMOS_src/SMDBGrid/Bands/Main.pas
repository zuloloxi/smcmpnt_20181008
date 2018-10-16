unit Main;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, SMDBGrid, Db, DBTables;

type
  TfrmMain = class(TForm)
    Table1: TTable;
    DataSource1: TDataSource;
    SMDBGrid1: TSMDBGrid;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.DFM}

end.
