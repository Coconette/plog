:- use_module(library(random)).
:- include('gameMenu.pl').
:- include('boardManager.pl').


gardens:-
	initialMenu.

initGame(Players, Game):-
	printStartGameInfo(Players),
	initialBoard(Board),
	generatePlayersInfo(Players, PlayersInfo),
	Game = [Players, 1, Board, PlayersInfo],
	printPlayerFlowers(PlayersInfo, 1, 0),
	printPlayerFlowers(PlayersInfo, 2, 0),
	write('done'), nl, !.
	
generatePlayersInfo(Players, PlayersInfo):-
	Players = 2 -> PlayersInfo = [
							[Pur1, Red1, Blu1, Yel1, Whi1, Gre1, 0, 0, 0],
							[Pur2, Red2, Blu2, Yel2, Whi2, Gre2, 0, 0, 0]],
					randomizePlayerFlowers(27, 0, Pur1, Red1, Blu1, Yel1, Whi1, Gre1, 0, 0, 0, 0, 0, 0),
					randomizePlayerFlowers(27, 0, Pur2, Red2, Blu2, Yel2, Whi2, Gre2, 0, 0, 0, 0, 0, 0),
					write('Flowers Randomly Generated For All Players'), nl;
	Players = 3 -> PlayersInfo = [
							[Pur1, Red1, Blu1, Yel1, Whi1, Gre1, 0, 0, 0],
							[Pur2, Red2, Blu2, Yel2, Whi2, Gre2, 0, 0, 0],
							[Pur3, Red3, Blu3, Yel3, Whi3, Gre3, 0, 0, 0]],
					randomizePlayerFlowers(18, 0, Pur1, Red1, Blu1, Yel1, Whi1, Gre1, 0, 0, 0, 0, 0, 0),
					randomizePlayerFlowers(18, 0, Pur2, Red2, Blu2, Yel2, Whi2, Gre2, 0, 0, 0, 0, 0, 0),
					randomizePlayerFlowers(18, 0, Pur3, Red3, Blu3, Yel3, Whi3, Gre3, 0, 0, 0, 0, 0, 0),
					write('Flowers Randomly Generated For All Players'), nl;
	Players = 4 -> PlayersInfo = [
							[Pur1, Red1, Blu1, Yel1, Whi1, Gre1, 0, 0, 0],
							[Pur2, Red2, Blu2, Yel2, Whi2, Gre2, 0, 0, 0],
							[Pur3, Red3, Blu3, Yel3, Whi3, Gre3, 0, 0, 0],
							[Pur4, Red4, Blu4, Yel4, Whi4, Gre4, 0, 0, 0]],
					randomizePlayerFlowers(14, 0, Pur1, Red1, Blu1, Yel1, Whi1, Gre1, 0, 0, 0, 0, 0, 0),
					randomizePlayerFlowers(14, 0, Pur2, Red2, Blu2, Yel2, Whi2, Gre2, 0, 0, 0, 0, 0, 0),
					randomizePlayerFlowers(14, 0, Pur3, Red3, Blu3, Yel3, Whi3, Gre3, 0, 0, 0, 0, 0, 0),
					randomizePlayerFlowers(14, 0, Pur4, Red4, Blu4, Yel4, Whi4, Gre4, 0, 0, 0, 0, 0, 0),
					write('Flowers Randomly Generated For All Players'), nl;
	Players = 3 -> PlayersInfo = [
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
					write('Flowers Randomly Generated For All Players'), nl;
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
	
printPlayerFlowers([Head | Tail], Player, Count):-
	NCount is Count + 1,
	(
	NCount = Player -> getFlowers(Head, Purple, Red, Blue, Yellow, White, Green, 0),
						write('Player '), write(Player), write('s flowers:'), nl,
						write('Purple: '), write(Purple), nl,
						write('Red: '), write(Red), nl,
						write('Blue: '), write(Blue), nl,
						write('Yellow: '), write(Yellow), nl,
						write('White: '), write(White), nl,
						write('Green: '), write(Green), nl;
	printPlayerFlowers(Tail, Player, NCount)
	).

getFlowers([Head | Tail], Purple, Red, Blue, Yellow, White, Green, Count):-
	NCount is Count + 1,
	(
	NCount = 1 -> Purple is Head,
					getFlowers(Tail, Purple, Red, Blue, Yellow, White, Green, NCount);
	NCount = 2 -> Red is Head,
					getFlowers(Tail, Purple, Red, Blue, Yellow, White, Green, NCount);
	NCount = 3 -> Blue is Head,
					getFlowers(Tail, Purple, Red, Blue, Yellow, White, Green, NCount);
	NCount = 4 -> Yellow is Head,
					getFlowers(Tail, Purple, Red, Blue, Yellow, White, Green, NCount);
	NCount = 5 -> White is Head,
					getFlowers(Tail, Purple, Red, Blue, Yellow, White, Green, NCount);
	NCount = 6 -> Green is Head;
	write('Error getting player flowers!'), nl
	).