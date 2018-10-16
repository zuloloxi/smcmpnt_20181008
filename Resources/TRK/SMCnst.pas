{ Copyright (C) 1998-2011, written by Mike Shkolnik, Scalabium Software
  E-Mail: mshkolnik@scalabium
  WEB: http://www.scalabium.com

  Türkçeleþtirme: M. Özgür UÐUR
                  Data Yazýlým Ltd. Ýzmir/Turkiye
				  
  Const strings for localization
  freeware SMComponent library
}
unit SMCnst;

interface

{Turkish strings}
const
  strMessage = 'Yazdýr...';
  strSaveChanges = 'Deðiþiklikleri kaydetmek istediðinize emin misiniz?';
  strErrSaveChanges = 'Veriler kaydedilemedi! Veritabaný baðlantýsýný veya bilgilerinizi kontrol ediniz.';
  strDeleteWarning = '%s tablosunu gerçekten silmek istiyor musunuz?';
  strEmptyWarning = '%s tablosunu gerçekten boþaltmak istiyor musunuz?';

const
  PopUpCaption: array [0..24] of string = 
   ('Ekle', 
    'Araya ekle', 
    'Düzenle', 
    'Sil', 
    '-', 
    'Yazdýr ...', 
    'Export ...', 
    'Filtrele', 
    'Ara ...', 
    '-', 
    'Kaydet', 
    'Vazgeç', 
    'Yenile', 
    '-', 
    'Seç/Seçimi kaldýr', 
      'Seç', 
      'Tümünü seç', 
      '-', 
      'Seçimi kaldýr', 
      'Tümünü kaldýr', 
    '-', 
    'Sütun yapýsýný kaydet', 
    'Sütun yapýsýný yükle', 
    '-', 
    'Ayarlar...'); 

const //for TSMSetDBGridDialog
  SgbTitle = ' Kolon ';
  SgbData = ' Veri ';
  STitleCaption ='Kolon Ýsmi:';
  STitleAlignment = 'Baþlýðý Yasla:';
  STitleColor = 'Arka plan:';
  STitleFont = 	'Yazý karakteri:';
  SWidth = 	'Geniþlik:';
  SWidthFix = 	'Karakter Sayýsý:';
  SAlignLeft = 	'Sola';
  SAlignRight = 'Saða';
  SAlignCenter = 'Ortaya';

const //for TSMDBFilterDialog
  strEqual = 'eþit';
  strNonEqual = 'eþit deðil';
  strNonMore = 'büyük deðil';
  strNonLess = 'küçük deðil';
  strLessThan = 'küçük';
  strLargeThan = 'büyük';
  strExist = 'boþ';
  strNonExist = 'boþ deðil';
  strIn = 'içeren';
  strBetween = 'arasýnda';
  strLike = 'benzer';

  strOR = 'VEYA'; 
  strAND = 'VE';

  strField = 'Alan';
  strCondition = 'Koþul';
  strValue = 'Deðer';

  strAddCondition = ' Koþul ekle:';
  strSelection = ' Sonraki koþullara uyan kayýtlarý seç: ';
  strAddToList = 'Listeye ekle';
  strEditInList = 'Listede düzenle';
  strDeleteFromList = 'Listeden kaldýr';

  strTemplate = 'Filtre þablonu seçimi ';
  strFLoadFrom = 'Yükle...';
  strFSaveAs = 'Farklý kaydet...';
  strFDescription = 'Açýklama';
  strFFileName = 'Dosya ismi';
  strFCreate = '%s oluþturuldu.';
  strFModify = '%s deðiþtirildi.';
  strFProtect = 'Yazmaya karþý korumalý';
  strFProtectErr = 'Korumalý dosya!';

const //for SMDBNavigator
  SFirstRecord = 'Ýlk kayýt';
  SPriorRecord = 'Önceki kayýt';
  SNextRecord =	'Sonraki kayýt';
  SLastRecord =	'Son kayýt';
  SInsertRecord = 'Ekle';
  SCopyRecord =	'Kopyala';
  SDeleteRecord = 'Sil';
  SEditRecord =	'Düzenle';
  SFilterRecord = 'Kriterlere göre süz';
  SFindRecord = 'Kaydý ara';
  SPrintRecord = 'Yazdýr';
  SExportRecord = 'Dýþa ver ...';
  SImportRecord = 'Ýçeri al ...';
  SPostEdit = 'Kaydet';
  SCancelEdit = 'Vazgeç';
  SRefreshRecord = 'Yenile';
  SChoice ='Seç';
  SClear = 'Seçimi kaldýr';
  SDeleteRecordQuestion = 'Kayýt silinsin mi?';
  SDeleteMultipleRecordsQuestion ='Seçili kayýtlarý silmek istediðinizden emin misiniz?';
  SRecordNotFound = 'Kayýt bulunamadý';

  SFirstName = 'Ýlk';
  SPriorName = 'Önceki';	
  SNextName = 'Sonraki';
  SLastName = 'Son';
  SInsertName = 'Ekle';
  SCopyName = 'Kopyala';
  SDeleteName = 'Sil';
  SEditName = 'Düzenle';
  SFilterName = 'Süz';
  SFindName = 'Bul';
  SPrintName = 'Yazdýr';
  SExportName = 'Dýþa aktar';
  SImportName = 'Ýçe aktar';
  SPostName = 'Kaydet';
  SCancelName = 'Vazgeç';
  SRefreshName = 'Yenile';
  SChoiceName ='Seç';
  SClearName = 'Temizle';

  SBtnOk = '&TAMAM';
  SBtnCancel = '&Ýptal';
  SBtnLoad = 'Yükle';
  SBtnSave = 'Kaydet';
  SBtnCopy = 'Kopyala';
  SBtnPaste = 'Yapýþtýr';
  SBtnClear = 'Temizle';

  SRecNo = 'Kayýt no.';
  SRecOf = ' / ';

const //for EditTyped
  etValidNumber = 'sayý';
  etValidInteger = 'tamsayý';
  etValidDateTime = 'tarih/saat';
  etValidDate = 'tarih';
  etValidTime = 'saat';
  etValid = 'geçerli';
  etIsNot = 'hatalý';
  etOutOfRange = '%s deðeri (%s..%s aralýðýnda deðil)';
 
  SApplyAll = 'Tümüne Uygula';

  SNoDataToDisplay = '<Görüntülenecek bilgi bulunamadý>';

  SPrevYear = 'önceki yýl';
  SPrevMonth = 'önceki ay';
  SNextMonth = 'sonraki ay';
  SNextYear = 'sonraki yýl';
implementation

end.
