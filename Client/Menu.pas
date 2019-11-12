unit Menu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.Menus, Vcl.StdCtrls;

type
  TfmMenu = class(TForm)
    dbgMenu: TDBGrid;
    dsMenu: TDataSource;
    MainMenu1: TMainMenu;
    miDrinks: TMenuItem;
    miDesserts: TMenuItem;
    miSnacks: TMenuItem;
    btnChoose: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmMenu: TfmMenu;

implementation

{$R *.dfm}

end.
