{ Copyright (C) 1998-2011, written by Mike Shkolnik, Scalabium Software
  E-Mail: mshkolnik@scalabium
  WEB: http://www.scalabium.com

  Const strings for localization
  freeware SMComponent library
}
unit SMCnst;

interface

{Slovak strings}
{Na verziu SMComponent library v3.9 upravil Peter Kop�a - AZsoft - azsoft@azsoft.sk}

const
  strMessage = 'Tla�...';
  strSaveChanges = 'Chcete zap�sa� zmeny do Datab�zov�ho Servera?';
  strErrSaveChanges = 'Nemo�no vykona� z�pis. Skontrolujte platnos� d�t alebo konektivitu so Serverom.';
  strDeleteWarning = 'Chcete naozaj vymaza� tabu�ku %s?';
  strEmptyWarning = 'Chcete naozaj vypr�zni� tabu�ku %s?';

const
  PopUpCaption: array [0..24] of string =
   ('Nov� z�znam',
    'Vlo�i� z�znam',
    'Oprava',
    'Vymaza� z�znam',
    '-',
    'Tla� ...',
    'Export ...',
    'Filter ...',
    'H�ada� ...',
    '-',
    'Ulo�i� zmeny',
    'Vr�ti� zmeny',
    'Refresh',
    '-',
    'Ozna�i�/ODzna�i� z�znamy',
       'Ozna�i� z�znam',
       'Ozna�i� V�etky z�znamy',
       '-',
       'ODzna�i� z�znam',
       'ODzna�i� V�etky z�znamy',
    '-',
    'Ulo�i� �trukt�ru st�pcov',
    'Na��ta� �trukt�ru st�pcov',
    '-',
    'Setup...');

const //for TSMSetDBGridDialog
  SgbTitle = ' Titulok ';
  SgbData = ' Data ';
  STitleCaption = 'N�lepka:';
  STitleAlignment = 'Zarovnanie:';
  STitleColor = 'Pozadie:';
  STitleFont = 'P�smo:';
  SWidth = '��rka:';
  SWidthFix = 'znaky';
  SAlignLeft = 'v�avo';
  SAlignRight = 'vpravo';
  SAlignCenter = 'do stredu';

const //for TSMDBFilterDialog
  strEqual = 'rovn� sa';
  strNonEqual = 'nerovn� sa';
  strNonMore = 'je men�� alebo sa rovn�';
  strNonLess = 'je v��� alebo sa rovn�';
  strLessThan = 'je men��';
  strLargeThan = 'je v���';
  strExist = 'pr�zdny';
  strNonExist = 'nepr�zdny';
  strIn = 'sa nach�dza v';
  strBetween = 'je v rozsahu';
  strLike = 'podobn�';

  strOR = 'alebo';
  strAND = 'a s��astne';

  strField = 'Polo�ka';
  strCondition = 'Podmienka';
  strValue = 'Hodnota';

  strAddCondition = ' Definovanie dodato�nej podmienky: ';
  strSelection = ' Zoznam z�znamov pre n�sledn� podmienky:';

  strAddToList = 'Prida� do zoznamu';
  strEditInList = 'Upravi� v zozname';
  strDeleteFromList = 'Odstr�ni� zo zoznamu';

  strTemplate = 'Filter template dialog';
  strFLoadFrom = 'Na��ta� z...';  // New constatns
  strFSaveAs = 'Ulo�i� ako..';
  strFDescription = 'Popis';
  strFFileName = 'N�zov';
  strFCreate = 'Vytvoren� : %s';
  strFModify = 'Upraven�  : %s';
  strFProtect = 'Zamedzi� prep�saniu';
  strFProtectErr = 'S�bor nemo�no prep�sa� !';

const //for SMDBNavigator
  SFirstRecord = 'Prv� z�znam';
  SPriorRecord = 'Predch�dzaj�ci record';
  SNextRecord = '�al�� z�znam';
  SLastRecord = 'Posledn� z�znam';
  SInsertRecord = 'Vlo�i� z�znam';
  SCopyRecord = 'Kop�rova� z�znam';
  SDeleteRecord = 'Vymaza� z�znam';
  SEditRecord = 'Upravi� z�znam';
  SFilterRecord = 'Filtrovacia podmienka';
  SFindRecord = 'H�adanie v z�znamoch';
  SPrintRecord = 'Tla�enie z�znamov';
  SExportRecord = 'Exportovanie z�znamov';
  SImportRecord = 'Importovanie z�znamov';
  SPostEdit = 'Ulo�enie zmien';
  SCancelEdit = 'Ukon�enie zmien';
  SRefreshRecord = 'Obnovi� d�ta';
  SChoice = 'Vyberte si z�znam';
  SClear = 'Ostra�ujem vybran� z�znamy';
  SDeleteRecordQuestion = 'Vymaza� z�znam?';
  SDeleteMultipleRecordsQuestion = 'Skuto�ne chcete vymaza� vybran� z�znamy?';
  SRecordNotFound = 'Z�znam sa nena�iel';

  SFirstName = 'Prv�';
  SPriorName = 'Predch�dzaj�ci';
  SNextName = 'Nasledovn�';
  SLastName = 'Posledn�';
  SInsertName = 'Vlo�i�';
  SCopyName = 'Kop�rova�';
  SDeleteName = 'Vymaza�';
  SEditName = 'Upravi�';
  SFilterName = 'Filter';
  SFindName = 'H�adanie';
  SPrintName = 'Tla�';
  SExportName = 'Export';
  SImportName = 'Import';
  SPostName = 'Ulo�i�';
  SCancelName = 'Storno';
  SRefreshName = 'Obnovi�';
  SChoiceName = 'Vo�ba';
  SClearName = 'Odstr�ni�';

  SBtnOk = '&OK';
  SBtnCancel = '&N�vrat';
  SBtnLoad = 'Na��ta�';
  SBtnSave = 'Ulo�i�';
  SBtnCopy = 'Kop�rova�';
  SBtnPaste = 'Vlo�i�';
  SBtnClear = 'Odstr�ni�';

  SRecNo = 'z�z.';
  SRecOf = ' z ';

const //for EditTyped
  etValidNumber = 'platn� ��slo';
  etValidInteger = 'platn� num.hodnota';
  etValidDateTime = 'platn� d�tum/�as';
  etValidDate = 'platn� d�tum';
  etValidTime = 'platn� �as';
  etValid = 'platn�';
  etIsNot = 'Nie je';
  etOutOfRange = 'Hodnota %s je mimo rozsahu %s..%s';

  SApplyAll = 'Pou�i� na v�etko';

  SNoDataToDisplay = '<�iadne �daje>';

  SPrevYear = 'predch�dzaj�ci rok';
  SPrevMonth = 'predch�dzaj�ci mesiac';
  SNextMonth = 'nasleduj�ci mesiac';
  SNextYear = 'nasleduj�ci rok';

implementation

end.
