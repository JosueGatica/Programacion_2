unit Ej3HashTAD;

interface

uses
  Tipos,SysUtils,
  TadHash;
  //TadHashZO;

const
  Min = 1;
  Max = 7;
  tipoClave = Numero;
  tipoFuncionHash = Modulo;
  cantElemTabla = 7;
  nroPrimo = 10;
  Esp = Char(32);

type
  Ej3 = Object
  private
    T: TablaHash;
  public
    procedure crearArchivo(aFile:string);
    procedure cargarProducto(aCodigo,aPrecio:longInt;aStock:integer;aFile,aDetalle:string);
    function eliminarProducto(aCodigo:longInt;aFile:string) : boolean;
    function modificarProducto(aCodigo, aPrecio:longint; aStock: Integer; aFile,aDetalle: string) : boolean;
    function mostrarArchivo(aFile:string) : string;
    procedure crearTabla(aTClave: tipoDatosClave; aTHash: tipoFuncionesHash;
      aCantElem, aNPrimo: integer);
    procedure cargarTabla();
    function mostrarTabla(): string;
    function Porcentaje_Ocupacion(): Extended;
    function Claves_Cargadas_VS_ZO(): Extended;

  End;

  recProducto = Record
    Codigo: LongInt;
    Detalle: string[15];
    Precio: LongInt;
    stock: integer;
    Borrado: boolean;
  End;
  aProducto = File of recProducto;

var
  RP: recProducto;
  AP: aProducto;

implementation

// Desarrollar un algoritmo que dado un archivo que contendr? los datos de un
// producto (c?digo, detalle, precio, stock) genere una tabla hash donde la
// clave ser? el c?digo y se guardar? como dato la posici?n f?sica del registro
// para poder realizar accesos directos.
//
// Hacer un ABM para poder para cargar manualmente el archivo. El c?digo es un
// valor de 7 d?gitos.

function Ej3.modificarProducto(aCodigo, aPrecio:longint; aStock: Integer; aFile,aDetalle: string) : boolean;
begin
  if fileExists(aFile) then begin
    Reset(AP);
    while not EOF(AP) do begin
      Read(AP,RP);
      if RP.Codigo = aCodigo then begin
        RP.Detalle := aDetalle;
        RP.Precio := aPrecio;
        RP.stock := aStock;
      end;
    end;
    CloseFile(AP);
  end;

end;

function Ej3.mostrarArchivo(aFile:string) : string;
var S: string;
begin
  S:='';
  if FileExists(aFile) then begin
    Reset(AP);
    while not EOF(AP) do begin
      Read(AP,RP);
      S := S + RP.Codigo.ToString + Esp + RP.Detalle + Esp +
      RP.Precio.ToString + Esp + RP.stock.ToString + Esp +
      RP.Borrado.ToString + cCRLF;
    end;
    CloseFile(AP);
    Result := S;
  end;
end;

function Ej3.eliminarProducto(aCodigo:longInt;aFile:string) : boolean;
var Borrado:boolean;
begin
  if FileExists(aFile) then begin
    Reset(AP);
    while (not EOF(AP)) and (RP.Codigo <> aCodigo) do begin
      Read(AP,RP);
      if RP.Codigo = aCodigo then begin
        RP.Borrado := False;
        Borrado := True;
      end;
    end;
    if (RP.Codigo <> aCodigo) then Borrado := False;
    CloseFile(AP);
  end
  else Borrado := False;
  Result := Borrado;
end;

procedure Ej3.cargarProducto(aCodigo,aPrecio:longInt;aStock:integer;aFile,aDetalle:string);
begin
  AssignFile(AP,aFile);
  if not FileExists(aFile) then begin
    Rewrite(AP);
    CloseFile(AP);
  end;

  Reset(AP);
  RP.Codigo := aCodigo;
  RP.Detalle := aDetalle;
  RP.Precio := aPrecio;
  RP.stock := aStock;
  RP.Borrado := True;
  Write(AP,RP);
  CloseFile(AP);
end;

procedure Ej3.crearArchivo(aFile:string);
begin
  AssignFile(AP, aFile);
  if not FileExists(aFile) then begin
    Rewrite(AP);
    CloseFile(AP);
  end;
end;

function Ej3.mostrarTabla: string;
begin
  Result := T.RetornarClaves;
end;

procedure Ej3.cargarTabla();
var
  I: integer;
  X: tipoElemento;
begin
  for I := Min to Max do
  begin
    X.Clave := I;
    T.Insertar(X);

  end;
end;

procedure Ej3.crearTabla(aTClave: tipoDatosClave; aTHash: tipoFuncionesHash;
  aCantElem, aNPrimo: integer);
begin
  T.Crear(aTClave, aTHash, aCantElem, aNPrimo);
end;

function Ej3.Porcentaje_Ocupacion():Extended;
begin
  Porcentaje_Ocupacion := (T.CantidadClaves DIV T.CantidadOcupados);
end;

function Ej3.Claves_Cargadas_VS_ZO;
begin
  Claves_Cargadas_VS_ZO := T.CantidadOcupados DIV T.CantidadClavesZO;
end;

end.
