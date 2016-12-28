:- use_module(library(random)).
:- use_module(library(lists)).

startPort :-
	write('Type the size of the Port: '),
	read(Size),
	initializePort(Size, Port),
	optionMenu(Size, Port).
	
tester :-
	test1(Port),
	write(Port), nl, nl,
	test2(Ship),
	write(Ship), nl, nl,
	placeContainers(3, Port, Ship, NPort).
	
test1(Port):-
	Port = [[[10, 15, 16], [5, 20, 15]], [[10, 15, 16], [5, 20, 15]],[[10, 15, 16], [5, 20, 15]]].
test2(Ship) :-
	Ship = [[8, 3, 20]].
	
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

placeContainers(_,Port,List, Port):-
	List = [].
placeContainers(Size, Port, [Container|T], NPort):-
	getEmptySpot(Size, Port, EmptySpot),
	(
	EmptySpot > 0 -> placeOnEmpty(Port, Container, EmptySpot, 1, XPort);
	getPossibleSpot(1, Size, Port, Container, PossPile, PossSpot),
	(
	PossPile > 0 -> (
					PossSpot > 0 -> write('Possible to place on pile '), write(PossPile),
									write(' on position '), write(PossSpot), nl,
									placeOnSpot(Port, Container, PossPile, PossSpot, XPort);
					write('No place available to place container.'), nl,
					XPort is Port
					);
	write('No place available to place container.'), nl,
	XPort = Port
	)
	),
	placeContainers(Size, XPort, T, NPort).	
	
getPossibleSpot(Counter, Size,_,_, 0, 0):-
	Size < Counter.
getPossibleSpot(Counter, Size, [Pile|T], Container, PossPile, PossSpot):-
	write('Checking Pile '), write(Counter), write(' for possible placing spots'), nl,
	checkPileDim(Pile, Container, 1, Possible),
	write('Dim Possible:'), write(Possible), nl,
	checkBottomWei(Pile, Container, 1, Possible, Check1),
	write('BottWei Possible:'), write(Check1), nl,
	checkTopWei(Pile, Container, 1, Check1, Check2),
	write('TopWei Possible:'), write(Check2), nl, nl,
	(
	Check2 > 0 -> PossSpot is Check2,
					PossPile is Size - Counter;
	NCounter is Counter + 1,
	getPossibleSpot(NCounter, Size, T, Container, PossPile, PossSpot)
	).

checkPileDim([C1|[]], Container, Counter, Possible):-
	Possible is Counter + 1.
checkPileDim([C1|[C2|T]], Container, Counter, Possible):-
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
checkTopWei(Pile, Container, Counter, Check1, Check2):-
	Check1 = Counter,
	getContainerWeight(Container, Weight),
	getWeightOnTop(Pile, 0, TotalWeight),
	write('Total Weight On Top '), write(TotalWeight), nl,
	MaxWeight is Weight * 5,
	(
	MaxWeight < TotalWeight -> Check2 is 0;
	Check2 is Check1
	).
	
getEmptySpot(0,_,0).
getEmptySpot(Size, List, Empty):-
	Size > 0,
	nth1(Size, List, Spot),
	NSize is Size - 1,
	(
	Spot = [] -> Empty is Size;
	getEmptySpot(NSize, List, Empty)
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
	
placeOnSpot([H1|T1], Container, PossPile, PossSpot, [H1|T2]):-
	PossPile > 1,
	NPossPile is PossPile - 1,
	placeOnSpot([T1], Container, NPossPile, PossSpot, [T2]).	
placeOnSpot([Pile|T], Container, PossPile, PossSpot, [NPile|T]):-
	PossPile = 1,
	placeOnPile(Pile, Container, PossSpot, NPile).
	
placeOnPile([C|T], Container, PossSpot, [C|T2]):-
	PossSpot > 1,
	NPossSpot is PossSpot - 1,
	placeOnPile(T, Container, NPossSpot, T2).
placeOnPile(Pile, Container, PossSpot, [Container|Pile]):-
	PossSpot = 1.

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