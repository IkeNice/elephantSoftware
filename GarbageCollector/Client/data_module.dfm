object dm: Tdm
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 472
  Width = 716
  object Torders: TIBTable
    Database = dm_db.IBDatabase_read
    Transaction = dm_db.IBTransaction_read
    BufferChunks = 1000
    CachedUpdates = False
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
    Left = 512
    Top = 72
  end
  object TWorkers: TIBTable
    Database = dm_db.IBDatabase_read
    Transaction = dm_db.IBTransaction_read
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'EMPLOYEES'
    UniDirectional = False
    Left = 512
    Top = 120
  end
  object spEDIT_ORDER_SET_DRIVER: TIBStoredProc
    Database = dm_db.IBDatabase_read
    Transaction = dm_db.IBTransaction_read
    StoredProcName = 'UPDATE_ORDERS_COURIER'
    Left = 272
    Top = 88
    ParamData = <
      item
        DataType = ftInteger
        Name = 'INORDERID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'INNEWSTATUS'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'INDRIVERID'
        ParamType = ptInput
      end>
  end
  object spAdd_order: TIBStoredProc
    Database = dm_db.IBDatabase_read
    Transaction = dm_db.IBTransaction_read
    StoredProcName = 'ADD_ORDER'
    Left = 408
    Top = 144
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ID_CUSTOMER'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'WEIGHT'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'FROM_ID_ADDREESS'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TO_ID_ADDRESS'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DATE_OF_DELIVERY'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'WHO_DRIVER'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID_OPERATOR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'NUMBER_STEVEDORE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PRICE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'STATUS'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DATE_ORDER_COMPLETION'
        ParamType = ptInput
      end
      item
        DataType = ftTimeStamp
        Name = 'DATE_ORDER_CANCELLATION '
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'RESULT'
        ParamType = ptOutput
      end>
  end
  object TVehicle: TIBTable
    Database = dm_db.IBDatabase_read
    Transaction = dm_db.IBTransaction_read
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'MENU'
    UniDirectional = False
    Left = 512
    Top = 184
  end
  object TNew_da_car_delivery: TIBTable
    Database = dm_db.IBDatabase_read
    Transaction = dm_db.IBTransaction_read
    BufferChunks = 1000
    CachedUpdates = False
    UniDirectional = False
    Left = 592
    Top = 176
  end
  object QDriver_id_from_vehicle_day: TIBQuery
    Database = dm_db.IBDatabase_read
    Transaction = dm_db.IBTransaction_read
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      '')
    Left = 72
    Top = 296
  end
  object spBegin_day_driver: TIBStoredProc
    Database = dm_db.IBDatabase_read
    Transaction = dm_db.IBTransaction_read
    StoredProcName = 'BEGIN_DAY_DRIVER'
    Left = 416
    Top = 200
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ID_WORKER'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID_CAR'
        ParamType = ptInput
      end>
  end
  object spLogin: TIBStoredProc
    Database = dm_db.IBDatabase_read
    Transaction = dm_db.IBTransaction_read
    StoredProcName = 'LOGIN_PROC'
    Left = 272
    Top = 136
  end
  object QDrivers: TIBQuery
    Database = dm_db.IBDatabase_read
    Transaction = dm_db.IBTransaction_read
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      
        'select employees.emp_id, employees.first_name, employees.second_' +
        'name, employees.last_name, authotization.login,  authotization."' +
        'PASSWORD" from employees inner join authotization on employees.e' +
        'mp_id = authotization.emp_id where employees.job_id = 3;')
    Left = 72
    Top = 144
  end
  object QManagers: TIBQuery
    Database = dm_db.IBDatabase_read
    Transaction = dm_db.IBTransaction_read
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      
        'select employees.emp_id, employees.first_name, employees.second_' +
        'name, employees.last_name, authotization.login,  authotization."' +
        'PASSWORD" from employees inner join authotization on employees.e' +
        'mp_id = authotization.emp_id where employees.job_id = 1;')
    Left = 72
    Top = 48
  end
  object QOperators: TIBQuery
    Database = dm_db.IBDatabase_read
    Transaction = dm_db.IBTransaction_read
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      
        'select employees.emp_id, employees.first_name, employees.second_' +
        'name, employees.last_name, authotization.login,  authotization."' +
        'PASSWORD" from employees inner join authotization on employees.e' +
        'mp_id = authotization.emp_id where employees.job_id = 2;')
    Left = 72
    Top = 96
  end
  object QCustomers: TIBQuery
    Database = dm_db.IBDatabase_read
    Transaction = dm_db.IBTransaction_read
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select CLIENT_NAME from ORDERS where ORDER_ID = :inorderid')
    Left = 64
    Top = 192
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'inorderid'
        ParamType = ptUnknown
      end>
  end
  object TAddress_Out: TIBTable
    Database = dm_db.IBDatabase_read
    Transaction = dm_db.IBTransaction_read
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'ADDRESSES'
    UniDirectional = False
    Left = 592
    Top = 120
  end
  object QCustomer_By_Id: TIBQuery
    Database = dm_db.IBDatabase_read
    Transaction = dm_db.IBTransaction_read
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'Select * from customers where id = :ID_CUSTOMER;')
    Left = 152
    Top = 240
    ParamData = <
      item
        DataType = ftInteger
        Name = 'id_customer'
        ParamType = ptInput
      end>
  end
  object QCar_By_Id: TIBQuery
    Database = dm_db.IBDatabase_read
    Transaction = dm_db.IBTransaction_read
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from garage where id = :id_car;')
    Left = 136
    Top = 96
    ParamData = <
      item
        DataType = ftInteger
        Name = 'id_car'
        ParamType = ptInput
      end>
  end
  object QOrder_By_Id: TIBQuery
    Database = dm_db.IBDatabase_read
    Transaction = dm_db.IBTransaction_read
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from  ORDERS where ORDER_ID = :id_order;')
    Left = 136
    Top = 144
    ParamData = <
      item
        DataType = ftInteger
        Name = 'id_order'
        ParamType = ptInput
      end>
  end
  object QAddress_By_Id: TIBQuery
    Database = dm_db.IBDatabase_read
    Transaction = dm_db.IBTransaction_read
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from addresses where address_id = :id_address;')
    Left = 64
    Top = 240
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'address_id'
        ParamType = ptUnknown
      end>
  end
  object spEdit_Order_Status: TIBStoredProc
    Database = dm_db.IBDatabase_read
    Transaction = dm_db.IBTransaction_read
    StoredProcName = 'EDIT_ORDER_SET_STATUS'
    Left = 408
    Top = 88
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ID_ORDER'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'NEW_STATUS'
        ParamType = ptInput
      end>
  end
  object QWorker_By_Id: TIBQuery
    Database = dm_db.IBDatabase_read
    Transaction = dm_db.IBTransaction_read
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from EMPLOYEES where emp_id = :emp_id;')
    Left = 136
    Top = 192
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'emp_id'
        ParamType = ptUnknown
      end>
  end
  object QLogin_By_Id: TIBQuery
    Database = dm_db.IBDatabase_read
    Transaction = dm_db.IBTransaction_edit
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from authotization where emp_id = :id_login;')
    Left = 136
    Top = 48
    ParamData = <
      item
        DataType = ftInteger
        Name = 'id_login'
        ParamType = ptInput
      end>
  end
  object QMenu: TIBQuery
    Database = dm_db.IBDatabase_read
    Transaction = dm_db.IBTransaction_read
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      
        'select menu.product_id, menu.name,  menu.category_id, menu.price' +
        ', categories.name from menu inner join categories on menu.catego' +
        'ry_id = categories.category_id;')
    Left = 56
    Top = 352
  end
  object IBQuery1: TIBQuery
    Database = dm_db.IBDatabase_read
    Transaction = dm_db.IBTransaction_read
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    Left = 200
    Top = 344
  end
  object spDeleteOrder: TIBStoredProc
    Database = dm_db.IBDatabase_edit
    Transaction = dm_db.IBTransaction_edit
    StoredProcName = 'DELETE_ORDER'
    Left = 488
    Top = 312
    ParamData = <
      item
        DataType = ftInteger
        Name = 'INID                           '
        ParamType = ptInput
      end>
  end
  object spUpdateOrderInfo: TIBStoredProc
    Database = dm_db.IBDatabase_edit
    Transaction = dm_db.IBTransaction_edit
    StoredProcName = 'UPDATE_ORDERINFO'
    Left = 392
    Top = 264
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
  object qOrderInfo: TIBQuery
    Database = dm_db.IBDatabase_edit
    Transaction = dm_db.IBTransaction_edit
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      '')
    Left = 120
    Top = 368
  end
end
