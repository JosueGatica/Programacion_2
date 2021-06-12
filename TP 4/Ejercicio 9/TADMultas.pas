unit TADMultas;

interface

uses
  ListArray,
  //ListPointer, //con este tiene errores
  //ListCursor,
  Tipos;

const
  numError = -1;
  autoYaGuardado = -2;

type


  puntMulta = ^TMulta;

  TMulta = Record
    Estado : string;
    Importe : integer;
    Fecha : TDate;
  End;

  Vehiculo = Object
  Private
    L: Lista;

  Public
    function Sin_Deuda(): String;
    function Mayor_Deuda(): tipoElemento;
    function Mayor_Cant_Infracciones(): tipoElemento;
    function multaReciente ( Auto: String): tipoElemento;
    function multaAntigua (Auto: String): tipoElemento;
    function totalMultas (patente: String): tipoElemento;
    function buscarAuto(patent: string) : integer;
    function guardarAutoYMulta(fecha: TDate;posAuto: posicionLista;
     monto:integer;estado,patente:string;autoGuardado:boolean) : boolean;
    function Devolver_Lista(): Lista;
    procedure Inicializar(Tamanio: Integer);
    function mostrarLista() : string;
    function recorrerListaAutos(patente: string) : posicionLista;
    function listaVacia() : boolean;
  End;

var
  LM: Lista;

implementation
function Vehiculo.recorrerListaAutos(patente: string) : posicionLista;
var posAVer: integer;
    elemAuto: tipoElemento;
    posAuto: posicionLista;
    Encontrado: boolean;
begin
  posAVer := numError;
  Encontrado := False;
  posAuto := L.Comienzo;
  elemAuto := L.Recuperar(posAuto);

  while (posAuto < L.SizeList) and (not Encontrado) do begin
    if elemAuto.Clave = patente then begin
      Encontrado := True;
      posAVer := posAuto;
    end
    else begin
      posAuto := L.Siguiente(posAuto);
      elemAuto := L.Recuperar(posAuto);
    end;
  end;
  Result := posAVer;
end;

function Vehiculo.mostrarLista() : string;
var mostrar: string;
begin
  mostrar := L.RetornarClaves;
  Result := mostrar;
end;

//busca si el auto parametro esta guardado, devuelve pos o error
function Vehiculo.buscarAuto(patent: string) : integer;
var Encontrado: boolean;
    posElem: posicionLista;
    Elem: tipoElemento;
    posAuto: integer;
begin
  Encontrado := False;
  posElem := L.Comienzo;
  Elem := L.Recuperar(posElem);
  posAuto := numError;
  //si la patente pasada es igual a la patente guardada devuelve la pos
  while (posElem < L.Fin) and (not Encontrado) and
  (not Elem.EsTEVacio) do begin
    if patent = Elem.Clave then begin
      Encontrado := True;
      posAuto := autoYaGuardado;
    end
    else begin
      posElem := L.Siguiente(posElem);
      Elem := L.Recuperar(posElem);
    end;
  end;
  if Elem.EsTEVacio then begin
    posAuto := L.Siguiente(posElem);
  end
  else if not Encontrado then begin
    posAuto := numError;
  end;
  Result := posAuto;
end;

function Vehiculo.guardarAutoYMulta(fecha: TDate;posAuto: posicionLista;
 monto:integer;estado,patente:string;autoGuardado:boolean) : boolean;
var
    posGuardarMulta: posicionLista;
    seGuardo: boolean;
    elemAuto,elemMulta: tipoElemento;
    pLM: ^Lista;
    punteroMulta: puntMulta;
begin
  if not autoGuardado then begin
    elemAuto := L.Recuperar(posAuto);
    elemAuto.Clave := patente;
  end;
  seGuardo := True;
  New(pLM);
  New(punteroMulta);

  punteroMulta.Fecha := fecha;
  punteroMulta.Importe := monto;
  punteroMulta.Estado := estado;
  elemMulta.Valor2 := punteroMulta;

  LM.Crear(Numero,L.SizeList);
  if LM.EsVacia then begin
    posGuardarMulta := 1;
  end
  else begin
    posGuardarMulta := LM.Buscar(elemMulta);
  end;
  if LM.EsLLena then begin
    seGuardo := False;
  end;

  elemMulta.Clave := posGuardarMulta;  //nro acta
  LM.Agregar(elemMulta);
  pLM^ := LM;
  elemAuto.Valor2 := pLM;

  L.Agregar(elemAuto);
  Dispose(pLM);
  Dispose(punteroMulta);
  Result := seGuardo;
end;

//Funcion que calcula el total de multas de un vehiculo
function Vehiculo.totalMultas (patente: String): tipoElemento;
var Valor2: Pointer;
    sumador, posAuto: integer;
    elemAuto, elemMulta, elemDevolver: tipoElemento;
    posMulta: posicionLista;
    lisMultas: ^Lista;
    datosMulta: puntMulta;

begin
  if L.EsVacia then begin
    posAuto := 1;
  end
  else begin
    posAuto := recorrerListaAutos(patente);
  end;
  elemDevolver.Inicializar(Cadena,0);
  if posAuto <> numError then begin
    elemAuto := L.Recuperar(posAuto);

    New(lisMultas);
    Valor2 := elemAuto.Valor2;
    lisMultas := Valor2;

    LM := lisMultas^;
    if not LM.EsVacia then begin

      posMulta := lisMultas.Comienzo;
    end
    else begin
      posMulta := 1;
    end;
      elemMulta := lisMultas.Recuperar(posMulta);
    while not elemMulta.EsTEVacio do begin
      sumador := sumador + 1;
      posMulta := lisMultas.Siguiente(posMulta);
      elemMulta := lisMultas.Recuperar(posMulta);
    end;

    elemDevolver.Clave := elemAuto.Clave;
    elemDevolver.Valor1 := sumador;
    Dispose(lisMultas);
  end;
  Result := elemDevolver;
end;

//Funcion que me devuelve aquel auto que no tenga deudas
function Vehiculo.Sin_Deuda(): String;
var posAuto, posMulta: PosicionLista;
    Auto,Multa: TipoElemento;
    lisMultas: ^Lista;
    datosMulta: puntMulta;
    menorDeudor: string;
    menosDeudas, Contador: integer;
begin
  posAuto := L.Comienzo;
  Auto := L.Recuperar(posAuto);
  menorDeudor := '';
  menosDeudas := 0;
  Contador := 0;
  New(lisMultas);
  New(datosMulta);
  //recorro para ver cual es el que mas deudas no pendiente tiene, y lo guardo en valor1
  //cuando termina con un auto pregunta si tiene mas deudas no pendiente que la var
  //'menosDeudas'
  while (posAuto <= L.Fin) do begin
    lisMultas := Auto.Valor2;
    posMulta := lisMultas.Comienzo();
    while (posMulta <= lisMultas.Fin) do begin
      Multa := lisMultas.Recuperar(posMulta);
      datosMulta := Multa.Valor2;
      Contador := 0;
      if datosMulta^.Estado <> 'Pendiente' then begin
        Contador := Contador + 1;
      end;
      posMulta := lisMultas.Siguiente(posMulta);
      Multa := lisMultas.Recuperar(posMulta);
    end;
    if Contador > menosDeudas then begin
        menosDeudas := Contador;
        menorDeudor := Auto.Clave;
    end;
    posAuto := L.Siguiente(posAuto);
    Auto := L.Recuperar(posAuto);
  end;
  Dispose(lisMultas);
  Dispose(datosMulta);
  Result := menorDeudor;
end;

//Funcion que devuelve el auto con la mayor deuda
function Vehiculo.Mayor_Deuda(): tipoElemento;
var impTotal, mayorDeuda: integer;
    mayorDeudor: string;
    P, M: PosicionLista;
    X1,X2, elemDevolver: TipoElemento;
    Puntero1: ^Lista;
    Puntero2: puntMulta;
begin
  //Inicializo para recorrer
  P := L.Comienzo;
  X1 := L.Recuperar(P);
  impTotal := 0;
  mayorDeuda := -1;
  New(Puntero1);
  New(Puntero2);
  //sumo las deudas si son 'pendiente' y comparo con mayorDeuda, me quedo con la patente
  while (P <= L.Fin) do begin
    Puntero1 := X1.Valor2;
    M := Puntero1.Comienzo;
    X2 := Puntero1.Recuperar(M);
    Puntero2 := X2.Valor2;
    impTotal := 0;
    while M <= Puntero1.Fin do begin
      if Puntero2.Estado = 'Pendiente' then begin
        impTotal := impTotal + Puntero2.Importe;
      end;
      if impTotal > mayorDeuda then begin
        mayorDeuda := impTotal;
        mayorDeudor := X1.Clave;
      end;
      M := Puntero1.Siguiente(M);
      X2 := Puntero1.Recuperar(M);
    end;
    P := L.Siguiente(P);
    X1 := L.Recuperar(P);
  end;

  elemDevolver.Clave := mayorDeudor;
  elemDevolver.Valor1 := mayorDeuda;
  Dispose(Puntero1);
  Dispose(Puntero2);
  Result := elemDevolver;
end;

//Funcion que devuelve el auto con mayor cantidad de infracciones
function Vehiculo.Mayor_Cant_Infracciones(): tipoElemento;
var elemDevolver:TipoElemento;
  cantMultas,mayorCantMultas: integer;
  autoInfractor: string;
  P,M: PosicionLista;
  X1,X2: TipoElemento;
  Bandera: Boolean;
  Puntero1: ^Lista;
  Puntero2: puntMulta;
begin
  cantMultas := 0;
  mayorCantMultas := 0;
  P := L.Comienzo;
  X1 := L.Recuperar(P);
  New(Puntero1);
  New(Puntero2);
  while P <= L.Fin do begin
    Puntero1 := X1.Valor2;
    M := Puntero1.Comienzo;
    X2 := Puntero1.Recuperar(M);
    Puntero2 := X2.Valor2;
    cantMultas := 0;
    while M <= Puntero1.Fin do begin
      if not X2.EsTEVacio then begin
        cantMultas := cantMultas + 1;
      end;
      if cantMultas > mayorCantMultas then begin
        mayorCantMultas := cantMultas;
        autoInfractor := X1.Clave;
      end;

    end;
    P := Puntero1.Siguiente(P);
    X1 := Puntero1.Recuperar(P);
  end;
  elemDevolver.Clave := autoInfractor;
  elemDevolver.Valor1 := mayorCantMultas;

  Dispose(Puntero1);
  Dispose(Puntero2);
  Result := elemDevolver;
end;



//Funcion que calcula la multa mas reciente para un vehiculo
function Vehiculo.multaReciente (Auto: String): tipoElemento;
var elemAuto, elemMulta, elemGuardar: tipoElemento;
    posAuto,posMulta: posicionLista;
    posAGuardar, multaMasReciente: integer;
    Fecha: double;
    lisMultas: ^Lista;
    datosMulta: puntMulta;
    Encontrado: Boolean;

begin
  Encontrado := False;
  Fecha := -1;
  posAuto := L.Comienzo;
  elemAuto := L.Recuperar(posAuto);
  while (posAuto <= L.Fin) and (Encontrado) do begin
    if elemAuto.Clave = Auto then begin
      Encontrado := True;
      posAGuardar := posAuto;
    end;
  end;
  New(lisMultas);
  New(datosMulta);
  elemAuto := L.Recuperar(posAGuardar);
  lisMultas := elemAuto.Valor2;
  posMulta := lisMultas.Comienzo;

  while (posMulta <= lisMultas.Fin) do begin
    elemMulta := lisMultas.Recuperar(posMulta);
    datosMulta := elemMulta.Valor2;
    if datosMulta.Fecha > Fecha then begin
      Fecha := datosMulta.Fecha;
      multaMasReciente := elemMulta.Clave;
    end;
    posMulta := lisMultas.Siguiente(posMulta);
  end;
  elemGuardar.Clave := elemAuto.Clave;
  elemGuardar.Valor1 := multaMasReciente;

  Dispose(lisMultas);
  Dispose(datosMulta);
  Result := elemGuardar;
end;


//Funcion que calcula la multa mas antigua de un vehiculo, devolviendo el importe y la fecha
function Vehiculo.multaAntigua (Auto: String): tipoElemento;
var elemAuto, elemMulta, elemDevolver: tipoElemento;
    posAuto,posMulta: posicionLista;
    posAGuardar,  multaMasAntigua: integer;
    Fecha: double;
    lisMultas: ^Lista;
    datosMulta: puntMulta;
    Encontrado: Boolean;

begin
  Encontrado := False;
  Fecha := 999999;
  posAuto := L.Comienzo;
  elemAuto := L.Recuperar(posAuto);
  while (posAuto <= L.Fin) and (Encontrado) do begin
    if elemAuto.Clave = Auto then begin
      Encontrado := True;
      posAGuardar := posAuto;
    end;
  end;
  New(lisMultas);
  New(datosMulta);
  elemAuto := L.Recuperar(posAGuardar);
  lisMultas := elemAuto.Valor2;
  posMulta := lisMultas.Comienzo;

  while (posMulta <= lisMultas.Fin) do begin
    elemMulta := lisMultas.Recuperar(posMulta);
    datosMulta := elemMulta.Valor2;
    if datosMulta.Fecha < Fecha then begin
      Fecha := datosMulta.Fecha;
      multaMasAntigua := elemMulta.Clave;
    end;
    posMulta := lisMultas.Siguiente(posMulta);
  end;
  elemDevolver.Clave := elemAuto.Clave;
  elemDevolver.Valor1 := multaMasAntigua;

  Dispose(lisMultas);
  Dispose(datosMulta);
  Result := elemDevolver;
end;

function Vehiculo.Devolver_Lista(): Lista;
begin
  Result := L;
end;

procedure Vehiculo.Inicializar(Tamanio: Integer);
begin
  L.Crear(Cadena,Tamanio);

end;

function Vehiculo.listaVacia() : boolean;
begin
  Result := L.EsVacia;
end;

end.
