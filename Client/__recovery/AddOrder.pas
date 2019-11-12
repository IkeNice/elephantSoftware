unit AddOrder;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.ExtCtrls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls;

type
  TfmOrder = class(TForm)
    lbAddres: TLabel;
    cbAddres: TComboBoxEx;
    btnAddAddres: TButton;
    btnAdd: TButton;
    procedure btnAddClick(Sender: TObject);
    procedure btnAddAddresClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmOrder: TfmOrder;
//  y :integer = 0; // координаты верха для создаваемой кнопки
  orderNum :integer = 0;  // номер заказа для Caption на новой кнопке (потом использовать ID в бд)

implementation
uses main, addAddres;
{$R *.dfm}

// создание новой Button на sboxOrders по нажатию кнопки "Готово"
procedure TfmOrder.btnAddAddresClick(Sender: TObject);
begin
  fmAddAddres.ShowModal;
end;

procedure TfmOrder.btnAddClick(Sender: TObject);
var
//  Button: TButton;
  Panel: Tpanel;
begin
  orderNum:= orderNum+1;
  Panel:= TPanel.Create(fmMain.sboxOrders);
  Panel.Parent:= fmMain.sboxOrders;
  Panel.Align:= alTop;
  Panel.Width:= fmMain.sboxOrders.Width;
  Panel.Height:= 50;
  Panel.Caption:= 'Заказ № ' + IntToStr(orderNum);
  Panel.DragMode:= dmAutomatic;
  fmOrder.Close;
//  y:=y+50;
end;

end.
