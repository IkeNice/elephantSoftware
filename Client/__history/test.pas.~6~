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
  private
    { Private declarations }
    procedure ClickPanel(Sender: TObject);
  public
    { Public declarations }
  end;

var
  fmTest: TfmTest;
   x : integer = 0;
   y : integer = 0;
   orderNum :integer = 0;
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
begin
  orderNum:= orderNum+1;
  Panel:= TPanel.Create(fmTest.ScrollBox1);
  Panel.Parent:= fmTest.ScrollBox1;
  Panel.Align:= alTop;
  Panel.Width:= fmTest.ScrollBox1.Width;
  Panel.Height:= 50;
  Panel.Caption:= '«‡Í‡Á π ' + IntToStr(orderNum);
  Panel.DragMode:= dmAutomatic;
end;

procedure TfmTest.FormCreate(Sender: TObject);
begin
  Panel2.Width := fmTest.Width div 2;
  Panel1.Width := fmTest.Width div 2;
  Panel3.OnClick := ClickPanel;
end;

procedure TfmTest.Panel1Resize(Sender: TObject);
begin
  Panel1.Width := fmTest.Width div 2;
  Panel2.Left := fmTest.Width;
  Panel2.Width := fmTest.Width div 2;
end;

procedure TfmTest.Panel2DragDrop(Sender, Source: TObject; X, Y: Integer);
begin
  TPanel(Source).Parent := TScrollBox(Sender);  // ‰Îˇ ScrollBox
  TPanel(Source).Left:=X;
  TPanel(Source).Top:=Y;
end;

procedure TfmTest.Panel2DragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
 Accept:=true;
end;

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

procedure TfmTest.ClickPanel(Sender: TObject);
begin
  fmTest1.ShowModal;
end;

end.
