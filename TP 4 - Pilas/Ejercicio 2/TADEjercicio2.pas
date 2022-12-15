unit TADEjercicio2;

interface

uses
  Tipos,
  //StackArray;
  //StackCursor;
  StackPointer;

type
  Ejercicio2 = Object
    private
      P: Pila;
    public
      procedure Definir_Tama�o_Pila(Tama�o: Integer);
      Function Mostrar_Pila(): String;
      procedure Cargar_Pila_Aleatoria(Tama�o: Integer);
      procedure Apilar_Pila_Origen(P1,P2: Ejercicio2;Auxiliar: Pila);
      procedure Cargar_Iguales(var P1, P2: Ejercicio2;Tama�o: Integer);
      function Son_Iguales(P1,P2: Ejercicio2): Boolean;
  End;

implementation

procedure Ejercicio2.Definir_Tama�o_Pila(Tama�o: Integer);
begin
  P.Crear(Numero,Tama�o);
end;

function Ejercicio2.Mostrar_Pila;
begin
  Mostrar_Pila := P.RetornarClaves;
end;

procedure Ejercicio2.Apilar_Pila_Origen(P1,P2: Ejercicio2;Auxiliar: Pila);
var X: TipoElemento;
begin
  while not Auxiliar.EsVacia do
  begin
    X := Auxiliar.Recuperar;
    Auxiliar.DesApilar;
    P1.P.Apilar(X);
    P2.P.Apilar(X);
  end;
end;

procedure Ejercicio2.Cargar_Pila_Aleatoria(Tama�o: Integer);
begin
  P.LlenarClavesRandom(Tama�o, 1, 10);
end;

procedure Ejercicio2.Cargar_Iguales(var P1, P2: Ejercicio2; Tama�o: Integer);
var Contenedor: Integer;
  X: TipoElemento;
  I: Integer;
begin
  P1.P.Crear(Numero,Tama�o);
  P2.P.Crear(Numero,Tama�o);
  X.TipoDatoClave(Numero);
  Randomize;
  for I := 1 to P1.P.SizeStack do
  begin
    Contenedor := Random(10);
    X.Clave := Contenedor;
    P1.P.Apilar(X);
    P2.P.Apilar(X);
  end;
end;


//Complejida algoritmica lineal:
//.Creo la pila auxiliar
//.Recupero los valores del top
//.Comparo si son iguales
//.Si lo son, desapilo ambas y apilo en el auxiliar
//.Si no lo son, directamente devuelvo falso
//.Al final, dejo ambas pilas como estaban
function Ejercicio2.Son_Iguales(P1,P2: Ejercicio2): Boolean;
var PAuxiliar: Pila;
  Iguales: Boolean;
  X: TipoElemento;
  Y: TipoElemento;
begin
  Iguales := True;
  PAuxiliar.Crear(Numero,P1.P.SizeStack);
  while ( not P1.P.EsVacia or not P2.P.EsVacia) and (Iguales) do
  begin
    X := P1.P.Recuperar;
    Y := P2.P.Recuperar;
    if X.Clave <> Y.Clave then
    begin
      Iguales := False;
    end
    else
    begin
      P1.P.DesApilar;
      P2.P.DesApilar;
      PAuxiliar.Apilar(X);
    end;
  end;
  Apilar_Pila_Origen(P1,P2,PAuxiliar);
  Result := Iguales;
end;

end.
