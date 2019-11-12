unit Reg;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.SqlExpr, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Вход: TLabel;
    Login: TLabel;
    Password: TLabel;
    Button1: TButton;
    Button2: TButton;
    SQLConnection1: TSQLConnection;
    Edit1: TEdit;
    Edit2: TEdit;
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
  Form1: TForm1;
  f : boolean = false;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
if ((Length(Edit1.Text)=0) or (Length(Edit1.Text)=0)) then
  ShowMessage('Имя пользователя или пароль не могут быть пустыми!')
  else
with SQLConnection1 do
  begin
    Params.Values['Database']:='путь к бд';
    Params.Values['User_Name']:=Edit1.Text;
    Params.Values['Password']:=Edit2.Text;
    Params.Values['SQLDialect']:='3';
  end;
  try
    Screen.Cursor := crSQLWait;
    SQLConnection1.Open;
    Screen.Cursor := crDefault;
    ModalResult := mrOk;
  except
    Screen.Cursor := crDefault;
    MessageDlg('Неверно указана база данных'+'логин или пароль',mtError,[mbOk],0);
    Edit1.SetFocus;
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
   Edit1.Text := '';
   Edit2.Text := '';
end;



procedure TForm1.Button3MouseDown(Sender: TObject; Button: TMouseButton;
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
