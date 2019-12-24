unit Menu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.Menus, Vcl.StdCtrls, Vcl.ExtCtrls, AddOrder;

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
    lbQuantity: TLabel;
    edQuantity: TEdit;
    miAllMenu: TMenuItem;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edQuantityChange(Sender: TObject);
    procedure miAllMenuClick(Sender: TObject);
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

uses dm;

procedure TfmMenu.btnChooseClick(Sender: TObject);
var
  ProductID: integer;
  Accept:    Boolean;
begin
  ProductID:= dbgMenu.DataSource.DataSet.Fields[0].Value;
  dmMy.smUpdateOrderInfo(orderNum, ProductID, StrToInt(edQuantity.Text));
  fmOrder.btnRefreshClick(Self);
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
  fmMenu.Width := 580;
  fmMenu.Top := 200;
  fmMenu.Left := 400;
  btnChoose.Left := fmMenu.Width - btnChoose.Width - 50;

  dsMenu.DataSet := dmMy.dspMenu.DataSet;
  dsMenu.DataSet.Open;
  dbgMenu.Refresh;
end;

procedure TfmMenu.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dsMenu.DataSet := nil;
end;

procedure TfmMenu.miAllMenuClick(Sender: TObject);
var i: integer;
begin
  dsMenu.Enabled:= true;
  // ����� ����� "��� ����"
  if Sender = MainMenu1.Items[0] then
  begin
    dsMenu.DataSet := dmMy.ibtMenu;
    dsMenu.DataSet.Open;
    dbgMenu.Refresh;
  end
  // ����� ����� "������ �����"
  else if Sender = MainMenu1.Items[1] then
  begin
    dmMy.smSQLClear;
    dmMy.smSQLAddString('select * from Menu');
    dmMy.smSQLAddString('where CATEGORY_ID = 1');
    dmMy.smSQLExecute;

    dsMenu.DataSet :=  dmMy.IBQuery1;
    dsMenu.DataSet.Open;
    dbgMenu.Fields[0].DisplayLabel := '�';

    dbgMenu.Fields[1].DisplayLabel := '������������';
    dbgMenu.Fields[1].DisplayWidth := 50;

    dbgMenu.Fields[2].DisplayLabel := '���������';
    dbgMenu.Fields[2].DisplayWidth := 10;

    dbgMenu.Fields[3].DisplayLabel := '����';
    dbgMenu.Fields[3].DisplayWidth := 10;

    dbgMenu.Refresh;
  end
  // ����� ����� "������ �����"
  else if Sender = MainMenu1.Items[2] then
  begin
    dmMy.smSQLClear;
    dmMy.smSQLAddString('select * from Menu');
    dmMy.smSQLAddString('where CATEGORY_ID = 2');
    dmMy.smSQLExecute;

    dsMenu.DataSet :=  dmMy.IBQuery1;
    dsMenu.DataSet.Open;
    dbgMenu.Fields[0].DisplayLabel := '�';

    dbgMenu.Fields[1].DisplayLabel := '������������';
    dbgMenu.Fields[1].DisplayWidth := 50;

    dbgMenu.Fields[2].DisplayLabel := '���������';
    dbgMenu.Fields[2].DisplayWidth := 10;

    dbgMenu.Fields[3].DisplayLabel := '����';
    dbgMenu.Fields[3].DisplayWidth := 10;

    dbgMenu.Refresh;
  end
  // ����� ����� "�������"
  else if Sender = MainMenu1.Items[3] then
  begin
    dmMy.smSQLClear;
    dmMy.smSQLAddString('select * from Menu');
    dmMy.smSQLAddString('where CATEGORY_ID = 3');
    dmMy.smSQLExecute;

    dsMenu.DataSet :=  dmMy.IBQuery1;
    dsMenu.DataSet.Open;
    dbgMenu.Fields[0].DisplayLabel := '�';

    dbgMenu.Fields[1].DisplayLabel := '������������';
    dbgMenu.Fields[1].DisplayWidth := 50;

    dbgMenu.Fields[2].DisplayLabel := '���������';
    dbgMenu.Fields[2].DisplayWidth := 10;

    dbgMenu.Fields[3].DisplayLabel := '����';
    dbgMenu.Fields[3].DisplayWidth := 10;

    dbgMenu.Refresh;
  end
  // ����� ����� "�������"
  else if Sender = MainMenu1.Items[4] then
  begin
    dmMy.smSQLClear;
    dmMy.smSQLAddString('select * from Menu');
    dmMy.smSQLAddString('where CATEGORY_ID = 4');
    dmMy.smSQLExecute;

    dsMenu.DataSet :=  dmMy.IBQuery1;
    dsMenu.DataSet.Open;
    dbgMenu.Fields[0].DisplayLabel := '�';

    dbgMenu.Fields[1].DisplayLabel := '������������';
    dbgMenu.Fields[1].DisplayWidth := 50;

    dbgMenu.Fields[2].DisplayLabel := '���������';
    dbgMenu.Fields[2].DisplayWidth := 10;

    dbgMenu.Fields[3].DisplayLabel := '����';
    dbgMenu.Fields[3].DisplayWidth := 10;

    dbgMenu.Refresh;
  end;

end;

end.
