procedure lectureFichierAng( var mot, traduction : String );
var fichier : Text;
    i, j, k : Integer;
begin
randomize;
i := random(5) + 1;
k := (2*i)-2;
assign ( fichier, 'anglais.pas' );
reset ( fichier );
for j := 1 to k do
    readln(fichier);
readln( fichier, mot);
readln( fichier, traduction);
close( fichier);
end;

procedure choixJoueurAng( mot : string; var proposition : String);
begin
write( mot, ' : ' );0
read( proposition);
end;

function estJusteAngl( proposition, traduction : string ) : Boolean;
begin
estJusteAngl := false;
if proposition = traduction then
  estJusteAngl := true;
end;

procedure examAnglais( var gagneAngl : Integer );
var mot, traduction, proposition : String;
begin
gagneAngl := 0;
affichageTexte( 'examAnglais' );
lectureFichierAng( mot, traduction);
choixJoueurAng( mot, proposition);
if (estJusteAngl( proposition, traduction )) then
  gagneAngl := 1
end;
