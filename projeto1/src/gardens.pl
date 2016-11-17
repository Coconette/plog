:- use_module(library(random)).
:- include('gameMenu.pl').
:- include('boardManager.pl').
:- include('update.pl').
:- include('actions.pl').
	
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
					randomizePlayerFlowers(3, 0, Pur1, Red1, Blu1, Yel1, Whi1, Gre1, 0, 0, 0, 0, 0, 0),
					randomizePlayerFlowers(3, 0, Pur2, Red2, Blu2, Yel2, Whi2, Gre2, 0, 0, 0, 0, 0, 0),
					randomizePlayerFlowers(3, 0, Pur3, Red3, Blu3, Yel3, Whi3, Gre3, 0, 0, 0, 0, 0, 0),
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
	
getScore(Board, Object, Row, Col, Score):-
	Score is 1.
	
increment(Num1, Num2):-
	Num2 is Num1 + 1.
	
checkEndGame(Turn, PlayersInfo, End):-
	getPlayerInfo(PlayersInfo, Turn, Purple, Red, Blue, Yellow, White, Green, Action, Position, Laps, 0),
	write('VERIFICACAO'), nl,
	write('player: '), write(Turn),
	write('1. Purple: "$" ('), write(Purple), write(' remaining)'), nl,
	write('2. Red: "&" ('), write(Red), write(' remaining)'), nl,
	write('3. Blue: "#" ('), write(Blue), write(' remaining)'), nl,
	write('4. Yellow: "*" ('), write(Yellow), write(' remaining)'), nl,
	write('5. White: "+" ('), write(White), write(' remaining)'), nl,
	write('6. Green: "@" ('), write(Green), write(' remaining)'), nl,
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
				(
				Lap1 > Lap2 -> write('PLAYER 1 IS THE WINNER!!'), nl;
				Lap1 < Lap2 -> write('PLAYER 2 IS THE WINNER!!'), nl;
				Pos1 > Pos2 -> write('PLAYER 1 IS THE WINNER!!'), nl;
				write('PLAYER 2 IS THE WINNER!!'), nl
				);
	Players = 3 -> getPlayerInfo(PlayersInfo, 1, Pur1, Red1, Blu1, Yel1, Whi1, Gre1, Act1, Pos1, Lap1, 0),
				getPlayerInfo(PlayersInfo, 2, Pur2, Red2, Blu2, Yel2, Whi2, Gre2, Act2, Pos2, Lap2, 0),
				getPlayerInfo(PlayersInfo, 2, Pur3, Red3, Blu3, Yel3, Whi3, Gre3, Act3, Pos3, Lap3, 0),
				(
				Lap1 > Lap2 -> (
								Lap1 > Lap3 -> write('PLAYER 1 IS THE WINNER!!'), nl;
								Lap3 > Lap1 -> write('PLAYER 3 IS THE WINNER!!'), nl;
								Pos1 > Pos3 -> write('PLAYER 1 IS THE WINNER!!'), nl;
								write('PLAYER 3 IS THE WINNER!!'), nl;
								);
				Lap2 > Lap1 -> (
								Lap2 > Lap3 -> write('PLAYER 2 IS THE WINNER!!'), nl;
								Lap3 > Lap2 -> write('PLAYER 3 IS THE WINNER!!'), nl;
								Pos2 > Pos3 -> write('PLAYER 2 IS THE WINNER!!'), nl;
								write('PLAYER 3 IS THE WINNER!!'), nl; 
								)
				Lap3 > Lap1 -> write('PLAYER 3 IS THE WINNER!!'), nl;
				
				)
	)