unit SMCnst;

interface

{Farsi(Persian) strings}
{translated by Mostafa Adib, netlogpro@gmail.com}
const
  strMessage = 'G';
  strSaveChanges = 'BmG fG^ZG ^UO PNmQe J[mmQGJ OQ SQfQ HGd GXaGZGJm QG OGQmO?';
  strErrSaveChanges = 'GcGd PNmQe fLfO dOGQO!aX]G GHJOG GJUGa NfO f UMJ GXaGZGJ QG HQQSm dcGmmO';
  strDeleteWarning = 'BmG fG^ZG ^UO OGQmO LOfa %s QG LP] dcGmmO?';
  strEmptyWarning = 'BmG fG^ZG ^UO OGQmO cMJfmGJ LOfa %s QG NGam dmO?';

const
  PopUpCaption: array [0..24] of string =
   ('G]RfOd QfQO',
    'OQL QfQO',
    'fmQGmT QfQO',
    'MP] QfQO',
    '-',
    'G',
    'NQfLm',
    ']maJQ',
    'LSJLf',
    '-',
    'PNmQe J[mmQGJ',
    'GdUQG] GR J[mmQ',
    'He QfR QSGdm',
    '-',
    'GdJNGH mG ZOc GdJNGH QfQOeG',
       'GdJNGH QfQO',
       'GdJNGH ece QfQOeG',
       '-',
       'ZOc GdJNGH QfQO',
       'ZOc GdJNGH ece QfQOeG',
    '-',
    'PNmQe aGme SJfd',
    'HGRQOGdm aGme SJfd',
    '-',
    'JdYmc');

const //for TSMSetDBGridDialog
  SgbTitle = ' ZdfGd ';
  SgbData = ' JGQmN ';
  STitleCaption = 'Caption:';
  STitleAlignment = 'JQGRHdOm:';
  STitleColor = 'S Rcmde:'; 
  STitleFont = ']fdJ:';
  SWidth = 'ZQV:';
  SWidthFix = 'GQGJQeG';
  SAlignLeft = '';
  SAlignRight = 'QGSJ';
  SAlignCenter = 'fSX';
  
const //for TSMDBFilterDialog
  strEqual = 'HQGHQ';
  strNonEqual = 'cNGa]';
  strNonMore = 'HmTJQ dHGTO ';
  strNonLess = 'cJQ dHGTO';
  strLessThan = 'cJQ GR';
  strLargeThan = 'HmTJQ GR';
  strExist = 'NGam';
  strNonExist = 'NGam dHGTO';
  strIn = 'OQ amSJ';
  strBetween = 'Hmd';
  strLike = 'cTGHe';

  strOR = 'mG';
  strAND = 'f';

  strField = ']maO';
  strCondition = 'TQX';
  strValue = 'c^OGQ';

  strAddCondition = ' JZQm] TQX OmQ:';
  strSelection = ' GdJNGH QfQOeG HQ GSGS TQfR HZOm:';

  strAddToList = 'G]RfOd He amSJ';
  strEditInList = 'fmQGmT OQ amSJ';
  strDeleteFromList = 'MP] GRamSJ';

  strTemplate = ']maJQ ^GaH cMGfQe:';
  strFLoadFrom = 'HGQRGQm GR ]Gma';
  strFSaveAs = 'PNmQe He ZdfGd';
  strFDescription = 'JfVmMGJ';
  strFFileName = 'dGc ]Gma';
  strFCreate = 'GmLGO: %s';
  strFModify = 'BNQmd OSJQSm: %s';
  strFProtect = '^]a PGQm HQGm HGRdfmSm';
  strFProtectErr = ']Gma ^]a PGQm TOe GSJ!';

const //for SMDBNavigator
  SFirstRecord = 'Gfamd QfQO';
  SPriorRecord = 'QfQO ^Ham';
  SNextRecord = 'QfQO HZOm';
  SLastRecord = 'BNQmd QfQO';
  SInsertRecord = 'OQL QfQO';
  SCopyRecord = 'm QfQO';
  SDeleteRecord = 'MP] QfQO';
  SEditRecord = 'fmQGmT QfQO';
  SFilterRecord = ']maJQ TQX eG';
  SFindRecord = 'LSJLfm QfQO';
  SPrintRecord = 'G QfQOeG';
  SExportRecord = 'NQfLm QfQOeG';
  SImportRecord = 'fQfOm QfQOeG';
  SPostEdit = 'PNmQe J[mmQGJ';
  SCancelEdit = 'GdUQG] J[mmQGJ';
  SRefreshRecord = 'He QfRQSGdm OGOe';
  SChoice = 'GdJNGH QfQO';
  SClear = 'ZOc GdJNGH QfQO GdJNGHm';
  SDeleteRecordQuestion = 'QfQO MP] TfO?';
  SDeleteMultipleRecordsQuestion = 'BmG fG^ZG ^UO MP] QfQOeGm GdJNGH QG OGQmO?';
  SRecordNotFound = 'QfQOm mG]J dTO';

  SFirstName = 'Gfamd';
  SPriorName = '^Ham';
  SNextName = 'HZOm';
  SLastName = 'BNQmd';
  SInsertName = 'OQL';
  SCopyName = 'm';
  SDeleteName = 'MP]';
  SEditName = 'fmQGmT';
  SFilterName = ']maJQ';
  SFindName = 'LSJLf';
  SPrintName = 'G';
  SExportName = 'NQfLm';
  SImportName = 'fQfOm';
  SPostName = 'PNmQe';
  SCancelName = 'GdUQG]';
  SRefreshName = 'He QfRQSGdm';
  SChoiceName = 'GdJNGH';
  SClearName = 'ZOc GdJNGH';

  SBtnOk = 'JGmmO';
  SBtnCancel = 'GdUQG]';
  SBtnLoad = 'HGQRGQm';
  SBtnSave = 'PNmQe';
  SBtnCopy = 'm';
  SBtnPaste = 'SHGdOd';
  SBtnClear = 'G QOd';

  SRecNo = 'QfQO.';
  SRecOf = ' GR ';

const //for EditTyped
  etValidNumber = 'ZOO cLGR';
  etValidInteger = 'ZOO UMmM cLGR';
  etValidDateTime = 'JGQmN f RcGd cLGR';
  etValidDate = 'JGQmN cLGR';
  etValidTime = 'RcGd cLGR';
  etValid = 'cLGR';
  etIsNot = 'ZOc GdJNGH';
  etOutOfRange = 'c^OGQ %s NGQL GR HGRe %s..%s cm HGTO';

  SApplyAll = 'GZcGa He ece';

  SNoDataToDisplay = '<OGOe Gm HQGm dcGmT fLfO dOGQO>';

  SPrevYear = 'SGa ^Ha';
  SPrevMonth = 'cGe ^Ha';
  SNextMonth = 'cGe HZO';
  SNextYear = 'SGa HZO';

implementation

end.
