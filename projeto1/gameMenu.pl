chooseOption:-
	nl,
	getChar(Input),
	(
		Input = '1' -> initGame(1, Turn, Board, PlayersInfo), playGame(1, Turn, Board, PlayersInfo);
		Input = '2' -> initGame(2, Turn, Board, PlayersInfo), playGame(2, Turn, Board, PlayersInfo);
		Input = '3' -> initGame(3, Turn, Board, PlayersInfo), playGame(3, Turn, Board, PlayersInfo);
		Input = '4' -> initGame(4, Turn, Board, PlayersInfo), playGame(4, Turn, Board, PlayersInfo);
		Input = '5' -> initGame(5, Turn, Board, PlayersInfo), playGame(5, Turn, Board, PlayersInfo);
		nl,
		write('Error: invalid input.'), nl,
		read(Input), nl,
		initialMenu
	).

initialMenu:-
	nl,nl,
	write('         ******************'), nl,
	write('         * WELCOME TO IO! *'), nl,
	write('         ******************'),
	 nl,nl,nl, 
	write('Please select the number of players:'), nl,
	write('1 player'), nl,
	write('2 players'), nl, 
	write('3 players'), nl,
	write('4 players'), nl,
	write('5 players'), nl,
	chooseOption.
	
getChar(Input):-
	get_char(Input),
	get_char(_).

treeStartMenu(Players, Board, NBoard):-
	treePlacement(1, Board, XBoard),
	treePlacement(2, XBoard, YBoard),
	(
	Players < 3 -> treePlacement(1, YBoard, NBoard);
					treePlacement(3, YBoard, NBoard)
	).
	
treePlacement(Player, Board, NBoard):-
	write('Player 1, input coords to place tree'), nl,
	placeObjectOnBoard(Board, NBoard, 'X', 3, 3).