program Project2;

uses
  Vcl.Forms,
  Http in 'Http.pas' {FHttp},
  Dm in 'Dm.pas' {DataModule2: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFHttp, FHttp);
  Application.CreateForm(TDataModule2, DataModule2);
  Application.Run;
end.
