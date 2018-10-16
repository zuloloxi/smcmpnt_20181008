{ SMComponents library
  Register components and editors

  Copyright (C) 2000-2006, written by Mike Shkolnik, Scalabium Software
  E-Mail:  mshkolnik@scalabium.com
  WEB: http://www.scalabium.com
}
unit SMCReg;

interface
{$IFDEF VER100}
  {$DEFINE SMForDelphi3}
{$ENDIF}

{$IFDEF VER110}
  {$DEFINE SMForDelphi3}
{$ENDIF}

{$IFDEF VER120}
  {$DEFINE SMForDelphi3}
  {$DEFINE SMForDelphi4}
{$ENDIF}

{$IFDEF VER125}
  {$DEFINE SMForDelphi3}
  {$DEFINE SMForDelphi4}
{$ENDIF}

{$IFDEF VER130}
  {$DEFINE SMForDelphi3}
  {$DEFINE SMForDelphi4}
  {$DEFINE SMForDelphi5}
{$ENDIF}

{$IFDEF VER140}
  {$DEFINE SMForDelphi3}
  {$DEFINE SMForDelphi4}
  {$DEFINE SMForDelphi5}
  {$DEFINE SMForDelphi6}
{$ENDIF}

{$IFDEF VER150}
  {$DEFINE SMForDelphi3}
  {$DEFINE SMForDelphi4}
  {$DEFINE SMForDelphi5}
  {$DEFINE SMForDelphi6}
  {$DEFINE SMForDelphi7}
{$ENDIF}

{$IFDEF VER170}
  {$DEFINE SMForDelphi3}
  {$DEFINE SMForDelphi4}
  {$DEFINE SMForDelphi5}
  {$DEFINE SMForDelphi6}
  {$DEFINE SMForDelphi7}
  {$DEFINE SMForDelphi2005}
{$ENDIF}

{$IFDEF VER180}
  {$DEFINE SMForDelphi3}
  {$DEFINE SMForDelphi4}
  {$DEFINE SMForDelphi5}
  {$DEFINE SMForDelphi6}
  {$DEFINE SMForDelphi7}
  {$DEFINE SMForDelphi2005}
  {$DEFINE SMForDelphi2006}
  {$IFDEF BCB}
    {$DEFINE SMForBCB2006}
  {$ENDIF}
{$ENDIF}

{$IFDEF SMForDelphi6}
  {$WARN SYMBOL_PLATFORM OFF}
{$ENDIF}

{$IFDEF SMForDelphi7}
  {$WARN SYMBOL_DEPRECATED OFF}
  {$WARN UNSAFE_CODE OFF}
  {$WARN UNSAFE_CAST OFF}
  {$WARN UNSAFE_TYPE OFF}
{$ENDIF}

procedure Register;

implementation
uses Classes,
     EditType, EditTypeDB, AngleLbl, CharMap, ConerBtn, GradPnl,
     MoneyStr, RunText, SendMail, Sensors, 
     SMPanel, SMScript,
     {$IFDEF SMForDelphi6} DesignIntf, DesignEditors {$ELSE} DsgnIntf {$ENDIF};

type
  { TSMIAboutProperty }
  TSMCAboutProperty = class(TStringProperty)
    function GetAttributes: TPropertyAttributes; override;
    function GetValue: string; override;
  end;

procedure Register;
begin
  RegisterComponents('SMComponents', [TAngleLabel,
//                                      TEditTyped,
//                                      TDBEditTyped,
                                      TCharMapCombo,
                                      TConerBtn, TConvexBtn,
                                      TGradientPanel,
                                      TMoneyString,
                                      TRunningText,
                                      TMAPIMail,
                                      TStopLightSensor, TAnalogSensor,
                                      TSMFramePanel,
                                      TSMScriptExecutor]);

//  RegisterPropertyEditor(TypeInfo(TSMCAbout), TSMImportBaseComponent, 'About', TSMCAboutProperty);
end;

function TSMCAboutProperty.GetAttributes: TPropertyAttributes;
begin
  Result := [paReadOnly];
end;

function TSMCAboutProperty.GetValue: string;
begin
  Result := '3.21';
end;

end.

