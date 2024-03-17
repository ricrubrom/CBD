program main;

var
    arch: text;
    aux: String[30];
begin
    assign(arch, 'dinosaurios.txt');
    rewrite(arch);
    writeln('Inserte el tipo de dinosaurio (zzz terminara la ejecucion): ');
    readln(aux);
    while aux<>'zzz' do
    begin
        writeln(arch, aux);
        writeln('Inserte el tipo de dinosaurio (zzz terminara la ejecucion): ');
        readln(aux);
    end;
    close(arch);
end.
