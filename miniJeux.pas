unit miniJeux;

interface

procedure affichageTexte (nomEpreuve : string);
procedure chifoumi( var resChifoumi : boolean );
procedure lectureFichier( epreuve : string; var question, reponse : String );
procedure choixJoueur( question : string; var proposition : String);
function estJuste( proposition, reponse : string ) : Boolean;
procedure examAnglais( var gagneAngl : Integer );
procedure examMaths( var gagneMaths : Integer );
procedure enigme( var gagneEnigme : Integer );
procedure inattendu( var gagneC : Boolean );

implementation

uses crt;

{affiche le texte du fichier texte demandé}
procedure affichageTexte (nomEpreuve : string);
var fichier : Text;
    mot, nomFichier : String;
begin
  nomFichier := nomEpreuve +'.txt';
  assign (fichier, nomFichier );
  reset (fichier);
  while not Eof(fichier) do
    begin
      readln (fichier, mot);
      write (mot);
      writeln();
    end;
  close(fichier);
  writeln();
end;

{renvoi vrai si le joueur gagne la partie de chifoumi}
procedure chifoumi( var resChifoumi : boolean );
Var i : Real;
    choixOrdi, choixJoueur : String;

begin
  randomize;
  clrscr;
  affichageTexte( 'chifoumi' );
  repeat
    resChifoumi:=false;
    choixOrdi:='pierre';
    i := random(3);
    if i=1 then
      choixOrdi:='feuille'
      else if i=2 then
        choixOrdi:='ciseaux';
    repeat
      writeln('pierre, feuille ou ciseaux?');
      write('vous: ');
      readln(choixJoueur);
    until (choixJoueur='pierre') or (choixJoueur='feuille') or (choixJoueur='ciseaux');
    writeln('le sanglier: ',choixOrdi);
    if ((choixJoueur='pierre') and (choixOrdi='ciseaux')) or ((choixJoueur='feuille') and (choixOrdi='pierre')) or ((choixJoueur='ciseaux') and (choixOrdi='feuille')) then
      resChifoumi:=true;
  until choixOrdi<>choixJoueur;
  if not(resChifoumi) then
    begin
      clrscr;
      affichageTexte( 'MortChifoumi' );
    end;
end;

{lit et renvoit une question et une réponse à partir du fichier texte de l'epreuve}
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

{écrit la question et renvoit la réponse du joueur}
procedure choixJoueur( question : string; var proposition : String);
begin
  write( question, ' : ' );
  readln( proposition);
end;

{revoit vrai si la la proposition du joueur correspond a la réponse}
function estJuste( proposition, reponse : string ) : Boolean;
begin
  estJuste := false;
  if proposition = reponse then
    estJuste := true;
end;

{revoit 0 si le joueur n'a pas reussi la question d'anglais et 1 si il a reussi}
procedure examAnglais( var gagneAngl : Integer );
var epreuve, question, reponse, proposition : String;
begin
  gagneAngl := 0;
  epreuve := 'anglais.txt';
  affichageTexte( 'examAnglais' );
  lectureFichier( epreuve, question, reponse);
  choixJoueur( question, proposition);
  if (estJuste( proposition, reponse )) then
    gagneAngl := 1
end;

{revoit 0 si le joueur n'a pas reussi la question de maths et 1 si il a reussi}
procedure examMaths( var gagneMaths : Integer );
var epreuve, question, reponse, proposition : String;
begin
  gagneMaths := 0;
  epreuve := 'maths.txt';
  affichageTexte( 'ExamMaths' );
  lectureFichier( epreuve, question, reponse);
  choixJoueur( question, proposition);
  if (estJuste( proposition, reponse )) then
    gagneMaths := 1
end;

{revoit 0 si le joueur n'a pas reussi l'enigme et 1 si il a reussi}
procedure enigme( var gagneEnigme : Integer );
var epreuve, question, reponse, proposition : String;
begin
  gagneEnigme := 0;
  epreuve := 'enigme.txt';
  affichageTexte( 'ExamEnigme' );
  lectureFichier( epreuve, question, reponse);
  choixJoueur( question, proposition);
  if (estJuste( proposition, reponse )) then
    gagneEnigme := 1
end;

{revoi vrai si le joueur fait un chiffre pair au lancer de de}
procedure inattendu( var gagneC : Boolean );
var d : Integer;
    a : char;
begin
  randomize();
  clrscr;
  affichageTexte('Inattendu');
  gagneC := false;
  d := random(6)+1;
  writeln('le numero de ton de est : ', d);
  writeln();
  if (d mod 2) = 0 then
    gagneC := true;
  if gagneC = false then affichageTexte('InattenduEchec')
    else
    begin
      writeln('appuyer sur entrer pour continuer');
      readln(a);
    end;
end;

end.
