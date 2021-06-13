unit TADEjercicio4;

interface

uses
  Tipos,
  //StackArray;
  //StackCursor;
  StackPointer;

type
  Ejercicio4 = Object
    private
      P: Pila;
    public
      procedure Definir_Tama�o_Pila(Tama�o: Integer);
      Function Mostrar_Pila(): String;
      procedure Cargar_Pila_Aleatoria(Tama�o: Integer);
      procedure Apilar_Pila_Origen(Auxiliar: Pila);
      function Invertir(): Ejercicio4;
  End;

implementation

procedure Ejercicio4.Definir_Tama�o_Pila(Tama�o: Integer);
begin
  P.Crear(Numero,Tama�o);
end;

function Ejercicio4.Mostrar_Pila;
begin
  Mostrar_Pila := P.RetornarClaves;
end;

procedure Ejercicio4.Apilar_Pila_Origen(Auxiliar: Pila);
var X: TipoElemento;
begin
  while not Auxiliar.EsVacia do
  begin
    X := Auxiliar.Recuperar;
    Auxiliar.DesApilar;
    P.Apilar(X);
  end;
end;

procedure Ejercicio4.Cargar_Pila_Aleatoria(Tama�o: Integer);
begin
  P.LlenarClavesRandom(Tama�o, 1, 10);
end;

//Complejidad algoritimica: Lineal
//.Crear dos pilas auxiliares
//.Mientras no tenga vacia la pila origen:
//  .Recuperar el valor de la pila origen
//  .Desapilar el tope de la pila origen
//  .Apilar ese valor en ambas pilas auxiliares
//.Uso una de las pilas auxiliares para volver a recuperar la original
//.Devuelvo con resultado la pila auxiliar restante
function Ejercicio4.Invertir(): Ejercicio4;
var PilaAuxiliar1, PilaAuxiliar2: Ejercicio4;
  X: TipoElemento;
begin
  PilaAuxiliar1.P.Crear(P.DatoDeLaClave,P.SizeStack);
  PilaAuxiliar2.P.Crear(P.DatoDeLaClave,P.SizeStack);
  while not P.EsVacia do
  begin
    X := P.Recuperar;
    P.DesApilar;
    PilaAuxiliar1.P.Apilar(X);
    PilaAuxiliar2.P.Apilar(X);
  end;
  Apilar_Pila_Origen(PilaAuxiliar1.P);
  Result := PilaAuxiliar2;
end;

end.
