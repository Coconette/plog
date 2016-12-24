:- use_module(library(random)).
:- use_module(library(lists)).

startPort :-
	write('Type the size of the Port: '),
	read(Size),
	initializePort(Size, Port),
	optionMenu(Size, Port).
	
test:-
	Test = [[],[],[],[1]],
	nth1(Number, Test, [1]),
	write(Number).

optionMenu(Size, Port):-
	write('YOUR PORT'), nl,
	write(Port), nl, nl,
	write('OPTIONS'), nl,
	write('1. Get new ship.'), nl,
	write('2. Exit.'), nl,
	read(Option),
	(
	Option = 1 -> arriveShip(Size, Port, NPort), optionMenu(Size, NPort);
	Option > 2 -> optionMenu(Size, Port)
	).
	
arriveShip(Size, Port, NPort):-
	write('Ship is parking, handling containers'), nl,
	generateShip(Ship),
	write('Ship contains : '), write(Ship), nl,
	placeContainers(Size, Port, Ship, NPort).

placeContainers(_, Port, [], Port).
placeContainers(Size, Port, [Container|T], NPort):-
	getEmptySpots(Size, Port, EmptySpots),
	length(EmptySpots, NumberSpots),
	(
	NumberSpots > 0 -> nth1(1, EmptySpots, Empty),
						placeOnEmpty(Port, Container, Empty, 1, XPort);
	getPossibleSpot(Size, Port, Container, PossPile, PossSpot),
	(
	PossPile > 0 -> (
					PossSpot > 0 -> placeOnSpot(Port, Container, PossPile, PossSpot, XPort);
					write('No place available to place container.'), nl
					);
	write('No place available to place container.'), nl
	)
	),
	placeContainers(Size, XPort, T, NPort).	
	
getPossibleSpot(Size,_,_, Size, Size):-
	Size = 0.
getPossibleSpot(Size, [Pile|T], Container, PossPile, PossSpot):-
	Size > 0,
	checkPileDim(Pile, Container, 1, Possible),
	checkBottomWei(Pile, Container, 1, Possible, Check1),
	checkTopWei(Pile, Container, 1, Check1, Check2),
	(
	Check2 > 0 -> PossSpot is Check2,
					PossPile is Size;
	NSize is Size - 1,
	getPossibleSpot(NSize, T, Container, PossPile, PossSpot)
	).

checkPile([C1|[]], Container, Counter, Possible):-
	Possible is Counter + 1.
checkPile([C1|[C2|T]], Container, Counter, Possible):-
	NCounter is Counter + 1,
	getContainerDimension(Container, Dim),
	getContainerDimension(C1, D1),
	getContainerDimension(C2, D2),
	(
	D1 > Dim -> (
				D2 > Dim ->	checkPile([C2|T], Container, NCounter, Possible);
				Possible is NCounter
				);
	Possible is Counter
	).

checkBottomWei(_,_,Counter, Spot, Spot):-
	Counter = Spot.
checkBottomWei([C1|T], Container, Counter, Spot, Poss):-
	Spot > Counter,
	NCounter is Counter + 1,
	getContainerWeight(C1, W1),
	getContainerWeight(Container, W2),
	getWeightOnTop(T, 0, TotalWeight),
	NewTotalWeight is TotalWeight + W2,
	MaximumWeight is W1 * 5,
	(
	MaximumWeight < NewTotalWeight -> Poss is 0;
	checkBottomWei(T, Container, NCounter, Spot, Poss)
	).

checkTopWei(_,_,Check1,Check1):-
	Check1 = 0.
checkTopWei([_|T], Container, Counter, Check1, Check2):-
	Check1 > 0,
	Counter < Check1,
	NCounter is Counter + 1,
	checkTopWei(T, Container, NCounter, Check1, Check2).
checkTopWei([_|T], Container, Counter, Check1, Check2):-
	Check1 = Counter,
	getContainerWeight(Container, Weight),
	getWeightOnTop(T, 0, TotalWeight),
	MaxWeight is Weight * 5,
	(
	MaxWeight < TotalWeight -> Check2 is 0;
	Check2 is Check1
	).
	
getEmptySpots(0,_,[]).
getEmptySpots(Size, List, [H|T]):-
	Size > 0,
	nth1(Size, List, Spot),
	NSize is Size - 1,
	(
	Spot = [] -> H is Size, getEmptySpots(NSize, List, T);
			getEmptySpots(NSize, List, [H|T])
	).
	
initializePort(0, []).
initializePort(N, [[]|T]):-
	N > 0,
	N1 is N - 1,
	initializePort(N1, T).

generateShip(Ship):-
	random(1, 5, Size),
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

placeOnSpot([Pile|T], Container, PossPile, PossSpot, [Pile|T2]):-
	PossPile > 1,
	NPossPile is PossPile - 1,
	placeOnSpot(T, Container, NPossPile, PossSpot, T2).
placeOnSpot([Pile|T], Container, PossPile, PossSpot, [NPile|T]):-
	PossPile = 1,
	placeOnPile(Pile, Container, PossSpot, NPile).
	
placeOnPile([C|T], Container, PossSpot, [C|T2]):-
	PossSpot > 1,
	NPossSpot is PossSpot - 1,
	placeOnPile(T, Container, NPossSpot, T2).
placeOnPile([H|T], Container, PossSpot, NPile):-
	PossSpot = 1,
	append(Container, H,Aux),
	append(Aux, T, NPile).

placeOnEmpty([_|Told], Container, Empty, Counter, [[Container]|Told]):-
	Empty = Counter.
placeOnEmpty([Hold|Told],Container, Empty, Counter, [Hold|Tnew]):-
	Empty > Counter,
	NCounter is Counter + 1,
	placeOnEmpty(Told,Container, Empty, NCounter, Tnew).

getWeightOnTop([], Counter, Counter).
getWeightOnTop([C|T], Counter, Weight):-
	getContainerWeight(C, Weight),
	NWeight is Weight + Counter,
	getWeightOnTop(T, NWeight, Weight).
	
getNextElement([H|T], E):-
	E = H.
	
dispatcheContainer(H):-
	H = 0 .