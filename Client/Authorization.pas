unit Authorization;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.SqlExpr, Vcl.StdCtrls,
  Data.DBXFirebird;

type
  TForm2 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Button1: TButton;
    Button2: TButton;
    SQLConnection1: TSQLConnection;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;
  f : boolean = false;

implementation

{$R *.dfm}
uses main;

procedure TForm2.Button2Click(Sender: TObject);
begin
if ((Length(Edit1.Text)=0) or (Length(Edit1.Text)=0)) then
  ShowMessage('��� ������������ ��� ������ �� ����� ���� �������!')
  else
with SQLConnection1 do
  begin
    Params.Values['Database']:='D:\���������\Desktop\elephantSoftware\Authentication\ELEPHANTSOFTWARE.FDB';
    Params.Values['Login']:=Edit1.Text;
    Params.Values['Password']:=Edit2.Text;
    Params.Values['SQLDialect']:='3';
  end;
  try
    Screen.Cursor := crSQLWait;
    SQLConnection1.Open;
    Screen.Cursor := crDefault;
    ModalResult := mrOk;
    fmMain.ShowModal;
  except
    Screen.Cursor := crDefault;
    MessageDlg('������� ������ '+'����� ��� ������. ���������� ��� ���',mtError,[mbOk],0);
    Edit1.SetFocus;
  end;
end;

procedure TForm2.Button1Click(Sender: TObject);
begin
   Edit1.clear;
   Edit2.clear;
end;

procedure TForm2.Button3MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
if (f=false) then
begin
Edit2.PasswordChar := #0;
f:=true;
end
else
begin
Edit2.PasswordChar := #42;
f:=false;
end
end;

end.
