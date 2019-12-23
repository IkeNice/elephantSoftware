object dmMy: TdmMy
  OldCreateOrder = False
  Height = 356
  Width = 700
  object IBDatabase1: TIBDatabase
    Connected = True
    DatabaseName = 
      'C:\Users\hieut\OneDrive\'#1044#1086#1082#1091#1084#1077#1085#1090#1099'\GitHub\elephantSoftware\ELEPHA' +
      'NTSOFTWARE.FDB'
    Params.Strings = (
      'user_name=sysdba'
      'password=masterkey'
      'lc_ctype=WIN1251')
    LoginPrompt = False
    DefaultTransaction = IBTransaction1
    ServerType = 'IBServer'
    Left = 24
    Top = 16
  end
  object IBTransaction1: TIBTransaction
    Active = True
    DefaultDatabase = IBDatabase1
    Left = 104
    Top = 16
  end
  object ibtAddresses: TIBTable
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'ADDRESSES'
    UniDirectional = False
    Left = 24
    Top = 96
  end
  object ibtOrders: TIBTable
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'ORDERS'
    UniDirectional = False
    Left = 104
    Top = 96
  end
  object ibtOrdersInfo: TIBTable
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'ORDER_INFO'
    UniDirectional = False
    Left = 184
    Top = 96
  end
  object ibtMenu: TIBTable
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'MENU'
    UniDirectional = False
    Left = 264
    Top = 96
    object ibtMenuPRODUCT_ID: TIntegerField
      DisplayLabel = #8470
      FieldName = 'PRODUCT_ID'
      Required = True
    end
    object ibtMenuNAME: TIBStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      DisplayWidth = 50
      FieldName = 'NAME'
      Size = 128
    end
    object ibtMenuCATEGORY_ID: TIntegerField
      DisplayLabel = #1050#1072#1090#1077#1075#1086#1088#1080#1103
      FieldName = 'CATEGORY_ID'
    end
    object ibtMenuPRICE: TIntegerField
      DisplayLabel = #1062#1077#1085#1072
      FieldName = 'PRICE'
    end
  end
  object ibtStatuses: TIBTable
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'STATUSES'
    UniDirectional = False
    Left = 336
    Top = 96
  end
  object ibtSchedule: TIBTable
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'SCHEDULES'
    UniDirectional = False
    Left = 408
    Top = 96
  end
  object ibtCategories: TIBTable
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'CATEGORIES'
    UniDirectional = False
    Left = 480
    Top = 96
  end
  object ibtEmployees: TIBTable
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'EMPLOYEES'
    UniDirectional = False
    Left = 560
    Top = 96
  end
  object IBQuery1: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    Left = 632
    Top = 96
  end
  object dspAddresses: TDataSetProvider
    DataSet = ibtAddresses
    Left = 24
    Top = 168
  end
  object dspOrders: TDataSetProvider
    DataSet = ibtOrders
    Left = 104
    Top = 168
  end
  object dspOrdersInfo: TDataSetProvider
    DataSet = ibtOrdersInfo
    Left = 184
    Top = 168
  end
  object dspMenu: TDataSetProvider
    DataSet = ibtMenu
    Left = 264
    Top = 168
  end
  object dspStatuses: TDataSetProvider
    DataSet = ibtStatuses
    Left = 336
    Top = 168
  end
  object dspSchedule: TDataSetProvider
    DataSet = ibtSchedule
    Left = 408
    Top = 168
  end
  object dspCategories: TDataSetProvider
    DataSet = ibtCategories
    Left = 480
    Top = 168
  end
  object dspEmployees: TDataSetProvider
    DataSet = ibtEmployees
    Left = 560
    Top = 168
  end
  object dspQuery: TDataSetProvider
    DataSet = IBQuery1
    Left = 632
    Top = 168
  end
  object ibspUpdateAddress: TIBStoredProc
    Database = IBDatabase1
    Transaction = IBTransaction1
    StoredProcName = 'UPDATE_ADDRESS'
    Left = 32
    Top = 224
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'INID                           '
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'INSTREET                       '
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'INBUILDING                     '
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'INAPARTMENT                    '
        ParamType = ptUnknown
      end>
  end
  object ibspDeleteAddress: TIBStoredProc
    Database = IBDatabase1
    Transaction = IBTransaction1
    StoredProcName = 'DELETE_ADDRESS'
    Left = 144
    Top = 224
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
    Left = 248
    Top = 224
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
        Name = 'INCLIENT                       '
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'INPHONE                        '
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
        Name = 'INTIMEOFDELIVERY               '
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
    Left = 344
    Top = 224
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'INID                           '
        ParamType = ptUnknown
      end>
  end
  object ibspUpdateOrderInfo: TIBStoredProc
    Database = IBDatabase1
    Transaction = IBTransaction1
    StoredProcName = 'UPDATE_ORDERINFO'
    Left = 456
    Top = 224
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
  object ibspUpdateProduct: TIBStoredProc
    Database = IBDatabase1
    Transaction = IBTransaction1
    StoredProcName = 'UPDATE_PRODUCT'
    Left = 32
    Top = 272
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'INID                           '
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'INNAME                         '
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'INCATEGORY                     '
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'INPRICE                        '
        ParamType = ptUnknown
      end>
  end
  object ibspDeleteProduct: TIBStoredProc
    Database = IBDatabase1
    Transaction = IBTransaction1
    StoredProcName = 'DELETE_PRODUCT'
    Left = 144
    Top = 272
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'INID                           '
        ParamType = ptUnknown
      end>
  end
  object ibspDeleteOrderInfo: TIBStoredProc
    Database = IBDatabase1
    Transaction = IBTransaction1
    StoredProcName = 'DELETE_ORDERINFO'
    Left = 568
    Top = 224
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
  object ibspUpdateOrderStatus: TIBStoredProc
    Database = IBDatabase1
    Transaction = IBTransaction1
    StoredProcName = 'UPDATE_ORDERS_STATUS'
    Left = 248
    Top = 272
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'INORDERID                      '
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'INNEWSTATUS                    '
        ParamType = ptUnknown
      end>
  end
  object ibspUpdateDriversInfo: TIBStoredProc
    Database = IBDatabase1
    Transaction = IBTransaction1
    StoredProcName = 'UPDATE_DRIVERSINFO'
    Left = 368
    Top = 272
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'INEMPID                        '
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'INTOKEN_DEVICE                 '
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'INKEYWORD                      '
        ParamType = ptUnknown
      end>
  end
end
