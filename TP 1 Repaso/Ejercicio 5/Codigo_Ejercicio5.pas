unit Codigo_Ejercicio5;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    Button2: TButton;
    Edit2: TEdit;
    Button3: TButton;
    Edit3: TEdit;
    Button4: TButton;
    Edit4: TEdit;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
  Vector = Array [0..20] of Integer;

var
  Form1: TForm1;

implementation

{$R *.dfm}

function Entero_a_binario (Entero: Integer): String;
var V: Vector;
  i, Tama�o: Integer;
  Acumulador: String;
begin
  Acumulador := '';
  i := 1;
  while (Entero <> 0) and (Entero <> 1) do
  begin
    V[i] := Entero MOD 2;
    Entero := Entero DIV 2;
    i := i + 1;
  end;
  if Entero = 1 then
  begin
    V[i] := 1;
  end;
  if Entero = 0 then
  begin
    V[i] := 0;
  end;
  Tama�o := i;
  for i := Tama�o downto 1 do
  begin
    Acumulador := Acumulador + V[i].ToString;
  end;
end;

function Entero_a_octal (Entero: Integer): String;
var V: Vector;
  i, Tama�o: Integer;
  Acumulador: String;
begin
  Acumulador := '';
  i := 1;
  while (Entero <> 0) and (Entero <> 1) do
  begin
    V[i] := Entero MOD 2;
    Entero := Entero DIV 2;
    i := i + 1;
  end;
  if Entero = 1 then
  begin
    V[i] := 1;
  end;
  if Entero = 0 then
  begin
    V[i] := 0;
  end;
  Tama�o := i;
  for i := Tama�o downto 1 do
  begin
    Acumulador := Acumulador + V[i].ToString;
  end;

  Entero_a_binario := Acumulador;

end;


procedure TForm1.Button1Click(Sender: TObject);
var Valor : Integer;
  Binario: String;
begin
  Valor := strtoint(Edit1.Text);
  //Binario
  Binario := Entero_a_binario(Valor);
  memo1.Lines.Add('El binario es:' + Binario)
  //Octal

end;

end.
