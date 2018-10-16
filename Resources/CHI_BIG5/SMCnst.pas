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
  strMessage = '�C�L...';
  strSaveChanges = '�A�u���n�b��Ʈw���A���W�x�s�ܧ�?';
  strErrSaveChanges = '�L�k�x�s��ơA���ˬd���A���s�������Ҹ�T.';
  strDeleteWarning = '�A�u���n�R����ƪ� %s?';
  strEmptyWarning = '�A�u���n�M�Ÿ�ƪ� %s?';

const
  PopUpCaption: array [0..24] of string =
   ('�W�[�O��',
    '���J����',
    '�s��O��',
    '�R���O��',
    '-',
    '�C�L ...',
    '�ץX ...',
    '�L�o ...',
    '�j�M ...',
    '-',
    '�x�s�ܧ�',
    '�����ܧ�',
    '��s�e��',
    '-',
    '���/����� �O��',
       '��� �O��',
       '��������O��',
       '-',
       '��������O��',
       '������������O��',
    '-',
    '�x�s���w��',
    '���^���w��',
    '-',
    '�]�w...');

const //for TSMSetDBGridDialog
  SgbTitle = '���D ';
  SgbData = ' ��� ';
  STitleCaption = ' ���D:';
  STitleAlignment = '���:';
  STitleColor = '�I��:'; 
  STitleFont = '�r��:';
  SWidth = '�e��:';
  SWidthFix = '�r��';
  SAlignLeft = '��';
  SAlignRight = '�k';
  SAlignCenter = '�m��';
  
const //for TSMDBFilterDialog
  strEqual = '�۵�';
  strNonEqual = '���۵�';
  strNonMore = '���j��';
  strNonLess = '���p��';
  strLessThan = '�֩�';
  strLargeThan = '�j��';
  strExist = '�ť�';
  strNonExist = '�D�ť�';
  strIn = '��C��';
  strBetween = '����';
  strLike = '����';

  strOR = '��';
  strAND = '�B';

  strField = '���';
  strCondition = '����';
  strValue = '��';

  strAddCondition = ' �w�q���[����:';
  strSelection = ' �ѤU�@�ӱ����ܰO��:';

  strAddToList = '�K�[��C��';
  strEditInList = '�s��C��';
  strDeleteFromList = '�q�C���R��';

  strTemplate = '�L�o�˪���ܮ�';
  strFLoadFrom = '���J�A��...';
  strFSaveAs = '�t�s..';
  strFDescription = '�y�z';
  strFFileName = '�ɦW';
  strFCreate = '�إ�: %s';
  strFModify = '�ק�: %s';
  strFProtect = '�O�@�мg';
  strFProtectErr = '�ɮר���O�@!';

const //for SMDBNavigator
  SFirstRecord = '�Ĥ@���O��';
  SPriorRecord = '�W�@���O��';
  SNextRecord = '�U�@���O��';
  SLastRecord = '�̫�@���O��';
  SInsertRecord = '���J�O��';
  SCopyRecord = '�ƻs�O��';
  SDeleteRecord = '�R���O��';
  SEditRecord = '�s��O��';
  SFilterRecord = '�L�o����';
  SFindRecord = '�j���O��';
  SPrintRecord = '�C�L�O��';
  SExportRecord = '�ץX�O��';
  SImportRecord = '�פJ�O��';
  SPostEdit = '�x�s�ܧ�';
  SCancelEdit = '�����ܧ�';
  SRefreshRecord = '��s���';
  SChoice = '��ܰO��';
  SClear = '�M������O��';
  SDeleteRecordQuestion = '�R���O��?';
  SDeleteMultipleRecordsQuestion = '�A�u���n�R����w���O��?';
  SRecordNotFound = '�O�������';

  SFirstName = '�Ĥ@';
  SPriorName = '�W�@��';
  SNextName = '�U�@��';
  SLastName = '�̫�';
  SInsertName = '���J';
  SCopyName = '�ƻs';
  SDeleteName = '�R��';
  SEditName = '�s��';
  SFilterName = '�L�o';
  SFindName = '�j�M';
  SPrintName = '�C�L';
  SExportName = '�ץX';
  SImportName = '�פJ';
  SPostName = '�x�s';
  SCancelName = '����';
  SRefreshName = '��s';
  SChoiceName = '���';
  SClearName = '�M��';

  SBtnOk = '&�T�{';
  SBtnCancel = '&����';
  SBtnLoad = '���J';
  SBtnSave = '�x�s';
  SBtnCopy = '�ƻs';
  SBtnPaste = '�K�W';
  SBtnClear = '�M��';

  SRecNo = '�O��.';
  SRecOf = ' �� ';

const //for EditTyped
  etValidNumber = '���ļƦr';
  etValidInteger = '���Ī����';
  etValidDateTime = '���Ĥ��/�ɶ�';
  etValidDate = '���Ĥ��';
  etValidTime = '���Įɶ�';
  etValid = '����';
  etIsNot = '�O���O�@��';
  etOutOfRange = '�ƭ� %s �W�X�d�� %s..%s';

  SApplyAll = '�����M��';

  SNoDataToDisplay = '<�S����ƥi�H���>';

  SPrevYear = '�e�@�~';
  SPrevMonth = '�e�@�Ӥ�';
  SNextMonth = '�U�@�Ӥ�';
  SNextYear = '�U�@�~';

implementation

end.
