object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Ejercicio 4'
  ClientHeight = 268
  ClientWidth = 451
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
    Left = 0
    Top = 0
    Width = 451
    Height = 33
    Align = alTop
    Alignment = taCenter
    Caption = 'Cuadrado Latino'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ExplicitWidth = 194
  end
  object Label2: TLabel
    Left = 8
    Top = 77
    Width = 146
    Height = 21
    Alignment = taCenter
    Caption = 'Determinar Tama'#241'o (Max. 10)'
  end
  object Memo1: TMemo
    Left = 160
    Top = 40
    Width = 283
    Height = 220
    Lines.Strings = (
      'Memo1')
    ScrollBars = ssBoth
    TabOrder = 0
  end
  object Edit1: TEdit
    Left = 16
    Top = 104
    Width = 121
    Height = 21
    Alignment = taCenter
    TabOrder = 1
    Text = 'Tama'#241'o'
  end
  object Button1: TButton
    Left = 40
    Top = 144
    Width = 75
    Height = 25
    Caption = 'Generar'
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 40
    Top = 192
    Width = 75
    Height = 25
    Caption = 'Mostrar'
    TabOrder = 3
    OnClick = Button2Click
  end
end
