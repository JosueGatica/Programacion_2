unit Ejercicio6;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Tipos, TADEjercicio6, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Memo1: TMemo;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  AB: Ej6;

implementation

{$R *.dfm}
{
  Ejercicio 6
  Determinar si un �rbol binario cargado puede ser un �rbol de expresi�n.

  Ver en la bibliograf�a o PDF de la asignatura qu� es un �rbol de expresi�n.
  Tambi�n pueden consultarse m�s detalles en el siguiente enlace.

  Caracter�sticas de un �rbol de expresi�n:

  La ra�z siempre debe ser un operador.
  La ra�z de todo sub�rbol siempre es un operador.
  Las hojas siempre deben ser operandos.
  Los nodos internos deben estar etiquetados por operadores.
  Si un operador tiene mayor prioridad que el que est� almacenado en un nodo, se coloca como hijo del mismo.
  Si un operador tiene igual o menor prioridad que el que est� en un nodo, se coloca como padre de �ste.
  Una expresi�n entre par�ntesis tiene mayor prioridad que cualquier otra.
  Un nodo puede contener como hijo un sub�rbol que contiene una peque�a expresi�n.
  Los par�ntesis no se representan porque no son necesarios.
}

// Boton que carga el arbol binario
procedure TForm1.Button1Click(Sender: TObject);
begin
  AB.crearArbol(tipoClave, cantElemArbol);
  AB.cargarArbol;
end;

// Boton que muestra en arbol, como todos sus recorridos
procedure TForm1.Button2Click(Sender: TObject);
begin
  Memo1.Lines.Add('Recorrido en profundidad: ');
  Memo1.Lines.Add('Pre orden: ');
  Memo1.Lines.Add(AB.mostrarPreOrden);
  Memo1.Lines.Add('In orden: ');
  Memo1.Lines.Add(AB.mostrarInOrden);
  Memo1.Lines.Add('Post orden: ');
  Memo1.Lines.Add(AB.mostrarPostOrden);
  Memo1.Lines.Add('Recorrido en anchura: ');
  Memo1.Lines.Add(AB.mostrarAnchura);
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  if AB.esArbolDeExpresion then
  begin
    Memo1.Lines.Add('Es arbol de expresion!');
  end
  else
  begin
    Memo1.Lines.Add('No es arbol de expresion');
  end;
end;

end.
