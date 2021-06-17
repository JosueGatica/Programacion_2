unit ejercicio9;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Tipos, TADVehiculos, ListArray, ListCursor, ListPointer,
  Vcl.StdCtrls, Vcl.ComCtrls;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Edit1: TEdit;
    Label1: TLabel;
    ComboBox1: TComboBox;
    DateTimePicker1: TDateTimePicker;
    Edit2: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    btnTotal: TButton;
    Label5: TLabel;
    btnMayorCant: TButton;
    Button6: TButton;
    Button7: TButton;
    editConsulta: TEdit;
    btnGuardar: TButton;
    btnMultaReciente: TButton;
    btnMultaAntigua: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnGuardarClick(Sender: TObject);
    procedure btnTotalClick(Sender: TObject);
    procedure btnMultaAntiguaClick(Sender: TObject);
    procedure btnMultaRecienteClick(Sender: TObject);
    procedure btnMayorCantClick(Sender: TObject);
  private
    { Private declarations }
    LV: Vehiculos;

  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation
{$R *.dfm}

////Generar una lista de lista que permita almacenar como clave la patente de un veh�culo
//// (campo clave) y como valores de la clave las multas que se le realizaron a dicho
//// veh�culo. Se debe guardar como datos de la multa el n�mero de acta (campo clave),
////  la fecha y el importe (como valores), estado (Pendiente, Abonada, Anulada).
////
////Se pide:
////
////    Dado un veh�culo determinar el total adeudado por multas, la multa m�s antigua
////    y la m�s reciente (comparable por las fechas).
////    �Cu�l es el veh�culo con mayor cantidad de infracciones?
////    �Cu�l es el veh�culo que m�s deuda de infracciones tiene?
////    �Existe alg�n veh�culo/s que no tenga deuda de infracciones?

//ingresa la patente, busco si la patente ya esta, si la lista esta vacia agrego de una,
//sino, veo si la lista de multas est� llena, sino agrego la multa



procedure TForm1.btnGuardarClick(Sender: TObject);
var seGuardo: Errores;
    Importe: integer;
begin
  Importe := strToInt(Edit2.Text);

  seGuardo := LV.guardarAuto(Edit1.Text);
  if (seGuardo = OK) or (seGuardo = ClaveDuplicada) then begin
    if seGuardo = OK then memo1.Lines.Add('El auto se guard� correctamente');
    if LV.insertarMulta(Edit1.Text,ComboBox1.Text,Importe,DateTimePicker1.Date) = OK then begin
      memo1.Lines.Add('La multa se guard� correctamente');
    end
    else begin
      memo1.Lines.Add('No se guard� la multa');
    end;
  end
  else begin
    memo1.Lines.Add('No se pudo guardar el auto');
  end;
  memo1.Lines.Add('Patentes: ');
  memo1.Lines.Add( LV.mostrarLista);
end;

procedure TForm1.btnMultaAntiguaClick(Sender: TObject);
var Multa: tipoElemento;
begin
  Multa := LV.fechaMulta(editConsulta.Text,true);
  if Multa.Valor1 <> CError then begin

    memo1.Lines.Add('La multa m�s antig�a es del ' + dateToStr(Multa.Clave));
  end
  else begin
    memo1.Lines.Add('No hay un veh�culo guardado con la patente ingresada');
  end;
end;

procedure TForm1.btnMultaRecienteClick(Sender: TObject);
var Multa: tipoElemento;
begin
  Multa := LV.fechaMulta(editConsulta.Text,false);
  if Multa.Valor1 <> CError then begin

    memo1.Lines.Add('La multa m�s reciente es del ' + dateToStr(Multa.Clave));
  end
  else begin
    memo1.Lines.Add('No hay un veh�culo guardado con la patente ingresada');
  end;
end;

procedure TForm1.btnTotalClick(Sender: TObject);
var Deuda: integer;
begin
  Deuda := LV.totalMultas(editConsulta.Text);

  if Deuda <> nError then begin

  memo1.Lines.Add('El importe total adeudado es ' + intToStr(Deuda));
  end
  else begin
    memo1.Lines.Add('No hay un auto guardado con esa patente');
  end;
end;

procedure TForm1.btnMayorCantClick(Sender: TObject);
var Auto: string;
begin
  Auto := LV.cantMultasMayor();
  if Auto <> 'Vacia' then begin
  memo1.Lines.Add('El veh�culo con la mayor cantidad de infracciones es '
   + Auto);
  end
  else memo1.Lines.Add('No hay ning�n auto guardado');

end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  LV.inicializarLista(Cadena,cantElemMax);
  memo1.Clear;
end;

end.
