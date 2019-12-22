object fmTestServer: TfmTestServer
  Left = 0
  Top = 0
  Caption = 'HTTP-Server'
  ClientHeight = 257
  ClientWidth = 364
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  DesignSize = (
    364
    257)
  PixelsPerInch = 96
  TextHeight = 13
  object lbPort: TLabel
    Left = 8
    Top = 8
    Width = 20
    Height = 13
    Caption = 'Port'
  end
  object lbName: TLabel
    Left = 8
    Top = 40
    Width = 34
    Height = 13
    Caption = 'Name: '
  end
  object lbPass: TLabel
    Left = 177
    Top = 38
    Width = 50
    Height = 13
    Caption = 'Password:'
  end
  object ePort: TEdit
    Left = 34
    Top = 8
    Width = 31
    Height = 21
    TabOrder = 0
    Text = '8000'
  end
  object cbPassSec: TCheckBox
    Left = 71
    Top = 8
    Width = 106
    Height = 17
    Caption = 'Password secured'
    TabOrder = 1
  end
  object gbServer: TGroupBox
    Left = 8
    Top = 80
    Width = 346
    Height = 137
    Anchors = [akLeft, akTop, akRight, akBottom]
    Caption = 'Protocol (User: 0)'
    TabOrder = 2
    DesignSize = (
      346
      137)
    object MemoServer: TMemo
      Left = 3
      Top = 16
      Width = 340
      Height = 118
      Anchors = [akLeft, akTop, akRight, akBottom]
      Lines.Strings = (
        'Server 1.0')
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 0
    end
  end
  object eName: TEdit
    Left = 48
    Top = 35
    Width = 121
    Height = 21
    TabOrder = 3
  end
  object ePass: TEdit
    Left = 233
    Top = 35
    Width = 121
    Height = 21
    TabOrder = 4
  end
  object btnStart: TButton
    Left = 8
    Top = 223
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Start'
    TabOrder = 5
    OnClick = btnStartClick
  end
  object btnStop: TButton
    Left = 102
    Top = 223
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Stop'
    Enabled = False
    TabOrder = 6
    OnClick = btnStopClick
  end
  object btnClear: TButton
    Left = 192
    Top = 223
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Clear'
    TabOrder = 7
    OnClick = btnClearClick
  end
  object XPManifest1: TXPManifest
    Left = 288
    Top = 112
  end
  object Server: TIdHTTPServer
    Bindings = <>
    OnConnect = ServerConnect
    OnDisconnect = ServerDisconnect
    OnCommandGet = ServerCommandGet
    Left = 232
    Top = 112
  end
end
