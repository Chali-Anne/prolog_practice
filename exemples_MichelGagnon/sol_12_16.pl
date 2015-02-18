segment(seg0,10,[welcome]).
segment(seg1,30,[skiing,views]).
segment(seg2,50,[welcome,computational_intelligence,robots]).
segment(seg3,40,[graphics,dragons]).
segment(seg4,50,[skiing,robots]).


presentation([],Maxtime,[]).
presentation(MustCover, Maxtime, Segments):- 
             Maxtime > 0,
	     MustCover = [Topic|OtherTopics],
      	     segment(S, Duration, SegmentTopics),
	     is_in(Topic, SegmentTopics), 
	     NewMaxtime is Maxtime - Duration, 
	     presentation(OtherTopics, NewMaxtime, SegmentsRest),
	     Segments = [S|SegmentsRest].

is_in(X, [X|_]).
is_in(X, [_|R]):-
    is_in(X, R).
