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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmOrder: TfmOrder;

implementation

{$R *.dfm}

end.
