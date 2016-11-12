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

chooseOption:-
	nl,
	getChar(Input),
	discardInputChar,
	(
		Input = '1' -> initGame(1, Turn, Board, PlayersInfo), playGame(1, Turn, Board, PlayersInfo);
		Input = '2' -> initGame(2, Turn, Board, PlayersInfo), playGame(2, Turn, Board, PlayersInfo);
		Input = '3' -> initGame(3, Turn, Board, PlayersInfo), playGame(3, Turn, Board, PlayersInfo);
		Input = '4' -> initGame(4, Turn, Board, PlayersInfo), playGame(4, Turn, Board, PlayersInfo);
		Input = '5' -> initGame(5, Turn, Board, PlayersInfo), playGame(5, Turn, Board, PlayersInfo);
		nl,
		write('Error: invalid input.'), nl
	).

treeStartMenu(Players, Board, NBoard):-
	treePlacement(1, Board, XBoard),
	treePlacement(2, XBoard, YBoard),
	(
	Players < 3 -> treePlacement(1, YBoard, NBoard);
					treePlacement(3, YBoard, NBoard)
	).
	
treePlacement(Player, Board, NBoard):-
	write('Player '), write(Player), write(' input coords to place tree [Row:Col] and press [ENTER]'), nl,
	inputCoords(Row, Col),
	placeObjectOnBoard(Board, NBoard, 'X', Row, Col),
	printBoard(NBoard), nl.
		
inputCoords(SrcRow, SrcCol):-
	% read row
	getInt(RawSrcRow),
	write('ROW: '), write(RawSrcRow), nl,
	
	discardInputChar,

	% read column
	getInt(RawSrcCol),
	write('COL: '), write(RawSrcCol), nl,

	% discard enter
	discardInputChar,

	% process row and column
	SrcRow is RawSrcRow,
	SrcCol is RawSrcCol.

getChar(Input):-
	get_char(Input),
	get_char(_).

getCode(Input):-
	get_code(TempInput),
	get_code(_),
	Input is TempInput - 48.

getInt(Input):-
	get_code(TempInput),
	Input is TempInput - 48.

discardInputChar:-
	get_code(_).