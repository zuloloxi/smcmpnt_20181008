unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, Grids, DBGrids, SMDBGrid, DBTables;

type
  TfrmMain = class(TForm)
    DataSource1: TDataSource;
    Table1: TTable;
    SMDBGrid1: TSMDBGrid;
    Table1ResNo: TAutoIncField;
    Table1EventNo: TIntegerField;
    Table1CustNo: TIntegerField;
    Table1NumTickets: TIntegerField;
    Table1Amt_Paid: TCurrencyField;
    Table1Pay_Method: TStringField;
    Table1Card_No: TStringField;
    Table1Card_Exp: TDateField;
    Table1Pay_Notes: TMemoField;
    Table1Purge_Date: TDateField;
    Table1Paid: TBooleanField;
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
