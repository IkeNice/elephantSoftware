object dm_add: Tdm_add
  OldCreateOrder = False
  Height = 354
  Width = 554
  object spAdd_Car: TIBStoredProc
    Database = dm_db.IBDatabase_edit
    Transaction = dm_db.IBTransaction_edit
    StoredProcName = 'ADD_CAR'
    Left = 40
    Top = 32
    ParamData = <
      item
        DataType = ftWideString
        Name = 'MARKA'
        ParamType = ptInput
      end
      item
        DataType = ftWideString
        Name = 'NUMBER'
        ParamType = ptInput
      end
      item
        DataType = ftWideString
        Name = 'MODEL'
        ParamType = ptInput
      end>
  end
  object spEdit_Car: TIBStoredProc
    Database = dm_db.IBDatabase_edit
    Transaction = dm_db.IBTransaction_edit
    StoredProcName = 'EDIT_CAR'
    Left = 168
    Top = 32
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end
      item
        DataType = ftWideString
        Name = 'MARKA'
        ParamType = ptInput
      end
      item
        DataType = ftWideString
        Name = 'NUMBER'
        ParamType = ptInput
      end
      item
        DataType = ftWideString
        Name = 'MODEL'
        ParamType = ptInput
      end>
  end
  object spEdit_Worker: TIBStoredProc
    Database = dm_db.IBDatabase_edit
    Transaction = dm_db.IBTransaction_edit
    StoredProcName = 'EDIT_WORKER'
    Left = 264
    Top = 32
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'STATUS'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ROLE_'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'EXPERIENCE'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DOB'
        ParamType = ptInput
      end
      item
        DataType = ftWideString
        Name = 'SURNAME'
        ParamType = ptInput
      end
      item
        DataType = ftWideString
        Name = 'NAME'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'LOGIN'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PASSWORD_'
        ParamType = ptInput
      end>
  end
  object spAdd_Address: TIBStoredProc
    Database = dm_db.IBDatabase_edit
    Transaction = dm_db.IBTransaction_edit
    StoredProcName = 'ADD_ADDRESS'
    Left = 392
    Top = 24
    ParamData = <
      item
        DataType = ftString
        Name = 'CITY'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'STREET'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'NUMBER_HOUSE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'FLOOR_'
        ParamType = ptInput
      end>
  end
  object spAdd_Order: TIBStoredProc
    Database = dm_db.IBDatabase_edit
    Transaction = dm_db.IBTransaction_edit
    StoredProcName = 'UPDATE_ORDER'
    Left = 256
    Top = 128
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
  object spAdd_Customer: TIBStoredProc
    Database = dm_db.IBDatabase_edit
    Transaction = dm_db.IBTransaction_edit
    StoredProcName = 'ADD_CUSTOMER'
    Left = 96
    Top = 128
    ParamData = <
      item
        DataType = ftString
        Name = 'NAME'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'SURNAME'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID_ADDRESS'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PHONE_NUMBER'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'RESULT'
        ParamType = ptOutput
      end>
  end
  object spAdd_Worker: TIBStoredProc
    Database = dm_db.IBDatabase_edit
    Transaction = dm_db.IBTransaction_edit
    StoredProcName = 'UPDATE_EMP'
    Left = 480
    Top = 24
    ParamData = <
      item
        DataType = ftInteger
        Name = 'INID'
        ParamType = ptInput
      end
      item
        DataType = ftWideString
        Name = 'INFIRSTNAME'
        ParamType = ptInput
      end
      item
        DataType = ftWideString
        Name = 'INSECONDNAME'
        ParamType = ptInput
      end
      item
        DataType = ftWideString
        Name = 'INLASTNAME'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'INJOBID'
        ParamType = ptInput
      end
      item
        DataType = ftWideString
        Name = 'INLOGIN'
        ParamType = ptInput
      end
      item
        DataType = ftWideString
        Name = 'INPASSWORD'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'OUT_SUCCESS'
        ParamType = ptOutput
      end>
  end
end
