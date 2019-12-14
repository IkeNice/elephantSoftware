unit main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Menus, Vcl.ExtCtrls;

type
  TfmMain = class(TForm)
    pnlOrders: TPanel;
    pnlDrivers: TPanel;
    pnlHeader: TPanel;
    lbDrivers: TLabel;
    lbStatus: TLabel;
    lbOrders: TLabel;
    pnlControl: TPanel;
    btnAddOrder: TButton;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    sboxOrders: TScrollBox;
    sboxDrivers: TScrollBox;
    sboxStatus: TScrollBox;
    Button1: TButton;
    miClose: TMenuItem;
    procedure FormResize(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnAddOrderClick(Sender: TObject);
    procedure pnlOrdersDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure pnlOrdersDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure sboxOrdersMouseWheelDown(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure ScrollBox1MouseWheelUp(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure Button1Click(Sender: TObject);
    procedure miCloseClick(Sender: TObject);
    procedure miAddOrderClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmMain: TfmMain;

implementation

{$R *.dfm}

uses AddOrder, test, addAddress, dm;

procedure TfmMain.btnAddOrderClick(Sender: TObject);
begin
  fmOrder.ShowModal;
end;

procedure TfmMain.miAddOrderClick(Sender: TObject);
begin
  fmOrder.ShowModal;
end;

procedure TfmMain.miCloseClick(Sender: TObject);
begin
  Close;
end;

//=================== ПОТОМ УБРАТЬ!!! ===================//
procedure TfmMain.Button1Click(Sender: TObject);
begin
  fmTest.ShowModal;
end;
//*******************************************************//

//================== ФОРМИРОВАНИЕ ОКНА ==================//
procedure TfmMain.FormActivate(Sender: TObject);
begin
  pnlOrders.Width := fmMain.ClientWidth div 3;
  pnlDrivers.Width := 2*fmMain.ClientWidth div 3;
  sboxStatus.Width := pnlDrivers.Width div 2;
  sboxDrivers.Width := pnlDrivers.Width div 2;
  sboxOrders.Width := pnlOrders.Width;
  sboxOrders.Height := pnlOrders.Height;
  lbDrivers.Left := (pnlHeader.Width div 3) - ((pnlHeader.Width div 3) div 2) - lbDrivers.Width;
  lbStatus.Left := (pnlHeader.Width div 3) + ((pnlHeader.Width div 3) div 2) - lbStatus.Width;
  lbOrders.Left := (pnlHeader.Width div 3) + 3*((pnlHeader.Width div 3) div 2) - lbOrders.Width;
  btnAddOrder.Left :=  (pnlControl.Width div 3) + 3*((pnlControl.Width div 3) div 2) - btnAddOrder.Width div 2;
end;

procedure TfmMain.FormResize(Sender: TObject);
begin
  pnlOrders.Width := fmMain.ClientWidth div 3;
  pnlDrivers.Width := 2*fmMain.ClientWidth div 3;
  sboxStatus.Width := pnlDrivers.Width div 2;
  sboxDrivers.Width := pnlDrivers.Width div 2;
  sboxOrders.Width := pnlOrders.Width;
  sboxOrders.Height := pnlOrders.Height;
end;

//*******************************************************//

//==================== DRAG-AND-DROP ====================//
procedure TfmMain.pnlOrdersDragDrop(Sender, Source: TObject; X, Y: Integer);
begin
//  (Source as TPanel).Parent:=(Sender as TScrollBar);   // для TScrollBar
//  (Source as TPanel).Parent:=(Sender as TPanel);  // для TPanel
  TPanel(Source).Parent := TScrollBox(Sender);  // для ScrollBox
  Tpanel(Source).Align := alTop; // позиция вскегда сверху
  //TPanel(Source).Left:=0;
  //TPanel(Source).Top:=Y;
end;

procedure TfmMain.pnlOrdersDragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
  Accept:=true;
end;
//*******************************************************//

//=======  ПРОКРУТКА SCROLLBOX С ПОМОЩЬЮ КОЛЕСИКА =======//
// колесико вниз
procedure TfmMain.sboxOrdersMouseWheelDown(Sender: TObject; Shift: TShiftState;
  MousePos: TPoint; var Handled: Boolean);
begin
  with sboxOrders.VertScrollBar do
    Position:= Position +15;
end;
// колесико вверх
procedure TfmMain.ScrollBox1MouseWheelUp(Sender: TObject; Shift: TShiftState;
  MousePos: TPoint; var Handled: Boolean);
begin
  with sboxOrders.VertScrollBar do
    Position:= Position -15;
end;
//*******************************************************//
end.
