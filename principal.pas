program principal;
uses miniJeux, keyboard, crt;
const Max = 3;
var evenement : Integer;
    reussite : Boolean;
    scenario : array[0..Max] of Integer;
    i, j : Integer;
    a : char;

{choisi aléatoirement un scénario puis en charge les différents événements dans un tableau}
procedure initialisation( var scenario : array of integer );
var fichier : Text;
    nomHistoire, nb : string;
    j, s, i : integer;
begin
randomize;
i:=random(2)+1;
Str(i, nb);
nomHistoire:='histoire'+nb+'.txt';
assign ( fichier, nomHistoire);
reset ( fichier );
for j := 0 to 3 do
  begin
    readln( fichier, s);
    scenario[j] := s;
  end;
close( fichier);
end;

{appel les différents mini-jeux pour le premier DS puis comptabilise les points pour savoir si le joueur a reussi les DS, va aux
rattrapages et ou a échouué. Si il va aux rattrapages, la procédure renvoit le numéro de l'épreuve raté. }
procedure scoreExamA( var resultatA, numEpRatee:integer);
var gagneAngl,gagneMaths,gagneEnigme : integer;
begin
examAnglais( gagneAngl );
clrscr;
examMaths( gagneMaths );
clrscr;
enigme( gagneEnigme );
clrscr;
	resultatA:=0;
	resultatA:=gagneAngl+gagneMaths+gagneEnigme;
		if resultatA=3 then
		  writeln('Vous avez reussit les DS1');
		if resultatA=2 then
		begin
			if (gagneAngl=0) then
			numEpRatee:=1;
			if (gagneMaths=0) then
			numEpRatee:=2;
			if (gagneEnigme=0) then
			numEpRatee:=3;
		  writeln('Vous allez aux trappages');
    end;
end;

{Cette procédure recoit le numéro de l'épreuve raté et lui fait repaser le mini jeux de la même matière.}
procedure rattrapageA(numEpRatee:Integer; var validationA:Boolean);
var gagne : Integer;
begin
  clrscr;
  affichageTexte( 'rattrapageA' );
  ValidationA := false;
  case numEpRatee of
    1 : examAnglais(gagne);
    2 : examMaths( gagne );
    3 : enigme( gagne );
  end;
  if gagne = 1 then
  ValidationA := true
end;

{Cette procédure affiche la fiche de révision à partir d'un fichier texte pour le deuxième DS.}
procedure afficherFiche();
var fichier : Text;
    mot : string;
begin
  assign (fichier, 'fiche.txt' );
  reset (fichier);
  while not Eof(fichier) do
    begin
      readln (fichier, mot);
      write (mot);
      writeln();
    end;
  writeln();
  close(fichier);
end;

{Ecrit la question du DS numéro 2 et vérifie que la réponse donné par le joueur est bonne.}
procedure questionReponse(var estJuste : Boolean);
var reponse : string;
begin
  estJuste := false;
  writeln( 'Donner la definition de la fonction d''etat enthalpie (Ecrire sans espaces)' );
  readln( reponse );
  if reponse = 'H=U+PV' then estJuste := true;
end;

{Fait passer le deuxième DS au joueur et renvoit vrai si il a réussi.}
procedure scoreExamB( var resultat : Boolean );
var estJuste : Boolean;
begin
resultat := false;
afficherFiche();
questionReponse( estJuste );
if estJuste then resultat := true;
end;

{Fait passer le rattrapage du deuxième DS au joueur et renvoit vrai si il a réussi.}
procedure rattrapageB( var validation : Boolean );
var reponse : string;
begin
clrscr;
affichageTexte( 'rattrapageB' );
repeat
  writeln( 'Voulez vous passer en deuxieme annee?' );
  readln( reponse );
until (reponse = 'oui') or (reponse = 'non');
if reponse = 'oui' then validation := true;
end;

{Gère le fonctionnement du premier DS}
procedure DSA(var reussite : boolean );
var resultat, numEpRatee : Integer;
    validationA : boolean;
    a : Char;
begin
  clrscr;
  reussite := false;
  validationA := false;
  resultat := 0;
  numEpRatee := 0;
  affichageTexte( 'DSA' );
  writeln('appuyer entrer pour continuer');
  readln(a);
  clrscr;
  scoreExamA( resultat, numEpRatee );
  if resultat = 3 then reussite := true;
  if resultat = 2 then rattrapageA( numEpRatee, validationA );
  if validationA then reussite := true;
  if reussite = false then
    begin
      clrscr;
      affichageTexte('DSAEchec');
    end;
end;

{Gère le fonctionnement du deuxième DS}
procedure DSB(var reussite : boolean );
var resultat, validation : boolean;
begin
  clrscr;
  validation := false;
  affichageTexte( 'DSB' );
  reussite := false;
  scoreExamB( resultat );
  if resultat = true then reussite:=true
    else rattrapageB( validation );
  if validation then reussite := true
  else affichageTexte( 'rattrapageBEchec' );
  clrscr;
end;

{programme principal, s'occupe de la gestion des événement et du déroulement de l'histoire en fonction de l'initialisation et des succés
du joueur.}
begin
clrscr;
initialisation( scenario );
j := 0;
i := scenario[j];
affichageTexte( 'EntreeInsa' );
writeln('appuyer entrer pour continuer');
readln(a);
repeat
  reussite := false;
  evenement := i;
  case evenement of
    1 : chifoumi( reussite );
    2 : DSA( reussite );
    3 : inattendu( reussite );
    4 : DSB( reussite );
  end;
  if reussite=true then j:= j+1
  else j:=0;
  i:= scenario[j];
until (j=0) or (j=4);
if j=4 then affichageTexte('FinJeu');
end.
