unit test;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Grids;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Button1: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Panel1Resize(Sender: TObject);
//    procedure ListBox1DragOver(Sender, Source: TObject; X, Y: Integer;
//      State: TDragState; var Accept: Boolean);
//    procedure ListBox2DragOver(Sender, Source: TObject; X, Y: Integer;
//      State: TDragState; var Accept: Boolean);
//    procedure ListBox1DragDrop(Sender, Source: TObject; X, Y: Integer);
//    procedure ListBox2DragDrop(Sender, Source: TObject; X, Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
   x : integer = 0;
   y : integer = 0;
implementation
{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
//  Panel: TPanel;
  Button: TButton;
//  Memo: TMemo;
begin
  Button:=TButton.Create(Panel2);
  Button.Parent:=Panel2;
  Button.DragMode := dmAutomatic;
  Button.Width:=Panel2.Width;
  Button.Height:=50;
//  Edit2.Text := IntToStr(Button.Left);
//  Memo:=TMemo.Create(Form1);
//  Memo.Parent:=Form1;
//  Memo.Left:=50;
//  Memo.Top:=50;
//  Memo.Width:=250;
//  Memo.Height:=100;
Button.Top:=y;
y := y+ 50;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Panel2.Width := Form1.Width div 2;
  Panel1.Width := Form1.Width div 2;
end;


{
procedure TForm1.Panel2DragDrop(Sender, Source: TObject; X, Y: Integer);
begin
  TPanel(Source).Parent := TScrollBox(Sender);  // для ScrollBox
  TPanel(Source).Left:=X;
  TPanel(Source).Top:=Y;
  if ((X > Panel1.Left) and (X < Panel1.Width)) then begin
    X := Panel1.Left;
//    Edit1.Text := IntToStr(X);
  end;
end;

procedure TForm1.Panel2DragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
  Accept:=true;
end;
procedure TForm1.ListBox1DragDrop(Sender, Source: TObject; X, Y: Integer);
var i: integer;
begin
for i := 0 to ListBox2.Items.Count - 1 do
  if (ListBox2.Selected[i]) and (ListBox1.Items.IndexOf(ListBox2.Items[i]) < 0) then
    ListBox1.Items.Add(ListBox2.Items[i]);
end;

procedure TForm1.ListBox1DragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
  Accept := (Source = ListBox2) and (ListBox2.ItemIndex >= 0);
end;

procedure TForm1.ListBox2DragDrop(Sender, Source: TObject; X, Y: Integer);
var
  s: string;
begin
  if Source = ListBox1 then
  begin
    ListBox2.Items.Add(ListBox1.Items[ListBox1.ItemIndex]);
    ListBox1.Items.Delete(ListBox1.ItemIndex);
    //удаляем перенесенный элемент
  end
  else //внутренняя перестановка
  begin
    s := ListBox2.Items[ListBox2.ItemIndex];
    ListBox2.Items.Delete(ListBox2.ItemIndex);
    ListBox2.Items.Insert(ListBox2.ItemAtPos(Point(X, Y), False), s);
    //находим, в какую позицию переносить и вставляем
  end;
end;

procedure TForm1.ListBox2DragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
  Accept := (Source is TListBox) and ((Source as TListBox).ItemIndex >= 0);
end;
}
procedure TForm1.Panel1Resize(Sender: TObject);
begin
  Panel1.Width := Form1.Width div 2;
  Panel2.Left := Panel1.Width;
  Panel2.Width := Form1.Width div 2;
end;

end.
