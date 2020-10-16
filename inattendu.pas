procedure inattendu( var gagneC : Boolean );
var d : Integer;
begin
randomize();
affichageTexte('Inattendu');
gagneC := false;
d := random(6)+1;
writeln('le numero de ton de est : ', d);
if (d mod 2) = 0 then
  gagneC := true;
if gagneC = false then
    affichageTexte('InattenduEchec');
end;
