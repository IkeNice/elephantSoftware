unit UDPServer;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, IdUDPServer, IdBaseComponent,
  IdComponent, IdUDPBase, IdUDPClient, Vcl.StdCtrls;

type
  TUDP = class(TForm)
    Edit1: TEdit;
    Label1: TLabel;
    IdUDPClient1: TIdUDPClient;
    IdUDPServer1: TIdUDPServer;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  UDP: TUDP;

implementation

{$R *.dfm}

end.
