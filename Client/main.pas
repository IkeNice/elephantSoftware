unit main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Menus, Vcl.ExtCtrls;

type
  TfmMain = class(TForm)
    pnlOrders: TPanel;
    pnlDrivers: TPanel;
    sbOrders: TScrollBar;
    sbStatus: TScrollBar;
    sbDrivers: TScrollBar;
    pnlHeader: TPanel;
    lbDrivers: TLabel;
    lbStatus: TLabel;
    lbOrders: TLabel;
    procedure FormResize(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmMain: TfmMain;

implementation

{$R *.dfm}

procedure TfmMain.FormActivate(Sender: TObject);
begin
  pnlOrders.Width := fmMain.ClientWidth div 3;
  pnlDrivers.Width := 2*fmMain.ClientWidth div 3;
  sbStatus.Width := pnlDrivers.Width div 2;
  sbDrivers.Width := pnlDrivers.Width div 2;
  sbOrders.Width := pnlOrders.Width;
  sbOrders.Height := pnlOrders.Height;
  lbDrivers.Left := (pnlHeader.Width div 3) - ((pnlHeader.Width div 3) div 2) - lbDrivers.Width;
  lbStatus.Left := (pnlHeader.Width div 3) + ((pnlHeader.Width div 3) div 2) - lbStatus.Width;
  lbOrders.Left := (pnlHeader.Width div 3) + 3*((pnlHeader.Width div 3) div 2) - lbOrders.Width;
end;

procedure TfmMain.FormResize(Sender: TObject);
begin
  pnlOrders.Width := fmMain.ClientWidth div 3;
  pnlDrivers.Width := 2*fmMain.ClientWidth div 3;
  sbStatus.Width := pnlDrivers.Width div 2;
  sbDrivers.Width := pnlDrivers.Width div 2;
  sbOrders.Width := pnlOrders.Width;
  sbOrders.Height := pnlOrders.Height;
end;

end.
