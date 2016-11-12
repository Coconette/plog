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
		Input = '1' -> initGame(1, Turn, Board, PlayersInfo),		
					treeStartMenu(1, Board, NBoard),
					playGame(1, Turn, NBoard, PlayersInfo);
		Input = '2' -> initGame(2, Turn, Board, PlayersInfo),		
					treeStartMenu(2, Board, NBoard),
					playGame(2, Turn, NBoard, PlayersInfo);
		Input = '3' -> initGame(3, Turn, Board, PlayersInfo),		
					treeStartMenu(3, Board, NBoard),
					playGame(3, Turn, NBoard, PlayersInfo);
		Input = '4' -> initGame(4, Turn, Board, PlayersInfo),		
					treeStartMenu(4, Board, NBoard),
					playGame(4, Turn, NBoard, PlayersInfo);
		Input = '5' -> initGame(5, Turn, Board, PlayersInfo),		
					treeStartMenu(5, Board, NBoard),
					playGame(5, Turn, NBoard, PlayersInfo);
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
	write('Player '), write(Player), write(' input coords to place tree [Col:Row] and press [ENTER]'), nl,
	inputCoords(Row, Col),
	placeObjectOnBoard(Board, NBoard, 'X', Row, Col),
	printBoard(NBoard), nl.

playMenu(Turn, Board, PlayerInfo, NBoard, NPlayersInfo):-
	write('It is player '), write(Turn), write(' turn. Please select an option:'), nl,
	write('1. Place a flower on the board'), nl,
	printPlayerFlowers(PlayerInfo, Turn, 0).

		
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