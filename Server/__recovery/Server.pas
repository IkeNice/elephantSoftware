unit Server;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, IdContext, IdCustomHTTPServer,
  Vcl.StdCtrls, IdBaseComponent, IdComponent, IdCustomTCPServer, IdHTTPServer,
  Data.DB, IBX.IBDatabase, IdTCPConnection, IdTCPClient, IdHTTP;

type
  TfmServer = class(TForm)
    IBDatabase1: TIBDatabase;
    MyServer: TIdHTTPServer;
    Memo: TMemo;
    MyClient: TIdHTTP;
    Button1: TButton;
    procedure MyServerCommandGet(AContext: TIdContext;
      ARequestInfo: TIdHTTPRequestInfo; AResponseInfo: TIdHTTPResponseInfo);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmServer: TfmServer;

implementation

{$R *.dfm}

procedure TfmServer.Button1Click(Sender: TObject);
begin
    MyClient.Get('http://127.0.0.1:56001/?command=test&m1=value1&'
    +'param2=value2');
    //в первых ковычках IP адрес и порт сервера
    //
end;

procedure TfmServer.MyServerCommandGet(AContext: TIdContext;
  ARequestInfo: TIdHTTPRequestInfo; AResponseInfo: TIdHTTPResponseInfo);
begin
     AResponseInfo.ContentText:= 'unknow_Command';          //результат который сервер должен вернуть
     Memo.Text:=  ARequestInfo.Params.Text;     //хранит инфо которая пришла от клиентского приложения
     if ARequestInfo.Params.Values['command']='userLogin' then
        begin
//           if UserLogin(ARequestInfo.Params.Values['login'],
//           ARequestInfo.Params.Values['password']) then
//            AResponseInfo.ContentText:= 'result_OK'
//              else
//            AResponseInfo.ContentText:= 'result_Error';

        end;

end;

end.
