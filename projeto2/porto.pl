:- use_module(library(random)).

porto:-
	initializePort(5, Port),
	write(Port).
	
initializePort(0, []).
initializePort(N, [[]|T]):-
	N > 0,
	N1 is N - 1,
	initializePort(N1, T).