procedure lectureFichier( epreuve : string; var question, reponse : String );
var fichier : Text;
    i, j, k : Integer;
begin
randomize;
i := random(5) + 1;
k := (2*i)-2;
assign ( fichier, epreuve );
reset ( fichier );
for j := 1 to k do
    readln(fichier);
readln( fichier, question);
readln( fichier, reponse);
close( fichier);
end;

procedure choixJoueur( question : string; var proposition : String);
begin
write( question, ' : ' );
read( proposition);
end;

function estJuste( proposition, reponse : string ) : Boolean;
begin
estJuste := false;
if proposition = reponse then
  estJuste := true;
end;

procedure examAnglais( var gagneAngl : Integer );
var epreuve, question, reponse, proposition : String;
begin
gagneAngl := 0;
epreuve := 'anglais.pas';
affichageTexte( 'examAnglais' );
lectureFichier( epreuve, question, reponse);
choixJoueur( question, proposition);
if (estJuste( proposition, reponse )) then
  gagneAngl := 1
end;

procedure examMaths( var gagneMaths : Integer );
var epreuve, question, reponse, proposition : String;
begin
gagneMaths := 0;
epreuve := 'maths.pas';
affichageTexte( 'ExamMaths' );
lectureFichier( epreuve, question, reponse);
choixJoueur( question, proposition);
if (estJuste( proposition, reponse )) then
  gagneMaths := 1
end;

procedure enigme( var gagneEnigme : Integer );
var epreuve, question, reponse, proposition : String;
begin
gagneEnigme := 0;
epreuve := 'enigme.pas';
affichageTexte( 'ExamEnigme' );
lectureFichier( epreuve, question, reponse);
choixJoueur( question, proposition);
if (estJuste( proposition, reponse )) then
  gagneEnigme := 1
end;
