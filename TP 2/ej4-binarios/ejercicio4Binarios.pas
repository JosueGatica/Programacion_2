unit ejercicio4Binarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, binarioTAD;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    binario1: TEdit;
    binario2: TEdit;
    btnSuma: TButton;
    Label1: TLabel;
    Label2: TLabel;
    procedure btnSumaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

//procedure intEditaStr();
//begin
//  String.Parse(binario1.Text);
//  String.Parse(binario2.Text);
//end;


procedure TForm1.btnSumaClick(Sender: TObject);

var nro1, nro2, suma: Binario;

begin
  Memo1.Clear;
  if nro1.Crear(binario1.Text) and nro2.Crear(binario2.Text) then begin
//    nro1 := String.Parse(nro1);
//    nro2 := String.Parse(nro2);
    suma := nro1.sumar(nro2.toStr());
    memo1.Lines.Add('La suma es igual a ' + suma);
  end;

end;

end.