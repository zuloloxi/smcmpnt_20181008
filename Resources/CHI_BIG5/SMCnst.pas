{ Copyright (C) 1998-2011, written by Mike Shkolnik, Scalabium Software
  E-Mail: mshkolnik@scalabium
  WEB: http://www.scalabium.com

  Const strings for localization
  freeware SMComponent library
}
unit SMCnst;

interface

{Traditional Chinese strings}
const
  strMessage = '列印...';
  strSaveChanges = '你真的要在資料庫伺服器上儲存變更?';
  strErrSaveChanges = '無法儲存資料，請檢查伺服器連接或驗證資訊.';
  strDeleteWarning = '你真的要刪除資料表 %s?';
  strEmptyWarning = '你真的要清空資料表 %s?';

const
  PopUpCaption: array [0..24] of string =
   ('增加記錄',
    '插入紀錄',
    '編輯記錄',
    '刪除記錄',
    '-',
    '列印 ...',
    '匯出 ...',
    '過濾 ...',
    '搜尋 ...',
    '-',
    '儲存變更',
    '取消變更',
    '更新畫面',
    '-',
    '選取/不選取 記錄',
       '選取 記錄',
       '選取全部記錄',
       '-',
       '取消選取記錄',
       '取消選取全部記錄',
    '-',
    '儲存欄位安排',
    '取回欄位安排',
    '-',
    '設定...');

const //for TSMSetDBGridDialog
  SgbTitle = '標題 ';
  SgbData = ' 資料 ';
  STitleCaption = ' 標題:';
  STitleAlignment = '對齊:';
  STitleColor = '背景:'; 
  STitleFont = '字形:';
  SWidth = '寬度:';
  SWidthFix = '字元';
  SAlignLeft = '左';
  SAlignRight = '右';
  SAlignCenter = '置中';
  
const //for TSMDBFilterDialog
  strEqual = '相等';
  strNonEqual = '不相等';
  strNonMore = '不大於';
  strNonLess = '不小於';
  strLessThan = '少於';
  strLargeThan = '大於';
  strExist = '空白';
  strNonExist = '非空白';
  strIn = '於列表中';
  strBetween = '之間';
  strLike = '類似';

  strOR = '或';
  strAND = '且';

  strField = '欄位';
  strCondition = '條件';
  strValue = '值';

  strAddCondition = ' 定義附加條件:';
  strSelection = ' 由下一個條件選擇記錄:';

  strAddToList = '添加到列表';
  strEditInList = '編輯列表';
  strDeleteFromList = '從列表中刪除';

  strTemplate = '過濾樣版對話框';
  strFLoadFrom = '載入，由...';
  strFSaveAs = '另存..';
  strFDescription = '描述';
  strFFileName = '檔名';
  strFCreate = '建立: %s';
  strFModify = '修改: %s';
  strFProtect = '保護覆寫';
  strFProtectErr = '檔案受到保護!';

const //for SMDBNavigator
  SFirstRecord = '第一筆記錄';
  SPriorRecord = '上一筆記錄';
  SNextRecord = '下一筆記錄';
  SLastRecord = '最後一筆記錄';
  SInsertRecord = '插入記錄';
  SCopyRecord = '複製記錄';
  SDeleteRecord = '刪除記錄';
  SEditRecord = '編輯記錄';
  SFilterRecord = '過濾條件';
  SFindRecord = '搜索記錄';
  SPrintRecord = '列印記錄';
  SExportRecord = '匯出記錄';
  SImportRecord = '匯入記錄';
  SPostEdit = '儲存變更';
  SCancelEdit = '取消變更';
  SRefreshRecord = '更新資料';
  SChoice = '選擇記錄';
  SClear = '清除選取記錄';
  SDeleteRecordQuestion = '刪除記錄?';
  SDeleteMultipleRecordsQuestion = '你真的要刪除選定的記錄?';
  SRecordNotFound = '記錄未找到';

  SFirstName = '第一';
  SPriorName = '上一個';
  SNextName = '下一個';
  SLastName = '最後';
  SInsertName = '插入';
  SCopyName = '複製';
  SDeleteName = '刪除';
  SEditName = '編輯';
  SFilterName = '過濾';
  SFindName = '搜尋';
  SPrintName = '列印';
  SExportName = '匯出';
  SImportName = '匯入';
  SPostName = '儲存';
  SCancelName = '取消';
  SRefreshName = '更新';
  SChoiceName = '選擇';
  SClearName = '清除';

  SBtnOk = '&確認';
  SBtnCancel = '&取消';
  SBtnLoad = '載入';
  SBtnSave = '儲存';
  SBtnCopy = '複製';
  SBtnPaste = '貼上';
  SBtnClear = '清除';

  SRecNo = '記錄.';
  SRecOf = ' 於 ';

const //for EditTyped
  etValidNumber = '有效數字';
  etValidInteger = '有效的整數';
  etValidDateTime = '有效日期/時間';
  etValidDate = '有效日期';
  etValidTime = '有效時間';
  etValid = '有效';
  etIsNot = '是不是一個';
  etOutOfRange = '數值 %s 超出範圍 %s..%s';

  SApplyAll = '全部套用';

  SNoDataToDisplay = '<沒有資料可以顯示>';

  SPrevYear = '前一年';
  SPrevMonth = '前一個月';
  SNextMonth = '下一個月';
  SNextYear = '下一年';

implementation

end.
