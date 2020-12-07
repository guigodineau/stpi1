program principal;
uses miniJeux, crt;
const Max = 3;
var evenement : Integer;
    reussite : Boolean;
    scenario : array[0..Max] of Integer;
    i, j : Integer;

procedure initialisation( var scenario : array of integer );
var fichier : Text;
    j, s : integer;
begin
assign ( fichier, 'histoire.txt' );
reset ( fichier );
for j := 0 to 3 do
  begin
    readln( fichier, s);
    scenario[j] := s;
  end;
close( fichier);
end;

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
		if (resultatA=1) or (resultatA=0) then
		writeln('Dommage');
end;

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
  ValidationA := true;
end;

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
  close(fichier);
end;

procedure questionReponse(var estJuste : Boolean);
var reponse : string;
begin
  estJuste := false;
  writeln( 'Donner la definition de la fonction d''etat enthalpie? (Ecrire sans espaces)' );
  readln( reponse );
  if reponse = 'H=U+PV' then estJuste := true;
end;

procedure scoreExamB( var resultat : Boolean );
var estJuste : Boolean;
begin
resultat := false;
afficherFiche();
questionReponse( estJuste );
if estJuste then resultat := true;
end;

procedure rattrapageB( var validation : Boolean );
var reponse : string;
begin
clrscr;
affichageTexte( 'rattrapageB' );
writeln( 'Voulez vous passer en deuxieme annee?' );
readln( reponse );
if reponse = 'oui' then validation := true;
end;

procedure DSA(var reussite : boolean );
var resultat, numEpRatee : Integer;
    validationA : boolean;
begin
  clrscr;
  reussite := false;
  resultat := 0;
  numEpRatee := 0;
  affichageTexte( 'DSA' );
  scoreExamA( resultat, numEpRatee );
  if resultat = 3 then reussite := true
  else if resultat = 2 then rattrapageA( numEpRatee, validationA );
  if validationA then reussite := true;
end;

procedure DSB(var reussite : boolean );
var resultat, validation : boolean;
begin
  validation := false;
  affichageTexte( 'DSB' );
  reussite := false;
  scoreExamB( resultat );
  if resultat = true then reussite:=true
    else rattrapageB( validation );
  if validation then reussite := true;
  clrscr;
end;

begin
clrscr;
initialisation( scenario );
j := 0;
i := scenario[j];
affichageTexte( 'EntreeInsa' );
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
