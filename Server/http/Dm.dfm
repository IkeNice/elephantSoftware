object DataModule2: TDataModule2
  OldCreateOrder = False
  Height = 245
  Width = 235
  object IBDatabase1: TIBDatabase
    DatabaseName = 'D:\'#1057#1080#1089#1090#1077#1084#1085#1072#1103'\Desktop\elephantSoftware\ELEPHANTSOFTWARE.FDB'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey'
      'lc_ctype=UTF8')
    LoginPrompt = False
    DefaultTransaction = IBTransaction1
    ServerType = 'IBServer'
    Left = 32
    Top = 24
  end
  object IBTransaction1: TIBTransaction
    DefaultDatabase = IBDatabase1
    Left = 144
    Top = 24
  end
  object IBTable1: TIBTable
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'ORDERS'
    UniDirectional = False
    Left = 144
    Top = 88
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = IBTable1
    Left = 144
    Top = 152
  end
  object IBQuery1: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    Left = 32
    Top = 88
  end
  object DataSetProvider2: TDataSetProvider
    DataSet = IBQuery1
    Left = 32
    Top = 152
  end
end
