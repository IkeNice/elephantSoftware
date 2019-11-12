unit test;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    Panel2: TPanel;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
//  Panel: TPanel;
  Button: TButton;
  Memo: TMemo;
  x,y: integer;
begin
  x:=50;
  y:=50;
  Button:=TButton.Create(Panel2);
  Button.Parent:=Panel2;
  Button.Left:=x+100;
  Button.Top:=y+100;
  Button.Width:=50;
  Button.Height:=50;
//  Memo:=TMemo.Create(Form1);
//  Memo.Parent:=Form1;
//  Memo.Left:=50;
//  Memo.Top:=50;
//  Memo.Width:=250;
//  Memo.Height:=100;
end;

end.
