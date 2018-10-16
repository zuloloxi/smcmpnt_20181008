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
  strMessage = 'Print...';
  strSaveChanges = 'Wilt u de wijzigen bewaren?';
  strErrSaveChanges = 'Kan de data niet bewaren! Controleer de server verbinding of data validatie.';
  strDeleteWarning = 'Wilt u werkelijk de tabel %s verwijderen?';
  strEmptyWarning = 'Wilt u werkelijk de tabel %s leeg maken?';

const
  PopUpCaption: array [0..24] of string =
   ('Toevoegen record',
    'Invoegen record',
    'Wijzig record',
    'Verwijder record',
    '-',
    'Print ...',
    'Exporteren ...',
    'Filter ...',
    'Zoeken ...',
    '-',
    'Bewaar wijzigingen',
    'Annuleer wijzigingen',
    'Verversen',
    '-',
    'Selecteer/Deselecteer records',
       'Selecteer record',
       'Selecteer alle records',
       '-',
       'Deselecteer record',
       'Deselecteer alle records',
    '-',
    'Bewaar kolom layout',
    'Herstel kolom layout',
    '-',
    'Setup...');

const //for TSMSetDBGridDialog
  SgbTitle = ' Titel ';
  SgbData = ' Data ';
  STitleCaption = 'Kop:';
  STitleAlignment = 'Uitlijnen:';
  STitleColor = 'Achtergrond:'; 
  STitleFont = 'Lettertype:';
  SWidth = 'Breedte:';
  SWidthFix = 'Karakatiers';
  SAlignLeft = 'links';
  SAlignRight = 'rechts';
  SAlignCenter = 'centreren';
  
const //for TSMDBFilterDialog
  strEqual = 'gelijk';
  strNonEqual = 'niet gelijk';
  strNonMore = 'niet groter';
  strNonLess = 'niet minder';
  strLessThan = 'kleiner dan';
  strLargeThan = 'groter dan';
  strExist = 'leeg';
  strNonExist = 'niet leeg';
  strIn = 'in lijst';
  strBetween = 'tussen';
  strLike = 'zelfde';

  strOR = 'of';
  strAND = 'en';

  strField = 'Veld';
  strCondition = 'Voorwaarden';
  strValue = 'Waarden';

  strAddCondition = ' Defineer aanvullende voorwaarden:';
  strSelection = ' selecteer de records volgens de voorwaarden:';

  strAddToList = 'Toevoegen aan lijst';
  strEditInList = 'Wijzig in de lijst';
  strDeleteFromList = 'Verwjder uit de lijst';

  strTemplate = 'Filter template dialoog';
  strFLoadFrom = 'Openen uit...';
  strFSaveAs = 'Bewaren als..';
  strFDescription = 'Omschrijving';
  strFFileName = 'Bestandsnaam';
  strFCreate = 'Aangemaakt: %s';
  strFModify = 'Gewijzigd: %s';
  strFProtect = 'Beveiligd tegen overschrijven';
  strFProtectErr = Bestand is beveiligid!';

const //for SMDBNavigator
  SFirstRecord = 'Eerste record';
  SPriorRecord = 'Vorige record';
  SNextRecord = 'Volgende record';
  SLastRecord = 'Laatste  record';
  SInsertRecord = 'Toevoegen record';
  SCopyRecord = 'Kopieer record';
  SDeleteRecord = 'Verwijder record';
  SEditRecord = 'Wijzig record';
  SFilterRecord = 'Filter voorwaarden';
  SFindRecord = 'Zoeken naar record';
  SPrintRecord = 'Printen records';
  SExportRecord = 'Exporteren records';
  SImportRecord = 'Importeren records';
  SPostEdit = 'Bewaar wijzigingen';
  SCancelEdit = 'Annuleer wijzigen';
  SRefreshRecord = 'Ververs data';
  SChoice = 'Selecteer een record';
  SClear = 'Selecite opheffen';
  SDeleteRecordQuestion = 'Verwijder record?';
  SDeleteMultipleRecordsQuestion = 'Wilt u alle geselecteerd records verwijderen?';
  SRecordNotFound = 'Geen record gevonden';

  SFirstName = 'Eerste';
  SPriorName = 'Vorige';
  SNextName = 'Volgende';
  SLastName = 'Laatste';
  SInsertName = 'Toevoegen';
  SCopyName = 'Kopieer';
  SDeleteName = 'Verwijder';
  SEditName = 'Wijzig';
  SFilterName = 'Filter';
  SFindName = 'Zoeken';
  SPrintName = 'Print';
  SExportName = 'Exporteren';
  SImportName = 'Importeren';
  SPostName = 'Bewaren';
  SCancelName = 'Annuleren';
  SRefreshName = 'Ververs';
  SChoiceName = 'Kies';
  SClearName = 'Leeg maken';

  SBtnOk = '&OK';
  SBtnCancel = '&Annuleer';
  SBtnLoad = 'Openen';
  SBtnSave = 'Bewaren';
  SBtnCopy = 'Kopieer';
  SBtnPaste = 'Plakken';
  SBtnClear = 'Leeg maken';

  SRecNo = 'rec.';
  SRecOf = ' van ';

const //for EditTyped
  etValidNumber = 'geldig nummer';
  etValidInteger = 'geldig integer nummer';
  etValidDateTime = 'geldige datum/tijd';
  etValidDate = 'geldige datum';
  etValidTime = 'geldige tijd';
  etValid = 'geldig(e)';
  etIsNot = 'is geen';
  etOutOfRange = 'waarde %s buiten bereik %s..%s';

  SApplyAll = 'Toepassen op alle';

  SNoDataToDisplay = '<Geen gegevens om weer te geven>';

  SPrevYear = 'voorgaand jaar';
  SPrevMonth = 'Voorgaande maand';
  SNextMonth = 'Volgende maand';
  SNextYear = 'volgend jaarr';

implementation

end.
