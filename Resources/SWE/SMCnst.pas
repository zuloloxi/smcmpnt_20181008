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
  strSaveChanges = 'Vill du verkligen spara �ndringarna p� databasservern?';
  strErrSaveChanges = 'Kan inte spara uppgifter! Kontrollera f�rbindelsen med servern eller validera uppgifterna.';
  strDeleteWarning = 'Vill du verkligen ta bort tabellen %s?';
  strEmptyWarning = 'Vill du verkligen t�mma tabellen %s?';

const
  PopUpCaption: array [0..24] of string =
   ('L�gg till post',
    'Infoga post',
    '�ndra post',
    'Radera post',
    '-',
    'Skriv ut ...',
    'Exportera ...',
    'Filtrera ...',
    'S�k ...',
    '-',
    'Spara �ndringar',
    'Annulera �ndringarna',
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
    '�terst�ll kolumnlayout',
    '-',
    'Inst�llningar...');

const //for TSMSetDBGridDialog
  SgbTitle = ' Rubrik ';
  SgbData = ' Uppgifter ';
  STitleCaption = 'Rubrik:';
  STitleAlignment = 'Justering:';
  STitleColor = 'Bakgrund:';
  STitleFont = 'Teckensnitt:';
  SWidth = 'Bredd:';
  SWidthFix = 'tecken';
  SAlignLeft = 'v�nster';
  SAlignRight = 'h�ger';
  SAlignCenter = 'mitten';

const //for TSMDBFilterDialog
  strEqual = 'lika med';
  strNonEqual = 'inte lika med';
  strNonMore = 'inte st�rre';
  strNonLess = 'inte mindre';
  strLessThan = 'mindre �n';
  strLargeThan = 'st�rre �n';
  strExist = 'tom';
  strNonExist = 'inte tom';
  strIn = 'i listan';
  strBetween = 'mellan';
  strLike = 'liknande';

  strOR = 'ELLER';
  strAND = 'OCH';

  strField = 'F�lt';
  strCondition = 'Villkor';
  strValue = 'V�rde';

  strAddCondition = ' Definiera ytterligare villkor:';
  strSelection = ' Markera posterna med n�sta villkor:';

  strAddToList = 'L�gg till listan';
  strEditInList = 'Redigera i listan';
  strDeleteFromList = 'Ta bort fr�n listan';

  strTemplate = 'Filtermall-dialog';
  strFLoadFrom = 'L�s in fr�n...';
  strFSaveAs = 'Spara som..';
  strFDescription = 'Beskrivning';
  strFFileName = 'Filnamn';
  strFCreate = 'Skapad: %s';
  strFModify = '�ndrad: %s';
  strFProtect = 'Skydda mot �verskrift';
  strFProtectErr = 'Filen �r skyddad!';

const //for SMDBNavigator
  SFirstRecord = 'F�rsta posten';
  SPriorRecord = 'F�reg�ende post';
  SNextRecord = 'N�sta post';
  SLastRecord = 'Sista posten';
  SInsertRecord = 'Infoga post';
  SCopyRecord = 'Kopiera posten';
  SDeleteRecord = 'Radera posten';
  SEditRecord = '�ndra posten';
  SFilterRecord = 'Filtervillkor';
  SFindRecord = 'S�k efter post';
  SPrintRecord = 'Skriv ut posterna';
  SExportRecord = 'Exportera posterna';
  SImportRecord = 'Importera poster';
  SPostEdit = 'Spara �ndringarna';
  SCancelEdit = 'Avbryt �ndringarna';
  SRefreshRecord = 'Uppdatera uppgifter';
  SChoice = 'V�lj en post';
  SClear = 'T�m vald post';
  SDeleteRecordQuestion = 'Radera posten?';
  SDeleteMultipleRecordsQuestion = 'Vill du verkligen ta bort valda poster?';
  SRecordNotFound = 'Posten kan inte hittas';

  SFirstName = 'F�rsta';
  SPriorName = 'F�reg�ende';
  SNextName = 'N�sta';
  SLastName = 'Sista';
  SInsertName = 'Infoga';
  SCopyName = 'Kopiera';
  SDeleteName = 'Radera';
  SEditName = '�ndra';
  SFilterName = 'Filtrera';
  SFindName = 'S�k';
  SPrintName = 'Skriv ut';
  SExportName = 'Exportera';
  SImportName = 'Importera';
  SPostName = 'Spara';
  SCancelName = 'Avbryt';
  SRefreshName = 'Uppdatera';
  SChoiceName = 'V�lj';
  SClearName = 'T�m';

  SBtnOk = '&OK';
  SBtnCancel = '&Avbryt';
  SBtnLoad = 'L�s in';
  SBtnSave = 'Spara';
  SBtnCopy = 'Kopiera';
  SBtnPaste = 'Klistra in';
  SBtnClear = 'T�m';

  SRecNo = 'post.';
  SRecOf = ' av ';

const //for EditTyped
  etValidNumber = 'giltigt nummer';
  etValidInteger = 'giltigt heltal';
  etValidDateTime = 'giltigt datum/tid';
  etValidDate = 'giltigt datum';
  etValidTime = 'giltig tid';
  etValid = 'giltigt';
  etIsNot = '�r inte ett';
  etOutOfRange = 'V�rde %s utanf�r intervallet %s..%s';

  SApplyAll = 'Till�mpa p� alla';

  SNoDataToDisplay = '<Inga uppgifter att visa>';

  SPrevYear = 'f�reg�ende �r';
  SPrevMonth = 'f�reg�ende m�nad';
  SNextMonth = 'n�sta m�nad';
  SNextYear = 'n�sta �r';

implementation

end.


