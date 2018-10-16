"# smcmpnt 20181008" 

Update: October 08, 2018


 movement from column to column by ENTER key (like TAB)
 multiline wordwrap column titles (partly is transfered from TBitDBGrid - Ilya Andreev, ilya_andreev@geocities.com)
 record selection using the standard checkbox
 editing of boolean fields like checkbox
 glyphs in Indicator column and user Indicator width
 own PopUp menu with standard items (Add/Edit/Delete record, Print/Export data, Save/Cancel changes, Refresh data, Select/UnSelect records, Save/Restore layout, Setup). Using like window system menu!
 fixing of the few columns in horizontal scrolling. Also you can fix it but draw as normal columns
 drawing a pictures in cells for graphic fields
 visible elipsis and dropdown buttons for each record (for Lookup-fields, PickLists etc) (thank to Naohiro Fukuda [nao@nagoya.terracom.co.jp] for idea and sources)
 a convenient select of records from keyboard (is transfered from TRXDBGrid)
 an opportunity to exclude insert and delete of records in the SMDBGrid
 save and restore of the column layout in the registry (column order, width, color etc).
 to delete the all selected records
 Refresh of the data in SMDBGrid (useful for TQuery because Refresh correctly works only for TTable)
 processing of events by pressing on column title (is transfered from TRXDBGrid)
 ability of display of the MEMO/BLOB/PICTURE-fields as Bitmap (is transfered from TRXDBGrid)
 lowered draw of the current selected column (like grid in 1C-accounting)
 to easily display bitmaps in cells based upon any data
 display hints for each cells (if cell text is cutted by column width). This procedure is transfered from TBitDBGrid - Ilya Andreev, ilya_andreev@geocities.com, FIDONet: 2:5030/55.28 AKA 2:5030/402.17
 opportunity to assign of new events: OnAppendRecord, OnEditRecord, OnDeleteRecord, OnPrintData, OnExportData, OnSetupGrid
 event for column title drawing (standard TDBGrid component have the event for data cell drawing only)
 BiDiMode support for middle-east and far-east users
 Windows XP theme support
