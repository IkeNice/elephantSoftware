object MyServer: TMyServer
  OldCreateOrder = False
  Height = 483
  Width = 735
  object IBTransaction1: TIBTransaction
    Active = True
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
    FieldDefs = <
      item
        Name = 'PRODUCT_ID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'NAME'
        DataType = ftWideString
        Size = 128
      end
      item
        Name = 'CATEGORY_ID'
        DataType = ftInteger
      end
      item
        Name = 'PRICE'
        DataType = ftInteger
      end>
    IndexDefs = <
      item
        Name = 'PK_MENU'
        Fields = 'PRODUCT_ID'
        Options = [ixUnique]
      end
      item
        Name = 'FK_MENU_CATEGORIES'
        Fields = 'CATEGORY_ID'
      end>
    StoreDefs = True
    TableName = 'MENU'
    UniDirectional = False
    Left = 240
    Top = 88
    object ibtMenuPRODUCT_ID: TIntegerField
      DisplayLabel = #8470
      FieldName = 'PRODUCT_ID'
      Required = True
    end
    object ibtMenuNAME: TIBStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
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
  object ibtAddresses: TIBTable
    Database = IBDatabase1
    Transaction = IBTransaction1
    Active = True
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'ADDRESS_ID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'STREET'
        DataType = ftWideString
        Size = 128
      end
      item
        Name = 'BUILDING'
        DataType = ftWideString
        Size = 32
      end
      item
        Name = 'APARTMENT'
        DataType = ftInteger
      end>
    IndexDefs = <
      item
        Name = 'PK_ADDRESSES'
        Fields = 'ADDRESS_ID'
        Options = [ixUnique]
      end>
    StoreDefs = True
    TableName = 'ADDRESSES'
    UniDirectional = False
    Left = 344
    Top = 88
    object ibtAddressesADDRESS_ID: TIntegerField
      FieldName = 'ADDRESS_ID'
      Required = True
    end
    object ibtAddressesSTREET: TIBStringField
      FieldName = 'STREET'
      Size = 128
    end
    object ibtAddressesBUILDING: TIBStringField
      FieldName = 'BUILDING'
      Size = 32
    end
    object ibtAddressesAPARTMENT: TIntegerField
      FieldName = 'APARTMENT'
    end
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
    Connected = True
    DatabaseName = 
      'C:\Users\hieut\OneDrive\'#1044#1086#1082#1091#1084#1077#1085#1090#1099'\GitHub\elephantSoftware\ELEPHA' +
      'NTSOFTWARE (1).FDB'
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
        DataType = ftInteger
        Name = 'INID'
        ParamType = ptInput
      end
      item
        DataType = ftWideString
        Name = 'INNAME'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'INCATEGORY'
        ParamType = ptInput
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
        DataType = ftInteger
        Name = 'INID'
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
