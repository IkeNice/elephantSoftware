program Client;

uses
  Vcl.Forms,
  main in 'main.pas' {fmMain},
  AddOrder in 'AddOrder.pas' {fmOrder},
  test in 'test.pas' {Form1},
  Authorization in 'Authorization.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TfmMain, fmMain);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TfmOrder, fmOrder);
  Application.Run;
end.
