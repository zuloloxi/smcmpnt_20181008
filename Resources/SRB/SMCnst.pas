{
  Const strings for localization
  freeware SMComponent library
}
unit SMCnst;

interface

{English strings}
const
  strMessage = '�tampa...';
  strSaveChanges = 'Da li �elite da zapamtite promene u bazi podataka?';
  strErrSaveChanges = 'Podaci se ne mogu zapamtiti. Proverite konekciju sa Serverom ili ispravnost podataka.';
  strDeleteWarning = 'Obrisati tabelu %s?';
  strEmptyWarning = 'Izbrisati tabelu %s?';

const
  PopUpCaption: array [0..24] of string =
   ('Dodaj zapis',
    'Umetni zapis',
    'Promeni zapis',
    'Obri�i zapis',
    '-',
    '�tampaj ...',
    'Export ...',
    'Filter ...',
    'Pretraga ...',
    '-',
    'Snimi promene',
    'Otka�i promene',
    'Osve�avanje',
    '-',
    'Ozna�i/isklju�i zapise',
       'Ozna�i zapis',
       'Ozna�i sve zapise',
       '-',
       'Isklju�i zapise',
       'Isklju�i sve zapise',
    '-',
    'Zapamti raspored kolona',
    'Vrati raspored kolona',
    '-',
    'Pode�avanja...');

const //for TSMSetDBGridDialog
  SgbTitle = ' Naslov ';
  SgbData = ' Podatak ';
  STitleCaption = 'Oznaka:';
  STitleAlignment = 'Poravnanje:';
  STitleColor = 'Pozadina:';
  STitleFont = 'Font:';
  SWidth = '�irina:';
  SWidthFix = 'karakteri';
  SAlignLeft = 'levo';
  SAlignRight = 'desno';
  SAlignCenter = 'centrirano';
  
const //for TSMDBFilterDialog
  strEqual = 'jednako';
  strNonEqual = 'nije jednako';
  strNonMore = 'nije ve�e';
  strNonLess = 'nije manje';
  strLessThan = 'manje od';
  strLargeThan = 'vi�e od';
  strExist = 'prazno';
  strNonExist = 'nije prazno';
  strIn = 'u listi';
  strBetween = 'izme�u';
  strLike = 'kao';

  strOR = 'ILI';
  strAND = 'I';

  strField = 'Polje';
  strCondition = 'Uslov';
  strValue = 'Vrednost';

  strAddCondition = ' Defini�i dodatne uslove:';
  strSelection = ' Ozna�i zapise koji zadovoljavaju usluve:';

  strAddToList = 'Dodaj u listu';
  strEditInList = 'Promeni u listi';
  strDeleteFromList = 'Izbaci iz liste';

  strTemplate = '�ablon filtera';
  strFLoadFrom = 'U�itaj ...';
  strFSaveAs = 'Snimi kao..';
  strFDescription = 'Opis';
  strFFileName = 'Naziv fajla';
  strFCreate = 'Kreiran: %s';
  strFModify = 'Promenjen: %s';
  strFProtect = 'Za�titi od prepisivanja';
  strFProtectErr = 'Fajl je za�ti�en!';

const //for SMDBNavigator
  SFirstRecord = 'Prvi zapis';
  SPriorRecord = 'Prethodni zapis';
  SNextRecord = 'Slede�i zapis';
  SLastRecord = 'Poslednji zapis';
  SInsertRecord = 'Dodaj zapis';
  SCopyRecord = 'Kopiraj zapis';
  SDeleteRecord = 'Obri�i zapis';
  SEditRecord = 'Promeni zapis';
  SFilterRecord = 'Filter';
  SFindRecord = 'Prona�i zapis';
  SPrintRecord = '�tampanje zapisa';
  SExportRecord = 'Izvoz zapisa';
  SImportRecord = 'Uvoz zapisa';
  SPostEdit = '�uvanje promena';
  SCancelEdit = 'Odustajanje od promena';
  SRefreshRecord = 'Osve�avanje podataka';
  SChoice = 'Izbor zapisa';
  SClear = 'Poni�titi izbor zapisa';
  SDeleteRecordQuestion = 'Obrisati zapis?';
  SDeleteMultipleRecordsQuestion = 'Obrisati sve ozna�ene zapise?';
  SRecordNotFound = 'Zapis nije prona�en';

  SFirstName = 'Prvi';
  SPriorName = 'Prethodni';
  SNextName = 'Slede�i';
  SLastName = 'Poslednji';
  SInsertName = 'Dodavanje';
  SCopyName = 'Kopiranje';
  SDeleteName = 'Brisanje';
  SEditName = 'Promena';
  SFilterName = 'Filter';
  SFindName = 'Pretraga';
  SPrintName = '�tampa';
  SExportName = 'Izvoz';
  SImportName = 'Uvoz';
  SPostName = 'Snimi';
  SCancelName = 'Odustani';
  SRefreshName = 'Osve�i';
  SChoiceName = 'Izaberi';
  SClearName = 'O�isti';

  SBtnOk = '&OK';
  SBtnCancel = '&Odustani';
  SBtnLoad = 'U�itaj';
  SBtnSave = 'Snimi';
  SBtnCopy = 'Copy';
  SBtnPaste = 'Paste';
  SBtnClear = 'O�isti';

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
  SNextMonth = 'slede�i mesec';
  SNextYear = 'slede�a godina';

implementation

end.
