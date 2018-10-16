{ Copyright (C) 1998-2018, written by Shkolnik Mike, Scalabium Software
  E-Mail:  mshkolnik@scalabium.com
           mshkolnik@yahoo.com
  WEB: http://www.scalabium.com
}
unit SMBoxReg;

interface

{$I SMVersion.inc}

uses
  {$IFDEF SMForDelphi6} DesignIntf, DesignEditors {$ELSE} DsgnIntf {$ENDIF} ;

type
  TSMBoxEditor = class(TComponentEditor)
    function GetVerbCount: Integer; override;
    function GetVerb(index: Integer): string; override;
    procedure ExecuteVerb(index: Integer); override;
  end;

  TSMPanelEditor = class(TComponentEditor)
    function GetVerbCount: Integer; override;
    function GetVerb(index: Integer): string; override;
    procedure ExecuteVerb(index: Integer); override;
  end;

procedure Register;

implementation
uses Classes, SMBox;

procedure Register;
begin
  RegisterComponents('SMComponents', [TSMPanel, TSMBox]);
  RegisterComponentEditor(TSMPanel, TSMPanelEditor);
  RegisterComponentEditor(TSMBox, TSMBoxEditor);
end;


{ TSMBoxEditor }
function TSMBoxEditor.GetVerbCount: Integer;
begin
  Result := 3;
end;

function TSMBoxEditor.GetVerb(index: Integer): string;
begin
  case index of
    0: Result := 'Add page';
    1: Result := 'Move page up';
    2: Result := 'Move page down';
  end;
end;

procedure TSMBoxEditor.ExecuteVerb(index: Integer);
begin
  case index of
     0: TSMBox(Component).SMPanel.InsertPage(TSMBox(Designer.CreateComponent(TSMBox, TSMBox(Component).SMPanel,0,0,20,60)));
     1: TSMBox(Component).MovePageUp;
     2: TSMBox(Component).MovePageDown;
  end;
end;

function TSMPanelEditor.GetVerbCount: Integer;
begin
  Result := 1;
end;

function TSMPanelEditor.GetVerb(index: Integer): string;
begin
  case index of
    0: Result :='Add page';
  end;
end;

procedure TSMPanelEditor.ExecuteVerb(index: Integer);
begin
  case index of
     0: TSMPanel(Component).InsertPage(TSMBox(Designer.CreateComponent(TSMBox, Component,0,0,20,60)));
  end;
end;

end.
