object fmMain: TfmMain
  Left = 0
  Top = 0
  Align = alClient
  Caption = 'fmMain'
  ClientHeight = 461
  ClientWidth = 758
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object pnlOrders: TPanel
    Left = 573
    Top = 41
    Width = 185
    Height = 420
    Align = alRight
    TabOrder = 0
    ExplicitLeft = 482
    ExplicitTop = 48
    ExplicitHeight = 410
    object sbOrders: TScrollBar
      Left = 1
      Top = 1
      Width = 183
      Height = 418
      Align = alClient
      BiDiMode = bdRightToLeft
      PageSize = 0
      ParentBiDiMode = False
      TabOrder = 0
      ExplicitLeft = 5
      ExplicitWidth = 179
    end
  end
  object pnlDrivers: TPanel
    Left = 0
    Top = 41
    Width = 573
    Height = 420
    Align = alClient
    TabOrder = 1
    ExplicitWidth = 393
    object sbStatus: TScrollBar
      Left = 312
      Top = 1
      Width = 260
      Height = 418
      Align = alRight
      BiDiMode = bdRightToLeft
      PageSize = 0
      ParentBiDiMode = False
      TabOrder = 0
    end
    object sbDrivers: TScrollBar
      Left = 1
      Top = 1
      Width = 311
      Height = 418
      Align = alClient
      BiDiMode = bdRightToLeft
      PageSize = 0
      ParentBiDiMode = False
      TabOrder = 1
      ExplicitWidth = 368
    end
  end
  object pnlHeader: TPanel
    Left = 0
    Top = 0
    Width = 758
    Height = 41
    Align = alTop
    TabOrder = 2
    ExplicitLeft = 232
    ExplicitTop = 16
    ExplicitWidth = 185
    object lbDrivers: TLabel
      Left = 88
      Top = 14
      Width = 49
      Height = 13
      Caption = #1042#1086#1076#1080#1090#1077#1083#1080
    end
    object lbStatus: TLabel
      Left = 416
      Top = 14
      Width = 36
      Height = 13
      Caption = #1057#1090#1072#1090#1091#1089
    end
    object lbOrders: TLabel
      Left = 656
      Top = 14
      Width = 37
      Height = 13
      Caption = #1047#1072#1082#1072#1079#1099
    end
  end
end
