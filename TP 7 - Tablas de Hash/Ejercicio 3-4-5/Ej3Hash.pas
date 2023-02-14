unit Ej3Hash;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,Ej3HashTAD, Vcl.StdCtrls, Tipos;

const
  archivo = '.\Productos.dat';

type
  TForm1 = class(TForm)
    btnCargar: TButton;
    btnMostrar: TButton;
    btnEliminar: TButton;
    Memo1: TMemo;
    editCodigo: TEdit;
    editPrecio: TEdit;
    editDetalle: TEdit;
    editStock: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    editEliminar: TEdit;
    Label5: TLabel;
    Button2: TButton;
    Button3: TButton;
    procedure FormCreate(Sender: TObject);
//    procedure Button1Click(Sender: TObject);
    procedure btnCargarClick(Sender: TObject);
    procedure btnMostrarClick(Sender: TObject);
    {procedure btnEliminarClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);}
  private
    { Private declarations }
    TH:Ej3;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

{
Ejercicio 3
  Desarrollar un algoritmo que dado un archivo que contendr� los datos de un producto
  (c�digo, detalle, precio, stock) genere una tabla hash donde la clave ser� el c�digo y
  se guardar� como dato la posici�n f�sica del registro para poder realizar accesos directos.

  Hacer un ABM para poder para cargar manualmente el archivo. El c�digo es un valor de 7 d�gitos.
}

procedure TForm1.btnCargarClick(Sender: TObject);
var Codigo,Precio,Stock:integer;
begin
  if (tryStrToInt(editCodigo.Text,Codigo)) and (tryStrToInt(editPrecio.Text,Precio)) and (tryStrToInt(editStock.Text,Stock)) then begin
    TH.cargarProducto(Codigo,Precio,Stock,archivo,editDetalle.Text);
    memo1.Lines.Add('Producto cargado correctamente');
  end;
end;

procedure TForm1.btnMostrarClick(Sender: TObject);
begin
  memo1.Lines.Add(TH.mostrarArchivo(archivo));
end;

 {
procedure TForm1.btnEliminarClick(Sender: TObject);
var Codigo:integer;
begin
  if tryStrToInt(editEliminar.Text,Codigo) then begin
    if TH.eliminarProducto(Codigo,'.\Productos.dat') then begin
      memo1.Lines.Add('Se elimin� correctamente');
    end;
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
var Ocupacion: Extended;
begin
  Ocupacion := TH.Porcentaje_Ocupacion * 100;
  memo1.Lines.Add('Porcentaje de ocupacion ' + Ocupacion.ToString + '%');
end;

procedure TForm1.Button3Click(Sender: TObject);
var Ocupacion: Extended;
begin
  Ocupacion := TH.Claves_Cargadas_VS_ZO * 100;
  memo1.Lines.Add('Porcentaje de claves en la ZO vs Claves cargadas ' + Ocupacion.ToString + '%');
end;
}
procedure TForm1.FormCreate(Sender: TObject);
begin
  memo1.Clear;
  TH.crearArchivo(archivo);
  //TH.crearTabla(numero,Modulo,10,997);
end;

end.
