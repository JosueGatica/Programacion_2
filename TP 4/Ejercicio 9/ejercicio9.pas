unit ejercicio9;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Tipos,
   ListArray, Vcl.StdCtrls, Vcl.ComCtrls;
  //ListCursor;
  //ListPointer;

const
  cantElemMax = 100;

type

  TForm1 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    Edit1: TEdit;
    Label1: TLabel;
    ComboBox1: TComboBox;
    DateTimePicker1: TDateTimePicker;
    Button2: TButton;
    Edit2: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  L: Lista;

implementation

{$R *.dfm}
//
//Generar una lista de lista que permita almacenar como clave la patente de un
// veh�culo (campo clave) y como valores de la clave las multas que se le
//realizaron a dicho veh�culo. Se debe guardar como datos de la multa el n�mero de
// acta (campo clave), la fecha y el importe (como valores), estado (Pendiente,
// Abonada, Anulada).
//

//Se pide:
//
//    Dado un veh�culo determinar el total adeudado por multas, la multa m�s
//antigua y la m�s reciente (comparable por las fechas).
//    �Cu�l es el veh�culo con mayor cantidad de infracciones?
//    �Cu�l es el veh�culo que m�s deuda de infracciones tiene?
//    �Existe alg�n veh�culo/s que no tenga deuda de infracciones?

//procedure mostrarLista(var Li: Lista);
//begin
//  Li.RetornarClaves;
//end;

function multaMasAntigua(L: Lista; Auto: string) : integer;
var contL1, contL2: tipoElemento;
    pos: posicionLista;
    puntero: ^Lista;
    multaAntigua: integer;
begin
  pos := L.Comienzo;





//  while pos <> Nulo do begin
//    contL1 := L.Recuperar(pos);
//    if contL1.Clave = Auto then begin
//      if contL1.Valor1 = 'Pendiente' then begin
//        puntero := contL1.Valor2;
//        contL2 := puntero^.Recuperar(pos);
//
//        contL2.Valor1
//      end;
//    end;
//    pos := L.Siguiente(pos);
  end;
  Result := ;
end;

function totalMultas(L: Lista; Auto: string) : integer;
var sumador: integer;
    contL1, contL2: tipoElemento;
    pos: posicionLista;
    puntero: ^Lista;
    puntero2: ^integer;
begin
  pos := L.Comienzo;
  sumador := 0;

  while pos <> Nulo do begin
    contL1 := L.Recuperar(pos);
    if contL1.Clave = Auto then begin
      if contL1.Valor1 = 'Pendiente' then begin
        puntero := contL1.Valor2;
        contL2 := puntero^.Recuperar(pos);

        puntero2 := contL2.Valor2;
        sumador := sumador + puntero2^;
      end;
    end;
    pos := L.Siguiente(pos);
  end;
  Result := sumador;
end;

procedure TForm1.Button1Click(Sender: TObject);
var Elem, ElemPuntero: tipoElemento;
    posElem: posicionLista;
    puntero: ^Lista;
    punteroValor2: ^Integer;
begin
  Randomize;
  L.Crear(Cadena,cantElemMax);
  New(puntero);
  puntero^.Crear(Numero,cantElemMax);
  Elem.Clave := Edit1.Text; //patente
  Elem.Valor1 := ComboBox1.Text;     //estado
  New(punteroValor2);
  ElemPuntero.Clave := Random(100); // nro acta multa
  ElemPuntero.Valor1 := DateTimePicker1.Date;        //fecha multa

  punteroValor2^ := Random(15000);  //importe multa
  ElemPuntero.Valor2 := punteroValor2;

  puntero^.Agregar(ElemPuntero);
  Elem.Valor2 := puntero;        //multas
  L.Agregar(Elem);
  memo1.Lines.Add(L.RetornarClaves);
  memo1.Lines.Add(puntero^.RetornarClaves);
  //mostrarLista(L);
end;



procedure TForm1.Button2Click(Sender: TObject);
var deuda: integer;
begin
  deuda := totalMultas(L, Edit2.Text);
  memo1.Lines.Add(intToStr(deuda));
end;

end.
