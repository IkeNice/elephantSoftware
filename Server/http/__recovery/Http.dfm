object FHttp: TFHttp
  Left = 0
  Top = 0
  Caption = 'FHttp'
  ClientHeight = 166
  ClientWidth = 279
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 175
    Top = 8
    Width = 79
    Height = 25
    Caption = #1054#1090#1087#1088#1072#1074#1080#1090#1100
    TabOrder = 0
  end
  object Memo1: TMemo
    Left = 8
    Top = 39
    Width = 246
    Height = 99
    TabOrder = 1
  end
  object Edit1: TEdit
    Left = 8
    Top = 8
    Width = 81
    Height = 21
    TabOrder = 2
  end
  object Button2: TButton
    Left = 95
    Top = 8
    Width = 75
    Height = 25
    Caption = #1054#1090#1087#1088#1072#1074#1080#1090#1100'2'
    TabOrder = 3
  end
  object IdHTTP1: TIdHTTP
    AllowCookies = True
    HandleRedirects = True
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
    Left = 56
    Top = 56
  end
  object IdHTTPServer1: TIdHTTPServer
    Active = True
    Bindings = <>
    DefaultPort = 7777
    AutoStartSession = True
    Left = 136
    Top = 72
  end
end
