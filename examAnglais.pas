procedure lectureFichierAng( var mot, traduction : String );
var fichier : Text;
    i, j : Integer;
begin
randomize;
j := 1;
i := random(9) + 1;
assign ( fichier, 'anglais.pas' );
reset ( fichier );
for j := 1 to i-1 do
  readln ();
read( fichier, mot);
read( fichier, traduction);
close( fichier);
end;

procedure choixJoueurAng( mot : string; var proposition : String);
begin
write( mot, ' : ' );
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
gagneAngl := 0
affichageTexte( 'examAnglais' );
lectureFichierAng( mot, traduction);
choixJoueurAng( mot, proposition);
if (estJusteAngl( proposition, traduction )) then
  gagneAngl := 1
end;
