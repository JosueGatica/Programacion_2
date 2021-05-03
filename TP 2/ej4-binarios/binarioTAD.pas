unit binarioTAD;

interface

uses
  SysUtils, Math;

type
  Binario = Object
  private
    nroBinario: String;
  public
    function Crear(nro: string) : boolean;
    function sumar(nro: string) : string;
    function toStr(nro: integer) : string;
    {function restar(nro) : string;
    function convertirADecimal(nro) : string;
    function andLogico(nro) : string;
    function orLogico(nro) : string;
    function xorLogico(nro) : string;}
  End;

implementation

function Binario.toStr(nro: integer) : string;
begin
  toStr := nro.ToString;
end;

function Binario.Crear(nro: string) : boolean;
var I: Integer;
begin
  nroBinario := nro;
  Result := True;
  for I := 1 to Length(nro) do begin
    if (nro[I] <> '0') or (nro[I] <> '1') then begin
      Result := False;
    end;
  end;
end;

function masLargo(nro1, nro2: string) : string;
begin
  masLargo := 'Igual longitud';
  if Length(nro1) > Length(nro2) then begin
    masLargo := nro1;
  end
  else if Length(nro1) < Length(nro2) then begin
    masLargo := nro2;
  end;
end;

function Binario.sumar(nro: string) : string;
var I: Integer;
    suma, carry, larger: String;
begin
  //llamo a la funci�n para chequear longitud (para poder recorrer parejo con los indices)
  larger := masLargo(nroBinario, nro);

  // inicializo las var suma y carry con ceros
  //el primer lugar de suma se reserva por si queda carry
  for I := 1 to Length(larger) + 1 do begin
    suma := suma + '0';
    carry := carry + '0';
  end;

  //si uno num es mas largo que otro voy sumando como si el mas chico tuviera ceros
  if larger <> 'Igual longitud' then begin
    for I := Length(nroBinario) downto Length(nro) do begin
      suma[I+1] := nroBinario[I];
    end;
  end;

  //hago la suma arrancando desde atras
  for I := Length(nro) downto 1 do begin
  //si es 1 y 1 el carry va a ser 1, si ya hab�a carry la suma va a ser 1, sino la suma ser� 0
    if (nroBinario[I] = '1') and (nro[I] = '1') then begin
      carry[I+1] := '1';
      if carry[I-1] = '1' then begin
        suma[I+1] := '1';
      end
      else begin
        suma[I+1] := '0';
      end;
    end
  //si son diferentes, depende del carry, si hab�a un 1, suma ser� 0, si hab�a un 0, suma ser� 1
    else if ((nroBinario[I] = '1') and (nro[I] = '0')) or ((nroBinario[I] = '0') and (nro[I] = '1')) then begin
      if carry[I-1] = '1' then begin
        suma[I+1] := '0';
        carry[I+1] := '1';
      end
      else begin
        suma[I+1] := '1';
      end;
    end
    //si son 0 y 0
    else begin
      if carry[I-1] = '1' then begin
        suma[I+1] := '1';
      end
      else begin
        suma[I+1] := '0';
      end;
    end;
  end;
  //termina el for y si quedo carry tengo que agregar un 1 al principio de suma
  if carry[I] = '1' then begin
    suma[I] := '1';
  end;

end;


end.