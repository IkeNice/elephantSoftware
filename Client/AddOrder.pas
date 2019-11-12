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
  y :integer = 0; // координаты верха для создаваемой кнопки
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
  Button: TButton;
  Panel: Tpanel;
begin
  orderNum:= orderNum+1;
  Button:= TButton.Create(fmMain.sboxOrders);
  Button.Parent:= fmMain.sboxOrders;
  Button.Top:=y;
  Button.Width:= fmMain.sboxOrders.Width;
  Button.Height:= 50;
  Button.Caption:= 'Заказ № ' + IntToStr(orderNum);
  Button.DragMode:= dmAutomatic;
  fmOrder.Close;
  y:=y+50;
end;

end.
