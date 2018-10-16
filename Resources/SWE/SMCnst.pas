{ Copyright (C) 1998-2011, written by Mike Shkolnik, Scalabium Software
  E-Mail: mshkolnik@scalabium
  WEB: http://www.scalabium.com

  Const strings for localization
  freeware SMComponent library
}
unit SMCnst;

interface

{English strings}
const
  strMessage = 'Skriv ut...';
  strSaveChanges = 'Vill du verkligen spara ändringarna på databasservern?';
  strErrSaveChanges = 'Kan inte spara uppgifter! Kontrollera förbindelsen med servern eller validera uppgifterna.';
  strDeleteWarning = 'Vill du verkligen ta bort tabellen %s?';
  strEmptyWarning = 'Vill du verkligen tömma tabellen %s?';

const
  PopUpCaption: array [0..24] of string =
   ('Lägg till post',
    'Infoga post',
    'Ändra post',
    'Radera post',
    '-',
    'Skriv ut ...',
    'Exportera ...',
    'Filtrera ...',
    'Sök ...',
    '-',
    'Spara ändringar',
    'Annulera ändringarna',
    'Uppdatera',
    '-',
    'Markera/Avmarkera poster',
       'Markera post',
       'Markera alla poster',
       '-',
       'Avmarkera post',
       'Avmarkera alla poster',
    '-',
    'Spara kolumnlayout',
    'Återställ kolumnlayout',
    '-',
    'Inställningar...');

const //for TSMSetDBGridDialog
  SgbTitle = ' Rubrik ';
  SgbData = ' Uppgifter ';
  STitleCaption = 'Rubrik:';
  STitleAlignment = 'Justering:';
  STitleColor = 'Bakgrund:';
  STitleFont = 'Teckensnitt:';
  SWidth = 'Bredd:';
  SWidthFix = 'tecken';
  SAlignLeft = 'vänster';
  SAlignRight = 'höger';
  SAlignCenter = 'mitten';

const //for TSMDBFilterDialog
  strEqual = 'lika med';
  strNonEqual = 'inte lika med';
  strNonMore = 'inte större';
  strNonLess = 'inte mindre';
  strLessThan = 'mindre än';
  strLargeThan = 'större än';
  strExist = 'tom';
  strNonExist = 'inte tom';
  strIn = 'i listan';
  strBetween = 'mellan';
  strLike = 'liknande';

  strOR = 'ELLER';
  strAND = 'OCH';

  strField = 'Fält';
  strCondition = 'Villkor';
  strValue = 'Värde';

  strAddCondition = ' Definiera ytterligare villkor:';
  strSelection = ' Markera posterna med nästa villkor:';

  strAddToList = 'Lägg till listan';
  strEditInList = 'Redigera i listan';
  strDeleteFromList = 'Ta bort från listan';

  strTemplate = 'Filtermall-dialog';
  strFLoadFrom = 'Läs in från...';
  strFSaveAs = 'Spara som..';
  strFDescription = 'Beskrivning';
  strFFileName = 'Filnamn';
  strFCreate = 'Skapad: %s';
  strFModify = 'Ändrad: %s';
  strFProtect = 'Skydda mot överskrift';
  strFProtectErr = 'Filen är skyddad!';

const //for SMDBNavigator
  SFirstRecord = 'Första posten';
  SPriorRecord = 'Föregående post';
  SNextRecord = 'Nästa post';
  SLastRecord = 'Sista posten';
  SInsertRecord = 'Infoga post';
  SCopyRecord = 'Kopiera posten';
  SDeleteRecord = 'Radera posten';
  SEditRecord = 'Ändra posten';
  SFilterRecord = 'Filtervillkor';
  SFindRecord = 'Sök efter post';
  SPrintRecord = 'Skriv ut posterna';
  SExportRecord = 'Exportera posterna';
  SImportRecord = 'Importera poster';
  SPostEdit = 'Spara ändringarna';
  SCancelEdit = 'Avbryt ändringarna';
  SRefreshRecord = 'Uppdatera uppgifter';
  SChoice = 'Välj en post';
  SClear = 'Töm vald post';
  SDeleteRecordQuestion = 'Radera posten?';
  SDeleteMultipleRecordsQuestion = 'Vill du verkligen ta bort valda poster?';
  SRecordNotFound = 'Posten kan inte hittas';

  SFirstName = 'Första';
  SPriorName = 'Föregående';
  SNextName = 'Nästa';
  SLastName = 'Sista';
  SInsertName = 'Infoga';
  SCopyName = 'Kopiera';
  SDeleteName = 'Radera';
  SEditName = 'Ändra';
  SFilterName = 'Filtrera';
  SFindName = 'Sök';
  SPrintName = 'Skriv ut';
  SExportName = 'Exportera';
  SImportName = 'Importera';
  SPostName = 'Spara';
  SCancelName = 'Avbryt';
  SRefreshName = 'Uppdatera';
  SChoiceName = 'Välj';
  SClearName = 'Töm';

  SBtnOk = '&OK';
  SBtnCancel = '&Avbryt';
  SBtnLoad = 'Läs in';
  SBtnSave = 'Spara';
  SBtnCopy = 'Kopiera';
  SBtnPaste = 'Klistra in';
  SBtnClear = 'Töm';

  SRecNo = 'post.';
  SRecOf = ' av ';

const //for EditTyped
  etValidNumber = 'giltigt nummer';
  etValidInteger = 'giltigt heltal';
  etValidDateTime = 'giltigt datum/tid';
  etValidDate = 'giltigt datum';
  etValidTime = 'giltig tid';
  etValid = 'giltigt';
  etIsNot = 'är inte ett';
  etOutOfRange = 'Värde %s utanför intervallet %s..%s';

  SApplyAll = 'Tillämpa på alla';

  SNoDataToDisplay = '<Inga uppgifter att visa>';

  SPrevYear = 'föregående år';
  SPrevMonth = 'föregående månad';
  SNextMonth = 'nästa månad';
  SNextYear = 'nästa år';

implementation

end.


