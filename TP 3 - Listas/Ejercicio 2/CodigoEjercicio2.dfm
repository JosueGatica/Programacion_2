object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Ejercicio 2'
  ClientHeight = 235
  ClientWidth = 422
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 13
  object Button1: TButton
    Left = 8
    Top = 8
    Width = 89
    Height = 50
    Caption = 'Cargar aleatorio ambas listas'
    TabOrder = 0
    WordWrap = True
    OnClick = Button1Click
  end
  object Memo1: TMemo
    Left = 112
    Top = 8
    Width = 302
    Height = 219
    Lines.Strings = (
      'Memo1')
    ScrollBars = ssBoth
    TabOrder = 1
  end
  object Button4: TButton
    Left = 8
    Top = 176
    Width = 89
    Height = 50
    Caption = 'Chequear si son divisibles'
    TabOrder = 2
    WordWrap = True
    OnClick = Button4Click
  end
  object Button2: TButton
    Left = 8
    Top = 120
    Width = 89
    Height = 50
    Caption = 'Mostrar contenido'
    TabOrder = 3
    WordWrap = True
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 8
    Top = 64
    Width = 89
    Height = 50
    Caption = 'Cargar con valores del ejemplo'
    TabOrder = 4
    WordWrap = True
    OnClick = Button3Click
  end
end
