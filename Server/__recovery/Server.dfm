object fmServer: TfmServer
  Left = 0
  Top = 0
  Caption = 'fmServer'
  ClientHeight = 297
  ClientWidth = 549
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Memo: TMemo
    Left = 248
    Top = 32
    Width = 257
    Height = 129
    Lines.Strings = (
      'Memo')
    TabOrder = 0
  end
  object Button1: TButton
    Left = 430
    Top = 176
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 1
    OnClick = Button1Click
  end
  object IBDatabase1: TIBDatabase
    ServerType = 'IBServer'
    Left = 56
    Top = 48
  end
  object MyServer: TIdHTTPServer
    Active = True
    Bindings = <>
    OnCommandGet = MyServerCommandGet
    Left = 168
    Top = 48
  end
  object MyClient: TIdHTTP
    AllowCookies = True
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.ContentRangeEnd = -1
    Request.ContentRangeStart = -1
    Request.ContentRangeInstanceLength = -1
    Request.Accept = 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    Request.Ranges.Units = 'bytes'
    Request.Ranges = <>
    HTTPOptions = [hoForceEncodeParams]
    Left = 168
    Top = 120
  end
end
