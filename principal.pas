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

begin
initialisation( scenario );
i := 1;
affichageTexte( 'EntreeInsa' );
repeat
  reussite := false;
  evenement := scenario[i];
  case evenement of
    1 : chifoumi( reussite );
    2 : DS1( reussite );
    3 : inattendu( reussite );
    4 : DS2( reussite );
  end;
  if reussite then i := i+1
  else i:=0;
until (i=0) or (i=5);
if i=5 then affichageTexte('FinJeu');
end.
