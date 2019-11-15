program ProjectServer;

uses
  Vcl.Forms,
  Server in 'Server.pas' {Form1},
  Configure in 'Configure.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TfmTestServer, fmTestServer);
  Application.Run;
end.
