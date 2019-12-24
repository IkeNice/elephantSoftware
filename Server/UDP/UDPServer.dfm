object UDP: TUDP
  Left = 0
  Top = 0
  Caption = 'UDPServer'
  ClientHeight = 201
  ClientWidth = 447
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 48
    Top = 21
    Width = 52
    Height = 13
    Caption = 'IP Address'
  end
  object Edit1: TEdit
    Left = 48
    Top = 40
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object IdUDPClient1: TIdUDPClient
    Port = 0
    Left = 208
    Top = 88
  end
  object IdUDPServer1: TIdUDPServer
    Bindings = <>
    DefaultPort = 0
    Left = 296
    Top = 88
  end
end
