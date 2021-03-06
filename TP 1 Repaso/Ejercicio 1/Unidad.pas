unit Unidad;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, FuncionesMatematicas;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    { Private declarations }
  public
    V: Vector;
    B: Vector;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var i: Integer;
begin
  for i := Min to Max do begin
    Randomize;
    V[i] := 1 + Random(10);
  end;
  memo1.Lines.Add('El vector fue cargado con exito');
end;

procedure TForm1.Button2Click(Sender: TObject);
var i: Integer;
begin
  memo1.Lines.Add('El vector es el siguiente:');
  for i := Min to Max do begin
    memo1.Lines.Add('V[' + i.ToString + '] : ' + V[i].ToString);
  end;

end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  memo1.Lines.Add('');
  memo1.Lines.Add('La media es ' + Media(V).ToString);
end;

procedure TForm1.Button4Click(Sender: TObject);
var i: Integer;
begin
  memo1.Lines.Add('');
  memo1.Lines.Add('Ordeno el vector para sacar la Mediana:');
  Ordenar(V);
  for i := Min to Max do begin
    memo1.Lines.Add('V[' + i.ToString + '] : ' + V[i].ToString);
  end;
  memo1.Lines.Add('La mediana es: ' + Mediana(V).tostring);
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  memo1.Lines.Add('');
  memo1.Lines.Add('La moda es ' + Moda(V,B).ToString);
end;

end.
