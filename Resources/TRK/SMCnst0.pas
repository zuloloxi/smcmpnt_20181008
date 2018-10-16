unit SMCnst;

interface

{English strings}
const
 strMessage = 'Yazdır...';
 strSaveChanges = 'Database Server''a bilgileri yazmak istediğinize emin misiniz?';
 strErrSaveChanges = 'Veriler kaydedilemedi. Veri taban bağlantısını ve/veya datalar kontrol ediniz.';
 strDeleteWarning = '%s tablosunu gerçekten silmek istiyor musunuz?';
 strEmptyWarning = '%s tablosunu gerçekten boaltmak istiyor musunuz?';

const
 PopUpCaption: array [0..24] of string[33] = 
 ('Kayıt ekle', 
 'Araya ekle', 
 'Kaydı düzelt', 
 'Kaydı sil', 
 '-', 
 'Yazdır ...', 
 'İhraç ...', 
 'Filtreleme', 
 'Ara-Bul...', 
 '-', 
 'Değişiklikleri kaydet', 
 'Değişiklikleri iptal et', 
 'Görüntüyü Yenile', 
 '-', 
 'Kaydı seç/seçimi kaldır', 
 'Kaydı seç', 
 'Tüm kayıtları seç', 
 '-', 
 'Seçimden çıkar', 
 'Tüm Kayıt seçimini kaldır', 
 '-', 
 'Sütun yapısını kaydet', 
 'Sütun yapısını yükle', 
 '-', 
 'Ayarlar...'); 
 
const //for TSMSetDBGridDialog
 SgbTitle = ' Başlık ';
 SgbData = ' Veri ';
 STitleCaption ='Manet';
 STitleAlignment = 'Yn:';
 STitleColor = 'Arkaplan';
 STitleFont = 	'Yazı karakteri';
 SWidth = 	'Genişlik';
 SWidthFix = 	'karakter';
 SAlignLeft = 	'sol';
 SAlignRight = 'sağ';
 SAlignCenter = 'merkez';
 
const //for TSMDBFilterDialog
 strEqual =	'eşit';
 strNonEqual = 	'eşit deil';
 strNonMore = 	'daha fazla değil';
 strNonLess = 'daha az değil';
 strLessThan = 'daha küçük';
 strLargeThan = 	'daha büyük';
 strExist =	'boş';
 strNonExist = 	'boş deil';
 strIn = 'liste içinde';
 strBetween = 'arasında';
 strLike = 'benzer';

 strOR = 	'VEYA';
 strAND = 		'VE';

 strField = 	'Alan';
 strCondition = 	'Kriter';
 strValue =	'Değer';

 strAddCondition = ' Ek kriteri tanımlayın:';
 strSelection = ' Diğer kritere dayanarak kayıtları seçin: ';
 strAddToList = 'Listeye ekle';
 strEditInList = 'Liste içinde düzenle';
 strDeleteFromList = 'Listeden sil';

 strTemplate = 'Şablon diyaloğu süz';
 strFLoadFrom = 'Dosyadan Yükle';
 strFSaveAs = 'Farklı kaydet...';
 strFDescription = 'Tanım';
 strFFileName = 'Dosya adı';
 strFCreate = '%s Oluşturuldu';
 strFModify = '%s Değiştirildi';
 strFProtect = 'Yazmaya karşı korumalı';
 strFProtectErr = 'Dosya korunuyor!';

const //for SMDBNavigator
 SFirstRecord = 	'İlk kayıt';
 SPriorRecord =	'Önceki kayıt';
 SNextRecord =	'Sonraki kayıt';
 SLastRecord =	'Son kayıt';
 SInsertRecord = 	'Kayıt ekle';
 SCopyRecord =		'Kaydı kopyala';
 SDeleteRecord =	'Kaydı sil';
 SEditRecord =	'Kaydı düzenle';
 SFilterRecord = 	'Kriterlere göre süz';
 SFindRecord = 	'Kaydı ara';
 SPrintRecord = 'Kaydı bas';
 SExportRecord = 'Kayıtları İhraç Et';
 SPostEdit = 'Değişiklikleri kaydet';
 SCancelEdit = 'Değişiklikleri sil';
 SRefreshRecord = 'Veri güncelle';
 SChoice ='Bir kayıt seç';
 SClear = 'Seçili kaydı temizle';
 SDeleteRecordQuestion = 'Kayıt silinsin mi?';
 SDeleteMultipleRecordsQuestion ='Seçili kaydı silmek istediğinizden emin misiniz?';
 SRecordNotFound = 'Kayıt bulunamadı';

 SFirstName = 'İlk';
 SPriorName = 'Önceki';	
 SNextName = 'Sonraki';
 SLastName = 'Son';
 SInsertName = 'Ekle';
 SCopyName = 'Kopyala';
 SDeleteName = 'Sil';
 SEditName = 'Düzenle';
 SFilterName = 'Söz';
 SFindName = 'Bul';
 SPrintName = 'Yazdır';
 SExportName = 'Tanım';
 SPostName = 'Kaydet';
 SCancelName = 'İptal';
 SRefreshName = 'Yenile';
 SChoiceName ='Seç';
 SClearName = 'Temizle';
 SImportName= 'Veri Al';
 SImportRecord='Kayıt Al';
 SBtnOk = '&TAMAM';
 SBtnCancel = 'İ&ptal';
 SBtnLoad = 'Yükle';
 SBtnSave = 'Kaydet';
 SBtnCopy = 'Kopyala';
 SBtnPaste = 'Yapıştır';
 SBtnClear = 'Temizle';
 SNoDataToDisplay ='Kayıt yok';

 SRecNo = 'Kayıt No.';
 SRecOf = ' / ';
 SApplyAll = 'Tümüne Uygula';

const //for EditTyped
 etValidNumber = 'geçerli sayı';
 etValidInteger = 'geçerli tamsayı';
 etValidDateTime = 'geçerli tarih/saat';
 etValidDate = 'geçerli tarih';
 etValidTime = 'geçerli saat';
 etValid = 'geçerli';
 etIsNot = 'değildir';
 etOutOfRange = '%s değeri (%s..%s arasından)';
  SPrevYear = 'geçen yıl';
  SPrevMonth = 'geçen yıl';
  SNextMonth = 'gelecek ay';
  SNextYear = 'gelecek yıl';

implementation

end.
