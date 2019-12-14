unit AddOrder;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.ExtCtrls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, Data.Win.ADODB;

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
    cbAddress: TComboBox;
    lbNumber: TLabel;
    Edit1: TEdit;
    procedure btnOkClick(Sender: TObject);
    procedure btnAddAddressClick(Sender: TObject);
    procedure btnShowMenuClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmOrder: TfmOrder;
  orderNum :integer = 0;  // ����� ������ ��� Caption �� ����� ������ (����� ������������ ID � ��)

implementation
uses main, addAddress, Menu, dm;
{$R *.dfm}

//================== ���������� ������ ==================//
procedure TfmOrder.btnAddAddressClick(Sender: TObject);
begin
  fmAddAddress.ShowModal;
  // ���� ������ ��, �� �������� �������� ����� � ��
  if fmAddAddress.ModalResult = mrOk then begin
    try
      if (fmAddAddress.eFlat.Text <> '') then
        dmMy.DCOMConnection1.AppServer.smUpdateAddress(0,
        fmAddAddress.eStreet.Text,
        fmAddAddress.eBuilding.Text,
        StrToInt(fmAddAddress.eFlat.Text))
      else
        dmMy.DCOMConnection1.AppServer.smUpdateAddress(0,
        fmAddAddress.eStreet.Text,
        fmAddAddress.eBuilding.Text,0);
    // ����� ������� ������
    except
      MessageDlg('������ ������ � ��', mtError, [mbOk], 0)
    end;
    dmMy.cdsAddresses.Refresh;
  end;
end;
//*******************************************************//

//========= ���������� ������ �� ������� ������ =========//
procedure TfmOrder.btnOkClick(Sender: TObject);
var
  Panel: Tpanel;
begin
  orderNum:= orderNum+1;
  Panel:= TPanel.Create(fmMain.sboxOrders);
  Panel.Parent:= fmMain.sboxOrders;
  Panel.Align:= alTop;
  Panel.Width:= fmMain.sboxOrders.Width;
  Panel.Height:= 50;
  Panel.Caption:= '����� � ' + IntToStr(orderNum);
  Panel.DragMode:= dmAutomatic;
  fmOrder.Close;
end;
//*******************************************************//

//==================== �������� ���� ====================//
procedure TfmOrder.btnShowMenuClick(Sender: TObject);
begin
  // �������� ���� ������ ���������
  // ���� ������� ������� � ������ ��, ��������� ��������� ������� � �������, � ����� � DBGrid
  fmMenu.ShowModal;
  fmMenu.btnChoose.Enabled := false;
end;



procedure TfmOrder.FormCreate(Sender: TObject);
var i: integer;
begin
//============ ���������� �������� � COMBOBOX ===========//

//   cbAddress.Items.Clear;
//   fmOrder.ADOQuery1.Close;
//   fmOrder.ADOQuery1.SQL.Clear;
//   fmOrder.ADOQuery1.SQL.Add('select STREET, BUILDING, APARTAMENT from ADDRESSES');
//   fmOrder.ADOQuery1.Open;
//   fmOrder.ADOQuery1.First;
//   for  i := 0 to fmOrder.ADOQuery1.RecordCount - 1 do
//   begin
//      cbAddress.Items.Add(fmOrder.ADOQuery1.FieldByName('STREET').AsString);
//      fmOrder.ADOQuery1.Next;
//   end;
//   fmOrder.ADOQuery1.Close;


end;

//*******************************************************//
end.
