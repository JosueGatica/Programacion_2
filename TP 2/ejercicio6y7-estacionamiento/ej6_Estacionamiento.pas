unit ej6_Estacionamiento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, estacionamientoTAD, Vcl.StdCtrls,
  Vcl.ComCtrls;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    btnGuardar: TButton;
    Button2: TButton;
    Patente: TEdit;
    Label1: TLabel;
    autosGuardados: TButton;
    horarioEntrada: TEdit;
    Label2: TLabel;
    horarioSalida: TEdit;
    Label3: TLabel;
    DateTimePicker1: TDateTimePicker;
    procedure btnGuardarClick(Sender: TObject);
    procedure mostrarAuto(autoGuardado: Auto; lugar: integer);
    procedure autosGuardadosClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Memo1Change(Sender: TObject);
    procedure DateTimePicker1Change(Sender: TObject);
  private
    E: Estacionamiento;
  public

  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

//muestra todos los autos guardados, lo hice para ver como solucionaba el problema de que siempre guarda en el mismo indice
procedure TForm1.autosGuardadosClick(Sender: TObject);
var cantidadAutos: integer;
begin
  cantidadAutos := E.conseguirLugar();
  memo1.Lines.Add('La cantidad de autos estacionados es: ' + cantidadAutos.ToString);
end;

//bot�n guardar auto, llama a funci�n que guarda en vector si hay lugar
procedure TForm1.btnGuardarClick(Sender: TObject);
var lugar: integer;
    autoGuardado: Auto;
begin
  lugar := E.conseguirLugar();

  //si hay lugar lo guarda en vector y lo muestra
  if lugar <> -1 then begin
    autoGuardado := E.guardarAuto(Patente.Text,horarioEntrada.Text,horarioSalida.Text,lugar);
    mostrarAuto(autoGuardado,lugar);
  end
  else begin
    memo1.Lines.Add('No hay lugar en el estacionamiento');
  end;

end;

//Manejo de fechas
procedure TForm1.DateTimePicker1Change(Sender: TObject);
var Dia1: TDateTime;
begin
  Dia1 := DateTimePicker1.DateTime;
  memo1.Lines.Add(datetimetostr(Dia1));
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
   E.cargarEstacionamiento();
end;

procedure TForm1.Memo1Change(Sender: TObject);
begin

end;

//muestra en pantalla los datos del auto ingresado
procedure TForm1.mostrarAuto(autoGuardado: Auto; lugar: integer);
begin
  memo1.Lines.Add('Auto ingresado.');
  memo1.Lines.Add('Patente: ' + autoGuardado.patente);
  memo1.Lines.Add('Hora de ingreso: ' + autoGuardado.horarioEntrada);
  memo1.Lines.Add('Lugar en el estacionamiento: ' + (lugar).ToString);
  memo1.Lines.Add('-------------------------------------------');
end;

end.
