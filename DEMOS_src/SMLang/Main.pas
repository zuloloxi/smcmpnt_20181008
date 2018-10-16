unit Main;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  SMLang, StdCtrls, Menus, ComCtrls, ToolWin;

type
  TfrmMain = class(TForm)
    tbMain: TToolBar;
    ImageList1: TImageList;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Edit1: TMenuItem;
    Help1: TMenuItem;
    New1: TMenuItem;
    Open1: TMenuItem;
    Save1: TMenuItem;
    N1: TMenuItem;
    Exit1: TMenuItem;
    Copy1: TMenuItem;
    Cut1: TMenuItem;
    Paste1: TMenuItem;
    About1: TMenuItem;
    btnClick: TButton;
    SMLanguage1: TSMLanguage;
    rbEnglish: TRadioButton;
    rbGerman: TRadioButton;
    rbFrench: TRadioButton;
    rbRussian: TRadioButton;
    lblURL: TLabel;
    procedure rbEnglishClick(Sender: TObject);
    procedure btnClickClick(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure lblURLClick(Sender: TObject);
  private
    { Private declarations }
    strMessageText: string;
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.DFM}
uses ShellAPI;

procedure TfrmMain.rbEnglishClick(Sender: TObject);
begin
  if (Sender = rbEnglish) then
    SMLanguage1.ResourceFile := 'english.lng'
  else
  if (Sender = rbGerman) then
    SMLanguage1.ResourceFile := 'german.lng'
  else
  if (Sender = rbFrench) then
    SMLanguage1.ResourceFile := 'french.lng'
  else
  if (Sender = rbRussian) then
    SMLanguage1.ResourceFile := 'russian.lng';
  SMLanguage1.ResourceFile := ExtractFilePath(Application.ExeName) + SMLanguage1.ResourceFile;

  SMLanguage1.LoadResources(SMLanguage1.ResourceFile);
  strMessageText := SMLanguage1.TranslateUserMessage('MessageText', 'You clicked on button');
end;

procedure TfrmMain.btnClickClick(Sender: TObject);
begin
  ShowMessage(strMessageText);
end;

procedure TfrmMain.Exit1Click(Sender: TObject);
begin
  Close
end;

procedure TfrmMain.lblURLClick(Sender: TObject);
begin
  ShellExecute(0, 'open', PChar(lblURL.Caption), nil, nil, SW_SHOWNORMAL);
end;

end.
