unit MyDM;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  Windows, Messages, SysUtils, Classes, ComServ, ComObj, VCLCom, DataBkr,
  DBClient, ProjectServer_TLB, StdVcl, Datasnap.Provider, IBX.IBTable, Data.DB,
  IBX.IBCustomDataSet, IBX.IBQuery, IBX.IBDatabase, IBX.IBStoredProc;

type
  TMyServer = class(TRemoteDataModule, IMyServer)
    IBTransaction1: TIBTransaction;
    IBQuery1: TIBQuery;
    ibtOrders: TIBTable;
    ibtOrderInfo: TIBTable;
    ibtMenu: TIBTable;
    ibtAddresses: TIBTable;
    ibtSchedules: TIBTable;
    dspOrders: TDataSetProvider;
    dspOrderInfo: TDataSetProvider;
    dspMenu: TDataSetProvider;
    dspAddresses: TDataSetProvider;
    dspSchedules: TDataSetProvider;
    DataSetProvider6: TDataSetProvider;
    IBDatabase1: TIBDatabase;
    ibspUpdateAddress: TIBStoredProc;
    ibspDeleteAddress: TIBStoredProc;
    ibspUpdateProduct: TIBStoredProc;
    ibspDeleteProduct: TIBStoredProc;
    ibspUpdateOrder: TIBStoredProc;
    ibspDeleteOrder: TIBStoredProc;
    ibspUpdateOrderInfo: TIBStoredProc;
    ibspDeleteOrderInfo: TIBStoredProc;
    IBTable6: TIBTable;
    ibtCategories: TIBTable;
    ibtEmployees: TIBTable;
    ibtStatuses: TIBTable;
    dspCategories: TDataSetProvider;
    dspEmployees: TDataSetProvider;
    dspStatuses: TDataSetProvider;
    dspQuery: TDataSetProvider;
    ibtMenuPRODUCT_ID: TIntegerField;
    ibtMenuNAME: TIBStringField;
    ibtMenuCATEGORY_ID: TIntegerField;
    ibtMenuPRICE: TIntegerField;
    ibtAddressesADDRESS_ID: TIntegerField;
    ibtAddressesSTREET: TIBStringField;
    ibtAddressesBUILDING: TIBStringField;
    ibtAddressesAPARTMENT: TIntegerField;
  private
    { Private declarations }
  protected
    class procedure UpdateRegistry(Register: Boolean; const ClassID, ProgID: string); override;
    procedure smUpdateProduct(ID: Integer; const Name: WideString; Category, Price: Integer);
          safecall;
    procedure smDeleteProduct(ID: Integer); safecall;
    procedure smUpdateAddress(ID: Integer; const Street, Building: WideString; Apartment: Integer);
          safecall;
    procedure smDeleteAddress(ID: Integer); safecall;
    procedure smUpdateOrder(ID, StatusID: Integer; const Client: WideString; AddressID,
          CourierID, OperatorID: Integer; Date: TDateTime; TotalPrice: Integer);
          safecall;
    procedure smDeleteOrder(ID: Integer); safecall;
    procedure smUpdateOrderInfo(OrderID, ProductID, Quantity: Integer); safecall;
    procedure smDeleteOrderInfo(OrderID, ProductID: Integer); safecall;

  public
    { Public declarations }
  end;

implementation

{$R *.DFM}

class procedure TMyServer.UpdateRegistry(Register: Boolean; const ClassID, ProgID: string);
begin
  if Register then
  begin
    inherited UpdateRegistry(Register, ClassID, ProgID);
    EnableSocketTransport(ClassID);
    EnableWebTransport(ClassID);
  end else
  begin
    DisableSocketTransport(ClassID);
    DisableWebTransport(ClassID);
    inherited UpdateRegistry(Register, ClassID, ProgID);
  end;
end;

procedure TMyServer.smUpdateProduct(ID: Integer; const Name: WideString; Category,
          Price: Integer);
begin
  if ibspUpdateProduct.Transaction.InTransaction then
    ibspUpdateProduct.Transaction.Commit;
  ibspUpdateProduct.Params[0].Value := ID;
  ibspUpdateProduct.Params[1].Value := Name;
  ibspUpdateProduct.Params[2].Value := Category;
  ibspUpdateProduct.Params[3].Value := Price;
  ibspUpdateProduct.ExecProc;
  if ibspUpdateProduct.Transaction.InTransaction then
    ibspUpdateProduct.Transaction.Commit;
end;

procedure TMyServer.smDeleteProduct(ID: Integer);
begin
  if ibspDeleteProduct.Transaction.InTransaction then
    ibspDeleteProduct.Transaction.Commit;
  ibspDeleteProduct.Params[0].Value := ID;
  ibspDeleteProduct.ExecProc;
  if ibspDeleteProduct.Transaction.InTransaction then
    ibspDeleteProduct.Transaction.Commit;
end;

procedure TMyServer.smUpdateAddress(ID: Integer; const Street, Building: WideString;
          Apartment: Integer);
begin
  if ibspUpdateAddress.Transaction.InTransaction then
    ibspUpdateAddress.Transaction.Commit;
  ibspUpdateAddress.Params[0].Value := ID;
  ibspUpdateAddress.Params[1].Value := Street;
  ibspUpdateAddress.Params[2].Value := Building;
  ibspUpdateAddress.Params[3].Value := Apartment;
  ibspUpdateAddress.ExecProc;
  if ibspUpdateAddress.Transaction.InTransaction then
    ibspUpdateAddress.Transaction.Commit;
end;

procedure TMyServer.smDeleteAddress(ID: Integer);
begin
  if ibspDeleteAddress.Transaction.InTransaction then
    ibspDeleteAddress.Transaction.Commit;
  ibspDeleteAddress.Params[0].Value := ID;
  ibspDeleteAddress.ExecProc;
  if ibspDeleteAddress.Transaction.InTransaction then
    ibspDeleteAddress.Transaction.Commit;
end;

procedure TMyServer.smUpdateOrder(ID, StatusID: Integer; const Client: WideString;
          AddressID, CourierID, OperatorID: Integer; Date: TDateTime;
          TotalPrice: Integer);
begin
  if ibspUpdateOrder.Transaction.InTransaction then
    ibspUpdateOrder.Transaction.Commit;
  ibspUpdateOrder.Params[0].Value := ID;
  ibspUpdateOrder.Params[1].Value := StatusID;
  ibspUpdateOrder.Params[2].Value := Client;
  ibspUpdateOrder.Params[3].Value := AddressID;
  ibspUpdateOrder.Params[4].Value := CourierID;
  ibspUpdateOrder.Params[5].Value := OperatorID;
  ibspUpdateOrder.Params[6].Value := Date;
  ibspUpdateOrder.Params[7].Value := TotalPrice;
  ibspUpdateOrder.ExecProc;
  if ibspUpdateOrder.Transaction.InTransaction then
    ibspUpdateOrder.Transaction.Commit;
end;

procedure TMyServer.smDeleteOrder(ID: Integer);
begin
  if ibspDeleteOrder.Transaction.InTransaction then
    ibspDeleteOrder.Transaction.Commit;
  ibspDeleteOrder.Params[0].Value := ID;
  ibspDeleteOrder.ExecProc;
  if ibspDeleteOrder.Transaction.InTransaction then
    ibspDeleteOrder.Transaction.Commit;
end;

procedure TMyServer.smUpdateOrderInfo(OrderID, ProductID, Quantity: Integer);
begin
  if ibspUpdateOrderInfo.Transaction.InTransaction then
    ibspUpdateOrderInfo.Transaction.Commit;
  ibspUpdateOrderInfo.Params[0].Value := OrderID;
  ibspUpdateOrderInfo.Params[1].Value := ProductID;
  ibspUpdateOrderInfo.Params[2].Value := Quantity;
  ibspUpdateOrderInfo.ExecProc;
  if ibspUpdateOrderInfo.Transaction.InTransaction then
    ibspUpdateOrderInfo.Transaction.Commit;
end;

procedure TMyServer.smDeleteOrderInfo(OrderID, ProductID: Integer);
begin
  if ibspDeleteOrderInfo.Transaction.InTransaction then
    ibspDeleteOrderInfo.Transaction.Commit;
  ibspDeleteOrderInfo.Params[0].Value := OrderID;
  ibspDeleteOrderInfo.Params[1].Value := ProductID;
  ibspDeleteOrderInfo.ExecProc;
  if ibspDeleteOrderInfo.Transaction.InTransaction then
    ibspDeleteOrderInfo.Transaction.Commit;
end;

initialization
  TComponentFactory.Create(ComServer, TMyServer,
    Class_MyServer, ciMultiInstance, tmSingle);
end.
