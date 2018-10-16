{ Copyright (C) 1998-2008, written by Mike Shkolnik, Scalabium Software
  E-Mail: mshkolnik@scalabium
  WEB: http://www.scalabium.com

  Const strings for localization
  freeware SMComponent library

- SMComponents Danish Language File translated by Hüseyin Aliz, haliz@consit.dk  
  
}
unit SMCnst;

interface

{English strings}
const
  strMessage = 'Udskriv...';
  strSaveChanges = 'Er du sikker på at du vil gemme ændringer på Database Serveren?';
  strErrSaveChanges = 'Kan ikke gemme data! Check forbindelsen til serveren eller at data er valideret.';
  strDeleteWarning = 'Er du sikker på at du vil slette tabellen %s?';
  strEmptyWarning = 'Er du sikker på at du vil tømme tabellen %s?';

const
  PopUpCaption: array [0..24] of string =
   ('Tilføj række',
    'Indsæt række',
    'Rediger række',
    'Slet række',
    '-',
    'Udskriv ...',
    'Eksporter ...',
    'Filtrere ...',
    'Søg ...',
    '-',
    'Gem ændringer',
    'Forkast ændringer',
    'Opfrisk',
    '-',
    'Vælg/Fravælg rækker',
       'Vælg række',
       'Vælg Alle rækker',
       '-',
       'FraVælg række',
       'FraVælg Alle rækker',
    '-',
    'Gem kolonne layout',
    'Genopret kolonne layout',
    '-',
    'Konfigurere...');

const //for TSMSetDBGridDialog
  SgbTitle = ' Title ';
  SgbData = ' Data ';
  STitleCaption = 'Tekst:';
  STitleAlignment = 'Justering:';
  STitleColor = 'Baggrund:'; 
  STitleFont = 'Font:';
  SWidth = 'Bredde:';
  SWidthFix = 'tegn';
  SAlignLeft = 'venstre';
  SAlignRight = 'højre';
  SAlignCenter = 'center';
  
const //for TSMDBFilterDialog
  strEqual = 'lig med';
  strNonEqual = 'ikke lig med';
  strNonMore = 'ikke større';
  strNonLess = 'ikke mindre';
  strLessThan = 'mindre end';
  strLargeThan = 'større end';
  strExist = 'tomt';
  strNonExist = 'ikke tomt';
  strIn = 'er i liste';
  strBetween = 'mellem';
  strLike = 'ligner';

  strOR = 'ELLER';
  strAND = 'OG';

  strField = 'Felt';
  strCondition = 'Betingelse';
  strValue = 'Værdi';

  strAddCondition = ' Definer venligst en yderligere betingelse:';
  strSelection = ' Vælg poster via følgende betingelser:';

  strAddToList = 'Tilføj til liste';
  strEditInList = 'Rediger i liste';
  strDeleteFromList = 'Slet fra liste';

  strTemplate = 'Filter skabelon dialog';
  strFLoadFrom = 'Hent fra...';
  strFSaveAs = 'Gem som..';
  strFDescription = 'Beskrivelse';
  strFFileName = 'Fil navn';
  strFCreate = 'Oprettet: %s';
  strFModify = 'Ændret: %s';
  strFProtect = 'Skrivebeskyttet';
  strFProtectErr = 'Filen er beskyttet!';

const //for SMDBNavigator
  SFirstRecord = 'Første række';
  SPriorRecord = 'Forrige række';
  SNextRecord = 'Næste række';
  SLastRecord = 'Sidste række';
  SInsertRecord = 'Indsæt række';
  SCopyRecord = 'Kopier række';
  SDeleteRecord = 'Slet række';
  SEditRecord = 'Rediger række';
  SFilterRecord = 'Filtrere betingelser';
  SFindRecord = 'Søgning af række';
  SPrintRecord = 'Udskrift af rækker';
  SExportRecord = 'Eksport af rækker';
  SImportRecord = 'Import af rækker';
  SPostEdit = 'Gem ændringer';
  SCancelEdit = 'Fortryd ændringer';
  SRefreshRecord = 'Genopfrisk data';
  SChoice = 'Vælg en række';
  SClear = 'Vælg en række til nulstilling';
  SDeleteRecordQuestion = 'Slet en række?';
  SDeleteMultipleRecordsQuestion = 'Vil du virkelig slette valgte rækker?';
  SRecordNotFound = 'Række er ikke fundet';

  SFirstName = 'Første';
  SPriorName = 'Forrige';
  SNextName = 'Næste';
  SLastName = 'Sidste';
  SInsertName = 'Indsæt';
  SCopyName = 'Kopier';
  SDeleteName = 'Slet';
  SEditName = 'Rediger';
  SFilterName = 'Filtrere';
  SFindName = 'Søg';
  SPrintName = 'Udskriv';
  SExportName = 'Eksport';
  SImportName = 'Import';
  SPostName = 'Gem';
  SCancelName = 'Afbryd';
  SRefreshName = 'Genopfrisk';
  SChoiceName = 'Vælg';
  SClearName = 'Nulstil';

  SBtnOk = '&OK';
  SBtnCancel = '&Afbryd';
  SBtnLoad = 'Hent';
  SBtnSave = 'Gem';
  SBtnCopy = 'Kopier';
  SBtnPaste = 'Sæt ind';
  SBtnClear = 'Nulstil';

  SRecNo = 'ræk.';
  SRecOf = ' af ';

const //for EditTyped
  etValidNumber = 'gyldig nummer';
  etValidInteger = 'gyldig heltals nummer';
  etValidDateTime = 'gyldig dato/tid';
  etValidDate = 'gyldig dato';
  etValidTime = 'gyldig tid';
  etValid = 'gyldig';
  etIsNot = 'er ikke';
  etOutOfRange = 'Værdi %s er uden for interval %s..%s';

  SApplyAll = 'Sæt ind for alle';

  SNoDataToDisplay = '<Ingen data at vise>';

implementation

end.
