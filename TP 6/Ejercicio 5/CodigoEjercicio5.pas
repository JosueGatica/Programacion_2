unit CodigoEjercicio5;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Tipos, TADEjercicio5Pila, TADEjercicio5Cola, TADEjercicio5Lista;

const
  TamaņoLista = 5;
  TamaņoCola = 6;
  TamaņoPila = 5;

type
  TForm1 = class(TForm)
    procedure FormCreate(Sender: TObject);
  private
    Cola: Ejercicio5Cola;
    Pila: Ejercicio5Pila;
    Lista: Ejercicio5Lista;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  Cola.Crear_Cola(Numero, TamaņoCola);
  Pila.Cargar_Pila_Aleatoria(TamaņoPila);
  Lista.Crear(Numero,TamaņoLista);
end;

end.
