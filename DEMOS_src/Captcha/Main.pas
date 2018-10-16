unit Main;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, smcaptcha, StdCtrls;

type
  TfrmMain = class(TForm)
    btnOK: TButton;
    btnCancel: TButton;
    pnlHeader: TPanel;
    lblHeader: TLabel;
    imgLogo: TImage;
    lblWelcome: TLabel;
    pnlLogon: TPanel;
    lblUserID: TLabel;
    lblPassword: TLabel;
    lblConfirmation: TLabel;
    edUserID: TEdit;
    edPassword: TEdit;
    SMCaptcha1: TSMCaptcha;
    lblInfo: TLabel;
    edConfirmation: TEdit;
    bvlButtons: TBevel;
    lblSensetive: TLabel;
    imgChangePicture: TImage;
    lblURL: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure imgChangePictureClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure lblURLClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.DFM}
{$R winxp.res}

uses ShellAPI;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  SMCaptcha1.CaseSensetive := False;
end;

procedure TfrmMain.btnOKClick(Sender: TObject);
begin
  if SMCaptcha1.ValidateValue(edConfirmation.Text) then
    ShowMessage('Confirmed')
  else
    ShowMessage('Confirmation is not valid. Try again')
end;

procedure TfrmMain.imgChangePictureClick(Sender: TObject);
begin
  SMCaptcha1.Initialize
end;

procedure TfrmMain.btnCancelClick(Sender: TObject);
begin
  Close
end;

procedure TfrmMain.lblURLClick(Sender: TObject);
begin
  ShellExecute(0, 'open', PChar(lblURL.Caption), nil, nil, SW_SHOWNORMAL);
end;

end.
