program main;

type
    str30=String[30];
    flor=record
        numero: integer;
        maxAltura: integer;
        nombreCien: str30;
        nombreVulg: str30;
        color: str30;
    end;
    archFlor=file of flor;

procedure cargaRegistro(var regFlor:flor);
begin
    writeln('Inserte el nombre cientifico de la planta (zzz finaliza la carga): ');
    readln(regFlor.nombreCien);
    if regFlor.nombreCien='zzz' then
        exit;
    writeln('Inserte el numero de la planta: ');
    readln(regFlor.numero);
    writeln('Inserte la altura maxima de la planta: ');
    readln(regFlor.maxAltura);
    writeln('Inserte el nombre vulgar de la planta: ');
    readln(regFlor.nombreVulg);
    writeln('Inserte el color de la planta: ');
    readln(regFlor.color);
end;

procedure crearArchivo(var arch: archFlor);
var
    aux: flor;
begin
    rewrite(arch);
    cargaRegistro(aux);
    while (aux.nombreCien<>'zzz') do
    begin
        write(arch, aux);
        cargaRegistro(aux);
    end;
    close(arch);
end;

procedure imprDatos(var arch:archFlor);
var
    max, min, aux: flor;
begin
    reset(arch);
    min.maxAltura:=9999;
    max.maxAltura:=0;
    while not eof(arch) do
    begin
        read(arch, aux);
        if aux.maxAltura<min.maxAltura then
            min:=aux;
        if aux.maxAltura>max.maxAltura then
            max:=aux;
    end;
    writeln('Cantidad: ', Filesize(arch));
    writeln('Min:\n  Numero: ', min.numero, '\n  Altura maxima: ', min.maxAltura,'\n  Nombre Cientifico: ', min.nombreCien, '\n  Nombre Vulgar: ', min.nombreVulg, '\n  Color: ', min.color);
    writeln('Max:\n  Numero: ', max.numero, '\n  Altura maxima: ', max.maxAltura,'\n  Nombre Cientifico: ', max.nombreCien, '\n  Nombre Vulgar: ', max.nombreVulg, '\n  Color: ', max.color);
    close(arch);
end;

procedure printFile(var arch:archFlor);
var
    aux: flor;
begin
    reset(arch);
    while not eof(arch) do
    begin
      read(arch, aux);
      writeln('Numero: ', aux.numero, '  Altura maxima: ', aux.maxAltura,'  Nombre Cientifico: ', aux.nombreCien, '  Nombre Vulgar: ', aux.nombreVulg, '  Color: ', aux.color);
    end;
    close(arch);
end;

procedure modificarPlanta(var arch:archFlor);
var
    aux: flor;
begin
    reset(arch);
    while not eof(arch) do
    begin
      read(arch, aux);
      if aux.nombreCien='Victoria amazonia' then
          aux.nombreCien:='Victoria amazonica';
      seek(arch, filepos(arch)-1);
      write(arch, aux);
    end;
    close(arch);
end;

procedure appendFlores(var arch:archFlor);
var
    aux:flor;
begin
    reset(arch);
    seek(arch, filesize(arch));
    cargaRegistro(aux);
    while aux.nombreCien<>'zzz' do
    begin
        write(arch, aux);
        cargaRegistro(aux);
    end;
    close(arch);
end;

procedure binToTxt(var arch: archFlor);
var
  aux: flor;
  archivoTxt: text;
begin
    reset(arch);
    assign(archivoTxt, 'flores.txt');
    // Si no fuese necesario reutirlizarlo utilizaria rewrite en vez de reset
    rewrite(archivoTxt);
    while not eof(arch) do
    begin
        read(arch, aux);
        writeln(archivoTxt, aux.numero,'  ', aux.maxAltura,'  ', aux.nombreCien);
        writeln(archivoTxt, aux.nombreVulg);
        writeln(archivoTxt, aux.color);
    end;
    close(arch);
    close(archivoTxt);
end;


var
  arch: archFlor;
  archivoTxt: text;
  i: integer;
begin
  assign(arch, 'flores.dat');
  assign(archivoTxt, 'flores.txt');
  crearArchivo(arch);
  writeln('Opciones: ');
  writeln('1) Mostrar cantidad total de especies, especie de menor tamanio y de mayor tamanio');
  writeln('2) Listar contenido');
  writeln('3) Modificar nombre cientifico de las plantas Victoria amazonia -> Victoria Amazonica');
  writeln('4) Meter al final');
  writeln('5) Pasar el archivo binario a un archivo de texto');
  readln(i);
  //if (i=1) then
    imprDatos(arch);
  //else if (i=2) then
    printFile(arch);
  //else if (i=3) then
    modificarPlanta(arch);
  //else if (i=4) then
    appendFlores(arch);
  //else if (i=5) then
    binToTxt(arch);
  //else
    writeln('Operacion equivocada');
end.
