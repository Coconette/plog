:- use_module(library(random)).
:- include('gameMenu.pl').
:- include('boardManager.pl').
:- include('update.pl').
:- include('actions.pl').
	
test:-
	initializeBoard(Board),
	botPickCoords(Row, Column, 1, Board),
	write('Coords: '), write(Row), write(':'), write(Column).

gardens:-
	initialMenu.

initGame(Players, Board, PlayersInfo):-
	initializeBoard(Board),
	generatePlayersInfo(Players, PlayersInfo), !.
	
generatePlayersInfo(Players, PlayersInfo):-
	Players = 1 -> PlayersInfo =[
							[Pur1, Red1, Blu1, Yel1, Whi1, Gre1, 0, 0, 0],
							[Pur2, Red2, Blu2, Yel2, Whi2, Gre2, 0, 0, 0]],
					randomizePlayerFlowers(27, 0, Pur1, Red1, Blu1, Yel1, Whi1, Gre1, 0, 0, 0, 0, 0, 0),
					randomizePlayerFlowers(27, 0, Pur2, Red2, Blu2, Yel2, Whi2, Gre2, 0, 0, 0, 0, 0, 0),
					write('Flowers Successfully Generated'),nl, nl;
	Players = 2 -> PlayersInfo = [
							[Pur1, Red1, Blu1, Yel1, Whi1, Gre1, 0, 0, 0],
							[Pur2, Red2, Blu2, Yel2, Whi2, Gre2, 0, 0, 0]],
					randomizePlayerFlowers(27, 0, Pur1, Red1, Blu1, Yel1, Whi1, Gre1, 0, 0, 0, 0, 0, 0),
					randomizePlayerFlowers(27, 0, Pur2, Red2, Blu2, Yel2, Whi2, Gre2, 0, 0, 0, 0, 0, 0),
					write('Flowers Successfully Generated'),nl, nl;
	Players = 3 -> PlayersInfo = [
							[Pur1, Red1, Blu1, Yel1, Whi1, Gre1, 0, 0, 0],
							[Pur2, Red2, Blu2, Yel2, Whi2, Gre2, 0, 0, 0],
							[Pur3, Red3, Blu3, Yel3, Whi3, Gre3, 0, 0, 0]],
					randomizePlayerFlowers(2, 0, Pur1, Red1, Blu1, Yel1, Whi1, Gre1, 0, 0, 0, 0, 0, 0),
					randomizePlayerFlowers(2, 0, Pur2, Red2, Blu2, Yel2, Whi2, Gre2, 0, 0, 0, 0, 0, 0),
					randomizePlayerFlowers(2, 0, Pur3, Red3, Blu3, Yel3, Whi3, Gre3, 0, 0, 0, 0, 0, 0),
					write('Flowers Successfully Generated'), nl, nl;
	Players = 4 -> PlayersInfo = [
							[Pur1, Red1, Blu1, Yel1, Whi1, Gre1, 0, 0, 0],
							[Pur2, Red2, Blu2, Yel2, Whi2, Gre2, 0, 0, 0],
							[Pur3, Red3, Blu3, Yel3, Whi3, Gre3, 0, 0, 0],
							[Pur4, Red4, Blu4, Yel4, Whi4, Gre4, 0, 0, 0]],
					randomizePlayerFlowers(14, 0, Pur1, Red1, Blu1, Yel1, Whi1, Gre1, 0, 0, 0, 0, 0, 0),
					randomizePlayerFlowers(14, 0, Pur2, Red2, Blu2, Yel2, Whi2, Gre2, 0, 0, 0, 0, 0, 0),
					randomizePlayerFlowers(14, 0, Pur3, Red3, Blu3, Yel3, Whi3, Gre3, 0, 0, 0, 0, 0, 0),
					randomizePlayerFlowers(14, 0, Pur4, Red4, Blu4, Yel4, Whi4, Gre4, 0, 0, 0, 0, 0, 0),
					write('Flowers Successfully Generated'), nl, nl;
	Players = 5 -> PlayersInfo = [
							[Pur1, Red1, Blu1, Yel1, Whi1, Gre1, 0, 0, 0],
							[Pur2, Red2, Blu2, Yel2, Whi2, Gre2, 0, 0, 0],
							[Pur3, Red3, Blu3, Yel3, Whi3, Gre3, 0, 0, 0],
							[Pur4, Red4, Blu4, Yel4, Whi4, Gre4, 0, 0, 0],
							[Pur5, Red5, Blu5, Yel5, Whi5, Gre5, 0, 0, 0]],
					randomizePlayerFlowers(11, 0, Pur1, Red1, Blu1, Yel1, Whi1, Gre1, 0, 0, 0, 0, 0, 0),
					randomizePlayerFlowers(11, 0, Pur2, Red2, Blu2, Yel2, Whi2, Gre2, 0, 0, 0, 0, 0, 0),
					randomizePlayerFlowers(11, 0, Pur3, Red3, Blu3, Yel3, Whi3, Gre3, 0, 0, 0, 0, 0, 0),
					randomizePlayerFlowers(11, 0, Pur4, Red4, Blu4, Yel4, Whi4, Gre4, 0, 0, 0, 0, 0, 0),
					randomizePlayerFlowers(11, 0, Pur5, Red5, Blu5, Yel5, Whi5, Gre5, 0, 0, 0, 0, 0, 0),
					write('Flowers Successfully Generated'), nl, nl;
	write('Error Creating Game'), nl.	

randomizePlayerFlowers(Flowers, Total, Purple, Red, Blue, Yellow, White, Green, C1, C2, C3, C4, C5, C6):-
	random(0, 6, NewFlower),
	NTotal is Total + 1,
	(
	NTotal > Flowers -> finalizeFlowers(Purple, Red, Blue, Yellow, White, Green, C1, C2, C3, C4, C5, C6);
	NewFlower = 0 -> NCount is C1 + 1,
						randomizePlayerFlowers(Flowers, NTotal, Purple, Red, Blue, Yellow, White, Green, NCount, C2, C3, C4, C5, C6);
	NewFlower = 1 -> NCount is C2 + 1,
						randomizePlayerFlowers(Flowers, NTotal, Purple, Red, Blue, Yellow, White, Green, C1, NCount, C3, C4, C5, C6);
	NewFlower = 2 -> NCount is C3 + 1,
						randomizePlayerFlowers(Flowers, NTotal, Purple, Red, Blue, Yellow, White, Green, C1, C2, NCount, C4, C5, C6);
	NewFlower = 3 -> NCount is C4 + 1,
						randomizePlayerFlowers(Flowers, NTotal, Purple, Red, Blue, Yellow, White, Green, C1, C2, C3, NCount, C5, C6);
	NewFlower = 4 -> NCount is C5 + 1,
						randomizePlayerFlowers(Flowers, NTotal, Purple, Red, Blue, Yellow, White, Green, C1, C2, C3, C4, NCount, C6);
	NewFlower = 5 -> NCount is C6 + 1,
						randomizePlayerFlowers(Flowers, NTotal, Purple, Red, Blue, Yellow, White, Green, C1, C2, C3, C4, C5, NCount);

	write('Error Generating Flowers'), nl).
	
finalizeFlowers(Purple, Red, Blue, Yellow, White, Green, C1, C2, C3, C4, C5, C6):-
	Purple is C1,
	Red is C2,
	Blue is C3,
	Yellow is C4,
	White is C5,
	Green is C6.	

getPlayerInfo([Head | Tail], Player, Purple, Red, Blue, Yellow, White, Green, Action, Position, Laps, Count):-
	NCount is Count + 1,
	(
	NCount = Player -> getInfo(Head, Purple, Red, Blue, Yellow, White, Green, Action, Position, Laps, 0);
	getPlayerInfo(Tail, Player, Purple, Red, Blue, Yellow, White, Green, Action, Position, Laps, NCount)
	).

getInfo([Head | Tail], Purple, Red, Blue, Yellow, White, Green, Action, Position, Laps, Count):-
	NCount is Count + 1,
	(
	NCount = 1 -> Purple is Head,
					getInfo(Tail, Purple, Red, Blue, Yellow, White, Green, Action, Position, Laps, NCount);
	NCount = 2 -> Red is Head,
					getInfo(Tail, Purple, Red, Blue, Yellow, White, Green, Action, Position, Laps, NCount);
	NCount = 3 -> Blue is Head,
					getInfo(Tail, Purple, Red, Blue, Yellow, White, Green, Action, Position, Laps, NCount);
	NCount = 4 -> Yellow is Head,
					getInfo(Tail, Purple, Red, Blue, Yellow, White, Green, Action, Position, Laps, NCount);
	NCount = 5 -> White is Head,
					getInfo(Tail, Purple, Red, Blue, Yellow, White, Green, Action, Position, Laps, NCount);
	NCount = 6 -> Green is Head,
					getInfo(Tail, Purple, Red, Blue, Yellow, White, Green, Action, Position, Laps, NCount);
	NCount = 7 -> Action is Head,
					getInfo(Tail, Purple, Red, Blue, Yellow, White, Green, Action, Position, Laps, NCount);
	NCount = 8 -> Position is Head,
					getInfo(Tail, Purple, Red, Blue, Yellow, White, Green, Action, Position, Laps, NCount);
	NCount = 9 -> Laps is Head;
	write('Error getting player information!'), nl
	).	

playGame(Players, Turn, Board, PlayersInfo):-
	turnMenu(Players, Turn, Board, PlayersInfo, NBoard, NPlayersInfo),
	printBoard(NBoard),
	checkEndGame(Turn, NPlayersInfo, End),
	(
	End = 0 -> 
	(Turn = Players -> playGame(Players, 1, NBoard, NPlayersInfo);
	increment(Turn, NTurn),
	playGame(Players, NTurn, NBoard, NPlayersInfo)
	);
	checkWinner(Players, NPlayersInfo)
	).
	
playAgainstBot(Board, PlayersInfo):-
	turnMenu(2, 1, Board, PlayersInfo, XBoard, XPlayersInfo),
	printBoard(XBoard),
	checkEndGame(1, XPlayersInfo, End1),
	(
	End1 = 0 -> write('Computer turn.'), nl,
				botPlay(XPlayersInfo, NPlayersInfo, XBoard, NBoard),
				printBoard(NBoard),
				checkEndGame(2, NPlayersInfo, End2),
				(
				End2 = 0 -> playAgainstBot(NBoard, NPlayersInfo);
				checkWinner(2, NPlayersInfo)
				);
	checkWinner(2, NPlayersInfo)
	).
	
botPlay(PlayersInfo, NPlayersInfo, Board, NBoard):-
	getPlayerInfo(PlayersInfo, 2, Purple, Red, Blue, Yellow, White, Green, Action, Position, Laps, 0),
	random(0, 10, Choice),
	(
	Action < 2 ->
				(
				Choice = 1 ->	getObjectOnBoard(Board, ActionOne, 0, 12),
								(
								ActionOne = 'V' -> botPickCoords(TreeRow, TreeCol, 2, Board),
													botPickCoords(FlowerRow, FlowerCol, 1, Board),
													getObjectOnBoard(Board, Flower, FlowerCol, FlowerRow),
													placeObjectOnBoard(Board, XBoard, Flower, TreeCol, TreeRow),
													placeObjectOnBoard(XBoard, NBoard, 'T', FlowerCol, FlowerRow),
													NewAction is Action + 1,
													updatePlayersInfo(2, PlayersInfo, 2, Purple, Red, Blue, Yellow, White, Green, NewAction, Position, Laps, NPlayersInfo),
												write('Computer used Action One'), nl;
								botPlay(PlayersInfo, NPlayersInfo, Board, NBoard)
								);
				Choice = 2 ->	getObjectOnBoard(Board, ActionTwo, 1, 12),
								(
								ActionTwo = 'W' -> botPickCoords(OneRow, OneCol, 1, Board),
													botPickCoords(TwoRow, TwoCol, 1, Board),
													getObjectOnBoard(Board, FlowerOne, OneCol, OneRow),
													getObjectOnBoard(Board, FlowerTwo, TwoCol, TwoRow),
													placeObjectOnBoard(Board, XBoard, FlowerOne, TwoCol, TwoRow),
													placeObjectOnBoard(XBoard, NBoard, FlowerTwo, OneCol, OneRow),
													NewAction is Action + 1,
													updatePlayersInfo(2, PlayersInfo, 2, Purple, Red, Blue, Yellow, White, Green, NewAction, Position, Laps, NPlayersInfo),
												write('Computer used Action Two'), nl;
								botPlay(PlayersInfo, NPlayersInfo, Board, NBoard)
								);
				Choice = 3 ->	getObjectOnBoard(Board, ActionThree, 2, 12),
								(
								ActionThree = 'X' -> botPickCoords(FlowerRow, FlowerCol, 1, Board),
													botPickCoords(EmptyRow, EmptyCol, 0, Board),
													getObjectOnBoard(Board, Flower, FlowerCol, FlowerRow),
													placeObjectOnBoard(Board, XBoard, Flower, EmptyCol, EmptyRow),
													placeObjectOnBoard(XBoard, NBoard, ' ', FlowerCol, FlowerRow),
													NewAction is Action + 1,
													updatePlayersInfo(2, PlayersInfo, 2, Purple, Red, Blue, Yellow, White, Green, NewAction, Position, Laps, NPlayersInfo),
												write('Computer used Action Three'), nl;
								botPlay(PlayersInfo, NPlayersInfo, Board, NBoard)
								);
				Choice = 4 ->	getObjectOnBoard(Board, ActionFour, 3, 12),
								(
								ActionFour = 'Y' -> botPickCoords(TreeRow, TreeCol, 2, Board),
													botPickCoords(EmptyRow, EmptyCol, 0, Board),
													placeObjectOnBoard(Board, XBoard, 'T', EmptyCol, EmptyRow),
													placeObjectOnBoard(XBoard, NBoard, ' ', TreeCol, TreeRow),
													NewAction is Action + 1,
													updatePlayersInfo(2, PlayersInfo, 2, Purple, Red, Blue, Yellow, White, Green, NewAction, Position, Laps, NPlayersInfo),
												write('Computer used Action Four'), nl;
								botPlay(PlayersInfo, NPlayersInfo, Board, NBoard)
								);
				Choice = 5 ->	getObjectOnBoard(Board, ActionFive, 4, 12),
								(
								ActionFive = 'Z' -> updatePosition(2, Position, Laps, 5, NPosition, NLaps, Board, XBoard, 0, 0),
													updatePlayersInfo(2, PlayersInfo, 2, Purple, Red, Blue, Yellow, White, Green, 1, NPosition, NLaps, NPlayersInfo),
													placeObjectOnBoard(XBoard, NBoard, '-', 4, 12),
												write('Computer used Action Five'), nl;
								botPlay(PlayersInfo, NPlayersInfo, Board, NBoard)
								);
				botPickFlower(Purple, Red, Blue, Yellow, White, Green, Pick),
				botPickCoords(Row, Column, 0, Board),
				(
				Pick = 0 -> placeObjectOnBoard(Board, XBoard, '$', Column, Row),
							getScore(XBoard, '$', Row, Column, Score),
							write('Computer placed a $ flower on '), write(Column), write(':'), write(Row), nl,
							write('Computer scored '), write(Score), write(' points this turn.'), nl,
							updatePosition(2, Position, Laps, Score, NPosition, NLaps, XBoard, NBoard, 0, 0),
							NPurple is Purple - 1,
							updatePlayersInfo(2, PlayersInfo, 2, NPurple, Red, Blue, Yellow, White, Green, Action, NPosition, NLaps, NPlayersInfo);
				Pick = 1 -> placeObjectOnBoard(Board, XBoard, '&', Row, Column),
							getScore(XBoard, '&', Row, Column, Score),
							write('Computer placed a & flower on '), write(Column), write(':'), write(Row), nl,
							write('Computer scored '), write(Score), write(' points this turn.'), nl,
							updatePosition(2, Position, Laps, Score, NPosition, NLaps, XBoard, NBoard, 0, 0),
							NRed is Red - 1,
							updatePlayersInfo(2, PlayersInfo, 2, Purple, NRed, Blue, Yellow, White, Green, Action, NPosition, NLaps, NPlayersInfo);
				Pick = 2 -> placeObjectOnBoard(Board, XBoard, '#', Row, Column),
							getScore(XBoard, '#', Row, Column, Score),
							write('Computer placed a # flower on '), write(Column), write(':'), write(Row), nl,
							write('Computer scored '), write(Score), write(' points this turn.'), nl,
							updatePosition(2, Position, Laps, Score, NPosition, NLaps, XBoard, NBoard, 0, 0),
							NBlue is Blue - 1,
							updatePlayersInfo(2, PlayersInfo, 2, Purple, Red, NBlue, Yellow, White, Green, Action, NPosition, NLaps, NPlayersInfo);
				Pick = 3 -> placeObjectOnBoard(Board, XBoard, '*', Row, Column),
							getScore(XBoard, '*', Row, Column, Score),
							write('Computer placed a * flower on '), write(Column), write(':'), write(Row), nl,
							write('Computer scored '), write(Score), write(' points this turn.'), nl,
							updatePosition(2, Position, Laps, Score, NPosition, NLaps, XBoard, NBoard, 0, 0),
							NYellow is Yellow - 1,
							updatePlayersInfo(2, PlayersInfo, 2, Purple, Red, Blue, NYellow, White, Green, Action, NPosition, NLaps, NPlayersInfo);
				Pick = 4 -> placeObjectOnBoard(Board, XBoard, '+', Row, Column),
							getScore(XBoard, '+', Row, Column, Score),
							write('Computer placed a + flower on '), write(Column), write(':'), write(Row), nl,
							write('Computer scored '), write(Score), write(' points this turn.'), nl,
							updatePosition(2, Position, Laps, Score, NPosition, NLaps, XBoard, NBoard, 0, 0),
							NWhite is White - 1,
							updatePlayersInfo(2, PlayersInfo, 2, Purple, Red, Blue, Yellow, NWhite, Green, Action, NPosition, NLaps, NPlayersInfo);
				Pick = 5 -> placeObjectOnBoard(Board, XBoard, '@', Row, Column),
							getScore(XBoard, '@', Row, Column, Score),
							write('Computer placed a @ flower on '), write(Column), write(':'), write(Row), nl,
							write('Computer scored '), write(Score), write(' points this turn.'), nl,
							updatePosition(2, Position, Laps, Score, NPosition, NLaps, XBoard, NBoard, 0, 0),
							NGreen is Green - 1,
							updatePlayersInfo(2, PlayersInfo, 2, Purple, Red, Blue, Yellow, White, NGreen, Action, NPosition, NLaps, NPlayersInfo)
				));
	Action = 2 ->
				botPickFlower(Purple, Red, Blue, Yellow, White, Green, Pick),
				botPickCoords(Row, Column, 0, Board),
				(
				Pick = 0 -> placeObjectOnBoard(Board, XBoard, '$', Row, Column),
							getScore(XBoard, '$', Row, Column, Score),
							write('Computer placed a $ flower on '), write(Column), write(':'), write(Row), nl,
							write('Computer scored '), write(Score), write(' points this turn.'), nl,
							updatePosition(2, Position, Laps, Score, NPosition, NLaps, XBoard, NBoard, 0, 0),
							NPurple is Purple - 1,
							updatePlayersInfo(2, PlayersInfo, 2, NPurple, Red, Blue, Yellow, White, Green, Action, NPosition, NLaps, NPlayersInfo);
				Pick = 1 -> placeObjectOnBoard(Board, XBoard, '&', Row, Column),
							getScore(XBoard, '&', Row, Column, Score),
							write('Computer placed a & flower on '), write(Column), write(':'), write(Row), nl,
							write('Computer scored '), write(Score), write(' points this turn.'), nl,
							updatePosition(2, Position, Laps, Score, NPosition, NLaps, XBoard, NBoard, 0, 0),
							NRed is Red - 1,
							updatePlayersInfo(2, PlayersInfo, 2, Purple, NRed, Blue, Yellow, White, Green, Action, NPosition, NLaps, NPlayersInfo);
				Pick = 2 -> placeObjectOnBoard(Board, XBoard, '#', Row, Column),
							getScore(XBoard, '#', Row, Column, Score),
							write('Computer placed a # flower on '), write(Column), write(':'), write(Row), nl,
							write('Computer scored '), write(Score), write(' points this turn.'), nl,
							updatePosition(2, Position, Laps, Score, NPosition, NLaps, XBoard, NBoard, 0, 0),
							NBlue is Blue - 1,
							updatePlayersInfo(2, PlayersInfo, 2, Purple, Red, NBlue, Yellow, White, Green, Action, NPosition, NLaps, NPlayersInfo);
				Pick = 3 -> placeObjectOnBoard(Board, XBoard, '*', Row, Column),
							getScore(XBoard, '*', Row, Column, Score),
							write('Computer placed a * flower on '), write(Column), write(':'), write(Row), nl,
							write('Computer scored '), write(Score), write(' points this turn.'), nl,
							updatePosition(2, Position, Laps, Score, NPosition, NLaps, XBoard, NBoard, 0, 0),
							NYellow is Yellow - 1,
							updatePlayersInfo(2, PlayersInfo, 2, Purple, Red, Blue, NYellow, White, Green, Action, NPosition, NLaps, NPlayersInfo);
				Pick = 4 -> placeObjectOnBoard(Board, XBoard, '+', Row, Column),
							getScore(XBoard, '+', Row, Column, Score),
							write('Computer placed a + flower on '), write(Column), write(':'), write(Row), nl,
							write('Computer scored '), write(Score), write(' points this turn.'), nl,
							updatePosition(2, Position, Laps, Score, NPosition, NLaps, XBoard, NBoard, 0, 0),
							NWhite is White - 1,
							updatePlayersInfo(2, PlayersInfo, 2, Purple, Red, Blue, Yellow, NWhite, Green, Action, NPosition, NLaps, NPlayersInfo);
				Pick = 5 -> placeObjectOnBoard(Board, XBoard, '@', Row, Column),
							getScore(XBoard, '@', Row, Column, Score),
							write('Computer placed a @ flower on '), write(Column), write(':'), write(Row), nl,
							write('Computer scored '), write(Score), write(' points this turn.'), nl,
							updatePosition(2, Position, Laps, Score, NPosition, NLaps, XBoard, NBoard, 0, 0),
							NGreen is Green - 1,
							updatePlayersInfo(2, PlayersInfo, 2, Purple, Red, Blue, Yellow, White, NGreen, Action, NPosition, NLaps, NPlayersInfo)
				)
	).
	
botPickFlower(Purple, Red, Blue, Yellow, White, Green, Pick):-
	random(0, 6, Flower),
	(
	Flower = 0 -> (
					Purple = 0 -> botPickFlower(Purple, Red, Blue, Yellow, White, Green, Pick);
					Pick is Flower
					);
	Flower = 1 -> (
					Red = 0 -> botPickFlower(Purple, Red, Blue, Yellow, White, Green, Pick);
					Pick is Flower
					);
	Flower = 2 -> (
					Blue = 0 -> botPickFlower(Purple, Red, Blue, Yellow, White, Green, Pick);
					Pick is Flower
					);
	Flower = 3 -> (
					Yellow = 0 -> botPickFlower(Purple, Red, Blue, Yellow, White, Green, Pick);
					Pick is Flower
					);
	Flower = 4 -> (
					White = 0 -> botPickFlower(Purple, Red, Blue, Yellow, White, Green, Pick);
					Pick is Flower
					);	
	Green = 0 -> botPickFlower(Purple, Red, Blue, Yellow, White, Green, Pick);
	Pick is Flower).
	
botPickCoords(Row, Column, Object, Board):-
	random(1, 10, NewCol),
	random(1, 10, NewRow),
	(
	Object = 1 -> getObjectOnBoard(Board, NewObject, NewCol, NewRow),
				(
				NewObject = '$' -> Row is NewRow, Column is NewCol;
				NewObject = '&' -> Row is NewRow, Column is NewCol;
				NewObject = '#' -> Row is NewRow, Column is NewCol;
				NewObject = '*' -> Row is NewRow, Column is NewCol;
				NewObject = '+' -> Row is NewRow, Column is NewCol;
				NewObject = '@' -> Row is NewRow, Column is NewCol;
				botPickCoords(Row, Column, Object, Board)
				);
	Object = 0 -> getObjectOnBoard(Board, NewObject, NewCol, NewRow),
				(
				NewObject = ' ' -> Row is NewRow, Column is NewCol;
				botPickCoords(Row, Column, Object, Board)
				);
	getObjectOnBoard(Board, NewObject, NewCol, NewRow),
	(
	NewObject = 'T' -> Row is NewRow, Column is NewCol;
	botPickCoords(Row, Column, Object, Board)
	)
).
	
getScore(Board, Object, Row, Col, Score):-
	Score is 1.
	
increment(Num1, Num2):-
	Num2 is Num1 + 1.
	
checkEndGame(Turn, PlayersInfo, End):-
	getPlayerInfo(PlayersInfo, Turn, Purple, Red, Blue, Yellow, White, Green, Action, Position, Laps, 0),
	(
	Purple > 0 -> End is 0;
	Red > 0 -> End is 0;
	Blue > 0 -> End is 0;
	Yellow > 0 -> End is 0;
	White > 0 -> End is 0;
	Green > 0 -> End is 0;
	End is 1
	).
	
checkWinner(Players, PlayersInfo):-
	(
	Players = 2 -> getPlayerInfo(PlayersInfo, 1, Pur1, Red1, Blu1, Yel1, Whi1, Gre1, Act1, Pos1, Lap1, 0),
				getPlayerInfo(PlayersInfo, 2, Pur2, Red2, Blu2, Yel2, Whi2, Gre2, Act2, Pos2, Lap2, 0),
				Res1 is (Lap1 * 1000 + Pos1),
				Res2 is (Lap2 * 1000 + Pos2),
				(
				Res1 > Res2 -> write('PLAYER 1 IS THE WINNER!!'), nl;
				write('PLAYER 2 IS THE WINNER!!'), nl
				);
	Players = 3 -> getPlayerInfo(PlayersInfo, 1, Pur1, Red1, Blu1, Yel1, Whi1, Gre1, Act1, Pos1, Lap1, 0),
				getPlayerInfo(PlayersInfo, 2, Pur2, Red2, Blu2, Yel2, Whi2, Gre2, Act2, Pos2, Lap2, 0),
				getPlayerInfo(PlayersInfo, 3, Pur3, Red3, Blu3, Yel3, Whi3, Gre3, Act3, Pos3, Lap3, 0),
				Res1 is (Lap1 * 1000 + Pos1),
				Res2 is (Lap2 * 1000 + Pos2),
				Res3 is (Lap3 * 1000 + Pos3),
				(
				Res1 > Res2 -> (
								Res1 > Res3 -> write('PLAYER 1 IS THE WINNER!!'), nl;
								write('PLAYER 3 IS THE WINNER!!'), nl
								);
				Res2 > Res3 -> write('PLAYER 2 IS THE WINNER!!'), nl;
				write('PLAYER 3 IS THE WINNER!!'), nl
				);
				
	Players = 4 -> getPlayerInfo(PlayersInfo, 1, Pur1, Red1, Blu1, Yel1, Whi1, Gre1, Act1, Pos1, Lap1, 0),
				getPlayerInfo(PlayersInfo, 2, Pur2, Red2, Blu2, Yel2, Whi2, Gre2, Act2, Pos2, Lap2, 0),
				getPlayerInfo(PlayersInfo, 3, Pur3, Red3, Blu3, Yel3, Whi3, Gre3, Act3, Pos3, Lap3, 0),
				getPlayerInfo(PlayersInfo, 4, Pur4, Red4, Blu4, Yel4, Whi4, Gre4, Act4, Pos4, Lap4, 0),
				Res1 is (Lap1 * 1000 + Pos1),
				Res2 is (Lap2 * 1000 + Pos2),
				Res3 is (Lap3 * 1000 + Pos3),
				Res4 is (Lap4 * 1000 + Pos4),
				(
				Res1 > Res2 -> (
								Res1 > Res3 -> (
												Res1 > Res4 -> write('PLAYER 1 IS THE WINNER!!'), nl;
												write('PLAYER 4 IS THE WINNER!!'), nl
												);
								(
								Res3 > Res4 -> write('PLAYER 3 IS THE WINNER!!'), nl;
								write('PLAYER 4 IS THE WINNER!!'), nl
								)
								);
				Res2 > Res3 -> (
								Res2 > Res4 -> write('PLAYER 2 IS THE WINNER!!'), nl;
								write('PLAYER 4 IS THE WINNER!!'), nl
								);
				Res3 > Res4 -> write('PLAYER 3 IS THE WINNER!!'), nl;
				write('PLAYER 4 IS THE WINNER!!'), nl
				);
	
	Players = 5 -> getPlayerInfo(PlayersInfo, 1, Pur1, Red1, Blu1, Yel1, Whi1, Gre1, Act1, Pos1, Lap1, 0),
				getPlayerInfo(PlayersInfo, 2, Pur2, Red2, Blu2, Yel2, Whi2, Gre2, Act2, Pos2, Lap2, 0),
				getPlayerInfo(PlayersInfo, 3, Pur3, Red3, Blu3, Yel3, Whi3, Gre3, Act3, Pos3, Lap3, 0),
				getPlayerInfo(PlayersInfo, 4, Pur4, Red4, Blu4, Yel4, Whi4, Gre4, Act4, Pos4, Lap4, 0),
				getPlayerInfo(PlayersInfo, 5, Pur5, Red5, Blu5, Yel5, Whi5, Gre5, Act5, Pos5, Lap5, 0),
				Res1 is (Lap1 * 1000 + Pos1),
				Res2 is (Lap2 * 1000 + Pos2),
				Res3 is (Lap3 * 1000 + Pos3),
				Res4 is (Lap4 * 1000 + Pos4),
				Res5 is (Lap5 * 1000 + Pos5),
				(
				Res1 > Res2 -> (
								Res1 > Res3 -> (
												Res1 > Res4 -> (
																Res1 > Res5 -> write('PLAYER 1 IS THE WINNER!!'), nl;
																write('PLAYER 5 IS THE WINNER!!'), nl
																);
												Res4 > Res5 -> write('PLAYER 4 IS THE WINNER!!'), nl;
												write('PLAYER 5 IS THE WINNER!!'), nl
												);
								Res3 > Res4 -> (
												Res3 > Res5 -> write('PLAYER 3 IS THE WINNER!!'), nl;
												write('PLAYER 5 IS THE WINNER!!'), nl
												);
								Res4 > Res5 -> write('PLAYER 4 IS THE WINNER!!'), nl;
								write('PLAYER 5 IS THE WINNER!!'), nl
								);
				Res2 > Res3 -> (
								Res2 > Res4 -> (
												Res2 > Res5 -> write('PLAYER 2 IS THE WINNER!!'), nl;
												write('PLAYER 5 IS THE WINNER!!'), nl
												);
								Res4 > Res5 -> write('PLAYER 4 IS THE WINNER!!'), nl;
								write('PLAYER 5 IS THE WINNER!!'), nl
								);
				Res3 > Res4 -> (
								Res3 > Res5 -> write('PLAYER 3 IS THE WINNER!!'), nl;
								write('PLAYER 5 IS THE WINNER!!'), nl
								);
				Res4 > Res5 -> write('PLAYER 4 IS THE WINNER!!'), nl;
				write('PLAYER 5 IS THE WINNER!!'), nl
				)
	).