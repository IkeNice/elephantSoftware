unit data_module_add;

interface

uses
  System.SysUtils, System.Classes, Data.DB, IBX.IBCustomDataSet,
  IBX.IBStoredProc, IBX.IBDatabase, common_db;

type
  Tdm_add = class(TDataModule)
    spAdd_Car: TIBStoredProc;
    spEdit_Car: TIBStoredProc;
    spEdit_Worker: TIBStoredProc;
    spAdd_Address: TIBStoredProc;
    spAdd_Order: TIBStoredProc;
    spAdd_Customer: TIBStoredProc;
    spAdd_Worker: TIBStoredProc;
  private
    { Private declarations }
  public
    procedure add_car(_name:string; category:integer; price:integer);
    procedure edit_car(id:integer; _name:string; category: integer; price: integer);
    procedure add_worker(empFirstname: string; empSecondname: string; empLastname: string; jobID: integer; login: string; password: string);
    function add_order(ID, StatusID: Integer; const Client, Phone: WideString;
            AddressID, CourierID, OperatorID: Integer; Date: TDateTime;
            const TimeOfDelivery: WideString; TotalPrice: Integer):integer;
    procedure edit_worker(id:integer; empFirstname: string; empSecondname: string; empLastname: string; jobID: integer; login: string; password: string);
   procedure add_address(street:string; building: string; flat:integer);
  end;

var
  dm_add: Tdm_add;

implementation
{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}
 //menu
procedure Tdm_add.add_car(_name:string; category: integer; price: integer);
begin
 with dm_add.spAdd_Car do
 begin
    Params[0].Value := 0;
    Params[1].Value := _name;
    Params[2].Value := category;
    Params[3].Value := price;
 // Execute the procedure
 if not Transaction.InTransaction then
   Transaction.StartTransaction;
 ExecProc;
 Transaction.Commit;
 end;
end;

procedure Tdm_add.edit_car(id:integer; _name:string; category: integer; price: integer);
begin
  with dm_add.spEdit_Car do
  begin
    Params[0].Value := id;
    params[1].Value := _name;
    Params[2].Value := category;
    Params[3].Value := price;
  // Execute the procedure
  if not Transaction.InTransaction then
    Transaction.StartTransaction;
  ExecProc;
  Transaction.Commit;
  end;
end;

procedure Tdm_add.add_worker(empFirstname: string; empSecondname: string;
                             empLastname: string; jobID: integer; login: string; password: string);
begin
with dm_add.spAdd_Worker do
  begin
  Params[0].Value := 0;
  Params[1].Value := empFirstname;
  Params[2].Value := empSecondname;
  Params[3].Value := empLastname;
  Params[4].Value := jobID;
  Params[5].Value := login;
  Params[6].Value := password;
  // Execute the procedure
  if not Transaction.InTransaction then
    Transaction.StartTransaction;
  ExecProc;
  Transaction.Commit;
  end;
end;

procedure Tdm_add.edit_worker(id:integer; empFirstname: string; empSecondname: string; empLastname: string; jobID: integer; login: string; password: string);
begin
with dm_add.spEdit_Worker do
  begin
    Params[0].Value := id;
    Params[1].Value := empFirstname;
    Params[2].Value := empSecondname;
    Params[3].Value := empLastname;
    Params[4].Value := jobID;
    Params[5].Value := login;
    Params[6].Value := password;

  // Execute the procedure
  if not Transaction.InTransaction then
    Transaction.StartTransaction;
  ExecProc;
  Transaction.Commit;
  end;
end;


function Tdm_add.add_order(ID, StatusID: Integer; const Client, Phone: WideString;
            AddressID, CourierID, OperatorID: Integer; Date: TDateTime;
            const TimeOfDelivery: WideString; TotalPrice: Integer): integer;
var res: integer;
begin
with dm_add.spAdd_Order do
  begin{
  ParamByName('ID_CUSTOMER').AsInteger := customer_id;
  ParamByName('WEIGHT').AsInteger := weight;
  ParamByName('FROM_ID_ADDREESS').AsInteger := from_id;
  ParamByName('TO_ID_ADDRESS').AsInteger := to_id;
  ParamByName('DATE_OF_DELIVERY').AsDate:= delivery;
  //ParamByName('WHO_DRIVER').AsInteger := null;
  ParamByName('ID_OPERATOR').AsInteger := operator_id;
  ParamByName('NUMBER_STEVEDORE').AsInteger := num_stevedore;
  ParamByName('PRICE').AsInteger := price;
  //ParamByName('STATUS').AsInteger := 0;
  //ParamByName('DATE_ORDER_COMPLETION').AsDate:= null;
  //ParamByName('DATE_ORDER_CANCELLATION').AsDate:= null;
   }
   Params[0].Value := ID;
   Params[1].Value := StatusID;
   Params[2].Value := Client;
   Params[3].Value := Phone;
   Params[4].Value := AddressID;
   Params[5].Value := CourierID;
   Params[6].Value := operatorID;
   Params[7].Value := Date;
   Params[8].Value := TimeOfDelivery;
   Params[9].Value := TotalPrice;
  //if Courier is not defined sets NULL-Value in DB
  if CourierID = 0 then
   Params[5].Clear;

  // Execute the procedure
  if not Transaction.InTransaction then
    Transaction.StartTransaction;
  ExecProc;
  Transaction.Commit;

  if ID = 0 then
    res := spAdd_Order.Params[10].Value
  else
    res := 0;
  end;
  add_order := res;
end;

procedure Tdm_add.add_address(street:string; building:string;
                               flat: integer);
begin
with dm_add.spAdd_Address do
  begin
  Params[0].Value := 0;
  Params[1].Value := street;
  Params[2].Value := building;
  Params[3].Value := flat;
  // Execute the procedure
  if not Transaction.InTransaction then
    Transaction.StartTransaction;
  ExecProc;
  Transaction.Commit;
  end;
end;

end.
