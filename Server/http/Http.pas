unit Http;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, Vcl.StdCtrls, IdCustomTCPServer,
  IdCustomHTTPServer, IdHTTPServer, IdContext,System.JSON,Dm, Data.DB,
  IBX.IBDatabase, IBX.IBCustomDataSet, IBX.IBStoredProc, IdServerIOHandler,
  IdSSL, IdSSLOpenSSL, IdAuthentication;

type
  TFHttp = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    Edit1: TEdit;
    Button2: TButton;
    IdHTTP1: TIdHTTP;
    IdHTTPServer1: TIdHTTPServer;
//    function generationKeyWord() : String;
    procedure Button1Click(Sender: TObject);
    procedure IdHTTPServer1CommandGet(AContext: TIdContext;
      ARequestInfo: TIdHTTPRequestInfo; AResponseInfo: TIdHTTPResponseInfo);
    procedure Button2Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FHttp: TFHttp;
  keyWord,tokenDevice : String;
  ArrayJson: TJSONArray;
  jsonBuffer : TJSONObject;

implementation

{$R *.dfm}
//                                ///��������� ��������� �����
//function generationKeyWord() : String;
//var
//  code,i : Integer;
//begin
//  Result := '';
//  for i := 0 to 5 do
//    begin
//      code := 48 + Random(75);
//      while ((code in [58..64]) or (code in [91..96])) do    //���� ��������,������� �� �����
//        code := 48 + Random(75);
//      Result := Result + Chr(code);
//    end;
//end;

function normalizationString(S : string) : string;
begin
  Delete(S,1,1);
  Delete(S,Length(S),1);
  Result := S;
end;

function ToLogIn (toLogInJSON: TJSONObject) : TJSONObject;
var
  idDriver : Integer;
  ResultJSON : TJSONObject;
begin
  ResultJSON := TJSONObject.Create;
  //=============��������� �� ���������=================
  DataModule2.IBQuery1.Active := false;
  DataModule2.IBQuery1.SQL.Clear;

  DataModule2.IBQuery1.SQL.Add('SELECT emp_id FROM AUTHOTIZATION ');
  DataModule2.IBQuery1.SQL.Add('WHERE LOGIN = ''' + normalizationString(toLogInJSON.GetValue('login').ToString) + '''');
  DataModule2.IBQuery1.SQL.Add(' AND PASSWORD = ''' + normalizationString(toLogInJSON.GetValue('password').ToString) + '''');

  DataModule2.IBQuery1.Active := true;
  DataModule2.IBQuery1.Open;
  //=============���� �� ����, �� �������� ����������=================
  if (DataModule2.IBQuery1.RecordCount.ToBoolean) then
    begin
      idDriver := DataModule2.IBQuery1.FieldByName('ID').Value;
    //  keyWord := generationKeyWord();

      ResultJSON.AddPair('status','OK');
      ResultJSON.AddPair('id',idDriver.ToString);
//      ResultJSON.AddPair('keyword',keyWord);

      //=============��������� ������ ��������� �����=================
//      DataModule2.IBQuery1.Active := false;
//      DataModule2.IBQuery1.SQL.Clear;
//      if DataModule2.IBTransaction1.InTransaction then
//        DataModule2.IBTransaction1.Commit;
//
//      DataModule2.IBQuery1.SQL.Add('UPDATE INFORMATIONS_DRIVERS ');
//      DataModule2.IBQuery1.SQL.Add('SET KEY_WORD = ''' + keyWord + '''');
//      DataModule2.IBQuery1.SQL.Add(', DEVICE_TOKEN = ''' + tokenDevice + '''');
//      DataModule2.IBQuery1.SQL.Add(' WHERE ID = ' + idDriver.ToString);
//      DataModule2.IBQuery1.ExecSQL;
//
//      DataModule2.IBQuery1.Active := true;
//      DataModule2.IBQuery1.Open;
//      if DataModule2.IBTransaction1.InTransaction then
//        DataModule2.IBTransaction1.Commit;
      //=============��������� ���������� � ��� �������=================
      DataModule2.IBQuery1.Active := false;
      DataModule2.IBQuery1.SQL.Clear;

      DataModule2.IBQuery1.SQL.Add('select o.order_id, c.name, c.surname, c.phone_number, ');
      DataModule2.IBQuery1.SQL.Add('a1.street STREET, a1.building BUILDING, a1.apartment APARTMENT, ');
      DataModule2.IBQuery1.SQL.Add('oi.time_of_delivery DATE_OF_DELIVERY,oi.price PRICE from order_info oi');
      DataModule2.IBQuery1.SQL.Add('join addresses a1 on (a1.address_id = oi.address_id)');
      DataModule2.IBQuery1.SQL.Add('join orders o on (o.COURIER_ID = '+idDriver.ToString+')');
      DataModule2.IBQuery1.SQL.Add('join addresses a2 on (a2.address_id = o.address_id)');
      DataModule2.IBQuery1.SQL.Add('join customers c on (c.id = oi.id_customer)');
      DataModule2.IBQuery1.SQL.Add('order by oi.TIME_OF_DELIVERY descending');

      DataModule2.IBQuery1.Active := true;
      DataModule2.IBQuery1.Open;
      //=============���������� JSONARRAY ��� ��������=================
      jsonBuffer := TJSONObject.Create;
      ArrayJson := TJSONArray.Create;

      DataModule2.IBQuery1.First;

      while not DataModule2.IBQuery1.Eof do
        begin
          jsonBuffer.AddPair('id',VarToStr(DataModule2.IBQuery1.FieldByName('ID').Value));

          jsonBuffer.AddPair('customer_name',
            VarToStr(DataModule2.IBQuery1.FieldByName('NAME').Value)+' '+
            VarToStr(DataModule2.IBQuery1.FieldByName('SURNAME').Value));

          jsonBuffer.AddPair('customer_phone_number',VarToStr(DataModule2.IBQuery1.FieldByName('PHONE_NUMBER').Value));

          jsonBuffer.AddPair('origin_address',
            VarToStr(DataModule2.IBQuery1.FieldByName('STREET').Value)+ ', '+
            VarToStr(DataModule2.IBQuery1.FieldByName('BUILDING').Value)+ ' ('+
            VarToStr(DataModule2.IBQuery1.FieldByName('APARTMENT').Value)+ ' ��.)');

//          jsonBuffer.AddPair('destination_address',
//            VarToStr(DataModule2.IBQuery1.FieldByName('CITY_TO').Value)+ ', '+
//            VarToStr(DataModule2.IBQuery1.FieldByName('STREET_TO').Value)+', '+
//            VarToStr(DataModule2.IBQuery1.FieldByName('NUMBER_HOUSE_TO').Value)+' ('+
//            VarToStr(DataModule2.IBQuery1.FieldByName('FLOOR_TO').Value)+ ' ��.)');

          jsonBuffer.AddPair('delivery_time',VarToStr(DataModule2.IBQuery1.FieldByName('DATE_OF_DELIVERY').Value));

//         jsonBuffer.AddPair('number_of_movers',VarToStr(DataModule2.IBQuery1.FieldByName('NUMBER_STEVEDORE').Value));

          jsonBuffer.AddPair('payment',VarToStr(DataModule2.IBQuery1.FieldByName('PRICE').Value));

//          jsonBuffer.AddPair('status',VarToStr(DataModule2.IBQuery1.FieldByName('STATUS').Value));

          ArrayJson.AddElement(jsonBuffer);

          jsonBuffer := TJSONObject.Create;

          DataModule2.IBQuery1.Next;
        end;
        ResultJSON.AddPair('data',ArrayJson);
    end
    //=============���� ������ ��������� ���=================
  else
    begin
      ResultJSON.AddPair('status','error');
      ResultJSON.AddPair('message','There is an error in the login or password!');
    end;
  Result := ResultJSON;
end;

//function ToKeyWordIn(toKeyWordInJSON : TJsonObject) : TJsonObject;
//var
//  ResultJSON : TJSONObject;
//begin
//  Result := TJSONObject.Create;
////  //=============��������� ��������� ����� ��������� �� �������=================
////  DataModule2.IBQuery1.Active := false;
////  DataModule2.IBQuery1.SQL.Clear;
////
////  DataModule2.IBQuery1.SQL.Add('SELECT KEY_WORD FROM INFORMATIONS_DRIVERS WHERE ');
////  DataModule2.IBQuery1.SQL.Add('ID = ''' + toKeyWordInJSON.GetValue('id').ToString + '''');
////
////  DataModule2.IBQuery1.Active := true;
////  DataModule2.IBQuery1.Open;
////  //=============���� ��� ���� (������ ��)=================
//  if (DataModule2.IBQuery1.RecordCount.ToBoolean) then
//    begin
// //     keyWord := VarToStr(DataModule2.IBQuery1.FieldByName('KEY_WORD').Value);
//      //=============���� ���������� �������� ����� ��������� � �������� ������ �� ������� ��� ����� ���������=================
////      if (keyWord = normalizationString(toKeyWordInJSON.GetValue('keyword').ToString)) then
// //       begin
//          ResultJSON.AddPair('status','OK');
//          //=============��������� ���������� � ��� �������=================
//          DataModule2.IBQuery1.Active := false;
//          DataModule2.IBQuery1.SQL.Clear;
//
//          DataModule2.IBQuery1.SQL.Add('select o.id,o.id_customer,o.weight, ');
//          DataModule2.IBQuery1.SQL.Add('a.city CITY_FROM, a.street STREET_FROM, a.number_house NUMBER_HOUSE_FROM, a.floor_ FLOOR_FROM, ');
//          DataModule2.IBQuery1.SQL.Add('a.city CITY_TO, a.street STREET_TO, a.number_house NUMBER_HOUSE_TO, a.floor_ FLOOR_TO, ');
//          DataModule2.IBQuery1.SQL.Add('o.date_of_delivery,o.number_stevedore,o.price,o.status from ');
//          DataModule2.IBQuery1.SQL.Add('orders o inner join address a on ');
//          DataModule2.IBQuery1.SQL.Add('((o.from_id_address = a.id) or (o.to_id_address = a.id)) and (o.who_driver='+normalizationString(toKeyWordInJSON.GetValue('id').ToString)+')');
//
//          DataModule2.IBQuery1.Active := true;
//          DataModule2.IBQuery1.Open;
//          //=============���������� JSONARRAY ��� ��������=================
//          jsonBuffer := TJSONObject.Create;
//          ArrayJson := TJSONArray.Create;
//
//          DataModule2.IBQuery1.First;
//
//          while not DataModule2.IBQuery1.Eof do
//            begin
//              jsonBuffer.AddPair('id',VarToStr(DataModule2.IBQuery1.FieldByName('ID').Value));
//
//              jsonBuffer.AddPair('id_customer',VarToStr(DataModule2.IBQuery1.FieldByName('ID_CUSTOMER').Value));
//
//              jsonBuffer.AddPair('weight',VarToStr(DataModule2.IBQuery1.FieldByName('WEIGHT').Value));
//              jsonBuffer.AddPair('cityFrom',VarToStr(DataModule2.IBQuery1.FieldByName('CITY_FROM').Value));
//              jsonBuffer.AddPair('streetFrom',VarToStr(DataModule2.IBQuery1.FieldByName('STREET_FROM').Value));
//              jsonBuffer.AddPair('numberHouseFrom',VarToStr(DataModule2.IBQuery1.FieldByName('NUMBER_HOUSE_FROM').Value));
//              jsonBuffer.AddPair('floorFrom',VarToStr(DataModule2.IBQuery1.FieldByName('FLOOR_FROM').Value));
//
//              jsonBuffer.AddPair('cityTo',VarToStr(DataModule2.IBQuery1.FieldByName('CITY_TO').Value));
//              jsonBuffer.AddPair('streetTo',VarToStr(DataModule2.IBQuery1.FieldByName('STREET_TO').Value));
//              jsonBuffer.AddPair('numberHouseTo',VarToStr(DataModule2.IBQuery1.FieldByName('NUMBER_HOUSE_TO').Value));
//              jsonBuffer.AddPair('floorTo',VarToStr(DataModule2.IBQuery1.FieldByName('FLOOR_TO').Value));
//
//              jsonBuffer.AddPair('dateOfDelivery',VarToStr(DataModule2.IBQuery1.FieldByName('DATE_OF_DELIVERY').Value));
//
//              jsonBuffer.AddPair('countStevedore',VarToStr(DataModule2.IBQuery1.FieldByName('NUMBER_STEVEDORE').Value));
//
//              jsonBuffer.AddPair('price',VarToStr(DataModule2.IBQuery1.FieldByName('PRICE').Value));
//
//              jsonBuffer.AddPair('status',VarToStr(DataModule2.IBQuery1.FieldByName('STATUS').Value));
//
//              ArrayJson.AddElement(jsonBuffer);
//
//              jsonBuffer := TJSONObject.Create;
//
//              DataModule2.IBQuery1.Next;
//            end;
//            ResultJSON.AddPair('data',ArrayJson);
//        end
//        //=============���� �������� ����� �� ���������=================
////      else
////        begin
////          ResultJSON.AddPair('status','error');
////          ResultJSON.AddPair('message','There is an error in the keyword');
////        end;
////    end
//    //=============���� ������ ��������� ���=================
//  else
//    begin
//      ResultJSON.AddPair('status','error');
//      ResultJSON.AddPair('message','There is an error in the id!');
//    end;
//  Result := ResultJSON;
//end;

function ToChangeStatus(toChangeStatus : TJsonObject) : TJsonObject;
var
  updateStatusOrder: TIBStoredProc;
  ResultJSON : TJSONObject;
begin
  ResultJSON := TJSONObject.Create;
  //�������� ������ ������ �� ��������
  if (StrToInt(toChangeStatus.GetValue('new_status').ToString) in [2..6]) then
    begin
      updateStatusOrder := TIBStoredProc.Create(nil);
      updateStatusOrder.Database := DataModule2.IBDatabase1;
      updateStatusOrder.Transaction := DataModule2.IBTransaction1;

      updateStatusOrder.StoredProcName := 'EDIT_ORDER_SET_STATUS';
      DataModule2.IBTransaction1.Active := True;

      if DataModule2.IBTransaction1.InTransaction then
        DataModule2.IBTransaction1.Commit;
      //���� ����� � ����
      updateStatusOrder.ParamByName('ID_ORDER').AsInteger := StrToInt(toChangeStatus.GetValue('order_id').ToString);
      updateStatusOrder.ParamByName('NEW_STATUS').AsInteger := StrToInt(toChangeStatus.GetValue('new_status').ToString);
      updateStatusOrder.ParamByName('ID_WORKERS').AsInteger := -1;
      updateStatusOrder.ExecProc;

      if DataModule2.IBTransaction1.InTransaction then
        DataModule2.IBTransaction1.Commit;

      DataModule2.IBTransaction1.Active := False;
      ResultJSON.AddPair('status','OK');
    end
  else
    begin
      ResultJSON.AddPair('status','error');
    end;
  Result := ResultJSON;
end;
                        //������ - ���� �������
procedure TFHttp.Button1Click(Sender: TObject);
var
  str:TStringList;
  Data, Answer:TStringStream;
  res,res2,url,s:String;
  jsonData1,jsonData2, jsonData3: TJSONObject;
begin
  jsonData1 := TJSONObject.Create;
  jsonData2 := TJSONObject.Create;
  jsonData3 := TJSONObject.Create;

  jsonData3.AddPair('body','This is an FCM notification message!');
  jsonData3.AddPair('title','FCM message');
                                   //������ �������� - �����(Firebase)
  jsonData2.AddPair('token','fjVTGxZ8IuQ:APA91bGi_ppFmOJLFSbJeoMZFSiVVjOLAumTi_Hvi2PLjFV0f0wgvWpP3ri_Eg7U5socPG1zymXa3HwU3dAcf5pEP9j2ETF2RHWexpiW8rq_dA-OsVn1IDjvYkL8veOYDFBplFO6v1EF');
  jsonData2.AddPair('notification',jsonData3);
              //������� jsonData2
  jsonData1.AddPair('message',jsonData2);
  //���� �������
  url := 'https://dlptest.com/https-post/';
  Data := TStringStream.Create(jsonData1.ToString);
  Answer := TStringStream.Create('');

  IdHTTP1.Request.Accept := 'application/json';
  IdHTTP1.Request.ContentType := 'application/json';

  IDHTTP1.Post(url,Data,Answer);
  ShowMessage(Answer.DataString);
  FreeAndNil(str);
end;

procedure TFHttp.Button2Click(Sender: TObject);
var
  IdHTTP: TIdHTTP;
  IdSSL: TIdSSLIOHandlerSocketOpenSSL;
  Data:TStringStream;
  jsonData1,jsonData2: TJSONObject;
  body,title,token,Answer : String;
begin
  IdHTTP := TIdHTTP.Create;
  try
    jsonData1 := TJSONObject.Create;
    jsonData2 := TJSONObject.Create;
    IdSSL := TIdSSLIOHandlerSocketOpenSSL.Create(IdHTTP);

    IdSSL.SSLOptions.Method := sslvSSLv23; //������ SSL
    IdHTTP.IOHandler := IdSSL;
    //��������� IDHTTP c IDSSL
    IdHTTP.Request.ContentType := 'application/json';
    IdHTTP.Request.CharSet := 'UTF-8';
    IdHTTP.Request.CustomHeaders.Values['Authorization'] := 'key=AIzaSyA_sM6ipUnv6yL30Wh-MH4nXZyyCoxmlPo'; //���� �� ������� � Firebase
    //��, ��� ������������ �� ��������
    body := '����� �����';
    title := '����� �����';
    token := tokenDevice;

    jsonData2.AddPair('body',body);
    jsonData2.AddPair('title',title);
    jsonData2.AddPair('vibrate','1');  //��� ��������
    jsonData2.AddPair('sound','default');

    jsonData1.AddPair('to',token);  //���� ����������
    jsonData1.AddPair('notification',jsonData2);

    Data := TStringStream.Create(jsonData1.ToString,TEncoding.UTF8);
    Answer := IdHTTP.Post('https://fcm.googleapis.com/fcm/send', Data); //���������� ��������� �� Firebase
    //������ �����
    ShowMessage(Answer);
  finally
    IdHTTP.Free;
  end;
end;

//���� �������� json, �������� ���������
procedure TFHttp.IdHTTPServer1CommandGet(AContext: TIdContext;
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
    tokenDevice := normalizationString(jsonGetQuery.GetValue('token').ToString);
    //=============���� �������� ������� � ������� � �������=================
    if (normalizationString(jsonGetQuery.GetValue('request_type').ToString) = 'authentication') then
      begin
        jsonAnswerData := ToLogIn(jsonGetQuery);
      end;
    //=============���� �������� ������� � �� � �������� ������=================
//    if (normalizationString(jsonGetQuery.GetValue('request_type').ToString) = 'get_order_list') then
//      begin
//        jsonAnswerData := ToKeyWordIn(jsonGetQuery);
//      end;
    //=============���� �������� ������ ������=================
//    if (normalizationString(jsonGetQuery.GetValue('request_type').ToString) = 'change_status') then
//      begin
//        jsonAnswerData := ToChangeStatus(jsonGetQuery);
//      end;

//  AResponseInfo.ContentType := 'text/html; charset=utf-8';
  AResponseInfo.ContentType := 'text; charset=utf-8';
  AResponseInfo.ContentText := jsonAnswerData.ToString;
end;

end.