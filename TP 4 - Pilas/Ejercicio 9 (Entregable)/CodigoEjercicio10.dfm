object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Ejercicio 10'
  ClientHeight = 193
  ClientWidth = 283
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 13
  object Label1: TLabel
    Left = 58
    Top = 13
    Width = 36
    Height = 13
    Caption = 'Decimal'
  end
  object Label2: TLabel
    Left = 65
    Top = 39
    Width = 23
    Height = 13
    Caption = 'Base'
  end
  object Edit1: TEdit
    Left = 105
    Top = 8
    Width = 121
    Height = 21
    TabOrder = 0
    Text = '569'
  end
  object Edit2: TEdit
    Left = 105
    Top = 35
    Width = 121
    Height = 21
    TabOrder = 1
    Text = '4'
  end
  object Memo1: TMemo
    Left = 8
    Top = 93
    Width = 267
    Height = 89
    Lines.Strings = (
      'Memo1')
    ScrollBars = ssBoth
    TabOrder = 2
  end
  object Button1: TButton
    Left = 96
    Top = 62
    Width = 97
    Height = 25
    Caption = 'Generar'
    TabOrder = 3
    OnClick = Button1Click
  end
end
