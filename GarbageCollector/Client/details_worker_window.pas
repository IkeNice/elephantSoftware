unit details_worker_window;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, data_module, user_class;

type
  Tform_Details_Worker = class(TForm)
    label_name: TLabel;
    label_surname: TLabel;
    label_role: TLabel;
    label_id: TLabel;
    label_login: TLabel;
    label_password: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    id_worker:integer;
  end;

var
  form_Details_Worker: Tform_Details_Worker;

implementation

{$R *.dfm}

procedure Tform_Details_Worker.FormCreate(Sender: TObject);
begin
    Width := 302;
    Height := 215;
end;

procedure Tform_Details_Worker.FormShow(Sender: TObject);
var role:integer;
begin
    dm.QWorker_By_Id.ParamByName('EMP_ID').Value := id_worker;
    dm.QWorker_By_Id.Open;
    form_Details_Worker.label_id.Caption := 'Id: ' + IntToStr(id_worker);
    form_Details_Worker.label_name.Caption := 'Имя: ' + dm.QWorker_By_Id.FieldByName('FIRST_NAME').Value;
    form_Details_Worker.label_surname.Caption := 'Фамилия: ' + dm.QWorker_By_Id.FieldByName('SECOND_NAME').Value;
//    form_Details_Worker.label_dob.Caption := 'Дата принятия: ' + DateTimeToStr(dm.QWorker_By_Id.FieldByName('DOB').Value);
//    form_Details_Worker.label_exp.Caption := 'Опыт работы: ' + IntToStr(dm.QWorker_By_Id.FieldByName('EXPERIENCE').Value) + ' лет';
    role := dm.QWorker_By_Id.FieldByName('JOB_ID').Value;
//    ShowMessage(IntToStr(role));
    if role = 1 then begin
        form_Details_Worker.label_role.Caption := 'Менеджер';
    end
    else if role = 2 then begin
        form_Details_Worker.label_role.Caption := 'Оператор';
    end
    else if role = 3 then begin
        form_Details_Worker.label_role.Caption := 'Курьер';
    end;
    dm.QWorker_By_Id.Close;

    // user.get_role=0 then

    dm.QLogin_By_Id.ParamByName('ID_LOGIN').Value := id_worker;
    dm.QLogin_By_Id.Open;
    form_Details_Worker.label_login.Caption := 'Логин: ' + dm.QLogin_By_Id.FieldByName('LOGIN').Value;
    form_Details_Worker.label_password.Caption := 'Пароль: ' + dm.QLogin_By_Id.FieldByName('PASSWORD').Value;
    dm.QLogin_By_Id.Close;

    if dm.user.get_role = Oper  then
      with form_Details_Worker do begin
         label_login.Visible := false;
         label_password.Visible := false;
      end;

end;

end.
