object MyServer: TMyServer
  OldCreateOrder = False
  Height = 483
  Width = 735
  object IBTransaction1: TIBTransaction
    DefaultDatabase = IBDatabase1
    Left = 144
    Top = 16
  end
  object IBQuery1: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    Left = 456
    Top = 152
  end
  object ibtOrders: TIBTable
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'ORDERS'
    UniDirectional = False
    Left = 40
    Top = 88
  end
  object ibtOrderInfo: TIBTable
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'ORDER_INFO'
    UniDirectional = False
    Left = 144
    Top = 88
  end
  object ibtMenu: TIBTable
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'MENU'
    UniDirectional = False
    Left = 240
    Top = 88
  end
  object ibtAddresses: TIBTable
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'ADDRESSES'
    UniDirectional = False
    Left = 344
    Top = 88
  end
  object ibtSchedules: TIBTable
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'SCHEDULES'
    UniDirectional = False
    Left = 456
    Top = 88
  end
  object dspOrders: TDataSetProvider
    DataSet = ibtOrders
    Left = 40
    Top = 216
  end
  object dspOrderInfo: TDataSetProvider
    DataSet = ibtOrderInfo
    Left = 144
    Top = 216
  end
  object dspMenu: TDataSetProvider
    DataSet = ibtMenu
    Left = 240
    Top = 216
  end
  object dspAddresses: TDataSetProvider
    DataSet = ibtAddresses
    Left = 344
    Top = 216
  end
  object dspSchedules: TDataSetProvider
    DataSet = ibtSchedules
    Left = 456
    Top = 216
  end
  object DataSetProvider6: TDataSetProvider
    DataSet = IBTable6
    Left = 40
    Top = 280
  end
  object IBDatabase1: TIBDatabase
    DatabaseName = 
      'E:\General\'#1044#1086#1082#1091#1084#1077#1085#1090#1099'\GitHub\Unity\elephantSoftware\ELEPHANTSOFTW' +
      'ARE.FDB'
    Params.Strings = (
      'lc_ctype=WIN1251'
      'user_name=SYSDBA'
      'password=masterkey')
    LoginPrompt = False
    DefaultTransaction = IBTransaction1
    ServerType = 'IBServer'
    Left = 40
    Top = 16
  end
  object ibspUpdateAddress: TIBStoredProc
    Database = IBDatabase1
    Transaction = IBTransaction1
    StoredProcName = 'UPDATE_ADDRESS'
    Left = 40
    Top = 344
    ParamData = <
      item
        DataType = ftInteger
        Name = 'INID                           '
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'INSTREET                       '
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'INBUILDING                     '
        ParamType = ptInput
      end>
  end
  object ibspDeleteAddress: TIBStoredProc
    Database = IBDatabase1
    Transaction = IBTransaction1
    StoredProcName = 'DELETE_ADDRESS'
    Left = 144
    Top = 344
    ParamData = <
      item
        DataType = ftInteger
        Name = 'INID                           '
        ParamType = ptInput
      end>
  end
  object ibspUpdateProduct: TIBStoredProc
    Database = IBDatabase1
    Transaction = IBTransaction1
    StoredProcName = 'UPDATE_PRODUCT'
    Left = 248
    Top = 344
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'INID'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'INNAME'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'INCATEGORY'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'INPRICE'
        ParamType = ptInput
      end>
  end
  object ibspDeleteProduct: TIBStoredProc
    Database = IBDatabase1
    Transaction = IBTransaction1
    StoredProcName = 'DELETE_PRODUCT'
    Left = 352
    Top = 344
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'INID                           '
        ParamType = ptUnknown
      end>
  end
  object ibspUpdateOrder: TIBStoredProc
    Database = IBDatabase1
    Transaction = IBTransaction1
    StoredProcName = 'UPDATE_ORDER'
    Left = 464
    Top = 344
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'INID                           '
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'INSTATUSID                     '
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'INADDRESSID                    '
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'INCOURIERID                    '
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'INOPERATORID                   '
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'INDATE                         '
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'INTIME                         '
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'INTOTALPRICE                   '
        ParamType = ptUnknown
      end>
  end
  object ibspDeleteOrder: TIBStoredProc
    Database = IBDatabase1
    Transaction = IBTransaction1
    StoredProcName = 'DELETE_ORDER'
    Left = 40
    Top = 408
    ParamData = <
      item
        DataType = ftInteger
        Name = 'INID                           '
        ParamType = ptUnknown
      end>
  end
  object ibspUpdateOrderInfo: TIBStoredProc
    Database = IBDatabase1
    Transaction = IBTransaction1
    StoredProcName = 'UPDATE_ORDERINFO'
    Left = 144
    Top = 408
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'INORDERID                      '
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'INPRODUCTID                    '
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'INQUANTITY                     '
        ParamType = ptUnknown
      end>
  end
  object ibspDeleteOrderInfo: TIBStoredProc
    Database = IBDatabase1
    Transaction = IBTransaction1
    StoredProcName = 'DELETE_ORDERINFO'
    Left = 248
    Top = 408
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'INORDERID                      '
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'INPRODUCTID                    '
        ParamType = ptUnknown
      end>
  end
  object IBTable6: TIBTable
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    UniDirectional = False
    Left = 344
    Top = 152
  end
  object ibtCategories: TIBTable
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'CATEGORIES'
    UniDirectional = False
    Left = 40
    Top = 152
  end
  object ibtEmployees: TIBTable
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'EMPLOYEES'
    UniDirectional = False
    Left = 144
    Top = 152
  end
  object ibtStatuses: TIBTable
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'STATUSES'
    UniDirectional = False
    Left = 240
    Top = 152
  end
  object dspCategories: TDataSetProvider
    DataSet = ibtCategories
    Left = 144
    Top = 280
  end
  object dspEmployees: TDataSetProvider
    DataSet = ibtEmployees
    Left = 248
    Top = 280
  end
  object dspStatuses: TDataSetProvider
    DataSet = ibtStatuses
    Left = 344
    Top = 280
  end
  object dspQuery: TDataSetProvider
    DataSet = IBQuery1
    Left = 456
    Top = 280
  end
end
