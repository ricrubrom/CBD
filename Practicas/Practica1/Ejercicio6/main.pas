program main;

type
  book=record
    name:String[30];
    ISBN:integer;
  end;
  bookArch=file of book;

procedure txtToBin(var txtArch:text; var binArch:bookArch);
var aux:book;
begin
  writeln('Ronaldo');
  reset(txtArch);
  writeln('Messi');
  rewrite(binArch);
  while not eof(txtArch) do
  begin
    readln(txtArch, aux.ISBN, aux.name);
    write(binArch, aux);
  end;
  close(txtArch);
  close(binArch);
end;

procedure agregarLibro(var binArch: bookArch);
var
  aux: book;
begin
  reset(binArch);
  seek(binArch,filesize(binArch));
  writeln('Inserte el nombre: ');
  readln(aux.name);
  writeln('Inserte el ISBN: ');
  readln(aux.ISBN);
  write(binArch, aux);
  close(binArch);
end;

procedure modificarLibro(var binArch: bookArch);
var
  aux, change: book;
begin
  reset(binArch);
  writeln('Inserte nombre: ');
  readln(change.name);
  writeln('Inserte ISBN');
  readln(change.ISBN);
  while not eof(binArch) do
  begin
    read(binArch, aux);
    if (aux.ISBN=change.ISBN) then
    begin
      aux.name:=change.name;
      seek(binArch, filepos(binArch)-1);
      write(binArch, aux);
    end;
  end;
end;

var
  txtArch: text;
  binArch: bookArch;
begin
  writeln('ajlksfdsoiughdslg');
  assign(txtArch, 'libros.txt');
  assign(binArch, 'libros.dat');
  txtToBin(txtArch, binArch);
  agregarLibro(binArch);
  modificarLibro(binArch);
end.
