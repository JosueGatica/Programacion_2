unit TADEjercicio5Lista;

interface

uses
  Tipos,
  //ListArray;
  //ListPointer;
  ListCursor;

type
  Ejercicio5Lista = Object
    private
      L: Lista;
    public
      function Mostrar_Lista(): String;
      procedure Crear(Tipo_Clave: Variant;Tama�o: Integer);
  End;

implementation

function Ejercicio5Lista.Mostrar_Lista;
begin
  Mostrar_Lista := L.RetornarClaves;
end;

procedure Ejercicio5Lista.Crear(Tipo_Clave: Variant;Tama�o: Integer);
begin
  L.Crear(Tipo_Clave,Tama�o);
end;

end.
