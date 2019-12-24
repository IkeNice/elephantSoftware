unit addAddress;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, dm;

type
  TfmAddAddress = class(TForm)
    lbStreet: TLabel;
    lbBuilding: TLabel;
    edStreet: TEdit;
    edBuilding: TEdit;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    edFlat: TEdit;
    lbFlat: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure edStreetChange(Sender: TObject);
    procedure edFlatKeyPress(Sender: TObject; var Key: Char);
    procedure btnOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmAddAddress: TfmAddAddress;

implementation

{$R *.dfm}

uses ChooseAddress;


procedure TfmAddAddress.btnOkClick(Sender: TObject);
begin
//  dmMy.smUpdateAddress(0, edStreet.Text, edBuilding.Text, StrToInt(edFlat.Text));
//  fmChooseAddress.dbgAddresses.Refresh;
end;

procedure TfmAddAddress.edFlatKeyPress(Sender: TObject; var Key: Char);
const Digit: set of Char=['0'..'9'];
begin
  if (not(Key in Digit) and (Key <> #8)) then
    Key:=#0;
end;

procedure TfmAddAddress.edStreetChange(Sender: TObject);
var i: integer;
begin
  btnOk.Enabled := True;
  for i := 0 to ComponentCount - 2 do
  if Components[i] is TEdit then
      btnOk.Enabled := btnOk.Enabled and ((Components[i] as TEdit).Text<>'');
end;

procedure TfmAddAddress.FormActivate(Sender: TObject);
var i : integer;
begin
  for i := 0 to ComponentCount - 1 do
    if Components[i] is TEdit then
      (Components[i] as TEdit).Text :='';
    btnOk.Enabled := False;
end;

end.
