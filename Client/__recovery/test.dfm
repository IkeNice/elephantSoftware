object fmTest: TfmTest
  Left = 0
  Top = 0
  Caption = 'fmTest'
  ClientHeight = 426
  ClientWidth = 726
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 369
    Height = 426
    Align = alLeft
    Caption = 'Panel1'
    DockSite = True
    TabOrder = 0
    OnDragDrop = Panel2DragDrop
    OnDragOver = Panel2DragOver
    OnResize = Panel1Resize
    object Label1: TLabel
      Left = 72
      Top = 264
      Width = 31
      Height = 13
      Caption = 'Label1'
      Color = clBtnText
      ParentColor = False
    end
    object Button1: TButton
      Left = 127
      Top = 366
      Width = 75
      Height = 25
      Caption = 'Button1'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Edit2: TEdit
      Left = 0
      Top = 368
      Width = 121
      Height = 21
      TabOrder = 1
      Text = 'Edit2'
    end
    object ComboBox1: TComboBox
      Left = 24
      Top = 16
      Width = 145
      Height = 21
      TabOrder = 2
      Text = 'ComboBox1'
    end
    object DBComboBox1: TDBComboBox
      Left = 24
      Top = 128
      Width = 145
      Height = 21
      TabOrder = 3
    end
    object DateTimePicker1: TDateTimePicker
      Left = 104
      Top = 304
      Width = 65
      Height = 21
      Date = 43823.000000000000000000
      Format = 'HH:mm'
      Time = 0.415389247682469400
      Kind = dtkTime
      TabOrder = 4
    end
    object TimePicker1: TTimePicker
      Left = 192
      Top = 256
      Width = 97
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      TabOrder = 5
      Time = 43823.531101574070000000
      TimeFormat = 'h:mm'
    end
  end
  object Panel2: TPanel
    Left = 369
    Top = 0
    Width = 357
    Height = 426
    Align = alClient
    Caption = 'Panel2'
    DockSite = True
    TabOrder = 1
    OnDragDrop = Panel2DragDrop
    OnDragOver = Panel2DragOver
    object ScrollBox1: TScrollBox
      Left = 1
      Top = 1
      Width = 355
      Height = 424
      Align = alClient
      TabOrder = 0
      OnDragDrop = Panel2DragDrop
      OnDragOver = Panel2DragOver
      OnMouseWheelDown = ScrollBox1MouseWheelDown
      OnMouseWheelUp = ScrollBox1MouseWheelUp
      object Panel3: TPanel
        Left = 23
        Top = 336
        Width = 185
        Height = 41
        Caption = 'Panel3'
        TabOrder = 0
        OnMouseDown = Panel3MouseDown
      end
    end
  end
end
