unit test;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Grids;

type
  TfmTest = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Button1: TButton;
    Edit2: TEdit;
    Panel3: TPanel;
    ScrollBox1: TScrollBox;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Panel1Resize(Sender: TObject);
    procedure Panel2DragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure Panel2DragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure ScrollBox1MouseWheelDown(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure ScrollBox1MouseWheelUp(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure Panel3MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
//    procedure Panel3MouseDown(Sender: TObject; Button: TMouseButton;
//      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
    procedure ClickPanel(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  public
    { Public declarations }
  end;

var
  fmTest: TfmTest;
   orderNum :integer = 0;
   dragflag: boolean;
implementation
{$R *.dfm}

uses test1;

{====================

// «ƒ≈—‹ ÃŒ∆ÕŒ œ»—¿“‹ ◊“Œ ”√ŒƒÕŒ //
//  ›“Œ œ–Œ—“Œ “≈—“Œ¬€… ﬁÕ»“   //

====================}

procedure TfmTest.Button1Click(Sender: TObject);
var
  Panel: TPanel;
  Button: TButton;
begin
  orderNum:= orderNum+1;
  Panel:= TPanel.Create(fmTest.ScrollBox1);
  Panel.Parent:= fmTest.ScrollBox1;
  Panel.Align:= alTop;
  Panel.Width:= fmTest.ScrollBox1.Width;
  Panel.Height:= 100;
  Panel.Caption:= '«‡Í‡Á π ' + IntToStr(orderNum);
  Panel.DragMode:= dmAutomatic;
end;

procedure TfmTest.FormCreate(Sender: TObject);
begin
  Panel2.Width := fmTest.Width div 2;
  Panel1.Width := fmTest.Width div 2;
  Panel3.OnMouseDown := ClickPanel;
end;

procedure TfmTest.Panel1Resize(Sender: TObject);
begin
  Panel1.Width := fmTest.Width div 2;
  Panel2.Left := fmTest.Width;
  Panel2.Width := fmTest.Width div 2;
end;
//==================== DRAG-AND-DROP ====================//
procedure TfmTest.Panel2DragDrop(Sender, Source: TObject; X, Y: Integer);
begin
  TPanel(Source).Parent := TScrollBox(Sender);  // ‰Îˇ ScrollBox
  TPanel(Source).Left:=X;
  TPanel(Source).Top:=Y;
  dragflag := false;
//  TPanel(Sender).Text := TPanel(Source).Text;
  TPanel(Sender).SetFocus;
//  TPanel(Sender).SelectAll;
end;

procedure TfmTest.Panel2DragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
   if Source is TPanel then
    Accept := True
  else
    Accept := False;
end;


procedure TfmTest.Panel3MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Button=mbLeft then
    TPanel(Sender).BeginDrag(True);
end;

//*******************************************************//
//=======  œ–Œ –”“ ¿ SCROLLBOX — œŒÃŒŸ‹ﬁ  ŒÀ≈—» ¿ =======//
procedure TfmTest.ScrollBox1MouseWheelDown(Sender: TObject; Shift: TShiftState;
  MousePos: TPoint; var Handled: Boolean);
begin
    with ScrollBox1.VertScrollBar do
    Position:= Position + 15;
end;

procedure TfmTest.ScrollBox1MouseWheelUp(Sender: TObject; Shift: TShiftState;
  MousePos: TPoint; var Handled: Boolean);
begin
    with ScrollBox1.VertScrollBar do
    Position:= Position - 15;
end;
//*******************************************************//
procedure TfmTest.ClickPanel(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
//var
//  Button: TMouseButton;
begin
//  fmTest1.ShowModal;
  if not dragflag then
    if Button=mbRight then
      fmTest1.ShowModal;
end;

end.
