program Proyecto;

uses
  Vcl.Forms,
  Unidad in 'Unidad.pas' {Form1},
  FuncionesMatematicas in 'FuncionesMatematicas.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
