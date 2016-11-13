updatePosition(Player, Position, Laps, Score, NPosition, NLaps, Board, NBoard, Counter, TrueCount):-
	NTrueCount is TrueCount + 1,
	getPositionCoords(Position, OldRow, OldCol, OldObject),
	(
	Score > 0 ->(
				Player = 1 -> PlayerObject = 'A';
				Player = 2 -> PlayerObject = 'B';
				Player = 3 -> PlayerObject = 'C';
				Player = 4 -> PlayerObject = 'D';
				PlayerObject = 'E'
				),
				(
				Counter = Score -> XPosition is Position + TrueCount,
								(
								XPosition > 39 -> NPosition is NPosition - 40,
												NLaps is Laps + 1;
								NewPosition is XPosition,
								NLaps is Laps
								),
								getPositionCoords(NewPosition, NewRow, NewCol, NewObject),
								placeObjectOnBoard(Board, XBoard, PlayerObject, NewCol, NewRow),
								placeObjectOnBoard(XBoard, NBoard, OldObject, OldCol, OldRow),
								NPosition is NewPosition;
				Counter < Score ->	XPosition is Position + NTrueCount,
								(
								XPosition > 39 -> YPosition is XPosition - 40,
												YLaps is Laps + 1;
								YPosition is XPosition,
								YLaps is Laps
								),
								getPositionCoords(YPosition, NewRow, NewCol, Obj),
								getObjectOnBoard(Board, Object, NewCol, NewRow),
								write(Object), nl,
								(
								Object = '1' -> NCounter is Counter + 1,
												updatePosition(Player, Position, YLaps, Score, NPosition, NLaps, Board, NBoard, NCounter, NTrueCount);
								Object = '2' -> NCounter is Counter + 1,
												updatePosition(Player, Position, YLaps, Score, NPosition, NLaps, Board, NBoard, NCounter, NTrueCount);
								Object = '3' -> NCounter is Counter + 1,
												updatePosition(Player, Position, YLaps, Score, NPosition, NLaps, Board, NBoard, NCounter, NTrueCount);
								Object = '4' -> NCounter is Counter + 1,
												updatePosition(Player, Position, YLaps, Score, NPosition, NLaps, Board, NBoard, NCounter, NTrueCount);
								Object = '5' -> NCounter is Counter + 1,
												updatePosition(Player, Position, YLaps, Score, NPosition, NLaps, Board, NBoard, NCounter, NTrueCount);
								Object = '6' -> NCounter is Counter + 1,
												updatePosition(Player, Position, YLaps, Score, NPosition, NLaps, Board, NBoard, NCounter, NTrueCount);
								Object = '7' -> NCounter is Counter + 1,
												updatePosition(Player, Position, YLaps, Score, NPosition, NLaps, Board, NBoard, NCounter, NTrueCount);
								Object = '8' -> NCounter is Counter + 1,
												updatePosition(Player, Position, YLaps, Score, NPosition, NLaps, Board, NBoard, NCounter, NTrueCount);
								Object = '9' -> NCounter is Counter + 1,
												updatePosition(Player, Position, YLaps, Score, NPosition, NLaps, Board, NBoard, NCounter, NTrueCount);
								Object = '0' -> NCounter is Counter + 1,
												updatePosition(Player, Position, YLaps, Score, NPosition, NLaps, Board, NBoard, NCounter, NTrueCount);
								updatePosition(Player, Position, YLaps, Score, NPosition, NLaps, Board, NBoard, Counter, NTrueCount)
							);
					write('Error.')
					);
	Score = 0 -> write('Score is 0'), nl
	).
	
getPositionCoords(Position, Row, Column, Object):-
	(
	Position < 10 -> Column is 10,
					Row is Position,
					(
					Position = 0 -> Object = '0';
					Position = 1 -> Object = '1';
					Position = 2 -> Object = '2';
					Position = 3 -> Object = '3';
					Position = 4 -> Object = '4';
					Position = 5 -> Object = '5';
					Position = 6 -> Object = '6';
					Position = 7 -> Object = '7';
					Position = 8 -> Object = '8';
					Object = '9'
					);
	Position > 29 -> Row is 0,
					Column is Position - 30,
					(
					Position = 30 -> Object = '0';
					Position = 31 -> Object = '1';
					Position = 32 -> Object = '2';
					Position = 33 -> Object = '3';
					Position = 34 -> Object = '4';
					Position = 35 -> Object = '5';
					Position = 36 -> Object = '6';
					Position = 37 -> Object = '7';
					Position = 38 -> Object = '8';
					Object = '9'
					);
	Position > 19 -> Column is 0,
					Helper is Position - 20,
					Row is 10 - Helper,
					(
					Position = 20 -> Object = '0';
					Position = 21 -> Object = '9';
					Position = 22 -> Object = '8';
					Position = 23 -> Object = '7';
					Position = 24 -> Object = '6';
					Position = 25 -> Object = '5';
					Position = 26 -> Object = '4';
					Position = 27 -> Object = '3';
					Position = 28 -> Object = '2';
					Object = '1'
					);
	Position < 20 -> Row is 10,
					Helper is Position - 10,
					Column is 10 - Helper,
					(
					Position = 10 -> Object = '0';
					Position = 11 -> Object = '9';
					Position = 12 -> Object = '8';
					Position = 13 -> Object = '7';
					Position = 14 -> Object = '6';
					Position = 15 -> Object = '5';
					Position = 16 -> Object = '4';
					Position = 17 -> Object = '3';
					Position = 18 -> Object = '2';
					Object = '9'
					);
	write('Error. Position not accepted.')
	).

updatePlayersInfo(Players, PlayersInfo, Turn, Purple, Red, Blue, Yellow, White, Green, Action, Position, Lap, NPlayersInfo):-
	(
	Players = 2 -> NPlayersInfo = [Player1Info, Player2Info],
				(
				Turn = 1 -> getPlayerInfo(PlayersInfo, 2, P2, R2, B2, Y2, W2, G2, Act2, Pos2, Lap2, 0),
							Player2Info = [P2, R2, B2, Y2, W2, G2, Act2, Pos2, Lap2],
							Player1Info = [Purple, Red, Blue, Yellow, White, Green, Action, Position, Lap];
				getPlayerInfo(PlayersInfo, 1, P1, R1, B1, Y1, W1, G1, Act1, Pos1, Lap1, 0),
				Player1Info = [P1, R1, B1, Y1, W1, G1, Act1, Pos1, Lap1],
				Player2Info = [Purple, Red, Blue, Yellow, White, Green, Action, Position, Lap]
				);
	Players = 3 -> NPlayersInfo = [Player1Info, Player2Info, Player3Info],
				(
				Turn = 1 -> getPlayerInfo(PlayersInfo, 2, P2, R2, B2, Y2, W2, G2, Act2, Pos2, Lap2, 0),
							getPlayerInfo(PlayersInfo, 3, P3, R3, B3, Y3, W3, G3, Act3, Pos3, Lap3, 0),
							Player1Info = [Purple, Red, Blue, Yellow, White, Green, Action, Position, Lap],
							Player2Info = [P2, R2, B2, Y2, W2, G2, Act2, Pos2, Lap2],
							Player3Info = [P3, R3, B3, Y3, W3, G3, Act3, Pos3, Lap3];
				Turn = 2 -> getPlayerInfo(PlayersInfo, 1, P1, R1, B1, Y1, W1, G1, Act1, Pos1, Lap1, 0),
							getPlayerInfo(PlayersInfo, 3, P3, R3, B3, Y3, W3, G3, Act3, Pos3, Lap3, 0),
							Player1Info = [P1, R1, B1, Y1, W1, G1, Act1, Pos1, Lap1],
							Player2Info = [Purple, Red, Blue, Yellow, White, Green, Action, Position, Lap],
							Player3Info = [P3, R3, B3, Y3, W3, G3, Act3, Pos3, Lap3];
				getPlayerInfo(PlayersInfo, 1, P1, R1, B1, Y1, W1, G1, Act1, Pos1, Lap1, 0),
				getPlayerInfo(PlayersInfo, 2, P2, R2, B2, Y2, W2, G2, Act2, Pos2, Lap2, 0),
				Player1Info = [P1, R1, B1, Y1, W1, G1, Act1, Pos1, Lap1],
				Player2Info = [P2, R2, B2, Y2, W2, G2, Act2, Pos2, Lap2],
				Player3Info = [Purple, Red, Blue, Yellow, White, Green, Action, Position, Lap]
				);	
	Players = 4 -> NPlayersInfo = [Player1Info, Player2Info, Player3Info, Player4Info],
				(
				Turn = 1 -> getPlayerInfo(PlayersInfo, 2, P2, R2, B2, Y2, W2, G2, Act2, Pos2, Lap2, 0),
							getPlayerInfo(PlayersInfo, 3, P3, R3, B3, Y3, W3, G3, Act3, Pos3, Lap3, 0),
							getPlayerInfo(PlayersInfo, 4, P4, R4, B4, Y4, W4, G4, Act4, Pos4, Lap4, 0),
							Player1Info = [Purple, Red, Blue, Yellow, White, Green, Action, Position, Lap],
							Player2Info = [P2, R2, B2, Y2, W2, G2, Act2, Pos2, Lap2],
							Player3Info = [P3, R3, B3, Y3, W3, G3, Act3, Pos3, Lap3],
							Player4Info = [P4, R4, B4, Y4, W4, G4, Act4, Pos4, Lap4];
				Turn = 2 -> getPlayerInfo(PlayersInfo, 1, P1, R1, B1, Y1, W1, G1, Act1, Pos1, Lap1, 0),
							getPlayerInfo(PlayersInfo, 3, P3, R3, B3, Y3, W3, G3, Act3, Pos3, Lap3, 0),
							getPlayerInfo(PlayersInfo, 4, P4, R4, B4, Y4, W4, G4, Act4, Pos4, Lap4, 0),
							Player1Info = [P1, R1, B1, Y1, W1, G1, Act1, Pos1, Lap1],
							Player2Info = [Purple, Red, Blue, Yellow, White, Green, Action, Position, Lap],
							Player3Info = [P3, R3, B3, Y3, W3, G3, Act3, Pos3, Lap3],
							Player4Info = [P4, R4, B4, Y4, W4, G4, Act4, Pos4, Lap4];
				Turn = 3 -> getPlayerInfo(PlayersInfo, 1, P1, R1, B1, Y1, W1, G1, Act1, Pos1, Lap1, 0),
							getPlayerInfo(PlayersInfo, 2, P2, R2, B2, Y2, W2, G2, Act2, Pos2, Lap2, 0),
							getPlayerInfo(PlayersInfo, 4, P4, R4, B4, Y4, W4, G4, Act4, Pos4, Lap4, 0),
							Player1Info = [P1, R1, B1, Y1, W1, G1, Act1, Pos1, Lap1],
							Player2Info = [P2, R2, B2, Y2, W2, G2, Act2, Pos2, Lap2],
							Player3Info = [Purple, Red, Blue, Yellow, White, Green, Action, Position, Lap],
							Player4Info = [P4, R4, B4, Y4, W4, G4, Act4, Pos4, Lap4];
				getPlayerInfo(PlayersInfo, 1, P1, R1, B1, Y1, W1, G1, Act1, Pos1, Lap1, 0),
				getPlayerInfo(PlayersInfo, 2, P2, R2, B2, Y2, W2, G2, Act2, Pos2, Lap2, 0),
				getPlayerInfo(PlayersInfo, 3, P3, R3, B3, Y3, W3, G3, Act3, Pos3, Lap3, 0),
				Player1Info = [P1, R1, B1, Y1, W1, G1, Act1, Pos1, Lap1],
				Player2Info = [P2, R2, B2, Y2, W2, G2, Act2, Pos2, Lap2],
				Player3Info = [P3, R3, B3, Y3, W3, G3, Act3, Pos3, Lap3],
				Player4Info = [Purple, Red, Blue, Yellow, White, Green, Action, Position, Lap]
				);	
	Players = 5 -> NPlayersInfo = [Player1Info, Player2Info, Player3Info, Player4Info, Player5Info],
				(
				Turn = 1 -> getPlayerInfo(PlayersInfo, 2, P2, R2, B2, Y2, W2, G2, Act2, Pos2, Lap2, 0),
							getPlayerInfo(PlayersInfo, 3, P3, R3, B3, Y3, W3, G3, Act3, Pos3, Lap3, 0),
							getPlayerInfo(PlayersInfo, 4, P4, R4, B4, Y4, W4, G4, Act4, Pos4, Lap4, 0),
							getPlayerInfo(PlayersInfo, 5, P5, R5, B5, Y5, W5, G5, Act5, Pos5, Lap5, 0),
							Player1Info = [Purple, Red, Blue, Yellow, White, Green, Action, Position, Lap],
							Player2Info = [P2, R2, B2, Y2, W2, G2, Act2, Pos2, Lap2],
							Player3Info = [P3, R3, B3, Y3, W3, G3, Act3, Pos3, Lap3],
							Player4Info = [P4, R4, B4, Y4, W4, G4, Act4, Pos4, Lap4],
							Player5Info = [P5, R5, B5, Y5, W5, G5, Act5, Pos5, Lap5];
				Turn = 2 -> getPlayerInfo(PlayersInfo, 1, P1, R1, B1, Y1, W1, G1, Act1, Pos1, Lap1, 0),
							getPlayerInfo(PlayersInfo, 3, P3, R3, B3, Y3, W3, G3, Act3, Pos3, Lap3, 0),
							getPlayerInfo(PlayersInfo, 4, P4, R4, B4, Y4, W4, G4, Act4, Pos4, Lap4, 0),
							getPlayerInfo(PlayersInfo, 5, P5, R5, B5, Y5, W5, G5, Act5, Pos5, Lap5, 0),
							Player1Info = [P1, R1, B1, Y1, W1, G1, Act1, Pos1, Lap1],
							Player2Info = [Purple, Red, Blue, Yellow, White, Green, Action, Position, Lap],
							Player3Info = [P3, R3, B3, Y3, W3, G3, Act3, Pos3, Lap3],
							Player4Info = [P4, R4, B4, Y4, W4, G4, Act4, Pos4, Lap4],
							Player5Info = [P5, R5, B5, Y5, W5, G5, Act5, Pos5, Lap5];
				Turn = 3 -> getPlayerInfo(PlayersInfo, 1, P1, R1, B1, Y1, W1, G1, Act1, Pos1, Lap1, 0),
							getPlayerInfo(PlayersInfo, 2, P2, R2, B2, Y2, W2, G2, Act2, Pos2, Lap2, 0),
							getPlayerInfo(PlayersInfo, 4, P4, R4, B4, Y4, W4, G4, Act4, Pos4, Lap4, 0),
							getPlayerInfo(PlayersInfo, 5, P5, R5, B5, Y5, W5, G5, Act5, Pos5, Lap5, 0),
							Player1Info = [P1, R1, B1, Y1, W1, G1, Act1, Pos1, Lap1],
							Player2Info = [P2, R2, B2, Y2, W2, G2, Act2, Pos2, Lap2],
							Player3Info = [Purple, Red, Blue, Yellow, White, Green, Action, Position, Lap],
							Player4Info = [P4, R4, B4, Y4, W4, G4, Act4, Pos4, Lap4],
							Player5Info = [P5, R5, B5, Y5, W5, G5, Act5, Pos5, Lap5];
				Turn = 4 -> getPlayerInfo(PlayersInfo, 1, P1, R1, B1, Y1, W1, G1, Act1, Pos1, Lap1, 0),
							getPlayerInfo(PlayersInfo, 2, P2, R2, B2, Y2, W2, G2, Act2, Pos2, Lap2, 0),
							getPlayerInfo(PlayersInfo, 3, P3, R3, B3, Y3, W3, G3, Act3, Pos3, Lap3, 0),
							getPlayerInfo(PlayersInfo, 5, P5, R5, B5, Y5, W5, G5, Act5, Pos5, Lap5, 0),
							Player1Info = [P1, R1, B1, Y1, W1, G1, Act1, Pos1, Lap1],
							Player2Info = [P2, R2, B2, Y2, W2, G2, Act2, Pos2, Lap2],
							Player3Info = [P3, R3, B3, Y3, W3, G3, Act3, Pos3, Lap3],
							Player4Info = [Purple, Red, Blue, Yellow, White, Green, Action, Position, Lap],
							Player5Info = [P5, R5, B5, Y5, W5, G5, Act5, Pos5, Lap5];
				getPlayerInfo(PlayersInfo, 1, P1, R1, B1, Y1, W1, G1, Act1, Pos1, Lap1, 0),
				getPlayerInfo(PlayersInfo, 2, P2, R2, B2, Y2, W2, G2, Act2, Pos2, Lap2, 0),
				getPlayerInfo(PlayersInfo, 3, P3, R3, B3, Y3, W3, G3, Act3, Pos3, Lap3, 0),
				getPlayerInfo(PlayersInfo, 4, P4, R4, B4, Y4, W4, G4, Act4, Pos4, Lap4, 0),
				Player1Info = [P1, R1, B1, Y1, W1, G1, Act1, Pos1, Lap1],
				Player2Info = [P2, R2, B2, Y2, W2, G2, Act2, Pos2, Lap2],
				Player3Info = [P3, R3, B3, Y3, W3, G3, Act3, Pos3, Lap3],
				Player4Info = [P4, R4, B4, Y4, W4, G4, Act4, Pos4, Lap4],
				Player5Info = [Purple, Red, Blue, Yellow, White, Green, Action, Position, Lap]
				);
	write('Error updating info.')
	).