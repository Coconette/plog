:- use_module(library(random)).
:- use_module(library(lists)).

startPort :-
	write('Type the size of the Port: '),
	read(Size),
	initializePort(Size, Port),
	optionMenu(Port).
	
test:-
	initializePort(6, Port),
	findall
	generateShip(Ship),
	write(Ship), nl,
	nth1(1, Ship, Container),
	write(Container).

optionMenu(Port):-
	printPort(Port),
	write('OPTIONS'), nl,
	write('1. Get new ship.'), nl,
	write('2. Exit.'), nl,
	read(Option),
	(
	Option = 1 -> arriveShip(Port, NPort), optionMenu(NPort);
	Option > 2 -> optionMenu(Port)
	).
	
arriveShip(Port, NPort):-
	write('Ship is parking, handling containers'), nl,
	generateShip(Ship),
	write('Ship contains : '), write(Ship),
	handleContainers(Port, Ship, NPort).
	
handleContainers(Port, Ship, NPort):-
	nth1(1, Ship, Container),
	findall([], Port, EmptySpots),
	length(EmptySpots, NumberSpots),
	(
	NumberSpots > 0 -> placeOnEmpty(Port, Ship, NumberSpots);
	write('No empty spaces, calculating best approach'),
	nl
	),
	readPort(Port, C),
	placeOnPile(Port, Ship).
	
initializePort(0, []).
initializePort(N, [[]|T]):-
	N > 0,
	N1 is N - 1,
	initializePort(N1, T).

generateShip(Ship):-
	random(1, 10, Size),
	write('Size of ship: '), write(Size), nl,
	generateNContainers(Size, Ship).

printPort([]).
printPort([Pile|T]):-
	printPile(Pile),
	printPort(T).
	
printPile([]).
printPile([[H|T]|T2]):-
	write([H|T]), nl,
	printPile(T2).
	
printShip([]).
printShip([Container|T]):-
	write(Container), nl,
	printShip(T).

	
generatePile(Pile):-
	createContainer(Container, 30, 30),
	getContainerWeight(Container, Weight),
	LimWei is Weight * 5,
	getContainerDimension(Container, LimDim),
	N is div(LimDim,3),
	generateNContainers(Container, N, LimWei, LimDim, Pile).
	
generateNContainers(0, []).
generateNContainers(N, [Container|T]):-
	N1 is N - 1,
	generateContainer(Container, 30, 20),
	generateNContainers(N1, T).
	
generateContainer(Container, LimWei, LimDim):-
	Container = [Dimension, Weight, Date],
	(
	LimWei > 30 -> random(1, 30, Weight);
					random(1, LimWei, Weight)
					),
	(
	LimDim > 30 -> random(5, 30, Dimension);
					random(5, LimDim, Dimension)
					),
	random(5, 30, Date).
	
getContainerDimension(Container, Dimension):-
	nth1(1, Container, Dimension).
getContainerWeight(Container, Weight):-
	nth1(2, Container, Weight).
getContainerDate(Container, Date):-
	nth1(3, Container, Date).
getContainerManipTime(Container, Time):-
	nth1(1, Container, Dimension),
	nth1(2, Container, Weight),
	Time is Dimension / 5 + Weight / 4.
	
readPort([], C).
readPort([H|T], C):-
	getContainerDate(H, D),
	(
		D > C -> readPort(T, C);
		D = 0 -> dispatcheContainer(H), readPort(T, C);
		readPort(T, D)
	).
	
	
placeOnPile(Port, [H|T]):-
	getContainerDimension([H|T], D),
	%Same problem as above%
	
placeOnEmpty([], [], NumberSpots).
placeOnEmpty([H|T], [Hs|Ts], NumberSpots):-
	(
	H = ' ' -> H = Hs, Number is NumberSpots - 1, write('Placed container'), nl;
	placeOnEmpty(T,[Hs|Ts], NumberSpots)
	),
	placeOnEmpty(T,Ts, Number).
	
	
getNextElement([H|T], E):-
	E = H.
	
dispatcheContainer(H):-
	H = 0 .