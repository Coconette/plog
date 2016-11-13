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
	
		
actionMenu(Players, Turn, Board, NBoard, PlayersInfo, NPlayersInfo):-
	write('MAKE AN ACTION'), nl,
	write('Which action do you want to use?'), nl,
	getObjectOnBoard(Board, ActionOne, 0, 12),
	getObjectOnBoard(Board, ActionTwo, 1, 12),
	getObjectOnBoard(Board, ActionThree, 2, 12),
	getObjectOnBoard(Board, ActionFour, 3, 12),
	getObjectOnBoard(Board, ActionFive, 4, 12),
	write('1. Swap a tree and a flower.'),
	(ActionOne = '-' -> write(' (Already used by another player)'), nl; nl),
	write('2. Swap two flowers.'),
	(ActionTwo = '-' -> write(' (Already used by another player)'), nl; nl),
	write('3. Move a flower to an empty space.'),
	(ActionThree = '-' -> write(' (Already used by another player)'), nl; nl),
	write('4. Move a tree to an empty space.'),
	(ActionFour = '-' -> write(' (Already used by another player)'), nl; nl),
	write('5. Move your martian 5 spaces.'),
	(ActionFive = '-' -> write(' (Already used by another player)'), nl; nl),
	getChar(Input), discardInputChar,
	(
	Input = '1' -> (
					ActionOne = '-' -> write('This action has already been used.'), nl,
									 actionMenu(Players, Turn, Board, NBoard, PlayersInfo, NPlayersInfo);
					firstAction(Players, Turn, Board, NBoard, PlayersInfo, NPlayersInfo)
					);
	Input = '2' -> (
					ActionTwo = '-' -> write('This action has already been used.'), nl,
									 actionMenu(Players, Turn, Board, NBoard, PlayersInfo, NPlayersInfo);
					secondAction(Players, Turn, Board, NBoard, PlayersInfo, NPlayersInfo)
					);
	Input = '3' -> (
					ActionThree = '-' -> write('This action has already been used.'), nl,
									 actionMenu(Players, Turn, Board, NBoard, PlayersInfo, NPlayersInfo);
					thirdAction(Players, Turn, Board, NBoard, PlayersInfo, NPlayersInfo)
					);
	Input = '4' -> (
					ActionFour = '-' -> write('This action has already been used.'), nl,
									 actionMenu(Players, Turn, Board, NBoard, PlayersInfo, NPlayersInfo);
					fourthAction(Players, Turn, Board, NBoard, PlayersInfo, NPlayersInfo)
					);
	Input = '5' -> (
					ActionFive = '-' -> write('This action has already been used.'), nl,
									 actionMenu(Players, Turn, Board, NBoard, PlayersInfo, NPlayersInfo);
					fifthAction(Players, Turn, Board, NBoard, PlayersInfo, NPlayersInfo)
					);
	write('Invalid input.')
	).
	
flowerPlacementMenu(Players, Turn, Board, NBoard, PlayersInfo, NPlayersInfo):-
	getPlayerInfo(PlayersInfo, Turn, Purple, Red, Blue, Yellow, White, Green, Action, Position, Laps, 0),
	write('FLOWER PLACEMENT'), nl,
	write('Which type of flower do you wish to place?'), nl,
	write('1. $ ('), write(Purple), write(' remaining)'), nl,
	write('2. & ('), write(Red), write(' remaining)'), nl,
	write('3. # ('), write(Blue), write(' remaining)'), nl,
	write('4. * ('), write(Yellow), write(' remaining)'), nl,
	write('5. + ('), write(White), write(' remaining)'), nl,
	write('6. @ ('), write(Green), write(' remaining)'), nl,
	getChar(Input), discardInputChar,
	(
	Input = '1' -> (
					Purple > 0 -> write('Input coords to place $ flower'), nl,
								inputCoords(Row, Col),
								placeObjectOnBoard(Board, XBoard, '$', Row, Col),
								getScore(NBoard, '$', Row, Col, 0, 0, Score),
								write('You scored '), write(Score), write(' points this turn.'), nl,
								updatePosition(Turn, Position, Laps, Score, NPosition, NLaps, XBoard, NBoard, 0, 0),
								NPurple is Purple - 1,
								updatePlayersInfo(Players, PlayersInfo, Turn, NPurple, Red, Blue, Yellow, White, Green, Action, NPosition, NLaps, NPlayersInfo);
					write('You have no $ flowers left. Please try again.'),
					flowerPlacementMenu(Players, Turn, Board, NBoard, PlayersInfo, NPlayersInfo)
					);
	Input = '2' -> (
					Red > 0 -> write('Input coords to place & flower'), nl,
								inputCoords(Row, Col),
								placeObjectOnBoard(Board, NBoard, '&', Row, Col),
								getScore(NBoard, '&', Row, Col, 0, 0, Score),
								write('You scored '), write(Score), write(' points this turn.'), nl,
								updatePosition(Turn, Position, Laps, Score, NPosition, NLaps, Board, NBoard, 0, 1),
								NRed is Red - 1,
								updatePlayersInfo(Players, PlayersInfo, Turn, Purple, NRed, Blue, Yellow, White, Green, Action, NPosition, NLaps, NPlayersInfo);
					write('You have no & flowers left. Please try again.'),
					flowerPlacementMenu(Players, Turn, Board, NBoard, PlayersInfo, NPlayersInfo)
					);
	Input = '3' -> (
					Blue > 0 -> write('Input coords to place # flower'), nl,
								inputCoords(Row, Col),
								placeObjectOnBoard(Board, NBoard, '#', Row, Col),
								getScore(NBoard, '#', Row, Col, 0, 0, Score),
								write('You scored '), write(Score), write(' points this turn.'), nl,
								updatePosition(Turn, Position, Laps, Score, NPosition, NLaps, Board, NBoard, 0, 1),
								NBlue is Blue - 1,
								updatePlayersInfo(Players, PlayersInfo, Turn, Purple, Red, NBlue, Yellow, White, Green, Action, NPosition, NLaps, NPlayersInfo);
					write('You have no # flowers left. Please try again.'),
					flowerPlacementMenu(Players, Turn, Board, NBoard, PlayersInfo, NPlayersInfo)
					);
	Input = '4' -> (
					Yellow > 0 -> write('Input coords to place * flower'), nl,
								inputCoords(Row, Col),
								placeObjectOnBoard(Board, NBoard, '*', Row, Col),
								getScore(NBoard, '+', Row, Col, 0, 0, Score),
								write('You scored '), write(Score), write(' points this turn.'), nl,
								updatePosition(Turn, Position, Laps, Score, NPosition, NLaps, Board, NBoard, 0, 1),
								NYellow is Yellow - 1,
								updatePlayersInfo(Players, PlayersInfo, Turn, Purple, Red, Blue, NYellow, White, Green, Action, NPosition, NLaps, NPlayersInfo);
					write('You have no * flowers left. Please try again.'),
					flowerPlacementMenu(Players, Turn, Board, NBoard, PlayersInfo, NPlayersInfo)
					);
	Input = '5' -> (
					White > 0 -> write('Input coords to place + flower'), nl,
								inputCoords(Row, Col),
								placeObjectOnBoard(Board, NBoard, '+', Row, Col),
								getScore(NBoard, '+', Row, Col, 0, 0, Score),
								write('You scored '), write(Score), write(' points this turn.'), nl,
								updatePosition(Turn, Position, Laps, Score, NPosition, NLaps, Board, NBoard, 0, 1),
								NWhite is White - 1,
								updatePlayersInfo(Players, PlayersInfo, Turn, Purple, Red, Blue, Yellow, NWhite, Green, Action, NPosition, NLaps, NPlayersInfo);
					write('You have no + flowers left. Please try again.'),
					flowerPlacementMenu(Players, Turn, Board, NBoard, PlayersInfo, NPlayersInfo)
					);
	Input = '6' -> (
					Green > 0 -> write('Input coords to place @ flower'), nl,
								inputCoords(Row, Col),
								placeObjectOnBoard(Board, NBoard, '@', Row, Col),
								getScore(NBoard, '@', Row, Col, 0, 0, Score),
								write('You scored '), write(Score), write(' points this turn.'), nl,
								updatePosition(Turn, Position, Laps, Score, NPosition, NLaps, Board, NBoard, 0, 1),
								NGreen is Green - 1,
								updatePlayersInfo(Players, PlayersInfo, Turn, Purple, Red, Blue, Yellow, White, NGreen, Action, NPosition, NLaps, NPlayersInfo);
					write('You have no @ flowers left. Please try again.'),
					flowerPlacementMenu(Players, Turn, Board, NBoard, PlayersInfo, NPlayersInfo)
					);
	write('Invalid input.'), nl
	).

turnMenu(Players, Turn, Board, PlayersInfo, NBoard, NPlayersInfo):-
	getPlayerInfo(PlayersInfo, Turn, Purple, Red, Blue, Yellow, White, Green, Action, Position, Laps, 0),
	write('Player '), write(Turn), write(' turn. You have completed '), write(Laps), write(' laps. Please select an option.'), nl,
	write('1. PLACE FLOWER'), nl,
	write('2. USE AN ACTION'), nl, nl,
	getChar(Input), discardInputChar,
	(
	Input = '1' -> flowerPlacementMenu(Players, Turn, Board, NBoard, PlayersInfo, NPlayersInfo);
	Input = '2' -> (
					Players > 2 -> (
									Action = 0 -> actionMenu(Players, Turn, Board, NBoard, PlayersInfo, NPlayersInfo);
									write('You already used an action.'), nl,
									turnMenu(Players, Turn, Board, PlayersInfo, NBoard, NPlayersInfo)
									);
					Players = 2 -> (
									Action < 2 -> actionMenu(Players, Turn, Board, NBoard, PlayersInfo, NPlayersInfo);
									write('You already used two actions.'), nl,
									turnMenu(Players, Turn, Board, PlayersInfo, NBoard, NPlayersInfo)
									);
					write('Error.'), nl
					);
	write('Invalid input..'), nl
	).
		
inputCoords(SrcRow, SrcCol):-
	% read row
	getInt(RawSrcRow),
	
	discardInputChar,

	% read column
	getInt(RawSrcCol),

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