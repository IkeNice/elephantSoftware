object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 277
  ClientWidth = 382
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Вход: TLabel
    Left = 160
    Top = 24
    Width = 87
    Height = 46
    Caption = #1042#1093#1086#1076
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -37
    Font.Name = 'Trebuchet MS'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Login: TLabel
    Left = 24
    Top = 104
    Width = 45
    Height = 24
    Caption = 'Login'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    ParentFont = False
  end
  object Password: TLabel
    Left = 24
    Top = 156
    Width = 79
    Height = 24
    Caption = 'Password'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    ParentFont = False
  end
  object Edit1: TEdit
    Left = 128
    Top = 104
    Width = 193
    Height = 21
    TabOrder = 0
  end
  object Edit2: TEdit
    Left = 128
    Top = 154
    Width = 193
    Height = 21
    PasswordChar = '*'
    TabOrder = 1
  end
  object Button1: TButton
    Left = 246
    Top = 208
    Width = 75
    Height = 25
    Caption = 'Log In'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 128
    Top = 208
    Width = 75
    Height = 25
    Caption = 'Clear'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 320
    Top = 154
    Width = 33
    Height = 21
    Caption = 'See'
    TabOrder = 4
    OnMouseDown = Button3MouseDown
  end
  object SQLConnection1: TSQLConnection
    Left = 312
    Top = 40
  end
end
