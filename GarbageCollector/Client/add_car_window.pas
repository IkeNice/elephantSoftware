unit add_car_window;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  Tform_Add_Car = class(TForm)
    BitBtn1: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    label_name: TEdit;
    label_price: TEdit;
    BitBtn2: TBitBtn;
    cmbCategory: TComboBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  form_Add_Car: Tform_Add_Car;

implementation

{$R *.dfm}

         //< Выберите категорию>

end.
