initializeBoard(Board):-
	Board = [
	['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '0'],
	['9', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', 'B'],
	['8', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', '2'],
	['7', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', '3'],
	['6', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', '4'],
	['5', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', '5'],
	['4', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', '6'],
	['3', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', '7'],
	['2', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', '8'],
	['1', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', '9'],
	['0', '9', '8', '7', '6', '5', '4', '3', '2', '1', '0'],
	[],
	['V', 'W', 'X', 'Y', 'Z']
	],
	write('Board Successfully Generated'), nl.
	
printBoard([]).
printBoard([Head | Tail]):-
	write('| '),
	printRow(Head), nl,
	printBoard(Tail).
	
printRow([]).
printRow([Head | Tail]):-
	write(Head), write(' | '),
	printRow(Tail).
	
placeObjectOnBoard([Head | RemainingRows], [NewRow | RemainingRows], Object, Column, 0):-
	placeObjectOnRow(Head, NewRow, Object, Column).
placeObjectOnBoard([Head | RemainingRows], [Head | NewRemainingRows], Object, Column, Row):-
	(
	NewRow is Row-1,
	placeObjectOnBoard(RemainingRows, NewRemainingRows, Object, Column, NewRow)
	).

placeObjectOnRow([H|L], [Object|L], Object, 0).
placeObjectOnRow([H|L], [H|NL], Object, Column):-
	Column > 0,
	NewCol is Column-1,
	placeObjectOnRow(L, NL, Object, NewCol).
	
getObjectOnBoard([Head | Tail], Object, Column, 0):-
	getObjectOnRow(Head, Object, Column).
getObjectOnBoard([Head | Tail], Object, Column, Row):-
	NewRow is Row-1,
	getObjectOnBoard(Tail, Object, Column, NewRow).
	
getObjectOnRow([Head | Tail], Object, 0):-
	Object = Head.
getObjectOnRow([Head | Tail], Object, Column):-
	Column > 0,
	NewCol is Column - 1,
	getObjectOnRow(Tail, Object, NewCol).