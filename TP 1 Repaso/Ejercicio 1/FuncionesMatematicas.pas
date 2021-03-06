unit FuncionesMatematicas;

interface

Const
  Min = 1;
  Max = 10;

type
  Vector = array[Min..Max] of integer;
  function Media(aV: Vector): Double;
  function Ordenar(var aV: Vector): Double;
  function Mediana(var aV: Vector): Double;
  function Moda(var aV: Vector; bV: Vector): Double;

implementation

function Media(aV: Vector): Double;
Var Suma, i: Integer;
begin
  for i := Min to Max do begin
    Suma := Suma + aV[i];
  end;
  Media := Suma / (Max - Min + 1);
end;

function Ordenar(var aV: Vector): Double;
var i,Tama?o, Swap : Integer;
  Intercambio : Boolean;
begin
  Tama?o := Max - 1;
  Intercambio := True;
  while Intercambio do
  begin
    Intercambio := False;
    for i := Min to Tama?o do
    begin
      if aV[i] > aV[i + 1] then
      begin
        Intercambio := True;
        Swap := aV[i];
        aV[i] := aV[i + 1];
        aV[i + 1] := Swap;
      end;
    end;
  end;
end;

function Mediana(var aV: Vector): Double;
var j : Integer;
begin
  j := (Max - Min + 1) Div 2;
  Mediana := aV[j];
end;

function Moda(var aV: Vector; bV: Vector): Double;
var i,j,x, Mayor : Integer;
begin
  Ordenar(aV);
  for i := Min to Max do
  begin
    for j := Min to Max do begin
      if aV[i] = j then
      begin
        bV[j] := bV[j] + 1;
      end;
    end;
  end;
  Mayor := 0;
  for x := Min to Max - 1 do
  begin
    if Mayor < bV[x + 1] then
    begin
      Mayor := x + 1
    end;
  end;
  Moda := Mayor
end;
end.
