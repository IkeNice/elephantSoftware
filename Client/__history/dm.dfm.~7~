object dmMy: TdmMy
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 298
  Width = 413
  object DCOMConnection1: TDCOMConnection
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
  end
  object cdsOrdersInfo: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspOrderInfo'
    RemoteServer = DCOMConnection1
    Left = 136
    Top = 104
  end
  object cdsAddresses: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspAddresses'
    RemoteServer = DCOMConnection1
    Left = 240
    Top = 104
  end
  object cdsMenu: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspMenu'
    RemoteServer = DCOMConnection1
    Left = 336
    Top = 104
  end
end
