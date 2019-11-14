program ProjectServer;

uses
  Vcl.Forms,
  Server in 'Server.pas' {Form1},
  TestServer in 'TestServer.pas' {fmTestServer};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfmTestServer, fmTestServer);
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
