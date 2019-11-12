object fmMenu: TfmMenu
  Left = 0
  Top = 0
  Caption = 'Menu'
  ClientHeight = 248
  ClientWidth = 456
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object dbgMenu: TDBGrid
    Left = 0
    Top = 0
    Width = 456
    Height = 248
    Align = alClient
    DataSource = dsMenu
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object btnChoose: TButton
    Left = 376
    Top = 216
    Width = 75
    Height = 25
    Caption = #1042#1099#1073#1088#1072#1090#1100
    TabOrder = 1
  end
  object dsMenu: TDataSource
    Left = 200
    Top = 72
  end
  object MainMenu1: TMainMenu
    object miSnacks: TMenuItem
      Caption = #1047#1072#1082#1091#1089#1082#1080
    end
    object miDesserts: TMenuItem
      Caption = #1044#1077#1089#1077#1088#1090#1099
    end
    object miDrinks: TMenuItem
      Caption = #1053#1072#1087#1080#1090#1082#1080
    end
  end
end
