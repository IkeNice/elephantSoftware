unit show_menu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Menus,
  Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, add_order_window;

type
  TfmMenu = class(TForm)
    MainMenu1: TMainMenu;
    dbgMenu: TDBGrid;
    Panel1: TPanel;
    dsMenu: TDataSource;
    miAllMenu: TMenuItem;
    miFirstCourse: TMenuItem;
    miSecondCourse: TMenuItem;
    miDrink: TMenuItem;
    miDessert: TMenuItem;
    lbQuantity: TLabel;
    edQuantity: TEdit;
    btnChoose: TButton;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure miAllMenuClick(Sender: TObject);
    procedure edQuantityChange(Sender: TObject);
    procedure btnChooseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmMenu: TfmMenu;

implementation

{$R *.dfm}

uses data_module, operator_window_inh;

procedure TfmMenu.btnChooseClick(Sender: TObject);
var
  ProductID: integer;
  Accept:    Boolean;
begin
  ProductID:= dbgMenu.DataSource.DataSet.Fields[0].Value;
  dm.smUpdateOrderInfo(orderNum, ProductID, StrToInt(edQuantity.Text));
  Form_add_order.btnRefreshClick(Self);
  Close;
end;

procedure TfmMenu.edQuantityChange(Sender: TObject);
begin
  if edQuantity.Text <> '' then
  begin
    try
      StrToInt(edQuantity.Text);
      btnChoose.Enabled := (edQuantity.Text <> '');
    except
      btnChoose.Enabled := false;
    end;
  end
  else btnChoose.Enabled := false;
end;

procedure TfmMenu.FormActivate(Sender: TObject);
begin
    dsMenu.DataSet := dm.TVehicle;
    dsMenu.DataSet.Open;
    dbgMenu.Fields[0].DisplayLabel := '№';

    dbgMenu.Fields[1].DisplayLabel := 'Наименование';
    dbgMenu.Fields[1].DisplayWidth := 50;

    dbgMenu.Fields[2].DisplayLabel := 'Категория';
    dbgMenu.Fields[2].DisplayWidth := 10;

    dbgMenu.Fields[3].DisplayLabel := 'Цена';
    dbgMenu.Fields[3].DisplayWidth := 10;
    dbgMenu.Refresh;
end;

procedure TfmMenu.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dsMenu.DataSet := nil;
end;

procedure TfmMenu.miAllMenuClick(Sender: TObject);
begin
 dsMenu.Enabled:= true;
  // нажат пункт "Все меню"
  if Sender = MainMenu1.Items[0] then
  begin
    dsMenu.DataSet := dm.TVehicle;
    dsMenu.DataSet.Open;
    dbgMenu.Fields[0].DisplayLabel := '№';

    dbgMenu.Fields[1].DisplayLabel := 'Наименование';
    dbgMenu.Fields[1].DisplayWidth := 50;

    dbgMenu.Fields[2].DisplayLabel := 'Категория';
    dbgMenu.Fields[2].DisplayWidth := 10;

    dbgMenu.Fields[3].DisplayLabel := 'Цена';
    dbgMenu.Fields[3].DisplayWidth := 10;
    dbgMenu.Refresh;
  end
  // нажат пункт "Первое блюдо"
  else if Sender = MainMenu1.Items[1] then
  begin
    dm.smSQLClear;
    dm.smSQLAddString('select * from Menu where CATEGORY_ID = 1');
    dm.smSQLExecute;

    dsMenu.DataSet :=  dm.IBQuery1;
    dsMenu.DataSet.Open;
    dbgMenu.Fields[0].DisplayLabel := '№';

    dbgMenu.Fields[1].DisplayLabel := 'Наименование';
    dbgMenu.Fields[1].DisplayWidth := 50;

    dbgMenu.Fields[2].DisplayLabel := 'Категория';
    dbgMenu.Fields[2].DisplayWidth := 10;

    dbgMenu.Fields[3].DisplayLabel := 'Цена';
    dbgMenu.Fields[3].DisplayWidth := 10;

    dbgMenu.Refresh;
  end
  // нажат пункт "Второе блюдо"
  else if Sender = MainMenu1.Items[2] then
  begin
    dm.smSQLClear;
    dm.smSQLAddString('select * from Menu ');
    dm.smSQLAddString('where CATEGORY_ID = 2');
    dm.smSQLExecute;

    dsMenu.DataSet :=  dm.IBQuery1;
    dsMenu.DataSet.Open;
    dbgMenu.Fields[0].DisplayLabel := '№';

    dbgMenu.Fields[1].DisplayLabel := 'Наименование';
    dbgMenu.Fields[1].DisplayWidth := 50;

    dbgMenu.Fields[2].DisplayLabel := 'Категория';
    dbgMenu.Fields[2].DisplayWidth := 10;

    dbgMenu.Fields[3].DisplayLabel := 'Цена';
    dbgMenu.Fields[3].DisplayWidth := 10;

    dbgMenu.Refresh;
  end
  // нажат пункт "Десерты"
  else if Sender = MainMenu1.Items[3] then
  begin
    dm.smSQLClear;
    dm.smSQLAddString('select * from Menu ');
    dm.smSQLAddString('where CATEGORY_ID = 3');
    dm.smSQLExecute;

    dsMenu.DataSet :=  dm.IBQuery1;
    dsMenu.DataSet.Open;
    dbgMenu.Fields[0].DisplayLabel := '№';

    dbgMenu.Fields[1].DisplayLabel := 'Наименование';
    dbgMenu.Fields[1].DisplayWidth := 50;

    dbgMenu.Fields[2].DisplayLabel := 'Категория';
    dbgMenu.Fields[2].DisplayWidth := 10;

    dbgMenu.Fields[3].DisplayLabel := 'Цена';
    dbgMenu.Fields[3].DisplayWidth := 10;

    dbgMenu.Refresh;
  end
  // нажат пункт "Напитки"
  else if Sender = MainMenu1.Items[4] then
  begin
    dm.smSQLClear;
    dm.smSQLAddString('select * from Menu ');
    dm.smSQLAddString('where CATEGORY_ID = 4');
    dm.smSQLExecute;

    dsMenu.DataSet :=  dm.IBQuery1;
    dsMenu.DataSet.Open;
    dbgMenu.Fields[0].DisplayLabel := '№';

    dbgMenu.Fields[1].DisplayLabel := 'Наименование';
    dbgMenu.Fields[1].DisplayWidth := 50;

    dbgMenu.Fields[2].DisplayLabel := 'Категория';
    dbgMenu.Fields[2].DisplayWidth := 10;

    dbgMenu.Fields[3].DisplayLabel := 'Цена';
    dbgMenu.Fields[3].DisplayWidth := 10;

    dbgMenu.Refresh;
  end;
end;

end.
