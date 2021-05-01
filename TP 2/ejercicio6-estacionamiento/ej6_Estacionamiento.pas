unit ej6_Estacionamiento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, estacionamientoTAD, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    Button2: TButton;
    Patente: TEdit;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}


procedure TForm1.Button1Click(Sender: TObject);
var E: Estacionamiento;
    lugar: integer;
begin
  E.cargarEstacionamiento();
  lugar := E.conseguirLugar();
  if lugar <> -1 then begin
    E.guardarAuto(Patente.Text,DateTimeToStr(now),' ',lugar);
    memo1.Lines.Add('Auto ingresado.');
    memo1.Lines.Add('Patente: ' + Patente.Text);
    memo1.Lines.Add('Hora de ingreso: ' + DateTimeToStr(now));
    memo1.Lines.Add('Lugar en el estacionamiento: ' + (lugar+1).ToString);
    memo1.Lines.Add('-------------------------------------------');
  end
  else begin
    memo1.Lines.Add('No hay lugar en el estacionamiento');
  end;

end;

end.
