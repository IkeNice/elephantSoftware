program Client;

uses
  Vcl.Forms,
  main in 'main.pas' {fmMain},
  AddOrder in 'AddOrder.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfmMain, fmMain);
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
