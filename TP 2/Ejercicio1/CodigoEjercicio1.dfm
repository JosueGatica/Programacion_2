object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Ejercicio 1'
  ClientHeight = 204
  ClientWidth = 568
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 32
    Top = 53
    Width = 61
    Height = 16
    Caption = 'Numero 1:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 32
    Top = 117
    Width = 61
    Height = 16
    Caption = 'Numero 2:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Button1: TButton
    Left = 8
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Sumar'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 104
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Restar'
    TabOrder = 1
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 200
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Multiplicar'
    TabOrder = 2
    OnClick = Button3Click
  end
  object Memo1: TMemo
    Left = 185
    Top = 39
    Width = 365
    Height = 157
    Color = clInfoBk
    Lines.Strings = (
      'Memo1')
    ParentShowHint = False
    ScrollBars = ssBoth
    ShowHint = False
    TabOrder = 3
  end
  object Button4: TButton
    Left = 296
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Dividir'
    TabOrder = 4
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 392
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Potencia'
    TabOrder = 5
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 488
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Comparacion'
    TabOrder = 6
  end
  object Edit1: TEdit
    Left = 32
    Top = 75
    Width = 121
    Height = 21
    TabOrder = 7
    Text = '1'
  end
  object Edit2: TEdit
    Left = 32
    Top = 139
    Width = 121
    Height = 21
    TabOrder = 8
    Text = '1'
  end
end
