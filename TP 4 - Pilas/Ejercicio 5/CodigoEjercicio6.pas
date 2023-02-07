unit CodigoEjercicio6;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Tipos, TADEjercicio6;

const
  Tama�o = 4;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button4: TButton;
    Memo1: TMemo;
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Edit2: TEdit;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
    P: MiPila;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

{

Ejercicio 5
Dada una pila con valores al azar realizar una operaci�n que permite
insertar un �tem en una determinada posici�n ordinal.
El proceso recibe la Pila, el dato a insertar y la posici�n ordinal y
retorna la nueva pila.

Determinar la complejidad algor�tmica de la soluci�n.

Ejemplo: si P contiene (A, B, C, D, F) y el �tem a insertar es
E en la posici�n 5 entonces la pila resultante ser�a (A, B, C, D, E, F).

}

//Boton que carga la pila
procedure TForm1.Button1Click(Sender: TObject);
begin
  P.cargarPilaAleatoria(Tama�o);
  memo1.Lines.Add('Pila cargada');
end;

//Boton que inserta el elemento dentro de la pila
procedure TForm1.Button2Click(Sender: TObject);
begin
  P.Insertar(Strtoint(Edit1.Text),Strtoint(Edit2.Text));
  memo1.Lines.Add('Elemento insertado');
end;

//Boton que muestra la pila
procedure TForm1.Button4Click(Sender: TObject);
begin
  memo1.Lines.Add(P.mostrarPila);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  MEMO1.Clear;
end;

end.
