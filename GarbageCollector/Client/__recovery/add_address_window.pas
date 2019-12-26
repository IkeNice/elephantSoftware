unit add_address_window;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons;

type
  Tform_Add_Address = class(TForm)
    Label2: TLabel;
    Label3: TLabel;
    BitBtn1: TBitBtn;
    label_street: TEdit;
    label_number: TEdit;
    Label4: TLabel;
    label_floor: TEdit;
    BitBtn2: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  form_Add_Address: Tform_Add_Address;

implementation

{$R *.dfm}

end.
