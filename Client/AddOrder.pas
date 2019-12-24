unit AddOrder;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.ExtCtrls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, Data.Win.ADODB, Vcl.WinXPickers, DateUtils;

type
  TfmOrder = class(TForm)
    lbAddres: TLabel;
    btnAddAddress: TButton;
    eOrderer: TEdit;
    lbOrderer: TLabel;
    dbgProducts: TDBGrid;
    btnShowMenu: TButton;
    dsProducts: TDataSource;
    btnCancel: TBitBtn;
    btnOk: TBitBtn;
    lbNumber: TLabel;
    edPhone: TEdit;
    Label1: TLabel;
    pnlAddress: TPanel;
    tpTimeOfDelivery: TTimePicker;
    cbTimeOfDelivery: TCheckBox;
    lbOrderNumber: TLabel;
    btnRefresh: TButton;
    lbSetAddress: TLabel;
    procedure btnOkClick(Sender: TObject);
    procedure btnAddAddressClick(Sender: TObject);
    procedure btnShowMenuClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure cbTimeOfDeliveryClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmOrder: TfmOrder;
  orderNum :integer = 0;  // номер заказа для Caption на новой кнопке (потом использовать ID в бд)
  addrID :integer;
  addressString, time: string;
implementation
uses main, addAddress, Menu, dm, ChooseAddress;
{$R *.dfm}

//================== ДОБАВЛЕНИЕ АДРЕСА ==================//
procedure TfmOrder.btnAddAddressClick(Sender: TObject);
begin
  dsProducts.DataSet := nil;
  fmChooseAddress.ShowModal;
  lbSetAddress.Caption := addressString;
end;
//*******************************************************//
 procedure TfmOrder.btnCancelClick(Sender: TObject);
begin
  //удалякм врЕменный заказ из БД при отмене
  dmMy.smDeleteOrder(orderNum);
end;
//========= ДОБАВЛЕНИЕ ПАНЕЛИ ПО НАЖАТИЮ КНОПКИ =========//
procedure TfmOrder.btnOkClick(Sender: TObject);
var
  Panel: Tpanel;
begin
//  orderNum:= orderNum+1;
  Panel:= TPanel.Create(fmMain.sboxOrders);
  Panel.Parent:= fmMain.sboxOrders;
  Panel.Align:= alTop;
  Panel.Width:= fmMain.sboxOrders.Width;
  Panel.Height:= 50;
  Panel.Caption:= 'Заказ № ' + IntToStr(orderNum);
  Panel.DragMode:= dmAutomatic;

  try
    dmMy.smUpdateOrder(orderNum, 1, eOrderer.Text, edPhone.Text, addrID, 4, 3, Now, time, 0);
  except
    MessageDlg('Ошибка записи заказа', mtError, [mbOk], 0)
  end;


//  fmOrder.Close;


end;

procedure TfmOrder.btnRefreshClick(Sender: TObject);
var SQL_Line: string;
begin
  SQL_Line := 'select menu.name, categories.name, order_info.quantity, order_info.price, order_info.order_id' +
             ' from order_info join menu ON order_info.product_id = menu.product_id' +
             ' join categories ON menu.category_id= categories.category_id where order_id = ' + orderNum.ToString;

  dmMY.smSQLClear;
  dmMy.smSQLAddString(SQL_Line);
  dmMy.smSQLExecute;
  dsProducts.DataSet := dmMy.IBQuery1;
  dsProducts.DataSet.Open;
  //Настройка dbgrid
  dbgProducts.Fields[0].DisplayLabel := 'Наименование';
  dbgProducts.Fields[0].DisplayWidth := 30;

  dbgProducts.Fields[1].DisplayLabel := 'Категория';
  dbgProducts.Fields[1].DisplayWidth := 15;

  dbgProducts.Fields[2].DisplayLabel := 'Количество';
  dbgProducts.Fields[2].DisplayWidth := 10;

  dbgProducts.Fields[3].DisplayLabel := 'Цена';
  dbgProducts.Fields[3].DisplayWidth := 5;
  dbgProducts.Fields[4].Visible := false;

  dbgProducts.Refresh;
end;

//*******************************************************//

//==================== ПОКАЗАТЬ МЕНЮ ====================//
procedure TfmOrder.btnShowMenuClick(Sender: TObject);
begin
  // показать меню выбора продуктов
  // если выбрали продукт и нажали Ок, добавляем выбранный продукт в таблицу, а потом в DBGrid
  fmMenu.edQuantity.Text := '';
  fmMenu.ShowModal;
  fmMenu.btnChoose.Enabled := false;
end;

procedure TfmOrder.cbTimeOfDeliveryClick(Sender: TObject);
begin
  tpTimeOfDelivery.Enabled := not(cbTimeOfDelivery.Checked);
  tpTimeOfDelivery.Time := IncHour(Now);
end;

procedure TfmOrder.FormActivate(Sender: TObject);
//var time: string;
begin
//TODO: Создать записи в БД для врЕменных заказов
  orderNum := dmMy.smUpdateOrder(0, 1, '', '', 4, 4, 3, Now, '', 0);
  lbOrderNumber.Caption := 'Номер заказа ' + orderNum.ToString;
  if cbTimeOfDelivery.Checked = true then begin
    tpTimeOfDelivery.Time := IncHour(Now);
    time := TimeToStr(tpTimeOfDelivery.Time);
    Delete(time, length(TimeToStr(tpTimeOfDelivery.Time))-2,length(TimeToStr(tpTimeOfDelivery.Time)));
    tpTimeOfDelivery.Enabled := false;
  end
  else begin
    time := TimeToStr(tpTimeOfDelivery.Time);
    Delete(time, length(TimeToStr(tpTimeOfDelivery.Time))-2,length(TimeToStr(tpTimeOfDelivery.Time)));
    tpTimeOfDelivery.Enabled := true;
  end;
  btnRefreshClick(self);
end;

procedure TfmOrder.FormCreate(Sender: TObject);
var i: integer;
begin


end;

//*******************************************************//
end.
