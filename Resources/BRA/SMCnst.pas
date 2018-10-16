unit SMCnst;

interface

{Brazilian Portuguese strings}
{translated by Rodrigo Hjort, rodrigo_hjort@excite.com}
{atualizado por Alexandre Sant'Anna em 06/08/2007, alex.santanna@globo.com}
{atualizado por Francisco Ernesto Teixeira em 01/10/2013, fco.ernesto@gmail.com}
const
  strMessage = 'Imprimir...';
  strSaveChanges = 'Deseja realmente salvar altera��es no Servidor de Banco de Dados?';
  strErrSaveChanges = 'N�o foi poss�vel salvar um dado! Verifique a conex�o com o Servidor ou valida��o de dados.';
  strDeleteWarning = 'Deseja realmente excluir a tabela %s?';
  strEmptyWarning = 'Deseja realmente esvaziar a tabela %s?';

const
  PopUpCaption: array [0..24] of string[33] =
   ('Incluir registro',
    'Insert registro',
    'Alterar registro',
    'Excluir registro',
    '-',
    'Imprimir ...',
    'Exportar ...',
    'Filtra ...',
    'Pesquisa ...',
    '-',
    'Salvar altera��es',
    'Cancelar altera��es',
    'Atualizar',
    '-',
    'Selecionar/Desselecionar registros',
       'Selecionar registro',
       'Selecionar todos registros',
       '-',
       'Desselecionar registro',
       'Desselecionar todos registros',
    '-',
    'Salvar layout da coluna',
    'Abrir layout da coluna',
    '-',
    'Configurar...');

const //for TSMSetDBGridDialog
  SgbTitle = ' Titulo ';
  SgbData = ' Data ';
  STitleCaption = 'Legenda:';
  STitleAlignment = 'Alinhamento:';
  STitleColor = 'Cor:';
  STitleFont = 'Fonte:';
  SWidth = 'Largura:';
  SWidthFix = 'Fixos';
  SAlignLeft = 'esquerda';
  SAlignRight = 'direita';
  SAlignCenter = 'centro';

const //for TSMDBFilterDialog
  strEqual = 'igual';
  strNonEqual = 'diferente';
  strNonMore = 'n�o maior';
  strNonLess = 'n�o menor';
  strLessThan = 'menor que';
  strLargeThan = 'maior que';
  strExist = 'vazio';
  strNonExist = 'preenchido';
  strIn = 'na lista';
  strBetween = 'entre';
  strLike = 'parecido';

  strOR = 'OU';
  strAND = 'E';

  strField = 'Campo';
  strCondition = 'Condi��o';
  strValue = 'Valor';

  strAddCondition = ' defina a condi��o adicional:';
  strSelection = ' escolha os regritro pelo pr�xima condi��o:';

  strAddToList = 'incluir na lista';
  strEditInList = 'Editar a lista';
  strDeleteFromList = 'Excluir da lista';

  strTemplate = 'Dialogo de filtro padr�o';
  strFLoadFrom = 'Carregar de...';
  strFSaveAs = 'Salvar como...';
  strFDescription = 'descri��o';
  strFFileName = 'Arquivo';
  strFCreate = 'Criado: %s';
  strFModify = 'Modificado: %s';
  strFProtect = 'Somente leitura';
  strFProtectErr = 'Arquivo esta protegido!';

const //for SMDBNavigator
  SFirstRecord = 'Primeiro registro';
  SPriorRecord = 'Registro anterior';
  SNextRecord = 'Pr�ximo registro';
  SLastRecord = '�ltimo registro';
  SInsertRecord = 'Inserir registro';
  SCopyRecord = 'Copiar registro';
  SDeleteRecord = 'Excluir registro';
  SEditRecord = 'Alterar registro';
  SFilterRecord = 'Condi��es de filtragem';
  SFindRecord = 'Localizar registro';
  SPrintRecord = 'Imprimir registros';
  SExportRecord = 'Exportar registros';
  SImportRecord = 'Importar os registros';
  SPostEdit = 'Salvar altera��es';
  SCancelEdit = 'Cancelar altera��es';
  SRefreshRecord = 'Atualizar dados';
  SChoice = 'Escolher registro';
  SClear = 'Limpar escolha de registro';
  SDeleteRecordQuestion = 'Excluir registro?';
  SDeleteMultipleRecordsQuestion = 'Deseja realmente excluir registros selecionados?';
  SRecordNotFound = 'Registro n�o encontrado';

  SFirstName = 'Primeiro';
  SPriorName = 'Anterior';
  SNextName = 'Pr�ximo';
  SLastName = '�ltimo';
  SInsertName = 'Inserir';
  SCopyName = 'Copiar';
  SDeleteName = 'Excluir';
  SEditName = 'Alterar';
  SFilterName = 'Filtrar';
  SFindName = 'Localizar';
  SPrintName = 'Imprimir';
  SExportName = 'Exportar';
  SImportName = 'Importar';
  SPostName = 'Salvar';
  SCancelName = 'Cancelar';
  SRefreshName = 'Atualizar';
  SChoiceName = 'Escolher';
  SClearName = 'Limpar';

  SBtnOk = '&OK';
  SBtnCancel = '&Cancelar';
  SBtnLoad = 'Carregar';
  SBtnSave = 'Salvar';
  SBtnCopy = 'Copiar';
  SBtnPaste = 'Colar';
  SBtnClear = 'Limpar';

  SRecNo = '#';
  SRecOf = ' de ';

const //for EditTyped
  etValidNumber = 'n�mero v�lido';
  etValidInteger = 'n�mero inteiro v�lido';
  etValidDateTime = 'data/hora v�lida';
  etValidDate = 'data v�lida';
  etValidTime = 'hora v�lida';
  etValid = 'v�lido';
  etIsNot = 'n�o � um';
  etOutOfRange = 'Valor %s est� fora dos limites %s..%s';
  SApplyAll = 'Aplicar em todos';

  SNoDataToDisplay = '<Sem registros>';

  SPrevYear = 'ano anterior';
  SPrevMonth = 'm�s anterior';
  SNextMonth = 'pr�ximo m�s';
  SNextYear = 'pr�ximo m�s';

implementation

end.
