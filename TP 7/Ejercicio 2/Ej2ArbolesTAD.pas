unit Ej2ArbolesTAD;

interface

uses
  ArbolesBinarios, Tipos;

const
  tipoClave = Numero;
  cantElemArbol = 5;

type
  Ej2 = Object
  private
    A : Arbol;
  public
    procedure crearArbol(aTClave:tipoDatosClave;aCant:integer);
    procedure cargarArbol();
    function mostrarInOrden() : string;
    function mostrarPreOrden() : string;
    function mostrarPostOrden() : string;
    function mostrarAnchura() : string;
    function indicarPadre(aC: variant) : variant;
    function listarHijos(aC: variant) : string;
    function listarHermanos(aC: variant) : string;
    function Nivel(aC:variant) : variant;
    function Altura() : integer;
    function nodosMismoNivel(aC:variant) : string;
    function getHermano(aC: variant) : posicionArbol;
  End;

implementation

//Para un nodo del ?rbol binario determinado:
//
//    Indicar el nombre del nodo padre.
//    Listar los hijos.
//    Listar los hermanos.

//    Calcular el nivel en el que se encuentra.
//    Calcular la altura de su rama (Altura del Sub?rbol).
//    Listar todos los nodos que est?n en el mismo nivel.

function Ej2.getHermano(aC: variant) : posicionArbol;
var Hermano: posicionArbol;
    X:tipoElemento;
    Padre:posicionArbol;
begin
  X.Clave := aC;
  if A.BuscarPreOrden(X) <> A.Root then begin
    Padre := A.Padre(A.BuscarPreOrden(X));
    if A.HijoIzquierdo(Padre).Datos.Clave = aC then begin
      if A.HijoDerecho(Padre) <> Nulo then Hermano := A.HijoDerecho(Padre);
    end
    else if A.HijoIzquierdo(Padre) <> Nulo then Hermano := A.HijoIzquierdo(Padre);
  end;
  Result := Hermano;
end;

function Ej2.nodosMismoNivel(aC: Variant) : string;
var X:tipoElemento;
    Nodo: posicionArbol;
    Nivel: integer;
    Nodos: string;
begin
  Nodos := '';
  X.Clave := aC;
  Nivel := A.Nivel(A.BuscarPreOrden(X));
  Nodo := A.Root;
  while not A.RamaNula(Nodo) do begin
    if A.Nivel(Nodo) = Nivel then begin
      Nodos := Nodos + A.Recuperar(Nodo).Clave + ' | ';
      if getHermano(aC) <> Nulo then Nodos := Nodos + getHermano(aC).Datos.Clave + ' | ';
    end
    else if A.HijoIzquierdo(Nodo) <> Nulo then Nodo := A.HijoIzquierdo(Nodo)
    else if A.HijoDerecho(Nodo) <> Nulo then Nodo := A.HijoDerecho(Nodo)
    else A.Padre(Nodo)

  end;
end;

function Ej2.Altura() : integer;
begin
  A.Altura;
end;

function Ej2.Nivel(aC: Variant) : variant;
var X:tipoElemento;
begin
  X.Clave := aC;
  Result := A.Nivel(A.BuscarPreOrden(X));
end;

function Ej2.listarHermanos(aC: Variant) : string;
var Hermano:string;
begin
  Result := getHermano(aC).Datos.Clave;
end;


function Ej2.listarHijos(aC: Variant) : string;
var Hijos:string;
    X:tipoElemento;
begin
  X.Clave := aC;
  if A.HijoIzquierdo(A.BuscarPreOrden(X)) <> Nulo then Hijos := 'Hijo izquierdo: ' + A.HijoIzquierdo(A.BuscarPreOrden(X)).Datos.Clave;
  if A.HijoDerecho(A.BuscarPreOrden(X)) <> Nulo then Hijos := Hijos + ' | Hijo derecho: ' + A.HijoDerecho(A.BuscarPreOrden(X)).Datos.Clave;
  Result := Hijos;
end;

function Ej2.indicarPadre(aC: variant) : variant;
var Padre:variant;
    X:tipoElemento;
begin
  X.Clave := aC;
  if A.Padre(A.BuscarPreOrden(X)) <> Nulo then Padre := A.Padre(A.BuscarPreOrden(X)).Datos.Clave;
  Result := Padre;
end;

procedure Ej2.crearArbol(aTClave:tipoDatosClave;aCant:integer);
begin
  A.Crear(aTClave,aCant);
end;

procedure Ej2.cargarArbol();
begin
  A.CargarArbol;
end;

function Ej2.mostrarInOrden() : string;
begin
  Result := A.InOrden;
end;

function Ej2.mostrarPreOrden() : string;
begin
  Result := A.PreOrden;
end;

function Ej2.mostrarPostOrden;
begin
  Result := A.PostOrden;
end;

function Ej2.mostrarAnchura : string;

begin
  Result := A.Anchura;
end;



end.
