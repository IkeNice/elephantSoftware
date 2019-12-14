unit Menu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.Menus, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfmMenu = class(TForm)
    dbgMenu: TDBGrid;
    dsMenu: TDataSource;
    MainMenu1: TMainMenu;
    miDrinks: TMenuItem;
    miDesserts: TMenuItem;
    miFirstCourse: TMenuItem;
    btnChoose: TButton;
    Panel1: TPanel;
    miSecondCourse: TMenuItem;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmMenu: TfmMenu;

implementation

{$R *.dfm}

uses dm;

procedure TfmMenu.FormActivate(Sender: TObject);
begin
  dsMenu.DataSet := dmMy.cdsMenu;
  fmMenu.Width := 580;
  fmMenu.Top := 200;
  fmMenu.Left := 400;
  btnChoose.Left := fmMenu.Width - btnChoose.Width - 50;
end;

procedure TfmMenu.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dsMenu.DataSet := nil;
end;

end.
