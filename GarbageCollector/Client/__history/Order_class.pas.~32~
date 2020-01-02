unit Order_class;

interface
  uses data_module,IBX.IBTable, SysUtils;

  type TOrder = Class
  private
    id : integer;
    status : integer;
    driver_id : integer;
    customer : string;
    date_delivery : string;
    procedure push;
  public
    constructor Create(row : TIBTable);
    destructor Destroy;
    procedure Edit(P_id: integer);
    // Return driver id
    procedure update_driver(id_driver : integer);
    function get_id : integer;
    function get_status : integer;
    function get_driver_id : integer;
    function get_customer:string;
    function get_date_delivery:tdatetime;


  End;
implementation

function TOrder.get_id;
begin
   get_id  := id;
end;

function TOrder.get_status ;
begin
   get_status := status;
end;

function TOrder.get_driver_id;
begin
  get_driver_id := driver_id;
end;

function TOrder.get_customer;
begin
  get_customer := customer;
end;

function TOrder.get_date_delivery;
begin
//  get_date_delivery := StrToDateTime(date_delivery);
end;

constructor TOrder.Create(row : TIBTable);
begin
    id := row.FieldByName('ORDER_ID').AsInteger;
    status := row.FieldByName('STATUS_ID').AsInteger;
//    driver_id := row.FieldByName('COURIER_ID').AsInteger; // — ›“»Ã Õ≈ œŒ ¿«€¬¿ﬁ“—ﬂ «¿ ¿«€
    customer := row.FieldByName('CLIENT_NAME').AsString;
//    date_delivery := row.FieldByName('TIME_OF_DELIVERY').Value;
end;


destructor TOrder.Destroy;
begin

end;

procedure TOrder.Edit(P_id: Integer);
begin
  id := p_id;
end;

procedure TOrder.update_driver(id_driver : integer);
begin
     driver_id := id_driver;
     status := 0;
   push;
end;

procedure TOrder.push;
begin
  // push himself to db
     // Fill db procedure parametrs with form valut
    dm.spEDIT_ORDER_SET_DRIVER.ParamByName('INORDERID').AsInteger := id;
//    dm.spEDIT_ORDER_SET_DRIVER.ParamByName('ID_WORKERS').AsInteger:= driver_id ;
    dm.spEDIT_ORDER_SET_DRIVER.ParamByName('INNEWSTATUS').AsInteger:= status;

    // Execute the procedure
    if not dm.spEDIT_ORDER_SET_DRIVER.Transaction.InTransaction then
      dm.spEDIT_ORDER_SET_DRIVER.Transaction.StartTransaction;
    dm.spEDIT_ORDER_SET_DRIVER.ExecProc;

    dm.spEDIT_ORDER_SET_DRIVER.Transaction.Commit;
    dm.open_all;
end;

end.
