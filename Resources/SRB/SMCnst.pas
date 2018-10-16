{
  Const strings for localization
  freeware SMComponent library
}
unit SMCnst;

interface

{English strings}
const
  strMessage = 'Štampa...';
  strSaveChanges = 'Da li želite da zapamtite promene u bazi podataka?';
  strErrSaveChanges = 'Podaci se ne mogu zapamtiti. Proverite konekciju sa Serverom ili ispravnost podataka.';
  strDeleteWarning = 'Obrisati tabelu %s?';
  strEmptyWarning = 'Izbrisati tabelu %s?';

const
  PopUpCaption: array [0..24] of string =
   ('Dodaj zapis',
    'Umetni zapis',
    'Promeni zapis',
    'Obriši zapis',
    '-',
    'Štampaj ...',
    'Export ...',
    'Filter ...',
    'Pretraga ...',
    '-',
    'Snimi promene',
    'Otkaži promene',
    'Osvežavanje',
    '-',
    'Oznaèi/iskljuèi zapise',
       'Oznaèi zapis',
       'Oznaèi sve zapise',
       '-',
       'Iskljuèi zapise',
       'Iskljuèi sve zapise',
    '-',
    'Zapamti raspored kolona',
    'Vrati raspored kolona',
    '-',
    'Podešavanja...');

const //for TSMSetDBGridDialog
  SgbTitle = ' Naslov ';
  SgbData = ' Podatak ';
  STitleCaption = 'Oznaka:';
  STitleAlignment = 'Poravnanje:';
  STitleColor = 'Pozadina:';
  STitleFont = 'Font:';
  SWidth = 'Širina:';
  SWidthFix = 'karakteri';
  SAlignLeft = 'levo';
  SAlignRight = 'desno';
  SAlignCenter = 'centrirano';
  
const //for TSMDBFilterDialog
  strEqual = 'jednako';
  strNonEqual = 'nije jednako';
  strNonMore = 'nije veæe';
  strNonLess = 'nije manje';
  strLessThan = 'manje od';
  strLargeThan = 'više od';
  strExist = 'prazno';
  strNonExist = 'nije prazno';
  strIn = 'u listi';
  strBetween = 'izmeðu';
  strLike = 'kao';

  strOR = 'ILI';
  strAND = 'I';

  strField = 'Polje';
  strCondition = 'Uslov';
  strValue = 'Vrednost';

  strAddCondition = ' Definiši dodatne uslove:';
  strSelection = ' Oznaèi zapise koji zadovoljavaju usluve:';

  strAddToList = 'Dodaj u listu';
  strEditInList = 'Promeni u listi';
  strDeleteFromList = 'Izbaci iz liste';

  strTemplate = 'Šablon filtera';
  strFLoadFrom = 'Uèitaj ...';
  strFSaveAs = 'Snimi kao..';
  strFDescription = 'Opis';
  strFFileName = 'Naziv fajla';
  strFCreate = 'Kreiran: %s';
  strFModify = 'Promenjen: %s';
  strFProtect = 'Zaštiti od prepisivanja';
  strFProtectErr = 'Fajl je zaštiæen!';

const //for SMDBNavigator
  SFirstRecord = 'Prvi zapis';
  SPriorRecord = 'Prethodni zapis';
  SNextRecord = 'Sledeæi zapis';
  SLastRecord = 'Poslednji zapis';
  SInsertRecord = 'Dodaj zapis';
  SCopyRecord = 'Kopiraj zapis';
  SDeleteRecord = 'Obriši zapis';
  SEditRecord = 'Promeni zapis';
  SFilterRecord = 'Filter';
  SFindRecord = 'Pronaði zapis';
  SPrintRecord = 'Štampanje zapisa';
  SExportRecord = 'Izvoz zapisa';
  SImportRecord = 'Uvoz zapisa';
  SPostEdit = 'Èuvanje promena';
  SCancelEdit = 'Odustajanje od promena';
  SRefreshRecord = 'Osvežavanje podataka';
  SChoice = 'Izbor zapisa';
  SClear = 'Poništiti izbor zapisa';
  SDeleteRecordQuestion = 'Obrisati zapis?';
  SDeleteMultipleRecordsQuestion = 'Obrisati sve oznaèene zapise?';
  SRecordNotFound = 'Zapis nije pronaðen';

  SFirstName = 'Prvi';
  SPriorName = 'Prethodni';
  SNextName = 'Sledeæi';
  SLastName = 'Poslednji';
  SInsertName = 'Dodavanje';
  SCopyName = 'Kopiranje';
  SDeleteName = 'Brisanje';
  SEditName = 'Promena';
  SFilterName = 'Filter';
  SFindName = 'Pretraga';
  SPrintName = 'Štampa';
  SExportName = 'Izvoz';
  SImportName = 'Uvoz';
  SPostName = 'Snimi';
  SCancelName = 'Odustani';
  SRefreshName = 'Osveži';
  SChoiceName = 'Izaberi';
  SClearName = 'Oèisti';

  SBtnOk = '&OK';
  SBtnCancel = '&Odustani';
  SBtnLoad = 'Uèitaj';
  SBtnSave = 'Snimi';
  SBtnCopy = 'Copy';
  SBtnPaste = 'Paste';
  SBtnClear = 'Oèisti';

  SRecNo = 'zap.';
  SRecOf = ' od ';

const //for EditTyped
  etValidNumber = 'valid number';
  etValidInteger = 'valid integer number';
  etValidDateTime = 'valid date/time';
  etValidDate = 'valid date';
  etValidTime = 'valid time';
  etValid = 'valid';
  etIsNot = 'is not a';
  etOutOfRange = 'Value %s out of range %s..%s';

  SApplyAll = 'Apply to All';

  SNoDataToDisplay = '<Nema podataka za prikaz>';

  SPrevYear = 'prethodna godina';
  SPrevMonth = 'prethodni mesec';
  SNextMonth = 'sledeæi mesec';
  SNextYear = 'sledeæa godina';

implementation

end.
