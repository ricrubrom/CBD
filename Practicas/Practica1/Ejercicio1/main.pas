program main;

type
  str30=String[30];
  fileMat = file of str30;

var
  archMat: fileMat;
  aux: str30;
begin
  assign(archMat, 'Materiales.dat');
  rewrite(archMat);
  writeln('Inserte nombre de material (Cemento finaliza la carga): ');
  readln(aux);
  while (aux <> 'Cemento') do
  begin
    write(archMat, aux);
    writeln('Inserte nombre de material (Cemento finaliza la carga): ');
    readln(aux);
  end;
  close(archMat);
end.
