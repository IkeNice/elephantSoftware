program ProjectServer;

uses
  Vcl.Forms,
  Server in 'Server.pas' {Form1},
  Configure in 'Configure.pas',
  ProjectServer_TLB in 'ProjectServer_TLB.pas',
  MyDM in 'MyDM.pas' {MyServer: TRemoteDataModule} {MyServer: CoClass};

{$R *.TLB}

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  //Application.CreateForm(TfmTestServer, fmTestServer);
  Application.Run;
end.
