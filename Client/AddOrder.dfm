object fmOrder: TfmOrder
  Left = 500
  Top = 150
  BorderStyle = bsSingle
  Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1079#1072#1082#1072#1079
  ClientHeight = 282
  ClientWidth = 457
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lbAddres: TLabel
    Left = 46
    Top = 67
    Width = 44
    Height = 19
    Caption = #1040#1076#1088#1077#1089
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lbOrderer: TLabel
    Left = 24
    Top = 8
    Width = 66
    Height = 19
    Caption = #1047#1072#1082#1072#1079#1095#1080#1082
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lbNumber: TLabel
    Left = 8
    Top = 37
    Width = 123
    Height = 19
    Caption = #1053#1086#1084#1077#1088' '#1090#1077#1083#1077#1092#1086#1085#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object btnAddAddress: TButton
    Left = 320
    Top = 61
    Width = 106
    Height = 25
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1072#1076#1088#1077#1089
    TabOrder = 0
    TabStop = False
    OnClick = btnAddAddressClick
  end
  object eOrderer: TEdit
    Left = 137
    Top = 10
    Width = 177
    Height = 21
    TabStop = False
    TabOrder = 1
  end
  object dbgProducts: TDBGrid
    Left = 10
    Top = 92
    Width = 416
    Height = 120
    TabStop = False
    BiDiMode = bdLeftToRight
    DataSource = dsProducts
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ParentBiDiMode = False
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object btnShowMenu: TButton
    Left = 321
    Top = 218
    Width = 105
    Height = 25
    Caption = #1055#1086#1082#1072#1079#1072#1090#1100' '#1084#1077#1085#1102
    TabOrder = 3
    TabStop = False
    OnClick = btnShowMenuClick
  end
  object btnCancel: TBitBtn
    Left = 351
    Top = 249
    Width = 75
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 4
  end
  object btnOk: TBitBtn
    Left = 232
    Top = 249
    Width = 75
    Height = 25
    Caption = #1043#1086#1090#1086#1074#1086
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 5
    TabStop = False
    OnClick = btnOkClick
  end
  object cbAddress: TComboBox
    Left = 137
    Top = 62
    Width = 177
    Height = 21
    TabOrder = 6
    Text = #1085#1077' '#1074#1099#1073#1088#1072#1085#1086
  end
  object Edit1: TEdit
    Left = 137
    Top = 37
    Width = 177
    Height = 21
    TabOrder = 7
  end
  object dsProducts: TDataSource
    Left = 96
    Top = 120
  end
end
