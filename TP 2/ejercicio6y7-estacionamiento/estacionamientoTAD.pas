unit estacionamientoTAD;

interface

const
  tarifaHora = 50;
  mediaEstadia = 350;
  estadiaCompleta = 800;
  min = 1;
  max = 50;
  Error = -1;
  largoPatente = 7;
  largoHorario = 5;

type
  Auto = Record
    patente: string;
    //horarioEntrada: integer;
    //horarioSalida: integer;
    horarioEntrada: String;
    horarioSalida: String;
    estacionado: boolean;
  End;

  Estacionamiento = Object
    private
      Autos: Array[min..max] of Auto;

    public
      function conseguirLugar() : integer;
      procedure cargarEstacionamiento();
      function validarPatente(patente: string) : boolean;
      function guardarAuto(patente, entrada, salida: string; lugar: integer) : Auto;
      function buscarPatente(patente: string) : integer;
      function buscarPatenteRepetida(patente: string) : boolean;
      procedure sacarAuto(posicion: integer);
      //      function calcularPago() : String;
End;

implementation

//VALIDAR
function Estacionamiento.validarPatente(patente: string) : boolean;
var I: integer;
    bool: boolean;
begin
  //V := Parsing(patente,' ');
//  patente.Split
  bool := True;
  I := 1;
  if Length(patente) <> largoPatente then
  begin
    bool := False;
  end;
  while (bool) and (I < largoPatente) do
  begin
    if ((I >= 1) and (I <= 2)) or ((I >= 6) and (I <= 7)) then
    begin
      if ((Ord(patente[I]) < Ord('a')) and (Ord(patente[I]) > Ord('z'))) or ((Ord(patente[I]) < Ord('A')) and (Ord(patente[I]) > Ord('Z'))) then
        begin
          bool := False;
        end;
    end
    else
    begin
      if (Ord(patente[I]) < Ord('0')) or (Ord(patente[I]) > Ord('9')) then
      begin
        bool := False;
      end;
    end;
    I := I + 1;
  end;
  Result := bool;
end;

//-------------------------------------------------

//cargo el campo "estacionado" de todos los elementos del vector con False (para indicar que est�n libres para estacionar)
procedure Estacionamiento.cargarEstacionamiento();
var I: integer;
begin
  for I := min to max do begin
    Autos[I].estacionado := False;
  end;
end;

//devuelve el lugar que est� libre sino devuelve -1
function Estacionamiento.conseguirLugar() : integer;
var I: integer;
begin
  I := Min;

  while (Autos[I].estacionado = True) and (I <= max) do begin
    I := I + 1;
  end;

  if I > max then begin
    Result := Error;
  end
  else begin
    Result := I;
  end;

end;

//RETIRAR

//guarda en el vector los datos del auto que va a estacionar en el lugar indicado
function Estacionamiento.guardarAuto(patente, entrada, salida: string; lugar: integer) : Auto;
begin
  Autos[lugar].estacionado := True;
  Autos[lugar].patente := patente;
  Autos[lugar].horarioEntrada := entrada;
  Autos[lugar].horarioSalida := salida;
  Result := Autos[lugar];
end;


function Estacionamiento.buscarPatente(patente: string) : integer;
var I: integer;
    posicion: integer;
    encontrado: boolean;
begin
  I := 1;
  encontrado := False;
  posicion := Error;

  while (not encontrado) and (I <= max) do
  begin
    if Autos[I].patente = patente then
    begin
      encontrado := True;
      posicion := I;
    end;
    I := I + 1;
  end;

  Result := posicion;
end;

procedure Estacionamiento.sacarAuto(posicion: integer);
begin
    //si encontr� la patente del auto lo "saca" del estacionamiento
  if posicion <> Error then
  begin
    Autos[posicion].estacionado := False;
    Autos[posicion].patente := '';
  end;
end;

function Estacionamiento.buscarPatenteRepetida(patente: string) : boolean;
var I: integer;
    posicion: integer;
    encontrado: boolean;
begin
  I := 1;
  encontrado := False;
  posicion := Error;

  while (not encontrado) and (I <= max) do
  begin
    if Autos[I].patente = patente then
    begin
      encontrado := True;
      posicion := I;
    end;
    I := I + 1;
  end;

  Result := encontrado;
end;

//function Estacionamiento.calcularPago() : String;
//var horas: integer;
//begin
//  if (Auto.horarioSalida - Auto.horarioEntrada) > 600 then begin
//    Result := estadiaCompleta;
//  end
//  else if ((Auto.horarioSalida - Auto.horarioEntrada) > 300)  and ((Auto.horarioSalida - Auto.horarioEntrada) < 600) then begin
//    Result := mediaEstadia;
//  end
//  else begin
//    horas := (Auto.horarioSalida - Auto.horarioEntrada);
//
//  end;
//
//
//end;

end.
