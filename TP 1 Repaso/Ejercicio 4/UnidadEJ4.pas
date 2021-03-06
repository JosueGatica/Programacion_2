unit UnidadEJ4;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  Matriz = Array [1..10,1..10] of Integer;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Button1: TButton;
    Button2: TButton;
    Label2: TLabel;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    M: Matriz;
  public
    { Public declarations }
  end;


var
  Form1: TForm1;
  M: Matriz;

implementation

{$R *.dfm}
function Cargar_Cuadrado(var aM: Matriz; Maximo: Integer): Double;
var i,j,x, Cuadrado: Integer;
Paso: Boolean;
begin
  Cuadrado := (Maximo * Maximo);
  randomize;
  x := 1;
  while x < Cuadrado + 1 do
  begin
    Paso := True;
    while Paso do
    begin
      Paso := False;
      i := 1 + Random(Maximo);
      j := 1 + Random(Maximo);
      if aM[i,j] = 0 then
      begin
        aM[i,j] := x;
      end
      else
      begin
        Paso := True;
      end;
    end;
  x := x + 1;
  end;

end;

procedure TForm1.Button1Click(Sender: TObject);
var i,j,Max : Integer;
begin
  memo1.Clear;
  Max := strtoint(Edit1.Text);
  for i := 1 to Max do
  begin
    for j := 1 to Max do
    begin
      M[i,j] := 0;
    end;
  end;

  Cargar_cuadrado(M,Max);
  memo1.lines.Add('Cuadrado cargado exitosamente!');
end;

procedure TForm1.Button2Click(Sender: TObject);
var i,j, Max: Integer;
begin
  memo1.Lines.Add('El cuadrado latino es el siguiente:');
  Max := strtoint(Edit1.Text);
  for i := 1 to Max do
  begin
    for j := 1 to Max do
    begin
      memo1.Lines.Add('Posicion ' + i.ToString + '-' + j.ToString + ' : ' + M[i,j].ToString);
    end;
  end;
end;

end.



