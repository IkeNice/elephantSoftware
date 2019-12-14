unit Dm;

interface

uses
  System.SysUtils, System.Classes, IBX.IBQuery, Datasnap.Provider, Data.DB,
  IBX.IBCustomDataSet, IBX.IBTable, IBX.IBDatabase;

type
  TDataModule2 = class(TDataModule)
    IBDatabase1: TIBDatabase;
    IBTransaction1: TIBTransaction;
    IBTable1: TIBTable;
    DataSetProvider1: TDataSetProvider;
    IBQuery1: TIBQuery;
    DataSetProvider2: TDataSetProvider;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule2: TDataModule2;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
