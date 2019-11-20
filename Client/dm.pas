unit dm;

interface

uses
  System.SysUtils, System.Classes, Data.DB, IBX.IBCustomDataSet, IBX.IBQuery,
  IBX.IBDatabase, Datasnap.DBClient, Datasnap.Win.MConnect;

type
  TdmMy = class(TDataModule)
    DCOMConnection1: TDCOMConnection;
    cdsOrders: TClientDataSet;
    cdsOrdersInfo: TClientDataSet;
    cdsAddresses: TClientDataSet;
    cdsMenu: TClientDataSet;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmMy: TdmMy;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdmMy.DataModuleCreate(Sender: TObject);
begin
  cdsOrders.Open;
  cdsOrdersInfo.Open;
  cdsAddresses.Open;
  cdsMenu.Open;
  //DCOMConnection1.AppServer.smUpdateProduct(0, '����', 1, 100);
  //DCOMConnection1.AppServer.smDeleteProduct(0);
  //DCOMConnection1.AppServer.smUpdateAddress(0, '�������', '3/4', 43);
end;

procedure TdmMy.DataModuleDestroy(Sender: TObject);
begin
  DCOMConnection1.Close;
end;

end.
