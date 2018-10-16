{ Copyright (C) 1998-2011, written by Mike Shkolnik, Scalabium Software
  E-Mail: mshkolnik@scalabium
  WEB: http://www.scalabium.com

  T�rk�ele�tirme: M. �zg�r U�UR
                  Data Yaz�l�m Ltd. �zmir/Turkiye
				  
  Const strings for localization
  freeware SMComponent library
}
unit SMCnst;

interface

{Turkish strings}
const
  strMessage = 'Yazd�r...';
  strSaveChanges = 'De�i�iklikleri kaydetmek istedi�inize emin misiniz?';
  strErrSaveChanges = 'Veriler kaydedilemedi! Veritaban� ba�lant�s�n� veya bilgilerinizi kontrol ediniz.';
  strDeleteWarning = '%s tablosunu ger�ekten silmek istiyor musunuz?';
  strEmptyWarning = '%s tablosunu ger�ekten bo�altmak istiyor musunuz?';

const
  PopUpCaption: array [0..24] of string = 
   ('Ekle', 
    'Araya ekle', 
    'D�zenle', 
    'Sil', 
    '-', 
    'Yazd�r ...', 
    'Export ...', 
    'Filtrele', 
    'Ara ...', 
    '-', 
    'Kaydet', 
    'Vazge�', 
    'Yenile', 
    '-', 
    'Se�/Se�imi kald�r', 
      'Se�', 
      'T�m�n� se�', 
      '-', 
      'Se�imi kald�r', 
      'T�m�n� kald�r', 
    '-', 
    'S�tun yap�s�n� kaydet', 
    'S�tun yap�s�n� y�kle', 
    '-', 
    'Ayarlar...'); 

const //for TSMSetDBGridDialog
  SgbTitle = ' Kolon ';
  SgbData = ' Veri ';
  STitleCaption ='Kolon �smi:';
  STitleAlignment = 'Ba�l��� Yasla:';
  STitleColor = 'Arka plan:';
  STitleFont = 	'Yaz� karakteri:';
  SWidth = 	'Geni�lik:';
  SWidthFix = 	'Karakter Say�s�:';
  SAlignLeft = 	'Sola';
  SAlignRight = 'Sa�a';
  SAlignCenter = 'Ortaya';

const //for TSMDBFilterDialog
  strEqual = 'e�it';
  strNonEqual = 'e�it de�il';
  strNonMore = 'b�y�k de�il';
  strNonLess = 'k���k de�il';
  strLessThan = 'k���k';
  strLargeThan = 'b�y�k';
  strExist = 'bo�';
  strNonExist = 'bo� de�il';
  strIn = 'i�eren';
  strBetween = 'aras�nda';
  strLike = 'benzer';

  strOR = 'VEYA'; 
  strAND = 'VE';

  strField = 'Alan';
  strCondition = 'Ko�ul';
  strValue = 'De�er';

  strAddCondition = ' Ko�ul ekle:';
  strSelection = ' Sonraki ko�ullara uyan kay�tlar� se�: ';
  strAddToList = 'Listeye ekle';
  strEditInList = 'Listede d�zenle';
  strDeleteFromList = 'Listeden kald�r';

  strTemplate = 'Filtre �ablonu se�imi ';
  strFLoadFrom = 'Y�kle...';
  strFSaveAs = 'Farkl� kaydet...';
  strFDescription = 'A��klama';
  strFFileName = 'Dosya ismi';
  strFCreate = '%s olu�turuldu.';
  strFModify = '%s de�i�tirildi.';
  strFProtect = 'Yazmaya kar�� korumal�';
  strFProtectErr = 'Korumal� dosya!';

const //for SMDBNavigator
  SFirstRecord = '�lk kay�t';
  SPriorRecord = '�nceki kay�t';
  SNextRecord =	'Sonraki kay�t';
  SLastRecord =	'Son kay�t';
  SInsertRecord = 'Ekle';
  SCopyRecord =	'Kopyala';
  SDeleteRecord = 'Sil';
  SEditRecord =	'D�zenle';
  SFilterRecord = 'Kriterlere g�re s�z';
  SFindRecord = 'Kayd� ara';
  SPrintRecord = 'Yazd�r';
  SExportRecord = 'D��a ver ...';
  SImportRecord = '��eri al ...';
  SPostEdit = 'Kaydet';
  SCancelEdit = 'Vazge�';
  SRefreshRecord = 'Yenile';
  SChoice ='Se�';
  SClear = 'Se�imi kald�r';
  SDeleteRecordQuestion = 'Kay�t silinsin mi?';
  SDeleteMultipleRecordsQuestion ='Se�ili kay�tlar� silmek istedi�inizden emin misiniz?';
  SRecordNotFound = 'Kay�t bulunamad�';

  SFirstName = '�lk';
  SPriorName = '�nceki';	
  SNextName = 'Sonraki';
  SLastName = 'Son';
  SInsertName = 'Ekle';
  SCopyName = 'Kopyala';
  SDeleteName = 'Sil';
  SEditName = 'D�zenle';
  SFilterName = 'S�z';
  SFindName = 'Bul';
  SPrintName = 'Yazd�r';
  SExportName = 'D��a aktar';
  SImportName = '��e aktar';
  SPostName = 'Kaydet';
  SCancelName = 'Vazge�';
  SRefreshName = 'Yenile';
  SChoiceName ='Se�';
  SClearName = 'Temizle';

  SBtnOk = '&TAMAM';
  SBtnCancel = '&�ptal';
  SBtnLoad = 'Y�kle';
  SBtnSave = 'Kaydet';
  SBtnCopy = 'Kopyala';
  SBtnPaste = 'Yap��t�r';
  SBtnClear = 'Temizle';

  SRecNo = 'Kay�t no.';
  SRecOf = ' / ';

const //for EditTyped
  etValidNumber = 'say�';
  etValidInteger = 'tamsay�';
  etValidDateTime = 'tarih/saat';
  etValidDate = 'tarih';
  etValidTime = 'saat';
  etValid = 'ge�erli';
  etIsNot = 'hatal�';
  etOutOfRange = '%s de�eri (%s..%s aral���nda de�il)';
 
  SApplyAll = 'T�m�ne Uygula';

  SNoDataToDisplay = '<G�r�nt�lenecek bilgi bulunamad�>';

  SPrevYear = '�nceki y�l';
  SPrevMonth = '�nceki ay';
  SNextMonth = 'sonraki ay';
  SNextYear = 'sonraki y�l';
implementation

end.
