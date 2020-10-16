procedure chifoumi();
Var i : Real;
    choixOrdi, choixJoueur : String;
    resChifoumi : boolean;

begin
randomize;
affichageTexte( 'chifoumi' );

repeat
resChifoumi:=false;
choixOrdi:='pierre';
i := random(3);

if i=1 then
  choixOrdi:='feuille'
  else if i=2 then
    choixOrdi:='ciseau';

repeat
  writeln('pierre, feuille ou ciseau?');
  write('vous: ');
  readln(choixJoueur);
until (choixJoueur='pierre') or (choixJoueur='feuille') or (choixJoueur='ciseau');
writeln('le sanglier: ',choixOrdi);

if (choixJoueur='pierre') and (choixOrdi='ciseau') or (choixJoueur='feuille') and (choixOrdi='pierre') or (choixJoueur='ciseau') and (choixOrdi='feuille') then
  resChifoumi:=true;

until choixOrdi<>choixJoueur;

if not(resChifoumi) then
   affichageTexte( 'MortChifoumi' );
end;
