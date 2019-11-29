object dmMy: TdmMy
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 298
  Width = 413
  object DCOMConnection1: TDCOMConnection
    Connected = True
    ServerGUID = '{A7EF958A-E1E9-45EB-9930-E3FBB4AC38DA}'
    ServerName = 'MyServer'
    ComputerName = 'localhost'
    Left = 40
    Top = 16
  end
  object cdsOrders: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspOrders'
    RemoteServer = DCOMConnection1
    Left = 32
    Top = 104
    object cdsOrdersORDER_ID: TIntegerField
      FieldName = 'ORDER_ID'
      Required = True
    end
    object cdsOrdersSTATUS_ID: TIntegerField
      FieldName = 'STATUS_ID'
    end
    object cdsOrdersCLIENT: TWideStringField
      FieldName = 'CLIENT'
      Size = 128
    end
    object cdsOrdersADDRESS_ID: TIntegerField
      FieldName = 'ADDRESS_ID'
    end
    object cdsOrdersCOURIER_ID: TIntegerField
      FieldName = 'COURIER_ID'
    end
    object cdsOrdersOPERATOR_ID: TIntegerField
      FieldName = 'OPERATOR_ID'
    end
    object cdsOrdersDATE: TDateField
      FieldName = 'DATE'
    end
    object cdsOrdersTOTAL_PRICE: TIntegerField
      FieldName = 'TOTAL_PRICE'
    end
  end
  object cdsOrdersInfo: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspOrderInfo'
    RemoteServer = DCOMConnection1
    Left = 136
    Top = 104
    object cdsOrdersInfoORDER_ID: TIntegerField
      FieldName = 'ORDER_ID'
    end
    object cdsOrdersInfoPRODUCT_ID: TIntegerField
      FieldName = 'PRODUCT_ID'
    end
    object cdsOrdersInfoQUANTITY: TIntegerField
      FieldName = 'QUANTITY'
    end
    object cdsOrdersInfoPRICE: TIntegerField
      FieldName = 'PRICE'
    end
  end
  object cdsAddresses: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspAddresses'
    RemoteServer = DCOMConnection1
    Left = 240
    Top = 104
    object cdsAddressesADDRESS_ID: TIntegerField
      FieldName = 'ADDRESS_ID'
      Required = True
    end
    object cdsAddressesSTREET: TWideStringField
      FieldName = 'STREET'
      Size = 128
    end
    object cdsAddressesBUILDING: TWideStringField
      FieldName = 'BUILDING'
      Size = 32
    end
    object cdsAddressesAPARTMENT: TIntegerField
      FieldName = 'APARTMENT'
    end
  end
  object cdsMenu: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspMenu'
    RemoteServer = DCOMConnection1
    Left = 336
    Top = 104
    object cdsMenuPRODUCT_ID: TIntegerField
      Alignment = taCenter
      DisplayLabel = #8470
      FieldName = 'PRODUCT_ID'
      Required = True
    end
    object cdsMenuNAME: TWideStringField
      FieldName = 'NAME'
      Size = 50
    end
    object cdsMenuCATEGORY_ID: TIntegerField
      FieldName = 'CATEGORY_ID'
    end
    object cdsMenuPRICE: TIntegerField
      FieldName = 'PRICE'
    end
  end
end
