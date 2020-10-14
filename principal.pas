program principal;

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
    end;
  close(fichier);

end;

begin

end.
