unit Server;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, IdContext, IdCustomHTTPServer,
  Vcl.StdCtrls, IdBaseComponent, IdComponent, IdCustomTCPServer, IdHTTPServer,
  Data.DB, IBX.IBDatabase, IdTCPConnection, IdTCPClient, IdHTTP, System.Win.ScktComp;// web.win.sockets;

type
  TForm1 = class(TForm)
//    procedure MyServerCommandGet(AContext: TIdContext;
//      ARequestInfo: TIdHTTPRequestInfo; AResponseInfo: TIdHTTPResponseInfo);
    //procedure StartButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}


end.
