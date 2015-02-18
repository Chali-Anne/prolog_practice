start(1).
transition(1,a,1).
transition(1,a,2).
transition(1,b,3).

transition(2,a,3).
transition(2,b,2).
transition(2,b,4).

/*Tout revient à s3*/
transition(3,Z,3).

/*La transition nulle ne traite pas de caractères.*/
transition(4,a,3).
transition(4,[],1).

final(2).

/*Implémentation du parcours*/
accepte(Mot):-
start(X),
chemin(X,Mot).

chemin(Src,[]):-
final(Src).

chemin(Src,[Y|Reste]):-
transition(Src,Y,Dest),
chemin(Dest,Reste).

chemin(Src,W):-
transition(Src,[],dest),
chemin(Dest,W).
