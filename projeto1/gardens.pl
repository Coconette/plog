gardens:-
	emptyBoard(Board),
	printBoard(Board).
	
getCellSymbol(emptyCell, ' ').
getCellSymbol(number0Cell, '0').
getCellSymbol(number1Cell, '1').
getCellSymbol(number2Cell, '2').
getCellSymbol(number3Cell, '3').
getCellSymbol(number4Cell, '4').
getCellSymbol(number5Cell, '5').
getCellSymbol(number6Cell, '6').
getCellSymbol(number7Cell, '7').
getCellSymbol(number8Cell, '8').
getCellSymbol(number9Cell, '9').
getCellSymbol(action1Cell, 'V').
getCellSymbol(action2Cell, 'W').
getCellSymbol(action3Cell, 'X').
getCellSymbol(action4Cell, 'Y').
getCellSymbol(action5Cell, 'Z').
		
emptyBoard([
	[number0Cell, number1Cell, number2Cell, number3Cell, number4Cell, number5Cell, number6Cell, number7Cell, number8Cell, number9Cell, number0Cell],
	[number9Cell, emptyCell, emptyCell, emptyCell, emptyCell, emptyCell, emptyCell, emptyCell, emptyCell, emptyCell, number1Cell],
	[number8Cell, emptyCell, emptyCell, emptyCell, emptyCell, emptyCell, emptyCell, emptyCell, emptyCell, emptyCell, number2Cell],
	[number7Cell, emptyCell, emptyCell, emptyCell, emptyCell, emptyCell, emptyCell, emptyCell, emptyCell, emptyCell, number3Cell],
	[number6Cell, emptyCell, emptyCell, emptyCell, emptyCell, emptyCell, emptyCell, emptyCell, emptyCell, emptyCell, number4Cell],
	[number5Cell, emptyCell, emptyCell, emptyCell, emptyCell, emptyCell, emptyCell, emptyCell, emptyCell, emptyCell, number5Cell],
	[number4Cell, emptyCell, emptyCell, emptyCell, emptyCell, emptyCell, emptyCell, emptyCell, emptyCell, emptyCell, number6Cell],
	[number3Cell, emptyCell, emptyCell, emptyCell, emptyCell, emptyCell, emptyCell, emptyCell, emptyCell, emptyCell, number7Cell],
	[number2Cell, emptyCell, emptyCell, emptyCell, emptyCell, emptyCell, emptyCell, emptyCell, emptyCell, emptyCell, number8Cell],
	[number1Cell, emptyCell, emptyCell, emptyCell, emptyCell, emptyCell, emptyCell, emptyCell, emptyCell, emptyCell, number9Cell],
	[number0Cell, number9Cell, number8Cell, number7Cell, number6Cell, number5Cell, number4Cell, number3Cell, number2Cell, number1Cell, number0Cell]]).
	
[action1Cell, action2Cell, action3Cell, action4Cell, action5Cell].

printBoard([]):-
	nl, nl,
	printRow(Actions).
	
printBoard([Head | Tail]):-
	write('| '),
	printRow(Head), nl,
	printBoard(Tail).
	
printRow([]).
printRow([Head | Tail]):-
	getCellSymbol(Head, Piece),
	write(Piece), write(' | '),
	printRow(Tail).