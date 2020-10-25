procedure scoreExam1(gagneAngl,gagneMaths,gagneEnigme:integer;var resultatA,numEpRatee:integer);
begin
	resultatA:=0;
	resultatA:=gagneAngl+gagneMaths+gagneEnigme;
	begin
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
end;

procedure rattrapage1(numEpRatee:Integer; var validation1:Boolean);
var epreuve, question, reponse, proposition : String;
begin
	if (numEpRatee=1) then 
	begin
		validation1 := false;
		epreuve := 'anglais.pas';
		affichageTexte( 'examAnglais' );
		lectureFichier( epreuve, question, reponse);
		choixJoueur( question, proposition);
		if (estJuste( proposition, reponse )) then
		validation1 := true;
	end;
	if (numEpRatee=2) then 
	begin
		validation1 := false;
		epreuve := 'maths.pas';
		affichageTexte( 'ExamMaths' );
		lectureFichier( epreuve, question, reponse);
		choixJoueur( question, proposition);
		if (estJuste( proposition, reponse )) then
		validation1 := true;
	end;
	if (numEpRatee=3) then 
	begin
		validation1 := false;
		epreuve := 'enigme.pas';
		affichageTexte( 'ExamEnigme' );
		lectureFichier( epreuve, question, reponse);
		choixJoueur( question, proposition);
		if (estJuste( proposition, reponse )) then
		validation1 := true;
	end;	
end;

