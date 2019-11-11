unit AddOrder;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls;

type
  TfmOrder = class(TForm)
    lbAddres: TLabel;
    cbAddres: TComboBoxEx;
    btnAddAddres: TButton;
    btnAdd: TButton;
    procedure btnAddClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmOrder: TfmOrder;
  y :integer = 0; // ���������� ����� ��� ����������� ������
  orderNum :integer = 0;  // ����� ������ ��� Caption �� ����� ������ (����� ������������ ID � ��)

implementation
uses main;
{$R *.dfm}

// �������� ����� Button �� sboxOrders �� ������� ������ "������"
procedure TfmOrder.btnAddClick(Sender: TObject);
var
  Button: TButton;
begin
  orderNum:= orderNum+1;
  Button:= TButton.Create(fmMain.sboxOrders);
  Button.Parent:= fmMain.sboxOrders;
  Button.Top:=y;
  Button.Width:= fmMain.sboxOrders.Width;
  Button.Height:= 50;
  Button.Caption:= '����� � ' + IntToStr(orderNum);
  Button.DragMode:= dmAutomatic;
  fmOrder.Close;
  y:=y+50;
end;

end.
