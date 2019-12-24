object dmMy: TdmMy
  OldCreateOrder = False
  Height = 356
  Width = 700
  object IBDatabase1: TIBDatabase
    DatabaseName = 
      'E:\General\'#1044#1086#1082#1091#1084#1077#1085#1090#1099'\GitHub\Unity\elephantSoftware\ELEPHANTSOFTW' +
      'ARE.FDB'
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
    DefaultDatabase = IBDatabase1
    Left = 104
    Top = 16
  end
  object ibtAddresses: TIBTable
    Database = IBDatabase1
    Transaction = IBTransaction1
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
    Left = 24
    Top = 96
  end
  object ibtOrders: TIBTable
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'ORDER_ID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'STATUS_ID'
        DataType = ftInteger
      end
      item
        Name = 'CLIENT_NAME'
        DataType = ftWideString
        Size = 64
      end
      item
        Name = 'PHONE_NUMBER'
        DataType = ftWideString
        Size = 30
      end
      item
        Name = 'ADDRESS_ID'
        DataType = ftInteger
      end
      item
        Name = 'COURIER_ID'
        DataType = ftInteger
      end
      item
        Name = 'OPERATOR_ID'
        DataType = ftInteger
      end
      item
        Name = 'DATE'
        DataType = ftDate
      end
      item
        Name = 'TIME_OF_DELIVERY'
        DataType = ftWideString
        Size = 5
      end
      item
        Name = 'TOTAL_PRICE'
        DataType = ftInteger
      end>
    IndexDefs = <
      item
        Name = 'PK_ORDERS'
        Fields = 'ORDER_ID'
        Options = [ixUnique]
      end
      item
        Name = 'FK_ORDERS_STATUSES'
        Fields = 'STATUS_ID'
      end
      item
        Name = 'FK_ORDERS_ADDRESSES'
        Fields = 'ADDRESS_ID'
      end
      item
        Name = 'FK_ORDERS_EMP_COURIER'
        Fields = 'COURIER_ID'
      end
      item
        Name = 'FK_ORDERS_EMP_OPERATOR'
        Fields = 'OPERATOR_ID'
      end>
    StoreDefs = True
    TableName = 'ORDERS'
    UniDirectional = False
    Left = 104
    Top = 96
    object ibtOrdersORDER_ID: TIntegerField
      FieldName = 'ORDER_ID'
      Required = True
    end
    object ibtOrdersSTATUS_ID: TIntegerField
      FieldName = 'STATUS_ID'
    end
    object ibtOrdersCLIENT_NAME: TIBStringField
      FieldName = 'CLIENT_NAME'
      Size = 64
    end
    object ibtOrdersPHONE_NUMBER: TIBStringField
      FieldName = 'PHONE_NUMBER'
      Size = 30
    end
    object ibtOrdersADDRESS_ID: TIntegerField
      FieldName = 'ADDRESS_ID'
    end
    object ibtOrdersCOURIER_ID: TIntegerField
      FieldName = 'COURIER_ID'
    end
    object ibtOrdersOPERATOR_ID: TIntegerField
      FieldName = 'OPERATOR_ID'
    end
    object ibtOrdersDATE: TDateField
      FieldName = 'DATE'
    end
    object ibtOrdersTIME_OF_DELIVERY: TIBStringField
      FieldName = 'TIME_OF_DELIVERY'
      Size = 5
    end
    object ibtOrdersTOTAL_PRICE: TIntegerField
      FieldName = 'TOTAL_PRICE'
    end
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
        DataType = ftInteger
        Name = 'INID                           '
        ParamType = ptInput
      end
      item
        DataType = ftWideString
        Name = 'INSTREET                       '
        ParamType = ptInput
      end
      item
        DataType = ftWideString
        Name = 'INBUILDING                     '
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'INAPARTMENT                    '
        ParamType = ptInput
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
        DataType = ftInteger
        Name = 'INID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'INSTATUSID'
        ParamType = ptInput
      end
      item
        DataType = ftWideString
        Name = 'INCLIENT'
        ParamType = ptInput
      end
      item
        DataType = ftWideString
        Name = 'INPHONE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'INADDRESSID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'INCOURIERID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'INOPERATORID'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'INDATE'
        ParamType = ptInput
      end
      item
        DataType = ftWideString
        Name = 'INTIMEOFDELIVERY'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'INTOTALPRICE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'OUTNEW_ID'
        ParamType = ptOutput
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
        DataType = ftInteger
        Name = 'INID                           '
        ParamType = ptInput
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
        DataType = ftInteger
        Name = 'INORDERID                      '
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'INPRODUCTID                    '
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'INQUANTITY                     '
        ParamType = ptInput
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
