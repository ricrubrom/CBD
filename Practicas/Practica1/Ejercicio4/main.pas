program main;

type
    intFile= file of integer;

procedure BinToText (var binFile: intFile);
var
  aux: integer;
  txtFile: text;
begin
    reset(binFile);
    if eof(binFile) then
    begin
        writeln('El archivo esta vacio');
        exit;
    end;
    assign(txtFile, 'file.txt');
    rewrite(txtFile);
    while not eof(binFile) do
    begin
        read(binFile, aux);
        writeln(txtFile, aux);
    end;
    close(binFile);
    close(txtFile);
end;


var
  binFile: intFile;
begin
    assign(binFile, '../Ejercicio2/votantes.dat');
    BinToText(binFile);
end.
