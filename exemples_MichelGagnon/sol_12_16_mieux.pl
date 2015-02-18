% Meilleure solution à l'exercice 12.16
%
% Évite de mettre 2 fois le même segment dans la liste
% On garde une mémoire des segments trouvés
% On garde aussi une mémoire des thèmes couverts
% Au lieu d'utiliser le prédicat is_in, on utilise le prédicat member,
% qui est pré=défini en Prolog.
%
% À noter qu'en Prolog, la négation par échec utilise l'opérateur \+ 

segment(seg0,10,[welcome]).
segment(seg1,30,[skiing,views]).
segment(seg2,50,[welcome,computational_intelligence,robots]).
segment(seg3,40,[graphics,dragons]).
segment(seg4,50,[skiing,robots]).


% On appelle un prédicat secondaire qui prend comme argument supplémentataire
% un accumulateur qui mémorise les segments trouvés jusqu'à maintenant
presentation(MustCover, Maxtime, Result):-
    presentation(MustCover, Maxtime, [], Result).


% Première clause: tous les thèmes recherchés sont couverts
presentation([], Maxtime, FoundSegments, FoundSegments).
% Deuxième clause: le thème courant est déjà couvert par un segment retenu
presentation(MustCover, Maxtime, FoundSegments, Result):-
    Maxtime > 0,
    MustCover = [Topic|OtherTopics],
    topic_already_covered(Topic, FoundSegments),
    presentation(OtherTopics, Maxtime, FoundSegments, Result).
% Troisième clause: le thème courant n'est pas couvert par un segment retenu
% Il faut donc identifier un nouveau segment contenant ce thème
presentation(MustCover, Maxtime, FoundSegments, Result):-
    Maxtime > 0,
    MustCover = [Topic|OtherTopics],
    \+ topic_already_covered(Topic, FoundSegments),
    segment(S, Duration, Topics),
    \+ member(S, FoundSegments),
    member(Topic, Topics),
    NewMaxtime is Maxtime - Duration, 
    presentation(OtherTopics, NewMaxtime, [S|FoundSegments], Result).


% Verifie si un thème est déjà couvert par une liste de segments
topic_already_covered(Topic, Segments):-
    Segments = [S|Others],
    segment(S, D, Topics),
    member(Topic, Topics).
topic_already_covered(Topic, Segments):-
    Segments = [S|Others],
    segment(S, D, Topics),
    \+ member(Topic, Topics),   
    topic_already_covered(Topic, Others).


