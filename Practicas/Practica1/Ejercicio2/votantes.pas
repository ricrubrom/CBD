program votantes;

type
  archInt=file of integer;

var
  arch: archInt;
  i: integer;
begin
  assign(arch, 'votantes.txt');
  rewrite(arch);
  for i:=0 to 10 do
  begin
    write(arch,Random(100));
  end;
  close(arch);
end.
