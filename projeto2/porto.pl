:- use_module(library(random)).


porto:-
	read(Size),
	initializePort(Size, Port),
	write(Port).
	
initializePort(0, []).
initializePort(N, [[]|T]):-
	N > 0,
	N1 is N - 1,
	initializePort(N1, T).
	

	
arriveShip(Ship):- 
	disposeContainers(Port, Ship),
	write('Ship is parking, handling containers'), nl,
	write('Ship contains :'), nl,
	displayShip(Ship).
	
	
createShip([]).
createShip([H|T]):-
	random(0,5, SizeS),
	Counter is SizeS - 1, 
	random(0,8, Container),
	(
		Container = '0' -> H = 's',
		Container = '1' -> H = 'm',
		Container = '2' -> H = 'b',
	)
	createShip(T).
	
displayShip([]).
displayShip([H|T]):-
	write(H),
	displayShip(T).
	