unit add_order_window;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, data_module, data_module_add, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Buttons,Vcl.WinXPickers,DateUtils, add_customer_window;

type
  TForm_add_order = class(TForm)
    DataSource_from_address: TDataSource;
    DBGrid_from_address: TDBGrid;
    DBGrid_to_address: TDBGrid;
    Label5: TLabel;
    Label6: TLabel;
    lbClientName: TLabel;
    BitBtn1: TBitBtn;
    DataSource_to_address: TDataSource;
    cbTimeOfDelivery: TCheckBox;
    tpTimeOfDelivery: TTimePicker;
    edClientName: TEdit;
    lbPhone: TLabel;
    edPhone: TEdit;
    Label1: TLabel;
    BitBtn2: TBitBtn;
    btnShowMenu: TButton;
    lbSearch: TLabel;
    edSearch: TEdit;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure cbTimeOfDeliveryClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_add_order: TForm_add_order;

implementation

{$R *.dfm}

procedure TForm_add_order.Button1Click(Sender: TObject);
begin
  form_Add_customer := Tform_Add_customer.Create(Application);
  form_Add_customer.ShowModal;
  if form_Add_customer.ModalResult = mrOk then  begin
      dm_add.add_customer(form_Add_customer.label_name.Text,
                          form_Add_customer.label_surname.Text,
                          dm.TAddress_In.FieldByName('ID').Value,
                          form_Add_customer.label_phone.Text);
   end;
   dm.open_all;
end;

procedure TForm_add_order.cbTimeOfDeliveryClick(Sender: TObject);
begin
  tpTimeOfDelivery.Enabled := not(cbTimeOfDelivery.Checked);
  tpTimeOfDelivery.Time := IncHour(Now);
end;

procedure TForm_add_order.FormActivate(Sender: TObject);
begin
  if cbTimeOfDelivery.Checked = true then begin
    tpTimeOfDelivery.Time := IncHour(Now);
    tpTimeOfDelivery.Enabled := false;
  end
  else begin
    tpTimeOfDelivery.Enabled := true;
  end;
end;

end.
