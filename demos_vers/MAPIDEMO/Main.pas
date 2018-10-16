unit Main;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, SendMail;

type
  TForm1 = class(TForm)
    MAPIMail1: TMAPIMail;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.Button1Click(Sender: TObject);
begin
  {define a subject of message}
  MAPIMail1.Subject := 'bug report';

  {define a body of message}
  MAPIMail1.Body := 'This message contain technical information about program execution error.'#13#10 +
    'Please, press the "Send" button in your mailer to send this message to ' +
    'on-line product support. If "Send" button is disabled, please forward this ' +
    'message to %s. Also, you can send this file %s as attachment in your message to us. '+
    'We will be glad to receive this bug report from you in any form. This report does ' +
    'NOT contain any CONFIDENTIAL information. You can insert your comment in this message '+
    'after horisontal line below.'#13#10 +
    '--------------------------------------------------------------------------'#13#10 +
    'PLEASE, INSERT YOUR COMMENT HERE: ';

  {send message to recipients}
  MAPIMail1.Recipients.Clear;
  MAPIMail1.Recipients.Add('aa@aa.com');
  MAPIMail1.Recipients.Add('bb@bb.com');

  {include a few attachments to message}
  MAPIMail1.Attachments.Clear;
  MAPIMail1.Attachments.Add('c:\autoexec.bat');

  {before message sending, to open a message dialog for editing
  Else message will be sent in "silence" mode}
  MAPIMail1.EditDialog := True;

  {send message}
  if MAPIMail1.Send then
    ShowMessage('Message is sent successfully')
  else
    ShowMessage('Message is failed (' + IntToStr(MapiMail1.LastError) + ')');
end;

end.
