unit ChooseAddress;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.ExtCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.Menus, Vcl.StdCtrls;

type
  TfmChooseAddress = class(TForm)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    dsChooseAddress: TDataSource;
    btnChooseAddress: TButton;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    procedure N1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmChooseAddress: TfmChooseAddress;

implementation

{$R *.dfm}

uses addAddress, dm;

procedure TfmChooseAddress.FormActivate(Sender: TObject);
begin
//  dsChooseAddress.DataSet := dmMy.dspAddresses{cdsAddresses};
end;

procedure TfmChooseAddress.N1Click(Sender: TObject);
begin
  fmAddAddress.ShowModal;
  if fmAddAddress.ModalResult = mrOk then begin
    try
      if (fmAddAddress.eFlat.Text <> '') then
        dmMy.{DCOMConnection1.AppServer.}smUpdateAddress(0,
        fmAddAddress.eStreet.Text,
        fmAddAddress.eBuilding.Text,
        StrToInt(fmAddAddress.eFlat.Text))
      else
        dmMy.{DCOMConnection1.AppServer.}smUpdateAddress(0,
        fmAddAddress.eStreet.Text,
        fmAddAddress.eBuilding.Text,0);
    // иначе выводим ошибку
    except
      MessageDlg('Ошибка записи в БД', mtError, [mbOk], 0)
    end;
//    dmMy.{cdsAddresses.}dspAddresses.Refresh;
  end;
end;

end.
