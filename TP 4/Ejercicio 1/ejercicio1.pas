unit ejercicio1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Tipos, Vcl.StdCtrls,
  ListArray;
  //ListCursor;
  //ListPointer;

const
  cantElementos = 3;
  cantElementosMax = 10;
  minRandom = 1;
  maxRandom = 10;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    btnMostrar: TButton;
    btnMayor: TButton;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    procedure btnMostrarClick(Sender: TObject);
    procedure btnMayorClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  List: Lista;

{Dada una lista cargada con valores al azar realizar los siguientes ejercicios:

    Mostrar una lista desde el �ltimo elemento al primero.
    Que calcule el mayor de los datos e indique la posici�n ordinal.
    Que calcule el dato m�nimo y cuente la cantidad de veces que se repita.
    Que obtenga el promedio de los datos de una lista. El proceso debe ser recursivo.
    Que retorne otra lista con los n�meros m�ltiplos de otro n�mero que recibe como par�metro. El proceso debe ser recursivo.
    Generar un algoritmo que genere n�meros al azar �nicos dentro de la lista.
}

implementation

{$R *.dfm}

function Cargar_Al_Azar_Unico (aL: Lista; Tamanio_Max, Num: Integer): bool;
var Posicion: PosicionLista;
    Elem, ElemAAgregar: tipoElemento;
begin
  Posicion := aL.Comienzo;
  Elem := aL.Recuperar(Posicion);
  while (Posicion < Tamanio_Max) do begin
    if Num <> Elem.Clave then begin
      if (aL.Siguiente(Posicion) = Nulo) then begin
        ElemAAgregar := aL.Recuperar(aL.Siguiente(Posicion));
        ElemAAgregar.Clave := Num;
        aL.Agregar(ElemAAgregar);
        Result := True;
        Exit
      end
      else begin
        Posicion := Posicion + 1;
        Elem := aL.Recuperar(Posicion);
      end;
    end
    else begin
      Result := False;
      Exit
    end;
  end;
end;


function Promedio(aL: Lista; Inicio, Fin: PosicionLista): Variant;
begin
  if Inicio = Fin then
  begin
    Result := aL.Recuperar(Fin).Clave;
  end
  else
  begin
    Result := aL.Recuperar(Inicio).Clave + Promedio(aL,Inicio + 1,Fin);
  end;
end;

procedure TForm1.btnMayorClick(Sender: TObject);
var Inicio, Inicio_X, Fin: PosicionLista;
    X, mayorDato: tipoElemento;
    PosicionMayor: integer;
begin
  Inicio := List.Comienzo;
  Fin := List.Fin;
  mayorDato := List.Recuperar(Inicio);
  PosicionMayor := Inicio;
  while (Inicio < Fin) do begin
    X := List.Recuperar(List.Siguiente(Inicio));
    Inicio_X := Inicio + 1;
    if mayorDato.Clave < X.Clave then begin
      mayorDato := X;
      PosicionMayor := Inicio_X;
    end;
    Inicio := List.Siguiente(Inicio);
  end;
  memo1.Lines.Add('Valor:' + mayorDato.ArmarString);
  memo1.Lines.Add('Posicion:' + PosicionMayor.ToString);
end;

procedure TForm1.btnMostrarClick(Sender: TObject);
var
    X: PosicionLista;
    XA: tipoElemento;
    S: string;
begin
  memo1.Lines.Add('Mostrando elementos de la lista empezando desde el �ltimo: ');
  X := List.Fin;
  while X <> Nulo do begin
    XA := List.Recuperar(X);
    S := XA.ArmarString;
    memo1.Lines.Add(S);
    X := List.Anterior(X)
  end;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  List.Crear(Numero, cantElementosMax);
  List.LlenarClavesRandom(cantElementos, minRandom, maxRandom);
  memo1.Lines.Add('Lista cargada satisfactoriamente');
end;

procedure TForm1.Button2Click(Sender: TObject);
var Inicio, Fin: PosicionLista;
    X, menorDato: tipoElemento;
    Repeticiones: Integer;
begin
  Inicio := List.Comienzo;
  Fin := List.Fin;
  menorDato := List.Recuperar(Inicio);
  Repeticiones := 1;
  while (Inicio < Fin) do begin
    X := List.Recuperar(List.Siguiente(Inicio));
    if menorDato.Clave = X.Clave then
    begin
      Repeticiones := Repeticiones + 1;
    end;
    if menorDato.Clave > X.Clave then
    begin
      menorDato := X;
      Repeticiones := 1;
    end;
    Inicio := List.Siguiente(Inicio);
  end;
  memo1.Lines.Add('Valor m�nimo:' + menorDato.ArmarString);
  memo1.Lines.Add('Se repite:' + Repeticiones.ToString + ' veces.');
end;

procedure TForm1.Button3Click(Sender: TObject);
var Valor: Variant;
  Inicio, Fin: PosicionLista;
begin
  Inicio := List.Comienzo;
  Fin := List.Fin;
  Valor := Promedio(List,Inicio,Fin);
  Valor :=Valor / ((Fin - Inicio) + 1);
  Valor := FormatFloat ('0.0', Valor);
  memo1.Lines.Add('El promedio de los valores de la lista es ' + vartostr(Valor));
end;

procedure TForm1.Button4Click(Sender: TObject);
var seCargo: bool;
begin
  Randomize;
  seCargo := Cargar_Al_Azar_Unico(List,CantElementosMax, Random(maxRandom));
  if seCargo then begin
    memo1.Lines.Add('N�mero cargado correctamente');
  end
  else begin
    memo1.Lines.Add('Ese n�mero ya se encuentra en la lista por lo que no pudo ser cargado.');
  end;

end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  memo1.Clear
end;


end.
