unit TADEjercicio5Pila;


interface

uses
  Tipos,
  //StackArray;
  //StackCursor;
  StackPointer;

type
  Ejercicio5Pila = Object
    private
      P: Pila;
    public
      procedure Definir_Tama�o_Pila(Tama�o: Integer);
      Function Mostrar_Pila(): String;
      procedure Cargar_Pila_Aleatoria(Tama�o: Integer);
      procedure Apilar_Pila_Origen(Auxiliar: Pila);
  End;

implementation

procedure Ejercicio5Pila.Definir_Tama�o_Pila(Tama�o: Integer);
begin
  P.Crear(Numero,Tama�o);
end;

function Ejercicio5Pila.Mostrar_Pila;
begin
  Mostrar_Pila := P.RetornarClaves;
end;

procedure Ejercicio5Pila.Apilar_Pila_Origen(Auxiliar: Pila);
var X: TipoElemento;
begin
  while not Auxiliar.EsVacia do
  begin
    X := Auxiliar.Recuperar;
    Auxiliar.DesApilar;
    P.Apilar(X);
  end;
end;

procedure Ejercicio5Pila.Cargar_Pila_Aleatoria(Tama�o: Integer);
begin
  P.LlenarClavesRandom(Tama�o, 1, 10);
end;

end.
