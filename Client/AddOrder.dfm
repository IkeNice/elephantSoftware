object fmOrder: TfmOrder
  Left = 0
  Top = 0
  Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1079#1072#1082#1072#1079
  ClientHeight = 176
  ClientWidth = 449
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lbAddres: TLabel
    Left = 32
    Top = 40
    Width = 31
    Height = 13
    Caption = #1040#1076#1088#1077#1089
  end
  object cbAddres: TComboBoxEx
    Left = 144
    Top = 37
    Width = 177
    Height = 22
    ItemsEx = <>
    TabOrder = 0
  end
  object btnAddAddres: TButton
    Left = 327
    Top = 35
    Width = 98
    Height = 25
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1072#1076#1088#1077#1089
    TabOrder = 1
    OnClick = btnAddAddresClick
  end
  object btnAdd: TButton
    Left = 350
    Top = 143
    Width = 75
    Height = 25
    Caption = #1043#1086#1090#1086#1074#1086
    TabOrder = 2
    OnClick = btnAddClick
  end
end
