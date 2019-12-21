unit ProjectServer_TLB;

// ************************************************************************ //
// WARNING
// -------
// The types declared in this file were generated from data read from a
// Type Library. If this type library is explicitly or indirectly (via
// another type library referring to this type library) re-imported, or the
// 'Refresh' command of the Type Library Editor activated while editing the
// Type Library, the contents of this file will be regenerated and all
// manual modifications will be lost.
// ************************************************************************ //

// $Rev: 52393 $
// File generated on 21.12.2019 15:03:57 from Type Library described below.

// ************************************************************************  //
// Type Lib: E:\General\Документы\GitHub\Unity\elephantSoftware\Server\ProjectServer (1)
// LIBID: {08C46DBA-1C7D-4B3F-BAEE-955BFF359F6A}
// LCID: 0
// Helpfile:
// HelpString:
// DepndLst:
//   (1) v2.0 stdole, (C:\Windows\SysWOW64\stdole2.tlb)
//   (2) v1.0 Midas, (midas.dll)
// SYS_KIND: SYS_WIN32
// ************************************************************************ //
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers.
{$WARN SYMBOL_PLATFORM OFF}
{$WRITEABLECONST ON}
{$VARPROPSETTER ON}
{$ALIGN 4}

interface

uses Winapi.Windows, Midas, System.Classes, System.Variants, System.Win.StdVCL, Vcl.Graphics, Vcl.OleServer, Winapi.ActiveX;



// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:
//   Type Libraries     : LIBID_xxxx
//   CoClasses          : CLASS_xxxx
//   DISPInterfaces     : DIID_xxxx
//   Non-DISP interfaces: IID_xxxx
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  ProjectServerMajorVersion = 1;
  ProjectServerMinorVersion = 0;

  LIBID_ProjectServer: TGUID = '{08C46DBA-1C7D-4B3F-BAEE-955BFF359F6A}';

  IID_IMyServer: TGUID = '{15A67D19-211E-441D-954E-2753EA2BB780}';
  CLASS_MyServer: TGUID = '{A7EF958A-E1E9-45EB-9930-E3FBB4AC38DA}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary
// *********************************************************************//
  IMyServer = interface;
  IMyServerDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library
// (NOTE: Here we map each CoClass to its Default Interface)
// *********************************************************************//
  MyServer = IMyServer;


// *********************************************************************//
// Interface: IMyServer
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {15A67D19-211E-441D-954E-2753EA2BB780}
// *********************************************************************//
  IMyServer = interface(IAppServer)
    ['{15A67D19-211E-441D-954E-2753EA2BB780}']
    procedure smUpdateProduct(ID: Integer; const Name: WideString; Category: Integer; Price: Integer); safecall;
    procedure smDeleteProduct(ID: Integer); safecall;
    procedure smUpdateAddress(ID: Integer; const Street: WideString; const Building: WideString;
                              Apartment: Integer); safecall;
    procedure smDeleteAddress(ID: Integer); safecall;
    procedure smUpdateOrder(ID: Integer; StatusID: Integer; const Client: WideString;
                            Phone: Integer; AddressID: Integer; CourierID: Integer;
                            OperatorID: Integer; Date: TDateTime; const TimeOfDelivery: WideString;
                            TotalPrice: Integer); safecall;
    procedure smDeleteOrder(ID: Integer); safecall;
    procedure smUpdateOrderInfo(OrderID: Integer; ProductID: Integer; Quantity: Integer); safecall;
    procedure smDeleteOrderInfo(OrderID: Integer; ProductID: Integer); safecall;
    procedure smUpdateOrderStatus(OrderID: Integer; StatusID: Integer); safecall;
    procedure smUpdateDriversInfo(EmpID: Integer; const TokenDev: WideString;
                                  const Keyword: WideString); safecall;
    procedure smSQLClear; safecall;
    procedure smSQLAddString(const s: WideString); safecall;
    procedure smSQLExecute; safecall;
  end;

// *********************************************************************//
// DispIntf:  IMyServerDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {15A67D19-211E-441D-954E-2753EA2BB780}
// *********************************************************************//
  IMyServerDisp = dispinterface
    ['{15A67D19-211E-441D-954E-2753EA2BB780}']
    procedure smUpdateProduct(ID: Integer; const Name: WideString; Category: Integer; Price: Integer); dispid 301;
    procedure smDeleteProduct(ID: Integer); dispid 302;
    procedure smUpdateAddress(ID: Integer; const Street: WideString; const Building: WideString;
                              Apartment: Integer); dispid 303;
    procedure smDeleteAddress(ID: Integer); dispid 304;
    procedure smUpdateOrder(ID: Integer; StatusID: Integer; const Client: WideString;
                            Phone: Integer; AddressID: Integer; CourierID: Integer;
                            OperatorID: Integer; Date: TDateTime; const TimeOfDelivery: WideString;
                            TotalPrice: Integer); dispid 305;
    procedure smDeleteOrder(ID: Integer); dispid 306;
    procedure smUpdateOrderInfo(OrderID: Integer; ProductID: Integer; Quantity: Integer); dispid 307;
    procedure smDeleteOrderInfo(OrderID: Integer; ProductID: Integer); dispid 308;
    procedure smUpdateOrderStatus(OrderID: Integer; StatusID: Integer); dispid 309;
    procedure smUpdateDriversInfo(EmpID: Integer; const TokenDev: WideString;
                                  const Keyword: WideString); dispid 310;
    procedure smSQLClear; dispid 311;
    procedure smSQLAddString(const s: WideString); dispid 312;
    procedure smSQLExecute; dispid 313;
    function AS_ApplyUpdates(const ProviderName: WideString; Delta: OleVariant; MaxErrors: SYSINT;
                             out ErrorCount: SYSINT; var OwnerData: OleVariant): OleVariant; dispid 20000000;
    function AS_GetRecords(const ProviderName: WideString; Count: SYSINT; out RecsOut: SYSINT;
                           Options: SYSINT; const CommandText: WideString; var Params: OleVariant;
                           var OwnerData: OleVariant): OleVariant; dispid 20000001;
    function AS_DataRequest(const ProviderName: WideString; Data: OleVariant): OleVariant; dispid 20000002;
    function AS_GetProviderNames: OleVariant; dispid 20000003;
    function AS_GetParams(const ProviderName: WideString; var OwnerData: OleVariant): OleVariant; dispid 20000004;
    function AS_RowRequest(const ProviderName: WideString; Row: OleVariant; RequestType: SYSINT;
                           var OwnerData: OleVariant): OleVariant; dispid 20000005;
    procedure AS_Execute(const ProviderName: WideString; const CommandText: WideString;
                         var Params: OleVariant; var OwnerData: OleVariant); dispid 20000006;
  end;

// *********************************************************************//
// The Class CoMyServer provides a Create and CreateRemote method to
// create instances of the default interface IMyServer exposed by
// the CoClass MyServer. The functions are intended to be used by
// clients wishing to automate the CoClass objects exposed by the
// server of this typelibrary.
// *********************************************************************//
  CoMyServer = class
    class function Create: IMyServer;
    class function CreateRemote(const MachineName: string): IMyServer;
  end;

implementation

uses System.Win.ComObj;

class function CoMyServer.Create: IMyServer;
begin
  Result := CreateComObject(CLASS_MyServer) as IMyServer;
end;

class function CoMyServer.CreateRemote(const MachineName: string): IMyServer;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_MyServer) as IMyServer;
end;

end.

