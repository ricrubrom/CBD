program main;

type
  archInt= file of integer;

procedure MinMax (aux:integer; var min: integer; var max: integer);
begin
  if aux<=min then
    min:=aux;
  if aux>=max then
    max:=aux;
end;

var
  arch: archInt;
  aux, min, max: integer;
  nombre: String[30];
begin
  writeln('Inserte el nombre del archivo: ');
  max:=0;
  min:=9999;
  aux:=0;
  readln(nombre);
  assign(arch, nombre);
  reset(arch);
  if eof(arch) then
  begin
    writeln('El archivo esta vacio');
    exit;
  end;
  while not eof(arch) do
  begin
    read(arch, aux);
    writeln(aux);
    MinMax(aux, min, max);
  end;
  close(arch);
  writeln('El numero minimo fue: ', min, '     El numero maximo fue: ', max);
end.
