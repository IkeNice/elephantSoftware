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
    label_building: TEdit;
    Label4: TLabel;
    label_flat: TEdit;
    BitBtn2: TBitBtn;
    procedure label_streetChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  form_Add_Address: Tform_Add_Address;

implementation

{$R *.dfm}

procedure Tform_Add_Address.label_streetChange(Sender: TObject);
begin
  BitBtn1.Enabled := (label_street.Text <> '') and (label_building.Text <> '');
end;

end.
