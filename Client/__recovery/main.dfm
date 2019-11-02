object fmMain: TfmMain
  Left = 0
  Top = 0
  Align = alClient
  Caption = 'fmMain'
  ClientHeight = 394
  ClientWidth = 811
  Color = clBtnFace
  DragMode = dmAutomatic
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  WindowState = wsMaximized
  OnActivate = FormActivate
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object pnlOrders: TPanel
    Left = 626
    Top = 41
    Width = 185
    Height = 289
    Align = alRight
    DockSite = True
    TabOrder = 0
    OnDragDrop = pnlOrdersDragDrop
    OnDragOver = pnlOrdersDragOver
    ExplicitLeft = 581
    ExplicitHeight = 325
    object sboxOrders: TScrollBox
      Left = 1
      Top = 1
      Width = 183
      Height = 287
      Align = alClient
      DockSite = True
      TabOrder = 0
      OnDragDrop = pnlOrdersDragDrop
      OnDragOver = pnlOrdersDragOver
      OnMouseWheelDown = sboxOrdersMouseWheelDown
      ExplicitLeft = 5
      ExplicitTop = -2
      object Panel1: TPanel
        Left = 3
        Top = 40
        Width = 185
        Height = 41
        Caption = 'Panel1'
        DragMode = dmAutomatic
        ParentBackground = False
        TabOrder = 0
      end
      object Panel2: TPanel
        Left = 32
        Top = 144
        Width = 57
        Height = 169
        Caption = 'Panel2'
        DragMode = dmAutomatic
        TabOrder = 1
      end
    end
  end
  object pnlDrivers: TPanel
    Left = 0
    Top = 41
    Width = 626
    Height = 289
    Align = alClient
    DockSite = True
    TabOrder = 1
    OnDragDrop = pnlOrdersDragDrop
    OnDragOver = pnlOrdersDragOver
    ExplicitWidth = 581
    ExplicitHeight = 325
    object sboxDrivers: TScrollBox
      Left = 1
      Top = 1
      Width = 257
      Height = 287
      Align = alClient
      DockSite = True
      TabOrder = 0
      OnDragDrop = pnlOrdersDragDrop
      OnDragOver = pnlOrdersDragOver
      ExplicitWidth = 320
    end
    object sboxStatus: TScrollBox
      Left = 258
      Top = 1
      Width = 367
      Height = 287
      Align = alRight
      DockSite = True
      TabOrder = 1
      OnDragDrop = pnlOrdersDragDrop
      OnDragOver = pnlOrdersDragOver
      ExplicitLeft = 259
      ExplicitTop = -2
    end
  end
  object pnlHeader: TPanel
    Left = 0
    Top = 0
    Width = 811
    Height = 41
    Align = alTop
    TabOrder = 2
    ExplicitWidth = 766
    object lbDrivers: TLabel
      Left = 88
      Top = 14
      Width = 70
      Height = 19
      Caption = #1042#1086#1076#1080#1090#1077#1083#1080
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lbStatus: TLabel
      Left = 416
      Top = 14
      Width = 49
      Height = 19
      Caption = #1057#1090#1072#1090#1091#1089
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lbOrders: TLabel
      Left = 656
      Top = 14
      Width = 51
      Height = 19
      Caption = #1047#1072#1082#1072#1079#1099
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
  end
  object pnlControl: TPanel
    Left = 0
    Top = 330
    Width = 811
    Height = 64
    Align = alBottom
    BorderWidth = 5
    BorderStyle = bsSingle
    ParentBackground = False
    TabOrder = 3
    ExplicitTop = 381
    ExplicitWidth = 790
    object btnAddOrder: TButton
      Left = 619
      Top = 11
      Width = 137
      Height = 38
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1079#1072#1082#1072#1079
      TabOrder = 0
      OnClick = btnAddOrderClick
    end
  end
  object MainMenu1: TMainMenu
    Left = 88
    Top = 89
    object N1: TMenuItem
      Caption = #1048#1089#1087#1086#1083#1085#1103#1077#1084#1099#1077
    end
    object N2: TMenuItem
      Caption = #1048#1089#1087#1086#1083#1085#1077#1085#1085#1099#1077
    end
    object N3: TMenuItem
      Caption = #1054#1090#1084#1077#1085#1077#1085#1085#1099#1077
    end
  end
end
