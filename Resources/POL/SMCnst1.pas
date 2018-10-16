{ Copyright (C) 1998-2006, written by Mike Shkolnik, Scalabium Software
  E-Mail: mshkolnik@scalabium
  WEB: http://www.scalabium.com

  Const strings for localization
  freeware SMComponent library
}
unit SMCnst;

interface

{English strings}
const
  strMessage = 'Drukuj...';
  strSaveChanges = 'Napewno zapisa� zmiany w bazie danych?';
  strErrSaveChanges = 'Nie mozna zapisac dancyh! Sprawdz po��czenie z serwerem i poprawno�� danych.';
  strDeleteWarning = 'Napewno usun�� tabel� %s?';
  strEmptyWarning = 'Napewno wyczy�ci� tabel� %s?';

const
  PopUpCaption: array [0..24] of string[33] =
   ('Dodaj rekord',
    'Wpisz rekord',
    'Edytuj rekord',
    'Usu� rekord',
    '-',
    'Drukuj ...',
    'Exportuj ...',
    'Filtry ...',
    'Szukaj ...',
    '-',
    'Zapisz zmiany',
    'Cofnij zmiany',
    'Odswiez',
    '-',
    'Zaznacz/Odznacz rekordy',
       'Zaznacz rekord',
       'Zaznacz wszystkie rekordy',
       '-',
       'Odznacz rekord',
       'Odznacz wszystkie rekordy',
    '-',
    'Zapisz ustawienia kolumn',
    'Przywr�� ustawienia kolumn',
    '-',
    'Ustawienia...');

const //for TSMSetDBGridDialog
  SgbTitle = ' Tytu� ';
  SgbData = ' Dane ';
  STitleCaption = 'Tytu�:';
  STitleAlignment = 'Wyr�wnanie:';
  STitleColor = 'T�o:'; 
  STitleFont = 'Font:';
  SWidth = 'Szeroko��:';
  SWidthFix = 'znaki';
  SAlignLeft = 'do lewej';
  SAlignRight = 'do prawej';
  SAlignCenter = 'wy�rodkuj';
  
const //for TSMDBFilterDialog
  strEqual = 'r�wne';
  strNonEqual = 'nie r�wne';
  strNonMore = 'nie wi�ksze';
  strNonLess = 'nie mniejsze';
  strLessThan = 'mniejsze ni�';
  strLargeThan = 'wi�ksze ni�';
  strExist = 'puste';
  strNonExist = 'nie puste';
  strIn = 'na li�cie';
  strBetween = 'mi�dzy';
  strLike = 'podobne do';

  strOR = 'lub';
  strAND = 'i';

  strField = 'Pole';
  strCondition = 'Warunek';
  strValue = 'Warto��';

  strAddCondition = ' Zdefiniuj dodatkowy warunek:';
  strSelection = ' Zaznacz rekordy zgodne z warunkiem:';

  strAddToList = 'Dodaj do listy';
  strEditInList = 'Edytuj na li�cie';
  strDeleteFromList = 'Usu� z listy';

  strTemplate = 'Przyk�adowy dialog filtrowania';
  strFLoadFrom = 'Otw�rz z ...';
  strFSaveAs = 'Zapisz jako..';
  strFDescription = 'Opis';
  strFFileName = 'Nazwa pliku';
  strFCreate = 'Utworzono: %s';
  strFModify = 'Zmodyfikowano: %s';
  strFProtect = 'Tylko do odczytu';
  strFProtectErr = 'Plik zabezpieczony przed zapisem!';

const //for SMDBNavigator
  SFirstRecord = 'Pierwszy rekord';
  SPriorRecord = 'Poprzedni rekord';
  SNextRecord = 'Nast�pny rekord';
  SLastRecord = 'Ostatni rekord';
  SInsertRecord = 'Wpisz rekord';
  SCopyRecord = 'Kopiuj rekord';
  SDeleteRecord = 'Usu� rekord';
  SEditRecord = 'Edytuj rekord';
  SFilterRecord = 'Filtry warunk�w';
  SFindRecord = 'Szukaj rekord�w';
  SPrintRecord = 'Drukuj rekordy';
  SExportRecord = 'Exportuj rekordy';
  SImportRecord = 'Importuj rekordy';
  SPostEdit = 'Zapisz zmiany';
  SCancelEdit = 'Anuluj zmiany';
  SRefreshRecord = 'Od�wie� dane';
  SChoice = 'Wybierz rekord';
  SClear = 'Wyczy�� wybrany rekord';
  SDeleteRecordQuestion = 'Usun�� rekord?';
  SDeleteMultipleRecordsQuestion = 'Napewno usun�� wybrane rekordy?';
  SRecordNotFound = 'Nie znaleziono rekordu';

  SFirstName = 'Pierwszy';
  SPriorName = 'Poprzedni';
  SNextName = 'Nast�pny';
  SLastName = 'Ostatni';
  SInsertName = 'Wpisz';
  SCopyName = 'Kopiuj';
  SDeleteName = 'usu�';
  SEditName = 'Edytuj';
  SFilterName = 'Filtr';
  SFindName = 'Znajd�';
  SPrintName = 'Drukuj';
  SExportName = 'Exportuj';
  SImportName = 'Importuj';
  SPostName = 'Zapisz';
  SCancelName = 'Anuluj';
  SRefreshName = 'Od�wie�';
  SChoiceName = 'Wybierz';
  SClearName = 'Wyczy��';

  SBtnOk = '&OK';
  SBtnCancel = '&Anuluj';
  SBtnLoad = 'Otw�rz';
  SBtnSave = 'Zapisz';
  SBtnCopy = 'Kopiuj';
  SBtnPaste = 'Wklej';
  SBtnClear = 'Wyczy��';

  SRecNo = 'rec.';
  SRecOf = ' of ';

const //for EditTyped
  etValidNumber = 'poprawny numer';
  etValidInteger = 'poprawna liczba';
  etValidDateTime = 'poprawna data\czas';
  etValidDate = 'poprawna data';
  etValidTime = 'poprawny czas';
  etValid = 'poprawne';
  etIsNot = 'nie jest';
  etOutOfRange = 'Warto�� %s jest z poza zakresu %s..%s';

//by RTS
  SPrevYear = 'poprzedni rok';
  SPrevMonth = 'poprzedni miesi�c';
  SNextMonth = 'nast�pny miesi�c';
  SNextYear = 'nast�pny rok';

  SApplyAll = 'Zapisz wszystkie';

  SNoDataToDisplay = '<Brak danych do wy�wietlenia>';

implementation

end.
