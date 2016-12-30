:- use_module(library(random)).
:- use_module(library(lists)).

startPort:-
	write('Type the size of the Port: '),
	read(Size),
	initializePort(Size, Port),
	optionMenu(Size, Port).
	
tester:-
	test1(Port),
	printPort(Port, 0),
	test3(Container),
	printContainer(Container),
	placeOnSpot(Port, Container, 2, 2, NPort),
	printPort(NPort, 0).
	
test1(Port):-
	Port = [[[10, 15, 16], [5, 20, 15]], [[10, 15, 16], [5, 20, 15]],[[10, 15, 16], [5, 20, 15]]].
test2(Ship):-
	Ship = [[8, 30, 20], [30, 10, 16]].
test3(Container):-
	Container = [8, 30, 20].

optionMenu(Size, Port):-
	write(Port), nl,
	write('OPTIONS'), nl,
	write('1. Get new ship.'), nl,
	write('2. Exit.'), nl,
	read(Option),
	(
	Option = 1 -> arriveShip(Size, Port, NPort), optionMenu(Size, NPort);
	Option > 2 -> optionMenu(Size, Port);
	write('End')
	).
	
arriveShip(Size, Port, NPort):-
	generateShip(Ship),
	write('---SHIP---'), nl, printShip(Ship), nl,
	placeContainers(Size, Port, Ship, NPort).

placeContainers(_,Port,Ship,Port):-
	Ship = [].
placeContainers(Size, Port, [Container|T], NPort):-
	getEmptySpot(Size, Port, EmptySpot),
	(
	EmptySpot > 0 -> placeOnEmpty(Port, Container, EmptySpot, 1, XPort);
	getPossibleSpot(1, Size, Port, Container, PossPile, PossSpot),
	write('Out of PossSpots with '), write(PossPile), write(' and '), write(PossSpot), nl,
	(
	PossPile > 0 -> (
					PossSpot > 0 -> write('Placing '), printContainer(Container),
									write('Pile: '), write(PossPile), write('   Spot: '), write(PossSpot),
									placeOnSpot(Port, Container, PossPile, PossSpot, XPort),
									write('placed'), nl;
					write('Not possible to place '), printContainer(Container), nl,
					XPort = Port
					);
	write('Not possible to place '), printContainer(Container), nl,
	XPort = Port
	)
	),
	placeContainers(Size, XPort, T, NPort).	

getPossibleSpot(Counter, Size,_,_, 0, 0):-
	Size < Counter.
getPossibleSpot(Counter, Size, [Pile|T], Container, PossPile, PossSpot):-
	write('Trying to place '), printContainer(Container),
	write('into '), nl, printPile(Pile), nl,
	NCounter is Counter + 1,
	write('going to check dim.'), nl,
	checkPileDim(Pile, Container, 1, DimCheck),
	write('DimCheck: '), write(DimCheck),
	write('going to check botwei.'), nl,
	checkBottomWei(Pile, Container, 1, DimCheck, BotWeiCheck),
	write('   BottomWeiCheck: '), write(BotWeiCheck),
	write('going to check topwei.'), nl,
	checkTopWei(Pile, Container, 1, BotWeiCheck, TopWeiCheck),
	write('   TopWeiCheck: '), write(TopWeiCheck), nl,
	(
	TopWeiCheck > 0 -> PossPile is Counter,
						PossSpot is TopWeiCheck;
	getPossibleSpot(NCounter, Size, T, Container, PossPile, PossSpot)
	).

checkPileDim([],_, Counter, Counter).
checkPileDim([C1|T], Container, Counter, Possible):-
	NCounter is Counter + 1,
	getContainerDimension(Container, Dim),
	getContainerDimension(C1, D1),
	(
	D1 > Dim -> checkPileDim(T, Container, NCounter, Possible);
	Possible is Counter
	).

checkBottomWei(_,_,_,0, 0):-
	write(' TB1').
checkBottomWei(_,_,Counter, Spot, Spot):-
	Counter = Spot,
	write(' TB2').
checkBottomWei([C1|T], Container, Counter, Spot, Poss):-
	Spot > Counter,
	write(' TB3'),
	NCounter is Counter + 1,
	getContainerWeight(Container, W2),
	getContainerWeight(C1, W1),
	getWeightOnTop(T, 0, TotalWeight),
	NewTotalWeight is TotalWeight + W2, 
	MaximumWeight is W1 * 5,
	(
	MaximumWeight > NewTotalWeight -> checkBottomWei(T, Container, NCounter, Spot, Poss);
	Poss is 0
	).

checkTopWei(_,_,_,0,0):-
	write(' TT1').
checkTopWei([_|T], Container, Counter, Check1, Check2):-
	Check1 > 0,
	Counter < Check1,
	write(' TT3'),
	NCounter is Counter + 1,
	checkTopWei(T, Container, NCounter, Check1, Check2).
checkTopWei(Pile, Container, Counter, Check1, Check2):-
	Check1 = Counter,
	write(' TT2'),
	getContainerWeight(Container, Weight),
	getWeightOnTop(Pile, 0, TotalWeight),
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
	random(1, 2, Size),
	generateNContainers(Size, Ship).

printPort([],_):-
	nl.
printPort(Port,0):-
	write('-----PORT-----'), nl,
	printPort(Port, 1).
printPort([Pile|T], Counter):-
	write('---PILE '), write(Counter), write('---'), nl,
	printPile(Pile),
	NCounter is Counter + 1,
	printPort(T, NCounter).
printPile([]).
printPile([Container|T2]):-
	printContainer(Container),
	printPile(T2).
	
printContainer(Container):-
	getContainerWeight(Container, Weight),
	getContainerDimension(Container, Dimension),
	getContainerDate(Container, Date),
	write('-Container'), write('   Dimension: '), write(Dimension), write('   Weight: '), write(Weight),
	write('   Date: '), write(Date), nl.

printShip([]).
printShip([Container|T]):-
	printContainer(Container),
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
	
placeOnSpot([H1|T1], Container, PossPile, PossSpot, [H1|T2]):-
	PossPile > 1,
	NPossPile is PossPile - 1,
	placeOnSpot(T1, Container, NPossPile, PossSpot, T2).	
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
getWeightOnTop([C|[]], Counter, TotalWeight):-
	getContainerWeight(C, Weight),
	TotalWeight is Counter + Weight.
getWeightOnTop([C|T], Counter, TotalWeight):-
	getContainerWeight(C, Weight),
	NWeight is Counter + Weight,
	getWeightOnTop(T, NWeight, TotalWeight).
	
getNextElement([H|_], E):-
	E = H.
	
dispatcheContainer(H):-
	H = 0 .