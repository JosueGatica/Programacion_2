unit Ej3ArbolesTAD;

interface

uses
  ArbolesBinarios,Tipos,ListArray;

const
  tipoClave = Cadena;
  cantElemArbol = 5;

type
  Ej3 = Object
  private
    A : Arbol;
  public
    function recorridoAnchura(aAN:arbol) : Lista;
    function pasarNArioABinario(var aAN:arbol) : Arbol;
    procedure crearArbol(aTClave:tipoDatosClave;aCant:integer);
    procedure cargarArbol();
    function mostrarInOrden() : string;

  End;

implementation


//Dado un �rbol n-ario, devolver en forma de lista el resultado del recorrido
// en anchura del �rbol.
//Escribir una funci�n que, dado un �rbol n-ario, devuelva el n�mero de hojas de
// dicho �rbol.
//Escribir una funci�n booleana que dados dos �rboles generales determine si
// tienen la misma estructura, sin importar los datos del mismo (�rbol similar).

function Ej3.pasarNArioABinario(var aAN:arbol) : Arbol;
var arbolB: arbol;
begin
  aAN.Root := arbolB.Root;
  aAN.Root.HI
end;

function Ej3.recorridoAnchura(aAN:arbol) : Lista;
begin
  aAN.Root;
end;

procedure Ej3.crearArbol(aTClave:tipoDatosClave;aCant:integer);
begin
  A.Crear(aTClave,aCant);
end;

procedure Ej3.cargarArbol();
begin
  A.CargarArbol;
end;

function Ej3.mostrarInOrden() : string;
begin
  Result := A.InOrden;
end;

end.
