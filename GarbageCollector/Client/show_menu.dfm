object fmMenu: TfmMenu
  Left = 0
  Top = 0
  Caption = 'Menu'
  ClientHeight = 248
  ClientWidth = 486
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnActivate = FormActivate
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object dbgMenu: TDBGrid
    Left = 0
    Top = 0
    Width = 486
    Height = 198
    Align = alClient
    DataSource = dsMenu
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object Panel1: TPanel
    Left = 0
    Top = 198
    Width = 486
    Height = 50
    Align = alBottom
    BorderStyle = bsSingle
    TabOrder = 1
    object lbQuantity: TLabel
      Left = 19
      Top = 13
      Width = 86
      Height = 19
      Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object edQuantity: TEdit
      Left = 120
      Top = 13
      Width = 121
      Height = 21
      TabOrder = 0
      OnChange = edQuantityChange
    end
    object btnChoose: TButton
      Left = 392
      Top = 10
      Width = 75
      Height = 25
      Caption = #1042#1099#1073#1088#1072#1090#1100
      Enabled = False
      TabOrder = 1
      OnClick = btnChooseClick
    end
  end
  object MainMenu1: TMainMenu
    Left = 16
    Top = 24
    object miAllMenu: TMenuItem
      Caption = #1042#1089#1077' '#1084#1077#1085#1102
      OnClick = miAllMenuClick
    end
    object miFirstCourse: TMenuItem
      Caption = #1055#1077#1088#1074#1099#1077' '#1073#1083#1102#1076#1072
      OnClick = miAllMenuClick
    end
    object miSecondCourse: TMenuItem
      Caption = #1042#1090#1086#1088#1099#1077' '#1073#1083#1102#1076#1072
      OnClick = miAllMenuClick
    end
    object miDrink: TMenuItem
      Caption = #1044#1077#1089#1077#1088#1090#1099
      OnClick = miAllMenuClick
    end
    object miDessert: TMenuItem
      Caption = #1053#1072#1087#1080#1090#1082#1080
      OnClick = miAllMenuClick
    end
  end
  object dsMenu: TDataSource
    Left = 216
    Top = 96
  end
end
