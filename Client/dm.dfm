object dmMy: TdmMy
  OldCreateOrder = False
  Height = 298
  Width = 413
  object IBDatabase1: TIBDatabase
    DatabaseName = 
      'C:\Users\hieut\OneDrive\'#1044#1086#1082#1091#1084#1077#1085#1090#1099'\GitHub\elephantSoftware\Authen' +
      'tication\ELEPHANTSOFTWARE.FDB'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey'
      'lc_ctype=WIN1251')
    LoginPrompt = False
    DefaultTransaction = IBTransaction1
    ServerType = 'IBServer'
    Left = 120
    Top = 48
  end
  object IBTransaction1: TIBTransaction
    DefaultDatabase = IBDatabase1
    Left = 80
    Top = 136
  end
  object IBQuery1: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    Left = 176
    Top = 128
  end
end
