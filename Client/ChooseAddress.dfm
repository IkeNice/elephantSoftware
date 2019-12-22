object fmChooseAddress: TfmChooseAddress
  Left = 0
  Top = 0
  Caption = #1042#1099#1073#1086#1088' '#1072#1076#1088#1077#1089#1072
  ClientHeight = 213
  ClientWidth = 471
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 471
    Height = 172
    Align = alClient
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object Panel1: TPanel
    Left = 0
    Top = 172
    Width = 471
    Height = 41
    Align = alBottom
    BorderStyle = bsSingle
    TabOrder = 1
  end
  object btnChooseAddress: TButton
    Left = 364
    Top = 180
    Width = 75
    Height = 25
    Caption = #1042#1099#1073#1088#1072#1090#1100
    TabOrder = 2
  end
  object dsChooseAddress: TDataSource
    Left = 144
    Top = 64
  end
  object MainMenu1: TMainMenu
    Left = 65528
    object N1: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      OnClick = N1Click
    end
  end
end
