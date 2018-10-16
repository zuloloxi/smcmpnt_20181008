{ SMParser component
  Copyright (C) 1999, written by Shkolnik Mike
  FIDOnet: 2:463/106.14
  E-Mail:  mike@woccu.freenet.kiev.ua
           mshkolnik@rs-ukraine.kiev.ua
  WEB: http://www.geocities.com/SiliconValley/Grid/3989
  tel: 380-/44/-552-10-29


  In this unit I describe a parser component for expression evaluation
  (like Clipper/FoxPro macro execution - &/EVAL function)
}
unit SMParser;

interface
uses Classes;

type
  TVariables = class;

  TVariableType = (vtUnknown, vtString, vtInteger, vtFloat,
                   vtDateTime, vtBoolean);

  TVariable = class(TPersistent)
  private
    FVariableList: TVariables;
    FData: Variant;
    FName: string;
    FNull: Boolean;
    FVariableType: TVariableType;
    procedure InitValue;
  protected
    procedure AssignVariable(Variable: TVariable);
    function GetAsBoolean: Boolean;
    function GetAsDateTime: TDateTime;
    function GetAsFloat: Double;
    function GetAsInteger: Longint;
    function GetAsString: string;
    function GetAsVariant: Variant;
    function IsEqual(Value: TVariable): Boolean;
    procedure SetAsBoolean(Value: Boolean);
    procedure SetAsDate(Value: TDateTime);
    procedure SetAsDateTime(Value: TDateTime);
    procedure SetAsFloat(Value: Double);
    procedure SetAsInteger(Value: Longint);
    procedure SetAsString(const Value: string);
    procedure SetAsVariant(Value: Variant);
    procedure SetText(const Value: string);
  public
    constructor Create(AVariableList: TVariables; AVariableType: TVariableType);
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;
    procedure Clear;
    property AsBoolean: Boolean read GetAsBoolean write SetAsBoolean;
    property AsDateTime: TDateTime read GetAsDateTime write SetAsDateTime;
    property AsFloat: Double read GetAsFloat write SetAsFloat;
    property AsInteger: LongInt read GetAsInteger write SetAsInteger;
    property AsString: string read GetAsString write SetAsString;
    property IsNull: Boolean read FNull;
    property Name: string read FName write FName;
    property VariableType: TVariableType read FVariableType write FVariableType;
    property Text: string read GetAsString write SetText;
    property Value: Variant read GetAsVariant write SetAsVariant;
  end;

{ TVariables }

  TVariables = class(TPersistent)
  private
    FItems: TList;
    function GetVariable(Index: Word): TVariable;
    function GetVariableValue(const VariableName: string): Variant;
    procedure SetVariableValue(const VariableName: string;
      const Value: Variant);
  protected
    procedure AssignTo(Dest: TPersistent); override;
  public
    constructor Create; virtual;
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;
    procedure AssignValues(Value: TVariables);
    procedure AddVariable(Value: TVariable);
    procedure RemoveVariable(Value: TVariable);
    function CreateVariable(const VariableName: string; VariableType: TVariableType): TVariable;
    function Count: Integer;
    procedure Clear;
    procedure GetVariableList(List: TList; const VariableNames: string);
    function IsEqual(Value: TVariables): Boolean;
    function VariableByName(const Value: string): TVariable;
    property Items[Index: Word]: TVariable read GetVariable; default;
    property VariableValues[const VariableName: string]: Variant read GetVariableValue write SetVariableValue;
  end;

  TSMParser = class(TComponent)
  private
    { Private declarations }
    FExpression: TStrings;
    FVariables: TVariables;
    FResult: Variant;
    FPrepared: Boolean;

    procedure SetExpression(Value: TStrings);
    procedure ExpressionChanged(Sender: TObject);

    procedure CreateVariables(List: TVariables; const Value: PChar);
    procedure SetVariablesList(Value: TVariables);
  protected
    { Protected declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function Execute: Boolean;
    function Evaluate: Variant;
    procedure ExpandBrackets(s: string);

    property Result: Variant read Evaluate;
  published
    { Published declarations }
    property Expression: TStrings read FExpression write SetExpression;
    property Variables: TVariables read FVariables write SetVariablesList;
  end;

procedure Register;

implementation
uses SysUtils;

procedure Register;
begin
  RegisterComponents('SMComponents', [TSMParser]);
end;

type
  EVariableError = class(Exception);

const
  SVariableNotFound = '%s: Variable ''%s'' not found';
  SVariableUndefinedType = 'Variable ''%s'' is of unknown type';
  SVariableUnsupportedType = 'Variable ''%s'' is of an unsupported type';
  STextFalse = 'False';
  STextTrue = 'True';

{ TVariables }

constructor TVariables.Create;
begin
  FItems := TList.Create;
end;

destructor TVariables.Destroy;
begin
  Clear;
  FItems.Free;

  inherited Destroy;
end;

procedure TVariables.Assign(Source: TPersistent);
var i: Integer;
begin
  if Source is TVariables then
  begin
    Clear;
    for i := 0 to TVariables(Source).Count - 1 do
      with TVariable.Create(Self, vtUnknown) do
        Assign(TVariables(Source)[i]);
  end
  else
    inherited Assign(Source);
end;

procedure TVariables.AssignTo(Dest: TPersistent);
begin
  if Dest is TVariables then
    TVariables(Dest).Assign(Self)
  else
    inherited AssignTo(Dest);
end;

procedure TVariables.AssignValues(Value: TVariables);
var i, j: Integer;
begin
  for i := 0 to Count - 1 do
    for j := 0 to Value.Count - 1 do
      if Items[i].Name = Value[j].Name then
      begin
        Items[i].Assign(Value[j]);
        Break;
      end;
end;

procedure TVariables.AddVariable(Value: TVariable);
begin
  FItems.Add(Value);
  Value.FVariableList := Self;
end;

procedure TVariables.RemoveVariable(Value: TVariable);
begin
  FItems.Remove(Value);
  Value.FVariableList := nil;
end;

function TVariables.CreateVariable(const VariableName: string; VariableType: TVariableType): TVariable;
begin
  Result := TVariable.Create(Self, VariableType);
  Result.Name := VariableName;
end;

function TVariables.Count: Integer;
begin
  Result := FItems.Count;
end;

function TVariables.IsEqual(Value: TVariables): Boolean;
var i: Integer;
begin
  Result := Count = Value.Count;
  if Result then
    for i := 0 to Count - 1 do
    begin
      Result := Items[i].IsEqual(Value.Items[i]);
      if not Result then Break;
    end
end;

procedure TVariables.Clear;
begin
  while FItems.Count > 0 do
    TVariable(FItems.Last).Free;
end;

function TVariables.GetVariable(Index: Word): TVariable;
begin
  Result := VariableByName(TVariable(FItems[Index]).Name);
end;

function TVariables.VariableByName(const Value: string): TVariable;
var i: Integer;
begin
  for i := 0 to FItems.Count - 1 do
  begin
    Result := FItems[i];
    if (Result.Name =  Value) then Exit;
  end;
  raise EVariableError.CreateFmt(SVariableNotFound, [Value]);
  Result := nil;
end;

function TVariables.GetVariableValue(const VariableName: string): Variant;
var
  i: Integer;
  Variables: TList;
begin
  if Pos(';', VariableName) <> 0 then
  begin
    Variables := TList.Create;
    try
      GetVariableList(Variables, VariableName);
      Result := VarArrayCreate([0, Variables.Count - 1], varVariant);
      for i := 0 to Variables.Count - 1 do
        Result[i] := TVariable(Variables[i]).Value;
    finally
      Variables.Free;
    end;
  end
  else
    Result := VariableByName(VariableName).Value
end;

procedure TVariables.SetVariableValue(const VariableName: string;
  const Value: Variant);
var
  i: Integer;
  Variables: TList;
begin
  if Pos(';', VariableName) <> 0 then
  begin
    Variables := TList.Create;
    try
      GetVariableList(Variables, VariableName);
      for i := 0 to Variables.Count - 1 do
        TVariable(Variables[i]).Value := Value[i];
    finally
      Variables.Free;
    end;
  end
  else
    VariableByName(VariableName).Value := Value;
end;

procedure TVariables.GetVariableList(List: TList; const VariableNames: string);

  function ExtractVariableName(const str: string; var Pos: Integer): string;
  var i: Integer;
  begin
    i := Pos;
    while (i <= Length(str)) and (str[i] <> ';') do
      Inc(i);
    Result := Trim(Copy(str, Pos, i - Pos));
    if (i <= Length(str)) and (str[i] = ';') then
      Inc(i);
    Pos := i;
  end;

var
  Pos: Integer;
begin
  Pos := 1;
  while Pos <= Length(VariableNames) do
    List.Add(VariableByName(ExtractVariableName(VariableNames, Pos)));
end;

{ TVariable }

constructor TVariable.Create(AVariableList: TVariables; AVariableType: TVariableType);
begin
  if AVariableList <> nil then
    AVariableList.AddVariable(Self);
  VariableType := AVariableType;
end;

destructor TVariable.Destroy;
begin
  if FVariableList <> nil then
    FVariableList.RemoveVariable(Self);
end;

function TVariable.IsEqual(Value: TVariable): Boolean;
begin
  Result := (VarType(FData) = VarType(Value.FData)) and
    (FData = Value.FData) and (Name = Value.Name) and
    (IsNull = Value.IsNull) and
    (VariableType = Value.VariableType);
end;

procedure TVariable.SetText(const Value: string);
begin
  InitValue;
  if VariableType = vtUnknown then
    VariableType := vtString;
  FData := Value;
  case VariableType of
    vtDateTime: FData := VarToDateTime(FData);
    vtFloat: FData := Single(FData);
    vtInteger: FData := Integer(FData);
    vtBoolean: FData := Boolean(FData);
  end;
end;

procedure TVariable.Assign(Source: TPersistent);
begin
  if Source is TVariable then
    AssignVariable(TVariable(Source))
  else
    inherited Assign(Source);
end;

procedure TVariable.AssignVariable(Variable: TVariable);
begin
  if Variable <> nil then
  begin
    VariableType := Variable.VariableType;
    if Variable.IsNull then
      Clear
    else
    begin
      InitValue;
      FData := Variable.FData;
    end;
    Name := Variable.Name;
    if VariableType = vtUnknown then
      VariableType := Variable.VariableType;
  end;
end;

procedure TVariable.Clear;
begin
  FNull := True;
  FData := 0;
end;

procedure TVariable.InitValue;
begin
  FNull := False;
end;

procedure TVariable.SetAsBoolean(Value: Boolean);
begin
  InitValue;
  VariableType := vtBoolean;
  FData := Value;
end;

function TVariable.GetAsBoolean: Boolean;
begin
  Result := FData;
end;

procedure TVariable.SetAsFloat(Value: Double);
begin
  InitValue;
  VariableType := vtFloat;
  FData := Value;
end;

function TVariable.GetAsFloat: Double;
begin
  Result := FData;
end;

procedure TVariable.SetAsInteger(Value: Longint);
begin
  InitValue;
  VariableType := vtInteger;
  FData := Value;
end;

function TVariable.GetAsInteger: Longint;
begin
  Result := FData;
end;

procedure TVariable.SetAsString(const Value: string);
begin
  InitValue;
  VariableType := vtString;
  FData := Value;
end;

function TVariable.GetAsString: string;
begin
  if not IsNull then
    case VariableType of
      vtBoolean: if FData then
                   Result := STextTrue
                 else
                   Result := STextFalse;
      vtDateTime: Result := VarFromDateTime(FData)
      else
        Result := FData;
    end
  else
    Result := ''
end;

procedure TVariable.SetAsDate(Value: TDateTime);
begin
  InitValue;
  VariableType := vtDateTime;
  FData := VarFromDateTime(Value);
end;

procedure TVariable.SetAsDateTime(Value: TDateTime);
begin
  SetAsDate(Value);
  FVariableType := vtDateTime;
end;

function TVariable.GetAsDateTime: TDateTime;
begin
  if IsNull then
    Result := 0
  else
    Result := VarToDateTime(FData);
end;

procedure TVariable.SetAsVariant(Value: Variant);
begin
  InitValue;
  case VarType(Value) of
    varInteger: VariableType := vtInteger;
    varSingle,
    varDouble: VariableType := vtFloat;
    varDate: VariableType := vtDateTime;
    varBoolean: VariableType := vtBoolean;
    varString, varOleStr: VariableType := vtString;
    else
      VariableType := vtUnknown;
  end;
  FData := Value;
end;

function TVariable.GetAsVariant: Variant;
begin
  Result := FData;
end;

{ TSMParser }
constructor TSMParser.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  FVariables := TVariables.Create;
  FExpression := TStringList.Create;
  TStringList(FExpression).OnChange := ExpressionChanged;
end;

destructor TSMParser.Destroy;
begin
  FExpression.Free;
  FVariables.Free;

  inherited Destroy;
end;

procedure TSMParser.ExpressionChanged(Sender: TObject);
var List: TVariables;
begin
  if not (csLoading in ComponentState) then
  begin
    List := TVariables.Create;
    try
      CreateVariables(List, PChar(Expression.Text));
      List.AssignValues(FVariables);
      FVariables.Free;
      FVariables := List;
    except
      List.Free;
    end;
  end
  else
    CreateVariables(nil, PChar(Expression.Text));
end;

procedure TSMParser.SetExpression(Value: TStrings);
begin
  if (FExpression.Text <> Value.Text) then
  begin
    FExpression.BeginUpdate;
    try
      FExpression.Assign(Value);
    finally
      FExpression.EndUpdate;
    end;
  end;
end;

procedure TSMParser.CreateVariables(List: TVariables; const Value: PChar);
var
  CurPos, StartPos: PChar;
  CurChar: Char;
  Literal: Boolean;
  EmbeddedLiteral: Boolean;
  Name: string;

  function NameDelimiter: Boolean;
  begin
    Result := CurChar in [#9, ' ', ',', ';', ')', #13, #10,
                          '(', ')', '*', '/', '+', '-', '^', '%', '='];
  end;

  function IsLiteral: Boolean;
  begin
    Result := CurChar in ['''', '"'];
  end;

  function StripLiterals(Buffer: PChar): string;
  var
    Len: Word;
    TempBuf: PChar;

    procedure StripChar(Value: Char);
    begin
      if TempBuf^ = Value then
        StrMove(TempBuf, TempBuf + 1, Len - 1);
      if TempBuf[StrLen(TempBuf) - 1] = Value then
        TempBuf[StrLen(TempBuf) - 1] := #0;
    end;

  begin
    Len := StrLen(Buffer) + 1;
    TempBuf := AllocMem(Len);
    Result := '';
    try
      StrCopy(TempBuf, Buffer);
      StripChar('''');
      StripChar('"');
      Result := StrPas(TempBuf);
    finally
      FreeMem(TempBuf, Len);
    end;
  end;

begin
  CurPos := Value;
  Literal := False;
  EmbeddedLiteral := False;
  repeat
    CurChar := CurPos^;
    if (CurChar = ':') and not Literal and ((CurPos + 1)^ <> ':') then
    begin
      StartPos := CurPos;
      while (CurChar <> #0) and (Literal or not NameDelimiter) do
      begin
        Inc(CurPos);
        CurChar := CurPos^;
        if IsLiteral then
        begin
          Literal := Literal xor True;
          if CurPos = StartPos + 1 then EmbeddedLiteral := True;
        end;
      end;
      CurPos^ := #0;
      if EmbeddedLiteral then
      begin
        Name := StripLiterals(StartPos + 1);
        EmbeddedLiteral := False;
      end
      else
        Name := StrPas(StartPos + 1);
      if Assigned(List) then
        List.CreateVariable(Name, vtUnknown);
      CurPos^ := CurChar;
      StartPos^ := '?';
      Inc(StartPos);
      StrMove(StartPos, CurPos, StrLen(CurPos) + 1);
      CurPos := StartPos;
    end
    else
      if (CurChar = ':') and not Literal and ((CurPos + 1)^ = ':') then
        StrMove(CurPos, CurPos + 1, StrLen(CurPos) + 1)
      else
        if IsLiteral then
          Literal := Literal xor True;
    Inc(CurPos);
  until CurChar = #0;
end;

procedure TSMParser.SetVariablesList(Value: TVariables);
begin
  FVariables.AssignValues(Value);
end;

function TSMParser.Execute: Boolean;
begin
  try
    Result := True;

    Evaluate;
  except
    Result := True;
  end;
end;

function TSMParser.Evaluate: Variant;
type TOperand = (opNone, opPlus, opMinus, opMultiply, opDivide, opPower, opPercent);
var i: Integer;
    strExpression: string;
    Operand: TOperand;

  function GetNextTerm: Variant;
  begin
    Result := Null;

    while (i <= Length(strExpression)) and
          (Operand = opNone) do
    begin
      case strExpression[i] of
        '+': Operand := opPlus;
        '-': Operand := opMinus;
        '*': Operand := opMultiply;
        '/': Operand := opDivide;
        '^': Operand := opPower;
        '%': Operand := opPercent;
      else
        Operand := opNone;
      end;
      Inc(i);
    end;
  end;

begin
  if not FPrepared then
  begin
    FResult := NULL;

    strExpression := FExpression.Text;
    i := 1;
    Operand := opNone;
  end;

  Result := FResult
end;

procedure TSMParser.ExpandBrackets(s: string);
begin
end;

end.