unit test1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TfmTest1 = class(TForm)
    dbgInfo: TDBGrid;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmTest1: TfmTest1;

implementation

{$R *.dfm}

end.
