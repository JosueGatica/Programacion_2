+unit Ej8ArbolesTAD;

interface

uses
  ArbolesBinariosBusqueda,Tipos, SysUtils;

type
  Datos = Record
    CUIT:longInt;
    razonSocial: string;
    Domicilio:string;
    Telefono:longInt;
    Celular:longInt;
  End;
  Ej8 = Object
  private
    A:Arbol;
  public

  End;

var
  RD : Datos;
  AD : File of Datos;

implementation

//Construir un ABM para manejar un archivo cuyo registro contiene los
//siguientes campos: CUIT, RAZ�N SOCIAL, DOMICILIO, TEL�FONO y CELULAR.
//
//
//El archivo se maneja a trav�s de un �ndice (utilizando un �rbol binario de
// b�squeda), considerando como clave el campo CUIT (el CUIT es �nico, no
//  existen duplicados). Se deben mantener sincronizado el �ndice y el
//  archivo, cada vez que se agrega un registro en el archivo se debe
//   actualizar el �ndice en memoria.



end.
