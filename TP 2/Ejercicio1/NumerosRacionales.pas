unit NumerosRacionales;

interface

Uses
  SysUtils, Math;

Type
  NumerosR = Object
    private
      Numerador: Integer;
      Denominador: Integer;
      procedure Simplificar();
    public
      function Crear(N: Integer; D: Integer): Boolean;
      function ToString(): String;
      function Suma(N2: NumerosR): NumerosR;
      function Resta(N2: NumerosR): NumerosR;
      function Multiplicar(N2: NumerosR): NumerosR;
      function Se_puede_dividir(N2: NumerosR): NumerosR;
      function Dividir(N2: NumerosR): NumerosR;
      function Potencia(N2: NumerosR): NumerosR;
  End;

implementation


procedure NumerosR.Simplificar();
begin

end;


function NumerosR.Crear(N: Integer; D: Integer): Boolean;
begin
  Crear := True;
  Numerador := N;
  Denominador := D;
  if D = 0 then
  begin
    Crear := False
  end;
end;

function NumerosR.ToString(): String;
begin
  ToString := Numerador.ToString + '/' + Denominador.ToString;
end;

function NumerosR.Suma(N2: NumerosR): NumerosR;
begin
  Suma.Numerador := Numerador*N2.Denominador + Denominador*N2.Numerador;
  Suma.Denominador := Denominador * N2.Denominador;
  Suma.Simplificar;
end;

function NumerosR.Resta(N1: Double; N2: Double): Double;
var s: Double;
begin
  s := N1 - N2;
  Resta := s;
end;

function NumerosR.Multiplicar(N1: Double; N2: Double): Double;
var s: Double;
begin
  s := N1 * N2;
  Multiplicar := s;
end;

function NumerosR.Se_puede_dividir(N2: Double): Boolean;
var Valor: Boolean;
begin
  if N2 <> 0 then
  begin
    Valor := True;
  end
  else
  begin
    Valor := False;
  end;
  Se_puede_dividir := Valor
end;

function NumerosR.Dividir(N1: Double; N2: Double): Double;
var s: Double;
begin
  if N2 <> 0 then
  begin
    s := N1 / N2;
    Dividir := s;
  end

end;

function NumerosR.Potencia(N1: Extended; N2: Extended): Extended;
var s: Extended;
  i: Integer;
begin
  // Power: Funcion de delphi para enviar dos parametros y me devuelve la potencia
  s := Power(N1, N2);
  Potencia := s;
end;

end.
