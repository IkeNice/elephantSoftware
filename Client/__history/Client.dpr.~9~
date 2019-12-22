program Client;

uses
  Vcl.Forms,
  main in 'main.pas' {fmMain},
  AddOrder in 'AddOrder.pas' {fmOrder},
  test in 'test.pas' {Form1},
  addAddres in 'addAddres.pas' {fmAddAddres};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfmMain, fmMain);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TfmOrder, fmOrder);
  Application.CreateForm(TfmAddAddres, fmAddAddres);
  Application.Run;
end.
