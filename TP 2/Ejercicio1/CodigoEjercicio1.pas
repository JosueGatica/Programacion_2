unit CodigoEjercicio1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, NumerosRacionales, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Memo1: TMemo;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Numerador1: TEdit;
    Numerador2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Denominador1: TEdit;
    Denominador2: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    //procedure Button5Click(Sender: TObject);
//    procedure Numerador1Change(Sender: TObject);
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
Var Numero1: NumerosR;
  Numero2: NumerosR;
  Suma : NumerosR;
begin
  if Numero1.Crear(strtoint(Numerador1.Text),strtoint(Denominador1.Text)) and Numero2.Crear(strtoint(Numerador2.Text),strtoint(Denominador2.Text)) then
  begin
    Suma := Numero1.Suma(Numero2);
    memo1.Lines.Add('El resultado de la suma es ' + Suma.ToString);
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
Var Numero1: NumerosR;
  Numero2: NumerosR;
  Resta : NumerosR;
begin
  if Numero1.Crear(strtoint(Numerador1.Text),strtoint(Denominador1.Text)) and Numero2.Crear(strtoint(Numerador2.Text),strtoint(Denominador2.Text)) then
  begin
    Resta := Numero1.Resta(Numero2);
    memo1.Lines.Add('El resultado de la resta es ' + Resta.ToString);
  end;
end;

procedure TForm1.Button3Click(Sender: TObject);
Var Numero1: NumerosR;
  Numero2: NumerosR;
  Multiplicar : NumerosR;
begin
  if Numero1.Crear(strtoint(Numerador1.Text),strtoint(Denominador1.Text)) and Numero2.Crear(strtoint(Numerador2.Text),strtoint(Denominador2.Text)) then
  begin
    Multiplicar := Numero1.Multiplicar(Numero2);
    memo1.Lines.Add('El resultado de la multiplicacion es ' + Multiplicar.ToString);
  end;
end;

procedure TForm1.Button4Click(Sender: TObject);
Var Numero1: NumerosR;
  Numero2: NumerosR;
  Dividir : NumerosR;
begin
  if Numero1.Crear(strtoint(Numerador1.Text),strtoint(Denominador1.Text)) and Numero2.Crear(strtoint(Numerador2.Text),strtoint(Denominador2.Text)) then
  begin
    Dividir := Numero1.Multiplicar(Numero2);
    memo1.Lines.Add('El resultado de la division es ' + Dividir.ToString);
  end;
end;

//procedure TForm1.Button5Click(Sender: TObject);
//Var Numero1: Integer;
//  Numero2: Integer;
//  Potencia : NumerosR;
//  Result : Double;
//begin
//  Numero1 := strtoint(Edit1.Text);
//  Numero2 := strtoint(Edit2.Text);
//  Result := Potencia.Potencia(Numero1,Numero2);
//  memo1.Lines.Add('El resultado de la potencia es ' + Result.ToString);
//end;
//
//procedure TForm1.Edit1Change(Sender: TObject);
//begin
//
//end;
//
end.

