unit Unidad_Vector;

interface

Uses
  SysUtils, Math;

const
  Min = 1;
  Max = 10000;

type
  Vector = Object
    private
      Arreglo : Array of LongInt;
      Tama?o : LongInt;
    public
      Procedure Determinar_Tama?o (Valor: Integer);
      Procedure CargarAleatorio(Desde, Hasta: Integer);
      //Function Sumatoria();
      //Function MaximoValor();
      //Function MinimoValor();
      //Function Promedio();
  End;

implementation

Procedure Vector.Determinar_Tama?o (Valor: Integer);
begin
  if (Valor >= Min) and (Valor <= Max) then
  begin
    Tama?o := Valor;
  end;

end;

Procedure Vector.CargarAleatorio(Desde, Hasta: Integer);
var i: Integer;
begin
  Randomize;
  for i := Min to Tama?o do
  begin
    Arreglo[i] := Desde + Random(Hasta - Desde);
  end;
end;

end.
