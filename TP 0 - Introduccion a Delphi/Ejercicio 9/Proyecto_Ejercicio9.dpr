program Proyecto_Ejercicio9;

uses
  Vcl.Forms,
  Unit_Ejercicio9 in 'Unit_Ejercicio9.pas' {Form1},
  ArreglosDinamicos in '..\..\..\Clases Teoricas\Codigos\Clase_4\ArreglosDinamicos.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
