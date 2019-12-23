unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, IBX.IBDatabase,
  IBX.IBSQLMonitor, IdUDPClient, IdBaseComponent, IdComponent, IdUDPBase,
  IdUDPServer, IdGlobal, IdSocketHandle,
  System.JSON, System.Generics.Collections, Vcl.ExtCtrls, syncobjs,
  IdServerIOHandler, IdSSL, IdSSLOpenSSL, IdTCPConnection, IdTCPClient, IdHTTP,
  IBX.IBCustomDataSet, IBX.IBQuery, IBX.IBStoredProc, IdContext,
  IdCustomHTTPServer, IdCustomTCPServer, IdHTTPServer, IBX.IBEvents,
  Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    IBDatabase1: TIBDatabase;
    IdUDPServer1: TIdUDPServer;
    IdUDPClient1: TIdUDPClient;
    IdHTTPServer1: TIdHTTPServer;
    IBEvents1: TIBEvents;
    IBQuery1: TIBQuery;
    IBEvents2: TIBEvents;
    Edit1: TEdit;
    Label1: TLabel;
    Button1: TButton;
    procedure IdUDPServer1UDPRead(AThread: TIdUDPListenerThread;
      const AData: TIdBytes; ABinding: TIdSocketHandle);
    procedure IdHTTPServer1CommandGet(AContext: TIdContext;
      ARequestInfo: TIdHTTPRequestInfo; AResponseInfo: TIdHTTPResponseInfo);
    procedure IBEvents1EventAlert(Sender: TObject; EventName: string;
      EventCount: Integer; var CancelAlerts: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure IBEvents2EventAlert(Sender: TObject; EventName: string;
      EventCount: Integer; var CancelAlerts: Boolean);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  jsonBuffer: TJSONObject;
  ArrayJson: TJSONArray;
  FCS: TCriticalSection;
  FCS2: TCriticalSection;
  host: String;

implementation

{$R *.dfm}

procedure SendFirebaseMessage(Token: String; Title : String; Body : String);
var
  IdHTTP: TIdHTTP;
  IdSSL: TIdSSLIOHandlerSocketOpenSSL;
  Data:TStringStream;
  jsonData1,jsonData2: TJSONObject;
  Answer : String;
begin
  IdHTTP := TIdHTTP.Create;

  try
    jsonData1 := TJSONObject.Create;
    jsonData2 := TJSONObject.Create;
    IdSSL := TIdSSLIOHandlerSocketOpenSSL.Create(IdHTTP);

    IdSSL.SSLOptions.Method := sslvSSLv23;
    IdHTTP.IOHandler := IdSSL;
    IdHTTP.Request.ContentType := 'application/json';
    IdHTTP.Request.CharSet := 'UTF-8';
//    IdHTTP.Request.CustomHeaders.Values['Authorization'] :=
//      'key=AIzaSyA_sM6ipUnv6yL30Wh-MH4nXZyyCoxmlPo';
    IdHTTP.Request.CustomHeaders.Values['Authorization'] :=
      'key=AIzaSyC28fUUJlmDOQMfuz2XQAaLNEJBs1bNwt4';

    jsonData2.AddPair('body',Body);
    jsonData2.AddPair('title',Title);
    jsonData2.AddPair('vibrate','1');
    jsonData2.AddPair('sound','default');

    jsonData1.AddPair('to',Token);
    jsonData1.AddPair('notification',jsonData2);

    Data := TStringStream.Create(jsonData1.ToString,TEncoding.UTF8);
    Answer := IdHTTP.Post('https://fcm.googleapis.com/fcm/send', Data);
  finally
    IdHTTP.Free;
  end;
end;

function generationKeyWord() : String;
var
  code,i : Integer;
begin
  Result := '';
  for i := 0 to 5 do
    begin
      code := 48 + Random(75);
      while ((code in [58..64]) or (code in [91..96])) do
        code := 48 + Random(75);
      Result := Result + Chr(code);
    end;
end;

function normalizationString(S : string) : string;
begin
  Delete(S,1,1);
  Delete(S,Length(S),1);
  Result := S;
end;

function ToLogIn (toLogInJSON: TJSONObject) : TJSONObject;
var
  idDriver : Integer;
  ResultJSON: TJSONObject;
  Transaction: TIBTransaction;
  SQLQuery: TIBQuery;
  keyWord, tokenDevice: String;
begin
  ResultJSON := TJSONObject.Create;
  Transaction := TIBTransaction.Create(nil);
  SQLQuery := TIBQuery.Create(nil);
  Transaction.DefaultDatabase := Form1.IBDatabase1;
  SQLQuery.Database := Form1.IBDatabase1;
  SQLQuery.Transaction := Transaction;
  //=============ПОЛУЧЕНИЕ ИД РАБОТНИКА=================
  SQLQuery.Active := false;
  SQLQuery.SQL.Clear;

  SQLQuery.SQL.Add('SELECT ID FROM AUTHOTIZATION ');
  SQLQuery.SQL.Add('WHERE LOGIN = ''' + normalizationString(toLogInJSON.GetValue('login').ToString) + '''');
  SQLQuery.SQL.Add(' AND PASSWORD = ''' + normalizationString(toLogInJSON.GetValue('password').ToString) + ''' and ROLE_ = 2');

  SQLQuery.Active := true;
  SQLQuery.Open;
  //=============ЕСЛИ ОН ЕСТЬ, ТО СОБИРАЕМ ИНФОРМАЦИЮ=================
  if (SQLQuery.RecordCount.ToBoolean) then
    begin
      idDriver := SQLQuery.FieldByName('ID').Value;
      keyWord := generationKeyWord();
      tokenDevice := normalizationString(toLogInJSON.GetValue('token').ToString);

      ResultJSON.AddPair('status','OK');
      ResultJSON.AddPair('id',idDriver.ToString);
      ResultJSON.AddPair('keyword',keyWord);
      //=============УСТАНОВКА НОВОГО КЛЮЧЕВОГО СЛОВА=================
      if Transaction.InTransaction then Transaction.Commit;
      SQLQuery.Active := false;
      SQLQuery.SQL.Clear;

      SQLQuery.SQL.Add('UPDATE DRIVERS_INFO ');
      SQLQuery.SQL.Add('SET KEYWORD = ''' + keyWord + '''');
      SQLQuery.SQL.Add(', TOKEN_DEVICE = ''' + tokenDevice + '''');
      SQLQuery.SQL.Add(' WHERE EMP_ID = ' + idDriver.ToString);
      SQLQuery.ExecSQL;

      SQLQuery.Active := true;
      SQLQuery.Open;
      if Transaction.InTransaction then Transaction.Commit;
      //=============ПОЛУЧЕНИЕ ИНФОРМАЦИИ О ЕГО ЗАКАЗАХ=================
      SQLQuery.Active := false;
      SQLQuery.SQL.Clear;

      SQLQuery.SQL.Add('select o.order_id, o.client_name NAME, o.phone_number PHONE_NUMBER, o.time_of_delivery TIME_OF_DELIVERY, o."DATE" DATE, o.total_price PRICE, o.status_id STATUS, ');
      SQLQuery.SQL.Add('a1.street STREET_TO, a1.building NUMBER_HOUSE_TO, a1.apartment FLOOR_TO from orders o');
 //     SQLQuery.SQL.Add('o.date_of_delivery,o.number_stevedore,o.price,o.status from orders o');
      SQLQuery.SQL.Add('join addresses a1 on');
      SQLQuery.SQL.Add('(o.address_id = a1.address_id) and (o.courier_id = '+idDriver.ToString+') and (o.status between 2 and 5)');
      SQLQuery.SQL.Add('join address a2 on (a2.id = o.to_id_address)');
      SQLQuery.SQL.Add('join customers c on (c.id = o.id_customer)');
      SQLQuery.SQL.Add('order by o.time_of_delivery descending');

      SQLQuery.Active := true;
      SQLQuery.Open;
      //=============ЗАПОЛНЕНИЕ JSONARRAY ЕГО ЗАКАЗАМИ=================
      jsonBuffer := TJSONObject.Create;
      ArrayJson := TJSONArray.Create;

      SQLQuery.First;

      while not SQLQuery.Eof do
        begin
          jsonBuffer.AddPair('id',VarToStr(SQLQuery.FieldByName('ID').Value));

          jsonBuffer.AddPair('customer_name',
            VarToStr(SQLQuery.FieldByName('NAME').Value));

          jsonBuffer.AddPair('customer_phone_number',VarToStr(SQLQuery.FieldByName('PHONE_NUMBER').Value));

          jsonBuffer.AddPair('destination_address',
            VarToStr(SQLQuery.FieldByName('STREET_TO').Value)+', '+
            VarToStr(SQLQuery.FieldByName('NUMBER_HOUSE_TO').Value)+' ('+
            VarToStr(SQLQuery.FieldByName('FLOOR_TO').Value)+ ' эт.)');

          jsonBuffer.AddPair('delivery_time',VarToStr(SQLQuery.FieldByName('TIME_OF_DELIVERY').Value));

     //     jsonBuffer.AddPair('number_of_movers',VarToStr(SQLQuery.FieldByName('NUMBER_STEVEDORE').Value));
          jsonBuffer.AddPair('date',VarToStr(SQLQuery.FieldByName('DATE').Value));
          jsonBuffer.AddPair('payment',VarToStr(SQLQuery.FieldByName('PRICE').Value));

          jsonBuffer.AddPair('status',VarToStr(SQLQuery.FieldByName('STATUS').Value));

          ArrayJson.AddElement(jsonBuffer);

          jsonBuffer := TJSONObject.Create;

          SQLQuery.Next;
        end;
        ResultJSON.AddPair('data',ArrayJson);
    end
    //=============ЕСЛИ ТАКОГО РАБОТНИКА НЕТ=================
  else
    begin
      ResultJSON.AddPair('status','error');
      ResultJSON.AddPair('message','There is an error in the login or password!');
    end;
  Result := ResultJSON;
end;

function ToKeyWordIn(toKeyWordInJSON : TJsonObject) : TJsonObject;
var
  ResultJSON : TJSONObject;
  Transaction: TIBTransaction;
  SQLQuery: TIBQuery;
  keyWord, tokenDevice: String;
begin
  ResultJSON := TJSONObject.Create;
  Transaction := TIBTransaction.Create(nil);
  SQLQuery := TIBQuery.Create(nil);
  Transaction.DefaultDatabase := Form1.IBDatabase1;
  SQLQuery.Database := Form1.IBDatabase1;
  SQLQuery.Transaction := Transaction;
  //=============ПОЛУЧЕНИЕ КЛЮЧЕВОГО СЛОВА РАБОТНИКА ИЗ ТАБЛИЦЫ=================
  SQLQuery.Active := false;
  SQLQuery.SQL.Clear;

  SQLQuery.SQL.Add('SELECT KEY_WORD FROM INFORMATIONS_DRIVERS WHERE ');
  SQLQuery.SQL.Add('ID = ''' +
    normalizationString(toKeyWordInJSON.GetValue('id').ToString) + '''');

  SQLQuery.Active := true;
  SQLQuery.Open;
  //=============ЕСЛИ ОНО ЕСТЬ (ВЕРНОЕ ИД)=================
  if (SQLQuery.RecordCount.ToBoolean) then
    begin
      keyWord := VarToStr(SQLQuery.FieldByName('KEY_WORD').Value);
      //=============ЕСЛИ ПОЛУЧЕННОЕ КЛЮЧЕВОЕ СЛОВО СОВПАДАЕТ С КЛЮЧЕВЫМ СЛОВОМ ИЗ ТАБЛИЦЫ ДЛЯ ЭТОГО РАБОТНИКА=================
      if (keyWord = normalizationString(toKeyWordInJSON.GetValue('keyword').ToString)) then
        begin
          ResultJSON.AddPair('status','OK');
          //=============ПОЛУЧЕНИЕ ИНФОРМАЦИИ О ЕГО ЗАКАЗАХ=================
          SQLQuery.Active := false;
          SQLQuery.SQL.Clear;

          SQLQuery.SQL.Add('select o.id, c.name, c.surname, c.phone_number, ');
          SQLQuery.SQL.Add('a1.city CITY_FROM, a1.street STREET_FROM, a1.number_house NUMBER_HOUSE_FROM, a1.floor_ FLOOR_FROM, ');
          SQLQuery.SQL.Add('a2.city CITY_TO, a2.street STREET_TO, a2.number_house NUMBER_HOUSE_TO, a2.floor_ FLOOR_TO, ');
          SQLQuery.SQL.Add('o.date_of_delivery,o.number_stevedore,o.price,o.status from orders o');
          SQLQuery.SQL.Add('join address a1 on ');
          SQLQuery.SQL.Add('(a1.id = o.from_id_address) and (o.who_driver = '+normalizationString(toKeyWordInJSON.GetValue('id').ToString)+') and (o.status between 2 and 5)');
          SQLQuery.SQL.Add('join address a2 on (a2.id = o.to_id_address)');
          SQLQuery.SQL.Add('join customers c on (c.id = o.id_customer)');
          SQLQuery.SQL.Add('order by o.date_of_delivery descending');

          SQLQuery.Active := true;
          SQLQuery.Open;
          //=============ЗАПОЛНЕНИЕ JSONARRAY ЕГО ЗАКАЗАМИ=================
          jsonBuffer := TJSONObject.Create;
          ArrayJson := TJSONArray.Create;

          SQLQuery.First;

          while not SQLQuery.Eof do
            begin
              jsonBuffer.AddPair('id',VarToStr(SQLQuery.FieldByName('ID').Value));

              jsonBuffer.AddPair('customer_name',
                VarToStr(SQLQuery.FieldByName('NAME').Value)+' '+
                VarToStr(SQLQuery.FieldByName('SURNAME').Value));

              jsonBuffer.AddPair('customer_phone_number',VarToStr(SQLQuery.FieldByName('PHONE_NUMBER').Value));

              jsonBuffer.AddPair('origin_address',
                VarToStr(SQLQuery.FieldByName('CITY_FROM').Value)+ ', '+
                VarToStr(SQLQuery.FieldByName('STREET_FROM').Value)+ ', '+
                VarToStr(SQLQuery.FieldByName('NUMBER_HOUSE_FROM').Value)+ ' ('+
                VarToStr(SQLQuery.FieldByName('FLOOR_FROM').Value)+ ' эт.)');

              jsonBuffer.AddPair('destination_address',
                VarToStr(SQLQuery.FieldByName('CITY_TO').Value)+ ', '+
                VarToStr(SQLQuery.FieldByName('STREET_TO').Value)+', '+
                VarToStr(SQLQuery.FieldByName('NUMBER_HOUSE_TO').Value)+' ('+
                VarToStr(SQLQuery.FieldByName('FLOOR_TO').Value)+ ' эт.)');

              jsonBuffer.AddPair('delivery_time',VarToStr(SQLQuery.FieldByName('DATE_OF_DELIVERY').Value));

              jsonBuffer.AddPair('number_of_movers',VarToStr(SQLQuery.FieldByName('NUMBER_STEVEDORE').Value));

              jsonBuffer.AddPair('payment',VarToStr(SQLQuery.FieldByName('PRICE').Value));

              jsonBuffer.AddPair('status',VarToStr(SQLQuery.FieldByName('STATUS').Value));

              ArrayJson.AddElement(jsonBuffer);

              jsonBuffer := TJSONObject.Create;

              SQLQuery.Next;
            end;
            ResultJSON.AddPair('data',ArrayJson);
        end
        //=============ЕСЛИ КЛЮЧЕВЫЕ СЛОВА НЕ СОВПАДАЮТ=================
      else
        begin
          ResultJSON.AddPair('status','error');
          ResultJSON.AddPair('message','There is an error in the keyword');
        end;
    end
    //=============ЕСЛИ ТАКОГО РАБОТНИКА НЕТ=================
  else
    begin
      ResultJSON.AddPair('status','error');
      ResultJSON.AddPair('message','There is an error in the id!');
    end;
  Result := ResultJSON;
end;

function ToChangeStatus(toChangeStatus : TJsonObject) : TJsonObject;
var
  Database: TIBDatabase;
  updateStatusOrder: TIBStoredProc;
  Transaction: TIBTransaction;
  ResultJSON : TJSONObject;
begin
  ResultJSON := TJSONObject.Create;
  Database := TIBDatabase.Create(nil);
  Database := Form1.IBDatabase1;
  Database.Connected := true;
  Transaction := TIBTransaction.Create(nil);
  Transaction.DefaultDatabase := Database;
  if (StrToInt(toChangeStatus.GetValue('new_status').ToString) in [2..6]) then
    begin
      FCS2.Enter;
      updateStatusOrder := TIBStoredProc.Create(nil);
      updateStatusOrder.Database := Form1.IBDatabase1;
      updateStatusOrder.Transaction := Transaction;

      updateStatusOrder.StoredProcName := 'EDIT_ORDER_SET_STATUS';
      Transaction.Active := True;

      if Transaction.InTransaction then Transaction.Commit;

      updateStatusOrder.ParamByName('ID_ORDER').AsInteger := StrToInt(toChangeStatus.GetValue('order_id').ToString);
      updateStatusOrder.ParamByName('NEW_STATUS').AsInteger := StrToInt(toChangeStatus.GetValue('new_status').ToString);
      updateStatusOrder.ParamByName('ID_WORKERS').AsInteger := -1;
      updateStatusOrder.ExecProc;

      if Transaction.InTransaction then Transaction.Commit;

      Transaction.Active := False;
      ResultJSON.AddPair('status','OK');
      FCS2.Leave;
    end
  else
    begin
      ResultJSON.AddPair('status','error');
    end;
  Result := ResultJSON;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  host := Edit1.Text;
end;

procedure TForm1.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
if ((not(Key in ['0' .. '9','.',#08])) or (Length(Edit1.Text) >= 15)) then Key := #0;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  IBDatabase1.Connected := true;
  IBEvents1.Registered := true;
  IBEvents2.Registered := true;
  FCS := TCriticalSection.Create;
  FCS2 := TCriticalSection.Create;
end;

procedure TForm1.IBEvents1EventAlert(Sender: TObject; EventName: string;
  EventCount: Integer; var CancelAlerts: Boolean);
begin
//  ShowMessage(EventName);
//  host := '192.168.43.255';

  if (EventName = 'ADD_WORKER') then
      IdUDPServer1.Send(host,11000,'2');
  if (EventName = 'EDIT_WORKER') then
      IdUDPServer1.Send(host,11000,'2');
  if (EventName = 'DELETE_WORKER') then
      IdUDPServer1.Send(host,11000,'2');
  if (EventName = 'BEGIN_DAY_DRIVER') then
      IdUDPServer1.Send(host,11000,'3');
  if (EventName = 'EDIT_DRIVER_SET_CAR') then
      IdUDPServer1.Send(host,11000,'1');    //............
  if (EventName = 'EDIT_DRIVER_SET_SCHEDULE') then
      IdUDPServer1.Send(host,11000,'1');    //............
end;

function Get_Token(): TJSONArray;
var
  res_:Integer;
  Database: TIBDatabase;
  Transaction: TIBTransaction;
  GetTokenProc: TIBStoredProc;
  jsonBuffer: TJSONObject;
  Result1 :TJSONArray;
begin
  Database := TIBDatabase.Create(nil);
  Database := Form1.IBDatabase1;
  Database.Connected := true;
  Transaction := TIBTransaction.Create(nil);
  Transaction.DefaultDatabase := Database;
  GetTokenProc := TIBStoredProc.Create(nil);
  GetTokenProc.Database := Database;
  GetTokenProc.Transaction := Transaction;
  GetTokenProc.StoredProcName := 'CHECK_JOURNAL_GET_TOKEN';
  Result1 := TJSONArray.Create;
  try
    repeat
      jsonBuffer := TJSONObject.Create;
      if Transaction.InTransaction then Transaction.Commit;
      GetTokenProc.ExecProc;
      res_ := StrToInt(VarToStr(GetTokenProc.ParamByName('REST').Value));
      jsonBuffer.AddPair('new_status',
        VarToStr(GetTokenProc.ParamByName('NEW_STATUS').Value));
      jsonBuffer.AddPair('old_token',
        VarToStr(GetTokenProc.ParamByName('OLD_TOKEN').Value));
      jsonBuffer.AddPair('token',
        VarToStr(GetTokenProc.ParamByName('TOKEN').Value));
      Result1.AddElement(jsonBuffer);
      jsonBuffer := TJSONObject.Create;
      if Transaction.InTransaction then Transaction.Commit;
    until (res_ = 0);
  finally
    GetTokenProc.Free;
    Transaction.Free;
  end;
  Result := Result1;
end;

procedure TForm1.IBEvents2EventAlert(Sender: TObject; EventName: string;
  EventCount: Integer; var CancelAlerts: Boolean);
var
  ArrToken: TJSONArray;
  Title,Body :String;
  i: Integer;
  JSONObject: TJSONObject;
begin
//  host := '192.168.43.255';
  if (EventName = 'UPDATE_STATUS') then
    begin
      FCS.Enter;
      ArrToken := Get_Token();
      for i := 0 to ArrToken.Count-1 do
        begin
          JSONObject := ArrToken.Items[i] as TJSONObject;
          if (normalizationString(JSONObject.GetValue('new_status').ToString) = '2') then
            begin
              Title := 'Новая информация';
              Body := 'Вам назначен новый заказ';
              SendFirebaseMessage(normalizationString(JSONObject.GetValue('token').ToString),
                Title,Body);
              if (normalizationString(JSONObject.GetValue('old_token').ToString) <> '') then
                begin
                  Title := 'Новая информация';
                  Body := 'У вас отменен заказ';
                  SendFirebaseMessage(normalizationString(JSONObject.GetValue('token').ToString),
                    Title,Body);
                end;
            end;
          if (normalizationString(JSONObject.GetValue('new_status').ToString) = '0') then
            begin
              Title := 'Новая информация';
              Body := 'У вас отменен заказ';
//              ShowMessage(normalizationString(JSONObject.GetValue('old_token').ToString));
              SendFirebaseMessage(normalizationString(JSONObject.GetValue('old_token').ToString),
                Title,Body);
            end;
        end;
      IdUDPServer1.Send(host,11000,'1');
      FCS.Leave;
    end;

  if (EventName = 'ADD_ADDRESS') then
      IdUDPServer1.Send(host,11000,'1');
  if (EventName = 'ADD_CUSTOMER') then
      IdUDPServer1.Send(host,11000,'1');
  if (EventName = 'ADD_CAR') then
      IdUDPServer1.Send(host,11000,'3');
  if (EventName = 'ADD_ORDER') then
      IdUDPServer1.Send(host,11000,'1');
  if (EventName = 'EDIT_ORDER') then
    begin
      FCS.Enter;
      ArrToken := Get_Token();
      for i := 0 to ArrToken.Count-1 do
        begin
          JSONObject := ArrToken.Items[i] as TJSONObject;
          Title := 'Изменение информации';
          Body := 'Изменена информация о заказе';
          SendFirebaseMessage(normalizationString(JSONObject.GetValue('token').ToString),
            Title,Body);
        end;
      IdUDPServer1.Send(host,11000,'1');
      FCS.Leave;
    end;
end;

procedure TForm1.IdHTTPServer1CommandGet(AContext: TIdContext;
  ARequestInfo: TIdHTTPRequestInfo; AResponseInfo: TIdHTTPResponseInfo);
var
  S : TStringStream;
  jsonGetQuery,jsonAnswerData: TJSONObject;
begin
    jsonGetQuery := TJSONObject.Create;
    jsonAnswerData := TJSONObject.Create;

    S:= TStringStream.Create;
    S.CopyFrom(ARequestInfo.PostStream,0);
    jsonGetQuery := TJSONObject.ParseJSONValue(S.DataString) as TJSONObject;
    //=============ЕСЛИ ВОДИТЕЛЬ ЗАХОДИТ С ЛОГИНОМ И ПАРОЛЕМ=================
    if (normalizationString(jsonGetQuery.GetValue('request_type').ToString) = 'authentication') then
      begin
        jsonAnswerData := ToLogIn(jsonGetQuery);
      end;
    //=============ЕСЛИ ВОДИТЕЛЬ ЗАХОДИТ С ИД И КЛЮЧЕВЫМ СЛОВОМ=================
    if (normalizationString(jsonGetQuery.GetValue('request_type').ToString) = 'get_order_list') then
      begin
        jsonAnswerData := ToKeyWordIn(jsonGetQuery);
      end;
    //=============ЕСЛИ МЕНЯЕТСЯ СТАТУС ЗАКАЗА=================
    if (normalizationString(jsonGetQuery.GetValue('request_type').ToString) = 'change_status') then
      begin
        jsonAnswerData := ToChangeStatus(jsonGetQuery);
      end;
  AResponseInfo.ContentType := 'text; charset=utf-8';
  AResponseInfo.ContentText := jsonAnswerData.ToString;
end;

procedure TForm1.IdUDPServer1UDPRead(AThread: TIdUDPListenerThread;
  const AData: TIdBytes; ABinding: TIdSocketHandle);
var
  StringFormatedStream: TStringStream;
  s: String;
  jsonGetQuery: TJSONObject;
  id_order,new_status,id_worker:Integer;
begin
  StringFormatedStream := TStringStream.Create('');
  StringFormatedStream.write(AData[0],length(AData));
  s := StringFormatedStream.DataString;
  jsonGetQuery := TJSONObject.ParseJSONValue(s) as TJSONObject;
  id_order := StrToInt(jsonGetQuery.GetValue('id_order').ToString);
  new_status := StrToInt(jsonGetQuery.GetValue('new_status').ToString);
  id_worker := StrToInt(jsonGetQuery.GetValue('id_worker').ToString);

  if(id_worker = -1) then
    begin
      if (new_status = 0) then
        IdUDPClient1.Send('Заказ '+IntToStr(id_order)+' не распределен',IndyTextEncoding_UTF8);
      if (new_status = 7) then
        IdUDPClient1.Send('Заказ '+IntToStr(id_order)+' выполнен',IndyTextEncoding_UTF8);
      if (new_status = 8) then
        IdUDPClient1.Send('Заказ '+IntToStr(id_order)+' отменен',IndyTextEncoding_UTF8);
    end
  else
    begin
      if (new_status = 1) then
        IdUDPClient1.Send('Заказ '+IntToStr(id_order)+' присвоен оператором '+
          IntToStr(id_worker),IndyTextEncoding_UTF8);
      if (new_status = 2) then
        begin
          IdUDPClient1.Send('Заказ '+IntToStr(id_order)+' распределен водителю '+
            IntToStr(id_worker),IndyTextEncoding_UTF8);
//          SendFirebaseMessage(id_worker,'Новая информация','Вам назначен новый заказ');
        end;
    end;
end;

end.
