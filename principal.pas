program principal;
uses miniJeux;
var evenement : Integer;
    reussite : Boolean;
    scenario : array[1..4] of Integer;
    i : Integer;

procedure initialisation( var scenario : array of integer );
var fichier : Text;
    j, s : integer;
begin
assign ( fichier, 'histoire.txt' );
reset ( fichier );
for j := 1 to 4 do
readln( fichier, s);
scenario [j] := s;
close( fichier);
end;

procedure scoreExamA( var resultatA,numEpRatee:integer);
var gagneAngl,gagneMaths,gagneEnigme : integer;
begin
examAnglais( gagneAngl );
examMaths( gagneMaths );
enigme( gagneEnigme );
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
		end;
		writeln('Vous allez aux trappages');
		if (resultatA=1) or (resultatA=0) then
		writeln('Dommage');
end;

procedure rattrapageA(numEpRatee:Integer; var validationA:Boolean);
var epreuve, question, reponse, proposition : String;
begin
	if (numEpRatee=1) then
	begin
		validationA := false;
		epreuve := 'anglais.pas';
		affichageTexte( 'examAnglais' );
		lectureFichier( epreuve, question, reponse);
		choixJoueur( question, proposition);
		if (estJuste( proposition, reponse )) then
		validationA := true;
	end;
	if (numEpRatee=2) then
	begin
		validationA := false;
		epreuve := 'maths.pas';
		affichageTexte( 'ExamMaths' );
		lectureFichier( epreuve, question, reponse);
		choixJoueur( question, proposition);
		if (estJuste( proposition, reponse )) then
		validationA := true;
	end;
	if (numEpRatee=3) then
	begin
		validationA := false;
		epreuve := 'enigme.pas';
		affichageTexte( 'ExamEnigme' );
		lectureFichier( epreuve, question, reponse);
		choixJoueur( question, proposition);
		if (estJuste( proposition, reponse )) then
		validationA := true;
	end;
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

procedure rattrapageB( validation : Boolean );
var reponse : string;
begin
writeln( 'Voulez vous passer en deuxieme annee?' );
readln( reponse );
if reponse = 'oui' then validation := true;
end;

procedure DSA( reussite : boolean );
var resultat, numEpRatee : Integer;
    validationA : boolean;
begin
  resultat := 0;
  numEpRatee := 0;
  affichageTexte( 'DSA' );
  reussite := false;
  scoreExamA( resultat, numEpRatee );
  if resultat = 3 then reussite:=true
  else if resultat = 2 then rattrapageA( numEpRatee, validationA );
  if validationA then reussite := true;
end;

procedure DSB( reussite : boolean );
var resultat, validation : boolean;
begin
  validation := false;
  affichageTexte( 'DSB' );
  reussite := false;
  scoreExamB( resultat );
  if resultat = true then reussite:=true
    else rattrapageB( validation );
  if validation then reussite := true;
end;

begin
initialisation( scenario );
i := 1;
affichageTexte( 'EntreeInsa' );
write('ca marche');
repeat
  reussite := false;
  evenement := i;
  case evenement of
    1 : chifoumi( reussite );
    2 : DSA( reussite );
    3 : inattendu( reussite );
    4 : DSB( reussite );
  end;
  if reussite=true then i:=(i+1)
  else i:=0
until (i=0) or (i=5);
write('ca sort de la boucle');
if i=5 then affichageTexte('FinJeu');
end.
