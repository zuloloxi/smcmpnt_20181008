unit SMCnst;

interface

{Arabic strings}
{translated by Kachwahed, kachwahed@hotmail.fr}
const
  strMessage = 'طباعة';
  strSaveChanges = 'هل ترغب في حفظ التغييرات على المخدم؟';
  strErrSaveChanges = 'لا يمكن حفظ البيانات! تفقد الاتصال بالمخدم أو تحقق من صحة البيانات.';
  strDeleteWarning = '؟ %s هل ترغب فعلا بحذف الجدول';
  strEmptyWarning = '؟ %s هل ترغب فعلا بتفريغ الجدول';

const
  PopUpCaption: array [0..24] of string[33] =
   ('إضافة سجل',
    'حذف سجل',
    'تعديل سجل',
    'حذف السجل',
    '-',
    '... طباعة',
    '... تصدير',
    '... تصفية',
    '... بحث',
    '-',
    'حفظ التعديلات',
    'إلغاء التعديلات',
    'تحديث',
    '-',
    'تحديد/إلغاء تحديد سجلات',
       'تحديد سجل',
       'تحديد كافة السجلات',
       '-',
       'إلغاء تحديد سجل',
       'إلغاء تحديد كافة السجلات',
    '-',
    'حفظ نسق العمود',
    'استرجاع نسق العمود',
    '-',
    '... الإعدادات');

const //for TSMSetDBGridDialog
  SgbTitle = ' العنوان ';
  SgbData = ' البيانات ';
  STitleCaption = ':الاسم';
  STitleAlignment = ':انحياز';
  STitleColor = ':الخلفية';
  STitleFont = ':الخط';
  SWidth = ':العرض';
  SWidthFix = 'الأحرف';
  SAlignLeft = 'يسار';
  SAlignRight = 'يمين';
  SAlignCenter = 'وسط';
  
const //for TSMDBFilterDialog
  strEqual = 'يساوي';
  strNonEqual = 'يختلف عن';
  strNonMore = 'ليس أكبر من';
  strNonLess = 'ليس أصغر من';
  strLessThan = 'أصغر من';
  strLargeThan = 'أكبر من';
  strExist = 'فارغ';
  strNonExist = 'ليس فارغ';
  strIn = 'ضمن القائمة';
  strBetween = 'بين';
  strLike = 'مثل';

  strOR = 'أول';
  strAND = 'و';

  strField = 'حقل';
  strCondition = 'شرط';
  strValue = 'قيمة';

  strAddCondition = ' :إضافة شرط إضافي ';
  strSelection = ' :تحديد السجلات وفق الشروط الآتية';

  strAddToList = 'إضافة إلى القائمة';
  strEditInList = 'تعديل في القائمة';
  strDeleteFromList = 'حذف من القائمة';

  strTemplate = 'نموذج علبة حوار التصفية';
  strFLoadFrom = '...فتح';
  strFSaveAs = '...حفظ باسم';
  strFDescription = 'وصف';
  strFFileName = 'اسم الملف';
  strFCreate = '%s :إنشاء';
  strFModify = '%s :تعديل';
  strFProtect = 'حماية من التغيير';
  strFProtectErr = '!ملف محمي';

const //for SMDBNavigator
  SFirstRecord = 'أول سجل';
  SPriorRecord = 'سجل سابق';
  SNextRecord = 'سجل تالي';
  SLastRecord = 'آخر سجل';
  SInsertRecord = 'إضافة سجل';
  SCopyRecord = 'نسخ السجل';
  SDeleteRecord = 'حذف السجل';
  SEditRecord = 'تعديل السجل';
  SFilterRecord = 'شروط التصفية';
  SFindRecord = 'البحث عن سجل';
  SPrintRecord = 'طباعة سجلات';
  SExportRecord = 'تصدير السجلات';
  SImportRecord = 'إستيراد سجلات';
  SPostEdit = 'حفظ التعديلات';
  SCancelEdit = 'إلغاء التعديلات';
  SRefreshRecord = 'تحديث البيانات';
  SChoice = 'اختر سجل';
  SClear = 'إلغاء تحديد سجلات';
  SDeleteRecordQuestion = 'تحذف السجل؟';
  SDeleteMultipleRecordsQuestion = 'هل ترغب بحذف السجلات المحددة؟';
  SRecordNotFound = 'سجل غير موجود';

  SFirstName =  'أول';
  SPriorName =  'سابق';
  SNextName =   'تالي';
  SLastName =   'آخر';
  SInsertName = 'إضافة';
  SCopyName =   'نسخ';
  SDeleteName = 'حذف';
  SEditName =   'تعديل';
  SFilterName = 'تصفية';
  SFindName =   'بحث';
  SPrintName =  'طباعة';
  SExportName = 'تصدير';
  SImportName = 'استيراد';
  SPostName =   'حفظ';
  SCancelName = 'إلغاء';
  SRefreshName= 'تحديث';
  SChoiceName = 'اختيار';
  SClearName =  'مسح';

  SBtnOk = 'موافق&';
  SBtnCancel = 'إلغاء الأمر&';
  SBtnLoad = 'فتح';
  SBtnSave = 'حفظ';
  SBtnCopy = 'نسخ';
  SBtnPaste = 'لصق';
  SBtnClear = 'مسح';

  SRecNo = '.سج';
  SRecOf = ' من ';

const //for EditTyped
  etValidNumber = 'عدد مقبول';
  etValidInteger = 'عدد صحيح مقبول';
  etValidDateTime = 'تاريخ/توقيت مقبول';
  etValidDate = 'تاريخ مقبول';
  etValidTime = 'توقيت مقبول';
  etValid = 'مقبول';
  etIsNot = 'ليس ';
  etOutOfRange =  '%s..%s القيمة %s خارجة عن المجال ';

  SApplyAll = 'تطبيق على الجميع';

  SNoDataToDisplay = '<لا توجد بيانات>';
  
implementation

end.
